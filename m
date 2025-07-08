Return-Path: <linux-next+bounces-7411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7322BAFDA2F
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 23:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DEC3AC740
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 21:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A672264B6;
	Tue,  8 Jul 2025 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OF9nwkYw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F4219EB;
	Tue,  8 Jul 2025 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752011522; cv=none; b=ABC8uFndI6rBOi9BjxDM2XTIoWUC9FoxTTaq/esQawDqWX9ocKNB/sbAL9rokCtAZKWwB6m3a3/jfYg1aZ5WkLeDSYZaOYaXLA1Pnyhd1xHMIKdzXlAKsngkS9Y6g6UFhDS+IeW9DFSJ5+IGQMSQ6JTatU6lmGS/jp4Edf2edE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752011522; c=relaxed/simple;
	bh=BRUvvj3d7Spp2FRJVS2Y8QzqlYF8NiLXctgTJ3ltOig=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9tv0z0oP9jHARQVOvLKVJsrQ/O3PgviryzIGu3B3tHoMMl9OuWr5gAVz/jjxjImOUDVtNjlRDMW/IMAxOoJ1W+sFkNlddzz9CG0Vvbopt5A95kDXHHfafIw5nwm5M74j3SGZa7KVweCL8T3JWHxkrjFCIa5FBC0bY7sYRgzzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OF9nwkYw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752011453;
	bh=tYs+fsb5zc1kRs/RkmB7+SiS9z6hPKCr8i/3GX6nvys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OF9nwkYw44eco61wU50Udkymys3JVh5tlDF8GFZ6mfV2uabZ0knxScn68K/S5lpTM
	 xIMq3A0224Dwb2q/oCVLO6um8Pw1IW8uriOGomsImgUMaBHzQMKvb3CunC+dTLIreo
	 dgdBdAXPAZosjPFyizQ+atU+G3kVfDUf39Mrh6Y0mDAcVEktkAVHUDv2ThnTXta1Go
	 Ryy3xaXMbcG0z6DznT4nvDsQIl5IgSit9/lOv4soE6hc6RXg4SNnyPwtD2Nfzvx+oa
	 kTTgOsi7JWC49TsOAeAht+x2Ni1Msig2dKZCuUv8Y4kUMpd4fE5kg0tbZepxJ6f56t
	 4qT310zB1p93A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcFCx4qjcz4w2D;
	Wed,  9 Jul 2025 07:50:53 +1000 (AEST)
Date: Wed, 9 Jul 2025 07:51:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250709075154.7f54d795@canb.auug.org.au>
In-Reply-To: <20250708-zocken-funkanstalt-9e658ddeca5c@brauner>
References: <20250708095118.58337fec@canb.auug.org.au>
	<20250708-zocken-funkanstalt-9e658ddeca5c@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LR00EyT9Trsg.QqeR5w9Kxk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LR00EyT9Trsg.QqeR5w9Kxk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, 8 Jul 2025 10:35:31 +0200 Christian Brauner <brauner@kernel.org> wr=
ote:
>
> On Tue, Jul 08, 2025 at 09:51:18AM +1000, Stephen Rothwell wrote:
> >=20
> > The following commit is also in the vfs-brauner-fixes tree as a differe=
nt
> > commit (but the same patch):
> >=20
> >   8c0bcafc722c ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")
> >=20
> > This is commit
> >=20
> >   830a9e37cfb2 ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")
> >=20
> > in te vfs-brauner-fixes tree. =20
>=20
> Interesting. Are you merging vfs.fixes separately? Fwiw, I always merge
> vfs.fixes into vfs.all. So if it's easier for you you can drop merging
> vfs.fixes separately.

I merge all the fixes branches early so I don't have to worry about bugs
in Linus' tree that already have fixes available.

--=20
Cheers,
Stephen Rothwell

--Sig_/LR00EyT9Trsg.QqeR5w9Kxk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhtkvoACgkQAVBC80lX
0GwPDAgAhL4tlIdfE8AUZwVaNkuBOAPK39RDvkWuD9u7oerbVbfyngjsEg/acb9j
12OooTwLGQl6Mwgxbc6xpjK0aJfFXmvi3F9ZWtDuXaELCfaNcjT5y3PcAzy9u5za
Js5GKAwB2HsvibZahDsbMsHqpklG/1kjZ77A+37g1c9QHsjZMgsjyzuFvxXXVY1a
btcx3v+NMS1J0ilbAFd36ckp6SqE8V+SitVfGuZG+0FUf1pkfWEG1Z8hGaoGwZEz
VcjbZc9Ywkg61ZWZPyGYmEVLOyqk4qn/tbLhKWmU4pHgMTp272E9VEYuIodvSbZ8
4ANYvJ7lP1R3rDe9kiQwAe5/SUZOmw==
=kAE4
-----END PGP SIGNATURE-----

--Sig_/LR00EyT9Trsg.QqeR5w9Kxk--

