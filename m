Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0422A475C
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 15:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgKCOKa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 09:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729499AbgKCOJI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 09:09:08 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ADFC061A47
        for <linux-next@vger.kernel.org>; Tue,  3 Nov 2020 06:09:08 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id r12so9551772iot.4
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2020 06:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l4FOhOeqEnVDoJ5bRT/ISdT4bxQ89fRTQwVSHjkBPV4=;
        b=wCYdVovMWgk50XhjaI6MZEIe+2qazFELy2KweoNTlevdXGalqq+TNcRGcqrJ3jlbCR
         9FlLQTcVyeigRJKthVgaTYg61ILCpXVmFsmb9Bd87N4wUhED2MRCzh9TlIt5v3MWSLtg
         19Uxm6paNYF3LL38Ltlc/pL387aIUtRGJPt320OkS7aiqLjDPB02HaGZMiu9HHW07d1N
         HbroL7AjMb3V9olgRYf+B4Op9ZZPWQH7s6TsgsDJ9D9Lu9yrOct6EFEamd/SoOV9jlNH
         YokGScBs6FeqPbhPRQDnPYByaKjczh/aS5zRU142Jkh+1gS7i+ageCLLotjPAv091Fvi
         SQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l4FOhOeqEnVDoJ5bRT/ISdT4bxQ89fRTQwVSHjkBPV4=;
        b=rEYGvX2xwVSlDgk2sKHwnCOYyXR4S5SZKVIMs7CyE8KhB07XKnp8H8ctgCx2TOzkEd
         lgWN2w+8Q6vXpHCksS56t/ohrLqMB1o0WNoHdd6pYHc61pEYdkMdy7cHnIVWGjWmsor8
         z+GjbBsrlHQAoxZwR4SpMU5yzDWTcMU2VvZDcdXCz48QjhYUTy6cdeOo/4Ym6Xj2W4T8
         9e796e5aIU081BGoiUkpUkirmOUWWIgHjCiyEj5ZpkeRL7IZZcytiE5wQBE4rY9FZYKc
         hN8HLchzFllHQs8cdoQXzx0xB48GPryAjpq4y1JY/7aP4c2NTJ7EGrwfVim93JYFtIF1
         pH9A==
X-Gm-Message-State: AOAM531fK6ONeIcQHLaiDRJSgpekEd87XfjmRe2aXjFISGFYgW/Geo0W
        B6lM7BHJH6Epg+HG5HC9e0P1IAR8sfdOXw==
X-Google-Smtp-Source: ABdhPJy+Ec2OoR+gvf+GTh9vliPMPS2o/zLXQZlL9vFyi0qFZvf0Iv9DJF3eWtdyWzPQ/PpQXmpmCA==
X-Received: by 2002:a6b:bbc6:: with SMTP id l189mr14375899iof.145.1604412547589;
        Tue, 03 Nov 2020 06:09:07 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id t2sm11484264iob.5.2020.11.03.06.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 06:09:07 -0800 (PST)
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
To:     Sven Schnelle <svens@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <yt9do8ke4seh.fsf@linux.ibm.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <75a238c7-fc37-21dd-bd89-d4c87a206eaa@kernel.dk>
Date:   Tue, 3 Nov 2020 07:09:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <yt9do8ke4seh.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/3/20 4:00 AM, Sven Schnelle wrote:
> Hi Jens,
> 
> Heiko Carstens <hca () linux ! ibm ! com> writes:
> 
>> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
>>> Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>>
>>> Cc: linux-s390@vger.kernel.org
>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>> ---
>>>
>>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>>> for details:
>>>
>>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>>
>>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>>> as that will enable a set of cleanups once all of them support it. I'm
>>> happy carrying this patch if need be, or it can be funelled through the
>>> arch tree. Let me know.
>>>
>>>  arch/s390/include/asm/thread_info.h | 2 ++
>>>  arch/s390/kernel/entry.S            | 7 ++++++-
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
>>> index 13a04fcf7762..0045341ade48 100644
>>> --- a/arch/s390/include/asm/thread_info.h
>>> +++ b/arch/s390/include/asm/thread_info.h
>>> @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
>>>  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
>>>  #define TIF_PATCH_PENDING	5	/* pending live patching update */
>>>  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
>>> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>>  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
>>>  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
>>>  
>>> @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
>>>  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
>>>  
>>>  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
>>> +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
>>>  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
>>>  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
>>>  #define _TIF_UPROBE		BIT(TIF_UPROBE)
>>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>>> index 86235919c2d1..a30d891e8045 100644
>>> --- a/arch/s390/kernel/entry.S
>>> +++ b/arch/s390/kernel/entry.S
>>> @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
>>>  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
>>>  
>>>  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
>>> -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
>>> +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
>>> +		   _TIF_NOTIFY_SIGNAL)
>>>  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
>>>  		   _TIF_SYSCALL_TRACEPOINT)
>>>  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
>>> @@ -463,6 +464,8 @@ ENTRY(system_call)
>>>  #endif
>>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>>  	jo	.Lsysc_syscall_restart
>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>> +	jo	.Lsysc_sigpending
>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>  	jo	.Lsysc_sigpending
>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>> @@ -857,6 +860,8 @@ ENTRY(io_int_handler)
>>>  #endif
>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>  	jo	.Lio_sigpending
>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>> +	jo	.Lio_sigpending
>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>>  	jo	.Lio_notify_resume
>>>  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
>>
>> (full quote so you can make sense of the patch below).
>>
>> Please merge the patch below into this one. With that:
>>
>> Acked-by: Heiko Carstens <hca@linux.ibm.com>
>>
>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>> index a30d891e8045..31f16d903ef3 100644
>> --- a/arch/s390/kernel/entry.S
>> +++ b/arch/s390/kernel/entry.S
>> @@ -464,9 +464,7 @@ ENTRY(system_call)
>>  #endif
>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>  	jo	.Lsysc_syscall_restart
>> -	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>> -	jo	.Lsysc_sigpending
>> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>>  	jo	.Lsysc_sigpending
> 
> We need to also change the jo to jnz - in combination with tm, jo means
> 'jump if all tested bits are set' while jnz means 'jump if at least one
> bit is set'

Ah thanks, good catch. And you also caught the braino in signal.c, here's
the end result:


commit 0eb7d372d5319970bd15f2dbc18264ea576214d4
Author: Jens Axboe <axboe@kernel.dk>
Date:   Fri Oct 9 15:34:12 2020 -0600

    s390: add support for TIF_NOTIFY_SIGNAL
    
    Wire up TIF_NOTIFY_SIGNAL handling for s390.
    
    Cc: linux-s390@vger.kernel.org
    Acked-by: Heiko Carstens <hca@linux.ibm.com>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
index 13a04fcf7762..0045341ade48 100644
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
 #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
 #define TIF_PATCH_PENDING	5	/* pending live patching update */
 #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
+#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
 #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
 #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
 
@@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
 
 #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
+#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
 #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
 #define _TIF_UPROBE		BIT(TIF_UPROBE)
diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
index 86235919c2d1..19a89f292290 100644
--- a/arch/s390/kernel/entry.S
+++ b/arch/s390/kernel/entry.S
@@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
 STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
 
 _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
-		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
+		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
+		   _TIF_NOTIFY_SIGNAL)
 _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
 		   _TIF_SYSCALL_TRACEPOINT)
 _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
@@ -463,8 +464,8 @@ ENTRY(system_call)
 #endif
 	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
 	jo	.Lsysc_syscall_restart
-	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
-	jo	.Lsysc_sigpending
+	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
+	jnz	.Lsysc_sigpending
 	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
 	jo	.Lsysc_notify_resume
 	TSTMSK	__LC_CPU_FLAGS,(_CIF_ASCE_PRIMARY|_CIF_ASCE_SECONDARY)
@@ -855,8 +856,8 @@ ENTRY(io_int_handler)
 	TSTMSK	__TI_flags(%r12),_TIF_PATCH_PENDING
 	jo	.Lio_patch_pending
 #endif
-	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
-	jo	.Lio_sigpending
+	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
+	jnz	.Lio_sigpending
 	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
 	jo	.Lio_notify_resume
 	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
index 9e900a8977bd..b27b6c1f058d 100644
--- a/arch/s390/kernel/signal.c
+++ b/arch/s390/kernel/signal.c
@@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
 	current->thread.system_call =
 		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
 		/* Whee!  Actually deliver the signal.  */
 		if (current->thread.system_call) {
 			regs->int_code = current->thread.system_call;

-- 
Jens Axboe

