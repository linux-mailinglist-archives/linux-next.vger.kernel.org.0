Return-Path: <linux-next+bounces-8934-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD14C51B72
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55D51188308B
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F13530649C;
	Wed, 12 Nov 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iszkcrm7"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188C2FF641;
	Wed, 12 Nov 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943820; cv=none; b=H21EjeFsa2m48iRhfiB+d4AI4DSRRaejH/0doOh/b2o4Y+vbVEni/5fOQeWp/brDg/feSqKm0SoU0mkaqNXIUN/PDw3yhj2bIKUTBvORQ2ljjEoNVa4sMeiGRYs5G1gKeZ3DhlmdF4uhUnq3+94Ucv+W89ViGNqxHv+KVhhDCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943820; c=relaxed/simple;
	bh=dFKYl4ehMA1PKKOH5JJ4GbZmaHHSs7YEJSRnGPTbBpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvwn02qLf17zbVYOS85uzysoNt+HsAofdWU81XUiU4C3tSdGwJswGH1M1Ii2mFT3qQ7LHDIF26h5BCtWROeP7YPnj9bLTHwkxoUtGpN9RdzbY+rbVEj0QwAid5QAcT+ixIyiR8waE+AwneiYC8lqcpBdkGvln5eCuCkbsUoKpiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iszkcrm7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762943819; x=1794479819;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dFKYl4ehMA1PKKOH5JJ4GbZmaHHSs7YEJSRnGPTbBpw=;
  b=Iszkcrm7MCuV+ra8tly2uOSds6UG587kkC4QsRJA5JdB+gOllC0TJd8I
   i8Ig7UtkPNNWeZe4KOkMbFkecEBweRzy6Lfb7mM8fNsfSSqWTglsrGWPw
   WNQiavN0yqGr+5a7qkQDdkMRsBgH3J3YGwo3owEg8mchqV+gxJXVQ6wfX
   wV5lffLiuXVCtqkcM3tjvRFJCoVZlD0yfqsjjH1maU8Xn9of6tEaWdULJ
   l+aDqHtwX5SkJlD8E97TxphQWSQ0X65mVRffSWEfl4NIFOarBdSiPuesm
   K8Zbu0dQcHrMq2g909i9eRT43pbSBJbq82dV1JWGoHlsmstnIHWiZPAZx
   w==;
X-CSE-ConnectionGUID: mmer6cPOSOepSz3USYftDw==
X-CSE-MsgGUID: PM73CcFRQm2DUALA7dzq1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76462356"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76462356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:36:58 -0800
X-CSE-ConnectionGUID: Babs7m4wS1KB2H8L0Ynyng==
X-CSE-MsgGUID: zpOAbw1fR5uDwnjicjBEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="189622404"
Received: from unknown (HELO [10.238.3.175]) ([10.238.3.175])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 02:36:55 -0800
Message-ID: <d3d49960-b7b6-4270-961e-9895cfdff1be@linux.intel.com>
Date: Wed, 12 Nov 2025 18:36:53 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/x86/intel: Fix and clean up
 intel_pmu_drain_arch_pebs() type use
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Kan Liang
 <kan.liang@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251112154200.4d3671f9@canb.auug.org.au>
 <cb49c1be-99a5-4aba-b3da-f902058a4996@linux.intel.com>
 <aRRcyoOobRyam5yD@gmail.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aRRcyoOobRyam5yD@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/2025 6:09 PM, Ingo Molnar wrote:
> * Mi, Dapeng <dapeng1.mi@linux.intel.com> wrote:
>
>> On 11/12/2025 12:42 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the tip tree, today's linux-next build (i386 defconfig)
>>> failed like this:
>>>
>>> arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
>>> arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>>>  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
>>>       |                        ^
>>> arch/x86/events/intel/ds.c:2983:15: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>>  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
>>>       |               ^
>>> cc1: all warnings being treated as errors
>> Thanks for reporting the issue. I suppose the below patch would fix the
>> building error. I would post it as an independent patch later.
>>
>> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
>> index c93bf971d97b..f695de9f7049 100644
>> --- a/arch/x86/events/intel/ds.c
>> +++ b/arch/x86/events/intel/ds.c
>> @@ -2979,7 +2979,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs
>> *iregs,
>>         }
>>
>>         base = cpuc->pebs_vaddr;
>> -       top = (void *)((u64)cpuc->pebs_vaddr +
>> +       top = (void *)((unsigned long)cpuc->pebs_vaddr +
>>                        (index.wr << ARCH_PEBS_INDEX_WR_SHIFT));
> This doesn't really address the core issue: ugly, fragile code due to 
> type confusion. The proper fix is:
>
> 	top = cpuc->pebs_vaddr + (index.wr << ARCH_PEBS_INDEX_WR_SHIFT);
>
> which is also much cleaner, see:
>
> 	60f9f1d43720 ("perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs() type use")
>
> (also attached below.)
>
> All this should be resolved in the latest -tip tree.
>
> Thanks,
>
> 	Ingo
>
> =====================>
> From 60f9f1d437201f6c457fc8a56f9df6d8a6d0bea6 Mon Sep 17 00:00:00 2001
> From: Ingo Molnar <mingo@kernel.org>
> Date: Wed, 12 Nov 2025 10:40:26 +0100
> Subject: [PATCH] perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs() type use
>
> The following commit introduced a build failure on x86-32:
>
>   2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR")
>
>   ...
>
>   arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>
> The forced type conversion to 'u64' and 'void *' are not 32-bit clean,
> but they are also entirely unnecessary: ->pebs_vaddr is 'void *' already,
> and integer-compatible pointer arithmetics will work just fine on it.
>
> Fix & simplify the code.
>
> Fixes: 2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR")

Hi Ingo,

Thanks a lot for fixing this issue.

BTW, the offensive commit should be the below one instead of '2721e8da2de7
("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR") '.

d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragments")

- Dapeng Mi

> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Link: https://patch.msgid.link/20251029102136.61364-10-dapeng1.mi@linux.intel.com
> ---
>  arch/x86/events/intel/ds.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
> index c93bf971d97b..2e170f2093ac 100644
> --- a/arch/x86/events/intel/ds.c
> +++ b/arch/x86/events/intel/ds.c
> @@ -2979,8 +2979,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
>  	}
>  
>  	base = cpuc->pebs_vaddr;
> -	top = (void *)((u64)cpuc->pebs_vaddr +
> -		       (index.wr << ARCH_PEBS_INDEX_WR_SHIFT));
> +	top = cpuc->pebs_vaddr + (index.wr << ARCH_PEBS_INDEX_WR_SHIFT);
>  
>  	index.wr = 0;
>  	index.full = 0;

