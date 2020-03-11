Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE1F18243B
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 22:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729669AbgCKVuV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 17:50:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:49734 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729333AbgCKVuV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 17:50:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4BCA7AAC7;
        Wed, 11 Mar 2020 21:50:19 +0000 (UTC)
From:   NeilBrown <neilb@suse.de>
To:     Jeff Layton <jlayton@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu, 12 Mar 2020 08:50:11 +1100
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] locks: restore locks_delete_lock optimization
In-Reply-To: <7d4c32b94a2ae900afa316c12047f7d79a31aaba.camel@kernel.org>
References: <20200312011809.408fd045@canb.auug.org.au> <7d4c32b94a2ae900afa316c12047f7d79a31aaba.camel@kernel.org>
Message-ID: <871rpyv9ws.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


A recent patch (see Fixes: below) removed an optimization which is
important as it avoids taking a lock in a common case.

The comment justifying the optimisation was correct as far as it went,
in that if the tests succeeded, then the values would remain stable and the
test result will remain valid even without a lock.

However after the test succeeds the lock can be freed while some other
thread might have only just set ->blocker to NULL (thus allowing the
test to succeed) but has not yet called wake_up() on the wq in the lock.
If the wake_up happens after the lock is freed, a use-after-free error occu=
rs.

This patch restores the optimization and adds sufficient locking to avoid
the use-after-free.  Rather than using the global lock - which is too
expensive - the waitq lock is used instead.  We make use of
wake_up_locked() which allows wake_up to be called while the lock is held.

Now ->blocker is set to NULL and the wq is woken all while protected by
the wq spinlock.  Before the lock is freed, ->blockers is tested for
NULL under the same spinlock.  That test must now happen before
=2D>blocker is set to NULL, or after it is safe to free the lock.

Fixes: 6d390e4b5d48 ("locks: fix a potential use-after-free problem when wa=
keup a waiter")
Signed-off-by: NeilBrown <neilb@suse.de>
=2D--
 fs/locks.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/locks.c b/fs/locks.c
index 426b55d333d5..8aa04d5ac8b3 100644
=2D-- a/fs/locks.c
+++ b/fs/locks.c
@@ -735,11 +735,13 @@ static void __locks_wake_up_blocks(struct file_lock *=
blocker)
=20
 		waiter =3D list_first_entry(&blocker->fl_blocked_requests,
 					  struct file_lock, fl_blocked_member);
+		spin_lock(&waiter->fl_wait.lock);
 		__locks_delete_block(waiter);
 		if (waiter->fl_lmops && waiter->fl_lmops->lm_notify)
 			waiter->fl_lmops->lm_notify(waiter);
 		else
=2D			wake_up(&waiter->fl_wait);
+			wake_up_locked(&waiter->fl_wait);
+		spin_unlock(&waiter->fl_wait.lock);
 	}
 }
=20
@@ -753,6 +755,31 @@ int locks_delete_block(struct file_lock *waiter)
 {
 	int status =3D -ENOENT;
=20
+	/*
+	 * If fl_blocker is NULL, it won't be set again as this thread
+	 * "owns" the lock and is the only one that might try to claim
+	 * the lock.  So it is safe to test fl_blocker locklessly.
+	 * Also if fl_blocker is NULL, this waiter is not listed on
+	 * fl_blocked_requests for some lock, so no other request can
+	 * be added to the list of fl_blocked_requests for this
+	 * request.  So if fl_blocker is NULL, it is safe to
+	 * locklessly check if fl_blocked_requests is empty.  If both
+	 * of these checks succeed, there is no need to take the lock.
+	 * However, some other thread might have only *just* set
+	 * fl_blocker to NULL and it about to send a wakeup on
+	 * fl_wait, so we mustn't return too soon or we might free waiter
+	 * before that wakeup can be sent.  So take the fl_wait.lock
+	 * to serialize with the wakeup in __locks_wake_up_blocks().
+	 */
+	if (waiter->fl_blocker =3D=3D NULL) {
+		spin_lock(&waiter->fl_wait.lock);
+		if (waiter->fl_blocker =3D=3D NULL &&
+		    list_empty(&waiter->fl_blocked_requests)) {
+			spin_unlock(&waiter->fl_wait.lock);
+			return status;
+		}
+		spin_unlock(&waiter->fl_wait.lock);
+	}
 	spin_lock(&blocked_lock_lock);
 	if (waiter->fl_blocker)
 		status =3D 0;
=2D-=20
2.25.1


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl5pXRQACgkQOeye3VZi
gbm5exAAgfluIK5IiFv8YzhV1iAJOIuqgdu1lg+3FWPzk/5Vm/XFMY4qrao+5swJ
z6mxj0lJRZbOdSID2tWvGpfByjq0PKNmcr55alLl4EePO3aO9m2fAsBqvPzvhT8V
Bi+rjesDyknUqYWTxj0RKQau414C4IsrXgi3jcHwub2Acn+FJiHGfdJ4C3ZZL5r5
ZG6gXbnp0HHQ5zAVc4tqCYdj/2C4iNt4IwtWSRFhcNwgALynaUzV1lhaO6HmdIuJ
ZAjn18Ye/AkBZmdgXUTYaL4IMQCqc4R0uJKLez+rMO/n8J+3qtNjacf4cAnKarFx
nFZ110WqotCE+p1vEYgaA19TXboII3ruf87V4Y6QHCrjTvZ1UrMHJS3PNEZHSHia
fe6UgvpN5/py/dFR8hIAVdAjlif0jI3MKAP+ZHa4hp2xUdYDKQa1t9kyOlZMbGsO
+hzYkBeyFwfg8GxBtnlKMqGDUMQi2xxBbA+Y8x7TEqOpg+cM/Dm9iLP2CrYuFPcd
jk+gkEmWFZ7dMqbTWQieXYaoQ6W0P+jk+9Xho0X/If8cRT4sKd/joGWvUEw0pLlT
/e4JRhSCTFA4vLQnmWIe3NIRYMwwXHu+Sp8TJpgKPl7xvsCrxyO/9TYcBlYMfekq
F10VwpFna3v0pTF/Kb4FVOfnbjjzvKvIvkBJTiEsq6i6KIyr6q8=
=6N8S
-----END PGP SIGNATURE-----
--=-=-=--
