Return-Path: <linux-next+bounces-3762-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE1975731
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 17:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6421C227D8
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DABA7E583;
	Wed, 11 Sep 2024 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGZn7xcs"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF83E479;
	Wed, 11 Sep 2024 15:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726068778; cv=none; b=nfX3VLrtvHTYgvY5MQUSUZvCJ3LjGvsBmDJU/xqpIxrXDbd285MEogPV/+5Blbi55JQzoMDDMuwO+aHRe/mbzIkI2GwTkrAevlVwfrITNq5yyJAttXlKR3m75VfhazFbBbSQZ/wcvkaWf6Fxb1qBik4RM8y/wZVwCvrqa/J2M1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726068778; c=relaxed/simple;
	bh=Mm5d6vwEESIrnh2GCyhQU9uzmhx0W/dg1WNHEvGLAjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0HRu9fwp9DoTOtL0DYNfSp2Li+wwfVPxtiDd8IRqiJClO/rGvX07My66JjIqZX8N21W86kumpmEjjere4XnQxt1ccioZKYW1LU+msINNP/0RlnOdM1bR6UCO7lfxJGz1xLdJAbNLERvWzPjCc6c78cEHLyS47CU03iXWruQn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGZn7xcs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726068777; x=1757604777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Mm5d6vwEESIrnh2GCyhQU9uzmhx0W/dg1WNHEvGLAjM=;
  b=KGZn7xcskXqejD7rEG9f48OIvEJuDxZ7PZi0l+SHmy8VIblgSVB/2Q5m
   ahWfaf8ExFdRjn0T7kBNU+wp4RjjpIzaxWukoWGdGqdP0xVq4bNf2r/Er
   gxYl5S1jpXzvPA9P9VKtNQZ45RUNbvchVyIG+fqtwn2gTOcph/gPorCYu
   uyziFnMFb/zxdapl4PSPr6pP+h7TOxA4BDHV0cEyJmA8gdYOTfTc1PGi1
   TMvVPHOnEyzkB9STlOMzvMIUH6K9le31EDhg7FzhV2RtQvhzBq8WP8SaI
   P9MImc2h/SP1PBMI8mml7ePmCvWAK+ffYsLKBU978Bq94twSkQVa+qRZw
   A==;
X-CSE-ConnectionGUID: YHP6WygST5yFWCbGH9gXOw==
X-CSE-MsgGUID: Fna8fR2ES3WvasPsTlHL1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28654615"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="28654615"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:32:56 -0700
X-CSE-ConnectionGUID: ubfERYFIRMWRNKZmP8lyzQ==
X-CSE-MsgGUID: 7ghLNCtxQKCbqMnIE/oCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71540436"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:32:55 -0700
Received: from [10.212.119.193] (kliang2-mobl1.ccr.corp.intel.com [10.212.119.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 8DD5720CFEDB;
	Wed, 11 Sep 2024 08:32:54 -0700 (PDT)
Message-ID: <ba2bdc06-a63b-478b-b29f-15d093125d83@linux.intel.com>
Date: Wed, 11 Sep 2024 11:32:53 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240911153854.240bbc1f@canb.auug.org.au>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20240911153854.240bbc1f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 2024-09-11 1:38 a.m., Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> kernel/events/core.c: In function 'perf_event_setup_cpumask':
> kernel/events/core.c:14012:13: warning: the comparison will always evaluate as 'true' for the address of 'thread_sibling' will never be NULL [-Waddress]
> 14012 |         if (!topology_sibling_cpumask(cpu)) {

The perf_event_init_cpu() may be invoked at the early boot stage, while
the topology_*_cpumask hasn't been initialized yet. The check is to
specially handle the case.

X86 uses a per-cpu cpumask pointer, which could be NULL at the early
boot stage. However, it looks like ARM uses a global variable, which
never be NULL. If so, I think we should check whether it's empty.

The below patch should fix it (Only test on X86).

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2766090de84e..fc0c17e57c86 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14000,7 +14000,8 @@ static void perf_event_setup_cpumask(unsigned
int cpu)
 	 * The perf_online_<domain>_masks includes the first CPU of each domain.
 	 * Always uncondifionally set the boot CPU for the
perf_online_<domain>_masks.
 	 */
-	if (!topology_sibling_cpumask(cpu)) {
+	if (cpu == get_boot_cpu_id() &&
+	    (!topology_sibling_cpumask(cpu) ||
cpumask_empty(topology_sibling_cpumask(cpu)))) {
 		for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE;
scope++) {
 			pmu_cpumask = perf_scope_cpumask(scope);
 			if (WARN_ON_ONCE(!pmu_cpumask))


Should I send the above as a separate patch to fix it?

Thanks,
Kan

>       |             ^
> In file included from include/linux/topology.h:30,
>                  from include/linux/gfp.h:8,
>                  from include/linux/xarray.h:16,
>                  from include/linux/list_lru.h:14,
>                  from include/linux/fs.h:13,
>                  from kernel/events/core.c:11:
> include/linux/arch_topology.h:78:19: note: 'thread_sibling' declared here
>    78 |         cpumask_t thread_sibling;
>       |                   ^~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
> 

