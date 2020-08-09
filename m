Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D2A23FD70
	for <lists+linux-next@lfdr.de>; Sun,  9 Aug 2020 10:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgHIItY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 04:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgHIItY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Aug 2020 04:49:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102CEC061756;
        Sun,  9 Aug 2020 01:49:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPXp853M6z9sPC;
        Sun,  9 Aug 2020 18:49:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596962962;
        bh=vmcF6JaVB9YzsYbgxV6MclWx9ms91mROlIX4Wr3RmNA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uCaDYJO4JvWv7j5T+6hWT67aVyY3Q/y+eqs5kpBjW08xUdC6oT+Il0xzqV/1myA37
         TkfcWTFz51mipouREBGM6xWwrJrt91Odt/GGM1CE0dSWnHSaQusHaK/+/zjZy48CB8
         LbipFVdZXyAtDg50LBVogkxnjOdrtqpbomspzk7EaRvOHOmQfIQeX9ZmQ2dv0rw7gr
         Okr72dSiDHEV+5YYavGpKkhZvmovGOKj0ihqqP+91PW7ZAQgD1zq03RlrOjXX/kqff
         oc+QHRliP6uNB5z6maXFdh3QrvcCHjX7T65keinGjIX4DSLJh1CkAY0ndr9kpcPBem
         47RrPWkHBzcQg==
Date:   Sun, 9 Aug 2020 18:49:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@st.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: manual merge of the spi tree with the mtd tree
Message-ID: <20200809184919.2621b652@canb.auug.org.au>
In-Reply-To: <20200708143759.50246487@canb.auug.org.au>
References: <20200708143759.50246487@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r.1rXCEyQYA9h2viBzClPFN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r.1rXCEyQYA9h2viBzClPFN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 8 Jul 2020 14:37:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the spi tree got conflicts in:
>=20
>   drivers/memory/Kconfig
>   drivers/memory/Makefile
>=20
> between commit:
>=20
>   66b8173a197f ("memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller dr=
iver")
>=20
> from the mtd tree and commit:
>=20
>   ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
>=20
> from the spi tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/memory/Kconfig
> index be69c07b8941,e438d79857da..000000000000
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@@ -174,16 -174,15 +174,25 @@@ config PL353_SM
>   	  This driver is for the ARM PL351/PL353 Static Memory
>   	  Controller(SMC) module.
>  =20
> + config RENESAS_RPCIF
> + 	tristate "Renesas RPC-IF driver"
> + 	depends on ARCH_RENESAS
> + 	select REGMAP_MMIO
> + 	help
> + 	  This supports Renesas R-Car Gen3 RPC-IF which provides either SPI
> + 	  host or HyperFlash. You'll have to select individual components
> + 	  under the corresponding menu.
> +=20
>  +config STM32_FMC2_EBI
>  +	tristate "Support for FMC2 External Bus Interface on STM32MP SoCs"
>  +	depends on MACH_STM32MP157 || COMPILE_TEST
>  +	select MFD_SYSCON
>  +	help
>  +	  Select this option to enable the STM32 FMC2 External Bus Interface
>  +	  controller. This driver configures the transactions with external
>  +	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>  +	  SOCs containing the FMC2 External Bus Interface.
>  +
>   source "drivers/memory/samsung/Kconfig"
>   source "drivers/memory/tegra/Kconfig"
>  =20
> diff --cc drivers/memory/Makefile
> index d3d8d6ced342,d105f8ebe8b8..000000000000
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@@ -22,7 -22,7 +22,8 @@@ obj-$(CONFIG_JZ4780_NEMC)	+=3D jz4780-nem
>   obj-$(CONFIG_MTK_SMI)		+=3D mtk-smi.o
>   obj-$(CONFIG_DA8XX_DDRCTL)	+=3D da8xx-ddrctl.o
>   obj-$(CONFIG_PL353_SMC)		+=3D pl353-smc.o
> + obj-$(CONFIG_RENESAS_RPCIF)	+=3D renesas-rpc-if.o
>  +obj-$(CONFIG_STM32_FMC2_EBI)	+=3D stm32-fmc2-ebi.o
>  =20
>   obj-$(CONFIG_SAMSUNG_MC)	+=3D samsung/
>   obj-$(CONFIG_TEGRA_MC)		+=3D tegra/

This is now a conflict between the mtd tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/r.1rXCEyQYA9h2viBzClPFN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8vuJAACgkQAVBC80lX
0GztAAf/Qx5eYoviXZc8UooMN1qeo1ukp95ixUhNQ1u9NsOfx6uoV++c1iYSFgry
YzunnpDyPl/b882JCHW87aMIhPXq+tvhKOwmcQLWX/OWsLAH53MI3XPT9+EDsIoX
5w/Xrh04kmLL7kHwBttbHkMXpp6h5WxyVBuhgRMmQgrSGA5OWfX5/Dp/L0ch8rbu
gwqGjFQF7K1TyuCabLUewmA4KzO0PWXUn2KCxhPnR53YprTHiKP64Ya7HmmObqko
QkrnuXplniGbtkU6rIR00H4lTs0GdiYTjMI0jaa7Ocf3PWjOe/gFYOyK5el+glvK
28/1xIXlJ9adp9OKF1uedK84qpq5sg==
=ryR0
-----END PGP SIGNATURE-----

--Sig_/r.1rXCEyQYA9h2viBzClPFN--
