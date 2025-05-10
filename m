Return-Path: <linux-next+bounces-6664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31EAB22C3
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 11:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8833A1BA6401
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 09:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0981EFF92;
	Sat, 10 May 2025 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="C1ki8rXj"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232951EF36E;
	Sat, 10 May 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868440; cv=none; b=YYIKecB1pvtz9wLreB2EOFsrkrOM8IAGsNkB+ScT+OWr3Tmv4cb+eCf1aT5ejDMTxyvV0ho/6lnJT74XUuaKOs8/XKajIEfK6oHXlY8UXNxbK0nHYQVih4RHrnthdXrDwa8aL1gnFPKI7br2DxmTupcbuZkwRV+laoFaGftV/F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868440; c=relaxed/simple;
	bh=ze8SMzptU726pqaabNzF4FsyZVqcvDElJvdq9FyaJ+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSxV/k+R6ElTXOtUfFiL4TziZwnfJftL9Gz53AW92T9sEXZFffn2iSOHL0PGldFtbso/lt0u33YMrrv5nw+wFAwUVKxkC4v+J7SZ4MAAzZyKhSr8MNCtRW3V+wkRK0KbYQthpe421MGEpAMlDqO20zeqKCAMfMMFGLUNncsLW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=C1ki8rXj; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DR2zdr7flyneY9TuJYwuY+VgaHX7ua8VIes8NAJcxYg=; b=C1ki8rXjMlzzVQRBYI8InaJUPs
	GNi1ZmYATuVsw/WIReXgXYzkpV/TSk0dwCKtBJN7gOS5YHk0o5no/aS0mT+nzxwimgGHyhpn3Jm5j
	uyWYm3UMnLeGSOKbDMOdUCFph6kfX7oSCL6YKrngimUfVyIFbWRzpp06nKucfCi1LHpZa20xqQBAS
	YUuBiZk7KauJ1SJzyiw+WURMQNz8tJKJjSRwhKnXzp4FkeHgF941GjOeAoZtOjP9XrhMvFksDlJQP
	X4ag03CrJH//fHq12cf8VrkUi0fbbsAOa9G/YdiB5MTIuaJUyxvm7z0z0wXt0f6lmRZ1FeHWzkONZ
	5+mDFfdw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDgHD-0052dM-0e;
	Sat, 10 May 2025 17:13:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 17:13:47 +0800
Date: Sat, 10 May 2025 17:13:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] crypto: powerpc/poly1305 - Add SIMD fallback
Message-ID: <aB8Yy0JGvoErc0ns@gondor.apana.org.au>
References: <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510053308.GB505731@sol>

On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
>
> Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> default from include/asm-generic/simd.h which returns false in softirq context).
> Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> PowerPC folks (Cc'ed) a chance to fix this before removing the code.

OK this patch works for me:

---8<---
Add a SIMD fallback path for poly1305-p10 by converting the 2^64
based hash state into a 2^44 base.  In order to ensure that the
generic fallback is actually 2^44, add ARCH_SUPPORTS_INT128 to
powerpc and make poly1305-p10 depend on it.

Fixes: ba8f8624fde2 ("crypto: poly1305-p10 - Glue code for optmized Poly1305 implementation for ppc64le")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..651e0c32957a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -173,6 +173,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_INT128		if PPC64 && CC_HAS_INT128
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
index ffa541ad6d5d..6761fdb6193c 100644
--- a/arch/powerpc/lib/crypto/Kconfig
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -9,7 +9,7 @@ config CRYPTO_CHACHA20_P10
 
 config CRYPTO_POLY1305_P10
 	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX && ARCH_SUPPORTS_INT128
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
index 3f1664a724b6..280c10c48c53 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
@@ -6,6 +6,7 @@
  */
 #include <asm/switch_to.h>
 #include <crypto/internal/poly1305.h>
+#include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
@@ -18,6 +19,11 @@ asmlinkage void poly1305_emit_64(const struct poly1305_state *state, const u32 n
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
 
+static inline bool is_state_base64(struct poly1305_block_state *state)
+{
+	return state->core_r.precomputed_s.r64[2];
+}
+
 static void vsx_begin(void)
 {
 	preempt_disable();
@@ -30,12 +36,35 @@ static void vsx_end(void)
 	preempt_enable();
 }
 
+static void convert_to_base2_44(struct poly1305_block_state *state)
+{
+	u8 raw_key[POLY1305_BLOCK_SIZE];
+	u64 h0, h1, h2;
+
+	if (!is_state_base64(state))
+		return;
+
+	state->core_r.precomputed_s.r64[2] = 0;
+	put_unaligned_le64(state->core_r.key.r64[0], raw_key + 0);
+	put_unaligned_le64(state->core_r.key.r64[1], raw_key + 8);
+	poly1305_core_setkey(&state->core_r, raw_key);
+
+	h0 = state->h.h64[0];
+	h1 = state->h.h64[1];
+	h2 = state->h.h64[2];
+	state->h.h64[0] = h0 & 0xfffffffffffULL;
+	state->h.h64[1] = h0 >> 44 | (h1 & 0xffffffULL) << 20;
+	state->h.h64[2] = h1 >> 24 | h2 << 40;
+}
+
 void poly1305_block_init_arch(struct poly1305_block_state *dctx,
 			      const u8 raw_key[POLY1305_BLOCK_SIZE])
 {
-	if (!static_key_enabled(&have_p10))
+	dctx->core_r.precomputed_s.r64[2] = 0;
+	if (!static_key_enabled(&have_p10) || !crypto_simd_usable())
 		return poly1305_block_init_generic(dctx, raw_key);
 
+	dctx->core_r.precomputed_s.r64[2] = 1;
 	dctx->h = (struct poly1305_state){};
 	dctx->core_r.key.r64[0] = get_unaligned_le64(raw_key + 0);
 	dctx->core_r.key.r64[1] = get_unaligned_le64(raw_key + 8);
@@ -45,8 +74,11 @@ EXPORT_SYMBOL_GPL(poly1305_block_init_arch);
 void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 			  unsigned int len, u32 padbit)
 {
-	if (!static_key_enabled(&have_p10))
+	if (!static_key_enabled(&have_p10) || !is_state_base64(state) ||
+	    !crypto_simd_usable()) {
+		convert_to_base2_44(state);
 		return poly1305_blocks_generic(state, src, len, padbit);
+	}
 	vsx_begin();
 	if (len >= POLY1305_BLOCK_SIZE * 4) {
 		poly1305_p10le_4blocks(state, src, len);
@@ -66,7 +98,10 @@ void poly1305_emit_arch(const struct poly1305_state *state,
 			u8 digest[POLY1305_DIGEST_SIZE],
 			const u32 nonce[4])
 {
-	if (!static_key_enabled(&have_p10))
+	struct poly1305_block_state *dctx =
+		container_of(state, struct poly1305_block_state, h);
+
+	if (!static_key_enabled(&have_p10) || !is_state_base64(dctx))
 		return poly1305_emit_generic(state, digest, nonce);
 	poly1305_emit_64(state, nonce, digest);
 }
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

