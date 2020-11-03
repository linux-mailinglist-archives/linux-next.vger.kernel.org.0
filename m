Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F242A4917
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 16:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgKCPNG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 10:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728354AbgKCPMX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 10:12:23 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C615C0613D1
        for <linux-next@vger.kernel.org>; Tue,  3 Nov 2020 07:12:21 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id n12so7108280ioc.2
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2020 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ug8fK7m5eh7whF/+i7AafuVKrr4WoRMnY59aR9Lk550=;
        b=zKu2Sb0EIuI8/KAXy7LU4ZPBYdboOJBPJ3nxa5R+1jyFmkP9Vm14qWCTOAKYFvn9Do
         wQM1nyGtcGAF1kWnfMVQ6j5YKNxdBocWSRAc3x2g+njMzUSzYAXxXV/EVojjG0dqgBEH
         wdMSgeIhMI4ERr0dItVLUFr5jlCCeNoVIA7fGLFpUL/3A32k8Okbbxyp01nMwUBLYqM5
         m9g15ZYVtMXYLGpjnryY3oEShjHzbhLghdAvbU/Uk8SR4NifFyszHcza7nDuZquytQDm
         b5WYSkIhNxlhE2J6535hHggtKbcWyii/uBswu3awBOJ876w+7+RI1GYD7JuZY8XelGqi
         tSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ug8fK7m5eh7whF/+i7AafuVKrr4WoRMnY59aR9Lk550=;
        b=fJzfzCprz/XK9sRfKFBOvF52DExaXiFzJB6hystJz6UvVvuXKp4ECA80fl6YvkBJE5
         ey7dt8Rzqag0d3KGKcQxX3aw/aiBq3lSn5nDhzBX/RHEA0tm54NUKCzffxhAqwOSQJQL
         Z6w6fgbb/4vORk6yzsYN7NJ6phJYhU5CWKCEHdmG0mpPd0yDVU0ugKuC55mQlHVSQyT1
         l22OyOJzDh6vzT1DPtLbFvrJZvsH+Ybvk7qqhT+fzDIvJjBrtLgl1B6ETpe5vG+6dXK/
         Fg6o5NZxAlqMypw57HO5ztfFgIGeiHr9zIWkQ/IYFz/ljbNBOJ23J8LfNUoMSlBk5GCi
         NfIg==
X-Gm-Message-State: AOAM532VsmaH+VR3pMl6Inai+01uCBP/Ewmjn9EhygaIHaDib8Ju9sIY
        9egy40lOmWT9SgzK6KiWk0mXHYlKKDQ6Nw==
X-Google-Smtp-Source: ABdhPJzJqAJmYJVz7glef0OE/8EguiYNI7ZepjftULUIsvwkDD4FnLHDg9/4ZjevukvLjk6JskrNfQ==
X-Received: by 2002:a6b:4014:: with SMTP id k20mr14377748ioa.177.1604416340638;
        Tue, 03 Nov 2020 07:12:20 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id d142sm7386448iof.43.2020.11.03.07.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 07:12:20 -0800 (PST)
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
To:     Sven Schnelle <svens@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <yt9do8ke4seh.fsf@linux.ibm.com>
 <75a238c7-fc37-21dd-bd89-d4c87a206eaa@kernel.dk>
 <yt9dk0v21o0i.fsf@linux.ibm.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f3ef071a-bbbc-1133-ed7b-6307919c4c3c@kernel.dk>
Date:   Tue, 3 Nov 2020 08:12:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <yt9dk0v21o0i.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/3/20 8:03 AM, Sven Schnelle wrote:
> Hi Jens,
> 
> Jens Axboe <axboe@kernel.dk> writes:
> 
>> On 11/3/20 4:00 AM, Sven Schnelle wrote:
>>> Hi Jens,
>>>
>>> Heiko Carstens <hca () linux ! ibm ! com> writes:
>>>
>>>> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
>>>>> Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>>>>
>>>>> Cc: linux-s390@vger.kernel.org
>>>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>>> ---
>>>>>
>>>>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>>>>> for details:
>>>>>
>>>>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>>>>
>>>>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>>>>> as that will enable a set of cleanups once all of them support it. I'm
>>>>> happy carrying this patch if need be, or it can be funelled through the
>>>>> arch tree. Let me know.
>>>>>
>>>>>  arch/s390/include/asm/thread_info.h | 2 ++
>>>>>  arch/s390/kernel/entry.S            | 7 ++++++-
>>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
>>>>> index 13a04fcf7762..0045341ade48 100644
>>>>> --- a/arch/s390/include/asm/thread_info.h
>>>>> +++ b/arch/s390/include/asm/thread_info.h
>>>>> @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
>>>>>  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
>>>>>  #define TIF_PATCH_PENDING	5	/* pending live patching update */
>>>>>  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
>>>>> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>>>>  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
>>>>>  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
>>>>>  
>>>>> @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
>>>>>  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
>>>>>  
>>>>>  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
>>>>> +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
>>>>>  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
>>>>>  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
>>>>>  #define _TIF_UPROBE		BIT(TIF_UPROBE)
>>>>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>>>>> index 86235919c2d1..a30d891e8045 100644
>>>>> --- a/arch/s390/kernel/entry.S
>>>>> +++ b/arch/s390/kernel/entry.S
>>>>> @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
>>>>>  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
>>>>>  
>>>>>  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
>>>>> -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
>>>>> +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
>>>>> +		   _TIF_NOTIFY_SIGNAL)
>>>>>  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
>>>>>  		   _TIF_SYSCALL_TRACEPOINT)
>>>>>  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
>>>>> @@ -463,6 +464,8 @@ ENTRY(system_call)
>>>>>  #endif
>>>>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>>>>  	jo	.Lsysc_syscall_restart
>>>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>>>> +	jo	.Lsysc_sigpending
>>>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>>>  	jo	.Lsysc_sigpending
>>>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>>>> @@ -857,6 +860,8 @@ ENTRY(io_int_handler)
>>>>>  #endif
>>>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>>>  	jo	.Lio_sigpending
>>>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>>>> +	jo	.Lio_sigpending
>>>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>>>>  	jo	.Lio_notify_resume
>>>>>  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
>>>>
>>>> (full quote so you can make sense of the patch below).
>>>>
>>>> Please merge the patch below into this one. With that:
>>>>
>>>> Acked-by: Heiko Carstens <hca@linux.ibm.com>
>>>>
>>>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>>>> index a30d891e8045..31f16d903ef3 100644
>>>> --- a/arch/s390/kernel/entry.S
>>>> +++ b/arch/s390/kernel/entry.S
>>>> @@ -464,9 +464,7 @@ ENTRY(system_call)
>>>>  #endif
>>>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>>>  	jo	.Lsysc_syscall_restart
>>>> -	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>>> -	jo	.Lsysc_sigpending
>>>> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>>>>  	jo	.Lsysc_sigpending
>>>
>>> We need to also change the jo to jnz - in combination with tm, jo means
>>> 'jump if all tested bits are set' while jnz means 'jump if at least one
>>> bit is set'
>>
>> Ah thanks, good catch. And you also caught the braino in signal.c, here's
>> the end result:
>>
>>
>> commit 0eb7d372d5319970bd15f2dbc18264ea576214d4
>> Author: Jens Axboe <axboe@kernel.dk>
>> Date:   Fri Oct 9 15:34:12 2020 -0600
>>
>>     s390: add support for TIF_NOTIFY_SIGNAL
>>     
>>     Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>     
>>     Cc: linux-s390@vger.kernel.org
>>     Acked-by: Heiko Carstens <hca@linux.ibm.com>
>>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>
>> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
>> index 13a04fcf7762..0045341ade48 100644
>> --- a/arch/s390/include/asm/thread_info.h
>> +++ b/arch/s390/include/asm/thread_info.h
>> @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
>>  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
>>  #define TIF_PATCH_PENDING	5	/* pending live patching update */
>>  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
>> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
>>  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
>>  
>> @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
>>  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
>>  
>>  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
>> +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
>>  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
>>  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
>>  #define _TIF_UPROBE		BIT(TIF_UPROBE)
>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>> index 86235919c2d1..19a89f292290 100644
>> --- a/arch/s390/kernel/entry.S
>> +++ b/arch/s390/kernel/entry.S
>> @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
>>  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
>>  
>>  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
>> -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
>> +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
>> +		   _TIF_NOTIFY_SIGNAL)
>>  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
>>  		   _TIF_SYSCALL_TRACEPOINT)
>>  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
>> @@ -463,8 +464,8 @@ ENTRY(system_call)
>>  #endif
>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>  	jo	.Lsysc_syscall_restart
>> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>> -	jo	.Lsysc_sigpending
>> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>> +	jnz	.Lsysc_sigpending
>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>  	jo	.Lsysc_notify_resume
>>  	TSTMSK	__LC_CPU_FLAGS,(_CIF_ASCE_PRIMARY|_CIF_ASCE_SECONDARY)
>> @@ -855,8 +856,8 @@ ENTRY(io_int_handler)
>>  	TSTMSK	__TI_flags(%r12),_TIF_PATCH_PENDING
>>  	jo	.Lio_patch_pending
>>  #endif
>> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>> -	jo	.Lio_sigpending
>> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>> +	jnz	.Lio_sigpending
>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>  	jo	.Lio_notify_resume
>>  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
>> diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
>> index 9e900a8977bd..b27b6c1f058d 100644
>> --- a/arch/s390/kernel/signal.c
>> +++ b/arch/s390/kernel/signal.c
>> @@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
>>  	current->thread.system_call =
>>  		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
>>  
>> -	if (get_signal(&ksig)) {
>> +	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
>>  		/* Whee!  Actually deliver the signal.  */
>>  		if (current->thread.system_call) {
>>  			regs->int_code = current->thread.system_call;
> 
> Looks good, feel free to add my Acked-by.

Thanks for your help! Added.

-- 
Jens Axboe

