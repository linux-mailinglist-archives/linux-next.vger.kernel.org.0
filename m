Return-Path: <linux-next+bounces-6574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9AAADCD6
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 13:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4D74C82D9
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADCB2153D6;
	Wed,  7 May 2025 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="iRvrMwOX"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D121504D;
	Wed,  7 May 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615792; cv=none; b=eqBZCRXkQ7Qy4mZEd42KBVlT2xkkkR+eTRK/wacdZSaqjy1KxsbImC5RZZWjfapaiPTZmPeiyyO2PFYMC8ZQOdC+LfFxFm9lR2Nu3FmhHBJhPkcON59Z2NtrQGV8aqkz3gj3DBBdKAPeMrRs0HarJ9KIXr+JodxpELGhnKwqiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615792; c=relaxed/simple;
	bh=r0E/6u4JWkefuT+mFl4Ms/omJqZxnIW/IFr6MMSs/bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=thT47FPmUX30wzkAGIgpYlj9/rs2Jnh5s2Rqzy/Ofk4z4oiyReUQBOwQb0shdxFwozwFwRxAR4Erl3tzetW+vamgZOlG36JMamSERcIv+8ov6HLn9Nvm+xWTqak+lt8qQDdlD7sNziGMQg0WijVXRRAEVp4VZtU0Kw9STgm+xeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=iRvrMwOX; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=AWNHa3xgd3Sr/ggkT06X81rSZJFRU/DXIKiItzUVpq0=; t=1746615789;
	x=1747047789; b=iRvrMwOXGv0IwFHeTLndl2rppT3ogcWR1zd6o0cmPwYa3vMQqkLZsBml9467+
	VZLih+UGaYoUnZP74RmVuBW7t0OOYmOFkQ6vwD4O8S+Mhw7AxRxCZHRNFv7mt1dNymAQArvrKEt6f
	mtpWdASJIf5CmlTEV37ncIbjwk32fJRxZBexkjNlwb7gTOr9jVA+TXe1SApuWfQIMyw5SP2nLwo5o
	Vm/XmeTR/H2AFGBGqxNI/ZMCfKsrwCLMpACsbZB4yNObYCj3WqPS3Z7UdJcgAA2qYis4u0Fv7m5uo
	iV20zhwApVnW5X8UlhC8zybOT2YRZx35IyiNhjN+1RjYul1g0Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uCcYM-000gC8-2e;
	Wed, 07 May 2025 13:03:06 +0200
Message-ID: <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
Date: Wed, 7 May 2025 13:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 PATCH 11/11] crypto: lib/poly1305 - Use block-only interface
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
In-Reply-To: <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1746615789;54dfe2fd;
X-HE-SMSGID: 1uCcYM-000gC8-2e

On 28.04.25 06:56, Herbert Xu wrote:
> Now that every architecture provides a block function, use that
> to implement the lib/poly1305 and remove the old per-arch code.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

I ran into a problem today when building -next rpms for ppc64le Fedora
using the approach and configuration used to build the kernel rpms 
shipped in Fedora rawhide. I did not investigate yet, but I wonder if is
was caused by the quoted change or some other change in this series
which showed up in -next today.

"""
ld: warning: discarding dynamic section .glink
ld: warning: discarding dynamic section .plt
ld: linkage table error against `poly1305_emit_arch'
ld: stubs don't match calculated size
ld: can not build stubs: bad value
ld: lib/crypto/poly1305.o: in function `poly1305_final':
/builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x2dc): undefined reference to `poly1305_emit_arch'
ld: /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x378): undefined reference to `poly1305_emit_arch'
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
make[1]: *** [/builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/Makefile:1250: vmlinux] Error 2
"""

Full build log:
https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-rawhide-ppc64le/09006679-next-next-all/builder-live.log.gz

Same problem occured on Fedora 40, 41 and 42 as well.

Ciao, Thorsten

> ---
>  arch/arm/lib/crypto/poly1305-glue.c         | 57 -------------------
>  arch/arm64/lib/crypto/poly1305-glue.c       | 58 -------------------
>  arch/mips/lib/crypto/poly1305-glue.c        | 60 --------------------
>  arch/powerpc/lib/crypto/poly1305-p10-glue.c | 63 ---------------------
>  arch/x86/lib/crypto/poly1305_glue.c         | 60 --------------------
>  include/crypto/poly1305.h                   | 53 ++---------------
>  lib/crypto/poly1305.c                       | 39 ++++++++-----
>  7 files changed, 32 insertions(+), 358 deletions(-)
> 
> diff --git a/arch/arm/lib/crypto/poly1305-glue.c b/arch/arm/lib/crypto/poly1305-glue.c
> index 3ee16048ec7c..91da42b26d9c 100644
> --- a/arch/arm/lib/crypto/poly1305-glue.c
> +++ b/arch/arm/lib/crypto/poly1305-glue.c
> @@ -12,7 +12,6 @@
>  #include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/string.h>
>  #include <linux/unaligned.h>
>  
>  asmlinkage void poly1305_block_init_arch(
> @@ -35,17 +34,6 @@ void __weak poly1305_blocks_neon(struct poly1305_block_state *state,
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
> -{
> -	dctx->s[0] = get_unaligned_le32(key + 16);
> -	dctx->s[1] = get_unaligned_le32(key + 20);
> -	dctx->s[2] = get_unaligned_le32(key + 24);
> -	dctx->s[3] = get_unaligned_le32(key + 28);
> -	dctx->buflen = 0;
> -	poly1305_block_init_arch(&dctx->state, key);
> -}
> -EXPORT_SYMBOL(poly1305_init_arch);
> -
>  void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  			  unsigned int len, u32 padbit)
>  {
> @@ -67,51 +55,6 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
>  
> -void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
> -			  unsigned int nbytes)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
> -
> -		memcpy(dctx->buf + dctx->buflen, src, bytes);
> -		src += bytes;
> -		nbytes -= bytes;
> -		dctx->buflen += bytes;
> -
> -		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
> -			poly1305_blocks_arch(&dctx->state, dctx->buf,
> -					     POLY1305_BLOCK_SIZE, 1);
> -			dctx->buflen = 0;
> -		}
> -	}
> -
> -	if (likely(nbytes >= POLY1305_BLOCK_SIZE)) {
> -		poly1305_blocks_arch(&dctx->state, src, nbytes, 1);
> -		src += round_down(nbytes, POLY1305_BLOCK_SIZE);
> -		nbytes %= POLY1305_BLOCK_SIZE;
> -	}
> -
> -	if (unlikely(nbytes)) {
> -		dctx->buflen = nbytes;
> -		memcpy(dctx->buf, src, nbytes);
> -	}
> -}
> -EXPORT_SYMBOL(poly1305_update_arch);
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		dctx->buf[dctx->buflen++] = 1;
> -		memset(dctx->buf + dctx->buflen, 0,
> -		       POLY1305_BLOCK_SIZE - dctx->buflen);
> -		poly1305_blocks_arch(&dctx->state, dctx->buf, POLY1305_BLOCK_SIZE, 0);
> -	}
> -
> -	poly1305_emit_arch(&dctx->h, dst, dctx->s);
> -	*dctx = (struct poly1305_desc_ctx){};
> -}
> -EXPORT_SYMBOL(poly1305_final_arch);
> -
>  bool poly1305_is_arch_optimized(void)
>  {
>  	/* We always can use at least the ARM scalar implementation. */
> diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
> index d66a820e32d5..681c26557336 100644
> --- a/arch/arm64/lib/crypto/poly1305-glue.c
> +++ b/arch/arm64/lib/crypto/poly1305-glue.c
> @@ -12,7 +12,6 @@
>  #include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/string.h>
>  #include <linux/unaligned.h>
>  
>  asmlinkage void poly1305_block_init_arch(
> @@ -30,17 +29,6 @@ EXPORT_SYMBOL_GPL(poly1305_emit_arch);
>  
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
> -{
> -	dctx->s[0] = get_unaligned_le32(key + 16);
> -	dctx->s[1] = get_unaligned_le32(key + 20);
> -	dctx->s[2] = get_unaligned_le32(key + 24);
> -	dctx->s[3] = get_unaligned_le32(key + 28);
> -	dctx->buflen = 0;
> -	poly1305_block_init_arch(&dctx->state, key);
> -}
> -EXPORT_SYMBOL(poly1305_init_arch);
> -
>  void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  			  unsigned int len, u32 padbit)
>  {
> @@ -61,52 +49,6 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
>  
> -void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
> -			  unsigned int nbytes)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
> -
> -		memcpy(dctx->buf + dctx->buflen, src, bytes);
> -		src += bytes;
> -		nbytes -= bytes;
> -		dctx->buflen += bytes;
> -
> -		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
> -			poly1305_blocks_arch(&dctx->state, dctx->buf,
> -					     POLY1305_BLOCK_SIZE, 1);
> -			dctx->buflen = 0;
> -		}
> -	}
> -
> -	if (likely(nbytes >= POLY1305_BLOCK_SIZE)) {
> -		poly1305_blocks_arch(&dctx->state, src, nbytes, 1);
> -		src += round_down(nbytes, POLY1305_BLOCK_SIZE);
> -		nbytes %= POLY1305_BLOCK_SIZE;
> -	}
> -
> -	if (unlikely(nbytes)) {
> -		dctx->buflen = nbytes;
> -		memcpy(dctx->buf, src, nbytes);
> -	}
> -}
> -EXPORT_SYMBOL(poly1305_update_arch);
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		dctx->buf[dctx->buflen++] = 1;
> -		memset(dctx->buf + dctx->buflen, 0,
> -		       POLY1305_BLOCK_SIZE - dctx->buflen);
> -		poly1305_blocks_arch(&dctx->state, dctx->buf,
> -				     POLY1305_BLOCK_SIZE, 0);
> -	}
> -
> -	poly1305_emit_arch(&dctx->h, dst, dctx->s);
> -	memzero_explicit(dctx, sizeof(*dctx));
> -}
> -EXPORT_SYMBOL(poly1305_final_arch);
> -
>  bool poly1305_is_arch_optimized(void)
>  {
>  	/* We always can use at least the ARM64 scalar implementation. */
> diff --git a/arch/mips/lib/crypto/poly1305-glue.c b/arch/mips/lib/crypto/poly1305-glue.c
> index 2fea4cacfe27..764a38a65200 100644
> --- a/arch/mips/lib/crypto/poly1305-glue.c
> +++ b/arch/mips/lib/crypto/poly1305-glue.c
> @@ -9,7 +9,6 @@
>  #include <linux/cpufeature.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/string.h>
>  #include <linux/unaligned.h>
>  
>  asmlinkage void poly1305_block_init_arch(
> @@ -24,65 +23,6 @@ asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
>  				   const u32 nonce[4]);
>  EXPORT_SYMBOL_GPL(poly1305_emit_arch);
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
> -{
> -	dctx->s[0] = get_unaligned_le32(key + 16);
> -	dctx->s[1] = get_unaligned_le32(key + 20);
> -	dctx->s[2] = get_unaligned_le32(key + 24);
> -	dctx->s[3] = get_unaligned_le32(key + 28);
> -	dctx->buflen = 0;
> -	poly1305_block_init_arch(&dctx->state, key);
> -}
> -EXPORT_SYMBOL(poly1305_init_arch);
> -
> -void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
> -			  unsigned int nbytes)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
> -
> -		memcpy(dctx->buf + dctx->buflen, src, bytes);
> -		src += bytes;
> -		nbytes -= bytes;
> -		dctx->buflen += bytes;
> -
> -		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
> -			poly1305_blocks_arch(&dctx->state, dctx->buf,
> -					     POLY1305_BLOCK_SIZE, 1);
> -			dctx->buflen = 0;
> -		}
> -	}
> -
> -	if (likely(nbytes >= POLY1305_BLOCK_SIZE)) {
> -		unsigned int len = round_down(nbytes, POLY1305_BLOCK_SIZE);
> -
> -		poly1305_blocks_arch(&dctx->state, src, len, 1);
> -		src += len;
> -		nbytes %= POLY1305_BLOCK_SIZE;
> -	}
> -
> -	if (unlikely(nbytes)) {
> -		dctx->buflen = nbytes;
> -		memcpy(dctx->buf, src, nbytes);
> -	}
> -}
> -EXPORT_SYMBOL(poly1305_update_arch);
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		dctx->buf[dctx->buflen++] = 1;
> -		memset(dctx->buf + dctx->buflen, 0,
> -		       POLY1305_BLOCK_SIZE - dctx->buflen);
> -		poly1305_blocks_arch(&dctx->state, dctx->buf,
> -				     POLY1305_BLOCK_SIZE, 0);
> -	}
> -
> -	poly1305_emit_arch(&dctx->h, dst, dctx->s);
> -	*dctx = (struct poly1305_desc_ctx){};
> -}
> -EXPORT_SYMBOL(poly1305_final_arch);
> -
>  bool poly1305_is_arch_optimized(void)
>  {
>  	return true;
> diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> index 708435beaba6..50ac802220e0 100644
> --- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> +++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
> @@ -10,7 +10,6 @@
>  #include <linux/jump_label.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/string.h>
>  #include <linux/unaligned.h>
>  
>  asmlinkage void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m, u32 mlen);
> @@ -45,17 +44,6 @@ void poly1305_block_init_arch(struct poly1305_block_state *dctx,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_block_init_arch);
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
> -{
> -	dctx->s[0] = get_unaligned_le32(key + 16);
> -	dctx->s[1] = get_unaligned_le32(key + 20);
> -	dctx->s[2] = get_unaligned_le32(key + 24);
> -	dctx->s[3] = get_unaligned_le32(key + 28);
> -	dctx->buflen = 0;
> -	poly1305_block_init_arch(&dctx->state, key);
> -}
> -EXPORT_SYMBOL(poly1305_init_arch);
> -
>  void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  			  unsigned int len, u32 padbit)
>  {
> @@ -76,57 +64,6 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
>  
> -void poly1305_update_arch(struct poly1305_desc_ctx *dctx,
> -			  const u8 *src, unsigned int srclen)
> -{
> -	unsigned int bytes;
> -
> -	if (!static_key_enabled(&have_p10))
> -		return poly1305_update_generic(dctx, src, srclen);
> -
> -	if (unlikely(dctx->buflen)) {
> -		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
> -		memcpy(dctx->buf + dctx->buflen, src, bytes);
> -		src += bytes;
> -		srclen -= bytes;
> -		dctx->buflen += bytes;
> -		if (dctx->buflen < POLY1305_BLOCK_SIZE)
> -			return;
> -		poly1305_blocks_arch(&dctx->state, dctx->buf,
> -				     POLY1305_BLOCK_SIZE, 1);
> -		dctx->buflen = 0;
> -	}
> -
> -	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
> -		poly1305_blocks_arch(&dctx->state, src, srclen, 1);
> -		src += srclen - (srclen % POLY1305_BLOCK_SIZE);
> -		srclen %= POLY1305_BLOCK_SIZE;
> -	}
> -
> -	if (unlikely(srclen)) {
> -		dctx->buflen = srclen;
> -		memcpy(dctx->buf, src, srclen);
> -	}
> -}
> -EXPORT_SYMBOL(poly1305_update_arch);
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
> -{
> -	if (!static_key_enabled(&have_p10))
> -		return poly1305_final_generic(dctx, dst);
> -
> -	if (dctx->buflen) {
> -		dctx->buf[dctx->buflen++] = 1;
> -		memset(dctx->buf + dctx->buflen, 0,
> -		       POLY1305_BLOCK_SIZE - dctx->buflen);
> -		poly1305_blocks_arch(&dctx->state, dctx->buf,
> -				     POLY1305_BLOCK_SIZE, 0);
> -	}
> -
> -	poly1305_emit_arch(&dctx->h, dst, dctx->s);
> -}
> -EXPORT_SYMBOL(poly1305_final_arch);
> -
>  bool poly1305_is_arch_optimized(void)
>  {
>  	return static_key_enabled(&have_p10);
> diff --git a/arch/x86/lib/crypto/poly1305_glue.c b/arch/x86/lib/crypto/poly1305_glue.c
> index d98764ec3b47..f799828c5809 100644
> --- a/arch/x86/lib/crypto/poly1305_glue.c
> +++ b/arch/x86/lib/crypto/poly1305_glue.c
> @@ -10,7 +10,6 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
> -#include <linux/string.h>
>  #include <linux/unaligned.h>
>  
>  struct poly1305_arch_internal {
> @@ -96,65 +95,6 @@ void poly1305_emit_arch(const struct poly1305_state *ctx,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_emit_arch);
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
> -{
> -	dctx->s[0] = get_unaligned_le32(&key[16]);
> -	dctx->s[1] = get_unaligned_le32(&key[20]);
> -	dctx->s[2] = get_unaligned_le32(&key[24]);
> -	dctx->s[3] = get_unaligned_le32(&key[28]);
> -	dctx->buflen = 0;
> -	poly1305_block_init_arch(&dctx->state, key);
> -}
> -EXPORT_SYMBOL(poly1305_init_arch);
> -
> -void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
> -			  unsigned int srclen)
> -{
> -	unsigned int bytes;
> -
> -	if (unlikely(dctx->buflen)) {
> -		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
> -		memcpy(dctx->buf + dctx->buflen, src, bytes);
> -		src += bytes;
> -		srclen -= bytes;
> -		dctx->buflen += bytes;
> -
> -		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
> -			poly1305_blocks_arch(&dctx->state, dctx->buf,
> -					     POLY1305_BLOCK_SIZE, 1);
> -			dctx->buflen = 0;
> -		}
> -	}
> -
> -	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
> -		bytes = round_down(srclen, POLY1305_BLOCK_SIZE);
> -		poly1305_blocks_arch(&dctx->state, src, bytes, 1);
> -		src += bytes;
> -		srclen -= bytes;
> -	}
> -
> -	if (unlikely(srclen)) {
> -		dctx->buflen = srclen;
> -		memcpy(dctx->buf, src, srclen);
> -	}
> -}
> -EXPORT_SYMBOL(poly1305_update_arch);
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
> -{
> -	if (unlikely(dctx->buflen)) {
> -		dctx->buf[dctx->buflen++] = 1;
> -		memset(dctx->buf + dctx->buflen, 0,
> -		       POLY1305_BLOCK_SIZE - dctx->buflen);
> -		poly1305_blocks_arch(&dctx->state, dctx->buf,
> -				     POLY1305_BLOCK_SIZE, 0);
> -	}
> -
> -	poly1305_emit_arch(&dctx->h, dst, dctx->s);
> -	memzero_explicit(dctx, sizeof(*dctx));
> -}
> -EXPORT_SYMBOL(poly1305_final_arch);
> -
>  bool poly1305_is_arch_optimized(void)
>  {
>  	return static_key_enabled(&poly1305_use_avx);
> diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
> index 027d74842cd5..e54abda8cfe9 100644
> --- a/include/crypto/poly1305.h
> +++ b/include/crypto/poly1305.h
> @@ -55,55 +55,14 @@ struct poly1305_desc_ctx {
>  	unsigned int buflen;
>  	/* finalize key */
>  	u32 s[4];
> -	union {
> -		struct {
> -			struct poly1305_state h;
> -			union {
> -				struct poly1305_key opaque_r[CONFIG_CRYPTO_LIB_POLY1305_RSIZE];
> -				struct poly1305_core_key core_r;
> -			};
> -		};
> -		struct poly1305_block_state state;
> -	};
> +	struct poly1305_block_state state;
>  };
>  
> -void poly1305_init_arch(struct poly1305_desc_ctx *desc,
> -			const u8 key[POLY1305_KEY_SIZE]);
> -void poly1305_init_generic(struct poly1305_desc_ctx *desc,
> -			   const u8 key[POLY1305_KEY_SIZE]);
> -
> -static inline void poly1305_init(struct poly1305_desc_ctx *desc, const u8 *key)
> -{
> -	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> -		poly1305_init_arch(desc, key);
> -	else
> -		poly1305_init_generic(desc, key);
> -}
> -
> -void poly1305_update_arch(struct poly1305_desc_ctx *desc, const u8 *src,
> -			  unsigned int nbytes);
> -void poly1305_update_generic(struct poly1305_desc_ctx *desc, const u8 *src,
> -			     unsigned int nbytes);
> -
> -static inline void poly1305_update(struct poly1305_desc_ctx *desc,
> -				   const u8 *src, unsigned int nbytes)
> -{
> -	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> -		poly1305_update_arch(desc, src, nbytes);
> -	else
> -		poly1305_update_generic(desc, src, nbytes);
> -}
> -
> -void poly1305_final_arch(struct poly1305_desc_ctx *desc, u8 *digest);
> -void poly1305_final_generic(struct poly1305_desc_ctx *desc, u8 *digest);
> -
> -static inline void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest)
> -{
> -	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> -		poly1305_final_arch(desc, digest);
> -	else
> -		poly1305_final_generic(desc, digest);
> -}
> +void poly1305_init(struct poly1305_desc_ctx *desc,
> +		   const u8 key[POLY1305_KEY_SIZE]);
> +void poly1305_update(struct poly1305_desc_ctx *desc,
> +		     const u8 *src, unsigned int nbytes);
> +void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest);
>  
>  #if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305)
>  bool poly1305_is_arch_optimized(void);
> diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
> index 9fec64a599c1..4c9996864090 100644
> --- a/lib/crypto/poly1305.c
> +++ b/lib/crypto/poly1305.c
> @@ -22,47 +22,60 @@ void poly1305_block_init_generic(struct poly1305_block_state *desc,
>  }
>  EXPORT_SYMBOL_GPL(poly1305_block_init_generic);
>  
> -void poly1305_init_generic(struct poly1305_desc_ctx *desc,
> -			   const u8 key[POLY1305_KEY_SIZE])
> +void poly1305_init(struct poly1305_desc_ctx *desc,
> +		   const u8 key[POLY1305_KEY_SIZE])
>  {
>  	desc->s[0] = get_unaligned_le32(key + 16);
>  	desc->s[1] = get_unaligned_le32(key + 20);
>  	desc->s[2] = get_unaligned_le32(key + 24);
>  	desc->s[3] = get_unaligned_le32(key + 28);
>  	desc->buflen = 0;
> -	poly1305_block_init_generic(&desc->state, key);
> +	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> +		poly1305_block_init_arch(&desc->state, key);
> +	else
> +		poly1305_block_init_generic(&desc->state, key);
>  }
> -EXPORT_SYMBOL_GPL(poly1305_init_generic);
> +EXPORT_SYMBOL(poly1305_init);
>  
>  static inline void poly1305_blocks(struct poly1305_block_state *state,
>  				   const u8 *src, unsigned int len)
>  {
> -	poly1305_blocks_generic(state, src, len, 1);
> +	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> +		poly1305_blocks_arch(state, src, len, 1);
> +	else
> +		poly1305_blocks_generic(state, src, len, 1);
>  }
>  
> -void poly1305_update_generic(struct poly1305_desc_ctx *desc, const u8 *src,
> -			     unsigned int nbytes)
> +void poly1305_update(struct poly1305_desc_ctx *desc,
> +		     const u8 *src, unsigned int nbytes)
>  {
>  	desc->buflen = BLOCK_HASH_UPDATE(poly1305_blocks, &desc->state,
>  					 src, nbytes, POLY1305_BLOCK_SIZE,
>  					 desc->buf, desc->buflen);
>  }
> -EXPORT_SYMBOL_GPL(poly1305_update_generic);
> +EXPORT_SYMBOL(poly1305_update);
>  
> -void poly1305_final_generic(struct poly1305_desc_ctx *desc, u8 *dst)
> +void poly1305_final(struct poly1305_desc_ctx *desc, u8 *dst)
>  {
>  	if (unlikely(desc->buflen)) {
>  		desc->buf[desc->buflen++] = 1;
>  		memset(desc->buf + desc->buflen, 0,
>  		       POLY1305_BLOCK_SIZE - desc->buflen);
> -		poly1305_blocks_generic(&desc->state, desc->buf,
> -					POLY1305_BLOCK_SIZE, 0);
> +		if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> +			poly1305_blocks_arch(&desc->state, desc->buf,
> +					     POLY1305_BLOCK_SIZE, 0);
> +		else
> +			poly1305_blocks_generic(&desc->state, desc->buf,
> +						POLY1305_BLOCK_SIZE, 0);
>  	}
>  
> -	poly1305_emit_generic(&desc->h, dst, desc->s);
> +	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305))
> +		poly1305_emit_arch(&desc->state.h, dst, desc->s);
> +	else
> +		poly1305_emit_generic(&desc->state.h, dst, desc->s);
>  	*desc = (struct poly1305_desc_ctx){};
>  }
> -EXPORT_SYMBOL_GPL(poly1305_final_generic);
> +EXPORT_SYMBOL(poly1305_final);
>  
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");


