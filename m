Return-Path: <linux-next+bounces-2653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DF915673
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 20:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333892855D7
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 18:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0092419F474;
	Mon, 24 Jun 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgj+ewPx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DC19D081;
	Mon, 24 Jun 2024 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253422; cv=none; b=aoLWngKICWqBBT+QKD7RxGcTTsi7sIHEKKh9bBI0n+pd6mCbeiRRAYb2K5Ti5ycwFgqQTeXpzcccOLuhrsEG0cG/72oG+NDTny9vLTJbj0Cj3UCRh+GP/fGna1jftCJMH7/VA3zbWqiD9AbYxuw+L6tSHZHcZ6n3cIYUPksdA4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253422; c=relaxed/simple;
	bh=96YWEY+we/hq00TNs8Qmo42b7b1R+pnnjmWMj5AtZdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sa35dGr2TXls3NUB6cYjcup29t8nlkRhXTkARfxWhJdvf3UTgzdmesjW8nIo9EPBkeFWxlrsitWNA3uOGlwavJQB4utNC0ObHhKUsa900wBXz20KPs6rYZmV43W5FFzhA+mLvbsdw4UronTESGQPCkpbhfMHbRzIpqsU6jIcqc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgj+ewPx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD864C2BBFC;
	Mon, 24 Jun 2024 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719253421;
	bh=96YWEY+we/hq00TNs8Qmo42b7b1R+pnnjmWMj5AtZdA=;
	h=Date:From:To:Cc:Subject:From;
	b=jgj+ewPx51onAy5AjX0PnqrRxepCIGCyj6isfVQkF2i9PpMS5YxIAuJoFaFzIs/XS
	 rmK6vjUASEKxfN43VyHPKpEXfnEkQYdQIqssyjEJ8vJnsHAxTLJoQ40qarv0dDxEAI
	 eeN3BVYgRP9mbj+OEnNIylWgt5yyCmDr1E/YTWHr7yuBOmgnCV4jbEDhZKmJ0V+wPN
	 2qaBLukdyf/SoA0dIc9gj9uLvPWGjJKTYEleN+7b20AqMRuU6dMyuj0uYW6TuNTl0c
	 ueDMySYCQ230G4Mfr+zfjb8U65qYbkQfaRyVukIrjjnl39svGCdj2QUJpTjHfV7Q1w
	 iWauDsllnSFRQ==
Date: Mon, 24 Jun 2024 19:23:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <Znm5qDrsqIY8VNTc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fnI7Duvj7Pn/WS/q"
Content-Disposition: inline


--fnI7Duvj7Pn/WS/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

/tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: error: initial=
ization of 'void (*)(struct platform_device *)' from incompatible pointer t=
ype 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-typ=
es]
 1381 |         .remove         =3D rtsn_remove,
      |                           ^~~~~~~~~~~
/tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: note: (near in=
itialization for 'rtsn_driver.<anonymous>.remove')

Caused by commit

  0edb555a65d1e ("platform: Make platform_driver::remove() return void")

interacting with

  b0d3969d2b4db ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN=
")

I have applied the below patch.

=46rom 8f276c3b5b1be09214cbd5643dd4fe4b2e6c692f Mon Sep 17 00:00:00 2001
=46rom: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jun 2024 19:02:24 +0100
Subject: [PATCH] net: ethernet: rtsn: Fix up for remove() coversion to retu=
rn
 void

Fixes: 0edb555a65d1e ("platform: Make platform_driver::remove() return void=
")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/net/ethernet/renesas/rtsn.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/ren=
esas/rtsn.c
index ad69d47463cbd..5a6cc99e6b35a 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1358,7 +1358,7 @@ static int rtsn_probe(struct platform_device *pdev)
 	return ret;
 }
=20
-static int rtsn_remove(struct platform_device *pdev)
+static void rtsn_remove(struct platform_device *pdev)
 {
 	struct rtsn_private *priv =3D platform_get_drvdata(pdev);
=20
@@ -1372,8 +1372,6 @@ static int rtsn_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
=20
 	free_netdev(priv->ndev);
-
-	return 0;
 }
=20
 static struct platform_driver rtsn_driver =3D {
--=20
2.39.2


--fnI7Duvj7Pn/WS/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5uagACgkQJNaLcl1U
h9AI0Qf/eLVgpyAXif2IQX/J4c88dt/Cfea1xezgjF5IjoBQYowjP4ytp/kwxLZN
LtXjsESKx6vyPCtCSTPetqut9lo1mElbIubtSCXiODNIKxRdE3azseqTXqI8Di6K
Z+6SQF04dDZPjwQzMsuhSnN+GfZyqrVnLIjDneemzf0uEBjuMfva0Go5WdpIF6Qp
7zaftKbpBcCP3BGFiJFkBOZq74Q4ENgEbcmN83EhSNTQ7ev9Hly+qAJKbXeYa/g7
JwkUdgwIflaQHEOJkMW85AVICjDToXJ/7wFEhHMA/4xVtP9hXZZXLuQ1V69zlmCH
vdBYjcSBNyq4/tWeSaIUHAliAc0exg==
=bvVu
-----END PGP SIGNATURE-----

--fnI7Duvj7Pn/WS/q--

