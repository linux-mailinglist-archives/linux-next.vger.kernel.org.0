Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DEA28CBEB
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 12:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbgJMKpC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 06:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387472AbgJMKpC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 06:45:02 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE7BC0613D0;
        Tue, 13 Oct 2020 03:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gHLQIF1wPIEPcvs1yDSFLGHbHVikcssT7QT9S0QYPZ0=; b=J9TsIgknk14qtvOmh0mihWXo8U
        fNH1jLPZFLXBS+46hVfgA+oRTeOWQNkztS6FCuM/vAxeTEZf7pzxNqpwgmk2vuyWM0/ikEjKd0UMd
        1l9j49qBYknzxMElg15hmabowJi0fGHtF6ZHzDhAkt7wdlSvpkgyU9TaqdWLfbkXSsquh2ltBfiLP
        dEkJHBoTiQjD7aAl4PzzYhcQMjN0vlZT2ZRalQiBYr93r0OkU3g5ki6NTVcwqBn54rgwAd9zlleMI
        OQJAcBJOwC71dk5CShuxatVtHaqy5TPMJc2SdGFhQ2224qSUhATuC7AgcuB1zucWO5e8ODG7Ri3u7
        SjVhq9Lg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSHnZ-0006IX-8b; Tue, 13 Oct 2020 10:44:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E459304E03;
        Tue, 13 Oct 2020 12:44:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id EE4F020AEA646; Tue, 13 Oct 2020 12:44:50 +0200 (CEST)
Date:   Tue, 13 Oct 2020 12:44:50 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013103406.GY2628@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 12:34:06PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> > It is certainly an accident waiting to happen.  Would something like
> > the following make sense?
> 
> Sadly no.
> 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index bfd38f2..52a63bc 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
> >  
> >  	rnp = rdp->mynode;
> >  	mask = rdp->grpmask;
> > +	lockdep_off();
> >  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> >  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
> >  	newcpu = !(rnp->expmaskinitnext & mask);
> > @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
> >  	} else {
> >  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> >  	}
> > +	lockdep_on();
> >  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
> >  }
> 
> This will just shut it up, but will not fix the actual problem of that
> spin-lock ending up in trace_lock_acquire() which relies on RCU which
> isn't looking.
> 
> What we need here is to supress tracing not lockdep. Let me consider.

We appear to have a similar problem with rcu_report_dead(), it's
raw_spin_unlock()s can end up in trace_lock_release() while we just
killed RCU.


