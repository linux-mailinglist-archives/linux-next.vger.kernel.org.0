Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFE23B5996
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 09:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhF1HTS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 03:19:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232303AbhF1HTS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 03:19:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GCzSB2P5Fz9sVt;
        Mon, 28 Jun 2021 17:16:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624864604;
        bh=stfcZs7k8bZEFMzSI3gNbySFYF4Wb75hD3zHueuKgJY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kVC+IM4N5XC5ET/MA7eC6Qp0MPGqmZRu8GHVCxzaistTccxYlKF+k19zHXDJebUas
         wqQRzCjrdfWMg8xQmAoZsaak4OrXHXhZn64/1tcffI3VBYpuuBI17q1eS+VnWAPzeP
         BwFCYRUjAARP1hvTSyKqx2ePfcnVasmrMg9J1p/vedpvoIKfJERuRqo6oOR7Bke7Mh
         gARtNnAyqSF6VcQmRfy1gkOW0Oeoww+V8XgSUo1SJaMc6cTX7dNOYgjFQ//FqkV2Yq
         8OPMwgv24xhyCifpVm+YyDfvNuGkD8QKoag0w8Sy9GlQmwV+YVbC8cASBWBjaq2lq6
         Is1VjC4eNOz9w==
Date:   Mon, 28 Jun 2021 17:16:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Alexey Gladkov <legion@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the userns tree with Linus' tree
Message-ID: <20210628171639.2488fdcc@canb.auug.org.au>
In-Reply-To: <20210625182219.1a2ae36e@canb.auug.org.au>
References: <20210625182219.1a2ae36e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v9o_J/fA7uK2EJaszOlCmKg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v9o_J/fA7uK2EJaszOlCmKg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Jun 2021 18:22:19 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the userns tree got a conflict in:
>=20
>   kernel/signal.c
>=20
> between commits:
>=20
>   69995ebbb9d3 ("signal: Hand SIGQUEUE_PREALLOC flag to __sigqueue_alloc(=
)")
>   4bad58ebc8bc ("signal: Allow tasks to cache one sigqueue struct")
>   399f8dd9a866 ("signal: Prevent sigqueue caching after task got released=
")
>=20
> from Linus' tree and commit:
>=20
>   d64696905554 ("Reimplement RLIMIT_SIGPENDING on top of ucounts")
>=20
> from the userns tree.

Since commits

  4bad58ebc8bc ("signal: Allow tasks to cache one sigqueue struct")
  399f8dd9a866 ("signal: Prevent sigqueue caching after task got released")

have been reverted in Linus' tree, the conflict resolution is a bit
simpler now:

diff --cc kernel/signal.c
index 20d1d896d5b0,9a6dab712123..de0920353d30
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
@@@ -424,27 -425,26 +424,26 @@@
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
 +		q =3D kmem_cache_alloc(sigqueue_cachep, gfp_flags);
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

--=20
Cheers,
Stephen Rothwell

--Sig_/v9o_J/fA7uK2EJaszOlCmKg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDZd1cACgkQAVBC80lX
0GxH9QgApHfLPwu9Bx3qQ7uUl+JvezmyPa/+c/tjFt78EuhH0if7/rOACFJyMdPy
1u83ZoOVMfCqnbhW419nEqbRjCxecDOTlVd8Yj1wAGVzlZkgGPqgL5cj7rz8RY56
zrsq3+UQuQH/3Hhw9J3LClwTYadUWl14gBBx6fUxL0RwKLkpcHK2Tfebr46Edvyg
sP/8vloCXlz85/UkO8WLv9I3/O2A3z67KZC2bXyxHO2nw/9Yn+JuCQWGUPMawE7D
niZGdu6g4ktcW/t8XrOQKMufkha4yZQpZqsCWBzQt19iD3CAetkb6RG4Rwe2bTbx
+O6yfTd5r1tMRPEfOtgWzQGCQWsWaw==
=3Mtc
-----END PGP SIGNATURE-----

--Sig_/v9o_J/fA7uK2EJaszOlCmKg--
