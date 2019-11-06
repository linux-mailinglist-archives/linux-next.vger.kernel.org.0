Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228B7F220E
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 23:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKFWqB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 17:46:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbfKFWqB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 17:46:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477hTJ51wWz9sP3;
        Thu,  7 Nov 2019 09:45:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573080358;
        bh=+XwusxsL0b4rJBumGPAzaru0IjxloMP02YE8X8kLabo=;
        h=Date:From:To:Cc:Subject:From;
        b=rLZM9R01VqV7vgXOwFbsOeF67bN/WIoz/XjxhJHxjXsf5MMzeYoPJX8x9VBP9DGCt
         ZTdQDaXK5fcRKzIJmWnQcPLPI4RtfkEMrOiISWci3m159I0wOmpUhn/zfNbH+FLtiW
         BNo6AgPyOPsgVJDzcwGXom+j5WzDPafsCOYLjGw0b5mljlguia+6p8mf2aIoqPwBUg
         yb4jlPWvHNJhO1zYHTKk84AzaXBCj+hS0zKb3nEolOEbW3SkHjLgefMnLDSAZndLa0
         5uEgN05cqImpGB4YsLppF3q13bKXt8miBMeF2pnBoEdrCCdEXOzlvR4O4qFlgWVbG5
         k3X9bb9Mbc7ig==
Date:   Thu, 7 Nov 2019 09:45:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: linux-next: manual merge of the pci tree with the arm-soc tree
Message-ID: <20191107094555.6296b943@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//QyZLzC9Q_pWsXAriLWbKQm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//QyZLzC9Q_pWsXAriLWbKQm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi

between commit:

  68e36a429ef5 ("arm64: dts: ls1028a: Move thermal-zone out of SoC")

from the arm-soc tree and commit:

  8d49ebe713ab ("arm64: dts: ls1028a: Add PCIe controller DT nodes")

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

diff --cc arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 8e8a77eb596a,71d7c6949b9e..000000000000
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@@ -611,6 -594,89 +611,58 @@@
  			#thermal-sensor-cells =3D <1>;
  		};
 =20
 -		thermal-zones {
 -			core-cluster {
 -				polling-delay-passive =3D <1000>;
 -				polling-delay =3D <5000>;
 -				thermal-sensors =3D <&tmu 0>;
 -
 -				trips {
 -					core_cluster_alert: core-cluster-alert {
 -						temperature =3D <85000>;
 -						hysteresis =3D <2000>;
 -						type =3D "passive";
 -					};
 -
 -					core_cluster_crit: core-cluster-crit {
 -						temperature =3D <95000>;
 -						hysteresis =3D <2000>;
 -						type =3D "critical";
 -					};
 -				};
 -
 -				cooling-maps {
 -					map0 {
 -						trip =3D <&core_cluster_alert>;
 -						cooling-device =3D
 -							<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 -							<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 -					};
 -				};
 -			};
 -		};
 -
+ 		pcie@3400000 {
+ 			compatible =3D "fsl,ls1028a-pcie";
+ 			reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
+ 			       0x80 0x00000000 0x0 0x00002000>; /* configuration space */
+ 			reg-names =3D "regs", "config";
+ 			interrupts =3D <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
+ 				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
+ 			interrupt-names =3D "pme", "aer";
+ 			#address-cells =3D <3>;
+ 			#size-cells =3D <2>;
+ 			device_type =3D "pci";
+ 			dma-coherent;
+ 			num-viewport =3D <8>;
+ 			bus-range =3D <0x0 0xff>;
+ 			ranges =3D <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000  =
 /* downstream I/O */
+ 				  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-p=
refetchable memory */
+ 			msi-parent =3D <&its>;
+ 			#interrupt-cells =3D <1>;
+ 			interrupt-map-mask =3D <0 0 0 7>;
+ 			interrupt-map =3D <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH=
>,
+ 					<0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+ 					<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+ 					<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+ 			status =3D "disabled";
+ 		};
+=20
+ 		pcie@3500000 {
+ 			compatible =3D "fsl,ls1028a-pcie";
+ 			reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
+ 			       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
+ 			reg-names =3D "regs", "config";
+ 			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+ 				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+ 			interrupt-names =3D "pme", "aer";
+ 			#address-cells =3D <3>;
+ 			#size-cells =3D <2>;
+ 			device_type =3D "pci";
+ 			dma-coherent;
+ 			num-viewport =3D <8>;
+ 			bus-range =3D <0x0 0xff>;
+ 			ranges =3D <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000  =
 /* downstream I/O */
+ 				  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-p=
refetchable memory */
+ 			msi-parent =3D <&its>;
+ 			#interrupt-cells =3D <1>;
+ 			interrupt-map-mask =3D <0 0 0 7>;
+ 			interrupt-map =3D <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH=
>,
+ 					<0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+ 					<0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+ 					<0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+ 			status =3D "disabled";
+ 		};
+=20
  		pcie@1f0000000 { /* Integrated Endpoint Root Complex */
  			compatible =3D "pci-host-ecam-generic";
  			reg =3D <0x01 0xf0000000 0x0 0x100000>;

--Sig_//QyZLzC9Q_pWsXAriLWbKQm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DTSMACgkQAVBC80lX
0GyQKwf/VAheeyOnOzyIAVAMHqtb1sfJTdKl+hDzUT89TKwR5zEAKirJOb57fRGF
mMntSiwVjsXWz/YZ/Gw2crLxXm1l71KSJDMsbZQcEBZ8W3eWhlg/zT/zf0gM9hxt
p0wcfTyBmmTnl8h8um3cvfRMeT9t2e8FLBX8K6N4luPVnDilX/oWtaeJK66BTw+J
A931O81QXJnapRnfoWF0ZgArWaOFu/3/cdzSfVkm0+YEszmoOTMaisOsKGZ50cSt
lpnWEOtanhHSkzeJK/E7O1geHvyCg7LpRQPkAinXuoVpFlYupBkSQJZW/27JF7Qf
CLq/1L3SH2krNGqSN5a7x0CPBF/dDw==
=9vD4
-----END PGP SIGNATURE-----

--Sig_//QyZLzC9Q_pWsXAriLWbKQm--
