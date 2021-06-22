Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9F93AFE62
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 09:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFVHxY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 03:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVHxY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Jun 2021 03:53:24 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FD0C061574
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 00:51:08 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id he7so32979553ejc.13
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jytpRbGNprjVVWKHDUiGPvRaS0XiJNqXTNP7HufbF48=;
        b=xAd8nzADCZdhgsIPouxmypnfd4sXz9CYKCiEQADzGKZpxVoln3eQLQpW0P8gI8z2A0
         P0PB2pPAEVZtVpN7qW/GMQ7oQTgdynh+Vav6dG9p/wxOs81w1Imo/z3whRI8wrCPmU7B
         LAhrz56UJ/uXxxv3J7qgBdyh+55vK8y6NbjGyW4d4Qc6I7UAkFz4PAExxmvDRBO2O8Lp
         z/5WEebiAWGBXSyB38T5leSjeouAWMSr1yLbTsvebnZdaJ3QCO9bJZ2YcvvA5A4Y04N8
         eFp7QP84XcnaFX+2Fc/fK8Quyu0cjfkibENkRanJNe2qDBNFlBJ99L0lzjfvJtWVVvXF
         WASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jytpRbGNprjVVWKHDUiGPvRaS0XiJNqXTNP7HufbF48=;
        b=Sy8sHkPzKP5iO4fM0EuoRV0nIk63KxTkaV1hYCSRxwokGP87cDxCoXuf42szWgJmRn
         4pJYW4hU3qju3iuaQm8nKwGXduKw8DBhCR3kUUm5iK2JV9AGBE61t9GIWYfC9/2bno4D
         1BCY9WLyW/HtMy6nRoey56XFWL2rE2bXwdpgEEnTViNUv637BczI64Dnxu37l8KK7iIK
         mMgLqXwkhYJZqiHmDoCTNRfwmN7Gpz8dRtLlwX5WmR5GC5OdlYbAcLPWq+X1dOKmVZoX
         TL9v9RHPCFpj6I0Gck/2JgNu6JPulz+abkcnT2Qy39c4yPZ0q0iJV/DwS5gGTbuANpb2
         SezA==
X-Gm-Message-State: AOAM530quIgaI2mL+MBQxbzFnnG9gExgGeFYMtfQcrLg8DmLupknua30
        5guv4Yt0RiyYL9TFZ8IiNy8oBGL4Z+I/3UVIbn8v3NpF6xSgxDAU
X-Google-Smtp-Source: ABdhPJwBPtt88ilk5scUwigmdbvyQ/CI9XzvSZXUWHmrbnxgfjhoTh2EZ13xg8Z5wLINChWOg8wYsizg7nGFAbrzUsw=
X-Received: by 2002:a17:906:2b01:: with SMTP id a1mr2561261ejg.133.1624348267197;
 Tue, 22 Jun 2021 00:51:07 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 22 Jun 2021 13:20:56 +0530
Message-ID: <CA+G9fYsMXELmjGUzw4SY1bghTYz_PeR2diM6dRp2J37bBZzMSA@mail.gmail.com>
Subject: WARNING: kernel/sched/fair.c:3275 update_blocked_averages+0x628/0x660
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Odin Ugedal <odin@uged.al>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[Please ignore if it already reported]

Regression found,
The following kernel warning reported on Linux next 20210621 while booting
arm64 Juno-r2 device. And also noticed a similar crash on an x86_64 machine.

Crash log:
-----------------
[   29.244230] ------------[ cut here ]------------
[   29.248861] cfs_rq->avg.load_avg || cfs_rq->avg.util_avg ||
cfs_rq->avg.runnable_avg
[   29.248874] WARNING: CPU: 1 PID: 156 at kernel/sched/fair.c:3275
update_blocked_averages+0x628/0x660
[   29.265784] Modules linked in: fuse
[   29.269282] CPU: 1 PID: 156 Comm: kworker/u12:2 Not tainted
5.13.0-rc7-next-20210621 #1
[   29.277305] Hardware name: ARM Juno development board (r2) (DT)
[   29.283241] Workqueue:  0x0 (rpciod)
[   29.286828] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[   29.292844] pc : update_blocked_averages+0x628/0x660
[   29.297817] lr : update_blocked_averages+0x628/0x660
[   29.302788] sp : ffff8000133fbb60
[   29.306103] x29: ffff8000133fbb60 x28: ffff00097ef382c0 x27: ffff00080090ca00
[   29.313264] x26: 00000006cacd5228 x25: 0000000000000000 x24: 00000000000000c0
[   29.313277] x23: 0000000000000000 x22: ffff8000125b3378 x21: 0000000000000000
[   29.313288] x20: ffff00097ef383c0 x19: ffff00080090cb40 x18: 0000000000000010
[   29.313299] x17: 6e6e75722e677661 x16: 3e2d71725f736663 x15: 207c7c206776615f
[[0;32m  OK  [0m] Started udev [   29.341880] x14: 6c6974752e677661
x13: 6776615f656c6261 x12: 6e6e75722e677661
Coldplug all Devices.[   29.351892] x11: ffff8000126419b0 x10:
ffff800012629970 x9 : ffff800010111bec

[   29.360858] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
[   29.368171] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000027
[   29.375324] x2 : 0000000000000023 x1 : 0000000000000000 x0 : 0000000000000000
[   29.382477] Call trace:
[   29.384923]  update_blocked_averages+0x628/0x660
[   29.389548]  newidle_balance+0x208/0x478
[   29.393477]  pick_next_task_fair+0x58/0x3b8
[   29.397666]  __schedule+0x1c4/0x1250
[   29.401249]  schedule+0x4c/0x100
[   29.404481]  worker_thread+0xc0/0x428
[   29.408147]  kthread+0x140/0x158
[   29.411380]  ret_from_fork+0x10/0x18
[   29.414960] ---[ end trace 8349fb64d5c118de ]---

Full test log,
https://lkft.validation.linaro.org/scheduler/job/2935085#L1120

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20210621
  kernel-config: https://builds.tuxbuild.com/1uG71M0P29j62n5g5DXGExv8HJi/config

Steps to reproduce:
--------------------------
Boot arm64 kernel from this build on Juno-r2 and will get warning.

Image:
     https://builds.tuxbuild.com/1uG71M0P29j62n5g5DXGExv8HJi/Image.gz
vmlinux:
     https://builds.tuxbuild.com/1uG71M0P29j62n5g5DXGExv8HJi/vmlinux.xz
System.map:
     https://builds.tuxbuild.com/1uG71M0P29j62n5g5DXGExv8HJi/System.map

Few more log on x86:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210621/testrun/4955196/suite/linux-log-parser/test/check-kernel-exception-2934648/log

https://lkft.validation.linaro.org/scheduler/job/2934648#L1170

--
Linaro LKFT
https://lkft.linaro.org
