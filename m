Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649DA288F0B
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 18:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389663AbgJIQhr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 12:37:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388719AbgJIQhr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 12:37:47 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 845CF22280;
        Fri,  9 Oct 2020 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602261466;
        bh=uyBqRXCX9yoXHHyVP4aERA3vGxdtAVb16Nfie9M1VJ4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=r5a3tB7nnwlMogggRNBkUk8qAvs//cfbgsOdoCssLegDl4dz0BibERanQGOi47D11
         hAC02EBZQ4w2VKRb4e6NDkrVXTEGyubHSrTiH4QdGt8U0DSJyjW1cglPeVQ21ksDre
         WlFV9gv8iGeKfmxlaStaYTQq+DEcN2Yneappvito=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 5717335227D5; Fri,  9 Oct 2020 09:37:46 -0700 (PDT)
Date:   Fri, 9 Oct 2020 09:37:46 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Qian Cai <cai@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201009163746.GA20981@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201009135837.GD29330@paulmck-ThinkPad-P72>
 <20201009162352.GR2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009162352.GR2611@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 06:23:52PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 09, 2020 at 06:58:37AM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 09, 2020 at 09:41:24AM -0400, Qian Cai wrote:
> > > On Fri, 2020-10-09 at 07:58 +0000, tip-bot2 for Peter Zijlstra wrote:
> > > > The following commit has been merged into the locking/core branch of tip:
> > > > 
> > > > Commit-ID:     4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Gitweb:        
> > > > https://git.kernel.org/tip/4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Author:        Peter Zijlstra <peterz@infradead.org>
> > > > AuthorDate:    Fri, 02 Oct 2020 11:04:21 +02:00
> > > > Committer:     Ingo Molnar <mingo@kernel.org>
> > > > CommitterDate: Fri, 09 Oct 2020 08:53:30 +02:00
> > > > 
> > > > lockdep: Fix lockdep recursion
> > > > 
> > > > Steve reported that lockdep_assert*irq*(), when nested inside lockdep
> > > > itself, will trigger a false-positive.
> > > > 
> > > > One example is the stack-trace code, as called from inside lockdep,
> > > > triggering tracing, which in turn calls RCU, which then uses
> > > > lockdep_assert_irqs_disabled().
> > > > 
> > > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-cpu
> > > > variables")
> > > > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > > 
> > > Reverting this linux-next commit fixed booting RCU-list warnings everywhere.
> > 
> > Is it possible that the RCU-list warnings were being wrongly suppressed
> > without a21ee6055c30?  As in are you certain that these RCU-list warnings
> > are in fact false positives?
> 
> > > [    4.002695][    T0]  init_timer_key+0x29/0x220
> > > [    4.002695][    T0]  identify_cpu+0xfcb/0x1980
> > > [    4.002695][    T0]  identify_secondary_cpu+0x1d/0x190
> > > [    4.002695][    T0]  smp_store_cpu_info+0x167/0x1f0
> > > [    4.002695][    T0]  start_secondary+0x5b/0x290
> > > [    4.002695][    T0]  secondary_startup_64_no_verify+0xb8/0xbb
> 
> 
> They're actually correct warnings, this is trying to use RCU before that
> CPU is reported to RCU.
> 
> Possibly something like the below works, but I've not tested it, nor
> have I really thought hard about it, bring up tricky and this is just
> moving code.

Looks to me like a good thing to try!  ;-)

							Thanx, Paul

> ---
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 35ad8480c464..9173d64ee69d 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1670,6 +1670,9 @@ void __init identify_boot_cpu(void)
>  void identify_secondary_cpu(struct cpuinfo_x86 *c)
>  {
>  	BUG_ON(c == &boot_cpu_data);
> +
> +	rcu_cpu_starting(smp_processor_id());
> +
>  	identify_cpu(c);
>  #ifdef CONFIG_X86_32
>  	enable_sep_cpu();
> diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
> index 6a80f36b5d59..5f436cb4f7c4 100644
> --- a/arch/x86/kernel/cpu/mtrr/mtrr.c
> +++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
> @@ -794,8 +794,6 @@ void mtrr_ap_init(void)
>  	if (!use_intel() || mtrr_aps_delayed_init)
>  		return;
>  
> -	rcu_cpu_starting(smp_processor_id());
> -
>  	/*
>  	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries
>  	 * changed, but this routine will be called in cpu boot time,
