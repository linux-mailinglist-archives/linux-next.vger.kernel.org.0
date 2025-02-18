Return-Path: <linux-next+bounces-5482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92788A3A560
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 19:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB990173DAB
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 18:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707DE17A305;
	Tue, 18 Feb 2025 18:23:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5326C17A303;
	Tue, 18 Feb 2025 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739903013; cv=none; b=TLbK2Vi27wREJ9hgjDTzgkKgJ+dtrQkv60zU6g3Y+ejl7sNOB9wI3FHFhTo/Zby5ADtj/vHzI+ZIs5eJalsb/NnkqgkXGKTuLc4Oal86YlOg7YlxUFWOddT1xT7IUFjb2Gn5+Hglra/YyaXnWT2HlF3r6mnQLFmifI/nR9uEFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739903013; c=relaxed/simple;
	bh=Vck+L+XZNB3JBJMTN/9OhHJszsvd/vi5d09OrFOR3EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc3mP/TC+RHGFx2dMeCpTZEClNM33O2U0SS8B3p4lGyuJGAk/wu/g2CSSWDA+M0kLwqDdr3TYXD2mW9uTzmdAW8IzPsFYOzHGcjNJoNdDQ1ApwYAaBCQ5w/CNhzeLm7tPURH+KEC1uFFgbudr/k+DxRJB31acIv1fM6k6SzSyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E05C4CEE2;
	Tue, 18 Feb 2025 18:23:31 +0000 (UTC)
Date: Tue, 18 Feb 2025 18:23:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Beata Michalska <beata.michalska@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <Z7TQIYRPw6nxsa0K@arm.com>
References: <20250218160742.49d6ab76@canb.auug.org.au>
 <Z7RiVtunqI9edfK4@arm.com>
 <20250219004934.46ace766@canb.auug.org.au>
 <Z7SU0THZ6bSG9BKT@arm.com>
 <Z7SWQoO2Upm_sNNx@thinkpad>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7SWQoO2Upm_sNNx@thinkpad>

On Tue, Feb 18, 2025 at 09:16:34AM -0500, Yury Norov wrote:
> On Tue, Feb 18, 2025 at 02:10:25PM +0000, Catalin Marinas wrote:
> > Hi Stephen,
> > 
> > On Wed, Feb 19, 2025 at 12:49:34AM +1100, Stephen Rothwell wrote:
> > > On Tue, 18 Feb 2025 11:35:02 +0100 Beata Michalska <beata.michalska@arm.com> wrote:
> > > > I'm currently testing a proper fix for that one.
> > > > Should I just send it over as a diff to apply or rather a proper 'fixes' patch?
> > > 
> > > Maybe a proper 'fixes' patch, please, if easy - otherwise a diff is
> > > fine.
> > 
> > I just talked to Beata off-list. I think she'll try to use the current
> > for_each_cpu_wrap() API and avoid conflicts with the cpumask_next_wrap()
> > API change.
> 
> Hi,
> 
> Yes, for_each() loops are always preferable over opencoded iterating.
> Please feel free to CC me in case I can help.

Beata is going to post the official fix but in the meantime, to avoid
breaking next, I'll add my temporary fix:

--------8<--------------------------------
From 1b12139107798128c183838c5f4a3f7ffcea1e44 Mon Sep 17 00:00:00 2001
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 18 Feb 2025 18:20:46 +0000
Subject: [PATCH] arm64: Do not use the deprecated cpumask_next_wrap() in
 arch_freq_get_on_cpu()

cpumask_next_wrap() will soon disappear in its current form. Use
for_each_cpu_wrap() instead.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/kernel/topology.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index a09b0551ec59..1544d3648554 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
 			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-			int ref_cpu = cpu;
+			int ref_cpu;

 			if (!policy)
 				return -EINVAL;
@@ -265,11 +265,10 @@ int arch_freq_get_on_cpu(int cpu)
 				return -EOPNOTSUPP;
 			}

-			do {
-				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
-							    start_cpu, true);
-
-			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
+			for_each_cpu_wrap(ref_cpu, policy->cpus, start_cpu) {
+				if (!idle_cpu(ref_cpu))
+					break;
+			}

 			cpufreq_cpu_put(policy);



