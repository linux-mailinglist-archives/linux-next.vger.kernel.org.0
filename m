Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0CEFFD3C
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 04:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfKRDL2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 22:11:28 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbfKRDL2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 22:11:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GYrT2xhNz9sQp;
        Mon, 18 Nov 2019 14:11:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574046684;
        bh=SEYlzqdNbf6vmBSnUFPsGX308O7NYdKwivTd4OJhqbs=;
        h=Date:From:To:Cc:Subject:From;
        b=JC38iMDqTiIgqQP5I8tvQo7kiqZkqd8aWAIosytyBt0tfvu24ta+LqVzqgzoar5KG
         fhEOAyxoiQAfwGX0C0bHcPdtb8+12UG58V8u83kowEtR5UbebRhYianF+NXFqaQllT
         AcMqycwaokFJ1RZXeYjZtQef/DYFtRcFQLDHnOrsJBn8eaT7lMuoOb2AbKlJOGr94F
         +dZcna/GXJqWtyJYn/OY7lsjJZghSbcZ/rT+BY00gaDBS3j23mOUcTLLTgLdrITLO1
         WlcD9oeFBansfvtQqz9bJ0oNXs8AoJwZX/dxPCoaebZaJgp2mQLtIT8hQh2x/wsN3c
         wDrYA1G+lldwg==
Date:   Mon, 18 Nov 2019 14:11:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Samuel Neves <sneves@dei.uc.pt>,
        Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jiri Slaby <jslaby@suse.cz>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20191118141110.7f971194@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e6VIznpNbcG9rdTzS2mMifM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e6VIznpNbcG9rdTzS2mMifM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

arch/x86/crypto/blake2s-core.S: Assembler messages:
arch/x86/crypto/blake2s-core.S:50: Error: invalid character '(' in mnemonic
arch/x86/crypto/blake2s-core.S:176: Error: invalid character '(' in mnemonic
arch/x86/crypto/blake2s-core.S:180: Error: invalid character '(' in mnemonic
arch/x86/crypto/blake2s-core.S:257: Error: invalid character '(' in mnemonic

Caused by commit

  ed0356eda153 ("crypto: blake2s - x86_64 SIMD implementation")

from the crypto tree interacting with commit

  6dcc5627f6ae ("x86/asm: Change all ENTRY+ENDPROC to SYM_FUNC_*")

from the tip tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Nov 2019 14:00:40 +1100
Subject: [PATCH] fix up for "x86/asm: Change all ENTRY+ENDPROC to SYM_FUNC_=
*"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/crypto/blake2s-core.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/crypto/blake2s-core.S b/arch/x86/crypto/blake2s-core.S
index 8591938eee26..24910b766bdd 100644
--- a/arch/x86/crypto/blake2s-core.S
+++ b/arch/x86/crypto/blake2s-core.S
@@ -47,7 +47,7 @@ SIGMA2:
=20
 .text
 #ifdef CONFIG_AS_SSSE3
-ENTRY(blake2s_compress_ssse3)
+SYM_FUNC_START(blake2s_compress_ssse3)
 	testq		%rdx,%rdx
 	je		.Lendofloop
 	movdqu		(%rdi),%xmm0
@@ -173,11 +173,11 @@ ENTRY(blake2s_compress_ssse3)
 	movdqu		%xmm14,0x20(%rdi)
 .Lendofloop:
 	ret
-ENDPROC(blake2s_compress_ssse3)
+SYM_FUNC_END(blake2s_compress_ssse3)
 #endif /* CONFIG_AS_SSSE3 */
=20
 #ifdef CONFIG_AS_AVX512
-ENTRY(blake2s_compress_avx512)
+SYM_FUNC_START(blake2s_compress_avx512)
 	vmovdqu		(%rdi),%xmm0
 	vmovdqu		0x10(%rdi),%xmm1
 	vmovdqu		0x20(%rdi),%xmm4
@@ -254,5 +254,5 @@ ENTRY(blake2s_compress_avx512)
 	vmovdqu		%xmm4,0x20(%rdi)
 	vzeroupper
 	retq
-ENDPROC(blake2s_compress_avx512)
+SYM_FUNC_END(blake2s_compress_avx512)
 #endif /* CONFIG_AS_AVX512 */
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/e6VIznpNbcG9rdTzS2mMifM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3SC84ACgkQAVBC80lX
0GwuwggAjrdpdRMH4wUYkO/wli2I9ru0JhmmfHHFRdlvhsNiNXsmQrukAZnGxI37
mIROAM9yIE7WKY7+HYhuUPCOG6afkKRddQh6Qqwq33TNZerRwWAItYXdzCEw3rh+
+guEfjrG+Ely9t+olJQ3a4Qxky3Eu6UlsFOruCUxC2G3Nh3V2Dlq3ST0ApXs9Hbg
Z0pX/NoYlXf2bB9s8y8PrSstKf1N0NPrRK32GXQMRxYu1OIOexIZYXMnDy6abUjz
r1aHflypEvRgrhMgfidQkRW+4FmCT4V5aFOXWZ2zYkWapfjYgERtj2KJP13Em7Z4
2Cc+OJF+y3U9EdsXePPcgGV7aYynqg==
=OE+j
-----END PGP SIGNATURE-----

--Sig_/e6VIznpNbcG9rdTzS2mMifM--
