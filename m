Return-Path: <linux-next+bounces-6048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FC7A73543
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 16:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6159D3B76AC
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512241586C8;
	Thu, 27 Mar 2025 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=akamai.com header.i=@akamai.com header.b="M0s7jEl9"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com [67.231.149.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7C157A67;
	Thu, 27 Mar 2025 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087736; cv=none; b=njv49HZq8LQFid444UC5a9V5VtPG6/kNV4c50O/Dw6b2Cjn5PHsmD+RguqJgoZ6WUS+ZLvMzGXHYpxN2BkfpaPQPLUBVje+4fnY3waZdKU0Lmy9+Be6IFzSkBkS28HNmUetwnaCg/4++0iupfENOfW7jPhMf8S1tywKGN+q1vWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087736; c=relaxed/simple;
	bh=OE6oiY0nSPPuNUu7YpqG+RqZI7ITGNCaVXamDmTr+no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LESqdexpGQZrfzHL+hPz+eKjfty3WE7Fqrp4nTzkC9hQUccnXJAeMaiaP1kgrq83huN7XtiT4+dknOFVVzliXf5CgSqlSJZzrVTu3dCHqqpRHXWi+o7IC02vIRaQXeg38P7gLldErEmOKKdxeyzDe09+o+sh7kiwN6TtrD+xgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akamai.com; spf=pass smtp.mailfrom=akamai.com; dkim=pass (2048-bit key) header.d=akamai.com header.i=@akamai.com header.b=M0s7jEl9; arc=none smtp.client-ip=67.231.149.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akamai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=akamai.com
Received: from pps.filterd (m0050095.ppops.net [127.0.0.1])
	by m0050095.ppops.net-00190b01. (8.18.1.2/8.18.1.2) with ESMTP id 52R8iofe012268;
	Thu, 27 Mar 2025 14:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=jan2016.eng;
	 bh=vZfj3Afs41hYu1dHv9/e2igxXfM/rkKPJf0BWi3Cq7I=; b=M0s7jEl9aM/C
	cBy5mOZ/WL2VrstsaYAuNCbSBlt1dkQmiuBZJv9fbRIOW9SC4/gOSZg/pQtc3cTD
	hMqO40qCwjKV8zloozNYHizRsuXU89iBdH9SYqg1yM4Vcv/AAkQJRMTFZg0xLqsY
	HPcT3UfwUG0P1U8EcpwwgH/VwrNblXanq2ZFV8zHhpun4BOzyB/SXfwFLeljtgFR
	hWp6ZqX7/NQ2URyyLjV7wSNJJJbWaq123a0/es+RulpY5UoI2RRfU6lBwjcvpoub
	T5y+fQouNW3ATj8smPOcRih+FYv4tvnBmZ+hr9CQWcUmPsePARTZtM2du/AZ3BpF
	ImDfE2zsag==
Received: from prod-mail-ppoint1 (prod-mail-ppoint1.akamai.com [184.51.33.18] (may be forged))
	by m0050095.ppops.net-00190b01. (PPS) with ESMTPS id 45hnmmbd71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 14:35:35 +0000 (GMT)
Received: from pps.filterd (prod-mail-ppoint1.akamai.com [127.0.0.1])
	by prod-mail-ppoint1.akamai.com (8.18.1.2/8.18.1.2) with ESMTP id 52RDuoCU006214;
	Thu, 27 Mar 2025 10:35:34 -0400
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
	by prod-mail-ppoint1.akamai.com (PPS) with ESMTP id 45mvqa2qgf-1;
	Thu, 27 Mar 2025 10:35:34 -0400
Received: from [172.19.46.102] (bos-lpa4700a.bos01.corp.akamai.com [172.19.46.102])
	by prod-mail-relay10.akamai.com (Postfix) with ESMTP id E29F365F2A;
	Thu, 27 Mar 2025 14:35:33 +0000 (GMT)
Message-ID: <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
Date: Thu, 27 Mar 2025 10:35:33 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Roth, Michael" <Michael.Roth@amd.com>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270099
X-Proofpoint-GUID: KubT_C3ekVS3SxSr3F5pJOdAO2O81AM6
X-Proofpoint-ORIG-GUID: KubT_C3ekVS3SxSr3F5pJOdAO2O81AM6
X-Authority-Analysis: v=2.4 cv=HYMUTjE8 c=1 sm=1 tr=0 ts=67e56237 cx=c_pps a=StLZT/nZ0R8Xs+spdojYmg==:117 a=StLZT/nZ0R8Xs+spdojYmg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QyXUC8HyAAAA:8 a=1wTiysn-UDBPyNMy3dsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270099



On 3/27/25 10:25 AM, Kirill A. Shutemov wrote:
> !-------------------------------------------------------------------|
>    This Message Is From an External Sender
>    This message came from outside your organization.
> |-------------------------------------------------------------------!
> 
> On Thu, Mar 27, 2025 at 02:58:12PM +0200, Kirill A. Shutemov wrote:
>> On Wed, Mar 26, 2025 at 05:30:35PM -0500, Tom Lendacky wrote:
>>> On 3/25/25 08:33, Kirill A. Shutemov wrote:
>>>> On Tue, Mar 25, 2025 at 02:40:00PM +0530, Aithal, Srikanth wrote:
>>>>> Hello,
>>>>>
>>>>>
>>>>> Starting linux-next build next-20250312, including recent build 20250324, we
>>>>> are seeing an issue where the SNP guest boot hangs at the "boot smp config"
>>>>> step:
>>>>>
>>>>>
>>>>>   [ 2.294722] smp: Bringing up secondary CPUs ...
>>>>> [    2.295211] smpboot: Parallel CPU startup disabled by the platform
>>>>> [    2.309687] smpboot: x86: Booting SMP configuration:
>>>>> [    2.310214] .... node  #0, CPUs:          #1   #2   #3   #4 #5   #6
>>>>> #7   #8   #9  #10  #11  #12  #13  #14  #15  #16  #17 #18  #19  #20  #21
>>>>> #22  #23  #24  #25  #26  #27  #28  #29  #30 #31  #32  #33  #34  #35  #36
>>>>> #37  #38  #39  #40  #41  #42  #43 #44  #45  #46  #47  #48  #49  #50  #51
>>>>> #52  #53  #54  #55  #56 #57  #58  #59  #60  #61  #62  #63  #64  #65  #66
>>>>> #67  #68  #69 #70  #71  #72  #73  #74  #75  #76  #77  #78  #79  #80  #81
>>>>> #82 #83  #84  #85  #86  #87  #88  #89  #90  #91  #92  #93  #94  #95 #96
>>>>> #97  #98  #99 #100 #101 #102 #103 #104 #105 #106 #107 #108 #109 #110 #111
>>>>> #112 #113 #114 #115 #116 #117 #118 #119 #120 #121 #122 #123 #124 #125 #126
>>>>> #127 #128 #129 #130 #131 #132 #133 #134 #135 #136 #137 #138 #139 #140 #141
>>>>> #142 #143 #144 #145 #146 #147 #148 #149 #150 #151 #152 #153 #154 #155 #156
>>>>> #157 #158 #159 #160 #161 #162 #163 #164 #165 #166 #167 #168 #169 #170 #171
>>>>> #172 #173 #174 #175 #176 #177 #178 #179 #180 #181 #182 #183 #184 #185 #186
>>>>> #187 #188 #189 #190 #191 #192 #193 #194 #195 #196 #197 #198
>>>>> --> The guest hangs forever at this point.
>>>>>
>>>>>
>>>>> I have observed that certain vCPU and memory combinations work, while others
>>>>> do not. The VM configuration I am using does not have any NUMA nodes.
>>>>>
>>>>> vcpus             Mem        SNP guest boot
>>>>> <=240            19456M    Boots fine
>>>>>> =241,<255   19456M    Hangs
>>>>> 1-255              2048M    Boots fine
>>>>> 1-255              4096M    Boots fine
>>>>>> 71                 8192M    Hangs
>>>>>> 41                 6144M    Hangs
>>>>>
>>>>> When I bisected this issue, it pointed to the following commit :
>>>>>
>>>>>
>>>>> *commit 800f1059c99e2b39899bdc67a7593a7bea6375d8*
>>>>> Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>>>> Date:   Mon Mar 10 10:28:55 2025 +0200
>>>>>
>>>>>      mm/page_alloc: fix memory accept before watermarks gets initialized
>>>>
>>>> Hm. It is puzzling for me. I don't see how this commit can cause the hang.
>>>>
>>>> Could you track down where hang happens?
>>>
>>> Let me say that the guest config is key for this. Using that config, I
>>> think you might be able to repro this on TDX. The config does turn off TDX
>>> support, so I'm hoping that turning it on doesn't change anything.
>>>
>>> I've been able to track it down slightly... It is happening during the CPU
>>> bringup trace points and it eventually gets to line 2273 in
>>> rb_allocate_cpu_buffer() and never comes back from an alloc_pages_node()
>>> call. That's as far as I've gotten so far. I'm not a mm expert so not sure
>>> if I'll be able to progress much further.
>>
>> Urgh... It is deadlock on cpu_hotplug_lock :/
>>
>> _cpu_up() takes the lock on write and starts CPU bring up under it.
>> If during CPU bringup we accept the last page in the zone, __accept_page()
>> calls static_branch_dec() which takes the lock again.
>>
>> Oopsie.
>>
>> So the patch itself doesn't introduce a regression, but uncovers
>> preexisting deadlock. With the patch we accept more pages during the boot
>> and it triggers the deadlock.
>>
>> Let me think about the fix.
> 
> + Static branch maintainers
> 
> The only option I see so far is to drop static branch from this path.
> 
> But I am not sure if it the only case were we use static branch from CPU
> hotplug callbacks.
> 
> Any other ideas?


Hmmm, didn't take too close a look here, but there is the 
static_key_slow_dec_cpuslocked() variant, would that work here? Is the 
issue the caller may or may not have the cpu_hotplug lock?

Thanks,

-Jason



> 
> The deadlock I'm talking about:
> 
> ============================================
> WARNING: possible recursive locking detected
> 6.14.0-rc5+ #13 Tainted: G S
> --------------------------------------------
> swapper/0/1 is trying to acquire lock:
> ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336)
> 
> but task is already holding lock:
> ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: _cpu_up (./arch/x86/include/asm/bitops.h:227 ./arch/x86/include/asm/bitops.h:239 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 ./include/linux/cpumask.h:570 ./include/linux/cpumask.h:1131 kernel/cpu.c:1641)
> 
> other info that might help us debug this:
>   Possible unsafe locking scenario:
> 
>         CPU0
>         ----
>    lock(cpu_hotplug_lock);
>    lock(cpu_hotplug_lock);
> 
>   *** DEADLOCK ***
> 
>   May be due to missing lock nesting notation
> 
> 2 locks held by swapper/0/1:
> #0: ffffffffbdc7e058 (cpu_add_remove_lock){+.+.}-{4:4}, at: cpu_up (kernel/cpu.c:? kernel/cpu.c:1712)
> #1: ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: _cpu_up (./arch/x86/include/asm/bitops.h:227 ./arch/x86/include/asm/bitops.h:239 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 ./include/linux/cpumask.h:570 ./include/linux/cpumask.h:1131 kernel/cpu.c:1641)
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S                 6.14.0-rc5+ #13
> Tainted: [S]=CPU_OUT_OF_SPEC
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
> Call Trace:
>   <TASK>
> dump_stack_lvl (lib/dump_stack.c:122)
> print_deadlock_bug (kernel/locking/lockdep.c:3041)
> __lock_acquire (kernel/locking/lockdep.c:? kernel/locking/lockdep.c:3893 kernel/locking/lockdep.c:5228)
> ? asm_sysvec_apic_timer_interrupt (./arch/x86/include/asm/idtentry.h:702)
> ? free_one_page (mm/page_alloc.c:?)
> ? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336)
> lock_acquire (kernel/locking/lockdep.c:5851)
> ? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336)
> cpus_read_lock (./include/linux/percpu-rwsem.h:51)
> ? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336)
> static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336)
> cond_accept_memory (mm/page_alloc.c:7024)
> get_page_from_freelist (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/page_alloc.c:3417)
> ? lock_release (kernel/locking/lockdep.c:469)
> __alloc_frozen_pages_noprof (mm/page_alloc.c:4740)
> __alloc_pages_noprof (mm/page_alloc.c:4774)
> rb_allocate_cpu_buffer (kernel/trace/ring_buffer.c:2235)
> ? _raw_spin_unlock_irqrestore (./arch/x86/include/asm/irqflags.h:42 ./arch/x86/include/asm/irqflags.h:97 ./arch/x86/include/asm/irqflags.h:155 ./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> trace_rb_cpu_prepare (kernel/trace/ring_buffer.c:7322)
> cpuhp_invoke_callback (kernel/cpu.c:216)
> ? __pfx_trace_rb_cpu_prepare (kernel/trace/ring_buffer.c:7297 kernel/trace/ring_buffer.c:7304)
> _cpu_up (kernel/cpu.c:967 kernel/cpu.c:990 kernel/cpu.c:1021 kernel/cpu.c:1691)
> cpu_up (kernel/cpu.c:473 kernel/cpu.c:1725)
> cpuhp_bringup_mask (kernel/cpu.c:1789)
> ? kernel_init (init/main.c:1459)
> smp_init (./include/linux/bitmap.h:445 ./include/linux/nodemask.h:241 ./include/linux/nodemask.h:438 kernel/smp.c:1012)
> kernel_init_freeable (init/main.c:1561)
> ? __pfx_kernel_init (init/main.c:1455)
> kernel_init (init/main.c:1459)
> ret_from_fork (arch/x86/kernel/process.c:148)
> ? __pfx_kernel_init (init/main.c:1455)
> ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
>   </TASK>

