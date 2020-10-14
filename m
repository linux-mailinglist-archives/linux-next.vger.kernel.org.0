Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAB528EA18
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 03:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732252AbgJOB3i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 21:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732233AbgJOB3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 21:29:38 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A6BC0613B7;
        Wed, 14 Oct 2020 14:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=k5LMo/WihQfqVxsipO2PP33WiLpe0x7Mx129RI9WJZk=; b=MEBAfDuoNqohSf8ZN86sNz4MbK
        gpXKrYBYsRI5SytFins8/2EV5vHN0PKnyO/SKX5dP5UlPQJij4G1EeQEBXG15hF4KiVlOKsAD9dBP
        52k6XNGhRL0smAgHjP1nvYNb/G+RT3+pwsBzM06cDyZqTO83zmQGu4cTJtPGiVoW+3ysZ0xf4ZO2n
        YCPAFH37C/DLtjnuto79J+5qE+0mLpcsws1JMoIDCyRyIR8UzWlckQ4hzfmEm3Vpbbv0Uqn787Oa2
        HX1udI3LiKx9bxHLGgp73l+MjBsfOV73RLjasNUzjJrQ+FtuXXuCm20Qvvu63su94lf2eiIGbvIYB
        6QN5dOkA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSoi1-0001QN-22; Wed, 14 Oct 2020 21:53:21 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 9E34A980F54; Wed, 14 Oct 2020 23:53:19 +0200 (CEST)
Date:   Wed, 14 Oct 2020 23:53:19 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201014215319.GF2974@worktop.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
 <20201013103406.GY2628@hirez.programming.kicks-ass.net>
 <20201013104450.GQ2651@hirez.programming.kicks-ass.net>
 <20201013112544.GZ2628@hirez.programming.kicks-ass.net>
 <20201013162650.GN3249@paulmck-ThinkPad-P72>
 <20201013193025.GA2424@paulmck-ThinkPad-P72>
 <20201014183405.GA27666@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014183405.GA27666@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 11:34:05AM -0700, Paul E. McKenney wrote:
> commit 7deaa04b02298001426730ed0e6214ac20d1a1c1
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Oct 13 12:39:23 2020 -0700
> 
>     rcu: Prevent lockdep-RCU splats on lock acquisition/release
>     
>     The rcu_cpu_starting() and rcu_report_dead() functions transition the
>     current CPU between online and offline state from an RCU perspective.
>     Unfortunately, this means that the rcu_cpu_starting() function's lock
>     acquisition and the rcu_report_dead() function's lock releases happen
>     while the CPU is offline from an RCU perspective, which can result in
>     lockdep-RCU splats about using RCU from an offline CPU.  In reality,
>     aside from the splats, both transitions are safe because a new grace
>     period cannot start until these functions release their locks.

But we call the trace_* crud before we acquire the lock. Are you sure
that's a false-positive? 

