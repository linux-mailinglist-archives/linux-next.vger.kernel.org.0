Return-Path: <linux-next+bounces-3186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9394415E
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B19D21C2247B
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D613D240;
	Thu,  1 Aug 2024 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PBtsDEaN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017A13C9D4;
	Thu,  1 Aug 2024 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722480350; cv=none; b=PblVR8dCnMgS5/AIYxWRV/RYiO+w8YBwpSziGl5qVZuIVWwL9sXdixfj7ip0ZdYFHwgDyMcpFSPfQQJBpavf6NqCZws5XbI0n4VZv/idtHO/hMofJb7lDoZfKSQXuWj9yxo5hvD39zf2fr9dsG30fHodPb0oig71CqW+V96OG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722480350; c=relaxed/simple;
	bh=bSYKN9IhoHbR2enQm+8mYnt1ZNIDtvJ8P1GPrpJ4qRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O5EPkAssBRWN8ufIS6o9+UIF8f4+Mb/D4EJsW0npTvxZ4YqoGywhntqbYuo21EgiZYI43tg4yP9/jUlsfJL3oo3WWc8DQuJWT7fJyunidRCKV6YWm4yc1emghicQaGm+yVVQcyWSFTxcWXm7Aq3mWfVExh1rOdAKxzRxQuVdZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PBtsDEaN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722480346;
	bh=GkzZcFk6U/7i7+BM6fLsy4RhuZ9Th3FuF1F1svVeTXw=;
	h=Date:From:To:Cc:Subject:From;
	b=PBtsDEaNzgtvUFffRVbCI+V6V5ylG6HKSd6Ack3moG9lsd4r8nV05pKjeGxfdAKqZ
	 5y5jIM8XJ2G/Bu/JMFzsBbaHOxXhsxaLJxbJCLThE4n0bdbg0e68uxo9JA2Y7ug/lG
	 ddldTm3kGdvJ3tfUEBawo8I8RmEdlloFIEYttkl+yaiQYrIVawXeVw6JzLy4XeR+8Q
	 9xt35DMw31U7yKU+MI7HiMiTl+nPhAJy3/smw+kn3YnR51HEUbQqfGEtVTasWN/JAW
	 283pKBMWdJf9P47q2p+opLmkLlfArg9lexe5VyHSs10jJgI/1XTkcFac1y7p3sFonx
	 AJWmE6lOP0Dng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZCy23NHWz4x7H;
	Thu,  1 Aug 2024 12:45:46 +1000 (AEST)
Date: Thu, 1 Aug 2024 12:45:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, Daniel Bristot de
 Oliveira <bristot@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yang Yingliang <yangyingliang@huawei.com>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20240801124545.43e3a455@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z/esKeD2Z9YnzlxEsIKUQZ5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Z/esKeD2Z9YnzlxEsIKUQZ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/core.c

between commits:

  c245910049d0 ("sched/core: Add clearing of ->dl_server in put_prev_task_b=
alance()")
  31b164e2e4af ("sched/smt: Introduce sched_smt_present_inc/dec() helper")

from the tip tree and commits:

  60c27fb59f6c ("sched_ext: Implement sched_ext_ops.cpu_online/offline()")
  a7a9fc549293 ("sched_ext: Add boilerplate for extensible scheduler class")

from the sched-ext tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/core.c
index 73fa0290fd8f,22f86d5e9231..000000000000
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@@ -5878,10 -5901,23 +5947,15 @@@ __pick_next_task(struct rq *rq, struct=20
  restart:
  	put_prev_task_balance(rq, prev, rf);
 =20
- 	for_each_class(class) {
 -	/*
 -	 * We've updated @prev and no longer need the server link, clear it.
 -	 * Must be done before ->pick_next_task() because that can (re)set
 -	 * ->dl_server.
 -	 */
 -	if (prev->dl_server)
 -		prev->dl_server =3D NULL;
 -
+ 	for_each_active_class(class) {
  		p =3D class->pick_next_task(rq);
- 		if (p)
+ 		if (p) {
+ 			const struct sched_class *prev_class =3D prev->sched_class;
+=20
+ 			if (class !=3D prev_class && prev_class->switch_class)
+ 				prev_class->switch_class(rq, p);
  			return p;
+ 		}
  	}
 =20
  	BUG(); /* The idle class should always have a runnable task. */
@@@ -8040,8 -8056,16 +8122,10 @@@ int sched_cpu_deactivate(unsigned int c
  	 */
  	synchronize_rcu();
 =20
 -	rq_lock_irqsave(rq, &rf);
 -	if (rq->rd) {
 -		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
 -		set_rq_offline(rq);
 -	}
 -	rq_unlock_irqrestore(rq, &rf);
 +	sched_set_rq_offline(rq, cpu);
 =20
+ 	scx_rq_deactivate(rq);
+=20
 -#ifdef CONFIG_SCHED_SMT
  	/*
  	 * When going down, decrement the number of cores with SMT present.
  	 */

--Sig_/Z/esKeD2Z9YnzlxEsIKUQZ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq9tkACgkQAVBC80lX
0GyO2Qf+N7ccZ/n/Fdf4273hdyp3uNqpXG6Y+yqnJqycYGOqzHkoj0uM24MGoPuy
7+0kV+T+AWjccX7TzA5q5EiekoZPwI17I4ND2q6YvN8UeFy2xgCGWunFvQlor4Ai
IpeysFPrcVNu1cLECYG7pFvoEQRfFJZPG6jNElb/ZLMbGkQ5osshVpIaBh7IZciR
c9OMiiuX2hnNV62XdJCosOUfp3LzHGp/3Za+zIukcCZeoRmq0bZovy0H71DbGQwo
BJdGr8SJ1ZKW+/X1u1pb8NjPSw1mqFkvJOke6xz7f/FKLDQR1KpdI12xC+VDRmaz
T+o/EwKM2qugsHgh19Gt4cjZEAQ2Gw==
=Lzg9
-----END PGP SIGNATURE-----

--Sig_/Z/esKeD2Z9YnzlxEsIKUQZ5--

