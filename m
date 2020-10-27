Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D444D29C8FB
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 20:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1830057AbgJ0Tbv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 15:31:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59722 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1830054AbgJ0Tbt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 15:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603827108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AZnjKdTzcVoK8bjG2j3uH+P21jgYVQfiQJ8DtHSLT9A=;
        b=b29Ck0i75fyXBxcjNPDLwtTnMJ9qB+4omSuk63RcMpJpgASoJwMupNOmJPWEruJctB/yZl
        KjiEkPZSOmPEknKjpBG9bxa01nxz8S6zJidT4iMrezvLuJuivXRh2uh5uDguEhkEuhU8D1
        9hzfq+U+Ofre3vhL/3rQalxOG/XFX5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-OY7Swwh6OYSTo-lQM79TfQ-1; Tue, 27 Oct 2020 15:31:46 -0400
X-MC-Unique: OY7Swwh6OYSTo-lQM79TfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D660D803F76;
        Tue, 27 Oct 2020 19:31:43 +0000 (UTC)
Received: from ovpn-66-71.rdu2.redhat.com (ovpn-66-71.rdu2.redhat.com [10.10.66.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6868C5B4B9;
        Tue, 27 Oct 2020 19:31:42 +0000 (UTC)
Message-ID: <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
From:   Qian Cai <cai@redhat.com>
To:     Boqun Feng <boqun.feng@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue, 27 Oct 2020 15:31:41 -0400
In-Reply-To: <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
         <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
         <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-10-12 at 11:11 +0800, Boqun Feng wrote:
> Hi,
> 
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
> > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to per-
> > > cpu
> > > variables")
> > > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > 
> > Reverting this linux-next commit fixed booting RCU-list warnings everywhere.
> > 
> 
> I think this happened because in this commit debug_lockdep_rcu_enabled()
> didn't adopt to the change that made lockdep_recursion a percpu
> variable?
> 
> Qian, mind to try the following?

Boqun, Paul, may I ask what's the latest with the fixes? I must admit that I got
lost in this thread, but I remember that the patch from Boqun below at least
silence quite some of those warnings if not all. The problem is that some of
those warnings would trigger a lockdep circular locks warning due to printk()
with some locks held which in turn disabling the lockdep, makes our test runs
inefficient.

> 
> Although, arguably the problem still exists, i.e. we still have an RCU
> read-side critical section inside lock_acquire(), which may be called on
> a yet-to-online CPU, which RCU doesn't watch. I think this used to be OK
> because we don't "free" anything from lockdep, IOW, there is no
> synchronize_rcu() or call_rcu() that _needs_ to wait for the RCU
> read-side critical sections inside lockdep. But now we lock class
> recycling, so it might be a problem.
> 
> That said, currently validate_chain() and lock class recycling are
> mutually excluded via graph_lock, so we are safe for this one ;-)
> 
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


