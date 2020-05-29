Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DF41E7FEB
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgE2OPD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbgE2OPC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 10:15:02 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A643720707;
        Fri, 29 May 2020 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590761701;
        bh=TQHX+O8aYeD0xfqbprAV/cwe/gW4dGK+6DFKyZ/i18E=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KtJI71mk1KMuxrzeUv4ItbG8ZMLLwF7rTuxrfRCshMp7Mgyap7k074+4ZDcB4LLtu
         86Xr1PG8JzJuGRu4U0IVtdxHWdVuZY8gGQ3nba6StIC3tPLJrN0iyUscxTu1MvBgen
         74hKG93O+/jTIrJsR2lXX0tob8a28h4RkH9c0Zpo=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 8A3F43522683; Fri, 29 May 2020 07:15:01 -0700 (PDT)
Date:   Fri, 29 May 2020 07:15:01 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200529141501.GC2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200529162234.4f1c3d58@canb.auug.org.au>
 <20200529164132.6fb46471@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529164132.6fb46471@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 04:41:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 29 May 2020 16:22:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > Today's linux-next merge of the rcu tree got a conflict in:
> > 
> >   kernel/rcu/tree.c
> > 
> > between commits:
> > 
> >   806f04e9fd2c ("rcu: Allow for smp_call_function() running callbacks from idle")
> >   aaf2bc50df1f ("rcu: Abstract out rcu_irq_enter_check_tick() from rcu_nmi_enter()")
> > 
> > from the tip tree and commit:
> > 
> >   c0601bb42994 ("rcu/tree: Clean up dynticks counter usage")
> >   3f3baaf3ac07 ("rcu/tree: Remove dynticks_nmi_nesting counter")
> > 
> > from the rcu tree.
> > 
> > I fixed it up (I punted and took some from the former and some from the
> > latter) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentioned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
> 
> I redid this and the resolution is below, but you should look at the
> final file when I do the release.

Given that the merge window might be opening in a couple days, my thought
is to defer these -rcu commits to my v5.9 pile, and then I resolve this
conflict in the -rcu tree when v5.8-rc1 comes out.  I just now adjusted
the -rcu tree's rcu/next branch accordingly.

Seem reasonable?

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree.c
> index c716eadc7617,78125749638f..1426b968eec1
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -427,14 -385,8 +386,12 @@@ EXPORT_SYMBOL_GPL(rcu_momentary_dyntick
>    */
>   static int rcu_is_cpu_rrupt_from_idle(void)
>   {
> - 	long nesting;
> - 
>  -	/* Called only from within the scheduling-clock interrupt */
>  -	lockdep_assert_in_irq();
>  +	/*
>  +	 * Usually called from the tick; but also used from smp_function_call()
>  +	 * for expedited grace periods. This latter can result in running from
>  +	 * the idle task, instead of an actual IPI.
>  +	 */
>  +	lockdep_assert_irqs_disabled();
>   
>   	/* Check for counter underflows */
>   	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nesting) < 0,
> @@@ -778,24 -718,6 +723,21 @@@ void rcu_irq_exit_preempt(void
>   			 "RCU in extended quiescent state!");
>   }
>   
>  +#ifdef CONFIG_PROVE_RCU
>  +/**
>  + * rcu_irq_exit_check_preempt - Validate that scheduling is possible
>  + */
>  +void rcu_irq_exit_check_preempt(void)
>  +{
>  +	lockdep_assert_irqs_disabled();
>  +
>  +	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nesting) <= 0,
>  +			 "RCU dynticks_nesting counter underflow/zero!");
> - 	RCU_LOCKDEP_WARN(__this_cpu_read(rcu_data.dynticks_nmi_nesting) !=
> - 			 DYNTICK_IRQ_NONIDLE,
> - 			 "Bad RCU  dynticks_nmi_nesting counter\n");
>  +	RCU_LOCKDEP_WARN(rcu_dynticks_curr_cpu_in_eqs(),
>  +			 "RCU in extended quiescent state!");
>  +}
>  +#endif /* #ifdef CONFIG_PROVE_RCU */
>  +
>   /*
>    * Wrapper for rcu_irq_exit() where interrupts are enabled.
>    *


