Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA6F30B276
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 23:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhBAWCZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 17:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhBAWCW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 17:02:22 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAC2C061573;
        Mon,  1 Feb 2021 14:01:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DV23404Gdz9sWK;
        Tue,  2 Feb 2021 09:01:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612216898;
        bh=Z/E7/rh7iCFGXJ8hnViEZGF0FoCwkY3iql5unOXlC8w=;
        h=Date:From:To:Cc:Subject:From;
        b=hqvHiLRv9Nn21+MNm+eSiUYb/In93jQPHbebE1JfdYcwU9cMfdr5HphJm5gvcLQf7
         mOeNolswp84ObwjB/5Ela3t7dp3XmZhNT049cFAwUGBK5cOxKnFmFM9x1zyOPcRa2o
         rulIS4sAdOvHtZ7k0xiyq2pmYtzfGkRA3FiIhhTww9gcrTiyeDyz2BAn3fAj1PJ7IS
         bt3pafHOvdnswBWAUzbMjtnmKC5t00K8HrO8e/kw9TBaK5FB5MpS9LVYm51KGlY0Od
         FBBjc6RKM9IBHTnkMLAvxgS8tJIEfMFojEkeWpchDFyaxgRLkUBdXdgntzFJidBVUQ
         qfebNlbXp9fpg==
Date:   Tue, 2 Feb 2021 09:01:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Alain VOLMAT <avolmat@me.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the arm-soc tree with the arm tree
Message-ID: <20210202090135.04b9890e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e5vldlu6gC9wfkh8O_h3oLE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e5vldlu6gC9wfkh8O_h3oLE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/Kconfig.debug

between commits:

  9ca4efec0aba ("ARM: 9040/1: use DEBUG_UART_PHYS and DEBUG_UART_VIRT for s=
ti LL_UART")
  6e959ad8bb90 ("ARM: 9041/1: sti LL_UART: add STiH418 SBC UART0 support")

from the arm tree and commits:

  f3a732843acc ("ARM: remove sirf prima2/atlas platforms")
  89d4f98ae90d ("ARM: remove zte zx platform")

from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/Kconfig.debug
index 7a8697a97c98,c36c5d4c6e9c..000000000000
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@@ -1623,10 -1546,7 +1550,9 @@@ config DEBUG_LL_INCLUD
  	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
  	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
  	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
- 	default "debug/sirf.S" if DEBUG_SIRFSOC_UART
 -	default "debug/sti.S" if DEBUG_STI_UART
 +	default "debug/sti.S" if DEBUG_STIH41X_ASC2
 +	default "debug/sti.S" if DEBUG_STIH41X_SBC_ASC1
 +	default "debug/sti.S" if DEBUG_STIH418_SBC_ASC0
  	default "debug/stm32.S" if DEBUG_STM32_UART
  	default "debug/tegra.S" if DEBUG_TEGRA_UART
  	default "debug/ux500.S" if DEBUG_UX500_UART
@@@ -1659,8 -1579,6 +1585,7 @@@ config DEBUG_UART_PHY
  	default 0x02531000 if DEBUG_KEYSTONE_UART1
  	default 0x03010fe0 if ARCH_RPC
  	default 0x07000000 if DEBUG_SUN9I_UART0
- 	default 0x09405000 if DEBUG_ZTE_ZX
 +	default 0x09530000 if DEBUG_STIH418_SBC_ASC0
  	default 0x10009000 if DEBUG_REALVIEW_STD_PORT || \
  				DEBUG_VEXPRESS_UART0_CA9
  	default 0x1010c000 if DEBUG_REALVIEW_PB1176_PORT
@@@ -1789,10 -1698,8 +1707,10 @@@
  		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
  		DEBUG_S3C64XX_UART || \
  		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
- 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
+ 		DEBUG_DIGICOLOR_UA0 || \
 -		DEBUG_AT91_UART || DEBUG_STM32_UART
 +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 +		DEBUG_STIH418_SBC_ASC0
 =20
  config DEBUG_UART_VIRT
  	hex "Virtual base address of debug UART"
@@@ -1854,12 -1760,9 +1772,11 @@@
  	default 0xfb020000 if DEBUG_OMAP3UART3
  	default 0xfb042000 if DEBUG_OMAP3UART4
  	default 0xfb10c000 if DEBUG_REALVIEW_PB1176_PORT
- 	default 0xfc705000 if DEBUG_ZTE_ZX
  	default 0xfcfe8600 if DEBUG_BCM63XX_UART
  	default 0xfd000000 if DEBUG_SPEAR3XX || DEBUG_SPEAR13XX
 +	default 0xfd531000 if DEBUG_STIH41X_SBC_ASC1
  	default 0xfd883000 if DEBUG_ALPINE_UART0
 +	default 0xfdd32000 if DEBUG_STIH41X_ASC2
  	default 0xfe010000 if STM32MP1_DEBUG_UART
  	default 0xfe017000 if DEBUG_MMP_UART2
  	default 0xfe018000 if DEBUG_MMP_UART3
@@@ -1904,10 -1802,8 +1816,10 @@@
  		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
  		DEBUG_S3C64XX_UART || \
  		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
- 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
+ 		DEBUG_DIGICOLOR_UA0 || \
 -		DEBUG_AT91_UART || DEBUG_STM32_UART
 +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
 +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
 +		DEBUG_STIH418_SBC_ASC0
 =20
  config DEBUG_UART_8250_SHIFT
  	int "Register offset shift for the 8250 debug UART"

--Sig_/e5vldlu6gC9wfkh8O_h3oLE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAYej8ACgkQAVBC80lX
0GxiDAf/Qi2bl+m+y6HIO8uHEV6clrkJy4L8FZue19CRol4iVs3Jexu2rbs2CteO
rQgv5TX/59iZIvnqgpNLhhoh6wgKXKgNiXnPKfegmzl/1LdTbS6NIuIKxWjD/EXK
NseWGjUJkndRiBMJanbVckzBvMdLZrgoHKe4dW9NY5rNIUbEJhMoMEwB4Cq7NamP
vi6GdiC69x8O/LMef2qth/DPJGyAQIuBPtnbiiUuXOz6Oo4O6NfgxorwPEXQBzrh
5hMf50PeIppLlUpvzLY4RE2Yae58ldXw9cfpWUuv0tbUQNZNm0HPjP5Vdil4+LJW
k+cr3BdKcrtlpS+JOEgb8ovGSxJoXg==
=xgkX
-----END PGP SIGNATURE-----

--Sig_/e5vldlu6gC9wfkh8O_h3oLE--
