Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEDAD1572D6
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 11:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgBJK35 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 05:29:57 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60938 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbgBJK34 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Feb 2020 05:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=51T9FTkvQLJ7z4PLciD2NEp54RLtdPsfHNn9A3lziCY=; b=qdEQedxK/vw6s/drLkb7xBmTDe
        /wqG/suwgAYUUqKR7XUK6LQmA4zUeEjxrFidv3WACw73ClvbDYpa1KUtGO1K+QJy8ugM29HeXwz/8
        jkcL/lLaojZGAcu0Wc240HhqMkTZGSDOr7JkrIm9luWDHZe97EfKotfSp/xZ0s5vNROu3qRLdXRfu
        Z8V24+0PnSzma69wA9ZUQ9doFCllwMEnCo9kPKGabPDyGlk5j+RrJuhGpxxdxkQXM3SALOnoyPpzE
        ecfNEr1D+ulvYGnRgLPjfZgw/IEhkfqsPYp3kMh31anmmdKh6ZV2bArsvX0HHOA7Tr2Tss7+j4j8m
        XUIGzCIg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j16K9-0007nQ-Hs; Mon, 10 Feb 2020 10:29:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B06A330066E;
        Mon, 10 Feb 2020 11:28:03 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 811C620148930; Mon, 10 Feb 2020 11:29:51 +0100 (CET)
Date:   Mon, 10 Feb 2020 11:29:51 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: linux-next: Tree for Feb 7 (objtool warning)
Message-ID: <20200210102951.GD14879@hirez.programming.kicks-ass.net>
References: <20200207115949.7bd62ec3@canb.auug.org.au>
 <cc2b942d-d29d-710c-a9f3-e762c76c3d06@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc2b942d-d29d-710c-a9f3-e762c76c3d06@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 07, 2020 at 08:17:25AM -0800, Randy Dunlap wrote:
> on x86_64:
> 
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x6c7: call to gen8_canonical_addr() with UACCESS enabled

> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_64BIT=y

That's just really sad, stupid compiler.

Something like so I suppose...

diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 51b8718513bc..db6b75d4572f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -330,12 +330,12 @@
  * canonical form [63:48] == [47]."
  */
 #define GEN8_HIGH_ADDRESS_BIT 47
-static inline u64 gen8_canonical_addr(u64 address)
+static __always_inline u64 gen8_canonical_addr(u64 address)
 {
 	return sign_extend64(address, GEN8_HIGH_ADDRESS_BIT);
 }
 
-static inline u64 gen8_noncanonical_addr(u64 address)
+static __always_inline u64 gen8_noncanonical_addr(u64 address)
 {
 	return address & GENMASK_ULL(GEN8_HIGH_ADDRESS_BIT, 0);
 }
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 47f54b459c26..9acf654f0b19 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -162,7 +162,7 @@ static inline __u8 ror8(__u8 word, unsigned int shift)
  *
  * This is safe to use for 16- and 8-bit types as well.
  */
-static inline __s32 sign_extend32(__u32 value, int index)
+static __always_inline __s32 sign_extend32(__u32 value, int index)
 {
 	__u8 shift = 31 - index;
 	return (__s32)(value << shift) >> shift;
@@ -173,7 +173,7 @@ static inline __s32 sign_extend32(__u32 value, int index)
  * @value: value to sign extend
  * @index: 0 based bit index (0<=index<64) to sign bit
  */
-static inline __s64 sign_extend64(__u64 value, int index)
+static __always_inline __s64 sign_extend64(__u64 value, int index)
 {
 	__u8 shift = 63 - index;
 	return (__s64)(value << shift) >> shift;
