Return-Path: <linux-next+bounces-2953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E092F3A6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 03:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D681C21EC0
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 01:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DE22F44;
	Fri, 12 Jul 2024 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qunDyHc5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51DB2FB2;
	Fri, 12 Jul 2024 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720748926; cv=none; b=UnMOuEUWanmeIlVL2ZsgDe+RbBTqiJ/gw/VFtkA7COiuxwM2/GobM2wVrB1a0hvOaPlYNjIYVLjur7G4bb+UJVUqhHtbJrso7F9v9eBFlHGwXsB3EdRxWPnZeydP5WqHVmkZURnc730HFXi2SvL9jZvL4d4ufVoqkhHKvs6ajj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720748926; c=relaxed/simple;
	bh=gTBvJE+8mQnpjzYS5CsJIcmBaOxzzI4izLCbJ/rbEsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SG6uRbKIgV6F8YVCINzZMabZnXNdJlq/i92pTVh/CZbcqgB95p5xkFXUmcwdzNdf+QsQYviE+28xfUtkNZrp2ECICOLWB/2sXp2nWuZ0TOL1qgP2Xc1J8jI7spYLKN0l3GG+kDtIGIhnPHH7vsgKkgYuc2/fCMAvqI96mxhqT1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qunDyHc5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720748919;
	bh=QIMPdUBB+4JNGfVk5Iy14Sf6Nuygjl7+VlQpvE0wQeA=;
	h=Date:From:To:Cc:Subject:From;
	b=qunDyHc5Ebbvc8bjP+cO6BJ35HdfPiqMegFMpk3kumR+l27y2WAxqHfeBFFalMZuS
	 3rT7x4JOevsgTJMuSPJozr/mbynWYTKEmMBQ8aQENHVhEvLcewm7WLpvG3n3LejXrt
	 JrTrSoYG0mGU24oVrlpgyzNFh4v8Re/tCnND+/fYa61vhWQg58AvwEzLMm9IxOGRT2
	 ZWbNpesAZgCBkbOO/4Zp5rQcL2sg4PNtTRtSwW8La+a8T3jPX51rknNxUreDi0Fo7O
	 FnfAg1TDjq8mI4qlEotuTcxNEl/qC8u0BzD8MLhKfgvf2ex2sMfIXQhmdbV06fLV9+
	 WkPd0r9p3Xa4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKvdM3zN5z4w2R;
	Fri, 12 Jul 2024 11:48:39 +1000 (AEST)
Date: Fri, 12 Jul 2024 11:48:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20240712114838.2af5b525@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uDBst4ohDb48w0eZ67u3=2t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uDBst4ohDb48w0eZ67u3=2t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/thermal/tegra/soctherm.c: In function 'tegra_thermctl_set_trip_temp=
':
drivers/thermal/tegra/soctherm.c:592:13: error: unused variable 'ret' [-Wer=
ror=3Dunused-variable]
  592 |         int ret;
      |             ^~~
cc1: all warnings being treated as errors

Caused by commit

  b46696a4e8c4 ("thermal: trip: Pass trip pointer to .set_trip_temp() therm=
al zone callback")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 12 Jul 2024 11:46:14 +1000
Subject: [PATCH] fixup for "thermal: trip: Pass trip pointer to .set_trip_t=
emp() thermal zone callback"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/tegra/soctherm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/socth=
erm.c
index 62983653ca19..d3dfc34c62c6 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -589,7 +589,6 @@ static int tegra_thermctl_set_trip_temp(struct thermal_=
zone_device *tz,
 	struct tegra_soctherm *ts =3D zone->ts;
 	const struct tegra_tsensor_group *sg =3D zone->sg;
 	struct device *dev =3D zone->dev;
-	int ret;
=20
 	if (!tz)
 		return -EINVAL;
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/uDBst4ohDb48w0eZ67u3=2t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQi3YACgkQAVBC80lX
0Gzhrgf/fRNZlusppkxLeMETHznkPZQ8wjOqqOU/a/XhhJZNQAkX43s5Kxznqwiv
xy5vikK2gxBeaLlNPDwHzHiYOrI+HV7v4t8GFc1KjnUgrvmRRKqxhjMC2hU+y6A5
5FxQy38HGV+M0ZT0rhC070r1IcZ1qfu5DtNdYAbQzJMyXSGmcUQNART07GM7ezAd
UQTXCWAubtd+gkfNsRtqiOjywJOmhL13OaCkSmLrccRwdWvCnkiyLoU+at6IAfK/
goHMjjT9NqNn71cY8zj5SYojLMmXuAKZ59ty1v0yNzi+AMoFXjq2iMnYaPNDK7cW
5EpXgjE57I8TpC2ey8ezcKNMaF6s2w==
=cxnq
-----END PGP SIGNATURE-----

--Sig_/uDBst4ohDb48w0eZ67u3=2t--

