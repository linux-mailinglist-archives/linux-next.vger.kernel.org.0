Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF7623AF959
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 01:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhFUXc0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 19:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhFUXcZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 19:32:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17451C061574;
        Mon, 21 Jun 2021 16:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=a6d/NJHwlZq6AUmSTyCf+cV1g5N9qWN9aa1pKg9sprs=; b=skvz9csc7QNZpRvZn8BVFxduNn
        1k5bo0VZG6P7/V1/B0oKE98y9KldqDWB9KKDDWZ/+aAmcfE3Ix+MRWF7Q1m0U4V1NWWbn0gw5pGBb
        Zi0XXvgMNxBB2JcxaujqSNHoFl9OUdXxUa6Eg/atMd15BROCb2Nc583HHh9E4uEpb2FHem85i2Jfh
        USGfekmaseZncm3Lw3+ehHp3zpG4EVN/48PDjNlqnS830swJtyCLFoc6imzGKF0v+pM7KAKZ53CO0
        lsXK1DFPZ1BhEEG/LZOshC+FeRDrjk8HwiouDyi3eJsBZe83AJHI7+eEKdb0VjGNqrhFR/yOtJWFI
        cvdjtaHw==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lvTMk-0056DU-0a; Mon, 21 Jun 2021 23:30:06 +0000
Subject: Re: linux-next: Tree for Apr 16 (objtool: warnings)
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>
References: <20210416213625.14542675@canb.auug.org.au>
 <b3778b1a-9494-4724-5066-c000f7fb5e94@infradead.org>
 <YNCVaPtEWlsvQfjw@hirez.programming.kicks-ass.net>
 <YNCgxwLBiK9wclYJ@hirez.programming.kicks-ass.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <553df45e-57fe-1066-ee4f-0dcd023c24c6@infradead.org>
Date:   Mon, 21 Jun 2021 16:30:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNCgxwLBiK9wclYJ@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/21/21 7:23 AM, Peter Zijlstra wrote:
> On Mon, Jun 21, 2021 at 03:34:32PM +0200, Peter Zijlstra wrote:
>> On Fri, Apr 16, 2021 at 10:50:49AM -0700, Randy Dunlap wrote:
>>> On 4/16/21 4:36 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20210415:
>>>
>>>
>>> on x86_64, objtool is not liking retpoline.o:
>>>
>>> $ gcc --version
>>> gcc (SUSE Linux) 7.5.0
>>>
>>>
>>> Is there already a patch for these?
>>>
>>>
>>> ===== build-r8840.out =====
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
>>> arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
>>
>> Damn, sorry I missed this. I know what the problem is, but I've yet to
>> find a solution that's not terrible... hold on.
> 
> ---
> Subject: objtool/x86: Ignore __x86_indirect_alt_* symbols
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Mon Jun 21 16:13:55 CEST 2021
> 
> Because the __x86_indirect_alt* symbols are just that, objtool will
> try and validate them as regular symbols, instead of the alternative
> replacements that they are.
> 
> This goes sideways for FRAME_POINTER=y builds; which generate a fair
> amount of warnings.
> 
> Fixes: 9bc0bb50727c ("objtool/x86: Rewrite retpoline thunk calls")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Looks good in my testing.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> ---
>  arch/x86/lib/retpoline.S |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- a/arch/x86/lib/retpoline.S
> +++ b/arch/x86/lib/retpoline.S
> @@ -58,12 +58,16 @@ SYM_FUNC_START_NOALIGN(__x86_indirect_al
>  2:	.skip	5-(2b-1b), 0x90
>  SYM_FUNC_END(__x86_indirect_alt_call_\reg)
>  
> +STACK_FRAME_NON_STANDARD(__x86_indirect_alt_call_\reg)
> +
>  SYM_FUNC_START_NOALIGN(__x86_indirect_alt_jmp_\reg)
>  	ANNOTATE_RETPOLINE_SAFE
>  1:	jmp	*%\reg
>  2:	.skip	5-(2b-1b), 0x90
>  SYM_FUNC_END(__x86_indirect_alt_jmp_\reg)
>  
> +STACK_FRAME_NON_STANDARD(__x86_indirect_alt_jmp_\reg)
> +
>  .endm
>  
>  /*
> 


-- 
~Randy

