Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C99422779D
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 06:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgGUE2z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 00:28:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38733 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgGUE2z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 00:28:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9lwJ1slYz9sRR;
        Tue, 21 Jul 2020 14:28:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595305730;
        bh=91WFzPEefhKLKMfP1BJFRHM/dzkdTxB3Wion0WWI7Ro=;
        h=Date:From:To:Cc:Subject:From;
        b=kWAnq1pz86jpMhs5cbSPQrfSBsvbZ9gtu241uhTRsl+4ayw2wsgTFI1aBYncSXIbJ
         Vzl+ylJVsXIc4ABwpenqnTS48xV3FTiyUEURRsuRaz1A5jsjUSRbVROCnYlIoBL5/E
         EJ7gshfxN4B0TtZKMGV8n6Q1XfEkhlXY7QFNU86tmWtuunXJlCPr3XFOazttW0TBll
         rYC2OqlEkucF9SpVbSwAo8hRSSsBR7Czdu4PfewIzX0Dbe2pnDxOcyksb4QqgYzHiU
         fMNRl9B10MaMmJNlkFID2mn4/umimah8YsGU0o5/xcUVEnYJN4vCmyBNXSybUIPv8o
         VlWlludng4YGA==
Date:   Tue, 21 Jul 2020 14:28:45 +1000
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
Subject: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200721142845.76ebea00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.j5GyyiXptkUvHOgZllA5Tt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.j5GyyiXptkUvHOgZllA5Tt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/inst.h

between commit:

  d7866e503bdc ("crypto: x86 - Remove include/asm/inst.h")
(also "crypto: x86 - Put back integer parts of include/asm/inst.h"
which I have added to the crypto tree merge today)

from the crypto tree and commit:

  eaad981291ee ("x86/entry/64: Introduce the FIND_PERCPU_BASE macro")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/inst.h
index 438ccd4f3cc4,d063841a17e3..000000000000
--- a/arch/x86/include/asm/inst.h
+++ b/arch/x86/include/asm/inst.h
@@@ -143,6 -203,124 +143,21 @@@
  	.macro MODRM mod opd1 opd2
  	.byte \mod | (\opd1 & 7) | ((\opd2 & 7) << 3)
  	.endm
+=20
 -	.macro PSHUFB_XMM xmm1 xmm2
 -	XMM_NUM pshufb_opd1 \xmm1
 -	XMM_NUM pshufb_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX pshufb_opd1 pshufb_opd2
 -	.byte 0x0f, 0x38, 0x00
 -	MODRM 0xc0 pshufb_opd1 pshufb_opd2
 -	.endm
 -
 -	.macro PCLMULQDQ imm8 xmm1 xmm2
 -	XMM_NUM clmul_opd1 \xmm1
 -	XMM_NUM clmul_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX clmul_opd1 clmul_opd2
 -	.byte 0x0f, 0x3a, 0x44
 -	MODRM 0xc0 clmul_opd1 clmul_opd2
 -	.byte \imm8
 -	.endm
 -
 -	.macro PEXTRD imm8 xmm gpr
 -	R32_NUM extrd_opd1 \gpr
 -	XMM_NUM extrd_opd2 \xmm
 -	PFX_OPD_SIZE
 -	PFX_REX extrd_opd1 extrd_opd2
 -	.byte 0x0f, 0x3a, 0x16
 -	MODRM 0xc0 extrd_opd1 extrd_opd2
 -	.byte \imm8
 -	.endm
 -
 -	.macro AESKEYGENASSIST rcon xmm1 xmm2
 -	XMM_NUM aeskeygen_opd1 \xmm1
 -	XMM_NUM aeskeygen_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aeskeygen_opd1 aeskeygen_opd2
 -	.byte 0x0f, 0x3a, 0xdf
 -	MODRM 0xc0 aeskeygen_opd1 aeskeygen_opd2
 -	.byte \rcon
 -	.endm
 -
 -	.macro AESIMC xmm1 xmm2
 -	XMM_NUM aesimc_opd1 \xmm1
 -	XMM_NUM aesimc_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aesimc_opd1 aesimc_opd2
 -	.byte 0x0f, 0x38, 0xdb
 -	MODRM 0xc0 aesimc_opd1 aesimc_opd2
 -	.endm
 -
 -	.macro AESENC xmm1 xmm2
 -	XMM_NUM aesenc_opd1 \xmm1
 -	XMM_NUM aesenc_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aesenc_opd1 aesenc_opd2
 -	.byte 0x0f, 0x38, 0xdc
 -	MODRM 0xc0 aesenc_opd1 aesenc_opd2
 -	.endm
 -
 -	.macro AESENCLAST xmm1 xmm2
 -	XMM_NUM aesenclast_opd1 \xmm1
 -	XMM_NUM aesenclast_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aesenclast_opd1 aesenclast_opd2
 -	.byte 0x0f, 0x38, 0xdd
 -	MODRM 0xc0 aesenclast_opd1 aesenclast_opd2
 -	.endm
 -
 -	.macro AESDEC xmm1 xmm2
 -	XMM_NUM aesdec_opd1 \xmm1
 -	XMM_NUM aesdec_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aesdec_opd1 aesdec_opd2
 -	.byte 0x0f, 0x38, 0xde
 -	MODRM 0xc0 aesdec_opd1 aesdec_opd2
 -	.endm
 -
 -	.macro AESDECLAST xmm1 xmm2
 -	XMM_NUM aesdeclast_opd1 \xmm1
 -	XMM_NUM aesdeclast_opd2 \xmm2
 -	PFX_OPD_SIZE
 -	PFX_REX aesdeclast_opd1 aesdeclast_opd2
 -	.byte 0x0f, 0x38, 0xdf
 -	MODRM 0xc0 aesdeclast_opd1 aesdeclast_opd2
 -	.endm
 -
 -	.macro MOVQ_R64_XMM opd1 opd2
 -	REG_TYPE movq_r64_xmm_opd1_type \opd1
 -	.if movq_r64_xmm_opd1_type =3D=3D REG_TYPE_XMM
 -	XMM_NUM movq_r64_xmm_opd1 \opd1
 -	R64_NUM movq_r64_xmm_opd2 \opd2
 -	.else
 -	R64_NUM movq_r64_xmm_opd1 \opd1
 -	XMM_NUM movq_r64_xmm_opd2 \opd2
 -	.endif
 -	PFX_OPD_SIZE
 -	PFX_REX movq_r64_xmm_opd1 movq_r64_xmm_opd2 1
 -	.if movq_r64_xmm_opd1_type =3D=3D REG_TYPE_XMM
 -	.byte 0x0f, 0x7e
 -	.else
 -	.byte 0x0f, 0x6e
 -	.endif
 -	MODRM 0xc0 movq_r64_xmm_opd1 movq_r64_xmm_opd2
 -	.endm
 -
+ .macro RDPID opd
+ 	REG_TYPE rdpid_opd_type \opd
+ 	.if rdpid_opd_type =3D=3D REG_TYPE_R64
+ 	R64_NUM rdpid_opd \opd
+ 	.else
+ 	R32_NUM rdpid_opd \opd
+ 	.endif
+ 	.byte 0xf3
+ 	.if rdpid_opd > 7
+ 	PFX_REX rdpid_opd 0
+ 	.endif
+ 	.byte 0x0f, 0xc7
+ 	MODRM 0xc0 rdpid_opd 0x7
+ .endm
  #endif
 =20
  #endif

--Sig_/.j5GyyiXptkUvHOgZllA5Tt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8Wbv0ACgkQAVBC80lX
0GwF9AgAoLS/9jvFh/rnKXxK4krQcPJ2szSjyyirbG93jA+Du/PmifMQbsguzz4W
Ehn1ok5UZHDcmCeFonhvt08qaDQwCEaQh/OEgOj8bMP7XZGgWms6592/JPgEMS4y
bNfVJEotq9GZRvqhkuzKA1SvyS27XTADciV+mDjRjkvcr0bjHCa5xLkxD7KZQAUJ
I23GHAM1TrFNO9DRHX71z/VNptaTqFiUWRlteF3CcQj3qekg8u7HOJHdc6weUMa8
CxS+fqtoZjvHjajDr+bkCV7Khdvzac5GMkIbl8jxx/8XtAY8NI3srEurzFEkgnoP
dZtf54ZOgLyt2IZetl5uEvjiwpMhaA==
=qlGn
-----END PGP SIGNATURE-----

--Sig_/.j5GyyiXptkUvHOgZllA5Tt--
