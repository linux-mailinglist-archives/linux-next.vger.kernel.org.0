Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBDE28CBA0
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 12:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731212AbgJMK1j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 06:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731170AbgJMK1i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 06:27:38 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796E0C0613D0;
        Tue, 13 Oct 2020 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=MZPyYVXUEYs3YSGCvJdse61SjO5uVTagum+obbVonkY=; b=hKIIxEAKckNUJZf25tZk7grtjR
        061k1jMcJJdzSgHhPHoqHq7KxpOpAJ9WnAcphAtE6MAk0mcHVSRmU2WfRkE2HA7DtsGZat680EGsf
        7lPabYy0sddJ+rB6EilT7IUDaZpJZYk/ByXs17UgGhNKtxJkNSCAfgaMB1nu/NKpe0HeAmvJ2USt/
        gK8jkmD4gJKJ3S7IajAK9RkoiWC9Ji2LQFdFqjBVUvcfZxrzBf/DAysDlzfic/nC+RihtR4u8VLCj
        uyTaLNxG0I9FL9VRKnGn79bbbwdjNSx14rN7pZjXuzafRXkhiIss1aqG6IikjM6StVuozZOpvV9lb
        xXCq/V5g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSHWb-0002bp-TD; Tue, 13 Oct 2020 10:27:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F323B304B90;
        Tue, 13 Oct 2020 12:27:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 867742041906B; Tue, 13 Oct 2020 12:27:15 +0200 (CEST)
Date:   Tue, 13 Oct 2020 12:27:15 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Qian Cai <cai@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013102715.GX2628@hirez.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 12, 2020 at 11:11:10AM +0800, Boqun Feng wrote:

> I think this happened because in this commit debug_lockdep_rcu_enabled()
> didn't adopt to the change that made lockdep_recursion a percpu
> variable?
> 
> Qian, mind to try the following?
> 
> Although, arguably the problem still exists, i.e. we still have an RCU
> read-side critical section inside lock_acquire(), which may be called on

There is actual RCU usage from the trace_lock_acquire().

> a yet-to-online CPU, which RCU doesn't watch. I think this used to be OK
> because we don't "free" anything from lockdep, IOW, there is no
> synchronize_rcu() or call_rcu() that _needs_ to wait for the RCU
> read-side critical sections inside lockdep. But now we lock class
> recycling, so it might be a problem.
> 
> That said, currently validate_chain() and lock class recycling are
> mutually excluded via graph_lock, so we are safe for this one ;-)

We should have a comment on that somewhere, could you write one?

> ----------->8
> diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> index 39334d2d2b37..35d9bab65b75 100644
> --- a/kernel/rcu/update.c
> +++ b/kernel/rcu/update.c
> @@ -275,8 +275,8 @@ EXPORT_SYMBOL_GPL(rcu_callback_map);
>  
>  noinstr int notrace debug_lockdep_rcu_enabled(void)
>  {
> -	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> -	       current->lockdep_recursion == 0;
> +	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE &&
> +	       __lockdep_enabled;
>  }
>  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);

Urgh, I didn't expect (and forgot to grep) lockdep_recursion users
outside of lockdep itself :/ It looks like this is indeed the only one.


