Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AE728CBCB
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 12:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388281AbgJMKeh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 06:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388136AbgJMKeg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 06:34:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972CAC0613D0;
        Tue, 13 Oct 2020 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=f6v7bo6Fu/9tm/yz2e4NZSbO5J9cvh1XjyZdnBx9s/8=; b=TC9l4f3KVyc/dPz6Wnb3hCXWQl
        T1TlVcnSiIBy0avI94VPkr3yD9hjS2stmauhed17c7FTYnlR+TjsVhH6NqT5OC/QcEXNUy7QV+r0b
        kFHnQ0Ab9TbUTOsS2bCMdupGIXIQ+UUBmZJMAKr+w2NA+VrEW2bOtXZBWXTAHgVgTe/PQVjYoLEPO
        EBxTk4+ZBw5OqXYWsZEDfz0JpfIcDa6DCILhfFlerF4Kmd58KMXZZZ2aT/gQx4a/mUk0tW0Bq6o4j
        7HH2vvnfMNmja0s11tKqTrSFacm4ToLn+YMQBeQ4LvNQLS2Zuss6//vyCmt1nVZnFPJRGBrWiSlxI
        AXoMzyDg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSHdA-0006sS-87; Tue, 13 Oct 2020 10:34:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CE9D2300DB4;
        Tue, 13 Oct 2020 12:34:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id BB6A82C1258F1; Tue, 13 Oct 2020 12:34:06 +0200 (CEST)
Date:   Tue, 13 Oct 2020 12:34:06 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Qian Cai <cai@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013103406.GY2628@hirez.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201012212812.GH3249@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012212812.GH3249@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 12, 2020 at 02:28:12PM -0700, Paul E. McKenney wrote:
> It is certainly an accident waiting to happen.  Would something like
> the following make sense?

Sadly no.

> ------------------------------------------------------------------------
> 
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index bfd38f2..52a63bc 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -4067,6 +4067,7 @@ void rcu_cpu_starting(unsigned int cpu)
>  
>  	rnp = rdp->mynode;
>  	mask = rdp->grpmask;
> +	lockdep_off();
>  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
>  	WRITE_ONCE(rnp->qsmaskinitnext, rnp->qsmaskinitnext | mask);
>  	newcpu = !(rnp->expmaskinitnext & mask);
> @@ -4086,6 +4087,7 @@ void rcu_cpu_starting(unsigned int cpu)
>  	} else {
>  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	}
> +	lockdep_on();
>  	smp_mb(); /* Ensure RCU read-side usage follows above initialization. */
>  }

This will just shut it up, but will not fix the actual problem of that
spin-lock ending up in trace_lock_acquire() which relies on RCU which
isn't looking.

What we need here is to supress tracing not lockdep. Let me consider.
