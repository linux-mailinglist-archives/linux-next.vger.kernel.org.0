Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2A225F5BF
	for <lists+linux-next@lfdr.de>; Mon,  7 Sep 2020 10:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgIGI4C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 04:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbgIGI4A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Sep 2020 04:56:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557B9C061573
        for <linux-next@vger.kernel.org>; Mon,  7 Sep 2020 01:56:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so15197084lja.7
        for <linux-next@vger.kernel.org>; Mon, 07 Sep 2020 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7qtTkOpU/pJA1K1Rti7fapj7mfwVdYYIwMVOblHQUng=;
        b=fjk57qKMmmr4skrdLEx3AZ3gEi9aphyyGXUoJWLOUD9IRCpoD7TM50RZbqnCgGutH/
         ZwsgOiTb6Up4nX6Bt9y8uQ17zOXJyKwbQ7CIpCC/7zGW3CPQKylkbhTIGDUKa0QTFjAG
         SJdT4TufeBFhvBrezqcXek023VwQZSVH8X6JuXSHcat2jfqEw2/k2y5rvMzVE0I7pjj9
         kJ7T0U+WiebS+iXpeO+LkvdA+x/jXvIx3c5J0pD4JenxO+w+iF8i4NwUwOWB6/E070n6
         eFmIbnO82iesj6KsSQ4eMLklJxdxx0kWRn3WGSrcgtrFhl+YYlHvkDi4qIUJ6ClN3QLh
         I3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qtTkOpU/pJA1K1Rti7fapj7mfwVdYYIwMVOblHQUng=;
        b=du40G4g2W1edAvKGf7N0qNPVeg0KyjFNKU7x63haPwY/wyyNnrrRrDTeqtAdRqStMd
         BXxoG0uyolQe65qG88bQLGOTPoeU1YyOXvACh7UvQVMMR/xGlUZ5/IiOthNG26HlbcAG
         e1W/JMb2wjgHNFDnz6nMTEXTH2CSHrteDmYyn5y5iOtjBP059C2h9KMXhRmBNKlsAyvB
         1ahQ54VhZprKQTH0wqoTTub4UrRKyajOnyuUQjpIMqJg9dDVKeu0TARXtvQj2co48KE7
         c2zwULYXSjKzer1IYn3uK/0pWKsRYYOR2ktYSTIqRV9NnzipFLRp1cCOlluOVpaDKwMm
         NksA==
X-Gm-Message-State: AOAM533jhtvDyoBu/+1rQYnrsuTlt6jl59f3HeXBjBNBjM3lBZUHWQ+n
        ejGZpqtvu4OzA7eqQHjF7kkqd10/tztaYgXesxbWQA==
X-Google-Smtp-Source: ABdhPJxv6dxouCRyr/31m9WjNWty3a/jEsviJnnAY7FLV9sE/GS7YMXGrWtZ1/ZoppCQtLZrgsMmg0/yDbvrptmeFm8=
X-Received: by 2002:a2e:9ccd:: with SMTP id g13mr10059300ljj.29.1599468958630;
 Mon, 07 Sep 2020 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200826163330.16e5b0d4@canb.auug.org.au> <CADYN=9KQcdLH=BfXZ2riuH0icw7d+2HbfPxvww7fiJG2G=8ALQ@mail.gmail.com>
 <20200826193945.GT2855@paulmck-ThinkPad-P72> <CADYN=9+XRhPOkds36JdHU-h2h3va=JJj6aeDHmNUzrpCHWEJ0A@mail.gmail.com>
 <20200828132944.GN2855@paulmck-ThinkPad-P72> <CADYN=9JBB6EntswRtVuUezoOzqCai2PkFP-7FDpYmAUU1+SYJA@mail.gmail.com>
 <20200828225914.GQ2855@paulmck-ThinkPad-P72> <CADYN=9K+g430cJZ_ay4o3ivDKdpTSTSnJMDPsEq0uDTQ7LMvSA@mail.gmail.com>
 <20200903161437.GP29330@paulmck-ThinkPad-P72>
In-Reply-To: <20200903161437.GP29330@paulmck-ThinkPad-P72>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 7 Sep 2020 10:55:47 +0200
Message-ID: <CADYN=9+BkXePzNr9u_sXtPZcziufb+eYkxVxdqPVLR9czR6Otg@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 26
To:     paulmck@kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 3 Sep 2020 at 18:14, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Sep 03, 2020 at 10:39:10AM +0200, Anders Roxell wrote:
> > Hi Paul,
> >
> > On Sat, 29 Aug 2020 at 00:59, Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Fri, Aug 28, 2020 at 09:24:19PM +0200, Anders Roxell wrote:
> > > > On Fri, 28 Aug 2020 at 15:29, Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > >
> > > > > On Fri, Aug 28, 2020 at 09:37:17AM +0200, Anders Roxell wrote:
> > > > > > On Wed, 26 Aug 2020 at 21:39, Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > > > >
> > > > > > > On Wed, Aug 26, 2020 at 08:19:01PM +0200, Anders Roxell wrote:
> > > > > > > > On Wed, 26 Aug 2020 at 08:33, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > > > >
> > > > > > > [ . . . ]
> > > > > > >
> > > > > > > > I've built and run an arm64 allmodconfig kernel where I use the
> > > > > > > > defconfig as the base, I do this for testing purposes.
> > > > > > > > I can see the following call trace [1]:
> > > > > > > >
> > > > > > > > [ 2595.811453][    T1] Running tests on all trace events:
> > > > > > > > [ 2595.860933][    T1] Testing all events:
> > > > > > > > [ 4316.066072][    T8] kworker/dying (8) used greatest stack depth:
> > > > > > > > 27056 bytes left
> > > > > > > > [ 8561.924871][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for
> > > > > > > > 22s! [migration/0:14]
> > > > > > > > [ 8561.934498][    C0] Modules linked in:
> > > > > > > > [ 8561.942303][    C0] irq event stamp: 4044
> > > > > > > > [ 8561.949044][    C0] hardirqs last  enabled at (4043):
> > > > > > > > [<ffffa000126b530c>] _raw_spin_unlock_irqrestore+0xac/0x138
> > > > > > > > [ 8561.960848][    C0] hardirqs last disabled at (4044):
> > > > > > > > [<ffffa000126a89f8>] __schedule+0xf8/0x7e0
> > > > > > > > [ 8561.971418][    C0] softirqs last  enabled at (3698):
> > > > > > > > [<ffffa00010001b04>] __do_softirq+0x524/0x5f8
> > > > > > > > [ 8561.982191][    C0] softirqs last disabled at (3689):
> > > > > > > > [<ffffa000101216c8>] __irq_exit_rcu+0x128/0x1a0
> > > > > > > > [ 8561.993068][    C0] CPU: 0 PID: 14 Comm: migration/0 Tainted: G
> > > > > > > >    W         5.9.0-rc2-next-20200826-00005-g24628bb4c0bf #1
> > > > > > > > [ 8562.005684][    C0] Hardware name: linux,dummy-virt (DT)
> > > > > > > > [ 8562.013247][    C0] pstate: 80400005 (Nzcv daif +PAN -UAO BTYPE=--)
> > > > > > > > [ 8562.021657][    C0] pc : arch_local_irq_enable+0x58/0x80
> > > > > > > > [ 8562.029323][    C0] lr : _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > [ 8562.036739][    C0] sp : ffff0000698efaa0
> > > > > > > > [ 8562.042984][    C0] x29: ffff0000698efaa0 x28: ffff00006ad0f270
> > > > > > > > [ 8562.053814][    C0] x27: ffff00006ad0f248 x26: ffff0000698d4718
> > > > > > > > [ 8562.064687][    C0] x25: ffff00006ad0e798 x24: ffffa000139e3a40
> > > > > > > > [ 8562.075506][    C0] x23: 0000000000000001 x22: ffffa000154f5000
> > > > > > > > [ 8562.086425][    C0] x21: ffff00006ad0e798 x20: ffff00006ad0e780
> > > > > > > > [ 8562.097255][    C0] x19: ffffa000126a905c x18: 00000000000014c0
> > > > > > > > [ 8562.108071][    C0] x17: 0000000000001500 x16: 0000000000001440
> > > > > > > > [ 8562.118918][    C0] x15: 00000000f1f1f1f1 x14: 003d090000000000
> > > > > > > > [ 8562.129739][    C0] x13: 00003d0900000000 x12: ffff80000d31df41
> > > > > > > > [ 8562.140544][    C0] x11: 1fffe0000d31df40 x10: ffff80000d31df40
> > > > > > > > [ 8562.151366][    C0] x9 : dfffa00000000000 x8 : ffff0000698efa07
> > > > > > > > [ 8562.162247][    C0] x7 : 0000000000000001 x6 : 00007ffff2ce20c0
> > > > > > > > [ 8562.173072][    C0] x5 : ffff0000698d4040 x4 : dfffa00000000000
> > > > > > > > [ 8562.183954][    C0] x3 : ffffa0001040f904 x2 : 0000000000000007
> > > > > > > > [ 8562.194811][    C0] x1 : ffffa00014080000 x0 : 00000000000000e0
> > > > > > > > [ 8562.205858][    C0] Call trace:
> > > > > > > > [ 8562.211739][    C0]  arch_local_irq_enable+0x58/0x80
> > > > > > > > [ 8562.219076][    C0]  _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > [ 8562.226394][    C0]  __schedule+0x75c/0x7e0
> > > > > > > > [ 8562.233074][    C0]  preempt_schedule_notrace+0x64/0xc0
> > > > > > > > [ 8562.268210][    C0]  ftrace_ops_list_func+0x494/0x4e0
> > > > > > > > [ 8562.275735][    C0]  ftrace_graph_call+0x0/0x4
> > > > > > > > [ 8562.282647][    C0]  preempt_count_add+0xc/0x240
> > > > > > > > [ 8562.289686][    C0]  schedule+0xe4/0x160
> > > > > > > > [ 8562.296187][    C0]  smpboot_thread_fn+0x47c/0x540
> > > > > > > > [ 8562.303377][    C0]  kthread+0x23c/0x260
> > > > > > > > [ 8562.309906][    C0]  ret_from_fork+0x10/0x18
> > > > > > > > [ 8562.316604][    C0] Kernel panic - not syncing: softlockup: hung tasks
> > > > > > > > [ 8562.325230][    C0] CPU: 0 PID: 14 Comm: migration/0 Tainted: G
> > > > > > > >    W    L    5.9.0-rc2-next-20200826-00005-g24628bb4c0bf #1
> > > > > > > > [ 8562.337861][    C0] Hardware name: linux,dummy-virt (DT)
> > > > > > > > [ 8562.345374][    C0] Call trace:
> > > > > > > > [ 8562.351228][    C0]  dump_backtrace+0x0/0x320
> > > > > > > > [ 8562.358070][    C0]  show_stack+0x38/0x60
> > > > > > > > [ 8562.364728][    C0]  dump_stack+0x1c0/0x280
> > > > > > > > [ 8562.371447][    C0]  panic+0x32c/0x614
> > > > > > > > [ 8562.377868][    C0]  watchdog_timer_fn+0x49c/0x560
> > > > > > > > [ 8562.385076][    C0]  __run_hrtimer+0x1cc/0x360
> > > > > > > > [ 8562.392021][    C0]  __hrtimer_run_queues+0x1a0/0x220
> > > > > > > > [ 8562.399500][    C0]  hrtimer_interrupt+0x1f8/0x440
> > > > > > > > [ 8562.406807][    C0]  arch_timer_handler_virt+0x68/0xa0
> > > > > > > > [ 8562.414338][    C0]  handle_percpu_devid_irq+0x118/0x2a0
> > > > > > > > [ 8562.421992][    C0]  __handle_domain_irq+0x150/0x1c0
> > > > > > > > [ 8562.429315][    C0]  gic_handle_irq+0x98/0x120
> > > > > > > > [ 8562.436297][    C0]  el1_irq+0xd4/0x1c0
> > > > > > >
> > > > > > > We appear to have taken an interrupt here, just after releasing
> > > > > > > an irq-disabled lock and enabling interrupts.
> > > > > > >
> > > > > > > > [ 8562.442748][    C0]  arch_local_irq_enable+0x58/0x80
> > > > > > > > [ 8562.450116][    C0]  _raw_spin_unlock_irq+0x84/0xc0
> > > > > > > > [ 8562.457360][    C0]  __schedule+0x75c/0x7e0
> > > > > > > > [ 8562.464142][    C0]  preempt_schedule_notrace+0x64/0xc0
> > > > > > > > [ 8562.471745][    C0]  ftrace_ops_list_func+0x494/0x4e0
> > > > > > > > [ 8562.479195][    C0]  ftrace_graph_call+0x0/0x4
> > > > > > > > [ 8562.486159][    C0]  preempt_count_add+0xc/0x240
> > > > > > > > [ 8562.493210][    C0]  schedule+0xe4/0x160
> > > > > > >
> > > > > > > We are trying to sleep, so we took a pass through the scheduler and
> > > > > > > did some tracing.
> > > > > > >
> > > > > > > > [ 8562.499737][    C0]  smpboot_thread_fn+0x47c/0x540
> > > > > > >
> > > > > > > Here we might be bringing up a CPU?  Except that according to your
> > > > > > > dmesg, there is only one CPU.  ("RCU restricting CPUs from NR_CPUS=256
> > > > > > > to nr_cpu_ids=1").  So this seems unlikely.
> > > > > > >
> > > > > > > Huh.  The first dmesg in output-next-20200826.log is instead a
> > > > > > > DEBUG_LOCKS_WARN_ON() from lockdep.  Might this be related?  Or do you
> > > > > > > also see this warning when boot happens quickly?
> > > > > > >
> > > > > > > (I do see the soft lockup later on.)
> > > > > > >
> > > > > > > > [ 8562.506960][    C0]  kthread+0x23c/0x260
> > > > > > > > [ 8562.513496][    C0]  ret_from_fork+0x10/0x18
> > > > > > > > [ 8562.521052][    C0] Kernel Offset: disabled
> > > > > > > > [ 8562.527725][    C0] CPU features: 0x0240002,20002004
> > > > > > > > [ 8562.534950][    C0] Memory Limit: none
> > > > > > > > [ 8562.543830][    C0] ---[ end Kernel panic - not syncing:
> > > > > > > > softlockup: hung tasks ]---
> > > > > > > >
> > > > > > > > When I tested to checkout and build e6df9766894d ("Merge remote-tracking branch
> > > > > > > > 'irqchip/irq/irqchip-next' into master") that was merged into today's
> > > > > > > > tag I was able to
> > > > > > > > boot [2]. When I checked out 25e6e115dd1d ("Merge remote-tracking
> > > > > > > > branch 'rcu/rcu/next' into master") and built and tested that I was
> > > > > > > > able to boot [3] after a
> > > > > > > > looong time. To clarify, the rcu merge comes after the irqchip merge.
> > > > > > > >
> > > > > > > > I also tried to only revert the rcu tree from todays next tag like this:
> > > > > > > > "git diff e6df9766894d..25e6e115dd1d | patch -Rp1". When I built that
> > > > > > > > I was able to
> > > > > > > > boot [4] too.
> > > > > > > >
> > > > > > > > Any idea what's going on here?
> > > > > > >
> > > > > > > Could you please try bisecting the RCU commits?
> > > > > >
> > > > > > I did a bisect and found:
> > > > > > 3c8e1e3eca23 ("rcu: Always set .need_qs from __rcu_read_lock() for strict GPs")
> > > > > >
> > > > > > When I reverted that on next-20200826 and on next-20200827 the
> > > > > > allmodconfig kernel boots [1], there's other issues that I can see in
> > > > > > the log but not this one.
> > > > >
> > > > > Thank you for bisecting!
> > > > >
> > > > > I take it that you have CONFIG_RCU_STRICT_GRACE_PERIOD=y in your .config?
> > > >
> > > > Correct.
> > > >
> > > > > Ah, you do, according to this line in your dmesg:
> > > > >
> > > > >         rcu:    RCU strict (and thus non-scalable) grace periods enabled.
> > > >
> > > > Yup.
> > > >
> > > > >
> > > > > And much else besides, serious debugging enabled!  ;-)
> > > >
> > > > as you can see from the time it takes to boot it is alot =)
> > > >
> > > > >
> > > > > Does this reproduce with CONFIG_RCU_STRICT_GRACE_PERIOD=n?
> > > >
> > > > I trying that now.
> > > >
> > > > > My guess,
> > > > > given the commit that your bisection converged on, is that it will not
> > > > > reproduce in that case.
> > > >
> > > > Your guess was correct, it worked =)
> > >
> > > I cannot reproduce this.  I would suggest enabling KASAN, but you have
> > > already enabled it.  At this point, I suggest clearing up the other
> > > issues.  If this issue remains, please let me know and I will see what
> > > additional diagnostics I can provide.
> >
> > On tag next-20200902 I see this workqueue lockup [1], does that give
> > you any ideas?
> > when I disable CONFIG_RCU_STRICT_GRACE_PERIOD it works.
>
> Does exactly the same commit as you bisected to last time determine
> whether this happens or not?

Yes it's the exact same commit.

Cheers,
Anders

>
>                                                         Thanx, Paul
>
> > Cheers,
> > Anders
> > [1] http://ix.io/2w0B
> >
> > >
> > >                                                         Thanx, Paul
> > >
> > > > Cheers,
> > > > Anders
> > > >
> > > > >
> > > > >                                                         Thanx, Paul
> > > > >
> > > > > > Cheers,
> > > > > > Anders
> > > > > > [1] https://people.linaro.org/~anders.roxell/output-next-20200827-3c8e1e3eca23.log
> > > > > >
> > > > > > >  They are linear,
> > > > > > > extending from 0d23eddbe5d4 ("rcu: Remove KCSAN stubs") to 72cc80705122
> > > > > > > ("rcu: Remove unused "cpu" parameter from rcu_report_qs_rdp()".
> > > > > > >
> > > > > > > I do regularly test single-CPU premptible RCU, but not on ARM.  Nor do
> > > > > > > I normally enable quite this much debug, so I might have missed something.
> > > > > > >
> > > > > > >                                                         Thanx, Paul
> > > > > > >
> > > > > > > > Cheers,
> > > > > > > > Anders
> > > > > > > > [1] https://people.linaro.org/~anders.roxell/output-next-20200826.log
> > > > > > > > [2] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-e6df9766894d.log
> > > > > > > > [3] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-25e6e115dd1d.log
> > > > > > > > [4] https://people.linaro.org/~anders.roxell/output-next-20200826-bisect-revert-e6df9766894d-25e6e115dd1d.log
