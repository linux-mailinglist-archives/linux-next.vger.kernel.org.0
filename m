Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CB1217E70
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 06:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728979AbgGHEiH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 00:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgGHEiH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 00:38:07 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EB5C061755;
        Tue,  7 Jul 2020 21:38:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1mkx3glbz9sDX;
        Wed,  8 Jul 2020 14:38:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594183083;
        bh=ZsMcG70EzyVoGxShgO4kLHS/DyIAqpINTFPJBiPhCWU=;
        h=Date:From:To:Cc:Subject:From;
        b=IT2uQZXV3/7XQNOLkkYoasFrMKQLzR4jB3xm7wNtSFUhxgGcZWfjwcwZ1zzpoZ4wE
         iXaFlujqV4ZoGC4eSVX0frW/TRpB5BGo0MicIUHHPJZIBZpN1jaRxzAc7FqKO/BdKs
         ztKtwOcBDIEeHrw7g9SlUitpPjfjcKkwKlpZnSIJSJjaSlTEfzmEa0yhkUV/sdSG5L
         vUpfsPGhgHCdcVLpUotau2j/j9UH0H7nxCy2lYpMCnTIyty2QzMaT/rfiXn7LvT/wX
         AV/XSJX9mnVGgQHpo2pv1NQiSb+rjfHPJHebvf175skl1aTbnh5DEjXWDDGRgP12SN
         +SdaMfVps7Zeg==
Date:   Wed, 8 Jul 2020 14:37:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@st.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: linux-next: manual merge of the spi tree with the mtd tree
Message-ID: <20200708143759.50246487@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oy0nep/YG9.oD.7jA5usSxT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oy0nep/YG9.oD.7jA5usSxT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi tree got conflicts in:

  drivers/memory/Kconfig
  drivers/memory/Makefile

between commit:

  66b8173a197f ("memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driv=
er")

from the mtd tree and commit:

  ca7d8b980b67 ("memory: add Renesas RPC-IF driver")

from the spi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/memory/Kconfig
index be69c07b8941,e438d79857da..000000000000
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@@ -174,16 -174,15 +174,25 @@@ config PL353_SM
  	  This driver is for the ARM PL351/PL353 Static Memory
  	  Controller(SMC) module.
 =20
+ config RENESAS_RPCIF
+ 	tristate "Renesas RPC-IF driver"
+ 	depends on ARCH_RENESAS
+ 	select REGMAP_MMIO
+ 	help
+ 	  This supports Renesas R-Car Gen3 RPC-IF which provides either SPI
+ 	  host or HyperFlash. You'll have to select individual components
+ 	  under the corresponding menu.
+=20
 +config STM32_FMC2_EBI
 +	tristate "Support for FMC2 External Bus Interface on STM32MP SoCs"
 +	depends on MACH_STM32MP157 || COMPILE_TEST
 +	select MFD_SYSCON
 +	help
 +	  Select this option to enable the STM32 FMC2 External Bus Interface
 +	  controller. This driver configures the transactions with external
 +	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
 +	  SOCs containing the FMC2 External Bus Interface.
 +
  source "drivers/memory/samsung/Kconfig"
  source "drivers/memory/tegra/Kconfig"
 =20
diff --cc drivers/memory/Makefile
index d3d8d6ced342,d105f8ebe8b8..000000000000
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@@ -22,7 -22,7 +22,8 @@@ obj-$(CONFIG_JZ4780_NEMC)	+=3D jz4780-nem
  obj-$(CONFIG_MTK_SMI)		+=3D mtk-smi.o
  obj-$(CONFIG_DA8XX_DDRCTL)	+=3D da8xx-ddrctl.o
  obj-$(CONFIG_PL353_SMC)		+=3D pl353-smc.o
+ obj-$(CONFIG_RENESAS_RPCIF)	+=3D renesas-rpc-if.o
 +obj-$(CONFIG_STM32_FMC2_EBI)	+=3D stm32-fmc2-ebi.o
 =20
  obj-$(CONFIG_SAMSUNG_MC)	+=3D samsung/
  obj-$(CONFIG_TEGRA_MC)		+=3D tegra/

--Sig_/oy0nep/YG9.oD.7jA5usSxT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FTacACgkQAVBC80lX
0GxCUQf+IA49MSifIWTN1d90F+RjckUEh8j/Ovj98n29ZkzaWB9z7jVu4TUwEPS5
AiqCVV4WBruEusSVwoW3+Hxxn34v2ZZ0VEs0dex68F1qf4MO60FfIjARPsq74U0u
8LU3GJ73P7L9f4bqIhUZH4iwu34oYgSIqH+yASNSnZuIybzbaNyUV0nXcjqp40ZF
Pe0OZ+d36RYukuRNfCdfoKoThScBZT4PwgnsO1u/KwF4LlLyruy/izAIbmrKPYtA
WkPnjzS6zgjk7rXcdBHE7m4s8zJ8rv7aoKae+9HH69Mij3PT5hfErXbte/3ylpbf
UyNDC6L2//e0KLEI7WsuV5wLRDQBAw==
=m89a
-----END PGP SIGNATURE-----

--Sig_/oy0nep/YG9.oD.7jA5usSxT--
