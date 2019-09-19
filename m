Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56368B831C
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 23:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732971AbfISVJm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 17:09:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49186 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732968AbfISVJl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 17:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LRFKtLfl3rGg6hIBWZRy1shlE7PvB7ThwahdssU1WZQ=; b=NBVpQfu/8MPESbwFRTyM97kN9
        pgz3tLZKw02m/O9UCtWMQKLoNapTBhfPARRCdjUmHSSUI5G3EahebhTKH9vxMZGOAMs7kRHZrmMYs
        QvotGklKRPE/PS8vbnyMEMOg7/5yvwVQ1lKTM1rpQO3t8H4Qstmudi81bYjfFxjMcKCZNMta65sBa
        fmPfg2obMIMw+vgKuM/Vt7hndMT//YHm/PW6T22Px2FOls1N4vvWZw6LnWoQyywZMLRDOWhm/6XfP
        GkVzRVE+Z67T3wfHbFHDhpzBPXAEb6DwJT987swiWwFLNgV/aPg9jnbBVNCMYPvArzGNBqdPjnTNU
        3vp2sO+5Q==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iB3gL-0001dK-Ew; Thu, 19 Sep 2019 21:09:41 +0000
Subject: Re: linux-next: Tree for Sep 18 (objtool)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
 <20190919165118.lffzvrl5efbpnvux@treble>
 <8dc0ef20-c776-bfdc-de31-1759125c77e9@infradead.org>
 <20190919194036.smeaapv6armqswub@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2ab5a918-529e-405d-57c0-68d5406269fc@infradead.org>
Date:   Thu, 19 Sep 2019 14:09:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919194036.smeaapv6armqswub@treble>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/19/19 12:40 PM, Josh Poimboeuf wrote:
> On Thu, Sep 19, 2019 at 12:21:46PM -0700, Randy Dunlap wrote:
>> On 9/19/19 9:51 AM, Josh Poimboeuf wrote:
>>> On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
>>>> On 9/18/19 3:10 PM, Mark Brown wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20190917:
>>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
>>>>
>>>> using
>>>>> gcc --version
>>>> gcc (SUSE Linux) 7.4.1 20190424 [gcc-7-branch revision 270538]
>>>>
>>>> .o and .config files are attached.
>>>
>>> Does this fix it?
>>
>> This patch produces this message:
>>
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to sign_extend64.constprop.20() with UACCESS enabled
> 
> Ha, ok.  I guess we have to __always_inline that one too...

Yes, that takes care of the objtool warning.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b5f6937369ea..7e111cb5b14b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -284,7 +284,7 @@ struct i915_execbuffer {
>   * canonical form [63:48] == [47]."
>   */
>  #define GEN8_HIGH_ADDRESS_BIT 47
> -static inline u64 gen8_canonical_addr(u64 address)
> +static __always_inline u64 gen8_canonical_addr(u64 address)
>  {
>  	return sign_extend64(address, GEN8_HIGH_ADDRESS_BIT);
>  }
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index cf074bce3eb3..fae10792b198 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -151,7 +151,7 @@ static inline __s32 sign_extend32(__u32 value, int index)
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
