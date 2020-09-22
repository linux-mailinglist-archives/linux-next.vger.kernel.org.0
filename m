Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8A0273DCD
	for <lists+linux-next@lfdr.de>; Tue, 22 Sep 2020 10:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIVIyi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Sep 2020 04:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgIVIyi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2020 04:54:38 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507BEC061755;
        Tue, 22 Sep 2020 01:54:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BwZqt217Wz9sS8;
        Tue, 22 Sep 2020 18:54:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600764875;
        bh=pqiHuE+/p5e1RTN5422hw1dR9KckX9+PEcZG+c5Jg8c=;
        h=Date:From:To:Cc:Subject:From;
        b=I3okOOaYXLzG/toNL6q+TYe/57n0afqYGZYQ+vTY78wu0+7LpEGkxek2hnKZUme5c
         gbN7THtkQjK4S+IfixtWaBWDqd5wOX8bReI88Gylcw2iOm7o9NmFNF/sJtD3DNz8wr
         UmhtMPdzyQ9Jo912+hcIXiowtXU/rIR+hwtAGXPEShC4Z6Zrq7zokQZHK5FUrC2swN
         1zAa0szwE3ReGTN1Bw23oQVGAaodCn8xIX9mNMIm/x1b4aRl4kftheiYzSBvbNvxQT
         xKdVa8cqYXtTMqI5pBdncI38Kkm1oFyOqxZC/5vHvxWaW/j5dEjJ/5/txioOD5uTn+
         Jc3zvWzpWdVFg==
Date:   Tue, 22 Sep 2020 18:54:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian@brauner.io>
Cc:     Minchan Kim <minchan@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Rientjes <rientjes@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Message-ID: <20200922185433.62eafe4c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lE.8lsnWgmtAeriroXtV+XH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lE.8lsnWgmtAeriroXtV+XH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/exit.c

between commit:

  ba7d25f3dff6 ("exit: support non-blocking pidfds")

from the pidfd tree and patch:

  "pid: move pidfd_get_pid() to pid.c"

from the akpm-current tree.

I fixed it up (I made the changes from the former to kernel/pid.c - see
below) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

I also had to add the following fix patch after

  "mm/madvise: introduce process_madvise() syscall: an external memory hint=
ing API"

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 22 Sep 2020 18:36:35 +1000
Subject: [PATCH] fix up for pidfd_get_pid() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/madvise.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index a0ebeb5e2411..51317bd3c69d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1189,11 +1189,12 @@ static ssize_t do_process_madvise(int pidfd, struct=
 iov_iter *iter,
 	struct task_struct *task;
 	struct mm_struct *mm;
 	size_t total_len =3D iov_iter_count(iter);
+	unsigned int pidfd_flags;
=20
 	if (flags !=3D 0)
 		return -EINVAL;
=20
-	pid =3D pidfd_get_pid(pidfd);
+	pid =3D pidfd_get_pid(pidfd, &pidfd_flags);
 	if (IS_ERR(pid))
 		return PTR_ERR(pid);
=20
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

diff --git a/include/linux/pid.h b/include/linux/pid.h
index 176d6cf80e7c..fa10acb8d6a4 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -77,7 +77,7 @@ extern const struct file_operations pidfd_fops;
 struct file;
=20
 extern struct pid *pidfd_pid(const struct file *file);
-struct pid *pidfd_get_pid(unsigned int fd);
+struct pid *pidfd_get_pid(unsigned int fd, unsigned int *flags);
=20
 static inline struct pid *get_pid(struct pid *pid)
 {
diff --git a/kernel/pid.c b/kernel/pid.c
index c791fe63fa36..47466d0bbc5b 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -520,7 +520,7 @@ struct pid *find_ge_pid(int nr, struct pid_namespace *n=
s)
 	return idr_get_next(&ns->idr, &nr);
 }
=20
-struct pid *pidfd_get_pid(unsigned int fd)
+struct pid *pidfd_get_pid(unsigned int fd, unsigned int *flags)
 {
 	struct fd f;
 	struct pid *pid;
@@ -530,8 +530,10 @@ struct pid *pidfd_get_pid(unsigned int fd)
 		return ERR_PTR(-EBADF);
=20
 	pid =3D pidfd_pid(f.file);
-	if (!IS_ERR(pid))
+	if (!IS_ERR(pid)) {
 		get_pid(pid);
+		*flags =3D f.file->f_flags;
+	}
=20
 	fdput(f);
 	return pid;

--Sig_/lE.8lsnWgmtAeriroXtV+XH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9pu8kACgkQAVBC80lX
0Gx4sQf+NFW8HcJdvvomweVUMeacS0KZw2s9GONociNxULMqeuTK08rJ+wd2eN6T
VNCSt9fDFR03W7Udkux/WuTGb96KQLQhLRVAjdx74LjIohlJCI6xfUvF/+eNT4NS
rKVsvajRCdeYCnqoDiRBSGWE2Tf7lSb5yBSTeIgAHY7h8yAIE6F12wzxSmbsbUSK
dS7P7gXAva6AKV0dGANFk3I+OQhCdWGN0F/oXBA0ixDNs6f9864MQXx+9Dm6F588
4pOVr/mmsmgF42FDqdImv7wWHni5OM/1MOe8CYvW/HI7vq4iU315OnNKVV1ABuHN
iMGN5ooqpduoLWh32xVXSFhmDFp1Ig==
=grFY
-----END PGP SIGNATURE-----

--Sig_/lE.8lsnWgmtAeriroXtV+XH--
