Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E3127661C
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 03:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIXB5V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 21:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIXB5V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Sep 2020 21:57:21 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63AFC0613CE;
        Wed, 23 Sep 2020 18:57:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BxdTn1Gb7z9ryj;
        Thu, 24 Sep 2020 11:57:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600912653;
        bh=jlcQuGRALYM6HUtjWL7OiAitKroAn1Z2CNU1vCM1I/Y=;
        h=Date:From:To:Cc:Subject:From;
        b=TiW0b2vFcuX78GIhF2qpyDV6X351gltI/07G8y3Xm3m48efXUuDxIuCMNAbCD2htP
         hJa1wGhhwc8AMe7zxaQsWqUxfeuFgqAmE/MxoWbK2DAkwGzbGrSk25Sfq16woMSAUv
         jvXk0AjxzQ2Zsws9Fb0GH7yirJuarYQiOBQadCT2ikRBhKmWgzifXBlkkKo9iZTsoa
         RcUmWwbX/yr1wa7zUlmLGlCZotTmfiDA5I/ZehA3qO9BTGdWhZEl4YUHNVuO4wSmGo
         tf8XKd1XQ/vosnjK45HDApN5WmgKtqWkDdALraSA1AtatOtGB7rTBnerv1eBI5zrkk
         55EhXiDHu0vIg==
Date:   Thu, 24 Sep 2020 11:57:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Wasim Khan <wasim.khan@nxp.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with the imx-mxs tree
Message-ID: <20200924115731.194ecd6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K8bMVqusV0Gxwgrjehxi5oo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K8bMVqusV0Gxwgrjehxi5oo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi

between commit:

  f7d48ffcfc6e ("arm64: dts: layerscape: Add label to pcie nodes")

from the imx-mxs tree and commit:

  c9443b6500ff ("arm64: dts: layerscape: Add PCIe EP node for ls1088a")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index ff5805206a28,f21dd143ab6d..000000000000
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@@ -517,7 -499,18 +517,18 @@@
  			status =3D "disabled";
  		};
 =20
+ 		pcie-ep@3400000 {
+ 			compatible =3D "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
+ 			reg =3D <0x00 0x03400000 0x0 0x00100000
+ 			       0x20 0x00000000 0x8 0x00000000>;
+ 			reg-names =3D "regs", "addr_space";
+ 			num-ib-windows =3D <24>;
+ 			num-ob-windows =3D <128>;
+ 			max-functions =3D /bits/ 8 <2>;
+ 			status =3D "disabled";
+ 		};
+=20
 -		pcie@3500000 {
 +		pcie2: pcie@3500000 {
  			compatible =3D "fsl,ls1088a-pcie";
  			reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
  			       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
@@@ -543,7 -536,17 +554,17 @@@
  			status =3D "disabled";
  		};
 =20
+ 		pcie-ep@3500000 {
+ 			compatible =3D "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
+ 			reg =3D <0x00 0x03500000 0x0 0x00100000
+ 			       0x28 0x00000000 0x8 0x00000000>;
+ 			reg-names =3D "regs", "addr_space";
+ 			num-ib-windows =3D <6>;
+ 			num-ob-windows =3D <8>;
+ 			status =3D "disabled";
+ 		};
+=20
 -		pcie@3600000 {
 +		pcie3: pcie@3600000 {
  			compatible =3D "fsl,ls1088a-pcie";
  			reg =3D <0x00 0x03600000 0x0 0x00100000   /* controller registers */
  			       0x30 0x00000000 0x0 0x00002000>; /* configuration space */

--Sig_/K8bMVqusV0Gxwgrjehxi5oo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9r/QsACgkQAVBC80lX
0GxA/Qf/XpS8U+zhGNJ/aAQZySZYBtqoe0Ii2GP62XZjOp9VvwlGQACEgTd9uqAt
TwyioJbYis7/WondxLEz29HhGvbPXV8mEmPGzmWNdPyi16SrTTROeltwiamhXf3a
MCRi432Rh81xZmjfnKNUCnJq6Kg4J4XZS9/lO1ATT4YzkCYDlzRtfyMRF+s0jgEN
ro9Itvuy1F7QOERgy952mLSKm9jw1MSkIuMUnkcQ8lO1AFoVM6ZiTbcSWa4WEyuo
isLXLW5ZzfH8ItZUxC+XnoCuK66zo34O4aAUE351qf0/nCcSMBaBbSU+huFpnfZB
i56mDukhUAT/SRUkbRaezCog6KbaLA==
=Y+El
-----END PGP SIGNATURE-----

--Sig_/K8bMVqusV0Gxwgrjehxi5oo--
