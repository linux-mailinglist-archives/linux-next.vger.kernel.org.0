Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CA822329A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 06:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQErF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 00:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgGQErF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 00:47:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F70C061755;
        Thu, 16 Jul 2020 21:47:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7JW62mKtz9sRW;
        Fri, 17 Jul 2020 14:46:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594961221;
        bh=oWCQWQTnYs63n2+4mU4tRGhEi0v9vBwzy4mhYDlLzps=;
        h=Date:From:To:Cc:Subject:From;
        b=iQ2hIQwVLN+ppQzJbVnKC6uriZjC7QqgkxHAEoqIh0fmFFDhbtf7Jb+ol2sUiSifj
         knTnZj110bd4oQuy/ACTs0Qt1JDInuJ0lSKNj/fh4m5H/YHs1sJpprb/uO37cdQwyT
         ANJigPuKeyQAC3OaF5ePGeHwV2rd3FEUQbANJ+v0+kyOGsdOkXDEiYNAG5S/hntDs2
         /Qo2918at39ql2GmR8R6IPX5f1729epafO0mmHPhCX2W+GvbMzu7npU2REoD2Yil+G
         WW1f1xAvXW5fdHbk64OGwfvguS6S4RlFlUG1VYvBjzE3kEcGP+OhzMrNuhOpdEu4dH
         jfQeeFS7IwjSQ==
Date:   Fri, 17 Jul 2020 14:46:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Uros Bizjak <ubizjak@gmail.com>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200717144656.4bdbf81f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qFh0fIP7XemDn+0mQcZbzqg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qFh0fIP7XemDn+0mQcZbzqg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/inst.h

between commit:

  d7866e503bdc ("crypto: x86 - Remove include/asm/inst.h")

from the crypto tree and commit:

  eaad981291ee ("x86/entry/64: Introduce the FIND_PERCPU_BASE macro")

from the tip tree.

I fixed it up (I brought the file back but removed what the crypto tree
no longer needed - see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I think if the crypto tree brought back this file as well (even without
the RDPID macro, it would make this conflict much more manageable.

/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Generate .byte code for some instructions not supported by old
 * binutils.
 */
#ifndef X86_ASM_INST_H
#define X86_ASM_INST_H

#ifdef __ASSEMBLY__

#define REG_NUM_INVALID		100

#define REG_TYPE_R32		0
#define REG_TYPE_R64		1
#define REG_TYPE_XMM		2
#define REG_TYPE_INVALID	100

	.macro R32_NUM opd r32
	\opd =3D REG_NUM_INVALID
	.ifc \r32,%eax
	\opd =3D 0
	.endif
	.ifc \r32,%ecx
	\opd =3D 1
	.endif
	.ifc \r32,%edx
	\opd =3D 2
	.endif
	.ifc \r32,%ebx
	\opd =3D 3
	.endif
	.ifc \r32,%esp
	\opd =3D 4
	.endif
	.ifc \r32,%ebp
	\opd =3D 5
	.endif
	.ifc \r32,%esi
	\opd =3D 6
	.endif
	.ifc \r32,%edi
	\opd =3D 7
	.endif
#ifdef CONFIG_X86_64
	.ifc \r32,%r8d
	\opd =3D 8
	.endif
	.ifc \r32,%r9d
	\opd =3D 9
	.endif
	.ifc \r32,%r10d
	\opd =3D 10
	.endif
	.ifc \r32,%r11d
	\opd =3D 11
	.endif
	.ifc \r32,%r12d
	\opd =3D 12
	.endif
	.ifc \r32,%r13d
	\opd =3D 13
	.endif
	.ifc \r32,%r14d
	\opd =3D 14
	.endif
	.ifc \r32,%r15d
	\opd =3D 15
	.endif
#endif
	.endm

	.macro R64_NUM opd r64
	\opd =3D REG_NUM_INVALID
#ifdef CONFIG_X86_64
	.ifc \r64,%rax
	\opd =3D 0
	.endif
	.ifc \r64,%rcx
	\opd =3D 1
	.endif
	.ifc \r64,%rdx
	\opd =3D 2
	.endif
	.ifc \r64,%rbx
	\opd =3D 3
	.endif
	.ifc \r64,%rsp
	\opd =3D 4
	.endif
	.ifc \r64,%rbp
	\opd =3D 5
	.endif
	.ifc \r64,%rsi
	\opd =3D 6
	.endif
	.ifc \r64,%rdi
	\opd =3D 7
	.endif
	.ifc \r64,%r8
	\opd =3D 8
	.endif
	.ifc \r64,%r9
	\opd =3D 9
	.endif
	.ifc \r64,%r10
	\opd =3D 10
	.endif
	.ifc \r64,%r11
	\opd =3D 11
	.endif
	.ifc \r64,%r12
	\opd =3D 12
	.endif
	.ifc \r64,%r13
	\opd =3D 13
	.endif
	.ifc \r64,%r14
	\opd =3D 14
	.endif
	.ifc \r64,%r15
	\opd =3D 15
	.endif
#endif
	.endm

	.macro XMM_NUM opd xmm
	\opd =3D REG_NUM_INVALID
	.ifc \xmm,%xmm0
	\opd =3D 0
	.endif
	.ifc \xmm,%xmm1
	\opd =3D 1
	.endif
	.ifc \xmm,%xmm2
	\opd =3D 2
	.endif
	.ifc \xmm,%xmm3
	\opd =3D 3
	.endif
	.ifc \xmm,%xmm4
	\opd =3D 4
	.endif
	.ifc \xmm,%xmm5
	\opd =3D 5
	.endif
	.ifc \xmm,%xmm6
	\opd =3D 6
	.endif
	.ifc \xmm,%xmm7
	\opd =3D 7
	.endif
	.ifc \xmm,%xmm8
	\opd =3D 8
	.endif
	.ifc \xmm,%xmm9
	\opd =3D 9
	.endif
	.ifc \xmm,%xmm10
	\opd =3D 10
	.endif
	.ifc \xmm,%xmm11
	\opd =3D 11
	.endif
	.ifc \xmm,%xmm12
	\opd =3D 12
	.endif
	.ifc \xmm,%xmm13
	\opd =3D 13
	.endif
	.ifc \xmm,%xmm14
	\opd =3D 14
	.endif
	.ifc \xmm,%xmm15
	\opd =3D 15
	.endif
	.endm

	.macro REG_TYPE type reg
	R32_NUM reg_type_r32 \reg
	R64_NUM reg_type_r64 \reg
	XMM_NUM reg_type_xmm \reg
	.if reg_type_r64 <> REG_NUM_INVALID
	\type =3D REG_TYPE_R64
	.elseif reg_type_r32 <> REG_NUM_INVALID
	\type =3D REG_TYPE_R32
	.elseif reg_type_xmm <> REG_NUM_INVALID
	\type =3D REG_TYPE_XMM
	.else
	\type =3D REG_TYPE_INVALID
	.endif
	.endm

	.macro PFX_OPD_SIZE
	.byte 0x66
	.endm

	.macro PFX_REX opd1 opd2 W=3D0
	.if ((\opd1 | \opd2) & 8) || \W
	.byte 0x40 | ((\opd1 & 8) >> 3) | ((\opd2 & 8) >> 1) | (\W << 3)
	.endif
	.endm

	.macro MODRM mod opd1 opd2
	.byte \mod | (\opd1 & 7) | ((\opd2 & 7) << 3)
	.endm

.macro RDPID opd
	REG_TYPE rdpid_opd_type \opd
	.if rdpid_opd_type =3D=3D REG_TYPE_R64
	R64_NUM rdpid_opd \opd
	.else
	R32_NUM rdpid_opd \opd
	.endif
	.byte 0xf3
	.if rdpid_opd > 7
	PFX_REX rdpid_opd 0
	.endif
	.byte 0x0f, 0xc7
	MODRM 0xc0 rdpid_opd 0x7
.endm
#endif

#endif

--=20
Cheers,
Stephen Rothwell

--Sig_/qFh0fIP7XemDn+0mQcZbzqg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RLUAACgkQAVBC80lX
0GzX5wf/bMv33RnMLoOXbHMcGzegM54nfMV2XRxB1jQXtVhccQYfPJgPnVxePZvu
2vsg9kX3IzyMNhH7NTWEEit5TJD7zYtjiOFT3F2GyXUXm2dRSAUrMwhInhp8pMXi
vmjkNpqtLYTuOd8y5FdxQ63SFTzfrZYx6flm3LqijqhjeEAtPnZf7KXkgNXYc+XM
X7AGFG5opT2Kj+XmshK+wY6a8rPMMx6ePeuDLcgcEYS4Ptci7w1vWietL4D9+OGZ
Ap5QEep6IiNPznAme91cjpSbCRHno1U80h/To2mnIeSGZA963zyuiwex19SGh47x
XxUh2t1mETrz5xEo6wF6+zXnH02Y2g==
=rH1W
-----END PGP SIGNATURE-----

--Sig_/qFh0fIP7XemDn+0mQcZbzqg--
