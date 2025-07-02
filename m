Return-Path: <linux-next+bounces-7304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC4AF0ACC
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 07:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28F91BC49A7
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 05:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700401C5F06;
	Wed,  2 Jul 2025 05:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WPa37nwb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25A1F78E0;
	Wed,  2 Jul 2025 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751434728; cv=none; b=go6bY2lunQwy1CKrz2342R1wk7yxp1C50dZAErAaFYhjsK3wg4iNHGJCEYHQZb4xcd532RYjlSDDIlZNxIoas8+8UYmb8qel/avmj7z9Je3IZqEU6m3IIbC+OkCHH+aIfzh0q7iPfCpj2wkwf9XxAGL4ySLF67JCNHvkLUQZ46s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751434728; c=relaxed/simple;
	bh=hTA2CZ3v5y4ItL9+NDilGn2wlcY1554mf2+p4paVvX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lHcrI2u1d+VpHTIWbDQPI5LpilKcf4AGEnacPBPiSEUY/loDQql1kOpljI7BvrsqLbL30XiXY13vCBzjSCjoOwsAHN79KT3zlSK+BIG3OpC0Es1ECvC5j4gbQ6IEmXwdaUYagA66wllMHRlh+/pmYcxjNW2/qWZmyrtuiRDnr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WPa37nwb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751434704;
	bh=0PxzEV4blDMy5UoNkpuYTQMcVlsXTpkSz471UW67rjk=;
	h=Date:From:To:Cc:Subject:From;
	b=WPa37nwbVMgrnukt+gF/L10XtJN/paxKtuFx2wPbqIfvZf7dZZYk5TyyvIhERQRYI
	 Moh5O/rAa3GsHLBrxUz+QNhtoMKvQhaUJRIpRBg7t5qO2kEFZFeuQ+jbh48irZvjg5
	 VkGdLwa+GqsCchJE0AsDO/AcX6M23mvAQX7Rdfru5EwpqQoQ1aQoJ00WUaBjIIQA6G
	 sqwGsMPh9bQVFcYHCy3TNcSnv37QUGOJ7ijxMlwm2ob2IxIKV9SVA5M89Ayh9NdBoc
	 jGCGS8CSoOEeBUdU2hQz+000CjoSAr6aDNhu58nPjSNO87jG3Q7YgDZaSi8G9JxzbL
	 dxX+3HF1B/SVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX7wb430Gz4wcr;
	Wed,  2 Jul 2025 15:38:23 +1000 (AEST)
Date: Wed, 2 Jul 2025 15:38:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Rob Herring (Arm)"
 <robh@kernel.org>, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: linux-next: manual merge of the phy-next tree with the jc_docs tree
Message-ID: <20250702153836.146165af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TmU0+OIib8lzcE/zv0b12vN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TmU0+OIib8lzcE/zv0b12vN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  MAINTAINERS

between commit:

  739ca710a777 ("MAINTAINERS: replace git protocol for github")

from the jc_docs tree and commit:

  3ed7be12756d ("dt-bindings: phy: Convert qca,ar7100-usb-phy to DT schema")

from the phy-next tree.

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
index ea884d4e18f3,04cda64989c5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3833,8 -3822,8 +3833,8 @@@ ATHEROS 71XX/9XXX USB PHY DRIVE
  M:	Alban Bedel <albeu@free.fr>
  S:	Maintained
  W:	https://github.com/AlbanBedel/linux
 -T:	git git://github.com/AlbanBedel/linux
 +T:	git https://github.com/AlbanBedel/linux.git
- F:	Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
+ F:	Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
  F:	drivers/phy/qualcomm/phy-ath79-usb.c
 =20
  ATHEROS ATH GENERIC UTILITIES

--Sig_/TmU0+OIib8lzcE/zv0b12vN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkxdwACgkQAVBC80lX
0GweHgf/YcHnj5AB2kb8q/KPjwc05qpQLugWZhQRkqlss5mlnstvdmyNqs9aY77Y
Y5dx7joa+hVosD3YLVcnQQc5BAaLv8UfEYd/7KpUKNtt5m4ZgM5A/IAhpxHdPwmS
xVdtxe8dYCRJ5dWQfp7a7RJ+UdwLUMnYyKft7lXMBEmQhKa44ZrcJ5p/oanRYRh/
YPxH6QbIK4xQuZ0AESeDf7H33HX4jErQ/qNRg7LI6ngo4GfQETRRCCRlO6YMGh40
ismIs40wG5mBsRvDSACMkCFBtwvtXY13V+D4CGYbKN8vWsRQxML5G/RsVOJ195Ah
MnSvdovFHL/ybeMleqjtLSdpHG48ng==
=mZZ8
-----END PGP SIGNATURE-----

--Sig_/TmU0+OIib8lzcE/zv0b12vN--

