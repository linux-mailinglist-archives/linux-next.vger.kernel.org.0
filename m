Return-Path: <linux-next+bounces-3801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70746976CC2
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 16:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 275D61F25007
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B9B1B12E8;
	Thu, 12 Sep 2024 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ua61OiDC"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD971AED55;
	Thu, 12 Sep 2024 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152791; cv=none; b=CM041hoSS49Pmni0FX/faewNC6LwlVSct7fxbh/X5JdKx0aDyPBPl8C9hPW0SoYU3SbGpgU19ruM4okAwCTbhOndUbrsV9GkBQBDiKOQUlPszrGvR93HAouMgaWc6zAqYdD6U+phOTm15VdzYPCYN8NunCZlhx5VNUaTEa4XEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152791; c=relaxed/simple;
	bh=SFYVUrHvTz1LjiXVaRAeG1Lw5s82K9dKcNaka1jyd70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dhvh+z9Jt0JJ4FW5XYyDtEHui8HhsMHUTFLdam8BEHft6F2Hw2LBvI61e7eeUSDvWlqgf4HZVQYA9lCjfmZ17+ilGl4LwTb06LFuVCteLRvenS+oirThe5IUAiqfkLEE2VAzTY5S2cUu4g8tZ2gV9VSprz/BZNofZ/KguaSZm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ua61OiDC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726152789; x=1757688789;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SFYVUrHvTz1LjiXVaRAeG1Lw5s82K9dKcNaka1jyd70=;
  b=Ua61OiDCkiQWopc+sfVe7i464gZI7TLWlUQaRRLVgppj3zjogzRXU7qs
   0eqGPTcnCoG4Um3tHCQ9KdNBW1Uosk+ohfha57pQoZTXeX3A3dZisDni/
   XfcTnyIJDI1KebE1N9HwoLn88y3mVECP54dvzzTDlIXxkBKqatr3hmo8G
   4kPCSUA6IcZxDRVQriwEL3Sv6A8nk2HHP2FiVcZ0Qf2UpaH6iPlqG0sVY
   wdkIR487XmGMn2Dpc56R3vZMRrtXOyc1XWGEEHNx7pCAD2XGSA2xrpILQ
   TbBRhBa+wYtsO3NF3b4a1I7JKCzX1s0P9IuYUmHfIf33ZolqmJfARlyZ0
   A==;
X-CSE-ConnectionGUID: qHgg0mexRQeZRHhM3M817A==
X-CSE-MsgGUID: Vx2oi0vORLGISSomAfVG6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35602281"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="35602281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:52:19 -0700
X-CSE-ConnectionGUID: Fxu1osJQSjqgDkPKomufOw==
X-CSE-MsgGUID: KGUj0RxQQoCufEtNIn2Oxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="67568478"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:52:19 -0700
Received: from [10.212.20.231] (kliang2-mobl1.ccr.corp.intel.com [10.212.20.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A607720BF401;
	Thu, 12 Sep 2024 07:52:17 -0700 (PDT)
Message-ID: <8571bb0e-7f5a-4fd6-80f1-6b66b5110488@linux.intel.com>
Date: Thu, 12 Sep 2024 10:52:16 -0400
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



On 2024-09-11 1:38 a.m., Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> kernel/events/core.c: In function 'perf_event_setup_cpumask':
> kernel/events/core.c:14012:13: warning: the comparison will always evaluate as 'true' for the address of 'thread_sibling' will never be NULL [-Waddress]
> 14012 |         if (!topology_sibling_cpumask(cpu)) {
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

The patch to fix the warning has been posted.
https://lore.kernel.org/lkml/20240912145025.1574448-1-kan.liang@linux.intel.com/

Please give it a try.

Thanks,
Kan

