Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852AD3B0790
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 16:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhFVOkj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 10:40:39 -0400
Received: from foss.arm.com ([217.140.110.172]:50422 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230047AbhFVOki (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 10:40:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F30FE31B;
        Tue, 22 Jun 2021 07:38:21 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043CD3F694;
        Tue, 22 Jun 2021 07:38:19 -0700 (PDT)
Subject: Re: WARNING: kernel/sched/fair.c:3275
 update_blocked_averages+0x628/0x660
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Odin Ugedal <odin@uged.al>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>
References: <CA+G9fYsMXELmjGUzw4SY1bghTYz_PeR2diM6dRp2J37bBZzMSA@mail.gmail.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <a8100548-4aeb-b0b1-7dc5-080e9e665559@arm.com>
Date:   Tue, 22 Jun 2021 16:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYsMXELmjGUzw4SY1bghTYz_PeR2diM6dRp2J37bBZzMSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/06/2021 09:50, Naresh Kamboju wrote:
> [Please ignore if it already reported]
> 
> Regression found,
> The following kernel warning reported on Linux next 20210621 while booting
> arm64 Juno-r2 device. And also noticed a similar crash on an x86_64 machine.
> 
> Crash log:
> -----------------
> [   29.244230] ------------[ cut here ]------------
> [   29.248861] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg ||
> cfs_rq->avg.runnable_avg
> [   29.248874] WARNING: CPU: 1 PID: 156 at kernel/sched/fair.c:3275
> update_blocked_averages+0x628/0x660
> [   29.265784] Modules linked in: fuse
> [   29.269282] CPU: 1 PID: 156 Comm: kworker/u12:2 Not tainted
> 5.13.0-rc7-next-20210621 #1
> [   29.277305] Hardware name: ARM Juno development board (r2) (DT)
> [   29.283241] Workqueue:  0x0 (rpciod)
> [   29.286828] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
> [   29.292844] pc : update_blocked_averages+0x628/0x660
> [   29.297817] lr : update_blocked_averages+0x628/0x660
> [   29.302788] sp : ffff8000133fbb60
> [   29.306103] x29: ffff8000133fbb60 x28: ffff00097ef382c0 x27: ffff00080090ca00
> [   29.313264] x26: 00000006cacd5228 x25: 0000000000000000 x24: 00000000000000c0
> [   29.313277] x23: 0000000000000000 x22: ffff8000125b3378 x21: 0000000000000000
> [   29.313288] x20: ffff00097ef383c0 x19: ffff00080090cb40 x18: 0000000000000010
> [   29.313299] x17: 6e6e75722e677661 x16: 3e2d71725f736663 x15: 207c7c206776615f
> [[0;32m  OK  [0m] Started udev [   29.341880] x14: 6c6974752e677661
> x13: 6776615f656c6261 x12: 6e6e75722e677661
> Coldplug all Devices.[   29.351892] x11: ffff8000126419b0 x10:
> ffff800012629970 x9 : ffff800010111bec
> 
> [   29.360858] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
> [   29.368171] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000027
> [   29.375324] x2 : 0000000000000023 x1 : 0000000000000000 x0 : 0000000000000000
> [   29.382477] Call trace:
> [   29.384923]  update_blocked_averages+0x628/0x660
> [   29.389548]  newidle_balance+0x208/0x478
> [   29.393477]  pick_next_task_fair+0x58/0x3b8
> [   29.397666]  __schedule+0x1c4/0x1250
> [   29.401249]  schedule+0x4c/0x100
> [   29.404481]  worker_thread+0xc0/0x428
> [   29.408147]  kthread+0x140/0x158
> [   29.411380]  ret_from_fork+0x10/0x18
> [   29.414960] ---[ end trace 8349fb64d5c118de ]---

[ 1364.545625] cfs_rq->avg.load_avg
[ 1364.545641] WARNING: CPU: 5 PID: 35 at kernel/sched/fair.c:3282
update_blocked_averages+0x568/0x680
[ 1364.563465] Modules linked in:
[ 1364.569299] CPU: 5 PID: 35 Comm: migration/5 Not tainted
5.13.0-rc6-00078-g78a94255ceab-dirty #93
[ 1364.580958] Hardware name: ARM Juno development board (r0) (DT)
[ 1364.589488] Stopper: 0x0 <- 0x0
[ 1364.592638] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[ 1364.598657] pc : update_blocked_averages+0x568/0x680
[ 1364.603635] lr : update_blocked_averages+0x568/0x680
[ 1364.608611] sp : ffff80001259bbf0
[ 1364.611927] x29: ffff80001259bbf0 x28: ffff00097efb8dc0 x27:
ffff0008033ea400
[ 1364.619087] x26: 0000000000000005 x25: 0000013b4cca6cac x24:
ffff000804ba4200
[ 1364.626245] x23: 0000000000000000 x22: ffff00097efb96c0 x21:
0000000000000028
[ 1364.633403] x20: 0000000000000001 x19: ffff000804ba4340 x18:
fffffffffffe55e8
[ 1364.640561] x17: 0000000000000000 x16: 0000000000000000 x15:
0000000000000020
[ 1364.647719] x14: ffffffffffffffff x13: ffff800011f6cb68 x12:
000000000000040e
[ 1364.654877] x11: 000000000000015a x10: ffff800011fc6bd8 x9 :
fffffffffffe55e8
[ 1364.662035] x8 : ffff800011f6cb68 x7 : ffff800011fc4b68 x6 :
0000000000002070
[ 1364.669193] x5 : ffff00097efa6928 x4 : 0000000000000000 x3 :
0000000000000027
[ 1364.676350] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffff000800226740
[ 1364.683508] Call trace:
[ 1364.685954]  update_blocked_averages+0x568/0x680
[ 1364.690585]  newidle_balance+0x200/0x460
[ 1364.694515]  balance_fair+0x28/0x40
[ 1364.698009]  __schedule+0x1118/0x1354
[ 1364.701683]  schedule+0x74/0x10c
[ 1364.704918]  smpboot_thread_fn+0xa4/0x280
[ 1364.708937]  kthread+0x154/0x160
[ 1364.712173]  ret_from_fork+0x10/0x30
[ 1364.715757] ---[ end trace d2e73a5dbd77eeb8 ]---


Was able to recreate this on Arm64 Juno on tip/sched/core after
splitting the SCHED_WARN_ON() in cfs_rq_is_decayed() from ("sched/pelt:
Check that *_avg are null when *_sum are"). This one didn't happen after
boot but after running some taskgroup related workloads.

Looks like it is `load_avg` related.

We kind of expected this. ("sched/pelt: Ensure that *_sum is always
synced with *_avg") only deals with util_avg and runnable_avg.

Looks like Vincent is coming up with a for load_avg:

https://lkml.kernel.org/r/CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com
