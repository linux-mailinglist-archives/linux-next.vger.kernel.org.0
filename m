Return-Path: <linux-next+bounces-3273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF0B94CB4D
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 09:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2CB31C20D27
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2024 07:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF516178373;
	Fri,  9 Aug 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDYrv8Ko"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653617BA2;
	Fri,  9 Aug 2024 07:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723188366; cv=none; b=UpQAka4Ly124SV2L9O8KIsydSnZLN7aiUWdpWO65v0yapGSStWjetS5lio7JSDua6hVB4nb2qBrCuEVHIu78h/NxKSHWaVUbqdRP64prV2Rr9OB13wsdenvOk0oZf/j2PLTEcPFitFUPXRGp8/urcPt/Fn/XU1RTa2jjkt2sGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723188366; c=relaxed/simple;
	bh=deZLgU33CIdweE3yY90TLwMZ4pWclMltbTkCveFC5ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBDi6Re+NOz0J4cwNDdm28pF4kSzU5FozMZFYI5GhM0Xk+Du9JMYA7uG+hMlzKEqnhD2sKVmbPJuJsW9Ed6By+QMgxNh6TyL8es+n5Gk3R+MidEYoBE13rNVe7sxEqJv+nl5Qi6DGgHNCOTARh56PqJVLX1dIcDReQNYPYtBP9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDYrv8Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9AC32782;
	Fri,  9 Aug 2024 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723188366;
	bh=deZLgU33CIdweE3yY90TLwMZ4pWclMltbTkCveFC5ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDYrv8KoN6eN5im3upqcseRRXlOyR+uADNLkq3oWEnq9z2excCt6smJ6VbGaGFIuw
	 QZTPlrrCv2wPpMdujRZ+nT1it7S5luLlFrVnpJsu0gC11WhvyR4KelNCts9SO743Bl
	 JJRImTu+RHn2oPq1wLT7+Rjy9pWk2bjcxdgh/s7Hf3TVsoWWfHXWLuhnuwBkclj1ae
	 NrlfM2K7IrXvzTMFRga2az9ilpa+X7udbyw/4Kre42eYSxYmUoRhC3rFpn2tb47mO7
	 n4kEQn0n83kCJg1P8DWfpsWpdtFsgoNZdMaankr5Qw2JD7hPtcF2fufgW55ZvFBYio
	 U+8gB2jQfNTUA==
Date: Fri, 9 Aug 2024 12:55:58 +0530
From: Neeraj Upadhyay <Neeraj.Upadhyay@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>, Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ryo Takakura <takakura@valinux.co.jp>
Subject: Re: linux-next: manual merge of the rcu tree with the printk tree
Message-ID: <20240809072557.GA734505@neeraj.linux>
References: <20240809122321.5675db8f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809122321.5675db8f@canb.auug.org.au>

Hi Stephen

On Fri, Aug 09, 2024 at 12:23:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree_exp.h
> 
> between commit:
> 
>   9a30ceb4d93e ("rcu: Mark emergency sections in rcu stalls")
> 
> from the printk tree and commits:
> 
>   34863005f96e ("rcu: Extract synchronize_rcu_expedited_stall() from synchronize_rcu_expedited_wait()")
>   c925e2f61399 ("rcu: Let dump_cpu_task() be used without preemption disabled")
> 
> from the rcu tree.
> 
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Thank you! The resolution looks good to me. I will mention this conflict
during PR submission and coordinate with the maintainer of the printk
tree.


- Neeraj

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree_exp.h
> index be2d251e84f8,c3266bf709d5..000000000000
> --- a/kernel/rcu/tree_exp.h
> +++ b/kernel/rcu/tree_exp.h
> @@@ -543,6 -542,67 +543,68 @@@ static bool synchronize_rcu_expedited_w
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
> + 			dump_cpu_task(cpu);
> ++			nbcon_cpu_emergency_flush();
> + 		}
> + 		rcu_exp_print_detail_task_stall_rnp(rnp);
> + 	}
> + }
> + 
>   /*
>    * Wait for the expedited grace period to elapse, issuing any needed
>    * RCU CPU stall warnings along the way.
> @@@ -597,60 -652,8 +657,11 @@@ static void synchronize_rcu_expedited_w
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



