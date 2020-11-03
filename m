Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A402A490B
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 16:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgKCPLZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 10:11:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55940 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728065AbgKCPK0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 10:10:26 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3F2TF7143012;
        Tue, 3 Nov 2020 10:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=if4mpDunq58A+Ex+FveQIETr6THaLh3pzBLk1Trj8lo=;
 b=I3QPN5FeZKzjyYql0Ad/J3GYudbIbkVjPZyDW7+DQ7xzmwHraeY8tPmIllYTiD6EINzp
 2RBbLMrsJQNfe6JB8ap6STSQriScnUwj1wKwa8EcJuPj2DbALQuxLcvZl0pWBqsdWDbv
 Q1E6sLvs2R5CzpCvsEu3JccKABqTtEVEQGWk0cMAmgHbA2kdbVZEMR+dgLKteToH4Sqh
 pnY3ZaJm10D89r7sTBM2x1SI5SnUJxdhKDeH4ttfOfnAc5cwSIrsfVoSR1957gUnaSDi
 iuF12nB0XfFVXDiNRGUoHa/Uo8D1dIXfwtaHXGWL5/5eeliKPIq60DsrO49NsusFtGDY yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34k86cumpk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 10:10:12 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A3F2nQ2002400;
        Tue, 3 Nov 2020 10:09:35 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34k86cuka4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 10:09:35 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A3Elf1x017678;
        Tue, 3 Nov 2020 15:03:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma05fra.de.ibm.com with ESMTP id 34h01qsqqd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 15:03:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0A3F3FKL64553466
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Nov 2020 15:03:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CBE7AE053;
        Tue,  3 Nov 2020 15:03:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D7D48AE045;
        Tue,  3 Nov 2020 15:03:14 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  3 Nov 2020 15:03:14 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
References: <yt9do8ke4seh.fsf@linux.ibm.com>
        <75a238c7-fc37-21dd-bd89-d4c87a206eaa@kernel.dk>
Date:   Tue, 03 Nov 2020 16:03:09 +0100
In-Reply-To: <75a238c7-fc37-21dd-bd89-d4c87a206eaa@kernel.dk> (Jens Axboe's
        message of "Tue, 3 Nov 2020 07:09:06 -0700")
Message-ID: <yt9dk0v21o0i.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030102
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jens,

Jens Axboe <axboe@kernel.dk> writes:

> On 11/3/20 4:00 AM, Sven Schnelle wrote:
>> Hi Jens,
>> 
>> Heiko Carstens <hca () linux ! ibm ! com> writes:
>> 
>>> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
>>>> Wire up TIF_NOTIFY_SIGNAL handling for s390.
>>>>
>>>> Cc: linux-s390@vger.kernel.org
>>>> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>>>> ---
>>>>
>>>> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
>>>> for details:
>>>>
>>>> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>>>>
>>>> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
>>>> as that will enable a set of cleanups once all of them support it. I'm
>>>> happy carrying this patch if need be, or it can be funelled through the
>>>> arch tree. Let me know.
>>>>
>>>>  arch/s390/include/asm/thread_info.h | 2 ++
>>>>  arch/s390/kernel/entry.S            | 7 ++++++-
>>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
>>>> index 13a04fcf7762..0045341ade48 100644
>>>> --- a/arch/s390/include/asm/thread_info.h
>>>> +++ b/arch/s390/include/asm/thread_info.h
>>>> @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
>>>>  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
>>>>  #define TIF_PATCH_PENDING	5	/* pending live patching update */
>>>>  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
>>>> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>>>  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
>>>>  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
>>>>  
>>>> @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
>>>>  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
>>>>  
>>>>  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
>>>> +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
>>>>  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
>>>>  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
>>>>  #define _TIF_UPROBE		BIT(TIF_UPROBE)
>>>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>>>> index 86235919c2d1..a30d891e8045 100644
>>>> --- a/arch/s390/kernel/entry.S
>>>> +++ b/arch/s390/kernel/entry.S
>>>> @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
>>>>  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
>>>>  
>>>>  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
>>>> -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
>>>> +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
>>>> +		   _TIF_NOTIFY_SIGNAL)
>>>>  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
>>>>  		   _TIF_SYSCALL_TRACEPOINT)
>>>>  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
>>>> @@ -463,6 +464,8 @@ ENTRY(system_call)
>>>>  #endif
>>>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>>>  	jo	.Lsysc_syscall_restart
>>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>>> +	jo	.Lsysc_sigpending
>>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>>  	jo	.Lsysc_sigpending
>>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>>> @@ -857,6 +860,8 @@ ENTRY(io_int_handler)
>>>>  #endif
>>>>  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>>>  	jo	.Lio_sigpending
>>>> +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>>> +	jo	.Lio_sigpending
>>>>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>>>>  	jo	.Lio_notify_resume
>>>>  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
>>>
>>> (full quote so you can make sense of the patch below).
>>>
>>> Please merge the patch below into this one. With that:
>>>
>>> Acked-by: Heiko Carstens <hca@linux.ibm.com>
>>>
>>> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
>>> index a30d891e8045..31f16d903ef3 100644
>>> --- a/arch/s390/kernel/entry.S
>>> +++ b/arch/s390/kernel/entry.S
>>> @@ -464,9 +464,7 @@ ENTRY(system_call)
>>>  #endif
>>>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>>>  	jo	.Lsysc_syscall_restart
>>> -	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
>>> -	jo	.Lsysc_sigpending
>>> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
>>> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>>>  	jo	.Lsysc_sigpending
>> 
>> We need to also change the jo to jnz - in combination with tm, jo means
>> 'jump if all tested bits are set' while jnz means 'jump if at least one
>> bit is set'
>
> Ah thanks, good catch. And you also caught the braino in signal.c, here's
> the end result:
>
>
> commit 0eb7d372d5319970bd15f2dbc18264ea576214d4
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Fri Oct 9 15:34:12 2020 -0600
>
>     s390: add support for TIF_NOTIFY_SIGNAL
>     
>     Wire up TIF_NOTIFY_SIGNAL handling for s390.
>     
>     Cc: linux-s390@vger.kernel.org
>     Acked-by: Heiko Carstens <hca@linux.ibm.com>
>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
>
> diff --git a/arch/s390/include/asm/thread_info.h b/arch/s390/include/asm/thread_info.h
> index 13a04fcf7762..0045341ade48 100644
> --- a/arch/s390/include/asm/thread_info.h
> +++ b/arch/s390/include/asm/thread_info.h
> @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
>  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
>  #define TIF_PATCH_PENDING	5	/* pending live patching update */
>  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
>  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP */
>  
> @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
>  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint instrumentation */
>  
>  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
> +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
>  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
>  #define _TIF_UPROBE		BIT(TIF_UPROBE)
> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
> index 86235919c2d1..19a89f292290 100644
> --- a/arch/s390/kernel/entry.S
> +++ b/arch/s390/kernel/entry.S
> @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
>  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
>  
>  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
> -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
> +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
> +		   _TIF_NOTIFY_SIGNAL)
>  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
>  		   _TIF_SYSCALL_TRACEPOINT)
>  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
> @@ -463,8 +464,8 @@ ENTRY(system_call)
>  #endif
>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>  	jo	.Lsysc_syscall_restart
> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> -	jo	.Lsysc_sigpending
> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
> +	jnz	.Lsysc_sigpending
>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>  	jo	.Lsysc_notify_resume
>  	TSTMSK	__LC_CPU_FLAGS,(_CIF_ASCE_PRIMARY|_CIF_ASCE_SECONDARY)
> @@ -855,8 +856,8 @@ ENTRY(io_int_handler)
>  	TSTMSK	__TI_flags(%r12),_TIF_PATCH_PENDING
>  	jo	.Lio_patch_pending
>  #endif
> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> -	jo	.Lio_sigpending
> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
> +	jnz	.Lio_sigpending
>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>  	jo	.Lio_notify_resume
>  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
> diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
> index 9e900a8977bd..b27b6c1f058d 100644
> --- a/arch/s390/kernel/signal.c
> +++ b/arch/s390/kernel/signal.c
> @@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
>  	current->thread.system_call =
>  		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
>  
> -	if (get_signal(&ksig)) {
> +	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
>  		/* Whee!  Actually deliver the signal.  */
>  		if (current->thread.system_call) {
>  			regs->int_code = current->thread.system_call;

Looks good, feel free to add my Acked-by.

Thanks
Sven
