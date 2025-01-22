Return-Path: <linux-next+bounces-5289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA9A18A5F
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 04:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06F35188BC4B
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 03:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A1F14F9CC;
	Wed, 22 Jan 2025 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JPGgiirm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022C1494A9;
	Wed, 22 Jan 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737515606; cv=none; b=gYdGQ6d3p79inEM+FZKzY62TICYAwRWghJZ58/JD1794KGLVuYOxBv+55L0cgVj+paILQfsBBeh1+vFHE4iVHYNdryra8ijyGPfCfA3YdIcU8XSLjIPomim0GeKidfbDdSwyPbtXZS3Xp4FHpvkxURH3mWIo0OaUIP+8MrJ12Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737515606; c=relaxed/simple;
	bh=UB2mQ2QVUjz/hKka5eUv9Oir6xkVOUZZRJRobDU7zxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXm33h/32WAufclDcooCCYgEg6/VxrIMfMY8l0j/JzSE4SVDmfRqX/nw5vkOddEGMJ/MVT5f58pJ7YVTkN8bX8tj76dBee7xrBmbuKLN6ihYWRI1iWBiPnV4jURbF6PzmO2dbOCKkcEYswFg3gaCqC/Cxnj2sIruoRxAswt8g2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JPGgiirm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737515585;
	bh=TMfHNeMjORokiAQWpkfUSUEggnloIiqEdnRIi0Oclfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JPGgiirmCRlEaOhTKSBa6eVatLnLLYUyfyLYYhCpNP3v5LHmenJuvl46MP14Q4Alg
	 G5EKmtalMTU6QVGJQkHraLIQnIHzy4IHfc5oWVLaNZx2kYKvFUkSkrNkjdVInReJvR
	 uYeBbWfMDWQCQ8pNu0IYl5T2CT2Ja82EHo2W+13sNfDKcaVI3slBTIaWTosX6343FC
	 UJ9+MgmyGaCOyVZ+feBy/KlHCBknZfmpJbVYVzjJjtpFGuwKgkqwuS9eyUlPP2Tgvv
	 7U9hhbGNqOiTfCQHGIWx7G7i1ozk1WLm2BvO2fk9NsTXsadd9PVJMuJ3jtcmBzJM0e
	 v/dVoG9ByTWoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yd8KD3P8Xz4x8Y;
	Wed, 22 Jan 2025 14:13:04 +1100 (AEDT)
Date: Wed, 22 Jan 2025 14:13:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the mm tree
Message-ID: <20250122141311.7537d25c@canb.auug.org.au>
In-Reply-To: <20241220133738.1beae531@canb.auug.org.au>
References: <20241220133738.1beae531@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4brkKMlJQlrejVcNUdq8vQj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4brkKMlJQlrejVcNUdq8vQj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Dec 2024 13:37:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   kernel/rcu/tree.c
>=20
> between commit:
>=20
>   bf8f464ee259 ("kasan: make kasan_record_aux_stack_noalloc() the default=
 behaviour")
>=20
> from the mm tree and commit:
>=20
>   049dfe96baf9 ("rcu: Report callbacks enqueued on offline CPU blind spot=
")
>=20
> from the rcu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc kernel/rcu/tree.c
> index 3885aae5f9cb,24f1cb292a92..000000000000
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -3083,9 -3083,12 +3083,12 @@@ __call_rcu_common(struct rcu_head *head
>   	}
>   	head->func =3D func;
>   	head->next =3D NULL;
>  -	kasan_record_aux_stack_noalloc(head);
>  +	kasan_record_aux_stack(head);
> +=20
>   	local_irq_save(flags);
>   	rdp =3D this_cpu_ptr(&rcu_data);
> + 	RCU_LOCKDEP_WARN(!rcu_rdp_cpu_online(rdp), "Callback enqueued on offli=
ne CPU!");
> +=20
>   	lazy =3D lazy_in && !rcu_async_should_hurry();
>  =20
>   	/* Add the callback to our list. */

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4brkKMlJQlrejVcNUdq8vQj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQYkcACgkQAVBC80lX
0GwnYggAgnjPj0yOj5UrHitst50XulfuGm2IQnXOWYrsHmkEJda2G1wXbPWJ+uFs
uYosLfUJkHiFaH5FpHe2Mh2pLZxL4Uv7o1lNkQM+4sgP1wOw8Ol7X0bLJhneyWMT
vroRWLlh/3yeG7mUAAD0h/GLx14QNpR2oGJOe9WhQMMcfhZy0aHCrJn/+MAznBMr
FPMW68sleCTvAaK9C4G96bRfCvL8OcejQfcGNaAMtksWxTkKdpBYhBqyE+6hjHWU
cLT7pMBF+/rsF3e1PCHV48AuSbZGna6USFHvL5yphQOJXMvz8RUn+XKkU3MKp0jg
Vn84t/GLEB9XV/Owsx6isL6EtNLRxw==
=8b6v
-----END PGP SIGNATURE-----

--Sig_/4brkKMlJQlrejVcNUdq8vQj--

