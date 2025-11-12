Return-Path: <linux-next+bounces-8929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C842FC509A3
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 06:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA0054E7DC1
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 05:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9112BE035;
	Wed, 12 Nov 2025 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cghgf9Jg"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A9C10942;
	Wed, 12 Nov 2025 05:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924857; cv=none; b=sG+v9yA7Qnbh9zpOg3Y/LdIPcebQuoszqEMAuwIcYMSVocbKHHWTNl6qwR9r8KoeOHRPBmDZk5K2oYY+IX8EzJ9nm7lOQ+lZyFyXQ/HlbrLGE0NHVbzcRGdEAphK00JW1IZNaDrJBLMYrsCHxbrOKzYVUsZ24LiqbNT+rACcxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924857; c=relaxed/simple;
	bh=hrO0ewnqqzCFawUB64Btsqfz1Tkqa/+Z0vCIkt7E0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEN9J6B8h/BNWABgK67UrbsfSSidMVrvKoUaIXxQT/EN2AfiO4J2kK1+fyMEzfWjLqY8+Mu7/YJzcwy1tPdCKfzjWAx+wfM9Pdu7GHkLDzl0x6i81txHNY8DtXWeDRvf54xfPdEMjbM80n5v95dpdweblQ0d2JJlpMgsHlLJnW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cghgf9Jg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762924855; x=1794460855;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hrO0ewnqqzCFawUB64Btsqfz1Tkqa/+Z0vCIkt7E0lY=;
  b=Cghgf9Jgt7lzQfYI8CjIzcL1Bg5RGpgQZD4UaIzMxFjxfE1JYSlGCO5L
   XcfmB5Z5GddPWKL0ZnXMMjKiAaYzVkibSeRNAEaR5oLMYpyxLV7pj4F9F
   wyTBZp4exTx6Q8pEA4rMtEspRcHkkvjdD9425zqwDfjiW4hCN9RAjN3Wk
   hJtCwmJmYsPqMt7vcgrzbKZReXI1TGpAETpeFv4urhyYa3KckQhnkpVMU
   YGZfaG+fGXlXQWONZ7GqYKGVQE/VCGkA7BWm6dav0mpod0zGeaUPCDl8b
   nf35Ky9lXTNs0PqfIjMMFQ9jUcx1I6TbOVIwKy/G9E8Dh8wcqhhKXwvq1
   g==;
X-CSE-ConnectionGUID: d+cieDNIQxmBgTC2Md2Igg==
X-CSE-MsgGUID: VrltV6T6QcaWf3IEEL9jIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63988251"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="63988251"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:20:54 -0800
X-CSE-ConnectionGUID: VjJkPS8QQMmObjQj1fEL4A==
X-CSE-MsgGUID: Ccc46b0vROmNwkgdlrVN9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188389334"
Received: from unknown (HELO [10.238.3.175]) ([10.238.3.175])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:20:52 -0800
Message-ID: <cb49c1be-99a5-4aba-b3da-f902058a4996@linux.intel.com>
Date: Wed, 12 Nov 2025 13:20:50 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251112154200.4d3671f9@canb.auug.org.au>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251112154200.4d3671f9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/2025 12:42 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the tip tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
> arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
>       |                        ^
> arch/x86/events/intel/ds.c:2983:15: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
>       |               ^
> cc1: all warnings being treated as errors

Thanks for reporting the issue. I suppose the below patch would fix the
building error. I would post it as an independent patch later.

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index c93bf971d97b..f695de9f7049 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2979,7 +2979,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs
*iregs,
        }

        base = cpuc->pebs_vaddr;
-       top = (void *)((u64)cpuc->pebs_vaddr +
+       top = (void *)((unsigned long)cpuc->pebs_vaddr +
                       (index.wr << ARCH_PEBS_INDEX_WR_SHIFT));

        index.wr = 0;


>
> Caused by commit
>
>   d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragments")
>
> I have reverted commits
>
>   2093d8cf80fa ("perf/x86/intel: Optimize PEBS extended config")
>   02da693f6658 ("perf/x86/intel: Check PEBS dyn_constraints")
>   bd24f9beed59 ("perf/x86/intel: Add a check for dynamic constraints")
>   bb5f13df3c45 ("perf/x86/intel: Add counter group support for arch-PEBS")
>   52448a0a7390 ("perf/x86/intel: Setup PEBS data configuration and enable legacy groups")
>   e89c5d1f290e ("perf/x86/intel: Update dyn_constraint base on PEBS event precise level")
>   2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR")
>   d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record fragments")
>
> for today.
>

