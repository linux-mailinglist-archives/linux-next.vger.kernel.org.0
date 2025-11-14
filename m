Return-Path: <linux-next+bounces-9013-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0720BC5EE5E
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 19:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D8AD350C50
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78582566DD;
	Fri, 14 Nov 2025 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eI3CH6tO"
X-Original-To: linux-next@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA63D3B3
	for <linux-next@vger.kernel.org>; Fri, 14 Nov 2025 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763145118; cv=none; b=lBlTQYgM2k4GFvQtNKQeS/cwGjOIHup3A1+wKIjZXtDILKhJe0t6NZp2Qyz/6NMgfV7476maFgt8hR4b2jWcsd5phVAz1dHh8rAYAVkigvi17/fWiD68gVvp6jOE0zeYP2kMtG9XXMxDMQ3J2MxjuIsZghvahxjp6L1X8MSxMcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763145118; c=relaxed/simple;
	bh=DHpd2rAwFECAa9PH75i1/Neyo1+iKKy+7j1AiDON3SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVB79aB0srFAx76w25QyrXp+SDt7VdOZWHAFGXO8O74cYe9euc0zEhJRZ4jCzk1eywmqAcNXRRH3/XPdmIlG2UpQZtazjV3r3cSbhDmMRDJFEb4BB84p85SKWS/Kj2gsDCrk6oGaZNYw8xtEQr6nltA6yuucxrWoEkMQK3N0s3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eI3CH6tO; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <5d6033df-b651-4daa-a804-dd142f441358@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763145113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY049+Qfq8Tz8ShiDRBsiccbhgj7iax5eTEJRrP2vmw=;
	b=eI3CH6tO02e0Ywf0bb9fogoshseyksdNDJ6iJdHi5sZiu9ovmGrTzz7HgnRgE/MxdDtWjN
	X7jKV8TOuWuj7bmDEqb7k+wdDKQMRjdk6E2oLWUhA42DWQpcUYAvwoysUbH8FfBs5Hfrdb
	fpWc1VieK/EKosgMUr1UyqwbDoYCByg=
Date: Fri, 14 Nov 2025 10:31:45 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Content-Language: en-GB
To: paulmck@kernel.org, Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 11/14/25 9:05 AM, Paul E. McKenney wrote:
> On Fri, Nov 14, 2025 at 07:42:55AM -0500, Steven Rostedt wrote:
>> On Fri, 14 Nov 2025 13:52:26 +1100
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> Hi all,
>>>
>>> Today's linux-next merge of the rcu tree got a conflict in:
>>>
>>>    kernel/trace/trace_syscalls.c
>>>
>>> between commit:
>>>
>>>    a544d9a66bdf ("tracing: Have syscall trace events read user space string")
>>>
>>> from the ftrace tree and commit:
>>>
>>>    35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
>>>
>>> from the rcu tree.
>>>
>>> I fixed it up (Maybe - see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>> Thanks for the update.
>>
>>> diff --cc kernel/trace/trace_syscalls.c
>>> index e96d0063cbcf,3f699b198c56..000000000000
>>> --- a/kernel/trace/trace_syscalls.c
>>> +++ b/kernel/trace/trace_syscalls.c
>>> @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
>>>    	 * buffer and per-cpu data require preemption to be disabled.
>>>    	 */
>>>    	might_fault();
>>> + 	preempt_rt_guard();
>>>   -	guard(preempt_notrace)();
>> My code made it so that preemption is not needed here but is moved later
>> down for the logic that does the reading of user space data.
>>
>> Note, it must have preemption disabled for all configs (including RT).
>> Otherwise, the data it has can get corrupted.
>>
>> Paul, can you change it so that you *do not* touch this file?
> I could, but I believe that this would re-introduce the migration failure.
>
> Maybe we should just defer this until both your patch and the RCU
> stack hit mainline, and port on top of those?  Perhaps later in the
> merge window?
>
> I believe that migration needs to be disabled at this point, but I am
> again adding Yonghong on CC for his perspective.

Yes, migration needs to be disabled for rt kernel in order to let
bpf program running properly.

Regarding to non-rt kernel, currently preempt disable is used.
Is preempt disalbe just for bpf program or for something else
as well? Certainly perempt disable can help improve bpf prog
performance. From bpf prog itself, typically we can do with
migration disable, but in some places we may have to add
preempt disable, e.g.,
   https://lore.kernel.org/bpf/20251114064922.11650-1-chandna.sahil@gmail.com/T/#u
   https://lore.kernel.org/bpf/20251112163148.100949-1-chen.dylane@linux.dev/T/#m556837a5987bc048b8b9bbcc6b50728c441c139f

>
> 							Thanx, Paul
>
>> Thanks,
>>
>> -- Steve
>>
>>
>>>    
>>>    	syscall_nr = trace_get_syscall_nr(current, regs);
>>>    	if (syscall_nr < 0 || syscall_nr >= NR_syscalls)


