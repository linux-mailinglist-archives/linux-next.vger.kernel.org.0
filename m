Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536BC31B2FF
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 23:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhBNWPc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 17:15:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229981AbhBNWP3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 14 Feb 2021 17:15:29 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Df1kF4MdKz9sBJ;
        Mon, 15 Feb 2021 09:14:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613340887;
        bh=Yzr/58DAmOqWZia3Ey2f0MWCVwkYSdOreXPqwUwOtOo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NP5dXFlyFTJayyiwjq6xgmTybfY4xMTo8lmjelIhmXHW091Sb6y0vI+vJeEPBzzXV
         ed/Le0qeiwbJWgkCVxdHXRGWZ3aezq2+A5Sbl+rdONCmgFBz/bckZEVUUJkfk4CTW2
         2P3d2rHHkdQ8CwnOMz63ZP14ilTMHAdnH87SJSuokvsFy1upGFydqRaTgZfJMAyEbz
         rkYOAJHhXGEKAivopbPinQFAXujNFbqlzRXt9rrD2eDs5TksMAjJJ2VDfiCxLDlCHn
         eq48IWxY0VYt1V+t8+WSzmqfPyGTBL3IPRFJsSNCVOUPOX0VHq2Qiq2qNRBmwRuok5
         sDRnJe9bsqtWQ==
Date:   Mon, 15 Feb 2021 09:14:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Alain VOLMAT <avolmat@me.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
Message-ID: <20210215091444.3300fb43@canb.auug.org.au>
In-Reply-To: <20210202090135.04b9890e@canb.auug.org.au>
References: <20210202090135.04b9890e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9e+4lyg_1z.sDtrLKSj6=aH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9e+4lyg_1z.sDtrLKSj6=aH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 09:01:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the arm-soc tree got a conflict in:
>=20
>   arch/arm/Kconfig.debug
>=20
> between commits:
>=20
>   9ca4efec0aba ("ARM: 9040/1: use DEBUG_UART_PHYS and DEBUG_UART_VIRT for=
 sti LL_UART")
>   6e959ad8bb90 ("ARM: 9041/1: sti LL_UART: add STiH418 SBC UART0 support")
>=20
> from the arm tree and commits:
>=20
>   f3a732843acc ("ARM: remove sirf prima2/atlas platforms")
>   89d4f98ae90d ("ARM: remove zte zx platform")
>=20
> from the arm-soc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm/Kconfig.debug
> index 7a8697a97c98,c36c5d4c6e9c..000000000000
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@@ -1623,10 -1546,7 +1550,9 @@@ config DEBUG_LL_INCLUD
>   	default "debug/renesas-scif.S" if DEBUG_RMOBILE_SCIFA4
>   	default "debug/s3c24xx.S" if DEBUG_S3C24XX_UART || DEBUG_S3C64XX_UART
>   	default "debug/s5pv210.S" if DEBUG_S5PV210_UART
> - 	default "debug/sirf.S" if DEBUG_SIRFSOC_UART
>  -	default "debug/sti.S" if DEBUG_STI_UART
>  +	default "debug/sti.S" if DEBUG_STIH41X_ASC2
>  +	default "debug/sti.S" if DEBUG_STIH41X_SBC_ASC1
>  +	default "debug/sti.S" if DEBUG_STIH418_SBC_ASC0
>   	default "debug/stm32.S" if DEBUG_STM32_UART
>   	default "debug/tegra.S" if DEBUG_TEGRA_UART
>   	default "debug/ux500.S" if DEBUG_UX500_UART
> @@@ -1659,8 -1579,6 +1585,7 @@@ config DEBUG_UART_PHY
>   	default 0x02531000 if DEBUG_KEYSTONE_UART1
>   	default 0x03010fe0 if ARCH_RPC
>   	default 0x07000000 if DEBUG_SUN9I_UART0
> - 	default 0x09405000 if DEBUG_ZTE_ZX
>  +	default 0x09530000 if DEBUG_STIH418_SBC_ASC0
>   	default 0x10009000 if DEBUG_REALVIEW_STD_PORT || \
>   				DEBUG_VEXPRESS_UART0_CA9
>   	default 0x1010c000 if DEBUG_REALVIEW_PB1176_PORT
> @@@ -1789,10 -1698,8 +1707,10 @@@
>   		DEBUG_RMOBILE_SCIFA4 || DEBUG_S3C24XX_UART || \
>   		DEBUG_S3C64XX_UART || \
>   		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
> - 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
> + 		DEBUG_DIGICOLOR_UA0 || \
>  -		DEBUG_AT91_UART || DEBUG_STM32_UART
>  +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
>  +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
>  +		DEBUG_STIH418_SBC_ASC0
>  =20
>   config DEBUG_UART_VIRT
>   	hex "Virtual base address of debug UART"
> @@@ -1854,12 -1760,9 +1772,11 @@@
>   	default 0xfb020000 if DEBUG_OMAP3UART3
>   	default 0xfb042000 if DEBUG_OMAP3UART4
>   	default 0xfb10c000 if DEBUG_REALVIEW_PB1176_PORT
> - 	default 0xfc705000 if DEBUG_ZTE_ZX
>   	default 0xfcfe8600 if DEBUG_BCM63XX_UART
>   	default 0xfd000000 if DEBUG_SPEAR3XX || DEBUG_SPEAR13XX
>  +	default 0xfd531000 if DEBUG_STIH41X_SBC_ASC1
>   	default 0xfd883000 if DEBUG_ALPINE_UART0
>  +	default 0xfdd32000 if DEBUG_STIH41X_ASC2
>   	default 0xfe010000 if STM32MP1_DEBUG_UART
>   	default 0xfe017000 if DEBUG_MMP_UART2
>   	default 0xfe018000 if DEBUG_MMP_UART3
> @@@ -1904,10 -1802,8 +1816,10 @@@
>   		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
>   		DEBUG_S3C64XX_UART || \
>   		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
> - 		DEBUG_SIRFSOC_UART || DEBUG_DIGICOLOR_UA0 || \
> + 		DEBUG_DIGICOLOR_UA0 || \
>  -		DEBUG_AT91_UART || DEBUG_STM32_UART
>  +		DEBUG_AT91_UART || DEBUG_STM32_UART || \
>  +		DEBUG_STIH41X_ASC2 || DEBUG_STIH41X_SBC_ASC1 || \
>  +		DEBUG_STIH418_SBC_ASC0
>  =20
>   config DEBUG_UART_8250_SHIFT
>   	int "Register offset shift for the 8250 debug UART"

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/9e+4lyg_1z.sDtrLKSj6=aH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApoNQACgkQAVBC80lX
0GzhSgf8CTARtJyTKBw7x6CeU1Ma1w1EFTRn8kkG/HLVhy+7sN9bkfqZP2gRK4xC
m2MrbLvUSZWRO1KbR8/lcr7YtxrLuzEzwq38tP8Pf844wg35DZKJnDwLYdTVBlCn
gGsRly5B96TCQn7AxLC+feSFvnjBq80HqgCBEPD+8hZ06DLXHwCK0nvP7fgTsa0f
UrEP1a4kYfwdWlQelExiGmTR0NG3KF3DXOwg89POFT+GTcH0ZzoqCGtHHUADUOin
ieP76RljooO9agmRzJenI+kLDIK0lVFjhJYiLlF6pjNIWXXprl5tcXAv1db0upe+
ZPbOCN7aCUTTmK7Z4acbFnyXK7wzTA==
=Mjx9
-----END PGP SIGNATURE-----

--Sig_/9e+4lyg_1z.sDtrLKSj6=aH--
