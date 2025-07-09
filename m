Return-Path: <linux-next+bounces-7425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85AAFE12E
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 09:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F3217B1F4D
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 07:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD50239562;
	Wed,  9 Jul 2025 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="E3ShT38r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E1A8479;
	Wed,  9 Jul 2025 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045705; cv=none; b=DOkmV8Y0BNZtEqBdJ749Umg6TpOHLZ9Sv2guZleLrAdwTYfcP3Mm9wtKiVo4aXL7bVYXp0pqQKNbSO0BYtWUS4KH3JptNpKihBfPpQO+4a/C6hVI9SVuqaDKnmlXoNHHJrG0MAma/HU2R/O0M4+XYM+7XxfO7pLCMiyKJl68WrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045705; c=relaxed/simple;
	bh=pEcl3vC69AF0Tv/5/88fWW5Hw/Y4TZSFwrX6fmLotzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gOAKlpgEThVTcPQbnZ0GfOXAjnkcFwbzhbb6Nqvpy6rdEaieeIhVGFyCnD39H4oYiYL19+uHObn6OZemCoPQxoFRu3P7k9ayiYuzc4UAE2mofiNjVIFCeJNui0EzqUTzS+yV0B+NaZNLpkrlc+/6rwPvsHy/bdPG8PQi98WhJrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=E3ShT38r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752045634;
	bh=GoIFS/oT809niQxBcniSLqIMIRGY6NhO7yYAKbDXQxA=;
	h=Date:From:To:Cc:Subject:From;
	b=E3ShT38rOzC+7jBiqAuA5CotSFoBLdMhQyI9kPfi6g9ANxNrFTcMCmzva0R3zJogO
	 UspAXBdyOTU4vYKj0BV3Z/TDz/xXyxC5htHQG8pRtW6brk/HL3RQ88SYLRQYpMIzY8
	 X4TNHmu0ReBJ7Tp7tGhWASXIzwB7ZCU26PBWBQdvg3lxwMGRFsNBPFNxg0m4nb7qao
	 TadQU2ckrpK4fsSHKy1aNZHj9v0B5xXjoLINiI+1GGJPfISbO6YGt71dcQYyKOmCR0
	 Nz7EtzA8H+03ZnZ9pcP/ntDSHnnC+gDFWQVnsrZwJQhSjcw+hmHWvCuvOuNExrULXp
	 NEULHIpYmT6Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcTsG3nCVz4wxh;
	Wed,  9 Jul 2025 17:20:34 +1000 (AEST)
Date: Wed, 9 Jul 2025 17:21:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, James Clark <james.clark@linaro.org>, Larisa
 Grigore <Larisa.Grigore@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Radu Pirea (NXP OSS)"
 <radu-nicolae.pirea@oss.nxp.com>
Subject: linux-next: manual merge of the usb tree with the imx-mxs tree
Message-ID: <20250709172138.34ffb49f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iAbvfqnFyAm+22lccuJ0=SE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iAbvfqnFyAm+22lccuJ0=SE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got conflicts in:

  arch/arm64/boot/dts/freescale/s32g2.dtsi
  arch/arm64/boot/dts/freescale/s32g3.dtsi

between commit:

  06ee2f0e2180 ("arm64: dts: Add DSPI entries for S32G platforms")

from the imx-mxs tree and commit:

  d1b07cc0868f ("arm64: dts: s32g: Add USB device tree information for s32g=
2/s32g3")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/freescale/s32g2.dtsi
index da79bb9daa35,4be6534ed01d..000000000000
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@@ -384,45 -376,29 +384,68 @@@
  			status =3D "disabled";
  		};
 =20
 +		spi0: spi@401d4000 {
 +			compatible =3D "nxp,s32g2-dspi";
 +			reg =3D <0x401d4000 0x1000>;
 +			interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <8>;
 +			bus-num =3D <0>;
 +			dmas =3D <&edma0 0 7>, <&edma0 0 8>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
 +		spi1: spi@401d8000 {
 +			compatible =3D "nxp,s32g2-dspi";
 +			reg =3D <0x401d8000 0x1000>;
 +			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <5>;
 +			bus-num =3D <1>;
 +			dmas =3D <&edma0 0 10>, <&edma0 0 11>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
 +		spi2: spi@401dc000 {
 +			compatible =3D "nxp,s32g2-dspi";
 +			reg =3D <0x401dc000 0x1000>;
 +			interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <5>;
 +			bus-num =3D <2>;
 +			dmas =3D <&edma0 0 13>, <&edma0 0 14>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
+ 		usbmisc: usbmisc@44064200 {
+ 			#index-cells =3D <1>;
+ 			compatible =3D "nxp,s32g2-usbmisc";
+ 			reg =3D <0x44064200 0x200>;
+ 		};
+=20
+ 		usbotg: usb@44064000 {
+ 			compatible =3D "nxp,s32g2-usb";
+ 			reg =3D <0x44064000 0x200>;
+ 			interrupt-parent =3D <&gic>;
+ 			interrupts =3D <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+ 					 <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+ 			clocks =3D <&clks 94>, <&clks 95>;
+ 			fsl,usbmisc =3D <&usbmisc 0>;
+ 			ahb-burst-config =3D <0x3>;
+ 			tx-burst-size-dword =3D <0x10>;
+ 			rx-burst-size-dword =3D <0x10>;
+ 			phy_type =3D "ulpi";
+ 			dr_mode =3D "host";
+ 			maximum-speed =3D "high-speed";
+ 			status =3D "disabled";
+ 		};
+=20
  		i2c0: i2c@401e4000 {
  			compatible =3D "nxp,s32g2-i2c";
  			reg =3D <0x401e4000 0x1000>;
diff --cc arch/arm64/boot/dts/freescale/s32g3.dtsi
index 9af35e82fdc9,191d2dab4254..000000000000
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@@ -444,45 -435,29 +444,68 @@@
  			status =3D "disabled";
  		};
 =20
 +		spi0: spi@401d4000 {
 +			compatible =3D "nxp,s32g3-dspi", "nxp,s32g2-dspi";
 +			reg =3D <0x401d4000 0x1000>;
 +			interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <8>;
 +			bus-num =3D <0>;
 +			dmas =3D <&edma0 0 7>, <&edma0 0 8>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
 +		spi1: spi@401d8000 {
 +			compatible =3D "nxp,s32g3-dspi", "nxp,s32g2-dspi";
 +			reg =3D <0x401d8000 0x1000>;
 +			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <5>;
 +			bus-num =3D <1>;
 +			dmas =3D <&edma0 0 10>, <&edma0 0 11>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
 +		spi2: spi@401dc000 {
 +			compatible =3D "nxp,s32g3-dspi", "nxp,s32g2-dspi";
 +			reg =3D <0x401dc000 0x1000>;
 +			interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&clks 26>;
 +			clock-names =3D "dspi";
 +			spi-num-chipselects =3D <5>;
 +			bus-num =3D <2>;
 +			dmas =3D <&edma0 0 13>, <&edma0 0 14>;
 +			dma-names =3D "tx", "rx";
 +			status =3D "disabled";
 +		};
 +
+ 		usbmisc: usbmisc@44064200 {
+ 			#index-cells =3D <1>;
+ 			compatible =3D "nxp,s32g3-usbmisc";
+ 			reg =3D <0x44064200 0x200>;
+ 		};
+=20
+                 usbotg: usb@44064000 {
+                         compatible =3D "nxp,s32g3-usb", "nxp,s32g2-usb";
+                         reg =3D <0x44064000 0x200>;
+                         interrupt-parent =3D <&gic>;
+                         interrupts =3D <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,=
 /* OTG Core */
+                                      <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /=
* OTG Wakeup */
+                         clocks =3D <&clks 94>, <&clks 95>;
+                         fsl,usbmisc =3D <&usbmisc 0>;
+                         ahb-burst-config =3D <0x3>;
+                         tx-burst-size-dword =3D <0x10>;
+                         rx-burst-size-dword =3D <0x10>;
+                         phy_type =3D "ulpi";
+                         dr_mode =3D "host";
+                         maximum-speed =3D "high-speed";
+                         status =3D "disabled";
+                 };
+=20
  		i2c0: i2c@401e4000 {
  			compatible =3D "nxp,s32g3-i2c",
  				     "nxp,s32g2-i2c";

--Sig_/iAbvfqnFyAm+22lccuJ0=SE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhuGIIACgkQAVBC80lX
0GyZlQf/YLJ63e6cg8K/8eDtR65oQ5ZyTeho4GjU3/xVwgBOTZZRZ1CglGc6fcgR
mIAlT0qoQGZwLSdabP+nE45HvX6CYo56IcufInF3v9pzvHJZetwLbMydOn2yQJ5y
dTXyLaR3TZZ0VkVKuho2uyjt2LiKYGVrgZg/Gd7/OYvNAh2qRdn7HUmscmyPPI0B
IBIDxEINidoB0GtFs60zO1oW315aS1/zqYZgkIiBGlHEIOXzipSKyOnu8E56zLgS
FCcXR7FKRVOae5NWJDFtgZIfgQIF8sgTJDZ+3z8nmvuLrbciWYfYGh8nMbrvT72/
LtcCUJQ0Kdl4UuFn+N5hqWfc9wvT+A==
=k1xX
-----END PGP SIGNATURE-----

--Sig_/iAbvfqnFyAm+22lccuJ0=SE--

