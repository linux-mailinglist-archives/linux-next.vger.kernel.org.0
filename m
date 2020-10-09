Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B001288EBB
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 18:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389637AbgJIQY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 12:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389518AbgJIQY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 12:24:27 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060F1C0613D2;
        Fri,  9 Oct 2020 09:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=XxsEB4fllQQ5MpiED8S8vPGvBRUKh6YB/vMP/UJJVbs=; b=d1edYTmD1woCAQ8r1aVMQGEvZJ
        oPMk7M5gLNSiW11UlrrUzjEZpblP4VqHAW0Vw+TatoyknTsRYWgyRO1z9iFZUElBC9OQ32tFF+SLd
        i1hJ3h+YefgVZQ4El9rQWfdBKzbt2kO8Kb1MXtqvj+lxY7dc2ESYVvlwrD8zejn2MAt7c4q0UQzOp
        k92xB8jH015Qn32YzGJzMoAvMyiZSr8FwP223a3edBdePPsT4v02ZJ6rGUm8i6NEKrtuWCZJ6JBF7
        zObNoh6UqV8ebJkNn3AU4/2xd9q6EBQzSdoroXgMxkGBwvtsas1ahcCWdILO9c2DjmnKGvmFYZT27
        4KcggaoA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQvBW-00084H-UI; Fri, 09 Oct 2020 16:23:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B02B3305C22;
        Fri,  9 Oct 2020 18:23:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id EE1B52B9095A1; Fri,  9 Oct 2020 18:23:52 +0200 (CEST)
Date:   Fri, 9 Oct 2020 18:23:52 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Qian Cai <cai@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201009162352.GR2611@hirez.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201009135837.GD29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009135837.GD29330@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 06:58:37AM -0700, Paul E. McKenney wrote:
> On Fri, Oct 09, 2020 at 09:41:24AM -0400, Qian Cai wrote:
> > On Fri, 2020-10-09 at 07:58 +0000, tip-bot2 for Peter Zijlstra wrote:
> > > The following commit has been merged into the locking/core branch of tip:
> > > 
> > > Commit-ID:     4d004099a668c41522242aa146a38cc4eb59cb1e
> > > Gitweb:        
> > > https://git.kernel.org/tip/4d004099a668c41522242aa146a38cc4eb59cb1e
> > > Author:        Peter Zijlstra <peterz@infradead.org>
> > > AuthorDate:    Fri, 02 Oct 2020 11:04:21 +02:00
> > > Committer:     Ingo Molnar <mingo@kernel.org>
> > > CommitterDate: Fri, 09 Oct 2020 08:53:30 +02:00
> > > 
> > > lockdep: Fix lockdep recursion
> > > 
> > > Steve reported that lockdep_assert*irq*(), when nested inside lockdep
> > > itself, will trigger a false-positive.
> > > 
> > > One example is the stack-trace code, as called from inside lockdep,
> > > triggering tracing, which in turn calls RCU, which then uses
> > > lockdep_assert_irqs_disabled().
> > > 
> > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-cpu
> > > variables")
> > > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > 
> > Reverting this linux-next commit fixed booting RCU-list warnings everywhere.
> 
> Is it possible that the RCU-list warnings were being wrongly suppressed
> without a21ee6055c30?  As in are you certain that these RCU-list warnings
> are in fact false positives?

> > [    4.002695][    T0]  init_timer_key+0x29/0x220
> > [    4.002695][    T0]  identify_cpu+0xfcb/0x1980
> > [    4.002695][    T0]  identify_secondary_cpu+0x1d/0x190
> > [    4.002695][    T0]  smp_store_cpu_info+0x167/0x1f0
> > [    4.002695][    T0]  start_secondary+0x5b/0x290
> > [    4.002695][    T0]  secondary_startup_64_no_verify+0xb8/0xbb


They're actually correct warnings, this is trying to use RCU before that
CPU is reported to RCU.

Possibly something like the below works, but I've not tested it, nor
have I really thought hard about it, bring up tricky and this is just
moving code.

---

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 35ad8480c464..9173d64ee69d 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1670,6 +1670,9 @@ void __init identify_boot_cpu(void)
 void identify_secondary_cpu(struct cpuinfo_x86 *c)
 {
 	BUG_ON(c == &boot_cpu_data);
+
+	rcu_cpu_starting(smp_processor_id());
+
 	identify_cpu(c);
 #ifdef CONFIG_X86_32
 	enable_sep_cpu();
diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
index 6a80f36b5d59..5f436cb4f7c4 100644
--- a/arch/x86/kernel/cpu/mtrr/mtrr.c
+++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
@@ -794,8 +794,6 @@ void mtrr_ap_init(void)
 	if (!use_intel() || mtrr_aps_delayed_init)
 		return;
 
-	rcu_cpu_starting(smp_processor_id());
-
 	/*
 	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries
 	 * changed, but this routine will be called in cpu boot time,
