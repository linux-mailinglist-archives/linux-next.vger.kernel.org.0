Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22A729D4D4
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 22:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgJ1Vyu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:54:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:45012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728312AbgJ1VwY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 17:52:24 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B03A247CF;
        Wed, 28 Oct 2020 15:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603900408;
        bh=MUCMAt6jz/+CZmF1X5Cw4Sf7gHw+TP75QB/xYuWUa7o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=g4GFqo/i1AxVrC0jXcOFmiCO7vpz4mJKuDXeDbkjQXl3RA8vOR4UEPPxWQw8UYL65
         80h9dOP0g8kZiwHhUxRYBQ44kHr2UGX7GDRlE7AyhvLoMdEt/WNWibCDaH0H1GyA7N
         VHmjTls+SMW3oIZQcwUA8J/VZkCdaOspCeOschY8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3225E35212A6; Wed, 28 Oct 2020 08:53:28 -0700 (PDT)
Date:   Wed, 28 Oct 2020 08:53:28 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201028155328.GC3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
 <20201028030130.GB3249@paulmck-ThinkPad-P72>
 <8194dca3b2e871f04c7f6e49672837f8df22546f.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8194dca3b2e871f04c7f6e49672837f8df22546f.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 28, 2020 at 10:39:47AM -0400, Qian Cai wrote:
> On Tue, 2020-10-27 at 20:01 -0700, Paul E. McKenney wrote:
> > If I have the right email thread associated with the right fixes, these
> > commits in -rcu should be what you are looking for:
> > 
> > 73b658b6b7d5 ("rcu: Prevent lockdep-RCU splats on lock acquisition/release")
> > 626b79aa935a ("x86/smpboot:  Move rcu_cpu_starting() earlier")
> > 
> > And maybe this one as well:
> > 
> > 3a6f638cb95b ("rcu,ftrace: Fix ftrace recursion")
> > 
> > Please let me know if these commits do not fix things.
> While those patches silence the warnings for x86. Other arches are still
> suffering. It is only after applying the patch from Boqun below fixed
> everything.

Fair point!

> Is it a good idea for Boqun to write a formal patch or we should fix all arches
> individually like "x86/smpboot: Move rcu_cpu_starting() earlier"?

By Boqun's patch, you mean the change to debug_lockdep_rcu_enabled()
shown below?  Peter Zijlstra showed that real failures can happen, so we
do not want to cover them up.  So we are firmly in "fix all architectures"
space here, sorry!

I am happy to accumulate those patches, but cannot commit to creating
or testing them.

							Thanx, Paul

> > > > diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> > > > index 39334d2d2b37..35d9bab65b75 100644
> > > > --- a/kernel/rcu/update.c
> > > > +++ b/kernel/rcu/update.c
> > > > @@ -275,8 +275,8 @@ EXPORT_SYMBOL_GPL(rcu_callback_map);
> > > >  
> > > >  noinstr int notrace debug_lockdep_rcu_enabled(void)
> > > >  {
> > > > -	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> > > > -	       current->lockdep_recursion == 0;
> > > > +	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE &&
> > > > +	       __lockdep_enabled;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);
> 
> The warnings for each arch are:
> 
> == powerpc ==
> [    0.176044][    T1] smp: Bringing up secondary CPUs ...
> [    0.179731][    T0] 
> [    0.179734][    T0] =============================
> [    0.179736][    T0] WARNING: suspicious RCU usage
> [    0.179739][    T0] 5.10.0-rc1-next-20201028+ #2 Not tainted
> [    0.179741][    T0] -----------------------------
> [    0.179744][    T0] kernel/locking/lockdep.c:3497 RCU-list traversed in non-reader section!!
> [    0.179745][    T0] 
> [    0.179745][    T0] other info that might help us debug this:
> [    0.179745][    T0] 
> [    0.179748][    T0] 
> [    0.179748][    T0] RCU used illegally from offline CPU!
> [    0.179748][    T0] rcu_scheduler_active = 1, debug_locks = 1
> [    0.179750][    T0] no locks held by swapper/1/0.
> [    0.179752][    T0] 
> [    0.179752][    T0] stack backtrace:
> [    0.179757][    T0] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.10.0-rc1-next-20201028+ #2
> [    0.179759][    T0] Call Trace:
> [    0.179767][    T0] [c000000015b27ab0] [c000000000657188] dump_stack+0xec/0x144 (unreliable)
> [    0.179776][    T0] [c000000015b27af0] [c00000000014d0d4] lockdep_rcu_suspicious+0x128/0x14c
> [    0.179782][    T0] [c000000015b27b70] [c000000000148920] __lock_acquire+0x1060/0x1c60
> [    0.179788][    T0] [c000000015b27ca0] [c00000000014a1d0] lock_acquire+0x140/0x5f0
> [    0.179794][    T0] [c000000015b27d90] [c0000000008f22f4] _raw_spin_lock_irqsave+0x64/0xb0
> [    0.179801][    T0] [c000000015b27dd0] [c0000000001a1094] clockevents_register_device+0x74/0x270
> [    0.179808][    T0] [c000000015b27e80] [c00000000001f194] register_decrementer_clockevent+0x94/0x110
> [    0.179814][    T0] [c000000015b27ef0] [c00000000003fd84] start_secondary+0x134/0x800
> [    0.179819][    T0] [c000000015b27f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
> [    0.179855][    T0] 
> [    0.179857][    T0] =============================
> [    0.179858][    T0] WARNING: suspicious RCU usage
> [    0.179860][    T0] 5.10.0-rc1-next-20201028+ #2 Not tainted
> [    0.179862][    T0] -----------------------------
> [    0.179864][    T0] kernel/locking/lockdep.c:886 RCU-list traversed in non-reader section!!
> [    0.179866][    T0] 
> [    0.179866][    T0] other info that might help us debug this:
> [    0.179866][    T0] 
> [    0.179868][    T0] 
> [    0.179868][    T0] RCU used illegally from offline CPU!
> [    0.179868][    T0] rcu_scheduler_active = 1, debug_locks = 1
> [    0.179870][    T0] no locks held by swapper/1/0.
> [    0.179871][    T0] 
> [    0.179871][    T0] stack backtrace:
> [    0.179875][    T0] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.10.0-rc1-next-20201028+ #2
> [    0.179876][    T0] Call Trace:
> [    0.179880][    T0] [c000000015b27980] [c000000000657188] dump_stack+0xec/0x144 (unreliable)
> [    0.179886][    T0] [c000000015b279c0] [c00000000014d0d4] lockdep_rcu_suspicious+0x128/0x14c
> [    0.179892][    T0] [c000000015b27a40] [c00000000014b010] register_lock_class+0x680/0xc70
> [    0.179896][    T0] [c000000015b27b50] [c00000000014795c] __lock_acquire+0x9c/0x1c60
> [    0.179901][    T0] [c000000015b27c80] [c00000000014a1d0] lock_acquire+0x140/0x5f0
> [    0.179906][    T0] [c000000015b27d70] [c0000000008f22f4] _raw_spin_lock_irqsave+0x64/0xb0
> [    0.179912][    T0] [c000000015b27db0] [c0000000003a2fb4] __delete_object+0x44/0x80
> [    0.179917][    T0] [c000000015b27de0] [c00000000035a964] slab_free_freelist_hook+0x174/0x300
> [    0.179921][    T0] [c000000015b27e50] [c00000000035f848] kfree+0xf8/0x500
> [    0.179926][    T0] [c000000015b27ed0] [c000000000656878] free_cpumask_var+0x18/0x30
> [    0.179931][    T0] [c000000015b27ef0] [c00000000003fff0] start_secondary+0x3a0/0x800
> add_cpu_to_masks at arch/powerpc/kernel/smp.c:1390
> (inlined by) start_secondary at arch/powerpc/kernel/smp.c:1420
> [    0.179936][    T0] [c000000015b27f90] [c00000000000c454] start_secondary_prolog+0x10/0x14
> [    0.955418][    T1] smp: Brought up 2 nodes, 128 CPUs
> 
> == arm64 ==
> [    0.473124][    T0] CPU1: Booted secondary processor 0x0000000100 [0x431f0af1]
> [    0.473180][    C1] 
> [    0.473183][    C1] =============================
> [    0.473186][    C1] WARNING: suspicious RCU usage
> [    0.473188][    C1] 5.10.0-rc1-next-20201028+ #3 Not tainted
> [    0.473190][    C1] -----------------------------
> [    0.473193][    C1] kernel/locking/lockdep.c:3497 RCU-list traversed in non-reader section!!
> [    0.473194][    C1] 
> [    0.473197][    C1] other info that might help us debug this:
> [    0.473198][    C1] 
> [    0.473200][    C1] 
> [    0.473202][    C1] RCU used illegally from offline CPU!
> [    0.473204][    C1] rcu_scheduler_active = 1, debug_locks = 1
> [    0.473206][    C1] no locks held by swapper/1/0.
> [    0.473208][    C1] 
> [    0.473210][    C1] stack backtrace:
> [    0.473212][    C1] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.10.0-rc1-next-20201028+ #3
> [    0.473215][    C1] Call trace:
> [    0.473217][    C1]  dump_backtrace+0x0/0x3c8
> [    0.473219][    C1]  show_stack+0x14/0x60
> [    0.473221][    C1]  dump_stack+0x14c/0x1c4
> [    0.473223][    C1]  lockdep_rcu_suspicious+0x134/0x14c
> [    0.473225][    C1]  __lock_acquire+0x1c30/0x2600
> [    0.473227][    C1]  lock_acquire+0x274/0xc48
> [    0.473229][    C1]  _raw_spin_lock+0xc8/0x140
> [    0.473231][    C1]  vprintk_emit+0x90/0x3d0
> [    0.473233][    C1]  vprintk_default+0x34/0x40
> [    0.473235][    C1]  vprintk_func+0x378/0x590
> [    0.473236][    C1]  printk+0xa8/0xd4
> [    0.473239][    C1]  __cpuinfo_store_cpu+0x71c/0x868
> [    0.473241][    C1]  cpuinfo_store_cpu+0x2c/0xc8
> [    0.473243][    C1]  secondary_start_kernel+0x244/0x318
> [    0.547541][    T0] Detected PIPT I-cache on CPU2
> [    0.547562][    T0] GICv3: CPU2: found redistributor 200 region 0:0x0000000401100000
> 
> == s390 ==
> 00: [    0.603404] WARNING: suspicious RCU usage                                
> 00: [    0.603408] 5.10.0-rc1-next-20201027 #1 Not tainted                      
> 00: [    0.603409] -----------------------------                                
> 00: [    0.603459] kernel/locking/lockdep.c:3497 RCU-list traversed in non-reade
> 00: r section!!                                                                 
> 00: [    0.603460]                                                              
> 00: [    0.603460] other info that might help us debug this:                    
> 00: [    0.603460]                                                              
> 00: [    0.603462]                                                              
> 00: [    0.603462] RCU used illegally from offline CPU!                         
> 00: [    0.603462] rcu_scheduler_active = 1, debug_locks = 1                    
> 00: [    0.603463] no locks held by swapper/1/0.                                
> 00: [    0.603464]                                                              
> 00: [    0.603464] stack backtrace:                                             
> 00: [    0.603467] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.10.0-rc1-next-202
> 00: 01027 #1                                                                    
> 00: [    0.603469] Hardware name: IBM 2964 N96 400 (z/VM 6.4.0)                 
> 00: [    0.603471] Call Trace:                                                  
> 00: [    0.603484]  [<00000000d262a778>] show_stack+0x158/0x1f0                 
> 00: [    0.603487]  [<00000000d2635872>] dump_stack+0x1f2/0x238                 
> 00: [    0.603491]  [<00000000d167a550>] __lock_acquire+0x2640/0x4dd0           
> 00: [    0.603493]  [<00000000d167eda8>] lock_acquire+0x3a8/0xd08               
> 00: [    0.603498]  [<00000000d265b088>] _raw_spin_lock_irqsave+0xc0/0xf0       
> 00: [    0.603502]  [<00000000d17103f8>] clockevents_register_device+0xa8/0x528 
> 00:                                                                             
> 00: [    0.603516]  [<00000000d14f5246>] init_cpu_timer+0x33e/0x468             
> 00: [    0.603521]  [<00000000d151f44a>] smp_init_secondary+0x11a/0x328         
> 00: [    0.603525]  [<00000000d151f32a>] smp_start_secondary+0x82/0x88
> 
