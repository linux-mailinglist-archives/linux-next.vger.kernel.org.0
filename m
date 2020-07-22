Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF93229271
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 09:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgGVHoE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 03:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgGVHoD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 03:44:03 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFFCC0619DC
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 00:44:03 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id x13so623205vsx.13
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wOEP+pwUVQsgHVXob/375FdwlURvMnczGmpY3wb5bhk=;
        b=WazGxzeNj603XO2IHVRXVhloh6g5GP+ftAlM9ZEpy30D76hLCMs5eVlPxIhsJa/pGN
         WpOiy7QWV+e4dPHDuoVF9g7aYBT49b5lIn/b5EATgbAwAnPJQVbf2IkoQ6Dc0WBdEBtI
         jubIFEyXlhR1B0UzQIcxnUsBUdpD21EysSU0y7e2YHB/8qeYfM70FZ5NW/Bjyqsgl+iA
         5cwcSGyuJ0a7EocFwLwYwW0cAapCloN9ULpgN+bak2Nq3NXjZtXCpGHaLRln+6D7WTva
         j4//wIP191BYVIM9D8i0TR0+LBXjl/kR/su22Rr4T3kRLP4fYn0EjXSwyOdUQ61qucwi
         GXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wOEP+pwUVQsgHVXob/375FdwlURvMnczGmpY3wb5bhk=;
        b=kuJfvkZhWkGmS/ivQ3XcuYf98GLboPkUHD7jsDtNuxiddMJRPW4KSFZ5YY19zOdHHn
         amoBlxBYlY+1zFx6vX6aiBqC1CbuTzFLN5b2ZSyfGTmhminpiy/5GzfVwCHLbiZJL2Kv
         quzNdwb0L+VpgxAk9bgDNX2fG86bTWu2Q6oLg/lyRwjxkpQPzsDT4Cx0Qt2RpUSGBKRD
         3G5sv06q2dBFMTeLVo0Wuum6J+EK/mB4gXVa/C2I+abd/zpdp0n4K58DK6lEiPcT3GFI
         4vlt+uEQIjvgegO/ee7dWITDPJhUbgNsBJIGmb95XTD+JWHy59EP4uOvw2wp59QI9DTV
         V9RQ==
X-Gm-Message-State: AOAM531ThONFrcsnA6Sptm5mwdlWyDE9X1mnoGENIgfVJM15etoR43Y/
        WkQPPBLGXWZtw3QcV2WxSztzG6OoSu8/OY8yk0Vckg==
X-Google-Smtp-Source: ABdhPJyt2Ci5BEPXcREIIvI00ROSNBPx5lrmJHbrpb/koSQgCVQeA4lkKjdSW+YjH4EwL1yWF/lttfN9exI3b43EiG0=
X-Received: by 2002:a67:2d0e:: with SMTP id t14mr21133095vst.22.1595403842698;
 Wed, 22 Jul 2020 00:44:02 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 22 Jul 2020 13:13:51 +0530
Message-ID: <CA+G9fYvHH7nDRYE6-tZL6+QmyX21D4OOQ4YU+v+okE6FEqqkhg@mail.gmail.com>
Subject: BUG: sleeping function called from invalid context at
 kernel/locking/mutex.c db410c
To:     open list <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Will Deacon <will@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        Joel Fernandes <joel@joelfernandes.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, walter-zh.wu@mediatek.com,
        neeraju@codeaurora.org, Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kernel BUG noticed on arm64 db410c device while booting linux next 20200721 tag.
Continually popping up these BUG messages on the boot console and kernel warning
also noticed.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: de2e69cfe54a8f2ed4b75f09d3110c514f45d38e
  git describe: next-20200721
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818

Crash log:
[    0.444349] BUG: sleeping function called from invalid context at
/usr/src/kernel/kernel/locking/mutex.c:935
[    0.444422] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
30, name: kworker/0:1
[    0.444458] 2 locks held by kworker/0:1/30:
[    0.444489]  #0: ffff00000eb15138
((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
[    0.444627]  #1: ffff800013713df0
((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
process_one_work+0x208/0x768
[    0.444761] CPU: 0 PID: 30 Comm: kworker/0:1 Not tainted
5.8.0-rc6-next-20200721 #1
[    0.444787] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    0.444817] Workqueue: rcu_gp srcu_invoke_callbacks
[    0.444856] Call trace:
[    0.444883]  dump_backtrace+0x0/0x1f8
[    0.444910]  show_stack+0x2c/0x38
[    0.444939]  dump_stack+0xf0/0x16c
[    0.444969]  ___might_sleep+0x144/0x208
[    0.444996]  __might_sleep+0x54/0x90
[    0.445027]  __mutex_lock+0x64/0x970
[    0.445055]  mutex_lock_nested+0x54/0x70
[    0.445084]  device_del+0x44/0x3c0
[    0.445110]  device_unregister+0x24/0x78
[    0.445138]  __device_link_free_srcu+0x64/0x70
[    0.445164]  srcu_invoke_callbacks+0x10c/0x1a0
[    0.445191]  process_one_work+0x2b0/0x768
[    0.445218]  worker_thread+0x48/0x498
[    0.445246]  kthread+0x158/0x168
[    0.445274]  ret_from_fork+0x10/0x1c

<>

[   13.015528] BUG: sleeping function called from invalid context at
/usr/src/kernel/kernel/locking/mutex.c:935
[   13.015588] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
188, name: kworker/2:4
[   13.025268] 2 locks held by kworker/2:4/188:
[   13.032647]  #0: ffff00000eb15138
((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
[   13.036920]  #1: ffff80001426bdf0
((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
process_one_work+0x208/0x768
[   13.046032] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
      5.8.0-rc6-next-20200721 #1
[   13.056039] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   13.065417] Workqueue: rcu_gp srcu_invoke_callbacks
[   13.072091] Call trace:
[   13.076695]  dump_backtrace+0x0/0x1f8
[   13.079124]  show_stack+0x2c/0x38
[   13.082944]  dump_stack+0xf0/0x16c
[   13.086243]  ___might_sleep+0x144/0x208
[   13.089542]  __might_sleep+0x54/0x90
[   13.093274]  __mutex_lock+0x64/0x970
[   13.097094]  mutex_lock_nested+0x54/0x70
[   13.100654]  device_del+0x44/0x3c0
[   13.104556]  device_unregister+0x24/0x78
[   13.107771]  __device_link_free_srcu+0x64/0x70
[   13.111850]  srcu_invoke_callbacks+0x10c/0x1a0
[   13.116103]  process_one_work+0x2b0/0x768
[   13.120530]  worker_thread+0x48/0x498
[   13.124610]  kthread+0x158/0x168
[   13.128254]  ret_from_fork+0x10/0x1c
[   13.131818] BUG: scheduling while atomic: kworker/2:4/188/0x00000201
[   13.135243] 3 locks held by kworker/2:4/188:
[   13.141558]  #0: ffff00000eb15138
((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
[   13.145834]  #1: ffff80001426bdf0
((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
process_one_work+0x208/0x768
[   13.154924]  #2: ffff8000127f2fd0 (kernfs_mutex){+.+.}-{3:3}, at:
__kernfs_remove+0x304/0x378
[   13.164952] Modules linked in: mdt_loader videobuf2_common
drm_kms_helper qcom_rng i2c_qcom_cci display_connector drm socinfo
rmtfs_mem rfkill qrtr ns fuse
[   13.173653] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
      5.8.0-rc6-next-20200721 #1
[   13.187296] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   13.196666] Workqueue: rcu_gp srcu_invoke_callbacks
[   13.203340] Call trace:
[[0;32m  OK  [0m] Started Network Manager Script Dispatcher Servic[
13.207942]  dump_backtrace+0x0/0x1f8
e.[   13.221350]  __schedule_bug+0x74/0xa0
[   13.221386]  __schedule+0x890/0x938
[   13.224160]  schedule+0x48/0x110
[   13.227462]  schedule_preempt_disabled+0x1c/0x30
[   13.230933]  __mutex_lock+0x814/0x970
[   13.235533]  mutex_lock_nested+0x54/0x70
[   13.239091]  __kernfs_remove+0x304/0x378
[   13.243085]  kernfs_remove_by_name_ns+0x5c/0xc0
[   13.246991]  sysfs_remove_link+0x30/0x60
[   13.251246]  device_remove_class_symlinks+0x78/0xa8
[   13.255411]  device_del+0xb8/0x3c0

[   13.260011]  device_unregister+0x24/0x78
[   13.263744]  __device_link_free_srcu+0x64/0x70
[   13.267746]  srcu_invoke_callbacks+0x10c/0x1a0
[   13.271992]  process_one_work+0x2b0/0x768
[   13.276417]  worker_thread+0x48/0x498
[   13.280499]  kthread+0x158/0x168
[   13.284144]  ret_from_fork+0x10/0x1c
[   13.289062] BUG: workqueue leaked lock or atomic: kworker/2:4/0xfffffe00/188
[   13.289062]      last function: srcu_invoke_callbacks
[   13.291056] no locks held by kworker/2:4/188.
[   13.302935] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
      5.8.0-rc6-next-20200721 #1
[   13.305703] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: registered as rtc0
[   13.307317] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   13.307333] Workqueue: rcu_gp srcu_invoke_callbacks
[   13.307349] Call trace:
[   13.307360]  dump_backtrace+0x0/0x1f8
[   13.307369]  show_stack+0x2c/0x38
[   13.307381]  dump_stack+0xf0/0x16c
[   13.307392]  process_one_work+0x624/0x768
[   13.347424]  worker_thread+0x48/0x498
[   13.351501]  kthread+0x158/0x168
[   13.355146]  ret_from_fork+0x10/0x1c
[   13.358487] BUG: scheduling while atomic: kworker/2:4/188/0xfffffe01
[   13.362056] no locks held by kworker/2:4/188.
[   13.363536] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: setting
system clock to 1970-01-01T00:00:19 UTC (19)
[   13.368361] Modules linked in: rtc_pm8xxx(+) videobuf2_memops
videobuf2_v4l2 mdt_loader videobuf2_common drm_kms_helper qcom_rng
i2c_qcom_cci display_connector drm socinfo rmtfs_mem rfkill qrtr ns
fuse
[   13.382197] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
      5.8.0-rc6-next-20200721 #1
[   13.400208] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   13.409418] Workqueue:  0x0 (rcu_gp)
[   13.416084] Call trace:
[   13.419646]  dump_backtrace+0x0/0x1f8
[   13.421815]  show_stack+0x2c/0x38
[   13.425635]  dump_stack+0xf0/0x16c
[   13.428933]  __schedule_bug+0x74/0xa0
[   13.432234]  __schedule+0x890/0x938
[   13.435967]  schedule+0x48/0x110
[   13.439262]  worker_thread+0xc0/0x498
[   13.442735]  kthread+0x158/0x168
[   13.446294]  ret_from_fork+0x10/0x1c

Full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200721/testrun/2972385/suite/linux-log-parser/test/check-kernel-warning-1595062/log

-- 
Linaro LKFT
https://lkft.linaro.org
