Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A59523B010
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 00:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgHCWOK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 Aug 2020 18:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgHCWOK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2020 18:14:10 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC702C06174A;
        Mon,  3 Aug 2020 15:14:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLBxR6lfvz9sPB;
        Tue,  4 Aug 2020 08:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596492846;
        bh=lYLzjr0HX8elyz+00XdoFpD1LhEARVr2JZiEjrsAt3w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DHniTPFJ3B10mLNaSFTYYk8Oz1DkRVr6zKIwC3Nxgm4sFyr+JISIv9kD7+izdld7z
         bfw+fRVL1sIsQ+gFxqaoqe//nS2DDKiZJ3rDngaxa6SMrQ1p9qZcyYjDb+onE04Dw+
         SUfJcppQyGGTPjlumoD9lU02t9OdMrEhlfaCreMf4FSmP0TAZ6zbTw5H1UTKwPCc6t
         JmKdqTuUiiW9P8y+Moa534BZfYD5V+AKWYRm3hV01S9p78VK5baXjW5K16/tCZ6jNR
         KP4JGSVl4yfwNeMG6uyIxqhtC6ZCSCs+JKZ2gA70z8LCxR2n5lIvORI4jEipYMVJYg
         537obbLq22eIg==
Date:   Tue, 4 Aug 2020 08:14:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Uros Bizjak <ubizjak@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200804081402.70e81d3b@canb.auug.org.au>
In-Reply-To: <20200721142845.76ebea00@canb.auug.org.au>
References: <20200721142845.76ebea00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZwFxpJzp8mP/1A=GLsWUAkq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZwFxpJzp8mP/1A=GLsWUAkq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Jul 2020 14:28:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/include/asm/inst.h
>=20
> between commit:
>=20
>   d7866e503bdc ("crypto: x86 - Remove include/asm/inst.h")
> (also "crypto: x86 - Put back integer parts of include/asm/inst.h"
> which I have added to the crypto tree merge today)
>=20
> from the crypto tree and commit:
>=20
>   eaad981291ee ("x86/entry/64: Introduce the FIND_PERCPU_BASE macro")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/x86/include/asm/inst.h
> index 438ccd4f3cc4,d063841a17e3..000000000000
> --- a/arch/x86/include/asm/inst.h
> +++ b/arch/x86/include/asm/inst.h
> @@@ -143,6 -203,124 +143,21 @@@
>   	.macro MODRM mod opd1 opd2
>   	.byte \mod | (\opd1 & 7) | ((\opd2 & 7) << 3)
>   	.endm
> +=20
>  -	.macro PSHUFB_XMM xmm1 xmm2
>  -	XMM_NUM pshufb_opd1 \xmm1
>  -	XMM_NUM pshufb_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX pshufb_opd1 pshufb_opd2
>  -	.byte 0x0f, 0x38, 0x00
>  -	MODRM 0xc0 pshufb_opd1 pshufb_opd2
>  -	.endm
>  -
>  -	.macro PCLMULQDQ imm8 xmm1 xmm2
>  -	XMM_NUM clmul_opd1 \xmm1
>  -	XMM_NUM clmul_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX clmul_opd1 clmul_opd2
>  -	.byte 0x0f, 0x3a, 0x44
>  -	MODRM 0xc0 clmul_opd1 clmul_opd2
>  -	.byte \imm8
>  -	.endm
>  -
>  -	.macro PEXTRD imm8 xmm gpr
>  -	R32_NUM extrd_opd1 \gpr
>  -	XMM_NUM extrd_opd2 \xmm
>  -	PFX_OPD_SIZE
>  -	PFX_REX extrd_opd1 extrd_opd2
>  -	.byte 0x0f, 0x3a, 0x16
>  -	MODRM 0xc0 extrd_opd1 extrd_opd2
>  -	.byte \imm8
>  -	.endm
>  -
>  -	.macro AESKEYGENASSIST rcon xmm1 xmm2
>  -	XMM_NUM aeskeygen_opd1 \xmm1
>  -	XMM_NUM aeskeygen_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aeskeygen_opd1 aeskeygen_opd2
>  -	.byte 0x0f, 0x3a, 0xdf
>  -	MODRM 0xc0 aeskeygen_opd1 aeskeygen_opd2
>  -	.byte \rcon
>  -	.endm
>  -
>  -	.macro AESIMC xmm1 xmm2
>  -	XMM_NUM aesimc_opd1 \xmm1
>  -	XMM_NUM aesimc_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aesimc_opd1 aesimc_opd2
>  -	.byte 0x0f, 0x38, 0xdb
>  -	MODRM 0xc0 aesimc_opd1 aesimc_opd2
>  -	.endm
>  -
>  -	.macro AESENC xmm1 xmm2
>  -	XMM_NUM aesenc_opd1 \xmm1
>  -	XMM_NUM aesenc_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aesenc_opd1 aesenc_opd2
>  -	.byte 0x0f, 0x38, 0xdc
>  -	MODRM 0xc0 aesenc_opd1 aesenc_opd2
>  -	.endm
>  -
>  -	.macro AESENCLAST xmm1 xmm2
>  -	XMM_NUM aesenclast_opd1 \xmm1
>  -	XMM_NUM aesenclast_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aesenclast_opd1 aesenclast_opd2
>  -	.byte 0x0f, 0x38, 0xdd
>  -	MODRM 0xc0 aesenclast_opd1 aesenclast_opd2
>  -	.endm
>  -
>  -	.macro AESDEC xmm1 xmm2
>  -	XMM_NUM aesdec_opd1 \xmm1
>  -	XMM_NUM aesdec_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aesdec_opd1 aesdec_opd2
>  -	.byte 0x0f, 0x38, 0xde
>  -	MODRM 0xc0 aesdec_opd1 aesdec_opd2
>  -	.endm
>  -
>  -	.macro AESDECLAST xmm1 xmm2
>  -	XMM_NUM aesdeclast_opd1 \xmm1
>  -	XMM_NUM aesdeclast_opd2 \xmm2
>  -	PFX_OPD_SIZE
>  -	PFX_REX aesdeclast_opd1 aesdeclast_opd2
>  -	.byte 0x0f, 0x38, 0xdf
>  -	MODRM 0xc0 aesdeclast_opd1 aesdeclast_opd2
>  -	.endm
>  -
>  -	.macro MOVQ_R64_XMM opd1 opd2
>  -	REG_TYPE movq_r64_xmm_opd1_type \opd1
>  -	.if movq_r64_xmm_opd1_type =3D=3D REG_TYPE_XMM
>  -	XMM_NUM movq_r64_xmm_opd1 \opd1
>  -	R64_NUM movq_r64_xmm_opd2 \opd2
>  -	.else
>  -	R64_NUM movq_r64_xmm_opd1 \opd1
>  -	XMM_NUM movq_r64_xmm_opd2 \opd2
>  -	.endif
>  -	PFX_OPD_SIZE
>  -	PFX_REX movq_r64_xmm_opd1 movq_r64_xmm_opd2 1
>  -	.if movq_r64_xmm_opd1_type =3D=3D REG_TYPE_XMM
>  -	.byte 0x0f, 0x7e
>  -	.else
>  -	.byte 0x0f, 0x6e
>  -	.endif
>  -	MODRM 0xc0 movq_r64_xmm_opd1 movq_r64_xmm_opd2
>  -	.endm
>  -
> + .macro RDPID opd
> + 	REG_TYPE rdpid_opd_type \opd
> + 	.if rdpid_opd_type =3D=3D REG_TYPE_R64
> + 	R64_NUM rdpid_opd \opd
> + 	.else
> + 	R32_NUM rdpid_opd \opd
> + 	.endif
> + 	.byte 0xf3
> + 	.if rdpid_opd > 7
> + 	PFX_REX rdpid_opd 0
> + 	.endif
> + 	.byte 0x0f, 0xc7
> + 	MODRM 0xc0 rdpid_opd 0x7
> + .endm
>   #endif
>  =20
>   #endif

This is now a conflict between the tip tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZwFxpJzp8mP/1A=GLsWUAkq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ojCoACgkQAVBC80lX
0Gy4TggAo4n/F+3BCqa2LW6vNpuvO/TVZ7JUJJawgRWXcVLfCAipfSKRkvnLJOFB
TTx1DsCquQVQDqpnxAlLV+NJNgo5SOWkm8gbzKzoBzQ3AGkt6HPZrIJNgj5ChPW3
oJubbPxNm/CQ6hB5/y0GIpnNsCdRn/9AAZpox3W8IHIMHtVGGOOsonqNn5Ohb6EX
zNm2VPYuj9safJWHT/apsiuJDmsnEq2GEdO4puiw0tEshjTEaQM2aRYT12jMmiXA
tea8OodsqSPHrAuXx9uGnNSh0qsnVIqcyENnh5s0fIaZrda9bfuVSsNyoQem1idy
IJ76THvvMXK1RGIGQ9DYenK0aB8SGw==
=32Ja
-----END PGP SIGNATURE-----

--Sig_/ZwFxpJzp8mP/1A=GLsWUAkq--
