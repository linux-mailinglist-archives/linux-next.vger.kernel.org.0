Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B3328F683
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 18:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389477AbgJOQPU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 12:15:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389147AbgJOQPU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 12:15:20 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A687722210;
        Thu, 15 Oct 2020 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602778519;
        bh=w2Lc3Nsk0vgnR8RykF7cI6BlE8Oh0QWGGrfC+w8owIk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=j7F492h2m7HdUmWC0t2V/7YkoNLeqZLT6vGXIWSgoGmntyNMmMiY2eRt7Sc4jRN9f
         f8Gf152hh/jg25UfNXa480ywL3Vhvhgt09lDQTITvrNyOyYL5vHimTcOuc9c4vrJ2Q
         6EeWncxOMlrLFUgBxOrhwvx/maIU25tC/nxn5wLU=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 45B2E352078F; Thu, 15 Oct 2020 09:15:19 -0700 (PDT)
Date:   Thu, 15 Oct 2020 09:15:19 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201015161519.GW3249@paulmck-ThinkPad-P72>
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
 <20201015095033.GS2651@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015095033.GS2651@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 11:50:33AM +0200, Peter Zijlstra wrote:
> On Thu, Oct 15, 2020 at 11:49:26AM +0200, Peter Zijlstra wrote:
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -1143,13 +1143,15 @@ bool rcu_lockdep_current_cpu_online(void
> >  	struct rcu_data *rdp;
> >  	struct rcu_node *rnp;
> >  	bool ret = false;
> > +	unsigned long seq;
> >  
> >  	if (in_nmi() || !rcu_scheduler_fully_active)
> >  		return true;
> >  	preempt_disable_notrace();
> >  	rdp = this_cpu_ptr(&rcu_data);
> >  	rnp = rdp->mynode;
> > -	if (rdp->grpmask & rcu_rnp_online_cpus(rnp))
> > +	seq = READ_ONCE(rnp->ofl_seq) & ~0x1;
> > +	if (rdp->grpmask & rcu_rnp_online_cpus(rnp) || seq != READ_ONCE(rnp->ofl_seq))
> >  		ret = true;
> >  	preempt_enable_notrace();
> >  	return ret;
> 
> Also, here, are the two loads important? Wouldn't:
> 
> 	|| READ_ONCE(rnp->ofl_seq) & 0x1
> 
> be sufficient?

Indeed it would!  Good catch, thank you!!!

							Thanx, Paul
