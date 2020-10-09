Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12CD289013
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 19:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgJIRhK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 13:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60330 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387762AbgJIRgz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Oct 2020 13:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602265013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mAufnXyoa/c5jIN+4JvsIuQFjRg73UQBjop1E1tv+Y4=;
        b=dU49Aux6uj5oEBApN7eSVHyTO7tmFKI9JRJaUDCDcpQlJLQlGYEgaJasfnGgQ62fMvuu2o
        E21gLhfDdmKk6cXmY9XbxpLXLdZNQv6/FzTLfpLCypRpR11sQ6iyQe2fhknAw2EiqkPBeM
        XDxo7rpTFohbg8clmEl7U4UbRiyQNzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-Kur9eZyEMBu-XdydSRSUOg-1; Fri, 09 Oct 2020 13:36:51 -0400
X-MC-Unique: Kur9eZyEMBu-XdydSRSUOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7296D427C9;
        Fri,  9 Oct 2020 17:36:49 +0000 (UTC)
Received: from ovpn-66-175.rdu2.redhat.com (unknown [10.10.67.175])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0BCAF60BE2;
        Fri,  9 Oct 2020 17:36:47 +0000 (UTC)
Message-ID: <e8fce9c0db7985e132262fd508a519ade656bdd8.camel@redhat.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
From:   Qian Cai <cai@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Boqun Feng <boqun.feng@gmail.com>
Date:   Fri, 09 Oct 2020 13:36:47 -0400
In-Reply-To: <20201009162352.GR2611@hirez.programming.kicks-ass.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
         <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
         <20201009135837.GD29330@paulmck-ThinkPad-P72>
         <20201009162352.GR2611@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2020-10-09 at 18:23 +0200, Peter Zijlstra wrote:
> On Fri, Oct 09, 2020 at 06:58:37AM -0700, Paul E. McKenney wrote:
> > On Fri, Oct 09, 2020 at 09:41:24AM -0400, Qian Cai wrote:
> > > On Fri, 2020-10-09 at 07:58 +0000, tip-bot2 for Peter Zijlstra wrote:
> > > > The following commit has been merged into the locking/core branch of
> > > > tip:
> > > > 
> > > > Commit-ID:     4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Gitweb:        
> > > > https://git.kernel.org/tip/4d004099a668c41522242aa146a38cc4eb59cb1e
> > > > Author:        Peter Zijlstra <peterz@infradead.org>
> > > > AuthorDate:    Fri, 02 Oct 2020 11:04:21 +02:00
> > > > Committer:     Ingo Molnar <mingo@kernel.org>
> > > > CommitterDate: Fri, 09 Oct 2020 08:53:30 +02:00
> > > > 
> > > > lockdep: Fix lockdep recursion
> > > > 
> > > > Steve reported that lockdep_assert*irq*(), when nested inside lockdep
> > > > itself, will trigger a false-positive.
> > > > 
> > > > One example is the stack-trace code, as called from inside lockdep,
> > > > triggering tracing, which in turn calls RCU, which then uses
> > > > lockdep_assert_irqs_disabled().
> > > > 
> > > > Fixes: a21ee6055c30 ("lockdep: Change hardirq{s_enabled,_context} to
> > > > per-cpu
> > > > variables")
> > > > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > > 
> > > Reverting this linux-next commit fixed booting RCU-list warnings
> > > everywhere.
> > 
> > Is it possible that the RCU-list warnings were being wrongly suppressed
> > without a21ee6055c30?  As in are you certain that these RCU-list warnings
> > are in fact false positives?
> > > [    4.002695][    T0]  init_timer_key+0x29/0x220
> > > [    4.002695][    T0]  identify_cpu+0xfcb/0x1980
> > > [    4.002695][    T0]  identify_secondary_cpu+0x1d/0x190
> > > [    4.002695][    T0]  smp_store_cpu_info+0x167/0x1f0
> > > [    4.002695][    T0]  start_secondary+0x5b/0x290
> > > [    4.002695][    T0]  secondary_startup_64_no_verify+0xb8/0xbb
> 
> They're actually correct warnings, this is trying to use RCU before that
> CPU is reported to RCU.
> 
> Possibly something like the below works, but I've not tested it, nor
> have I really thought hard about it, bring up tricky and this is just
> moving code.

I don't think this will always work. Basically, anything like printk() would
trigger the warning because it tries to acquire a lock. For example, on arm64:

[    0.418627]  lockdep_rcu_suspicious+0x134/0x14c
[    0.418629]  __lock_acquire+0x1c30/0x2600
[    0.418631]  lock_acquire+0x274/0xc48
[    0.418632]  _raw_spin_lock+0xc8/0x140
[    0.418634]  vprintk_emit+0x90/0x3d0
[    0.418636]  vprintk_default+0x34/0x40
[    0.418638]  vprintk_func+0x378/0x590
[    0.418640]  printk+0xa8/0xd4
[    0.418642]  __cpuinfo_store_cpu+0x71c/0x868
[    0.418644]  cpuinfo_store_cpu+0x2c/0xc8
[    0.418645]  secondary_start_kernel+0x244/0x318

Back to x86, we have:

start_secondary()
  smp_callin()
    apic_ap_setup()
      setup_local_APIC()
        printk() in certain conditions.

which is before smp_store_cpu_info().

Can't we add a rcu_cpu_starting() at the very top for each start_secondary(),
secondary_start_kernel(), smp_start_secondary() etc, so we don't worry about any
printk() later?

> 
> ---
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 35ad8480c464..9173d64ee69d 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -1670,6 +1670,9 @@ void __init identify_boot_cpu(void)
>  void identify_secondary_cpu(struct cpuinfo_x86 *c)
>  {
>  	BUG_ON(c == &boot_cpu_data);
> +
> +	rcu_cpu_starting(smp_processor_id());
> +
>  	identify_cpu(c);
>  #ifdef CONFIG_X86_32
>  	enable_sep_cpu();
> diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
> index 6a80f36b5d59..5f436cb4f7c4 100644
> --- a/arch/x86/kernel/cpu/mtrr/mtrr.c
> +++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
> @@ -794,8 +794,6 @@ void mtrr_ap_init(void)
>  	if (!use_intel() || mtrr_aps_delayed_init)
>  		return;
>  
> -	rcu_cpu_starting(smp_processor_id());
> -
>  	/*
>  	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries
>  	 * changed, but this routine will be called in cpu boot time,
> 

