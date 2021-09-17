Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2D340FD70
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 17:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240837AbhIQP7j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Sep 2021 11:59:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235210AbhIQP7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Sep 2021 11:59:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6830160F43;
        Fri, 17 Sep 2021 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631894296;
        bh=zj2UyYcZHE6q9CXjCUeRJJBOd9INUaRewZnkKDtoHdM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZWoQ9kOBAq1+o9tlNANN2K8IDDenNx4UTW13b8VNEAXLV+7VSQZYQQ47gpBdOcuOu
         rkAFwGRI7HJ7hAgZeRU0oy28PxSv2bvHZ5CrMMy+rD7pvGOco1gmfqtEnRsj+ZC2tk
         BmPF8IauHHRlDFZ8/lJwHZzsrtIrJ+20m4s3lqq0pr/JOcqdSX62V7n4YcKHdeLA9k
         YZYa9HgHspXWg8qJhGSKjOpGYZJj2nNQL2DCBg+3BKl2Tyhq+jaEVWhIumZE5U10EY
         Hf3g8hKIttTrlpxfV5ly3kAuUgxd5QmiwMmZ8GoNX6nx+MQOwqDI5B3uNJ6MyYGmkp
         OQsZa4lS8MzOw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 3B4AF5C04F3; Fri, 17 Sep 2021 08:58:16 -0700 (PDT)
Date:   Fri, 17 Sep 2021 08:58:16 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20210917155816.GQ4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210917115859.6cfc64a5@canb.auug.org.au>
 <YURQlNtL00f1HWVe@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YURQlNtL00f1HWVe@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 17, 2021 at 10:23:48AM +0200, Peter Zijlstra wrote:
> On Fri, Sep 17, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gather_info() leaves .noinstr.text section
> 
> Those are pre-existing and Boris is lokoing into them, these however,
> are new:
> 
> > vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_dynticks_task_trace_enter() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_dynticks_task_trace_exit() leaves .noinstr.text section
> 
> These are from 7d0c9c50c5a1 ("rcu-tasks: Avoid IPIing userspace/idle
> tasks if kernel is so built").
> 
> The below seems to help.
> 
> > vmlinux.o: warning: objtool: rcu_nmi_enter()+0x36: call to __kasan_check_read() leaves .noinstr.text section
> 
> That's 2be57f732889 ("rcu: Weaken ->dynticks accesses and updates"),
> doing:
> 
> -       return !(arch_atomic_read(&this_cpu_ptr(&rcu_data)->dynticks) & 0x1);
> +       return !(atomic_read(this_cpu_ptr(&rcu_data.dynticks)) & 0x1);
> 
> and causing instrumentation to be inserted where none is acceptable.
> Flipping that back to arch_atomic_read() makes it go away as expected.

The 2be57f732889 commit went in during the v5.15 merge window and the
7d0c9c50c5a1 went into v5.8, but perhaps Linus won't be averse to taking
a fix for an older bug along with the regression.  ;-)

Given no Signed-off-by, I am guessing that you would like to push
this separately.  If so:

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 1a6fdb03d0a5..5199559fbbf0 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -1479,7 +1479,7 @@ static void rcu_bind_gp_kthread(void)
>  }
>  
>  /* Record the current task on dyntick-idle entry. */
> -static void noinstr rcu_dynticks_task_enter(void)
> +static __always_inline void rcu_dynticks_task_enter(void)
>  {
>  #if defined(CONFIG_TASKS_RCU) && defined(CONFIG_NO_HZ_FULL)
>  	WRITE_ONCE(current->rcu_tasks_idle_cpu, smp_processor_id());
> @@ -1487,7 +1487,7 @@ static void noinstr rcu_dynticks_task_enter(void)
>  }
>  
>  /* Record no current task on dyntick-idle exit. */
> -static void noinstr rcu_dynticks_task_exit(void)
> +static __always_inline void rcu_dynticks_task_exit(void)
>  {
>  #if defined(CONFIG_TASKS_RCU) && defined(CONFIG_NO_HZ_FULL)
>  	WRITE_ONCE(current->rcu_tasks_idle_cpu, -1);
> @@ -1495,7 +1495,7 @@ static void noinstr rcu_dynticks_task_exit(void)
>  }
>  
>  /* Turn on heavyweight RCU tasks trace readers on idle/user entry. */
> -static void rcu_dynticks_task_trace_enter(void)
> +static __always_inline void rcu_dynticks_task_trace_enter(void)
>  {
>  #ifdef CONFIG_TASKS_TRACE_RCU
>  	if (IS_ENABLED(CONFIG_TASKS_TRACE_RCU_READ_MB))
> @@ -1504,7 +1504,7 @@ static void rcu_dynticks_task_trace_enter(void)
>  }
>  
>  /* Turn off heavyweight RCU tasks trace readers on idle/user exit. */
> -static void rcu_dynticks_task_trace_exit(void)
> +static __always_inline void rcu_dynticks_task_trace_exit(void)
>  {
>  #ifdef CONFIG_TASKS_TRACE_RCU
>  	if (IS_ENABLED(CONFIG_TASKS_TRACE_RCU_READ_MB))
> 
