Return-Path: <linux-next+bounces-5499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC0A3B38B
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 09:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CB651898D87
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 08:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4FC1BAEDC;
	Wed, 19 Feb 2025 08:20:17 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A4B1C07D8;
	Wed, 19 Feb 2025 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953217; cv=none; b=UIBicgvKTbuX8Qn+m+KNPrT6t8VA/pF5yfuF7UDqZoJeL61dqoQ3OIhPs6pnLF0+XnNK5aL+PsmBg3fTmvStyAniSn95P6prZN0ch7pkuvvoypKth38KLN1AQbffmrNtBguafQ+WgjWoO2B8cyjXAtc+ASFRprIFef8a2VdBicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953217; c=relaxed/simple;
	bh=6wZy9EuO1eT7DmYlRDQUktf92Tji9heVhYH1Bu+cHw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbFqbjEj+ocNwWCvGNKAKco+zXNMRNnHmaHCP86nr4d8Sw6lCaLwF74cSRje7dBmNyACv6sm8peo0KSGfr1jKuLXKxEkBPX8TIgiLZKuIEt/Sqo4IRrsjyN1pRzDM9yCI90BN0mNPyZHby1gH3w1iikW87/M4h1CKw/7K5okfYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 234B21682;
	Wed, 19 Feb 2025 00:20:23 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8C523F5A1;
	Wed, 19 Feb 2025 00:20:00 -0800 (PST)
Date: Wed, 19 Feb 2025 09:19:56 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7WULBZPsh8QK3DV@arm.com>
References: <20250218192412.2072619-1-beata.michalska@arm.com>
 <Z7TqFLU0Kwg9cUjO@thinkpad>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TqFLU0Kwg9cUjO@thinkpad>

On Tue, Feb 18, 2025 at 03:14:23PM -0500, Yury Norov wrote:
> On Tue, Feb 18, 2025 at 07:24:12PM +0000, Beata Michalska wrote:
> > While searching for a reference CPU within a given policy,
> > arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> > all available CPUs and to ensure each is verified only once.
> > Recent changes to cpumask_next_wrap will handle the latter no more,
> > so switching to for_each_cpu_wrap, which  preserves expected behavior
> > while ensuring compatibility with the updates.
> 
> This is technically correct, but I would rather point that for
> iterating over each CPU, it's better to use a dedicated iterator
> instead of opencoded loop.

I can certainly add that.
> 
> > Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  based on arm64 for-next/amuv1-avg-freq
> > 
> >  arch/arm64/kernel/topology.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index a09b0551ec59..9e3583720668 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
> >  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> >  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> >  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> > -			int ref_cpu = cpu;
> > +			int ref_cpu;
> >  
> >  			if (!policy)
> >  				return -EINVAL;
> > @@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
> >  				return -EOPNOTSUPP;
> >  			}
> >  
> > -			do {
> > -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> > -							    start_cpu, true);
> > -
> > -			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> > +			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
> > +				if (ref_cpu == start_cpu) {
> > +					/* Prevent verifying same CPU twice */
> > +					ref_cpu = nr_cpu_ids;
> > +					break;
> 
> If start_cpu == cpu, and you begin with 'cpu + 1', you will never
> check the 'cpu' for idle, right? Maybe like this?
> 
>         unsigned int start_cpu = cpu + 1;
> 
This is not entirely a pure for-each case here.
If this loop is reached, it means the start_cpu did not meet the criteria, and
we are trying to find another CPU within the policy that might. Which is why we
pick up the next in line and check whether it is suitable or not.
Testing for idle is just a shortcut, as an idle CPU will most probably not be
considered a good reference either way.

---
BR
Beata
> > +				}
> > +				if (!idle_cpu(ref_cpu))
> > +					break;
> > +			}
> >  
> >  			cpufreq_cpu_put(policy);
> >  
> > -- 
> > 2.25.1

