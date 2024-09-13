Return-Path: <linux-next+bounces-3838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A24C9787A2
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 20:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A1128A789
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCBD126C01;
	Fri, 13 Sep 2024 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqd2bVlN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAF579B8E;
	Fri, 13 Sep 2024 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251283; cv=none; b=bNkpJWEyRPXCv87gIBZJTy7o4/qbrJHWBiHbLBAF1q5B5XJxI43gKjyz877SUSxH5sjtNUSAstV5mh7F8k8iEOBNi4oAxu5IqkoP64STuPr1PyedNfTMVS7wVsIr149w4EiUJRYKkdUAmAb74n8KGW8qKIq5R1HwfEiy7ATexF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251283; c=relaxed/simple;
	bh=TOwLQqvLOjjCMEnl5hRzo9OMtdXKW7OJKj9NQkgh30k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC2U7o0jTVYi0GxQdswXIsqDOfcZqwqfViUQ2vIizUpPKqNZVPKSCaZ3OZxajbSf+rPknBxeLD8b+gEbXLGYs7ls2q5qCKvof5m9eZHVP/5TZPeGlRY/yxrJFMniwyivvOPUrdFsshaJ/bz6sSRBb7TJwaD3qc1NKKq+YRYlwsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqd2bVlN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F00C4CEC0;
	Fri, 13 Sep 2024 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726251283;
	bh=TOwLQqvLOjjCMEnl5hRzo9OMtdXKW7OJKj9NQkgh30k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=eqd2bVlNFsfQrfnT8aBlBEysDazt2FRucGJZ+1o47oX2ry31OBDi/Me81vOfL/KcD
	 N8toZObrtQL5sGmeNZIe9pXfzTMv2wI19+GoqIc/JlX8xRpcBYqKjb6+6IMdTIq41G
	 n47kLw0vn8Qv7C4kQh5eQHXI1EJ4UD9y/cNkjAYoEYjvw0vubXsGlV9Aet+mHXsJZZ
	 f3TSuTcaP1smvoa/b6KUf/4XQb7nSuz4HYQ2glNMuShbQCO91D60edoop4GAnQg84L
	 RG8jHaBSIkerUAoHgcRNkASXyxXUTgNlXIJ7vj4VLZ8RrVT8bwmolw/M4rlSh+gO+X
	 wsf/BwDknRZEg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 05AA3CE1494; Fri, 13 Sep 2024 11:14:41 -0700 (PDT)
Date: Fri, 13 Sep 2024 11:14:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: peterz@infradead.org, mingo@redhat.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] perf: Fix missing RCU reader protection in
 perf_event_clear_cpumask()
Message-ID: <56ae5f08-174f-4f96-a454-36c6c3d68075@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240913162340.2142976-1-kan.liang@linux.intel.com>
 <39bb4c06-a8e8-4eef-8659-534939c9987f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39bb4c06-a8e8-4eef-8659-534939c9987f@linux.intel.com>

On Fri, Sep 13, 2024 at 12:25:59PM -0400, Liang, Kan wrote:
> 
> 
> On 2024-09-13 12:23 p.m., kan.liang@linux.intel.com wrote:
> > From: Kan Liang <kan.liang@linux.intel.com>
> > 
> > Running rcutorture scenario TREE05, the below warning is triggered.
> > 
> > [   32.604594] WARNING: suspicious RCU usage
> > [   32.605928] 6.11.0-rc5-00040-g4ba4f1afb6a9 #55238 Not tainted
> > [   32.607812] -----------------------------
> > [   32.609140] kernel/events/core.c:13946 RCU-list traversed in non-reader section!!
> > [   32.611595] other info that might help us debug this:
> > [   32.614247] rcu_scheduler_active = 2, debug_locks = 1
> > [   32.616392] 3 locks held by cpuhp/4/35:
> > [   32.617687]  #0: ffffffffb666a650 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> > [   32.620563]  #1: ffffffffb666cd20 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> > [   32.623412]  #2: ffffffffb677c288 (pmus_lock){+.+.}-{3:3}, at: perf_event_exit_cpu_context+0x32/0x2f0
> > 
> > In perf_event_clear_cpumask(), uses list_for_each_entry_rcu() without an
> > obvious RCU read-side critical section.
> > 
> > Either pmus_srcu or pmus_lock is good enough to protect the pmus list.
> > In the current context, pmus_lock is already held. The
> > list_for_each_entry_rcu() is not required.
> > 
> > Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
> > Reported-by: Paul E. McKenney <paulmck@kernel.org>
> > Closes: https://lore.kernel.org/lkml/2b66dff8-b827-494b-b151-1ad8d56f13e6@paulmck-laptop/
> > Tested-by: Paul E. McKenney <paulmck@kernel.org>
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202409131559.545634cc-oliver.sang@intel.com
> 
> Forgot to add the below tag, please fold it.
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>

Have one of these to go along with it.  ;-)

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> Thanks,
> Kan
> > Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> > ---
> >  kernel/events/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 20e97c1aa4d6..5ba9934b49df 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -13912,7 +13912,7 @@ static void perf_event_clear_cpumask(unsigned int cpu)
> >  	}
> >  
> >  	/* migrate */
> > -	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
> > +	list_for_each_entry(pmu, &pmus, entry) {
> >  		if (pmu->scope == PERF_PMU_SCOPE_NONE ||
> >  		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
> >  			continue;

