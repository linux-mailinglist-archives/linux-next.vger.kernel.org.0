Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DA428EB11
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 04:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgJOCTi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 22:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgJOCTh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 22:19:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3346C05BD1F;
        Wed, 14 Oct 2020 15:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Wpi1ELZaaFaYJLsGXjb01Rpxc7NFR8QcNczNaEl+OBw=; b=QCJSyr+nBW9tyGZHxgNMEfq6vK
        9CDTb9Q60ev+vS1XEgNUMXIeqsFAqUz+/J81ylBL3v0dlFfQ77bikk0DMeiuBE3p+kmTkx3Je72Ph
        mWwM0Zr+3thQS63WIPiCwj8r1C6Zk+EhHgMhZvIohuzMB488dgKj7t58emUizRT8efX2x7CELFrPC
        pP6MKa13D2jEiTxHiIh67/ieFrJprLORwtcpUna2lLdMY1O4SBVFzBHiFq38bsaICfM7H8zSDd2wd
        pDgduvKgbco71epQW2teHyNF37eYEqnpJcFhfit+JKzvnNGdTKkXojmLyLNty3FaDkRK0HzPgEncP
        UxNnz1Uw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSpR5-0003mj-56; Wed, 14 Oct 2020 22:39:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3AAA2304B90;
        Thu, 15 Oct 2020 00:39:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2D0FD20325ECC; Thu, 15 Oct 2020 00:39:54 +0200 (CEST)
Date:   Thu, 15 Oct 2020 00:39:54 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201014223954.GH2594@hirez.programming.kicks-ass.net>
References: <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
 <20201014215319.GF2974@worktop.programming.kicks-ass.net>
 <20201014221152.GS3249@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014221152.GS3249@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 03:11:52PM -0700, Paul E. McKenney wrote:
> On Wed, Oct 14, 2020 at 11:53:19PM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 14, 2020 at 11:34:05AM -0700, Paul E. McKenney wrote:
> > > commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
> > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > Date:   Tue Oct 13 12:39:23 2020 -0700
> > > 
> > >     rcu: Prevent lockdep-RCU splats on lock acquisition/release
> > >     
> > >     The rcu_cpu_starting() and rcu_report_dead() functions transition the
> > >     current CPU between online and offline state from an RCU perspective.
> > >     Unfortunately, this means that the rcu_cpu_starting() function's lock
> > >     acquisition and the rcu_report_dead() function's lock releases happen
> > >     while the CPU is offline from an RCU perspective, which can result in
> > >     lockdep-RCU splats about using RCU from an offline CPU.  In reality,
> > >     aside from the splats, both transitions are safe because a new grace
> > >     period cannot start until these functions release their locks.
> > 
> > But we call the trace_* crud before we acquire the lock. Are you sure
> > that's a false-positive? 
> 
> You lost me on this one.
> 
> I am assuming that you are talking about rcu_cpu_starting(), because
> that is the one where RCU is not initially watching, that is, the
> case where tracing before the lock acquisition would be a problem.
> You cannot be talking about rcu_cpu_starting() itself, because it does
> not do any tracing before acquiring the lock.  But if you are talking
> about the caller of rcu_cpu_starting(), then that caller should put the
> rcu_cpu_starting() before the tracing.  But that would be the other
> patch earlier in this thread that was proposing moving the call to
> rcu_cpu_starting() much earlier in CPU bringup.
> 
> So what am I missing here?

rcu_cpu_starting();
  raw_spin_lock_irqsave();
    local_irq_save();
    preempt_disable();
    spin_acquire()
      lock_acquire()
        trace_lock_acquire() <--- *whoopsie-doodle*
	  /* uses RCU for tracing */
    arch_spin_lock_flags() <--- the actual spinlock
