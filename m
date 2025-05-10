Return-Path: <linux-next+bounces-6658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF6AB213E
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 07:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8049E089E
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 05:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE6A1C5D5E;
	Sat, 10 May 2025 05:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ikFVOLUY"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D401AA1FF;
	Sat, 10 May 2025 05:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746853846; cv=none; b=Hc+5O114k6NcXzv8k4f9OXoYK3l3UuwuMwZozBuwN6q0dF/1PJqA9ViQHhBuU7xG5lal0BVb7o55RQvejjzqBsiEN/401hHD9XTP0K0dwi8wuagTSYXnYKFosimAoIB6UcZuJGfSZp5QtHYHRUEZmGrOVQwlhylonR5aNZJ3pvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746853846; c=relaxed/simple;
	bh=TgmJWF3/bJwbo7pvdJKm5r96QrqDikIeuZcORScR7uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p360CzKuzvltM3kUsIa2Ex5w/3Vh3OQHSHhWHAdh9NdVdIUf072zyCCY4GFNjEdmLY10rLbWEswT7JKyzMiR1KJ+IpsaIHoT9my3Ih/rpOkrm9NvMKWiqCpLpPrTcDO6d5WJmnLQWS5j09QsIV8S9Y7b61+f/iqBkQCKkaWZRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ikFVOLUY; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vMhtEJfdZpUDS9IDF0B8Zb/9KjpkRX5BnvJWaH2DWgc=; b=ikFVOLUYl3i57zYvM0ACCJe20k
	pa0vuBq/p3GidFyOLsoZ6mF1TRAe9tg1Ana0wWyhJHW/W5y+a+y7VawP4jjiKMoTeHuVO3EdXBHSB
	f382vFM7GkzqP5RkVdHzbuCE9Z9vDKMSkuMrIKNFOWwE0DlGFQk4YKDtgAJ5KLwbnZHXxwvdTPF41
	mhh/DX6dh1y8zJjgI4Sb8phr27xdSFxwAkwFSTziH1kvI1QvWr8Dq27d+0RyUkEzk5JDE1jzgjSQ1
	xoP5941HF/z8YkAdRdth9qwdbZ7RHJv9LZyfCfLKZsrjnnL6EVWR4h7uC1zjpUW/cp1UBQFaxB42i
	piBNk+GQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDcTe-0050uv-1c;
	Sat, 10 May 2025 13:10:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 13:10:22 +0800
Date: Sat, 10 May 2025 13:10:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch wrapper
Message-ID: <aB7fvi_FBdnmLUON@gondor.apana.org.au>
References: <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510044450.GA505731@sol>

On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
>
> This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> failing.

You're right.  I'll revert this and apply the following patch
instead.

BTW this thing is still hopelessly broken if it's called from
softirq context because there is no SIMD fallback.  Yes I removed
the SIMD check but it was already broken before that as it simply
switched from the 4-block version to the 1-block version if SIMD
is not available rather than actually doing something that is
safe in softirq context.

Perhaps we should just remove this altogether until it's fixed.

---8<---
Add poly1305_emit_arch with fallback instead of calling assembly
directly.  This is because the state format differs between p10
and that of the generic implementation.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Reported-by: Eric Biggers <ebiggers@google.com>
Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
index 7cea0ebcc6bc..3f1664a724b6 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
@@ -14,10 +14,7 @@
 
 asmlinkage void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m, u32 mlen);
 asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m, u32 mlen, int highbit);
-asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
-				   u8 digest[POLY1305_DIGEST_SIZE],
-				   const u32 nonce[4]);
-EXPORT_SYMBOL_GPL(poly1305_emit_arch);
+asmlinkage void poly1305_emit_64(const struct poly1305_state *state, const u32 nonce[4], u8 digest[POLY1305_DIGEST_SIZE]);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
 
@@ -65,6 +62,16 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 }
 EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
 
+void poly1305_emit_arch(const struct poly1305_state *state,
+			u8 digest[POLY1305_DIGEST_SIZE],
+			const u32 nonce[4])
+{
+	if (!static_key_enabled(&have_p10))
+		return poly1305_emit_generic(state, digest, nonce);
+	poly1305_emit_64(state, nonce, digest);
+}
+EXPORT_SYMBOL_GPL(poly1305_emit_arch);
+
 bool poly1305_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_p10);
diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
index 2ba2911b8038..a3c1987f1ecd 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10le_64.S
+++ b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
@@ -1030,7 +1030,7 @@ SYM_FUNC_END(poly1305_64s)
 # Input: r3 = h, r4 = s, r5 = mac
 # mac = h + s
 #
-SYM_FUNC_START(poly1305_emit_arch)
+SYM_FUNC_START(poly1305_emit_64)
 	ld	10, 0(3)
 	ld	11, 8(3)
 	ld	12, 16(3)
@@ -1060,7 +1060,7 @@ Skip_h64:
 	std	10, 0(5)
 	std	11, 8(5)
 	blr
-SYM_FUNC_END(poly1305_emit_arch)
+SYM_FUNC_END(poly1305_emit_64)
 
 SYM_DATA_START_LOCAL(RMASK)
 .align 5
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

