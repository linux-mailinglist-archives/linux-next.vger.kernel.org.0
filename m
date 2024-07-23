Return-Path: <linux-next+bounces-3105-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC493A992
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F3F7283FE9
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F6D13C90C;
	Tue, 23 Jul 2024 23:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WQ89b02F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290A25760;
	Tue, 23 Jul 2024 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721775856; cv=none; b=Dkv9RR8onJPEcZJnkxlK02DR83AIV57i4hX0QsbMK439SeGBUo9NFLAyInl/DlZ5yxirZDm1xoe5wdWZxnN3b9YWyO2n9xwutBrazzzHCdtsgK8W7vuN0OjiIPVIdJa5PsLNOmLtXiwkqqD6HnihGxqTfmiPQYSQLQkivevjniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721775856; c=relaxed/simple;
	bh=aJcKf1xTLSGK0ljbq7oi9P7WFJu5oCLkdrLODajfKGw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PBhTQLm+2KwlhKfSg/JtvV8qJkxqV3aNXN3qIPsNro0yu4FeIN08TWMbwo7Hffkrih2oapPXqBjVPIRdd+qPoPIxZAOZ9DF7Fwn8sWu8WSx2DgA7Pm3brAjMMGFRwLglQuzm/61gjID8DL9Fmsx+x6tiRWg80kngy4KTZcRHDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WQ89b02F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721775851;
	bh=2HDRKg72/VVm71wO8SE0qqTpqqliv/NUv2tMoD/LXHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WQ89b02FdJfoCH6g90VycVkE5FUixUE6lPLCENrJKvSHU9FNzbkgFKJb2qAAbdWfx
	 glMiLzjsa0z706wyPiEVm2/WgfHV5DRFdghkd6UfXWihSo8pRMK8Qa4KiNjl5HpfON
	 3jz6QBcegNb2fwR7GTWxtmzo7KxTLBRYHH7GwOLray0FnIvROpsnB+BZ/UHEBleOGb
	 tSLB+NB8zOF7dqnU47mWhXj/yXQaj9qgozgCzRplt3MV4JACahHmSsLwYEZaw7Ql9C
	 xcYdMtlQyr3JQJJyNPRovh+Q0roq3dTBqFAy5rTJrqZK/9ER87Jj6PggswR3ipRWwr
	 hMqjZcC5ocMfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCQ128hNz4w2K;
	Wed, 24 Jul 2024 09:04:09 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:04:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Mark Brown <broonie@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20240724090408.01435ce8@canb.auug.org.au>
In-Reply-To: <Znm5qDrsqIY8VNTc@sirena.org.uk>
References: <Znm5qDrsqIY8VNTc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B6npodHhcfAc9Ov85lwAZYV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B6npodHhcfAc9Ov85lwAZYV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Jun 2024 19:23:36 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> After merging the driver-core tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: error: initi=
alization of 'void (*)(struct platform_device *)' from incompatible pointer=
 type 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-t=
ypes]
>  1381 |         .remove         =3D rtsn_remove,
>       |                           ^~~~~~~~~~~
> /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: note: (near =
initialization for 'rtsn_driver.<anonymous>.remove')
>=20
> Caused by commit
>=20
>   0edb555a65d1e ("platform: Make platform_driver::remove() return void")
>=20
> interacting with
>=20
>   b0d3969d2b4db ("net: ethernet: rtsn: Add support for Renesas Ethernet-T=
SN")
>=20
> I have applied the below patch.
>=20
> From 8f276c3b5b1be09214cbd5643dd4fe4b2e6c692f Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Mon, 24 Jun 2024 19:02:24 +0100
> Subject: [PATCH] net: ethernet: rtsn: Fix up for remove() coversion to re=
turn
>  void
>=20
> Fixes: 0edb555a65d1e ("platform: Make platform_driver::remove() return vo=
id")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/r=
enesas/rtsn.c
> index ad69d47463cbd..5a6cc99e6b35a 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1358,7 +1358,7 @@ static int rtsn_probe(struct platform_device *pdev)
>  	return ret;
>  }
> =20
> -static int rtsn_remove(struct platform_device *pdev)
> +static void rtsn_remove(struct platform_device *pdev)
>  {
>  	struct rtsn_private *priv =3D platform_get_drvdata(pdev);
> =20
> @@ -1372,8 +1372,6 @@ static int rtsn_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
> =20
>  	free_netdev(priv->ndev);
> -
> -	return 0;
>  }
> =20
>  static struct platform_driver rtsn_driver =3D {
> --=20
> 2.39.2
>=20

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B6npodHhcfAc9Ov85lwAZYV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagNugACgkQAVBC80lX
0Gwuhgf6Ag8fdqGKzcjaldpzvas2UmAzCwKHIg8DEnrQOEnWcFkcP0luB8169NO2
6W33dHloXdN3fusUfwHWHD5SuXLuhlrDeM6Tfj5FS5vlsdwJZyW/Gq9lRKMRtuzY
WrCbm87CB2X7uKL1MvwSkFB5Qe2rUbWooxIVkpyMGL9CZ0NOBmOiVWQUdFhMpL/H
Af+gx+YSfIIzRvYlHB/4b+Xe4zfp+NvRCw1PxzwY7qBSHPWdfOlVuyoxqX2vgcR9
loMvea/e4c9qprUnYKGCfqo1KdDmhmqgsCPnELngAq+ZtCXauktMkyu90tekSW1i
celDkXkUtdCNZaHTmKRdD5kX/8v03w==
=hB3g
-----END PGP SIGNATURE-----

--Sig_/B6npodHhcfAc9Ov85lwAZYV--

