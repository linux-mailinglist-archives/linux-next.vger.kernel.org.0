Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E07888489
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 23:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfHIVVe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 17:21:34 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:42690 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfHIVVe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Aug 2019 17:21:34 -0400
Received: by mail-pf1-f170.google.com with SMTP id q10so46665047pff.9
        for <linux-next@vger.kernel.org>; Fri, 09 Aug 2019 14:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kldKeb8kARboS/NIYVE9yvFOhNZdEhTtxG/Vo2Vmbl8=;
        b=g9oyDjYvsMhBIyZNkKmSJp4gQHDDhQkUEKM0LUlWQU6hE45Vr+P3bgE0/1Tk9KOk4J
         9oiBKGvsba9GddMf6YyRZZlx8XuI7WlZn1Z/2Xye1FO1aL162Cw+oCCatnujgHxKQFpW
         TpV/G2InRmaV64g+OOO7gqq/cByGlw2sMTleki6FR2qO4ZKxhG1eQonyii222wEhev6R
         MA1JEuo5A/R2pLJBEvd6CRGLO9xtqlOawvHWFRgjQiqetqiPq3bQWohN8GEm54Qh4hMR
         /VpKJaetP/73N7igFKOGDUQM7ZrY0o0K3wUCmvn9mKcV4c0yQ6diFbOShZ/afDgLH4QC
         Cjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kldKeb8kARboS/NIYVE9yvFOhNZdEhTtxG/Vo2Vmbl8=;
        b=qNVW2pGmS9ZBi+wnVty/Fghfm0FOktUoMWzc+bNqnOBmG/V2lUjLU74ECYbsh3XVze
         gzdzL3dCPv77177wvMvVcfYC9OQG/KaPW19+XdTycQGEQaiUWR1AZeEJqEQxdp+CgCN7
         ZSzMIDzNtTADC8LTBt2r+AaNjqqzyig1afL5F8DCrlPiZnlW8FiWe8QdfWLl4ucF40H7
         lY0tujOnEn881ZvvbxWt83sWh7QZHREHT3CWAkcsoX09OGZ2D+s+1vBUwW5mp9HpHbGz
         Bwjt//iY3m/Y7/owItc62dSov3F5Tk+qiCR9feWHqriGbNU2PhkbdEHPe6am9C0lxLKq
         bOTg==
X-Gm-Message-State: APjAAAVd1XpYUs7ctgSlw9x9kHmndXXhnztvtQiPCbE8VkJAzxAX4cif
        aGKeYz8nbSIIroAUWg1wBlABeSUzW42M33vjDhoTGDft0ea5UQ==
X-Google-Smtp-Source: APXvYqysh83VEw86KqGY7z5DCl8WYiAJEAtBjn0lJ46du2dPLIq28noHmq3z6EFQxY9EuTUqip1O7jlbmb6kIP+k//c=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr6379374pff.165.1565385692192;
 Fri, 09 Aug 2019 14:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <ClangBuiltLinux/continuous-integration+122566420+broken@travis-ci.com>
 <5d4d7164795c7_43f9afa8b58b0242711@29afa0b1-fa00-407e-a40e-a8edb471126a.mail>
In-Reply-To: <5d4d7164795c7_43f9afa8b58b0242711@29afa0b1-fa00-407e-a40e-a8edb471126a.mail>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Aug 2019 14:21:21 -0700
Message-ID: <CAKwvOd=2v0j5=-q9662xiv9ofrKfQm+04KUQAo1pEz+6MZXYMg@mail.gmail.com>
Subject: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#895
 (master - 2a3984b)
To:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, pauld@redhat.com
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <mark.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Did anyone report any issue with last night's -next for arm64?

Some kind of deadlock in online_fair_sched_group.

[   15.256790] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   15.257025] WARNING: inconsistent lock state
[   15.257243] 5.3.0-rc3-next-20190809 #1 Not tainted
[   15.257393] --------------------------------
[   15.257526] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[   15.258096] init/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
[   15.258522] (____ptrval____) (&rq->lock){?.-.}, at:
online_fair_sched_group+0x78/0xe4
[   15.259170] {IN-HARDIRQ-W} state was registered at:
[   15.259658]   lock_acquire+0x1dc/0x228
[   15.259940]   _raw_spin_lock+0x40/0x54
[   15.260251]   scheduler_tick+0x50/0xfc
[   15.260491]   update_process_times+0x80/0x98
[   15.260677]   tick_periodic+0xd8/0xf0
[   15.260910]   tick_handle_periodic+0x30/0x94
[   15.261126]   arch_timer_handler_virt+0x34/0x40
[   15.261332]   handle_percpu_devid_irq+0x1a8/0x3c4
[   15.261495]   __handle_domain_irq+0x7c/0xbc
[   15.261689]   gic_handle_irq+0x48/0xac
[   15.261881]   el1_irq+0xbc/0x180
[   15.262024]   _raw_spin_unlock_irqrestore+0x4c/0x80
[   15.262263]   tty_register_ldisc+0x58/0x6c
[   15.262430]   n_tty_init+0x18/0x20
[   15.262615]   console_init+0x20/0x3e4
[   15.262820]   start_kernel+0x248/0x3c4
[   15.263079] irq event stamp: 220201
[   15.263362] hardirqs last  enabled at (220201):
[<ffff000010e1f334>] _raw_spin_unlock_irqrestore+0x48/0x80
[   15.263731] hardirqs last disabled at (220200):
[<ffff000010e1f190>] _raw_spin_lock_irqsave+0x30/0x7c
[   15.264046] softirqs last  enabled at (220196):
[<ffff0000100f84c0>] irq_exit+0x114/0x134
[   15.264419] softirqs last disabled at (220185):
[<ffff0000100f84c0>] irq_exit+0x114/0x134
[   15.264751]
[   15.264751] other info that might help us debug this:
[   15.265044]  Possible unsafe locking scenario:
[   15.265044]
[   15.265256]        CPU0
[   15.265458]        ----
[   15.265615]   lock(&rq->lock);
[   15.265898]   <Interrupt>
[   15.266087]     lock(&rq->lock);
[   15.266353]
[   15.266353]  *** DEADLOCK ***
[   15.266353]
[   15.266574] no locks held by init/1.
[   15.266784]
[   15.266784] stack backtrace:
[   15.267120] CPU: 0 PID: 1 Comm: init Not tainted 5.3.0-rc3-next-20190809=
 #1
[   15.267341] Hardware name: linux,dummy-virt (DT)
[   15.267756] Call trace:
[   15.267928]  dump_backtrace+0x0/0x140
[   15.268159]  show_stack+0x14/0x1c
[   15.268341]  dump_stack+0xa8/0x104
[   15.268482]  mark_lock+0xda0/0xda8
[   15.268728]  __lock_acquire+0x300/0x858
[   15.268869]  lock_acquire+0x1dc/0x228
[   15.269057]  _raw_spin_lock+0x40/0x54
[   15.269201]  online_fair_sched_group+0x78/0xe4
[   15.269392]  sched_online_group+0x88/0xac
[   15.269591]  sched_autogroup_create_attach+0xcc/0x12c
[   15.269765]  ksys_setsid+0xe8/0xec
[   15.269990]  __arm64_sys_setsid+0xc/0x18
[   15.270178]  el0_svc_common+0x9c/0x15c
[   15.270317]  el0_svc_handler+0x5c/0x64
[   15.270493]  el0_svc+0x8/0xc

https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/223856448

Guessing related to
commit 6b8fd01b21f5 ("sched/fair: Use rq_lock/unlock in
online_fair_sched_group")

---------- Forwarded message ---------
From: Travis CI <builds@travis-ci.com>
Date: Fri, Aug 9, 2019 at 6:13 AM
Subject: [CRON] Broken: ClangBuiltLinux/continuous-integration#895
(master - 2a3984b)
To: <ndesaulniers@google.com>, <natechancellor@gmail.com>


ClangBuiltLinux / continuous-integration

master

Build #895 was broken
3 hrs, 29 mins, and 39 secs
Nathan Chancellor
2a3984b CHANGESET =E2=86=92

Merge pull request #196 from nathanchance/ppc64

PPC64 big endian
--=20
Thanks,
~Nick Desaulniers
