Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD51C436D28
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 23:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhJUV7E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 17:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhJUV7D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 17:59:03 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0F4C061764;
        Thu, 21 Oct 2021 14:56:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hb1XW59Gtz4xbR;
        Fri, 22 Oct 2021 08:56:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634853404;
        bh=H6e4b3/p5YoETgNbuLANkR41zkWYRdfgvRyMAFGI1nk=;
        h=Date:From:To:Cc:Subject:From;
        b=ZUEwWBEa69Qfm68aJ5R89hQDLgy41WHgu6BmFGyf9XvmlO+4QW/plMgO8/Opqxolb
         VPN4aLSqMsQJc5jQpl6F2iLVm5Frik/m0zsB4FO/ZmoRXOAHliqYZU8GMjRHcuvyrS
         okomA0a8TxM7eCkpjPVXuXhK+64vHAfuGcjiv4nxnxTe2pjTRpYWheHkUW6Sy1NiLE
         ZUNAXp2Zq9Ggav6IBnm6AJullCTErQNNZXlZ8jVTpLIWWCCFJJx2+mU959r/nqICS5
         BDpQhjGBeOmUxw9SsB3JnKaFV71qaAWtLDeCZLVf+zHvU/eu6I6Z+/XYXL3zvWluzU
         RlWgDZLpnEqYw==
Date:   Fri, 22 Oct 2021 08:56:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: linux-next: manual merge of the at91 tree with Linus' tree
Message-ID: <20211022085641.57d666a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pYTgjusVyjoodS3OJoQRzem";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pYTgjusVyjoodS3OJoQRzem
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the at91 tree got a conflict in:

  arch/arm/boot/dts/sama7g5.dtsi

between commit:

  6f3466228451 ("ARM: dts: at91: sama7g5: add chipid")

from Linus' tree and commit:

  9430ff34385e ("ARM: dts: at91: sama7g5: add tcb nodes")

from the at91 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/sama7g5.dtsi
index f98977f3980d,c75c7d7c2842..000000000000
--- a/arch/arm/boot/dts/sama7g5.dtsi
+++ b/arch/arm/boot/dts/sama7g5.dtsi
@@@ -159,11 -144,16 +166,21 @@@
  			clocks =3D <&clk32k 0>;
  		};
 =20
 +		chipid@e0020000 {
 +			compatible =3D "microchip,sama7g5-chipid";
 +			reg =3D <0xe0020000 0x8>;
 +		};
 +
+ 		tcb1: timer@e0800000 {
+ 			compatible =3D "atmel,sama5d2-tcb", "simple-mfd", "syscon";
+ 			#address-cells =3D <1>;
+ 			#size-cells =3D <0>;
+ 			reg =3D <0xe0800000 0x100>;
+ 			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 92 IRQ_TYPE_=
LEVEL_HIGH>, <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+ 			clocks =3D <&pmc PMC_TYPE_PERIPHERAL 91>, <&pmc PMC_TYPE_PERIPHERAL 92=
>, <&pmc PMC_TYPE_PERIPHERAL 93>, <&clk32k 1>;
+ 			clock-names =3D "t0_clk", "t1_clk", "t2_clk", "slow_clk";
+ 		};
+=20
  		adc: adc@e1000000 {
  			compatible =3D "microchip,sama7g5-adc";
  			reg =3D <0xe1000000 0x200>;

--Sig_/pYTgjusVyjoodS3OJoQRzem
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFx4hkACgkQAVBC80lX
0Gz4qgf+NMvTltOIJvY6CW2U0OuxIyQjM9drbkmOweIfnRYWzO+KZyPP1JkANKht
DC1VqD7+MiXmCeWs6eg8gnFlG1RAbBbw8/CGGYC7F2RBf7noVNZYyjgEL1ReVChl
+P9eFhEpDN75ID6ScW2tPJTp9kfIRrkQYGC+pHdHnwlWx5a/vhMAyCsEhWcmU6k7
u7/C0hZ1iE1dbbNcY9AicaQU0wMflbF2gyMqqX8WdbsGPUkhiLkTVx9g3707UcFx
Aa7HtwsxG3iAigB2mRl5Pyh3zZX08JT7PMwsMEbO3QnXpKTlotoF8Srw31dvB0uI
EohzMroAc5rKwhcZd3IKU7jdp0vdoA==
=MqWD
-----END PGP SIGNATURE-----

--Sig_/pYTgjusVyjoodS3OJoQRzem--
