Return-Path: <linux-next+bounces-4263-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FF899DC68
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 04:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCEDD1C21156
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 02:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5A7157A48;
	Tue, 15 Oct 2024 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KmiUTGob"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD46AB8;
	Tue, 15 Oct 2024 02:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728960552; cv=none; b=R1YNN+pMo8Wq20M5PRTc5EiLpCPxOapD3+PfMJnbzRQXAZEQXObw2J53Zn2v/gC5Nvh0p12h6dH1br9Bg7oyoZImoYg+Dr+U9YqMHKG6uaR4mXR7x3c3jLGJEI+SaYGUbEECniKt8mtvzBf5F58rK7hd5RocnCHIMSoglzTYdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728960552; c=relaxed/simple;
	bh=uIOgGIxgbLBpZLtBGliPrl9uqwbm1fzCAF+OiArk/yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zhdh61HUzqJpeTjo7xB9Vm2CKJ5PRUAP4J37IX87Ft2SbtG0Fyc9Q/xyfU7c6ey8RDJ7YskuJEqBkSZ+sm6TPifQqFLxEuPlxJtOLgA+beuT5s1rNehx5G9JrwmFvMk/ImbYPXyVOzXbDoiJn0RXhPjiX+W/suzxHOKj20xwdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KmiUTGob; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728960545;
	bh=GVEzc8E96ZSvOi/eDpnLlHndDeOg03iJpOxY9vxB7h4=;
	h=Date:From:To:Cc:Subject:From;
	b=KmiUTGobICSPonWY8wmlUrNxLEXWeXrbAY9CBHEetBpuqYXhTmPg5UlCvKhmkveHu
	 qJr9vKpdCBUJd8TLX9Z6WZu1eVM8WPL4apgPm+Ad6IEGdrMSi/oU/NNKV2Fj8uHUEj
	 Bqgxs5I0hWhvCMXnC8lfGPIiqiES7egpAnbSuYAlgYNOeYubzLRfGYAAQSdaH62+YP
	 BGNdk3T3cQUzGrgPZMvwnnxdbEhzY7YhVzgb+WL5Gb1RMAqkzefsjv89fdxFVrTVBr
	 AJC78Tke8eAHz5pMi6Lz7i4KqtU++50IwFL8kc3epJ7WMA7hF4FpKJPs5ZMibhOVOH
	 9uK4tvrxZt5lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSJTD3lCPz4wb5;
	Tue, 15 Oct 2024 13:49:04 +1100 (AEDT)
Date: Tue, 15 Oct 2024 13:49:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <20241015134904.0f897940@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NjlDwM+otHbtUzEj6rfDNYa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NjlDwM+otHbtUzEj6rfDNYa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext.c

between commit:

  98442f0ccd82 ("sched: Fix delayed_dequeue vs switched_from_fair()")

from the tip tree and commit:

  3fdb9ebcec10 ("sched_ext: Start schedulers with consistent p->scx.slice v=
alues")

from the sched-ext tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sched/ext.c
index 5c8453f6a5b5,281652d5df8b..000000000000
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@@ -4475,8 -4560,7 +4560,7 @@@ static void scx_ops_disable_workfn(stru
 =20
  		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
 =20
- 		p->scx.slice =3D min_t(u64, p->scx.slice, SCX_SLICE_DFL);
 -		__setscheduler_prio(p, p->prio);
 +		p->sched_class =3D __setscheduler_class(p, p->prio);
  		check_class_changing(task_rq(p), p, old_class);
 =20
  		sched_enq_and_set_task(&ctx);
@@@ -5192,7 -5270,8 +5270,8 @@@ static int scx_ops_enable(struct sched_
 =20
  		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
 =20
+ 		p->scx.slice =3D SCX_SLICE_DFL;
 -		__setscheduler_prio(p, p->prio);
 +		p->sched_class =3D __setscheduler_class(p, p->prio);
  		check_class_changing(task_rq(p), p, old_class);
 =20
  		sched_enq_and_set_task(&ctx);

--Sig_/NjlDwM+otHbtUzEj6rfDNYa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcN2CAACgkQAVBC80lX
0GyZtwf/aVo0jgY2rNd5Bt5hOrwK+sMfxF4yvLiVwiaNu8MM7t/A3SCzRHVAb5nw
oHWVeg87FCdd9wUXNOt6vnn/KyAooXE8JYP/r6DwGmxxY6XRbuZOF3UzRccUEblm
jO9AuwTl7pgFihttNOOKF/cV3Q6J0gr2/MIfyWzKOvM1mgjvZ5b8kD/rxiY3N1XW
4GwXIBEaLlTDV1/JlLN+NMkml0oF9qEs8U6xnNQKKbQ+qJ5aNFnvxwVHCtHIIVUe
3TnSLaBePJQOO7ic3z65BfUmzLZsixnzDgqMV3SaDitAUVvs2G5opEVbcdknE/N3
K2KdEQ/BKXx5A4m/NlEvIL4KIFsjyg==
=9mba
-----END PGP SIGNATURE-----

--Sig_/NjlDwM+otHbtUzEj6rfDNYa--

