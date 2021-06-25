Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6473B3E67
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 10:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhFYIYr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 04:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhFYIYq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 04:24:46 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C34BC061574;
        Fri, 25 Jun 2021 01:22:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GB93K25Dqz9sPf;
        Fri, 25 Jun 2021 18:22:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624609341;
        bh=XfPUf0UJaWJc7scMGFSQjJzUICE14CEgBK5nOTa6c2w=;
        h=Date:From:To:Cc:Subject:From;
        b=mw69xt5ehjL7agZJmZnFg2rh6dU7dFdFiFsX6KEqjfPdVDt5i2C5C9U1hrqMFvOqg
         4VCS5vtKRYqdevzmCHZFW0E1diEA2/9jFZ4C7hHtfz1j86bJ739A8yvXv/hUbdW9Q1
         K5pS4hGbqUIs4nPrElmL7u0zOO4vHdzmk95e3OJE2PEMDqSo4NzwP04a81inosUqsh
         WBxq/9dncGnZZjHGR6gQXc5+wlfoe8mbOdj7qu371tcLXuA+lJ7AhT4Bgi3Kn9oUwA
         4Se3iFbYHYOvceOmlbf+uSCP4GuXSu7O6eqCBj/dfffHZ9UM1gJxfAKkzdaPcQBvsx
         gi6LF32ZC4+Sg==
Date:   Fri, 25 Jun 2021 18:22:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Alexey Gladkov <legion@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: manual merge of the userns tree with Linus' tree
Message-ID: <20210625182219.1a2ae36e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QX=Z=kr2XP8ixxKSptgUIkq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QX=Z=kr2XP8ixxKSptgUIkq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the userns tree got a conflict in:

  kernel/signal.c

between commits:

  69995ebbb9d3 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc()")
  4bad58ebc8bc ("signal: Allow tasks to cache one sigqueue struct")
  399f8dd9a866 ("signal: Prevent sigqueue caching after task got released")

from Linus' tree and commit:

  d64696905554 ("Reimplement RLIMIT_SIGPENDING on top of ucounts")

from the userns tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/signal.c
index 782951c06660,9a6dab712123..000000000000
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@@ -408,12 -410,11 +408,12 @@@ void task_join_group_stop(struct task_s
   *   appropriate lock must be held to stop the target task from exiting
   */
  static struct sigqueue *
 -__sigqueue_alloc(int sig, struct task_struct *t, gfp_t flags, int overrid=
e_rlimit)
 +__sigqueue_alloc(int sig, struct task_struct *t, gfp_t gfp_flags,
 +		 int override_rlimit, const unsigned int sigqueue_flags)
  {
  	struct sigqueue *q =3D NULL;
- 	struct user_struct *user;
- 	int sigpending;
+ 	struct ucounts *ucounts =3D NULL;
+ 	long sigpending;
 =20
  	/*
  	 * Protect access to @t credentials. This can go away when all
@@@ -424,42 -425,26 +424,41 @@@
  	 * changes from/to zero.
  	 */
  	rcu_read_lock();
- 	user =3D __task_cred(t)->user;
- 	sigpending =3D atomic_inc_return(&user->sigpending);
+ 	ucounts =3D task_ucounts(t);
+ 	sigpending =3D inc_rlimit_ucounts(ucounts, UCOUNT_RLIMIT_SIGPENDING, 1);
  	if (sigpending =3D=3D 1)
- 		get_uid(user);
+ 		ucounts =3D get_ucounts(ucounts);
  	rcu_read_unlock();
 =20
- 	if (override_rlimit || likely(sigpending <=3D task_rlimit(t, RLIMIT_SIGP=
ENDING))) {
+ 	if (override_rlimit || (sigpending < LONG_MAX && sigpending <=3D task_rl=
imit(t, RLIMIT_SIGPENDING))) {
 -		q =3D kmem_cache_alloc(sigqueue_cachep, flags);
 +		/*
 +		 * Preallocation does not hold sighand::siglock so it can't
 +		 * use the cache. The lockless caching requires that only
 +		 * one consumer and only one producer run at a time.
 +		 *
 +		 * For the regular allocation case it is sufficient to
 +		 * check @q for NULL because this code can only be called
 +		 * if the target task @t has not been reaped yet; which
 +		 * means this code can never observe the error pointer which is
 +		 * written to @t->sigqueue_cache in exit_task_sigqueue_cache().
 +		 */
 +		q =3D READ_ONCE(t->sigqueue_cache);
 +		if (!q || sigqueue_flags)
 +			q =3D kmem_cache_alloc(sigqueue_cachep, gfp_flags);
 +		else
 +			WRITE_ONCE(t->sigqueue_cache, NULL);
  	} else {
  		print_dropped_signal(sig);
  	}
 =20
  	if (unlikely(q =3D=3D NULL)) {
- 		if (atomic_dec_and_test(&user->sigpending))
- 			free_uid(user);
+ 		if (ucounts && dec_rlimit_ucounts(ucounts, UCOUNT_RLIMIT_SIGPENDING, 1))
+ 			put_ucounts(ucounts);
  	} else {
  		INIT_LIST_HEAD(&q->list);
 -		q->flags =3D 0;
 +		q->flags =3D sigqueue_flags;
- 		q->user =3D user;
+ 		q->ucounts =3D ucounts;
  	}
-=20
  	return q;
  }
 =20
@@@ -507,9 -452,11 +506,11 @@@ static void __sigqueue_free(struct sigq
  {
  	if (q->flags & SIGQUEUE_PREALLOC)
  		return;
- 	if (atomic_dec_and_test(&q->user->sigpending))
- 		free_uid(q->user);
+ 	if (q->ucounts && dec_rlimit_ucounts(q->ucounts, UCOUNT_RLIMIT_SIGPENDIN=
G, 1)) {
+ 		put_ucounts(q->ucounts);
+ 		q->ucounts =3D NULL;
+ 	}
 -	kmem_cache_free(sigqueue_cachep, q);
 +	sigqueue_cache_or_free(q);
  }
 =20
  void flush_sigqueue(struct sigpending *queue)

--Sig_/QX=Z=kr2XP8ixxKSptgUIkq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDVkjsACgkQAVBC80lX
0GzODwf/dV28rqQzfH5h+jDKz2rxfS5moEN9YyDsoD9z/VdFNdrnpxFefNLAIG0f
Ik8nYi4tznqmEhrieu0/mFX20AV6oGIcaVHFRXLeeg2v3JatxJ+xK3YeGQqO0pYi
3AzvgNfjDRatp/LLXZ9qaTY0ry3e/XiA+R2JCb9vpoAUfJ6WywwIhlP2y7BqNCRn
uw1CHXmj4tKO+bE3nfRS3/aHQMWfV81V92Iwqi8vAdF1dRfVSXTpJJgbO7DFVnOy
smKXeKyRIBWUVs4/fL8wZiF+1TiqYczztDsrI9z/wtc/RaSQGjLPId2V3uMwrEZm
p6GASjanpQ3Vtva+ktAjF01pAJlUOw==
=FY31
-----END PGP SIGNATURE-----

--Sig_/QX=Z=kr2XP8ixxKSptgUIkq--
