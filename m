Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0FD386E69
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 02:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbhERAom (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 20:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239149AbhERAom (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 May 2021 20:44:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22C0D60FF0;
        Tue, 18 May 2021 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621298605;
        bh=YhiRwfdTmsYWyIN8KfAxmHBe/njsn546d3dY8ADNxg4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JGZFQJSbnkMWdYXTittkfh+uDbQRsOYMx1H4lXaD1nBSB8bW6BDmQuUQJXbSsqt85
         xNnv/7c1/Ax5CqCOE1xahL4hZ/GdNjVUMkuhNnoHnv7DQZLVMtqMKxT6AKD28Jf8Bc
         J8OcmJZXudlxVLPGxo/UhQiOLgpQrks6LHv0s/Zc5SquGlZg19Elntm/cBQODi0JWY
         gDVegA4O2FBp0KxhTR6karwrzp4l4z9I17S+1IZ7JpFnxHICY3mIsuX3Nes2ocrV8r
         VXQHET3d1VW9knKUMSlZ5y0gP/sdzviuAjrlarbCQETjva7/EGgYZZGTTGnlFf0+q6
         Pb/ZPRE41MgKA==
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in kmalloc_index()
 to compile-time
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
References: <20210511173448.GA54466@hyeyoo> <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161> <20210518003859.GC80297@hyeyoo>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
Date:   Mon, 17 May 2021 17:43:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518003859.GC80297@hyeyoo>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/17/2021 5:38 PM, Hyeonggon Yoo wrote:
> On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
>> This should work I think:
> 
> compiled well with clang-10.0.1, clang-11.0.0,
> and gcc-10.2.0 with x86_64 default config.
> 
> is the condition CONFIG_CLANG_VERSION > 110000,
> not including 110000 it self?

Ah sorry, that should definitely be >= :(

That is what I get for writing an email that late... in reality, it 
probably won't matter due to the availability of 11.0.1 and 11.1.0 but 
it should absolutely be changed.

I have not given Nick's patch a go yet but would something like this be 
acceptable? If so, did you want me to send a formal fixup patch or did 
you want to send a v4? I have no personal preference.

>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>> index 9d316aac0aba..1b653266f2aa 100644
>> --- a/include/linux/slab.h
>> +++ b/include/linux/slab.h
>> @@ -413,7 +413,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
>>   	if (size <=  16 * 1024 * 1024) return 24;
>>   	if (size <=  32 * 1024 * 1024) return 25;
>>   
>> -	if (size_is_constant)
>> +	if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION > 110000) && size_is_constant)
>>   		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
>>   	else
>>   		BUG();

