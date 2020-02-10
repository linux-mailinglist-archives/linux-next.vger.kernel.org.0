Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1121158052
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 17:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgBJQ7m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 11:59:42 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:45458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbgBJQ7m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Feb 2020 11:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=mBy7dqohNwvOk+ZMRCPlzGmp4QZzgga4Z1izCZNDzEE=; b=R4cRH8fBLLD7spNiz3WH9LPKhW
        5QwrAYXay6lpxvPsnqG9JgAx7lNjBbjxx/7ib56rLH9puQ8LnIApmNo/w8N7uuOhCtl/ZBwthbYHg
        H+UjaEV35vKCuZcZXv0nY7iZ7b1u0RcCEwLLdP4/1EeVV/rviQummfgdsi2vI/WdUeFTq/e9jKUWJ
        lAmmYAfHyK4HoBL2SGjopNjmwvv1NQDB0s8pSW1pHqGV20hfPkyynQC18bkeuHsUKLdIoClHNYhhc
        4gCFg76veqyrKXBpad09mzxVYZ5vYSqwVzGuLoc8z38fLae2PRoUEjLb3Bx26AQWDHogARGfoN7LZ
        SNRhrWsQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j1CPI-0005DG-JI; Mon, 10 Feb 2020 16:59:36 +0000
Subject: Re: linux-next: Tree for Feb 7 (objtool warning)
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
References: <20200207115949.7bd62ec3@canb.auug.org.au>
 <cc2b942d-d29d-710c-a9f3-e762c76c3d06@infradead.org>
 <20200210102951.GD14879@hirez.programming.kicks-ass.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e2a5726f-1ddf-f95b-a3c3-b9d41a79579d@infradead.org>
Date:   Mon, 10 Feb 2020 08:59:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210102951.GD14879@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/10/20 2:29 AM, Peter Zijlstra wrote:
> On Fri, Feb 07, 2020 at 08:17:25AM -0800, Randy Dunlap wrote:
>> on x86_64:
>>
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x6c7: call to gen8_canonical_addr() with UACCESS enabled
> 
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> CONFIG_64BIT=y
> 
> That's just really sad, stupid compiler.
> 
> Something like so I suppose...

Yes, that works.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 51b8718513bc..db6b75d4572f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -330,12 +330,12 @@
>   * canonical form [63:48] == [47]."
>   */
>  #define GEN8_HIGH_ADDRESS_BIT 47
> -static inline u64 gen8_canonical_addr(u64 address)
> +static __always_inline u64 gen8_canonical_addr(u64 address)
>  {
>  	return sign_extend64(address, GEN8_HIGH_ADDRESS_BIT);
>  }
>  
> -static inline u64 gen8_noncanonical_addr(u64 address)
> +static __always_inline u64 gen8_noncanonical_addr(u64 address)
>  {
>  	return address & GENMASK_ULL(GEN8_HIGH_ADDRESS_BIT, 0);
>  }
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index 47f54b459c26..9acf654f0b19 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -162,7 +162,7 @@ static inline __u8 ror8(__u8 word, unsigned int shift)
>   *
>   * This is safe to use for 16- and 8-bit types as well.
>   */
> -static inline __s32 sign_extend32(__u32 value, int index)
> +static __always_inline __s32 sign_extend32(__u32 value, int index)
>  {
>  	__u8 shift = 31 - index;
>  	return (__s32)(value << shift) >> shift;
> @@ -173,7 +173,7 @@ static inline __s32 sign_extend32(__u32 value, int index)
>   * @value: value to sign extend
>   * @index: 0 based bit index (0<=index<64) to sign bit
>   */
> -static inline __s64 sign_extend64(__u64 value, int index)
> +static __always_inline __s64 sign_extend64(__u64 value, int index)
>  {
>  	__u8 shift = 63 - index;
>  	return (__s64)(value << shift) >> shift;
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
