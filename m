Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9974C28F795
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 19:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404931AbgJORXU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 13:23:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404921AbgJORXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 13:23:20 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BADE22210;
        Thu, 15 Oct 2020 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602782599;
        bh=k4ODjt/wmgauVv2aKNMBrX9hKge0dnalAGGU9/9ApwA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PyX5/uQkLInEUeWfvFCuetg3mdhDiWE+CBxibJM1pYL97/ddyLt+uy6pfOO/4LX6y
         /ZZPSmQN0HTPaQrhdfbPP5fwaD/0tBsXryFdplErv12TK7jnGlNE5URFKJkhfNe0Lz
         wpk/JCmCkZob7aOLRtuJf43z8K/BJzWbwZ+Gal3w=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id A10D3352078F; Thu, 15 Oct 2020 10:23:18 -0700 (PDT)
Date:   Thu, 15 Oct 2020 10:23:18 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015172318.GA3705@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
 <20201014223954.GH2594@hirez.programming.kicks-ass.net>
 <20201014235553.GU3249@paulmck-ThinkPad-P72>
 <20201015034128.GA10260@paulmck-ThinkPad-P72>
 <20201015094926.GY2611@hirez.programming.kicks-ass.net>
 <20201015161501.GV3249@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015161501.GV3249@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 09:15:01AM -0700, Paul E. McKenney wrote:
> On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 14, 2020 at 08:41:28PM -0700, Paul E. McKenney wrote:

[ . . . ]

> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -1764,8 +1764,7 @@ static bool rcu_gp_init(void)
> >  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to odd values.
> >  		firstseq = READ_ONCE(rnp->ofl_seq);
> >  		if (firstseq & 0x1)
> > -			while (firstseq == smp_load_acquire(&rnp->ofl_seq))
> > -				schedule_timeout_idle(1);  // Can't wake unless RCU is watching.
> > +			smp_cond_load_relaxed(&rnp->ofl_seq, VAL == firstseq);
> >  		smp_mb(); // Pair with barriers used when updating ->ofl_seq to even values.
> >  		raw_spin_lock(&rcu_state.ofl_lock);
> >  		raw_spin_lock_irq_rcu_node(rnp);
> 
> This would work, and would be absolutely necessary if grace periods
> took only (say) 500 nanoseconds to complete.  But given that they take
> multiple milliseconds at best, and given that this race is extremely
> unlikely, and given the heavy use of virtualization, I have to stick
> with the schedule_timeout_idle().
> 
> In fact, I have on my list to force this race to happen on the grounds
> that if it ain't tested, it don't work...

And it only too about 1000 seconds of TREE03 to make this happen, so we
should be good just relying on rcutorture.  ;-)

							Thanx, Paul
