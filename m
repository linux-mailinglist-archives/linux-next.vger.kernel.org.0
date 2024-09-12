Return-Path: <linux-next+bounces-3803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E4976E37
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 17:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8D13284C5D
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7ED192597;
	Thu, 12 Sep 2024 15:53:22 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA05844C8F;
	Thu, 12 Sep 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726156402; cv=none; b=L4O6CLH3UTbeOgKicni55g7+w+OJHMiovq7qZcF06lGxd+DpuGKHsSW/YLVcY+QV+xofk9eN2ZL8yKp1zwqblAP2cwF6NXoNDlVgLnh25CugxNhXVt911yY8UlULauSe0ZNslw8Cf4BNFMKGbLDKdxc9S6vWeNs4D9AzGmgxMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726156402; c=relaxed/simple;
	bh=7KEqz5sGvhlc+1vgsBaC3Cz/Ft4p/kPiAU5HG3FsjJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dR7pbzRoZAN6U1K3JSo6fD2+RDTpgF9mkknZEfhQoQ48W8NlEtqBiFgMLViaL5vvkpyfnANNpqzUuqrDuS2NCMqPNupAsp8FeS1xvzHtCUPHWcsuyug+Hzoy67295QAK3TJ5arGgBdQrupn+RHhO6/WxyfOLqCmZzyvkWnWZvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 304D3DA7;
	Thu, 12 Sep 2024 08:53:48 -0700 (PDT)
Received: from [10.1.34.27] (e122027.cambridge.arm.com [10.1.34.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 155B73F66E;
	Thu, 12 Sep 2024 08:53:16 -0700 (PDT)
Message-ID: <0a1f237f-281f-4a08-968f-6c6f94f0a035@arm.com>
Date: Thu, 12 Sep 2024 16:53:15 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: Fix topology_sibling_cpumask check warning on ARM
To: kan.liang@linux.intel.com, peterz@infradead.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: tglx@linutronix.de, hpa@zytor.com, sfr@canb.auug.org.au
References: <20240912145025.1574448-1-kan.liang@linux.intel.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240912145025.1574448-1-kan.liang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 15:50, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> The below warning is triggered when building with arm
> multi_v7_defconfig.
> 
> kernel/events/core.c: In function 'perf_event_setup_cpumask':
> kernel/events/core.c:14012:13: warning: the comparison will always
> evaluate as 'true' for the address of 'thread_sibling' will never be
> NULL [-Waddress]
> 14012 |         if (!topology_sibling_cpumask(cpu)) {
> 
> The perf_event_init_cpu() may be invoked at the early boot stage, while
> the topology_*_cpumask hasn't been initialized yet. The check is to
> specially handle the case, and initialize the perf_online_<domain>_masks
> on the boot CPU.
> X86 uses a per-cpu cpumask pointer, which could be NULL at the early
> boot stage. However, ARM uses a global variable, which never be NULL.
> 
> Use perf_online_mask as an indicator instead. Only initialize the
> perf_online_<domain>_masks when perf_online_mask is empty.
> 
> Fix a typo as well.
> 
> Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20240911153854.240bbc1f@canb.auug.org.au/
> Reported-by: Steven Price <steven.price@arm.com>
> Closes: https://lore.kernel.org/lkml/1835eb6d-3e05-47f3-9eae-507ce165c3bf@arm.com/
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>

Tested-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  kernel/events/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 7a028474caef..20e97c1aa4d6 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -13954,21 +13954,19 @@ static void perf_event_setup_cpumask(unsigned int cpu)
>  	struct cpumask *pmu_cpumask;
>  	unsigned int scope;
>  
> -	cpumask_set_cpu(cpu, perf_online_mask);
> -
>  	/*
>  	 * Early boot stage, the cpumask hasn't been set yet.
>  	 * The perf_online_<domain>_masks includes the first CPU of each domain.
> -	 * Always uncondifionally set the boot CPU for the perf_online_<domain>_masks.
> +	 * Always unconditionally set the boot CPU for the perf_online_<domain>_masks.
>  	 */
> -	if (!topology_sibling_cpumask(cpu)) {
> +	if (cpumask_empty(perf_online_mask)) {
>  		for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
>  			pmu_cpumask = perf_scope_cpumask(scope);
>  			if (WARN_ON_ONCE(!pmu_cpumask))
>  				continue;
>  			cpumask_set_cpu(cpu, pmu_cpumask);
>  		}
> -		return;
> +		goto end;
>  	}
>  
>  	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
> @@ -13983,6 +13981,8 @@ static void perf_event_setup_cpumask(unsigned int cpu)
>  		    cpumask_any_and(pmu_cpumask, cpumask) >= nr_cpu_ids)
>  			cpumask_set_cpu(cpu, pmu_cpumask);
>  	}
> +end:
> +	cpumask_set_cpu(cpu, perf_online_mask);
>  }
>  
>  int perf_event_init_cpu(unsigned int cpu)


