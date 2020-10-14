Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9827328E8AE
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 00:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgJNWLy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 18:11:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbgJNWLy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 18:11:54 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FF53221FF;
        Wed, 14 Oct 2020 22:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602713513;
        bh=KCd/b7zXWFnEvn+OpcWIQfUR0Qcchqo3tF29cvgpucw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=T3VFUa3BYH1Waat1be1aCt35tnSG8rKNNh1k0fyyw5IbRevq68+LCiJK2jzTfQUU9
         63sqCBUuJpa1fh4mIFADcF0VSOm2iWqLFEjOL/qOJiLf1z4mpNLDjTIRVO0UrK+Kzl
         Lxxtc69EwOLgqKdOh8tsheg22uZvQNDbNGCHmmQo=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id D4F1C35229EB; Wed, 14 Oct 2020 15:11:52 -0700 (PDT)
Date:   Wed, 14 Oct 2020 15:11:52 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201014221152.GS3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014215319.GF2974@worktop.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 11:53:19PM +0200, Peter Zijlstra wrote:
> On Wed, Oct 14, 2020 at 11:34:05AM -0700, Paul E. McKenney wrote:
> > commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Tue Oct 13 12:39:23 2020 -0700
> > 
> >     rcu: Prevent lockdep-RCU splats on lock acquisition/release
> >     
> >     The rcu_cpu_starting() and rcu_report_dead() functions transition the
> >     current CPU between online and offline state from an RCU perspective.
> >     Unfortunately, this means that the rcu_cpu_starting() function's lock
> >     acquisition and the rcu_report_dead() function's lock releases happen
> >     while the CPU is offline from an RCU perspective, which can result in
> >     lockdep-RCU splats about using RCU from an offline CPU.  In reality,
> >     aside from the splats, both transitions are safe because a new grace
> >     period cannot start until these functions release their locks.
> 
> But we call the trace_* crud before we acquire the lock. Are you sure
> that's a false-positive? 

You lost me on this one.

I am assuming that you are talking about rcu_cpu_starting(), because
that is the one where RCU is not initially watching, that is, the
case where tracing before the lock acquisition would be a problem.
You cannot be talking about rcu_cpu_starting() itself, because it does
not do any tracing before acquiring the lock.  But if you are talking
about the caller of rcu_cpu_starting(), then that caller should put the
rcu_cpu_starting() before the tracing.  But that would be the other
patch earlier in this thread that was proposing moving the call to
rcu_cpu_starting() much earlier in CPU bringup.

So what am I missing here?

							Thanx, Paul
