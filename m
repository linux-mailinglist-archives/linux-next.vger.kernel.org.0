Return-Path: <linux-next+bounces-5478-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F6A39951
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 11:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064BA1897E02
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 10:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834E223872E;
	Tue, 18 Feb 2025 10:35:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54A2239082;
	Tue, 18 Feb 2025 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874916; cv=none; b=Y51SiR2EikILkk5uC7hAG2Lb4ykwiEvEpzGOhULWIsSqOkh07JxGwDe4VNeTctqukWophUaXhcfQfwAze2ExZONJQDukFf+9363trOv/oEJBpl/VGeEDVTa4PXCI4ZKtor9fSwRD44tMBDW/rQ6GUP3gvY1RMRAiHisQk5qQDik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874916; c=relaxed/simple;
	bh=FjYf0HGEpv02FFUr/G+KaX+8fXSmO5gG6iDiBHMtiTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gg6jnkp2uryPz/Ut6WmGeFlO8v2qSq7Jpu/yiyvp7kixhb+yGrM1rPyCk/z0fxvM3zWf2L8EMn+3jA+bmYws+txJHGZdHVEvxRge9nPNvzO22CfAZZaEvnZXkKwD4wsBtHGPRp3nJ4QG8FisXnMyxW4PjkRiTPTZ6YsRoob5Kdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E68A913D5;
	Tue, 18 Feb 2025 02:35:32 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F6F3F6A8;
	Tue, 18 Feb 2025 02:35:12 -0800 (PST)
Date: Tue, 18 Feb 2025 11:35:02 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Yury Norov <yury.norov@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7RiVtunqI9edfK4@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218160742.49d6ab76@canb.auug.org.au>

Hi,
On Tue, Feb 18, 2025 at 04:07:42PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bitmap tree, today's linux-next build (arm64 defconfig)
> failed like this:
> 
> arch/arm64/kernel/topology.c: In function 'arch_freq_get_on_cpu':
> arch/arm64/kernel/topology.c:270:43: error: too many arguments to function 'cpumask_next_wrap'
>   270 |                                 ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
>       |                                           ^~~~~~~~~~~~~~~~~
> In file included from arch/arm64/include/asm/cpufeature.h:27,
>                  from arch/arm64/include/asm/ptrace.h:11,
>                  from arch/arm64/include/asm/irqflags.h:9,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:7,
>                  from include/linux/slab.h:16,
>                  from include/linux/resource_ext.h:11,
>                  from include/linux/acpi.h:13,
>                  from arch/arm64/kernel/topology.c:14:
> include/linux/cpumask.h:317:14: note: declared here
>   317 | unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
>       |              ^~~~~~~~~~~~~~~~~
> 
> Caused by commits
> 
>   46ac1bec179d ("cpumask: deprecate cpumask_next_wrap()")
>   43f7f920e14e ("cpumask: re-introduce cpumask_next{,_and}_wrap()")
>   65b98ea8b278 ("cpumask: drop cpumask_next_wrap_old()")
> 
> interacting with commit
> 
>   dd871ac1237f ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> 
> from the arm64 tree.
> 
> I have applied the following patch for today (which may not be correct).
Thank you for that.

I'm currently testing a proper fix for that one.
Should I just send it over as a diff to apply or rather a proper 'fixes' patch?

---
BR
Beata
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 18 Feb 2025 15:44:06 +1100
> Subject: [PATCH] fixup for "cpumask: drop cpumask_next_wrap_old()"
> 
> interacting with commit
> 
>   dd871ac1237f ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> 
> from the arm64 tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/arm64/kernel/topology.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 6f0cab8e746b..70db234c41a2 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -231,7 +231,6 @@ void arch_cpu_idle_enter(void)
>  int arch_freq_get_on_cpu(int cpu)
>  {
>  	struct amu_cntr_sample *amu_sample;
> -	unsigned int start_cpu = cpu;
>  	unsigned long last_update;
>  	unsigned int freq = 0;
>  	u64 scale;
> @@ -267,8 +266,7 @@ int arch_freq_get_on_cpu(int cpu)
>  
>  
>  			do {
> -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> -							    start_cpu, false);
> +				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus);
>  
>  			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
>  
> -- 
> 2.45.2
> 
> -- 
> Cheers,
> Stephen Rothwell



