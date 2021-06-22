Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA183B0B31
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 19:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbhFVRMz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 13:12:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:37942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230102AbhFVRMz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 13:12:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7DB361166;
        Tue, 22 Jun 2021 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624381837;
        bh=a+PLuKVymxA0COwEw81AAw1JqR/VCb63zv7i5UvWhFs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=MkB7NIb/w7T/L65z6FzGzuSS+gkOzprtBiodbApGpVnqXYxfj5Q/0dxlp11hx8YzU
         v3YBrANh4Zt7+fkXVtRBKhxDCObKp6hvwxpd4rovoAQpBDZOA5difyz4MeNVeyrCpR
         BEhYOzSG+kLU1/Y40m/WM8oMSxc8YmmkoZO4vgpInYD9B4SCXA0/RpRjM4Frez+wZw
         Czq6JAVn8Fc8bqI9JHCx3bOQUCJxQSKl74a1rbPY9lI1vCjeXNSCptfVXxetYrya2l
         FkfBZlfO3X0D9PGpghYrDET6/pn5EPjmu9UXVPer6uWia6n4sbXzxsef+d9Zq/Btw2
         n8HJjCK8rEFxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 8E41B5C017F; Tue, 22 Jun 2021 10:10:37 -0700 (PDT)
Date:   Tue, 22 Jun 2021 10:10:37 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210622171037.GB4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210622144757.055a4137@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622144757.055a4137@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 22, 2021 at 02:47:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree_stall.h
> 
> between commit:
> 
>   2f064a59a11f ("sched: Change task_struct::state")
> 
> from the tip tree and commit:
> 
>   367455053a76 ("rcu: Mark accesses in tree_stall.h")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I have moved this RCU commit out of my -next pile.  I will put it back
at v5.14-rc1 time.  The other conflict looks quite straightforward,
so I am leaving that one be.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree_stall.h
> index acb2288063b5,24065f1acb8b..000000000000
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@@ -460,12 -462,13 +462,13 @@@ static void rcu_check_gp_kthread_starva
>   
>   	if (rcu_is_gp_kthread_starving(&j)) {
>   		cpu = gpk ? task_cpu(gpk) : -1;
>  -		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=%#lx ->cpu=%d\n",
>  +		pr_err("%s kthread starved for %ld jiffies! g%ld f%#x %s(%d) ->state=%#x ->cpu=%d\n",
>   		       rcu_state.name, j,
>   		       (long)rcu_seq_current(&rcu_state.gp_seq),
> - 		       data_race(rcu_state.gp_flags),
> - 		       gp_state_getname(rcu_state.gp_state), rcu_state.gp_state,
> - 		       gpk ? gpk->__state : ~0, cpu);
> + 		       data_race(READ_ONCE(rcu_state.gp_flags)),
> + 		       gp_state_getname(rcu_state.gp_state),
> + 		       data_race(READ_ONCE(rcu_state.gp_state)),
>  -		       gpk ? data_race(READ_ONCE(gpk->state)) : ~0, cpu);
> ++		       gpk ? data_race(READ_ONCE(gpk->__state)) : ~0, cpu);
>   		if (gpk) {
>   			pr_err("\tUnless %s kthread gets sufficient CPU time, OOM is now expected behavior.\n", rcu_state.name);
>   			pr_err("RCU grace-period kthread stack dump:\n");
> @@@ -508,7 -511,7 +511,7 @@@ static void rcu_check_gp_kthread_expire
>   		       (long)rcu_seq_current(&rcu_state.gp_seq),
>   		       data_race(rcu_state.gp_flags),
>   		       gp_state_getname(RCU_GP_WAIT_FQS), RCU_GP_WAIT_FQS,
> - 		       gpk->__state);
>  -		       data_race(READ_ONCE(gpk->state)));
> ++		       data_race(READ_ONCE(gpk->__state)));
>   		pr_err("\tPossible timer handling issue on cpu=%d timer-softirq=%u\n",
>   		       cpu, kstat_softirqs_cpu(TIMER_SOFTIRQ, cpu));
>   	}
> @@@ -732,23 -816,34 +816,34 @@@ void show_rcu_gp_kthreads(void
>   	struct task_struct *t = READ_ONCE(rcu_state.gp_kthread);
>   
>   	j = jiffies;
> - 	ja = j - data_race(rcu_state.gp_activity);
> - 	jr = j - data_race(rcu_state.gp_req_activity);
> - 	jw = j - data_race(rcu_state.gp_wake_time);
> - 	pr_info("%s: wait state: %s(%d) ->state: %#x delta ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_flags %#x\n",
> + 	ja = j - data_race(READ_ONCE(rcu_state.gp_activity));
> + 	jr = j - data_race(READ_ONCE(rcu_state.gp_req_activity));
> + 	js = j - data_race(READ_ONCE(rcu_state.gp_start));
> + 	jw = j - data_race(READ_ONCE(rcu_state.gp_wake_time));
>  -	pr_info("%s: wait state: %s(%d) ->state: %#lx ->rt_priority %u delta ->gp_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#x\n",
> ++	pr_info("%s: wait state: %s(%d) ->state: %#x ->rt_priority %u delta ->gp_start %lu ->gp_activity %lu ->gp_req_activity %lu ->gp_wake_time %lu ->gp_wake_seq %ld ->gp_seq %ld ->gp_seq_needed %ld ->gp_max %lu ->gp_flags %#x\n",
>   		rcu_state.name, gp_state_getname(rcu_state.gp_state),
> - 		rcu_state.gp_state, t ? t->__state : 0x1ffff,
> - 		ja, jr, jw, (long)data_race(rcu_state.gp_wake_seq),
> - 		(long)data_race(rcu_state.gp_seq),
> - 		(long)data_race(rcu_get_root()->gp_seq_needed),
> - 		data_race(rcu_state.gp_flags));
> + 		data_race(READ_ONCE(rcu_state.gp_state)),
>  -		t ? data_race(READ_ONCE(t->state)) : 0x1ffffL, t ? t->rt_priority : 0xffU,
> ++		t ? data_race(READ_ONCE(t->__state)) : 0x1ffffL, t ? t->rt_priority : 0xffU,
> + 		js, ja, jr, jw, (long)data_race(READ_ONCE(rcu_state.gp_wake_seq)),
> + 		(long)data_race(READ_ONCE(rcu_state.gp_seq)),
> + 		(long)data_race(READ_ONCE(rcu_get_root()->gp_seq_needed)),
> + 		data_race(READ_ONCE(rcu_state.gp_max)),
> + 		data_race(READ_ONCE(rcu_state.gp_flags)));
>   	rcu_for_each_node_breadth_first(rnp) {
> - 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq),
> - 				 READ_ONCE(rnp->gp_seq_needed)))
> + 		if (ULONG_CMP_GE(READ_ONCE(rcu_state.gp_seq), READ_ONCE(rnp->gp_seq_needed)) &&
> + 		    !data_race(READ_ONCE(rnp->qsmask)) && !data_race(READ_ONCE(rnp->boost_tasks)) &&
> + 		    !data_race(READ_ONCE(rnp->exp_tasks)) && !data_race(READ_ONCE(rnp->gp_tasks)))
>   			continue;
> - 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld\n",
> - 			rnp->grplo, rnp->grphi, (long)data_race(rnp->gp_seq),
> - 			(long)data_race(rnp->gp_seq_needed));
> + 		pr_info("\trcu_node %d:%d ->gp_seq %ld ->gp_seq_needed %ld ->qsmask %#lx %c%c%c%c ->n_boosts %ld\n",
> + 			rnp->grplo, rnp->grphi,
> + 			(long)data_race(READ_ONCE(rnp->gp_seq)),
> + 			(long)data_race(READ_ONCE(rnp->gp_seq_needed)),
> + 			data_race(READ_ONCE(rnp->qsmask)),
> + 			".b"[!!data_race(READ_ONCE(rnp->boost_kthread_task))],
> + 			".B"[!!data_race(READ_ONCE(rnp->boost_tasks))],
> + 			".E"[!!data_race(READ_ONCE(rnp->exp_tasks))],
> + 			".G"[!!data_race(READ_ONCE(rnp->gp_tasks))],
> + 			data_race(READ_ONCE(rnp->n_boosts)));
>   		if (!rcu_is_leaf_node(rnp))
>   			continue;
>   		for_each_leaf_node_possible_cpu(rnp, cpu) {


