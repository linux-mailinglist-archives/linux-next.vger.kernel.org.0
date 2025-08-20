Return-Path: <linux-next+bounces-8040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF94B2E77D
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C691DA241C4
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 21:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A559E2DC33D;
	Wed, 20 Aug 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hO63XzgC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB942E284D;
	Wed, 20 Aug 2025 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725351; cv=none; b=rDKuq3MhlVoPp7fJybq1VbXcHzYGm4HCtkPJ23dzKj/tRAte8ui/mjGrO/hge/8UPRjWPtfxWJtE34j2bsLSrsW+Vgc3cSyJtaW1aPNRvDavX1MurV0OLuRdZ8fZYmb8UOtXSOY98FN85pTWZEIQztNONjpNvAScGInkxWpQVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725351; c=relaxed/simple;
	bh=iDEm04LqcclqpzgpmsLa0BU1ZOAs2RvvsY1NDBw8fMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPJWpUE+4kNuaBELOWYr5x1V81LvdVzqO8kM0Z7OKtz8UGqxbRJRx5KO4AqdvtlY34sQAdMamlt9YCpljrsBBSenRDJz4kBlq8jEiozYzvrZQWQg/+BeoTa4wMRjgn6QeNtr7idbWvQxFALmhSVgYbkrnt7pKv7WwldI31oJ3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hO63XzgC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755725344;
	bh=ZYmXWe6TcU4XRK0rHRezXUd3ygqj/SvPg85mvqxwbno=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hO63XzgC0HOe8rl8zT08VZ7dALn59sl2OnyOyafAsISSLgOwtWY1PFsGTEgP1dyzP
	 CkwhTXKPMThwTpHSifkSE8DIGBQFarmFGdHNfpLNF/A9f9HqrxriIMveE+o5Wk9yFY
	 wRib2ypijgkjZB/FqisHr1pM7cozTelxoe5VgBG9+OOAf32e9d9M+7dXF2jWvCMidx
	 BSi1+ZTjpCQYNeP/2yif3JcUEJMFF6aeiCrUHpTYKELVjtf6kyB8vG4pMHEWppc+0p
	 93QhEO1yVBmCyIuN2nliKpcSMjVE0/gXPbePc4fR0LeHGNYYUup7enqbtj8ZBfgGtd
	 mVBJ7dPtQ/o7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6fhw0V9Qz4wbr;
	Thu, 21 Aug 2025 07:29:04 +1000 (AEST)
Date: Thu, 21 Aug 2025 07:29:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Dave Airlie" <airlied@redhat.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Beata Michalska" <beata.michalska@arm.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "DRI" <dri-devel@lists.freedesktop.org>,
 "Intel Graphics" <intel-gfx@lists.freedesktop.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20250821072902.7a230ab9@canb.auug.org.au>
In-Reply-To: <DC76OGHHB0NH.2150TC0DHRN8A@kernel.org>
References: <20250820112144.43714c90@canb.auug.org.au>
	<DC76OGHHB0NH.2150TC0DHRN8A@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/achTr6dFbFgspk_=FCvdvd8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/achTr6dFbFgspk_=FCvdvd8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Wed, 20 Aug 2025 12:30:14 +0200 "Danilo Krummrich" <dakr@kernel.org> wro=
te:
>
> I think this resolution doesn't compile, since attributes on expressions =
are
> behind an unstable feature flag.
>=20
> I assume your config does not have CONFIG_DRM_NOVA=3D{y,m}.
>=20
> The resolution in [1] is the one I came up with in the drm-tip tree.
>=20
> I should probably have given you a head-up on this conflict, sorry for th=
at.
>=20
> [1]
>=20
> diff --cc drivers/gpu/drm/nova/file.rs
> index 4fe62cf98a23,7e7d4e2de2fb..90b9d2d0ec4a
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@@ -39,8 -36,7 +36,7 @@@ impl File
>               _ =3D> return Err(EINVAL),
>           };
>=20
> -         #[allow(clippy::useless_conversion)]
> -         getparam.set_value(value.into());
>  -        getparam.value =3D value;
> ++        getparam.value =3D Into::<u64>::into(value);
>=20
>           Ok(0)
>       }
>=20

Thanks for that.  I will use that resolution from now on.

--=20
Cheers,
Stephen Rothwell

--Sig_/achTr6dFbFgspk_=FCvdvd8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimPh8ACgkQAVBC80lX
0GzG3ggAhpCg4N/adzC9Wll12L8Giz65Otl8iwmjWFPSa6HvK/PYP6J2ykru9JUd
+Mgrefu37HrzrOswLuc/bhVKVZW2RrTAlTWNqcI8Nf3v7TVJADPz6utotStzxB8P
cs1S5WdrGySUpiSslV5IyFoBJg6ajfykGXuRn4uYxHCI0gjW0DIwwi9XycAHo9Qw
mtYQQE37HhF1A+gswTCJdG2kTKid4Gsdu2xrQk2AWDW7qjvpGQUFuP47Wg4wNHc+
4NU4pbkZnHNkYTGn1j303ua/x39yUu8l2BI0sXNS84YPDxQmWDCv9ESQaBVLhI/z
VecuxeVm8hce5qiV+GuBFGZG4Pxg4g==
=QFON
-----END PGP SIGNATURE-----

--Sig_/achTr6dFbFgspk_=FCvdvd8--

