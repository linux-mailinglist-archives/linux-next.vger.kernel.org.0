Return-Path: <linux-next+bounces-4568-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC569B885B
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 02:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BCC1F233DD
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 01:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CA73CF73;
	Fri,  1 Nov 2024 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tK5O18Ys"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF86C4C3D0;
	Fri,  1 Nov 2024 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730424328; cv=none; b=QR4TKH/k9W+U5qR72ONHsjJBixBtNhqTaJL3paV5fmw949b2H18Oq8adpBO5MLlkIEjAe3PH/xFGEJMmZ28mp0mdxR8dOB5lAdkPikZmQFNn1TvIOK1iE5DU972iizIl9mhJ0Gbp/MwkWx0aEaoTt10syXiu3YFA2GARfFtsZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730424328; c=relaxed/simple;
	bh=2dbM5EpWRjcPfzrtyr+TJTsnnL79nW2KMqKKbCvuCGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GgIXokwje4oXEocn2pLxwGVxxpZxaOlXp4PBowqfWHOm1dBKs1mV8Q7aId0jjW9JHNHwGRw17JpoEcRAELxNIMu3WFOptZUL2EIOV3RQG40nw/EK27pTOOGHSbg2OZnCKQWmLwSWkRaTLSHYtV+cgvPt7prWGf1wsHk4sumd6Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tK5O18Ys; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730424309;
	bh=MD3/3YQuyZL5hZ/YibVTQie64WK9EHSl7SiHTqu3hPc=;
	h=Date:From:To:Cc:Subject:From;
	b=tK5O18YsvSlAj8mF4VDS1SzrU4rH6dXFLjADbFwJv79k4B4RO7hUlaUXGuNQ+V2tu
	 BCsMVcTuj16Q6KZbTglGEOb8yrz5I3GoijAIq0jQOIvT6/BEDBpne27smVPogOP63m
	 znpRv7ARIAcHsGQ1MPwVd5qufzsN+Yq/RTYb5I1yfeKSfIo5t5mHut3lEosyn2to0H
	 FSrA+IEgt7d/v1/Ny1IKvzG7COzGbsTzGTT4L92Y8MEyK+k6/OjpXiann0mLdTcacq
	 WPYe7vlV6dtft/V8aRf7Af0cPuOV5V4X5S5TC8LyPY1jl8LO8iu/K/U4/CQgYmR8nm
	 mjyLiKpO3s7GA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfjpW524Dz4xKl;
	Fri,  1 Nov 2024 12:25:07 +1100 (AEDT)
Date: Fri, 1 Nov 2024 12:25:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Machon <daniel.machon@microchip.com>, Herve Codina
 <herve.codina@bootlin.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the reset tree
Message-ID: <20241101122505.3eacd183@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/95eJKgqrkg.3gs6ZY4s9wV8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/95eJKgqrkg.3gs6ZY4s9wV8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  MAINTAINERS

between commit:

  86f134941a4b ("MAINTAINERS: Add the Microchip LAN966x PCI driver entry")

from the reset tree and commit:

  7280f01e79cc ("net: lan969x: add match data for lan969x")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index a0cad73c28d0,c4027397286b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -15179,12 -15091,13 +15185,19 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/interrupt-controller/microchip,lan96=
6x-oic.yaml
  F:	drivers/irqchip/irq-lan966x-oic.c
 =20
 +MICROCHIP LAN966X PCI DRIVER
 +M:	Herve Codina <herve.codina@bootlin.com>
 +S:	Maintained
 +F:	drivers/misc/lan966x_pci.c
 +F:	drivers/misc/lan966x_pci.dtso
 +
+ MICROCHIP LAN969X ETHERNET DRIVER
+ M:	Daniel Machon <daniel.machon@microchip.com>
+ M:	UNGLinuxDriver@microchip.com
+ L:	netdev@vger.kernel.org
+ S:	Maintained
+ F:	drivers/net/ethernet/microchip/lan969x/*
+=20
  MICROCHIP LCDFB DRIVER
  M:	Nicolas Ferre <nicolas.ferre@microchip.com>
  L:	linux-fbdev@vger.kernel.org

--Sig_/95eJKgqrkg.3gs6ZY4s9wV8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckLfEACgkQAVBC80lX
0GwXzgf9G/RDBjSqycK2SiwjhRuAt5VG8oMJDDFcQ8b348Wf/AyhzbJTFqpLOaSJ
hcLLLXSL5io6p5Q8T9pFk0/2k031gdsBg1E8io5pGor9Miajua6BhQ2g/Dqw8z72
cJ1N19reJZ3spTsYT09VskxwVmihyGSCRkIB8qvqazqtzxbcS7F4P0thXRgUXSNV
T4cwZydD3LDCJMsmfWB/ETD+JcEhxXB3JyjHxrSkzHlbXzDu7OMIuc7Of+XrTnlY
CdGuvzH14Klov2aI/WgYBNurAneorc1UuzlIRtaZwW0jSD0mxUi34bykU5PSh3Mc
Kl1LGNUzjCjgctHoc1UeCbrJjgI3dw==
=BU+d
-----END PGP SIGNATURE-----

--Sig_/95eJKgqrkg.3gs6ZY4s9wV8--

