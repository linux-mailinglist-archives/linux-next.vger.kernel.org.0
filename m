Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E553288CA9
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 17:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbgJIPaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 11:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20434 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389295AbgJIPav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 11:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602257449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HhcoI+2TUmCVBTasDOAADDA46P10/1EEE1A+Q+QUMXg=;
        b=ccIpZJ+v87vEK+AltHe4+Rc2VSIxJ6OznRNplx2UR1QhLZvwrrGcTnZX5dgBCspiscU47u
        LIk5/jmhFssV628Jj/QL8sjpFOlj0uLyLjXWvXx/+IThbdGyrJZuRKPF64d/VCsPipp74L
        rUussT6PADHJfCxDXDQACNiBWBuHrWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-VMDdQT3wMG67TRXr_ZVgIw-1; Fri, 09 Oct 2020 11:30:47 -0400
X-MC-Unique: VMDdQT3wMG67TRXr_ZVgIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90BA83DBC5;
        Fri,  9 Oct 2020 15:30:40 +0000 (UTC)
Received: from ovpn-66-175.rdu2.redhat.com (unknown [10.10.67.175])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03BE710021AA;
        Fri,  9 Oct 2020 15:30:38 +0000 (UTC)
Message-ID: <07fffca72fdd585a96ab8c45761c1ea223dc24f2.camel@redhat.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
From:   Qian Cai <cai@redhat.com>
To:     paulmck@kernel.org
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Date:   Fri, 09 Oct 2020 11:30:38 -0400
In-Reply-To: <20201009135837.GD29330@paulmck-ThinkPad-P72>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
         <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
         <20201009135837.GD29330@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2020-10-09 at 06:58 -0700, Paul E. McKenney wrote:
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
> 
> Is it possible that the RCU-list warnings were being wrongly suppressed
> without a21ee6055c30?  As in are you certain that these RCU-list warnings
> are in fact false positives?

I guess you mean this commit a046a86082cc ("lockdep: Fix lockdep recursion")
instead of a21ee6055c30. It is unclear to me how that commit a046a86082cc would
suddenly start to generate those warnings, although I can see it starts to use
percpu variables even though the CPU is not yet set online.

DECLARE_PER_CPU(unsigned int, lockdep_recursion);

Anyway, the problem is that when we in the early boot:

start_secondary()
  smp_init_secondary()
    init_cpu_timer()
      clockevents_register_device()

We are taking a lock there but the CPU is not yet online, and the
__lock_acquire() would call things like hlist_for_each_entry_rcu() from
lookup_chain_cache() or register_lock_class(). Thus, triggering the RCU-list
from an offline CPU warnings.

I am not entirely sure how to fix those though.

