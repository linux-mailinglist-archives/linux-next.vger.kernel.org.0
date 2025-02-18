Return-Path: <linux-next+bounces-5484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09DEA3A768
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 20:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 516E27A3FCD
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 19:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCDE1E832B;
	Tue, 18 Feb 2025 19:29:13 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFA71E8326;
	Tue, 18 Feb 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739906953; cv=none; b=YIKapcL3iw5Cuz2pMqz7c9GiDDbGIg8/ncQU2vTufZVNH/bnT0jfHmFG/rkCKkajBlPybtER+8k7iIIwgyB+PJjQnutyQNggp91Ek4mDNcFjeaXEiFjDIO597JzyZKIpPvV/dqfnbhl52QuEKOW//kwgo9SbvskZwSWKB91ds3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739906953; c=relaxed/simple;
	bh=EcclNsPtawoA7531dqGQGb0K0/n8bbxbWvJlA/q1vHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7Lp6c2cPx23/ECuvNP+sCNhDbaERaQyptnJk7wbQqOBhEnojIYj8MReKHi3WewSV+gfuAJbETqSUkIWwoxuHEjvXYbnCti2usuWvI9FJPy6+uQwecHxzFyWMFZ6uWDGpHSd9JDHKxTe+A6gt/XznXvWWeoAhIJ/TJsqUKpoDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23571152B;
	Tue, 18 Feb 2025 11:29:29 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2855A3F6A8;
	Tue, 18 Feb 2025 11:29:07 -0800 (PST)
Date: Tue, 18 Feb 2025 20:28:56 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7TfeGxiy3_otBry@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
 <Z7RiVtunqI9edfK4@arm.com>
 <20250219004934.46ace766@canb.auug.org.au>
 <Z7SU0THZ6bSG9BKT@arm.com>
 <Z7SWQoO2Upm_sNNx@thinkpad>
 <Z7TQIYRPw6nxsa0K@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TQIYRPw6nxsa0K@arm.com>

On Tue, Feb 18, 2025 at 06:23:29PM +0000, Catalin Marinas wrote:
> On Tue, Feb 18, 2025 at 09:16:34AM -0500, Yury Norov wrote:
> > On Tue, Feb 18, 2025 at 02:10:25PM +0000, Catalin Marinas wrote:
> > > Hi Stephen,
> > > 
> > > On Wed, Feb 19, 2025 at 12:49:34AM +1100, Stephen Rothwell wrote:
> > > > On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com> wrote:
> > > > > I'm currently testing a proper fix for that one.
> > > > > Should I just send it over as a diff to apply or rather a proper 'fixes' patch?
> > > > 
> > > > Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
> > > > fine.
> > > 
> > > I just talked to Beata off-list. I think she'll try to use the current
> > > for_each_cpu_wrap() API and avoid conflicts with the cpumask_next_wrap()
> > > API change.
> > 
> > Hi,
> > 
> > Yes, for_each() loops are always preferable over opencoded iterating.
> > Please feel free to CC me in case I can help.
> 
> Beata is going to post the official fix but in the meantime, to avoid
> breaking next, I'll add my temporary fix:
>
Just posted the fix [1].
Thank you all.

---
[1] https://lore.kernel.org/linux-next/20250218192412.2072619-1-beata.michalska@arm.com/T/#u

---
BR
Beata
> --------8<--------------------------------
> From 1b12139107798128c183838c5f4a3f7ffcea1e44 Mon Sep 17 00:00:00 2001
> From: Catalin Marinas <catalin.marinas@arm.com>
> Date: Tue, 18 Feb 2025 18:20:46 +0000
> Subject: [PATCH] arm64: Do not use the deprecated cpumask_next_wrap() in
>  arch_freq_get_on_cpu()
> 
> cpumask_next_wrap() will soon disappear in its current form. Use
> for_each_cpu_wrap() instead.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/kernel/topology.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index a09b0551ec59..1544d3648554 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
>  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
>  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> -			int ref_cpu = cpu;
> +			int ref_cpu;
> 
>  			if (!policy)
>  				return -EINVAL;
> @@ -265,11 +265,10 @@ int arch_freq_get_on_cpu(int cpu)
>  				return -EOPNOTSUPP;
>  			}
> 
> -			do {
> -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> -							    start_cpu, true);
> -
> -			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> +			for_each_cpu_wrap(ref_cpu, policy->cpus, start_cpu) {
> +				if (!idle_cpu(ref_cpu))
> +					break;
> +			}
> 
>  			cpufreq_cpu_put(policy);
> 
> 

