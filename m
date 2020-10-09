Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71315288DCF
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 18:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389144AbgJIQLM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 12:11:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:54168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389451AbgJIQLM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 12:11:12 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD8CA2225D;
        Fri,  9 Oct 2020 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602259871;
        bh=PMuAxNhk0IlV+HpLBxx1Gu7eGebDilISmrDCshwbfVg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=I971vGypKo0oDlS4tk2IjPRyAVS9CFUuQrmlyNfFkYmYCD2OdK7tTEzKNzRI9DSfu
         iHSfOKjDDYav/BGqR1L+N40cYi8kic0yygcZ0S6sJdWjs+gefePDDDc2/huvtE4SFb
         dm9UXR2JQgmc5REIQmeF3LLjWmtxWa3NX0clHotc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 9123B35227D5; Fri,  9 Oct 2020 09:11:11 -0700 (PDT)
Date:   Fri, 9 Oct 2020 09:11:11 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201009161111.GH29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201009135837.GD29330@paulmck-ThinkPad-P72>
 <07fffca72fdd585a96ab8c45761c1ea223dc24f2.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07fffca72fdd585a96ab8c45761c1ea223dc24f2.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 11:30:38AM -0400, Qian Cai wrote:
> On Fri, 2020-10-09 at 06:58 -0700, Paul E. McKenney wrote:
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
> > > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-
> > > > cpu
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
> I guess you mean this commit a046a86082cc ("lockdep: Fix lockdep recursion")
> instead of a21ee6055c30. It is unclear to me how that commit a046a86082cc would
> suddenly start to generate those warnings, although I can see it starts to use
> percpu variables even though the CPU is not yet set online.
> 
> DECLARE_PER_CPU(unsigned int, lockdep_recursion);
> 
> Anyway, the problem is that when we in the early boot:
> 
> start_secondary()
>   smp_init_secondary()
>     init_cpu_timer()
>       clockevents_register_device()
> 
> We are taking a lock there but the CPU is not yet online, and the
> __lock_acquire() would call things like hlist_for_each_entry_rcu() from
> lookup_chain_cache() or register_lock_class(). Thus, triggering the RCU-list
> from an offline CPU warnings.
> 
> I am not entirely sure how to fix those though.

One approach is to move the call to rcu_cpu_starting() earlier in the
start_secondary() processing.  It is OK to invoke rcu_cpu_starting()
multiple times, so for experiemental purposes you should be able to add
a new call to it just before that lock is acquired.

							Thanx, Paul
