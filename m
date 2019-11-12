Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D96F96A2
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 18:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKLRIZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 12:08:25 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45472 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbfKLRIZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 12:08:25 -0500
Received: by mail-lf1-f65.google.com with SMTP id v8so13427737lfa.12
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Gr8FwL01DhwBRcjMGixTgAvo1KBl/sObitJxqgXTEEM=;
        b=hj9wz+gmOS/Co3kbz7/X2a8Qlft+Dd0J09SSyxly/s5WXX6myfLHvlHsEXCjYHj1Ih
         Wde0IC/l60RWpfNtLzwp2lYqBc75zYAh9LdXWkNBUZ0MWVrO49DNbjS8lU+oCsyQuP/g
         FVL7TMLpieGsWgX10WqHJbvXuKj9qTlFNJMxn05r0A752VPjgn9ZbKPdLn7+gtXclyC1
         ABWs0NpsAQSd+IcprOI6hpehtah+giHlMh+KbmiQOzHmz5DikbEhuSjI+mWuKfHJyqU8
         r5EfXLsVTnPrcSwlZhmdj16kxqu7z6SHslfuY16CNTVjqj/AgjmP/5mDRH5xl83sTiKu
         d8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Gr8FwL01DhwBRcjMGixTgAvo1KBl/sObitJxqgXTEEM=;
        b=FAEKiixdgBi2OE0Vf5DtNSPYK2+zQcwhHBQE9a3Zpt+2/bMEvB8pr+A1i75nu3oRbu
         G5cyhS0pgrJs2rzWeL2kVu1GHIirDnX/k2PzZm23qf4CQ7RNKWCy8P1QKdwYGjYzNCii
         7ZNWyxBK568JMJzsEYLXvTPtg1M60q3HyDjJW+J207Ei+YwdG1c+81VnXbjBve+7Rhzf
         9RNHVfxcfgwgvSGgdwsK7M1QfzuxHQsW9LVjQ5HyGQggSBhlq0IMjt5weQozeOLc0TmG
         lbceFl1s6tpn0D0BVOj6hpI9b0SrDbxYoKZpql+MQcbLgA7v+LFCgS8g5ut97wFxLcGG
         rEdg==
X-Gm-Message-State: APjAAAUDF7/H4DB5vZTmGz7tCoS+hB/6+9gLaHgZs2jYuGmZI0XDHIC/
        7J9LtJ2xQkrrFRCusLLDyterA6iFwUz/W+Oo7LcMpqFfLNo=
X-Google-Smtp-Source: APXvYqw0lrlonRafLES0J8Z4TTK5mHRno2bKIm0mwPvKcyEfpyaQF4ssIrhFlq0nW9dUW0BWZSWyYncuStfqD4A985M=
X-Received: by 2002:a19:e018:: with SMTP id x24mr19902045lfg.191.1573578501278;
 Tue, 12 Nov 2019 09:08:21 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 12 Nov 2019 22:38:10 +0530
Message-ID: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
Subject: Linux next 5.4.0-rc7-next-20191112: rcu: INFO: rcu_sched
 self-detected stall on CPU
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     acme@kernel.org, linux-perf-users@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mhiramat@kernel.org,
        Paul McKenney <paul.mckenney@us.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

INFO: rcu_sched self-detected stall on CPU detected on Linux next
5.4.0-rc7-next-20191112 running on x86_64 device and continuously
popped up kernel
OTOH, arm64 juno device boot failed without generating any kernel boot log.

Steps to reproduce:
1. boot x86_64 with Linux next 5.4.0-rc7-next-20191112
2. Run "perf test -v"

x86_64 device:
Running perf test cases
perf test -v
...
test child forked, pid 418
mmap size 528384B
[   74.040659] rcu: INFO: rcu_sched self-detected stall on CPU
[   74.046275] rcu: 0-....: (26000 ticks this GP)
idle=25a/1/0x4000000000000002 softirq=7882/7882 fqs=6495
[   74.055873] (t=26007 jiffies g=4793 q=1772)
[   74.060146] NMI backtrace for cpu 0
[   74.063631] CPU: 0 PID: 418 Comm: perf Not tainted 5.4.0-rc7-next-20191112 #1
[   74.070754] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[   74.078224] Call Trace:
[   74.080669]  <IRQ>
[   74.082682]  dump_stack+0x7a/0xa5
[   74.086000]  nmi_cpu_backtrace+0x94/0xa0
[   74.089917]  ? lapic_can_unplug_cpu+0xa0/0xa0
[   74.094270]  nmi_trigger_cpumask_backtrace+0x97/0xd0
[   74.099235]  arch_trigger_cpumask_backtrace+0x19/0x20
[   74.104288]  rcu_dump_cpu_stacks+0xaa/0xda
[   74.108385]  rcu_sched_clock_irq+0x602/0x890
[   74.112659]  ? raise_softirq+0x10e/0x150
[   74.116585]  update_process_times+0x28/0x50
[   74.120769]  tick_sched_handle+0x38/0x50
[   74.124686]  tick_sched_timer+0x3c/0x80
[   74.128517]  __hrtimer_run_queues+0x11c/0x450
[   74.132867]  ? tick_sched_do_timer+0x60/0x60
[   74.137133]  hrtimer_interrupt+0xe7/0x240
[   74.141146]  smp_apic_timer_interrupt+0x86/0x220
[   74.145763]  apic_timer_interrupt+0xf/0x20
[   74.149853]  </IRQ>
[   74.151951] RIP: 0010:irq_work_sync+0x51/0x60
[   74.156301] Code: 10 08 00 00 85 c0 75 22 80 3d 22 4d 97 01 00 75
19 48 c7 c7 08 98 ba a2 c6 05 12 4d 97 01 01 e8 75 9f eb ff 0f 0b eb
02 f3 90 <8b> 03 a8 02 75 f8 5b 5d c3 66 0f 1f 44 00 00 55 48 89 e5 41
55 41
[   74.175038] RSP: 0018:ffffab53c0807dc0 EFLAGS: 00000202 ORIG_RAX:
ffffffffffffff13
[   74.182603] RAX: 0000000000000002 RBX: ffff93651688ac00 RCX: 0000000000000001
[   74.189727] RDX: 0000000000000000 RSI: ffff93651688aa98 RDI: ffff93651688ac00
[   74.196850] RBP: ffffab53c0807dc8 R08: 0000000000000000 R09: 0000000000000000
[   74.203975] R10: ffffab53c0807df8 R11: 0000000000000000 R12: ffff93651688aa38
[   74.211100] R13: ffffab53c0807b60 R14: ffff93651d17a3e0 R15: ffff93651688aab8
[   74.218237]  _free_event+0x16/0x2f0
[   74.221732]  put_event+0x15/0x20
[   74.224958]  perf_event_release_kernel+0x1f6/0x3e0
[   74.229751]  perf_release+0x10/0x20
[   74.233242]  __fput+0xd1/0x270
[   74.236303]  ____fput+0xe/0x10
[   74.239360]  task_work_run+0x90/0xc0
[   74.242933]  exit_to_usermode_loop+0xf0/0x100
[   74.247290]  do_syscall_64+0x18d/0x1d0
[   74.251044]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   74.256096] RIP: 0033:0x7f8ad5fe1641
[   74.259673] Code: f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f
1f 84 00 00 00 00 00 66 90 8b 05 aa cd 20 00 85 c0 75 16 b8 03 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 3f c3 66 0f 1f 44 00 00 53 89 fb 48 83
ec 10
[   74.278409] RSP: 002b:00007fffb5490998 EFLAGS: 00000246 ORIG_RAX:
0000000000000003
[   74.285967] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f8ad5fe1641
[   74.293090] RDX: 0000000000000000 RSI: 0000000000041000 RDI: 000000000000000b
[   74.300215] RBP: 00007fffb54909d0 R08: 00007f8ad6fec468 R09: 00007f8ad6fec470
[   74.307337] R10: 000000000000058d R11: 0000000000000246 R12: 00000000022a8fd0
[   74.314464] R13: 0000000000000000 R14: 00000000022a7e50 R15: 0000000000000003
[   78.449712] rcu: INFO: rcu_sched detected expedited stalls on
CPUs/tasks: { 0-... } 26496 jiffies s: 217 root: 0x1/.
[   78.460269] rcu: blocking rcu_node structures:
[   78.464803] Task dump for CPU 0:
[   78.468051] perf            R  running task    14144   418    413 0x90000088
[   78.475145] Call Trace:
[   78.477611]  ? retint_kernel+0x10/0x10
[   78.481418]  ? irq_work_sync+0x51/0x60
[   78.485217]  ? _free_event+0x16/0x2f0
[   78.488892]  ? put_event+0x15/0x20
[   78.492315]  ? perf_event_release_kernel+0x1f6/0x3e0
[   78.497300]  ? perf_release+0x10/0x20
[   78.501007]  ? __fput+0xd1/0x270
[   78.504260]  ? ____fput+0xe/0x10
[   78.507543]  ? task_work_run+0x90/0xc0
[   78.511348]  ? exit_to_usermode_loop+0xf0/0x100
[   78.515922]  ? do_syscall_64+0x18d/0x1d0
[   78.519866]  ? entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   89.200374] ------------[ cut here ]------------
[   89.205050] NETDEV WATCHDOG: eth0 (igb): transmit queue 2 timed out
[   89.211363] WARNING: CPU: 1 PID: 0 at
/usr/src/kernel/net/sched/sch_generic.c:443 dev_watchdog+0x2b7/0x2f0
[   89.221013] Modules linked in: x86_pkg_temp_thermal fuse
[   89.226324] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
5.4.0-rc7-next-20191112 #1
[   89.233709] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[   89.241180] RIP: 0010:dev_watchdog+0x2b7/0x2f0
[   89.245625] Code: 08 5e e9 5c ff ff ff 4c 89 ef c6 05 d1 54 02 01
01 e8 4d 5b fa ff 89 d9 48 89 c2 4c 89 ee 48 c7 c7 f8 66 cb a2 e8 a9
a5 56 ff <0f> 0b e9 3f ff ff ff e8 cd 58 5f ff 85 c0 75 c1 48 c7 c2 70
58 b9
[   89.264369] RSP: 0018:ffffab53c003ce28 EFLAGS: 00010286
[   89.269587] RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
[   89.276710] RDX: 0000000000000001 RSI: ffff93651fa96788 RDI: ffff93651fa96788
[   89.283834] RBP: ffffab53c003ce58 R08: 0000000000000000 R09: 0000000000000000
[   89.290957] R10: 0000000000000000 R11: 0000000000000000 R12: ffff93651b3fbb00
[   89.298081] R13: ffff93651ac40000 R14: ffff93651ac404b8 R15: 0000000000000008
[   89.305205] FS:  0000000000000000(0000) GS:ffff93651fa80000(0000)
knlGS:0000000000000000
[   89.313282] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   89.319020] CR2: 00005647ea459454 CR3: 000000020a210006 CR4: 00000000003606e0
[   89.326143] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   89.333266] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   89.340403] Call Trace:
[   89.342853]  <IRQ>
[   89.344867]  ? qdisc_destroy+0x170/0x170
[   89.348792]  call_timer_fn+0x9d/0x2b0
[   89.352459]  ? qdisc_destroy+0x170/0x170
[   89.356403]  run_timer_softirq+0x482/0x550
[   89.360499]  ? __do_softirq+0x9b/0x43a
[   89.364254]  __do_softirq+0xc7/0x43a
[   89.367830]  ? hrtimer_interrupt+0x11a/0x240
[   89.372097]  irq_exit+0xb8/0xc0
[   89.375239]  smp_apic_timer_interrupt+0xa7/0x220
[   89.379851]  apic_timer_interrupt+0xf/0x20
[   89.383948]  </IRQ>
[   89.386046] RIP: 0010:cpuidle_enter_state+0xc9/0x430
[   89.391005] Code: 00 00 31 ff e8 e8 0d 6c ff 80 7d d3 00 74 12 9c
58 f6 c4 02 0f 85 37 03 00 00 31 ff e8 30 50 73 ff e8 0b ae 79 ff fb
45 85 ed <0f> 88 cd 02 00 00 49 63 cd 4c 2b 7d c8 48 8d 14 cd 00 00 00
00 48
[   89.409748] RSP: 0018:ffffab53c00a7e48 EFLAGS: 00000206 ORIG_RAX:
ffffffffffffff13
[   89.417305] RAX: ffff93651dea1780 RBX: ffff93651bcf2c00 RCX: 0000000000000000
[   89.424430] RDX: 0000000000000046 RSI: 0000000000000006 RDI: ffff93651dea1780
[   89.431562] RBP: ffffab53c00a7e88 R08: 0000000000000002 R09: 0000000000000000
[   89.438686] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffa2f09ac0
[   89.445809] R13: 0000000000000003 R14: ffffffffa2f09c28 R15: 00000014c4c17efb
[   89.452940]  ? cpuidle_enter_state+0xc5/0x430
[   89.457304]  cpuidle_enter+0x2e/0x40
[   89.460883]  call_cpuidle+0x23/0x40
[   89.464394]  do_idle+0x1f0/0x270
[   89.467625]  cpu_startup_entry+0x1d/0x20
[   89.471551]  start_secondary+0x162/0x1b0
[   89.475476]  secondary_startup_64+0xb6/0xc0
[   89.479665] irq event stamp: 3279897
[   89.483241] hardirqs last  enabled at (3279896):
[<ffffffffa156f858>] console_unlock+0x458/0x5c0
[   89.492018] hardirqs last disabled at (3279897):
[<ffffffffa1401e2b>] trace_hardirqs_off_thunk+0x1a/0x1c
[   89.501483] softirqs last  enabled at (3279872):
[<ffffffffa14fe0a1>] _local_bh_enable+0x21/0x40
[   89.510260] softirqs last disabled at (3279873):
[<ffffffffa14fec08>] irq_exit+0xb8/0xc0
[   89.518351] ---[ end trace 9005e5b88ce17ad7 ]---

full test log,
https://lkft.validation.linaro.org/scheduler/job/1006507#L1330

Best regards
Naresh Kamboju
