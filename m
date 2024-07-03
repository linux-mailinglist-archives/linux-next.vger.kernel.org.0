Return-Path: <linux-next+bounces-2830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372B9266EB
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 19:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB412893F2
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 17:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FA318308A;
	Wed,  3 Jul 2024 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Go7n1/cp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA1618C05;
	Wed,  3 Jul 2024 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027049; cv=none; b=S71LKTgsYxFTFBOwyVHfC6b20pHfsvzjrLwEpQVYZ030ZqdMIaT9P9Q0ru9NTOFBLySgZjbMxZCGyRg+V93pgJctd5WGl+4UT3IFSIsdTr1djLNpGqyM9WMQkV9c+Etq0P9bU+bnr/2XxU1kQ4geZUFYXUas3mbH9XJ9ChDEDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027049; c=relaxed/simple;
	bh=49RzZTWJipbL3RIw+kemkgFat7FFpGDJxcMEypRlpJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js8qSpwl9yIwKvJ53B+gmu07wZmSUelss+4vCAdynKD8FbNqwa5KnkIsojVwfdtu7TsbHCb8mXJMw7mi2NYif0RMeor4BQBZ0n/0hY/+8VFcRuulxf4G8pI18xRfODItfzQtMcOllyOo1iiwnyhGpNysSrV9CKmkyre2wAx/hk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Go7n1/cp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A42C3277B;
	Wed,  3 Jul 2024 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720027049;
	bh=49RzZTWJipbL3RIw+kemkgFat7FFpGDJxcMEypRlpJU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Go7n1/cpx9saeMga79jim/RG0+yZT9yiURl3Uxc52YUCGnRjg6WrQc5ltGJV0suw6
	 MnDWzwLeBeZnWb6m/o0HiM1njLRlS8nuRhefwFawmkg7wecQ3TpPJmzffAKmQopHlZ
	 8yB/8hNbfiO2wM2EngBKfi2F707xhzQo4I7l0/2RWfepJlbQEXOL1QL5GX5zZZti2Q
	 30ilTwfviryYiYQyO9PUVPGevgFJposA8f2eqnnINtrAMQkkhllKtjB7vpH+2CSMUH
	 m21ljt0O7QK6S0wHGTt2xtoyK4R4lHUXbVaTe5+f0AsEDxUt0Nl6IXSV1x7qcCoiTL
	 slJ6Z49zN5Aow==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A2322CE0BC3; Wed,  3 Jul 2024 10:17:28 -0700 (PDT)
Date: Wed, 3 Jul 2024 10:17:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the paulmck tree with the printk tree
Message-ID: <ae5990ea-4f42-4edd-a8e6-b9cb97f13696@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240703131820.02eb8021@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703131820.02eb8021@canb.auug.org.au>

On Wed, Jul 03, 2024 at 01:18:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the paulmck tree got a conflict in:
> 
>   kernel/rcu/tree_exp.h
> 
> between commit:
> 
>   9a30ceb4d93e ("rcu: Mark emergency sections in rcu stalls")
> 
> from the printk tree and commit:
> 
>   c19a6725b019 ("rcu: Extract synchronize_rcu_expedited_stall() from synchronize_rcu_expedited_wait()")
> 
> from the paulmck tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for catching this!

Given how near we are to the merge window, I will defer c19a6725b019 to
the v6.12 merge window.  Abundance of caution and all that...

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree_exp.h
> index be2d251e84f8,d4be644afb50..000000000000
> --- a/kernel/rcu/tree_exp.h
> +++ b/kernel/rcu/tree_exp.h
> @@@ -543,6 -542,69 +543,70 @@@ static bool synchronize_rcu_expedited_w
>   	return false;
>   }
>   
> + /*
> +  * Print out an expedited RCU CPU stall warning message.
> +  */
> + static void synchronize_rcu_expedited_stall(unsigned long jiffies_start, unsigned long j)
> + {
> + 	int cpu;
> + 	unsigned long mask;
> + 	int ndetected;
> + 	struct rcu_node *rnp;
> + 	struct rcu_node *rnp_root = rcu_get_root();
> + 
> + 	if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
> + 		pr_err("INFO: %s detected expedited stalls, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);
> + 		return;
> + 	}
> + 	pr_err("INFO: %s detected expedited stalls on CPUs/tasks: {", rcu_state.name);
> + 	ndetected = 0;
> + 	rcu_for_each_leaf_node(rnp) {
> + 		ndetected += rcu_print_task_exp_stall(rnp);
> + 		for_each_leaf_node_possible_cpu(rnp, cpu) {
> + 			struct rcu_data *rdp;
> + 
> + 			mask = leaf_node_cpu_bit(rnp, cpu);
> + 			if (!(READ_ONCE(rnp->expmask) & mask))
> + 				continue;
> + 			ndetected++;
> + 			rdp = per_cpu_ptr(&rcu_data, cpu);
> + 			pr_cont(" %d-%c%c%c%c", cpu,
> + 				"O."[!!cpu_online(cpu)],
> + 				"o."[!!(rdp->grpmask & rnp->expmaskinit)],
> + 				"N."[!!(rdp->grpmask & rnp->expmaskinitnext)],
> + 				"D."[!!data_race(rdp->cpu_no_qs.b.exp)]);
> + 		}
> + 	}
> + 	pr_cont(" } %lu jiffies s: %lu root: %#lx/%c\n",
> + 		j - jiffies_start, rcu_state.expedited_sequence, data_race(rnp_root->expmask),
> + 		".T"[!!data_race(rnp_root->exp_tasks)]);
> + 	if (ndetected) {
> + 		pr_err("blocking rcu_node structures (internal RCU debug):");
> + 		rcu_for_each_node_breadth_first(rnp) {
> + 			if (rnp == rnp_root)
> + 				continue; /* printed unconditionally */
> + 			if (sync_rcu_exp_done_unlocked(rnp))
> + 				continue;
> + 			pr_cont(" l=%u:%d-%d:%#lx/%c",
> + 				rnp->level, rnp->grplo, rnp->grphi, data_race(rnp->expmask),
> + 				".T"[!!data_race(rnp->exp_tasks)]);
> + 		}
> + 		pr_cont("\n");
> + 	}
> + 	rcu_for_each_leaf_node(rnp) {
> + 		for_each_leaf_node_possible_cpu(rnp, cpu) {
> + 			mask = leaf_node_cpu_bit(rnp, cpu);
> + 			if (!(READ_ONCE(rnp->expmask) & mask))
> + 				continue;
> + 			preempt_disable(); // For smp_processor_id() in dump_cpu_task().
> + 			dump_cpu_task(cpu);
> + 			preempt_enable();
> ++			nbcon_cpu_emergency_flush();
> + 		}
> + 		rcu_exp_print_detail_task_stall_rnp(rnp);
> + 	}
> + }
> + 
>   /*
>    * Wait for the expedited grace period to elapse, issuing any needed
>    * RCU CPU stall warnings along the way.
> @@@ -597,60 -654,8 +659,11 @@@ static void synchronize_rcu_expedited_w
>   		j = jiffies;
>   		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_EXP, (void *)(j - jiffies_start));
>   		trace_rcu_stall_warning(rcu_state.name, TPS("ExpeditedStall"));
> - 		pr_err("INFO: %s detected expedited stalls on CPUs/tasks: {",
> - 		       rcu_state.name);
> - 		ndetected = 0;
> - 		rcu_for_each_leaf_node(rnp) {
> - 			ndetected += rcu_print_task_exp_stall(rnp);
> - 			for_each_leaf_node_possible_cpu(rnp, cpu) {
> - 				struct rcu_data *rdp;
> - 
> - 				mask = leaf_node_cpu_bit(rnp, cpu);
> - 				if (!(READ_ONCE(rnp->expmask) & mask))
> - 					continue;
> - 				ndetected++;
> - 				rdp = per_cpu_ptr(&rcu_data, cpu);
> - 				pr_cont(" %d-%c%c%c%c", cpu,
> - 					"O."[!!cpu_online(cpu)],
> - 					"o."[!!(rdp->grpmask & rnp->expmaskinit)],
> - 					"N."[!!(rdp->grpmask & rnp->expmaskinitnext)],
> - 					"D."[!!data_race(rdp->cpu_no_qs.b.exp)]);
> - 			}
> - 		}
> - 		pr_cont(" } %lu jiffies s: %lu root: %#lx/%c\n",
> - 			j - jiffies_start, rcu_state.expedited_sequence,
> - 			data_race(rnp_root->expmask),
> - 			".T"[!!data_race(rnp_root->exp_tasks)]);
> - 		if (ndetected) {
> - 			pr_err("blocking rcu_node structures (internal RCU debug):");
> - 			rcu_for_each_node_breadth_first(rnp) {
> - 				if (rnp == rnp_root)
> - 					continue; /* printed unconditionally */
> - 				if (sync_rcu_exp_done_unlocked(rnp))
> - 					continue;
> - 				pr_cont(" l=%u:%d-%d:%#lx/%c",
> - 					rnp->level, rnp->grplo, rnp->grphi,
> - 					data_race(rnp->expmask),
> - 					".T"[!!data_race(rnp->exp_tasks)]);
> - 			}
> - 			pr_cont("\n");
> - 		}
> - 		rcu_for_each_leaf_node(rnp) {
> - 			for_each_leaf_node_possible_cpu(rnp, cpu) {
> - 				mask = leaf_node_cpu_bit(rnp, cpu);
> - 				if (!(READ_ONCE(rnp->expmask) & mask))
> - 					continue;
> - 				preempt_disable(); // For smp_processor_id() in dump_cpu_task().
> - 				dump_cpu_task(cpu);
> - 				preempt_enable();
> - 				nbcon_cpu_emergency_flush();
> - 			}
> - 			rcu_exp_print_detail_task_stall_rnp(rnp);
> - 		}
> + 		synchronize_rcu_expedited_stall(jiffies_start, j);
>   		jiffies_stall = 3 * rcu_exp_jiffies_till_stall_check() + 3;
>  +
>  +		nbcon_cpu_emergency_exit();
>  +
>   		panic_on_rcu_stall();
>   	}
>   }



