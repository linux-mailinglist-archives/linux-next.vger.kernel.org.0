Return-Path: <linux-next+bounces-3833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 126FC9785B0
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89CC3B2186C
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 16:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F5357CA7;
	Fri, 13 Sep 2024 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz+F0br5"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E055769;
	Fri, 13 Sep 2024 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244764; cv=none; b=n5YXnC32YrNS3J149+XkYg0NoxSQ+gsauXrO2JGJwdnGTQRPwFu57YgMmqyOR7iZotgKPDFtRzqjBQhXBwN9NiZHleEPSc4Hh/IcQUQwCo0qhS6xvCekTI50bf+u0Y7mfQhSumVIBdA9dbDsKCkfivEOmerTqdYdCP79uGujF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244764; c=relaxed/simple;
	bh=oFRf8tXKeLenrtsTnrJ7yhMAKhNUViGXhcqFwNqqFj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJtBOGv+ERV5S9Z1V56uMsX0/NrwSUl/o5TY0pq7vrW2KA654ViEULwzcHReDXf7byIIu/d9kMALKRwoVrjJ2BdrIOoEu8sw/5ppphVARTtKWMRi57JZBRzwOAfEX7lTGgcldSnkooubma4Ls6opAVfMkPAAyOgDzc7HDxmwrys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz+F0br5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726244762; x=1757780762;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oFRf8tXKeLenrtsTnrJ7yhMAKhNUViGXhcqFwNqqFj8=;
  b=Bz+F0br53Zw+03MDtc06A+QhxsuhR1forzDb6+VMy7ShYOUg5229kRMC
   yb2DUozK2arL/DhLNNrPaa7zKNnSuVT7O3A/V/QBPIPjStncJq8ypYX6Y
   gXpp0LRjYoqQP5sYXveTVsyk8TX5IJhEsf+razfkYjvtDCO+d9KJ27lGG
   65zM6fYwLP4mmCU/wAH7cG2hqYAVx37dt6wC0W4hVFT1DPfTTEtOHSeW2
   NrLoqNlvnWrf3EiFC8tVb1RjnHcLVZF4Dn1PCGPji5ptbDLSTuTORqMUW
   YLh4f10XidP0GI4aSUk1pyIXqXtPTCmIChiIoU15AOs/OXmtuTAlLz7ZI
   Q==;
X-CSE-ConnectionGUID: 5z62UmenSIGK2aDobYfQkA==
X-CSE-MsgGUID: KNxFj2h7Qlern5OG+t4/FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28898345"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28898345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:26:02 -0700
X-CSE-ConnectionGUID: Z2rLzcX8Q9OblMD/d2yKGw==
X-CSE-MsgGUID: AUGOwtgFTdKCTIxj1NShIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68884213"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:26:02 -0700
Received: from [10.212.21.130] (kliang2-mobl1.ccr.corp.intel.com [10.212.21.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id CE24220CFEDA;
	Fri, 13 Sep 2024 09:26:00 -0700 (PDT)
Message-ID: <39bb4c06-a8e8-4eef-8659-534939c9987f@linux.intel.com>
Date: Fri, 13 Sep 2024 12:25:59 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: Fix missing RCU reader protection in
 perf_event_clear_cpumask()
To: peterz@infradead.org, mingo@redhat.com, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 kernel test robot <oliver.sang@intel.com>
References: <20240913162340.2142976-1-kan.liang@linux.intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20240913162340.2142976-1-kan.liang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-09-13 12:23 p.m., kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> Running rcutorture scenario TREE05, the below warning is triggered.
> 
> [   32.604594] WARNING: suspicious RCU usage
> [   32.605928] 6.11.0-rc5-00040-g4ba4f1afb6a9 #55238 Not tainted
> [   32.607812] -----------------------------
> [   32.609140] kernel/events/core.c:13946 RCU-list traversed in non-reader section!!
> [   32.611595] other info that might help us debug this:
> [   32.614247] rcu_scheduler_active = 2, debug_locks = 1
> [   32.616392] 3 locks held by cpuhp/4/35:
> [   32.617687]  #0: ffffffffb666a650 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> [   32.620563]  #1: ffffffffb666cd20 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> [   32.623412]  #2: ffffffffb677c288 (pmus_lock){+.+.}-{3:3}, at: perf_event_exit_cpu_context+0x32/0x2f0
> 
> In perf_event_clear_cpumask(), uses list_for_each_entry_rcu() without an
> obvious RCU read-side critical section.
> 
> Either pmus_srcu or pmus_lock is good enough to protect the pmus list.
> In the current context, pmus_lock is already held. The
> list_for_each_entry_rcu() is not required.
> 
> Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Closes: https://lore.kernel.org/lkml/2b66dff8-b827-494b-b151-1ad8d56f13e6@paulmck-laptop/
> Tested-by: Paul E. McKenney <paulmck@kernel.org>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202409131559.545634cc-oliver.sang@intel.com

Forgot to add the below tag, please fold it.

Suggested-by: Peter Zijlstra <peterz@infradead.org>

Thanks,
Kan
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> ---
>  kernel/events/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 20e97c1aa4d6..5ba9934b49df 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -13912,7 +13912,7 @@ static void perf_event_clear_cpumask(unsigned int cpu)
>  	}
>  
>  	/* migrate */
> -	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
> +	list_for_each_entry(pmu, &pmus, entry) {
>  		if (pmu->scope == PERF_PMU_SCOPE_NONE ||
>  		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
>  			continue;

