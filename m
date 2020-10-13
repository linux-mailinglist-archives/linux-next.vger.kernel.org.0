Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F73D28C92F
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 09:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390011AbgJMHYY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 03:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389874AbgJMHYY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 03:24:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0173FC0613D0;
        Tue, 13 Oct 2020 00:24:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Rr14YpBz9sTf;
        Tue, 13 Oct 2020 18:24:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602573858;
        bh=5v34ml565IrzQr1nr2/p7n95pD/pWe7WF7gUCqqLewA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A9XyPoPt54lIBbHssH3QnmerxRo5Yhiqfc/df0ao5JaUhGdwD3LIzy0mgfbxDgzaZ
         OZvn/Zh02GdO8yqLxLQxEd8VsAR5USbD9JVZ2nbiOutmZ/abRhxRwFvbMztTiu4ENm
         DL0/f2RawWKBsLYnOvuC0ML8RmY2AlwHj0N2EtHvpRIP9ePfMmT8fU5FS4L2Slkgl6
         SyZGKDQpDIIURNWOHf3yCpMhJcCVEsSVQhzCqyE/sFswSl6ngY99EkV7BmeX1n1WLo
         r6+J2HDxVVCKq84icbHuLlwM/fJG+tgxDICPiwun0YesLq9jVAPeajzijQcORmsrYK
         numWSFTsdFP2g==
Date:   Tue, 13 Oct 2020 18:24:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg Ungerer <gerg@snapgear.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k
 tree
Message-ID: <20201013182416.2cb8ecaf@canb.auug.org.au>
In-Reply-To: <20200910093437.4098988b@canb.auug.org.au>
References: <20200910093437.4098988b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IUdstK6WEU=FI6tW9f5Bjaa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IUdstK6WEU=FI6tW9f5Bjaa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Sep 2020 09:34:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the m68knommu tree got a conflict in:
>=20
>   arch/m68k/Kconfig
>=20
> between commit:
>=20
>   dc072012bc94 ("m68k: Sort selects in main Kconfig")
>=20
> from the m68k tree and commit:
>=20
>   ef03e4545eac ("m68knommu: switch to using asm-generic/uaccess.h")
>=20
> from the m68knommu tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/m68k/Kconfig
> index 93bbb74ea876,aefffebc0afa..000000000000
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@@ -6,32 -6,33 +6,33 @@@ config M68
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
>  +	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>   	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>   	select ARCH_NO_PREEMPT if !COLDFIRE
>  +	select ARCH_WANT_IPC_PARSE_VERSION
>   	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>   	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
>  -	select HAVE_IDE
>  -	select HAVE_AOUT if MMU
>  -	select HAVE_ASM_MODVERSIONS
>  -	select HAVE_DEBUG_BUGVERBOSE
>  -	select GENERIC_IRQ_SHOW
>   	select GENERIC_ATOMIC64
>  -	select NO_DMA if !MMU && !COLDFIRE
>  -	select HAVE_UID16
>  -	select VIRT_TO_BUS
>  -	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>   	select GENERIC_CPU_DEVICES
>   	select GENERIC_IOMAP
>  +	select GENERIC_IRQ_SHOW
>   	select GENERIC_STRNCPY_FROM_USER if MMU
>   	select GENERIC_STRNLEN_USER if MMU
>  -	select UACCESS_MEMCPY if !MMU
>  -	select ARCH_WANT_IPC_PARSE_VERSION
>  +	select HAVE_AOUT if MMU
>  +	select HAVE_ASM_MODVERSIONS
>  +	select HAVE_DEBUG_BUGVERBOSE
>   	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
>  +	select HAVE_IDE
>   	select HAVE_MOD_ARCH_SPECIFIC
>  +	select HAVE_UID16
>  +	select MMU_GATHER_NO_RANGE if MMU
>   	select MODULES_USE_ELF_REL
>   	select MODULES_USE_ELF_RELA
>  -	select OLD_SIGSUSPEND3
>  +	select NO_DMA if !MMU && !COLDFIRE
>   	select OLD_SIGACTION
>  -	select MMU_GATHER_NO_RANGE if MMU
>  +	select OLD_SIGSUSPEND3
> ++	select UACCESS_MEMCPY if !MMU
>  +	select VIRT_TO_BUS
>  =20
>   config CPU_BIG_ENDIAN
>   	def_bool y

This is now a conflict between the m68knommu tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IUdstK6WEU=FI6tW9f5Bjaa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FViAACgkQAVBC80lX
0Gy1jQf/ZJsYPcEGfTnxeX9qr+pZcNje9wmWy2BARyrbd/Fr2m7sKQfycTMTm0/D
sBrwhewXQauEuVXdEDpkTTDEUAZSaUN4Ypr7lEyWqA4ff3ILO72C32cUd7fnMMWc
8yVWKM5X5Z1e/yJ7ny2L/S3G/I+vkulAGBbF1DVsdVducxrhVbUm0NGPRnjA/2w+
zywmhYIAHwhZ9y19nbDu5xF6buib167HVwGJmpQcBqEKBM+0EfCPdNLqyYleBukY
uiN5t1yyUHHhrE+vykRfd5AXdUDSIxBfCppRuv3EVDife1uN2YTOAeRpsWdvnSSI
CECEWMMtZis5Z2EYyrxkz43a/K4axQ==
=WKO5
-----END PGP SIGNATURE-----

--Sig_/IUdstK6WEU=FI6tW9f5Bjaa--
