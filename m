Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D02368B87
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 05:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbhDWDXN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 23:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbhDWDXL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Apr 2021 23:23:11 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4386FC061574;
        Thu, 22 Apr 2021 20:22:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRKNP1fvVz9sVq;
        Fri, 23 Apr 2021 13:22:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619148153;
        bh=uCyNgkVFKWw9UAqrzW+EPAYN9Ec3dXolNTUn6QdcFsM=;
        h=Date:From:To:Cc:Subject:From;
        b=TE10UIgyv5vjpdrGv+mdoJwInFsNdf+KQI3Ij2guBk5mAaVM+GgzkCvbYI788goyD
         wKR+8LKeVmOFmdquZEkZIExqCZejGCnI/knPyzK1SPgTMi2XiQPSIOSNH/o3Ua6EZp
         DiYFVVjI2vV+Wgk8fBXH8q/nixT2L+vV+4AvCPUwAuKn0UQJRWQ0i0H18K+qqPk82x
         3mZmUOQw3qSTkyU5sJObbvXrXrycv+0XRHRl9ba5T+pWC81G3bxhzn+6YHCY7y4DR9
         27Dpwgy18WG8S4zmSM38JQwm/3RbBZUPwAOTPmdif0J9cMSTRstrVUXzNL/5LWvBNU
         O5L9ghw4Owmyw==
Date:   Fri, 23 Apr 2021 13:22:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: manual merge of the irqchip tree with the arm-soc tree
Message-ID: <20210423132228.643253a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/76iMHhOahzbW8zjvUJk9u7+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/76iMHhOahzbW8zjvUJk9u7+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got conflicts in:

  drivers/irqchip/Kconfig
  drivers/irqchip/Makefile

between commit:

  76cde2639411 ("irqchip/apple-aic: Add support for the Apple Interrupt Con=
troller")

from the arm-soc tree and commit:

  529ea3681811 ("irqchip: Add support for IDT 79rc3243x interrupt controlle=
r")

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
index d3a14f304ec8,18b0d0b33b8b..000000000000
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@@ -577,12 -577,15 +577,23 @@@ config MST_IR
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
+ config IRQ_IDT3243X
+ 	bool
+ 	select GENERIC_IRQ_CHIP
+ 	select IRQ_DOMAIN
+=20
  endmenu
diff --cc drivers/irqchip/Makefile
index eb6a515f0f64,18573602a939..000000000000
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@@ -113,4 -113,5 +113,6 @@@ obj-$(CONFIG_LOONGSON_PCH_MSI)		+=3D irq-
  obj-$(CONFIG_MST_IRQ)			+=3D irq-mst-intc.o
  obj-$(CONFIG_SL28CPLD_INTC)		+=3D irq-sl28cpld.o
  obj-$(CONFIG_MACH_REALTEK_RTL)		+=3D irq-realtek-rtl.o
 +obj-$(CONFIG_APPLE_AIC)			+=3D irq-apple-aic.o
+ obj-$(CONFIG_WPCM450_AIC)		+=3D irq-wpcm450-aic.o
+ obj-$(CONFIG_IRQ_IDT3243X)		+=3D irq-idt3243x.o

--Sig_/76iMHhOahzbW8zjvUJk9u7+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCCPXQACgkQAVBC80lX
0GxWpQf+OxmzZLq0q1fngFWegV82HVMVqtCtk2kMPq2hHhO6nDjDZr2E0Qaun4lr
hC7Si1bcftCZNknax7Eh8k795zIIzupxVGBWZUs6MYiyDHNM8wGdJRyIi2ToIX/+
T5CiYJI7OkbJRez0IPm7gj2t7K0JD4/Z1STac/xICsqDYAdHgHA1omZ1Nto8NSP3
TlCvXyHOiZqUnxauZXodlWYZJzlPFyuSjQUuBLycNjD/+k6iBboKaGCpVIvHwgUi
x5SyPREsBMqSRNo1Uswd6RraIK69t2u3BQK8YkC+aDWMM8vt/Wpg8/LYl2A6YHZA
gdsSdidHImHAQmlWMYaTjZb2oHh0Yg==
=z599
-----END PGP SIGNATURE-----

--Sig_/76iMHhOahzbW8zjvUJk9u7+--
