Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EE8359503
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 07:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhDIFxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 01:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhDIFxS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 01:53:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AE7C061760;
        Thu,  8 Apr 2021 22:53:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGnNV3XZNz9sVt;
        Fri,  9 Apr 2021 15:52:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617947581;
        bh=IaFcgmo34MevFgJEiDdEWLgJGrX80AspYRHdVxy95BY=;
        h=Date:From:To:Cc:Subject:From;
        b=cBPvYJmvIGCfR+9UYo4jUbqUad9/KJK3Hv0AHpoK8+O/P9wm07eHZNL5uTiUEviCa
         dMDnrOQ3A3UKOg8JlWytJbrOKNOV+bAC3v5OtvTXBeYrVsEQe1mxk0P4IbKfahrHLZ
         sPn6a3QnZUxNEHI4hQH4L5De9pbuX+gn7bXc8g+lmQp6dbkvX43VMihk3mLWsUWLj5
         n1r+McBbj/Xg99leTwejje8zP/Jd6JPiT1zIFnWlq7/XbWwlk5wDpGdnX/EdljqF5k
         o99A4wt9GNaRodn8hUp7T5ARqnQcyIq3itK8K7HWvZEkaj8HF5hgB1bfsYw8E+959n
         m0MaeSY3NqR5Q==
Date:   Fri, 9 Apr 2021 15:52:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the irqchip tree with the arm-soc tree
Message-ID: <20210409155257.47f66922@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2eOj.BXS5/MD4uPbvks.LUb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2eOj.BXS5/MD4uPbvks.LUb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got conflicts in:

  drivers/irqchip/Kconfig
  drivers/irqchip/Makefile

between commit:

  76cde2639411 ("irqchip/apple-aic: Add support for the Apple Interrupt Con=
troller")

from the arm-soc tree and commits:

  fead4dd49663 ("irqchip: Add driver for WPCM450 interrupt controller")
  94bc94209a66 ("irqchip/wpcm450: Drop COMPILE_TEST")

from the irqchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/Kconfig
index d3a14f304ec8,715eb4366e35..000000000000
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@@ -577,12 -577,10 +577,18 @@@ config MST_IR
  	help
  	  Support MStar Interrupt Controller.
 =20
 +config APPLE_AIC
 +	bool "Apple Interrupt Controller (AIC)"
 +	depends on ARM64
 +	default ARCH_APPLE
 +	help
 +	  Support for the Apple Interrupt Controller found on Apple Silicon SoCs,
 +	  such as the M1.
 +
+ config WPCM450_AIC
+ 	bool "Nuvoton WPCM450 Advanced Interrupt Controller"
+ 	depends on ARCH_WPCM450
+ 	help
+ 	  Support for the interrupt controller in the Nuvoton WPCM450 BMC SoC.
+=20
  endmenu
diff --cc drivers/irqchip/Makefile
index eb6a515f0f64,bef57937e729..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -113,4 -113,4 +113,5 @@@ obj-$(CONFIG_LOONGSON_PCH_MSI)		+=3D irq-
  obj-$(CONFIG_MST_IRQ)			+=3D irq-mst-intc.o
  obj-$(CONFIG_SL28CPLD_INTC)		+=3D irq-sl28cpld.o
  obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D irq-realtek-rtl.o
 +obj-$(CONFIG_APPLE_AIC)			+=3D irq-apple-aic.o
+ obj-$(CONFIG_WPCM450_AIC)		+=3D irq-wpcm450-aic.o

--Sig_/2eOj.BXS5/MD4uPbvks.LUb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBv67kACgkQAVBC80lX
0GziJAgAoeen9yM/lJRroL8vT1E55OTu83NjisHKt3y6nzsHSsDvCmiu+dSdEN8T
42EHeu27Ylw3rhTG4B61eRMRZIBXm/uwoa8/QkP8NmSQ0SmsnwSW2puJ0LCunt4+
43Kiw7OVb+EVY83zsKio5dcE/kNyK2YKe05VbNzxnEZiYJx4XiYrJaYJijgCSlQe
mPmLRzYdcCqC6MbnvtayYMMzcFO8dGjLb+6TDnBlj7P3SadMnpLeXZQ73C8FX7pg
Ez0IAH+AS8slmTTND8YwyPpa9A+jZeAdaRFy7m8augnfMTUcDbFbSTvYKGCRW6QV
OQWahZhgHLhBOZw4Lb+BpUswGBAD4A==
=UxOT
-----END PGP SIGNATURE-----

--Sig_/2eOj.BXS5/MD4uPbvks.LUb--
