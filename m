Return-Path: <linux-next+bounces-3107-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81393A9A2
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62114282C29
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B9B146D7E;
	Tue, 23 Jul 2024 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CVDCKH4y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E413D52B;
	Tue, 23 Jul 2024 23:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776289; cv=none; b=LDsBl9Mmsyrb7zlSyy7Be4Bw7101EeCbfYwrs/3An0KLThnavuymEyttnb2v8rm3sRRww+C6qhbGmpNjQIEKjVw25FC+jaUI/jkTMCHfj/v6Z4TkQLawu/GitMa6I0EGOnm7TGA8TdrJal93uVr2latVKdbi7v+dBat+3YE6/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776289; c=relaxed/simple;
	bh=08n9rrgh1KFRi2Zwlu391PvfWVZ4vQ3+nZEgj0H+8iI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VELR24MZSu1YPCMM1lBDAgFkzd4n6Y9Hcw5HssfBz7GSkoP+Wn7cO7ITXNdOkwI2rL0PB8rHeh5E4028kYkS+Emn52a4ilKeJ8+IRl+GalO43yYH0FgXSGfgMmWy3xyJZNhpefkSm2P6qbHuNld5NP/+uc/TWc1pQFsQElh5DSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CVDCKH4y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776285;
	bh=Fdir779/nJWp3PyuuHGd1vNme0Cd+xbU5W6AKfJLS4Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CVDCKH4y0Gd8dRjbmM4agMpM+t1XN1i1EbDcV4vLI78dJ+Ufbn3C+LWgYSBGKQDFA
	 pLKT7yDbU1JqbPDOcHJd64MPRdT/FttjlMkqSt0ynDADW/d5AKmeOz7VUkiQvcMPJf
	 QUx6MCm8LFfVeWaX3Bm/+xFx1N1MzUeZQBujbF9xUjXrHqDnpTYcSlL2Ywq3rrsKKz
	 QVBBaVQdU10AJ1S5VxEBbtYCslTfTj1x8YSXdly0FtWvb4LxEREo3XlfonUNiajaDn
	 SsfmlAppKrytIaqQ6ImDmiYYrUxdSHLGg+yzfLhJfbdhl9aN0N1bPHLci09H5V9QcN
	 O1Hd5cV1qHcog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCZN1Ywhz4wZx;
	Wed, 24 Jul 2024 09:11:24 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:11:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20240724091123.0dac1f76@canb.auug.org.au>
In-Reply-To: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
References: <Zn8TKYDCOCtbbNH8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CLkSBKR/AF.1Ojv=uit6KI/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CLkSBKR/AF.1Ojv=uit6KI/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Jun 2024 20:46:49 +0100 Mark Brown <broonie@kernel.org> wrote:
>=20
> After merging the drm tree and then some other trees which seem to have
> allowed the driver to be built much later in the merge process today's
> linux-next build (x86_64 allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: error: initialization=
 of 'void (*)(struct platform_device *)' from incompatible pointer type 'in=
t (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-types]
>  1212 |         .remove =3D lvds_remove,
>       |                   ^~~~~~~~~~~
> /tmp/next/build/drivers/gpu/drm/stm/lvds.c:1212:19: note: (near initializ=
ation for 'lvds_platform_driver.<anonymous>.remove')
>=20
> Caused by commit
>=20
>   6597efcfc53585d5 ("drm/stm: Allow build with COMPILE_TEST=3Dy")
>=20
> interacting with
>=20
>   aca1cbc1c9860e39 ("drm/stm: lvds: add new STM32 LVDS Display Interface =
Transmitter driver")
>   0edb555a65d1ef04 ("platform: Make platform_driver::remove() return void=
")
>=20
> I have applied the below fixup patch.
>=20
> From 59a5e11f41e93512ca1a5aed36c1c396d175797d Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Fri, 28 Jun 2024 20:45:16 +0100
> Subject: [PATCH] drm: Fix up STM LVDS driver for void remove() conversion
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/gpu/drm/stm/lvds.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index bfc8cb13fbc5c..2fa2c81784e97 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -1186,15 +1186,13 @@ static int lvds_probe(struct platform_device *pde=
v)
>  	return ret;
>  }
> =20
> -static int lvds_remove(struct platform_device *pdev)
> +static void lvds_remove(struct platform_device *pdev)
>  {
>  	struct stm_lvds *lvds =3D platform_get_drvdata(pdev);
> =20
>  	lvds_pixel_clk_unregister(lvds);
> =20
>  	drm_bridge_remove(&lvds->lvds_bridge);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id lvds_dt_ids[] =3D {

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CLkSBKR/AF.1Ojv=uit6KI/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagOJsACgkQAVBC80lX
0GylMQf/c7uFuQ0py4mDOSU4kA4YBLxI2Tj643yL8QlySuC3JdJI3qm34IX59sje
oswlY+9aVXA1UgHMehsC+8mgdfDthodgLBwRBa48ZRRLMpzh0/rXD8HWW20DN87A
pCRtCG+wy2vgFxv6983QhpCQ2ZrOrlJzOTu+WbnhhdICMA/rUqdfBqfzrnSz8dLO
j8yh7ESE3QMlBceo1gYDwijIERR9d0uYr8UgAFrepTZsm7wNnw/ogeZ4qA8UXDuy
RSkq32OeFc3yuUwiLbQ4t9VAfE1GsBP26x+KtzdHvtQJ3MKyXJ9zn7jJAVHKYYkK
CguUz2ti7fk7SghrjLcbjEFfvkSSbg==
=0aWm
-----END PGP SIGNATURE-----

--Sig_/CLkSBKR/AF.1Ojv=uit6KI/--

