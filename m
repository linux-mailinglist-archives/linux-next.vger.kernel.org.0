Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F27381B2E
	for <lists+linux-next@lfdr.de>; Sat, 15 May 2021 23:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbhEOV0A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 15 May 2021 17:26:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:45974 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229938AbhEOVZ6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 15 May 2021 17:25:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 66417AC36;
        Sat, 15 May 2021 21:24:44 +0000 (UTC)
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in kmalloc_index()
 to compile-time
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, naresh.kamboju@linaro.org,
        clang-built-linux@googlegroups.com, linux-next@vger.kernel.org,
        ndesaulniers@google.com, lkft-triage@lists.linaro.org,
        sfr@canb.auug.org.au, arnd@arndb.de, Marco Elver <elver@google.com>
References: <20210511173448.GA54466@hyeyoo> <20210515210950.GA52841@hyeyoo>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
Date:   Sat, 15 May 2021 23:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515210950.GA52841@hyeyoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/15/21 11:09 PM, Hyeonggon Yoo wrote:
> Hello Vlastimil, recently kbuild-all test bot reported compile error on
> clang 10.0.1, with defconfig.

Hm yes, catching some compiler bug was something that was noted to be
possible to happen.

> Nathan Chancellor wrote:
>> I think this happens because arch_prepare_optimized_kprobe() calls kzalloc()
>> with a size of MAX_OPTINSN_SIZE, which is
>>
>> #define MAX_OPTINSN_SIZE                                \
>>       (((unsigned long)optprobe_template_end -        \
>>          (unsigned long)optprobe_template_entry) +     \
>>         MAX_OPTIMIZED_LENGTH + JMP32_INSN_SIZE)
> 
>> and the optprobe_template_{end,entry} are not evaluated as constants.
>>
>> I am not sure what the solution is. There seem to be a growing list of issues
>> with LLVM 10 that were fixed in LLVM 11, which might necessitate requiring
>> LLVM 11 and newer to build the kernel, given this affects a defconfig.
>> Cheers,
>> Nathan
> 
> 
> I think it's because kmalloc compiles successfully when size is constant,
> and kmalloc_index isn't. so I think compiler seems to be confused.
> 
> currently if size is non-constant, kmalloc calls dummy function __kmalloc,
> which always returns NULL.

That's a misunderstanding. __kmalloc() is not a dummy function, you
probably found only the header declaration.

> so what about changing kmalloc to do compile-time assertion too, and track
> all callers that are calling kmalloc with non-constant argument.

kmalloc() is expected to be called with both constant and non-constant
size. __builtin_constant_p() is used to determine which implementation
to use. One based on kmalloc_index(), other on __kmalloc().

It appears clang 10.0.1 is mistakenly evaluating __builtin_constant_p()
as true. Probably something to do with LTO, because MAX_OPTINSN_SIZE
seems it could be a "link-time constant".

Maybe we could extend Marco Elver's followup patch that uses
BUILD_BUG_ON vs BUG() depending on size_is_constant parameter. It could
use BUG() also if the compiler is LLVM < 11 or something. What would be
the proper code for this condition?

> How do you think? If you think it is the solution, I'll do that work.
> 

