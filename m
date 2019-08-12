Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5789EE5
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 14:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfHLMyV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 08:54:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfHLMyU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 08:54:20 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E290B20679;
        Mon, 12 Aug 2019 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565614460;
        bh=nItKXCmcXxFT8ylXlYRK0+vg1b1JYXnGiCqBl82qnhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=frrXzaLXfzCWGoGSH5DfbnzU7brKOJcEcB2su/QfJyhr/0hPiXosnfRlEL7/1VNsY
         /1tmZ5WrGQ94NsQNx7n2kNFB8iQEC/m1lcp6j2eBhXfc/u/6cAyzlFRSZGsrTEFoxp
         5zFM1qqneRW4tX+bcD7LQRcDJuaessh+G/qi4lUA=
Date:   Mon, 12 Aug 2019 13:54:15 +0100
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, pauld@redhat.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <mark.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        dietmar.eggemann@arm.com
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#895
 (master - 2a3984b)
Message-ID: <20190812125414.3zeysojdycfuowyy@willie-the-truck>
References: <ClangBuiltLinux/continuous-integration+122566420+broken@travis-ci.com>
 <5d4d7164795c7_43f9afa8b58b0242711@29afa0b1-fa00-407e-a40e-a8edb471126a.mail>
 <CAKwvOd=2v0j5=-q9662xiv9ofrKfQm+04KUQAo1pEz+6MZXYMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=2v0j5=-q9662xiv9ofrKfQm+04KUQAo1pEz+6MZXYMg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Nick,

On Fri, Aug 09, 2019 at 02:21:21PM -0700, Nick Desaulniers wrote:
> Did anyone report any issue with last night's -next for arm64?
> 
> Some kind of deadlock in online_fair_sched_group.
> 
> [   15.256790] ================================
> [   15.257025] WARNING: inconsistent lock state
> [   15.257243] 5.3.0-rc3-next-20190809 #1 Not tainted
> [   15.257393] --------------------------------
> [   15.257526] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> [   15.258096] init/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
> [   15.258522] (____ptrval____) (&rq->lock){?.-.}, at:
> online_fair_sched_group+0x78/0xe4
> [   15.259170] {IN-HARDIRQ-W} state was registered at:
> [   15.259658]   lock_acquire+0x1dc/0x228
> [   15.259940]   _raw_spin_lock+0x40/0x54
> [   15.260251]   scheduler_tick+0x50/0xfc
> [   15.260491]   update_process_times+0x80/0x98
> [   15.260677]   tick_periodic+0xd8/0xf0
> [   15.260910]   tick_handle_periodic+0x30/0x94
> [   15.261126]   arch_timer_handler_virt+0x34/0x40
> [   15.261332]   handle_percpu_devid_irq+0x1a8/0x3c4
> [   15.261495]   __handle_domain_irq+0x7c/0xbc
> [   15.261689]   gic_handle_irq+0x48/0xac
> [   15.261881]   el1_irq+0xbc/0x180

Ok, so we take rq_lock() off the back of a timer interrupt in irq context...

> [   15.267928]  dump_backtrace+0x0/0x140
> [   15.268159]  show_stack+0x14/0x1c
> [   15.268341]  dump_stack+0xa8/0x104
> [   15.268482]  mark_lock+0xda0/0xda8
> [   15.268728]  __lock_acquire+0x300/0x858
> [   15.268869]  lock_acquire+0x1dc/0x228
> [   15.269057]  _raw_spin_lock+0x40/0x54

... but also with irqs enabled when handling a syscall. Boom.

> [   15.269201]  online_fair_sched_group+0x78/0xe4
> [   15.269392]  sched_online_group+0x88/0xac
> [   15.269591]  sched_autogroup_create_attach+0xcc/0x12c
> [   15.269765]  ksys_setsid+0xe8/0xec
> [   15.269990]  __arm64_sys_setsid+0xc/0x18
> [   15.270178]  el0_svc_common+0x9c/0x15c
> [   15.270317]  el0_svc_handler+0x5c/0x64
> [   15.270493]  el0_svc+0x8/0xc
> 
> https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/223856448
> 
> Guessing related to
> commit 6b8fd01b21f5 ("sched/fair: Use rq_lock/unlock in
> online_fair_sched_group")

Agreed. I think that patch should be using rq_lock_{irqsave,irqrestore}().

Looking at the list archive, it seems that this was already spotted last
week:

  https://lkml.kernel.org/r/dfc8f652-ca98-e30a-546f-e6a2df36e33a@arm.com

Although the proposal there disables irqs unconditionally, which matches
the old behaviour (prior to 6b8fd01b21f5) but feels a bit dodgy given that
the only caller (sched_online_group()) uses the save/restore variants.

Phil -- is there a fix queued for this somewhere?

Will
