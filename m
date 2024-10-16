Return-Path: <linux-next+bounces-4310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2E9A116F
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 20:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A6CDB23D6E
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 18:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6AB210195;
	Wed, 16 Oct 2024 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+KUqH5e"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F65520F5BA;
	Wed, 16 Oct 2024 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103024; cv=none; b=kyATWmDcWGgwAGd0uJL/7QAsizKeF1+z+RDskJkosYWWVOzm0SeXpxwbd0KjdNMwfbvGC67k/8n4JkIomGSGdCOpjS9fdInVjwRS0HSGRB9RUKvp5Il4CRIKu9ep6gUe5KvR+j9Kv9K+i1qB9ABONCzFwM9CTh4+Ask5J2gLhjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103024; c=relaxed/simple;
	bh=A4rbUUyX5VHHSLuIcUaeuLPb+NZt6EXbyVP+urSwLtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zom3NBe4/L+CQs9Ijp7XPaifjto7YxVshmVUAnHO8OFNJfm/7pFPz3gPL3FjH3tftPK89RZbhE6droO83mecCrz8fgJKaUBdoIjze1CZXC5I7CGRspvN6DorPcQSMIL021RWlCxSBvXmR9e6bYVwfd3gsEzFlCzcIfe6Y4C8P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+KUqH5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB246C4CEC5;
	Wed, 16 Oct 2024 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729103024;
	bh=A4rbUUyX5VHHSLuIcUaeuLPb+NZt6EXbyVP+urSwLtU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=X+KUqH5ewlI8/xiz2zl9jGHniOJSmoq5f24YJSlKA/lgAuFe2QJ4tUTEZ5VrHYEzz
	 R5pV29WQQOuuRNME7LS2js007tr8btQtMlgf5BzK+flvhBD1xXOvdXbYTAk/VR9NSh
	 zZpm/IIWyoIo2DEAZtCI9mdusx5EIySOkVxIZimD8SwrGz5t14THK79WkbIWWULGRR
	 mi0Kpjc/ZwZa7+dHSO6qI2C3EdWd9kODyX9axS+S8VCo4t1zn36kAvMArg80pC501S
	 NM2CH2h5hTr7EogZJuaQXZznmBAv2yyzFcJd6M9lUI6DpFK60LFO9yotOYqfoTs7sm
	 60HaWijoLoxgg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 90002CE0DCA; Wed, 16 Oct 2024 11:23:43 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:23:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: peterz@infradead.org, mingo@redhat.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-perf-users@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] perf: Fix missing RCU reader protection in
 perf_event_clear_cpumask()
Message-ID: <fd5f90b2-62b1-4984-8969-41e87322b677@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240913162340.2142976-1-kan.liang@linux.intel.com>
 <39bb4c06-a8e8-4eef-8659-534939c9987f@linux.intel.com>
 <56ae5f08-174f-4f96-a454-36c6c3d68075@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ae5f08-174f-4f96-a454-36c6c3d68075@paulmck-laptop>

On Fri, Sep 13, 2024 at 11:14:41AM -0700, Paul E. McKenney wrote:
> On Fri, Sep 13, 2024 at 12:25:59PM -0400, Liang, Kan wrote:
> > 
> > 
> > On 2024-09-13 12:23 p.m., kan.liang@linux.intel.com wrote:
> > > From: Kan Liang <kan.liang@linux.intel.com>
> > > 
> > > Running rcutorture scenario TREE05, the below warning is triggered.
> > > 
> > > [   32.604594] WARNING: suspicious RCU usage
> > > [   32.605928] 6.11.0-rc5-00040-g4ba4f1afb6a9 #55238 Not tainted
> > > [   32.607812] -----------------------------
> > > [   32.609140] kernel/events/core.c:13946 RCU-list traversed in non-reader section!!
> > > [   32.611595] other info that might help us debug this:
> > > [   32.614247] rcu_scheduler_active = 2, debug_locks = 1
> > > [   32.616392] 3 locks held by cpuhp/4/35:
> > > [   32.617687]  #0: ffffffffb666a650 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> > > [   32.620563]  #1: ffffffffb666cd20 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
> > > [   32.623412]  #2: ffffffffb677c288 (pmus_lock){+.+.}-{3:3}, at: perf_event_exit_cpu_context+0x32/0x2f0
> > > 
> > > In perf_event_clear_cpumask(), uses list_for_each_entry_rcu() without an
> > > obvious RCU read-side critical section.
> > > 
> > > Either pmus_srcu or pmus_lock is good enough to protect the pmus list.
> > > In the current context, pmus_lock is already held. The
> > > list_for_each_entry_rcu() is not required.
> > > 
> > > Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
> > > Reported-by: Paul E. McKenney <paulmck@kernel.org>
> > > Closes: https://lore.kernel.org/lkml/2b66dff8-b827-494b-b151-1ad8d56f13e6@paulmck-laptop/
> > > Tested-by: Paul E. McKenney <paulmck@kernel.org>
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Closes: https://lore.kernel.org/oe-lkp/202409131559.545634cc-oliver.sang@intel.com
> > 
> > Forgot to add the below tag, please fold it.
> > 
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> 
> Have one of these to go along with it.  ;-)
> 
> Tested-by: Paul E. McKenney <paulmck@kernel.org>

Just following up, seeing how this is not yet in -next.

Is this on its way upstream?

							Thanx, Paul

> > Thanks,
> > Kan
> > > Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> > > ---
> > >  kernel/events/core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > > index 20e97c1aa4d6..5ba9934b49df 100644
> > > --- a/kernel/events/core.c
> > > +++ b/kernel/events/core.c
> > > @@ -13912,7 +13912,7 @@ static void perf_event_clear_cpumask(unsigned int cpu)
> > >  	}
> > >  
> > >  	/* migrate */
> > > -	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
> > > +	list_for_each_entry(pmu, &pmus, entry) {
> > >  		if (pmu->scope == PERF_PMU_SCOPE_NONE ||
> > >  		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
> > >  			continue;

