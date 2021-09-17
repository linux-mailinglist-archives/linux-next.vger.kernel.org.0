Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7B740F40B
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 10:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235398AbhIQI0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Sep 2021 04:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbhIQI0n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Sep 2021 04:26:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C90C061574;
        Fri, 17 Sep 2021 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=EK55G5zJjIrrmd/9UbQ9IIydQrIvFnzZ4uhJ7zl0uh0=; b=FVxHYjyHFlaZsdlKLfNabS7+cb
        v89fw9y4PxUQhLcdeDLfrSgbOmUR1RyGsdELa8TSnDj2RFvg1reFe6UWSX3yhncfEhMHE6L5mnPfS
        l5mVq5plPAGHam6Gizz/Ljs2nfJFYk3cNaIGEATdhbP0oHwgIRHchbJ6SFu3UTOgmRfSebtI3oMzi
        0IRs1D6uMJ0XM7w5HWxiwqmxMcxfaP883b0GLkL+VLA7F2AMeul4IVfPh9pgBEb7C2kKS4GZLb6nt
        f+4PvOT33bQT1z5moyeY6eFZnGwV8Ts6gTBrUTyw4lH/K6Xg4EawPVSGzmjru7XaNxbKlDL/oXRgS
        HWstfPdg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mR99y-0003lS-72; Fri, 17 Sep 2021 08:24:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4AD5B30031A;
        Fri, 17 Sep 2021 10:23:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 063AA2027B002; Fri, 17 Sep 2021 10:23:48 +0200 (CEST)
Date:   Fri, 17 Sep 2021 10:23:48 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Paul McKenney <paulmck@kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YURQlNtL00f1HWVe@hirez.programming.kicks-ass.net>
References: <20210917115859.6cfc64a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210917115859.6cfc64a5@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 17, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> vmlinux.o: warning: objtool: mce_setup()+0x22: call to memset() leaves .n=
oinstr.text section
> vmlinux.o: warning: objtool: do_machine_check()+0x51: call to mce_gather_=
info() leaves .noinstr.text section

Those are pre-existing and Boris is lokoing into them, these however,
are new:

> vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x0: call to rcu_dy=
nticks_task_trace_enter() leaves .noinstr.text section
> vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0xe: call to rcu_dyn=
ticks_task_trace_exit() leaves .noinstr.text section

These are from 7d0c9c50c5a1 ("rcu-tasks: Avoid IPIing userspace/idle
tasks if kernel is so built").

The below seems to help.

> vmlinux.o: warning: objtool: rcu_nmi_enter()+0x36: call to __kasan_check_=
read() leaves .noinstr.text section

That's 2be57f732889 ("rcu: Weaken ->dynticks accesses and updates"),
doing:

-       return !(arch_atomic_read(&this_cpu_ptr(&rcu_data)->dynticks) & 0x1=
);
+       return !(atomic_read(this_cpu_ptr(&rcu_data.dynticks)) & 0x1);

and causing instrumentation to be inserted where none is acceptable.
Flipping that back to arch_atomic_read() makes it go away as expected.



---
diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 1a6fdb03d0a5..5199559fbbf0 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -1479,7 +1479,7 @@ static void rcu_bind_gp_kthread(void)
 }
=20
 /* Record the current task on dyntick-idle entry. */
-static void noinstr rcu_dynticks_task_enter(void)
+static __always_inline void rcu_dynticks_task_enter(void)
 {
 #if defined(CONFIG_TASKS_RCU) && defined(CONFIG_NO_HZ_FULL)
 	WRITE_ONCE(current->rcu_tasks_idle_cpu, smp_processor_id());
@@ -1487,7 +1487,7 @@ static void noinstr rcu_dynticks_task_enter(void)
 }
=20
 /* Record no current task on dyntick-idle exit. */
-static void noinstr rcu_dynticks_task_exit(void)
+static __always_inline void rcu_dynticks_task_exit(void)
 {
 #if defined(CONFIG_TASKS_RCU) && defined(CONFIG_NO_HZ_FULL)
 	WRITE_ONCE(current->rcu_tasks_idle_cpu, -1);
@@ -1495,7 +1495,7 @@ static void noinstr rcu_dynticks_task_exit(void)
 }
=20
 /* Turn on heavyweight RCU tasks trace readers on idle/user entry. */
-static void rcu_dynticks_task_trace_enter(void)
+static __always_inline void rcu_dynticks_task_trace_enter(void)
 {
 #ifdef CONFIG_TASKS_TRACE_RCU
 	if (IS_ENABLED(CONFIG_TASKS_TRACE_RCU_READ_MB))
@@ -1504,7 +1504,7 @@ static void rcu_dynticks_task_trace_enter(void)
 }
=20
 /* Turn off heavyweight RCU tasks trace readers on idle/user exit. */
-static void rcu_dynticks_task_trace_exit(void)
+static __always_inline void rcu_dynticks_task_trace_exit(void)
 {
 #ifdef CONFIG_TASKS_TRACE_RCU
 	if (IS_ENABLED(CONFIG_TASKS_TRACE_RCU_READ_MB))

