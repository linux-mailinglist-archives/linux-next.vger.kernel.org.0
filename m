Return-Path: <linux-next+bounces-5725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB81A5B9F8
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 08:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C5E3B041C
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 07:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69CA22423D;
	Tue, 11 Mar 2025 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R48GsdkS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA3223300;
	Tue, 11 Mar 2025 07:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741678533; cv=none; b=SkgpWcNOfSbP/K9iz9Gm2WGfkqp3R1IiJjkaZ2qgtS+QR2qBymItL7kV+OpchIGdzHnZGriVUWI4ErbW/lEvneBx1S5NLHu7odMmOCDWU7Nb3yLaV1kNPO/7w+h+Ojp4SNfZiCnTVkKVOkYMhgc60EgI+RVqJhio5X7JLj12tD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741678533; c=relaxed/simple;
	bh=POjYP11ijGhrMQ/irsFz8LQK3UogA6nQt9n5S4M0ExI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DbBjIAJNVtoCXL0Ialb+NJ8hKLK9V0lv6o1XtUeOg8MOsV180j+C6oiprC3QgfeK9gZQCaE1Z0nLSz7tVSW0/rj09UPRoKUUwSxgqaWDD1xEcIDNYeJzPY6CPfg4SLHV0KPBkk81NQOuXhG2mizQnP3WckIZgUxSJ6rjR6CLBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R48GsdkS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741678527;
	bh=+di+w3XDN0XK7wrSBYa8FBFLbOobo94ufMhlAR2ajB4=;
	h=Date:From:To:Cc:Subject:From;
	b=R48GsdkSaKsBUSen7yRgRbAsbomrVay2i55ADnrXg4oPTiip9u3WNsJPAT5cP9SAA
	 6wdl5DeduraEHDzpv70bx0EVLCkAMKrYPfuJ21UIpCiIB/78myPJSbD6zD2HaDxztj
	 VCPj68NRbK0VMEqKPSZ66pEQenHkiOQEYnwlbOhL65U60Deocfewp0yZMgDf/HtaQG
	 o8Z4ImbwVjYBTASsXJ5SFVeyOLVpi0r31p4OgvxcJJulPCmtGxIxRVtscu68FcoRwV
	 YPUu95U0LaaXAcouzYVzPMLleJiuueuXTO4i4ovb5M4L2wIKBqdo9TTCMLoJPjg7ZL
	 V6USCma8wtvIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBlsn4cW4z4xD9;
	Tue, 11 Mar 2025 18:35:25 +1100 (AEDT)
Date: Tue, 11 Mar 2025 18:35:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Heiko Stuebner
 <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>
Subject: linux-next: manual merge of the scsi tree with the rockchip tree
Message-ID: <20250311183524.38989e83@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aRgCxtyZ6Cad2=.Ts_IQDNO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aRgCxtyZ6Cad2=.Ts_IQDNO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi tree got a conflict in:

  arch/arm64/boot/dts/rockchip/rk3576.dtsi

between commit:

  36299757129c ("arm64: dts: rockchip: Add SFC nodes for rk3576")

from the rockchip tree and commit:

  c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for RK3576 SoC=
")

from the scsi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/rockchip/rk3576.dtsi
index edfa0326f299,bd55bd8a67cb..000000000000
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@@ -1334,17 -1221,30 +1334,41 @@@
  			};
  		};
 =20
 +		sfc1: spi@2a300000 {
 +			compatible =3D "rockchip,sfc";
 +			reg =3D <0x0 0x2a300000 0x0 0x4000>;
 +			interrupts =3D <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
 +			clocks =3D <&cru SCLK_FSPI1_X2>, <&cru HCLK_FSPI1>;
 +			clock-names =3D "clk_sfc", "hclk_sfc";
 +			#address-cells =3D <1>;
 +			#size-cells =3D <0>;
 +			status =3D "disabled";
 +		};
 +
+ 		ufshc: ufshc@2a2d0000 {
+ 			compatible =3D "rockchip,rk3576-ufshc";
+ 			reg =3D <0x0 0x2a2d0000 0x0 0x10000>,
+ 			      <0x0 0x2b040000 0x0 0x10000>,
+ 			      <0x0 0x2601f000 0x0 0x1000>,
+ 			      <0x0 0x2603c000 0x0 0x1000>,
+ 			      <0x0 0x2a2e0000 0x0 0x10000>;
+ 			reg-names =3D "hci", "mphy", "hci_grf", "mphy_grf", "hci_apb";
+ 			clocks =3D <&cru ACLK_UFS_SYS>, <&cru PCLK_USB_ROOT>, <&cru PCLK_MPHY>,
+ 				 <&cru CLK_REF_UFS_CLKOUT>;
+ 			clock-names =3D "core", "pclk", "pclk_mphy", "ref_out";
+ 			assigned-clocks =3D <&cru CLK_REF_OSC_MPHY>;
+ 			assigned-clock-parents =3D <&cru CLK_REF_MPHY_26M>;
+ 			interrupts =3D <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
+ 			power-domains =3D <&power RK3576_PD_USB>;
+ 			pinctrl-0 =3D <&ufs_refclk>;
+ 			pinctrl-names =3D "default";
+ 			resets =3D <&cru SRST_A_UFS_BIU>, <&cru SRST_A_UFS_SYS>,
+ 				 <&cru SRST_A_UFS>, <&cru SRST_P_UFS_GRF>;
+ 			reset-names =3D "biu", "sys", "ufs", "grf";
+ 			reset-gpios =3D <&gpio4 RK_PD0 GPIO_ACTIVE_LOW>;
+ 			status =3D "disabled";
+ 		};
+=20
  		sdmmc: mmc@2a310000 {
  			compatible =3D "rockchip,rk3576-dw-mshc";
  			reg =3D <0x0 0x2a310000 0x0 0x4000>;

--Sig_/aRgCxtyZ6Cad2=.Ts_IQDNO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfP57wACgkQAVBC80lX
0GzxFwf/ZQHt+LZ57HYlfjCOG9PcocowM3cypC8pAZTlZM4H+uzN+hwk4EO2GQFl
qZgQAMqCW5CAEOCOqVWJQKBMMPGh57ybcf/Pu2qvv+crEEW/jvWdZcu3/pueVNNa
nteVTeYlQUkojBjkxMwBsS/MVCRic1X4hHB2wWxXy/frnWPKBC4ZsZ4kI+Aew5n0
fFabnvPBxW6s82tRFZ5VkFkO5ckbXRmdFnuBbpqlymZej7fH5WYeZEVx3J5GCYvm
1S2McWGYDajhd+P1X0vQmmSfLdF9/+EcRVIGJTSY17bXhGCwPjSLHakrmqNMDLEf
BftrG7Wo0cClTwu6E2UhnKAwkMinng==
=wlQu
-----END PGP SIGNATURE-----

--Sig_/aRgCxtyZ6Cad2=.Ts_IQDNO--

