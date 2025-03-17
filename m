Return-Path: <linux-next+bounces-5812-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA230A64655
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 09:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EF63A8E88
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 08:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6A4221545;
	Mon, 17 Mar 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pH64fkAS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DF220694;
	Mon, 17 Mar 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201702; cv=none; b=LCHqrBB0u3CsA5xvqgpgmhszbCrI/g27P/1IB0hTMfN8MoqbYZ0f4+gxOS4O+lLGhkwbjcp6COrEVi+KkSJCTufEzDQ+YDQ8f8d5GYLd/aVj61VVfEESQhDXgIqvU7SOfQz6pOlUCtJuc4EdykdvmvG4DPWE1p4K2jWjpCC/r7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201702; c=relaxed/simple;
	bh=9/L4WNnksT0M/kHzBUTOaO9+R4gUtbSBvnEOQUdktq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pG0DjVBuPmHG+JgNk/ipApqxTcJ3VxeAGWa0vAg26WoKSXjFF2zaeEH2TSTNuc+FYo2ZVIFsVgVFWDsaF6dsdktAQuE+1bH8QxUKWHnzwBz253Fbc5lljJQdYXS0ObeIv+h/b8QtdqZV0j39FFJwvQHp0VKbasngbAGmTb9keWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pH64fkAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7962AC4CEE3;
	Mon, 17 Mar 2025 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742201701;
	bh=9/L4WNnksT0M/kHzBUTOaO9+R4gUtbSBvnEOQUdktq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pH64fkASiTMaKoqz+TN4VtCMmht+1iP1/0ilXuBpEKHaVfvJNoQN7guu7vP0LEj8a
	 nKx3aPi1rFRVH+eyBjzzRG0tbIoMX2ilbcBbWR0ELwSavXbPZmGfe5QE+cUCg+gZVU
	 UCAXHEtA6Im9uHidRfUA4CnGYhyQTXMxoDv8t3vQRY57evZx79/NTmNacEtvr7cdWJ
	 xf7kex8pObT4fsbajI86Zw+iGWu0oQi6BQL+TDF1qMGl/wYClZIP8M8r2pq5be0xeS
	 0Un+/O2crc8qktIfoLzWb4sY2+sVlm5Uqn+lJk+a4YhrrItJWLoushgsGqspqXrnNJ
	 rhueZRcknTA/A==
Message-ID: <eed320e6-f869-42fc-881b-e437dcb5af7f@kernel.org>
Date: Mon, 17 Mar 2025 09:54:59 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250304162402.475eb3bc@canb.auug.org.au>
 <20250306152516.32df7764@canb.auug.org.au>
 <20250311152429.32d9f824@canb.auug.org.au>
 <20250317160540.096f16a4@canb.auug.org.au>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20250317160540.096f16a4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17. 03. 25, 6:05, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 11 Mar 2025 15:24:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Thu, 6 Mar 2025 15:25:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> On Tue, 4 Mar 2025 16:25:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
>>>> failed like this:
>>>>
>>>> In file included from include/asm-generic/percpu.h:7,
>>>>                   from arch/x86/include/asm/percpu.h:597,
>>>>                   from arch/x86/include/asm/preempt.h:6,
>>>>                   from include/linux/preempt.h:79,
>>>>                   from include/linux/spinlock.h:56,
>>>>                   from include/linux/wait.h:9,
>>>>                   from include/linux/wait_bit.h:8,
>>>>                   from include/linux/fs.h:7,
>>>>                   from kernel/events/core.c:11:
>>>> kernel/events/core.c: In function 'this_cpc':
>>>> include/linux/percpu-defs.h:220:45: error: initialization from pointer to non-enclosed address space
>>>>    220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
>>>>        |                                             ^
>>>> include/linux/percpu-defs.h:251:9: note: in expansion of macro '__verify_pcpu_ptr'
>>>>    251 |         __verify_pcpu_ptr(ptr);                                         \
>>>>        |         ^~~~~~~~~~~~~~~~~
>>>> kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_ptr'
>>>>   1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
>>>>        |                 ^~~~~~~~~~~~
>>>>
>>>> (and many more similar)
>>>>
>>>> Presumably caused by commit
>>>>
>>>>    f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'struct pmu' lifetimes")
>>>>
>>>> I have used the tip tree from next-20250303 for today.
>>>
>>> I am still seeing this build failure.
>>
>> Ditto.  Anything happening with this?
>>
>> I am still using the tip tree from next-20250303.
> 
> So am I missing something here?  I am still seeing this build failure.
> 
> That commit is now
> 
>    4eabf533fb18 ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'struct pmu' lifetimes")
> 
> Is there something in my toolchain?   Or some other difference in our
> build environments?

FWIW I cannot reproduce with gcc 14 or 9. tip/master builds that file 
fine for me. Perhaps a merge with some other tree introduces this?

thanks,
-- 
js
suse labs


