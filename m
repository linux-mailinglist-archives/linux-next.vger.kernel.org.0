Return-Path: <linux-next+bounces-3106-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995293A99D
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6691F2305B
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58EB144D15;
	Tue, 23 Jul 2024 23:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V3oc6Ye0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023A146A74;
	Tue, 23 Jul 2024 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776098; cv=none; b=TClPyngTR8oy8FJgo5AmWfQR7VSuN84iiR4miJnxz91c+PfDx4Ea3It01pp6KqWrPdDlalTnWI52/S88/guaTPRfrcOzyORDbSRfDb8M4JksYL2DLYg2lUmoldrk7Jb2MAetELWPaYovs1y/SWgpL/J9s1xyTKnFDAjCwuGIJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776098; c=relaxed/simple;
	bh=OdMfQlfYhZ5SLvYpaNh9+7OjHMzPHE1X1rSqURuVDBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ftOk5jXBzG2hUDZapYHnnJa+M9n6e9LAl0VnEhKXQvH0g43JJpQP73zWpWFOJAzblHD+3DXhRBJvjJnTJBHxpacTsg9vvGzUu7ae998OrUdwow/CLryPJYaOotlGOvP2sQsbcfiRdDtjepqGx4XYnkpVQei6peafFyOxM+ip7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V3oc6Ye0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776095;
	bh=n/S3l1boqq3k4TnjOqdsEXNGSpAQ+NVbiHS/5Gmu1Vo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V3oc6Ye0oq9OPgmp++bTmA2Z04R9jJpHkyt0hqZqjmOWhpU14DU3ZjeOV2YpfhQ4v
	 US+pGOxqktLZI/4A1XfQpK78uC94IBDfL1Do5DFIUomYVwS7F393ui/Z3XFaXEbMb0
	 AujwrXr7GtCQMF8EZ62kKDCVBJy1GNP/3lEEutf8lLhFxBiApbqNtK+SrVaFZhvCt2
	 aWYUGlTSUe74TdELa9mc1mljzg6H/INji+S6Mc/HKUKglGHIwKMNx4d6GcNHpc5AHC
	 XXzSJotnXU1wlxlxell50K/FOxECorh9dT8teZqs6bkx4sUcHYrxVYKDdBC8p98nmf
	 U0X4M+/i0BgRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCVl1P1fz4wbr;
	Wed, 24 Jul 2024 09:08:15 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:08:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Mark Brown <broonie@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the reset
 tree
Message-ID: <20240724090814.5c710581@canb.auug.org.au>
In-Reply-To: <Znmufb9L78FCoSSS@sirena.org.uk>
References: <Znmufb9L78FCoSSS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/smpSrVVWHMkUFXW8Jxph8hm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/smpSrVVWHMkUFXW8Jxph8hm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, 24 Jun 2024 18:35:57 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/reset/reset-meson-audio-arb.c
>=20
> between commit:
>=20
>   0e8b3bca280a7 ("reset: meson-audio-arb: Use devm_clk_get_enabled()")
>=20
> from the reset tree and commit:
>=20
>   b99e9c096148f ("reset: meson-audio-arb: Convert to platform remove call=
back returning void")
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
> diff --cc drivers/reset/reset-meson-audio-arb.c
> index 894ad9d37a665,8740f5f6abf80..0000000000000
> --- a/drivers/reset/reset-meson-audio-arb.c
> +++ b/drivers/reset/reset-meson-audio-arb.c

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/smpSrVVWHMkUFXW8Jxph8hm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagN94ACgkQAVBC80lX
0Gw4nwgAggrd8HOELz/MKxz08eAcKEMm8lNH2J3tK3ZcEW10l2kQkM9KTmH3PaP9
GXwrYFePJsACmKFx+DW/W7piCIk8zp3DzsOpZEhme5DhIpicoM4syjgAFlCz7iK1
ddtgEtaaZzLOAUFh95pJoF9NSOGvZKmvKxhuwMLvRKTkzyN++aGaQAn9aQFjx4is
OsmaBylg3F4M6Wrtztqc6PZSJZ5UJTMGjsC5FLiArCGP90yhphucrZS0aLYqFtyZ
kAPwyhFqRUdVbAKqKdTDm/RMLzhby/tOYLfc5zOLzVpSi9dRrxtndHEjWX9Ay1NH
mZUV/suizSGaQbEm+Ycye0m2CmJyoQ==
=ebCj
-----END PGP SIGNATURE-----

--Sig_/smpSrVVWHMkUFXW8Jxph8hm--

