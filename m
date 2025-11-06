Return-Path: <linux-next+bounces-8876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D4C39136
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F6843B1265
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE602C11D1;
	Thu,  6 Nov 2025 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuDnGUaQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4A2BDC3E;
	Thu,  6 Nov 2025 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402895; cv=none; b=GMfi/FuqRmaMt+yAyW1Bfmddfmh4M9SvPVqjyCC6QR5Sc8RrPS9+0BomB1VMypSIAYRIAe/HfgosX9sOTq+OVosD82eZnGRT0z5KNWjW3iWGv3KmYNJJOZiJjfrKx9QdH7+tb3ZtcUd+Kwx8LPG3bkS9Dtvh7uZu7N5G1kj4mpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402895; c=relaxed/simple;
	bh=j4bqPrG81dXQivWfYqO7HoNwllyea7OW+/68drQnzfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDwpwhu9xZlmD92Epytl6DNKbQX6o/VRkKrEPROyId4Nvg6ciFwjXUJxfB/APaUm812mmKkNbCk4NnPoy5EhkT4CH9NCzgRR/El47lMX3pGGcULLzGTNindCG+/T5xXEzqvhu5VBM2Sy0nF0H4SADRfV3pnedgDzMKSV4+r16FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuDnGUaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615AFC4CEF7;
	Thu,  6 Nov 2025 04:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762402894;
	bh=j4bqPrG81dXQivWfYqO7HoNwllyea7OW+/68drQnzfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuDnGUaQx/clfyPXz2wSOU92rhyqYDKvnYyd2QrtJ9UpIs3GB59HYjFMA/EbsHgRn
	 77wHmb3mXnsAoS5XEbZSOuECE/EE6IqYhSwZSUEGVJA3eBW4NsbTqOiTx0wvfs350r
	 evtCy2V1JuzIIB1f5V+gRoXIgqH+qTUnnYZzZQWKNBHC9KWUEz8lDUOneym8NhK9wZ
	 nEWkAKQn+gifR5xrK6n89ziYb8fcRROY4u+xn83IyDWMBdQ//t3EZzfutQTMqG755N
	 /3KU+4ndcKyqyCzPbN8W2hWDt4n5Nk05eADJuVPsfEok/IeCGm44OoxQlppq8FPjO2
	 lv7jCWE36MUeg==
Date: Wed, 5 Nov 2025 20:19:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the libcrypto tree
Message-ID: <20251106041953.GB1650@sol>
References: <20251106143623.06b23d57@canb.auug.org.au>
 <20251106035521.GA1650@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106035521.GA1650@sol>

On Wed, Nov 05, 2025 at 07:55:23PM -0800, Eric Biggers wrote:
> On Thu, Nov 06, 2025 at 02:36:23PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the libcrypto tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > WARNING: /home/sfr/kernels/next/next/include/crypto/sha3.h:74 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Zeroize a sha3_ctx.  This is already called by sha3_final().  Call this
> > 
> > Introduced by commit
> > 
> >   58873ecf091b ("lib/crypto: sha3: Add SHA-3 support")
> 
> Thanks.  Do you know if there's an easy way to find these ahead of time?
> I usually run './scripts/kernel-doc -v -none ${filename}' to catch
> kerneldoc issues.  I did run it on include/crypto/sha3.h, but for some
> reason it doesn't detect this issue.
> 
> 'make htmldocs' doesn't find it either, but does generate a bunch of
> unrelated warnings.  I may be missing an option to make it even more
> verbose.  Either way, it's also slow to run.
> 
> - Eric

Okay, it's because some kernel-doc warnings were accidentally turned off
for everyone :-(  And they just got turned back on by
https://lore.kernel.org/r/20251104215502.1049817-1-andriy.shevchenko@linux.intel.com/
With that applied, './scripts/kernel-doc -v -none include/crypto/sha3.h'
does catch this.

I folded the following into "lib/crypto: sha3: Add SHA-3 support" to
convert the comments starting with "/**" into proper kerneldoc comments:

diff --git a/include/crypto/sha3.h b/include/crypto/sha3.h
index d713b5e3d695..c9e4182ff74f 100644
--- a/include/crypto/sha3.h
+++ b/include/crypto/sha3.h
@@ -66,26 +66,40 @@ struct __sha3_ctx {
 
 void __sha3_update(struct __sha3_ctx *ctx, const u8 *in, size_t in_len);
 
-/** Context for SHA3-224, SHA3-256, SHA3-384, or SHA3-512 */
+/**
+ * struct sha3_ctx - Context for SHA3-224, SHA3-256, SHA3-384, or SHA3-512
+ * @ctx: private
+ */
 struct sha3_ctx {
 	struct __sha3_ctx ctx;
 };
 
 /**
- * Zeroize a sha3_ctx.  This is already called by sha3_final().  Call this
- * explicitly when abandoning a context without calling sha3_final().
+ * sha3_zeroize_ctx() - Zeroize a SHA-3 context
+ * @ctx: The context to zeroize
+ *
+ * This is already called by sha3_final().  Call this explicitly when abandoning
+ * a context without calling sha3_final().
  */
 static inline void sha3_zeroize_ctx(struct sha3_ctx *ctx)
 {
 	memzero_explicit(ctx, sizeof(*ctx));
 }
 
-/** Context for SHAKE128 or SHAKE256 */
+/**
+ * struct shake_ctx - Context for SHAKE128 or SHAKE256
+ * @ctx: private
+ */
 struct shake_ctx {
 	struct __sha3_ctx ctx;
 };
 
-/** Zeroize a shake_ctx.  Call this after the last squeeze. */
+/**
+ * shake_zeroize_ctx() - Zeroize a SHAKE context
+ * @ctx: The context to zeroize
+ *
+ * Call this after the last squeeze.
+ */
 static inline void shake_zeroize_ctx(struct shake_ctx *ctx)
 {
 	memzero_explicit(ctx, sizeof(*ctx));

