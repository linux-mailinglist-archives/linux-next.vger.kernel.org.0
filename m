Return-Path: <linux-next+bounces-3104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23093A98A
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 00:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 615ED1F22C72
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 22:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6331482F0;
	Tue, 23 Jul 2024 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s1MvwVS5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378A148FF2;
	Tue, 23 Jul 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721775447; cv=none; b=Wh7wwMiAcOwe++GM8OXUxB7/a7cWcy3suuJuuSxrsNcbC2PxN2iUFbAVZ4/Uhagn/jsf3We/B0eU/+zEIPU6wdfidtkyLopGRp0fH0lvW/qjGEoBwIFlkE1KVbgBEiJPJ+HiL9ddMRiXU3C7HUtw6p7fAhM+XFtSU2t4b3UwO4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721775447; c=relaxed/simple;
	bh=sLFnEf8FCEW52W4JrcmZ54DArvFRGMZLouOTXLZ5Tx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxC0yqPczA9AQRAZwgc6nhw/GJCSKY/+YiE0J8l5dc/HyeBNLkYxoJLyumomY9nr3jTx8OvmyfQ8xL6FPAG0yGeRP4wbCZGu6jSqmccqDDSbEUHs2Sw8voBgz5aeJM7mIB3wq1ng3prJd0uX/9z8qCvty/QuxK529Fpjvg39HhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s1MvwVS5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721775443;
	bh=bdWZ9D4MLaroeEn9jFtSa6y2bi33y5X4PH4qemLd2dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s1MvwVS5g1/kCMWyZzPE/izz+sFAlRrvVHEQsBkIkeBR6U/b+HFiH5qdSQQZJJ1Dz
	 QT0HCp68Mi9P0S4QEmd2ydxtCTidvm8JzCz4fpkal3isdlURX/UddKCXV9b8Dv56Po
	 IjP6q0OdjpMyZhB3Mrnz3m3/5e1Dck51Sr0UDKKK6QrVISMGZ/lsOts0eOt7yds0lS
	 FhJD8ZMJ1shzK/OmCa2UG7Mh+lCbF+YvfkPil40PLzpbcYLtyRRj8w3vnJtfG7dHjF
	 KIxgYHt2HiWU28PVmMbq2wLnDqeeAIRFbgJFES9TVrjfB+e7oESA/cyiCvgWoZwp8n
	 aq03HE/C66r5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCGB0dq4z4wZx;
	Wed, 24 Jul 2024 08:57:22 +1000 (AEST)
Date: Wed, 24 Jul 2024 08:57:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the mm
 tree
Message-ID: <20240724085721.7fac67d8@canb.auug.org.au>
In-Reply-To: <20240612123640.68ae0310@canb.auug.org.au>
References: <20240612123640.68ae0310@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+4wmcYvXfWX4xBv_TBB=SOc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+4wmcYvXfWX4xBv_TBB=SOc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Jun 2024 12:36:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/fsi/fsi-occ.c
>=20
> between commit:
>=20
>   2d2bf1e680a9 ("fsi: occ: remove usage of the deprecated ida_simple_xx()=
 API")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commit:
>=20
>   29f102dbb11f ("fsi: occ: Convert to platform remove callback returning =
void")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/fsi/fsi-occ.c
> index f7157c1d77d8,21d2666c4195..000000000000
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@@ -718,9 -719,7 +718,7 @@@ static void occ_remove(struct platform_
>   	else
>   		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
>  =20
>  -	ida_simple_remove(&occ_ida, occ->idx);
>  +	ida_free(&occ_ida, occ->idx);
> -=20
> - 	return 0;
>   }
>  =20
>   static const struct of_device_id occ_match[] =3D {

This conflict is now between the driver-core tree and Linus tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+4wmcYvXfWX4xBv_TBB=SOc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagNVEACgkQAVBC80lX
0GwkeAgApIODkph1k9PWYD21JRIPGi7/+atAkXXWJ3NEV6qxDButvdXv75lbvf7N
VacQRmjrp4atdgssnSzI6axngh7rfgaThmTJz3sBLOOTDfmvZm6neFdCS0Mwem/b
fBGPUubf2enHiHmvzOVhGCMELrzST60qUTe5wL/NA8iwCOwN3VUn55tuRBXVqPEt
sTQP6OHSXnw2UgWW54z7kuoAPVykG7IZLt1kq+DY/5wasa15Mti0nb2N1gMddgZX
yJ37hgAnmO3FYxR59rA5vPp3yd1kwe8tv7xfX0rDR5NBivWBA2Z6OTNjtJkAzeVo
77NZo+NCPjBq11LXloFSa7Xi2yVMCA==
=/Yhi
-----END PGP SIGNATURE-----

--Sig_/+4wmcYvXfWX4xBv_TBB=SOc--

