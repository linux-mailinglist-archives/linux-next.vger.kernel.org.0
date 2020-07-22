Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8431A2292E8
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 10:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726850AbgGVIEn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 04:04:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34841 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgGVIEn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 04:04:43 -0400
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3bfB-1kwgUP37Br-010fjL; Wed, 22 Jul 2020 10:04:38 +0200
Received: by mail-qt1-f175.google.com with SMTP id k18so1178290qtm.10;
        Wed, 22 Jul 2020 01:04:38 -0700 (PDT)
X-Gm-Message-State: AOAM533HVYuYVR6JSl0Ienxr9xs77iAkp2aU46ntZfAljmmrHYZIj5xt
        ri/ZiEHdK3Im9U5+ZIGRKtkQCFDwozK5hOyW38w=
X-Google-Smtp-Source: ABdhPJx4c0Ui3LN7CfhvLV8CLGvi5V5YCH+EAY9oASjlpqJqkqP7YO8Rz8Gdk69KI0byAZrJ24VqXTr0KgbxxpwbWJY=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr33251180qtq.304.1595405077290;
 Wed, 22 Jul 2020 01:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHH7nDRYE6-tZL6+QmyX21D4OOQ4YU+v+okE6FEqqkhg@mail.gmail.com>
In-Reply-To: <CA+G9fYvHH7nDRYE6-tZL6+QmyX21D4OOQ4YU+v+okE6FEqqkhg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 22 Jul 2020 10:04:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a01smLHy0vyPX0WxDRWWPxDCbZhRCBB5qGFvMCnsghwjg@mail.gmail.com>
Message-ID: <CAK8P3a01smLHy0vyPX0WxDRWWPxDCbZhRCBB5qGFvMCnsghwjg@mail.gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at
 kernel/locking/mutex.c db410c
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Will Deacon <will@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        walter-zh.wu@mediatek.com, neeraju@codeaurora.org,
        Vinod Koul <vinod.koul@linaro.org>, saravanak@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Z8x+/urS4bpP9dmj1Co9Uz4yqUt0WB16VNNeQ0yTAXYa9CcikEF
 UkOKkZlVEu848339DGX1QiiJINalcmqXwjZcotGG/eIRjuBg9BvXsaU6qYq6QZkcN98db1D
 ku4FDluZuE38iN8vCiTmbAD5l7OcuwW2lDl1AkRDxnYe7xbCpzJR9riwJ8Tkz7Nf37u7yv2
 VyEYN9AW6o6T1cH+aznFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A2kIDYSuvxc=:eNstWQPUaoXNz3vGnVL324
 Yqzyr2ZYz2Iri+kqd6oZh9+wrtDenHOjeGNuC+nD9vgU/XcCj0F7NbVEBl4tGWUFRw9mo7D6l
 y5ikWS2JEU8PoKMP3QG64Qh2X4YVj+sD3b85hLpAA4PB0FgFSLSSq3TVrcrJaFUzVttS2MkjD
 hSTwkaP+8hQQtFTGQnb9o2RzgiYUi7DfgP3fypxWxYr+xsnbnH/ZLHo31iSHGy1qn+l1x+3jN
 PJCKanubbEDSRw09CTRryi/sqVe3d1+HHUTospjeJYy7TuhtdF+qSJHWFaL6WjuJZEMHsUm8O
 l/uMRD/X6r5VP4NzFJ328zviYOuQDHUSnYdQje4m2VtveLQ7l71IT31lCqw6kdpMn3QCPtURT
 OMNcVkE9+aWggwFyLkgAEJOcCa47/+cdhB0aYbtOminpiT3JN8mpmXeygRC9TaZ2Q7oua+S1u
 FaOoqnVI0zEvfmtewrvgwcSQ9tUH4imGG5Cx9+1Kcd03LsMu6EXPchWPf2cFDS1t28auMQd+j
 qpLOsO35qGwpqDw1w6t0frfcmW86T7tLO09NFgj2QW8wl+YQJ6ZIgDFgcsAcLeBPJJ2uKLevl
 M3C38fwdtBYHpf3cGB+Fc85kQU9zNRwZj2oRIb027LqOIG///ix4z/CxTC5A6UwOy1QngSzKI
 Vkz7ZL3mxl14kElncSnjyFivrK0yHuIrOWcki6Lzs9dafD6p/3a7tYVNwMzzQQvXL+WqBb0WO
 rZTnkSHj1SrS+2DBIFuCtc9bLsOEXUqC4Tipe/PR0ZbcYJYTcOk8oNSjXpijUPM8piSTaloG9
 wc3KEhFOcArkQCsnyNy6uL7StYoBudTRZwXrm6op9Qv/EQneOW0vYdJ+hqisrGgx3reUaGeNk
 WXyf5I3JCkoVKsdF5mFJAPCmmZSxzr0c63aIpepNybBEWggLBlIAMPgedafnj0Fzuj88lxUw/
 FBtwio2z33wALx2NMYnWpY/ndKjUjZAVkUxRnpORokLDLAYOSPipt
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 9:44 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Kernel BUG noticed on arm64 db410c device while booting linux next 20200721 tag.
> Continually popping up these BUG messages on the boot console and kernel warning
> also noticed.
>
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: de2e69cfe54a8f2ed4b75f09d3110c514f45d38e
>   git describe: next-20200721
>   kernel-config:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818/config
>   build-location:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818
>
> Crash log:
> [    0.444349] BUG: sleeping function called from invalid context at
> /usr/src/kernel/kernel/locking/mutex.c:935
> [    0.444422] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
> 30, name: kworker/0:1
> [    0.444458] 2 locks held by kworker/0:1/30:
> [    0.444489]  #0: ffff00000eb15138
> ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> [    0.444627]  #1: ffff800013713df0
> ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> process_one_work+0x208/0x768
> [    0.444761] CPU: 0 PID: 30 Comm: kworker/0:1 Not tainted
> 5.8.0-rc6-next-20200721 #1
> [    0.444787] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [    0.444817] Workqueue: rcu_gp srcu_invoke_callbacks
> [    0.444856] Call trace:
> [    0.444883]  dump_backtrace+0x0/0x1f8
> [    0.444910]  show_stack+0x2c/0x38
> [    0.444939]  dump_stack+0xf0/0x16c
> [    0.444969]  ___might_sleep+0x144/0x208
> [    0.444996]  __might_sleep+0x54/0x90
> [    0.445027]  __mutex_lock+0x64/0x970
> [    0.445055]  mutex_lock_nested+0x54/0x70
> [    0.445084]  device_del+0x44/0x3c0
> [    0.445110]  device_unregister+0x24/0x78
> [    0.445138]  __device_link_free_srcu+0x64/0x70
> [    0.445164]  srcu_invoke_callbacks+0x10c/0x1a0

The device_unregister() was added to __device_link_free_srcu() as part
of commit 287905e68dd2 ("driver core: Expose device link details in sysfs")

I'm fairly sure this is what introduced the console output, though the
code before it is already suspicious:

call_srcu(&device_links_srcu, &link->rcu_head, __device_link_free_srcu);

According to the documentation, call_srcu() must not call any sleeping
functions, which is what the 'in_atomic(): 1' above is about.

However, from what I can tell, the put_device() and pm_runtime_put()
calls in device_link_free() can also potentially sleep even if they normally
don't warn about that.

       Arnd

> [    0.445191]  process_one_work+0x2b0/0x768
> [    0.445218]  worker_thread+0x48/0x498
> [    0.445246]  kthread+0x158/0x168
> [    0.445274]  ret_from_fork+0x10/0x1c
>
> <>
>
> [   13.015528] BUG: sleeping function called from invalid context at
> /usr/src/kernel/kernel/locking/mutex.c:935
> [   13.015588] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
> 188, name: kworker/2:4
> [   13.025268] 2 locks held by kworker/2:4/188:
> [   13.032647]  #0: ffff00000eb15138
> ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> [   13.036920]  #1: ffff80001426bdf0
> ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> process_one_work+0x208/0x768
> [   13.046032] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
>       5.8.0-rc6-next-20200721 #1
> [   13.056039] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   13.065417] Workqueue: rcu_gp srcu_invoke_callbacks
> [   13.072091] Call trace:
> [   13.076695]  dump_backtrace+0x0/0x1f8
> [   13.079124]  show_stack+0x2c/0x38
> [   13.082944]  dump_stack+0xf0/0x16c
> [   13.086243]  ___might_sleep+0x144/0x208
> [   13.089542]  __might_sleep+0x54/0x90
> [   13.093274]  __mutex_lock+0x64/0x970
> [   13.097094]  mutex_lock_nested+0x54/0x70
> [   13.100654]  device_del+0x44/0x3c0
> [   13.104556]  device_unregister+0x24/0x78
> [   13.107771]  __device_link_free_srcu+0x64/0x70
> [   13.111850]  srcu_invoke_callbacks+0x10c/0x1a0
> [   13.116103]  process_one_work+0x2b0/0x768
> [   13.120530]  worker_thread+0x48/0x498
> [   13.124610]  kthread+0x158/0x168
> [   13.128254]  ret_from_fork+0x10/0x1c
> [   13.131818] BUG: scheduling while atomic: kworker/2:4/188/0x00000201
> [   13.135243] 3 locks held by kworker/2:4/188:
> [   13.141558]  #0: ffff00000eb15138
> ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> [   13.145834]  #1: ffff80001426bdf0
> ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> process_one_work+0x208/0x768
> [   13.154924]  #2: ffff8000127f2fd0 (kernfs_mutex){+.+.}-{3:3}, at:
> __kernfs_remove+0x304/0x378
> [   13.164952] Modules linked in: mdt_loader videobuf2_common
> drm_kms_helper qcom_rng i2c_qcom_cci display_connector drm socinfo
> rmtfs_mem rfkill qrtr ns fuse
> [   13.173653] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
>       5.8.0-rc6-next-20200721 #1
> [   13.187296] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   13.196666] Workqueue: rcu_gp srcu_invoke_callbacks
> [   13.203340] Call trace:
> [[0;32m  OK  [0m] Started Network Manager Script Dispatcher Servic[
> 13.207942]  dump_backtrace+0x0/0x1f8
> e.[   13.221350]  __schedule_bug+0x74/0xa0
> [   13.221386]  __schedule+0x890/0x938
> [   13.224160]  schedule+0x48/0x110
> [   13.227462]  schedule_preempt_disabled+0x1c/0x30
> [   13.230933]  __mutex_lock+0x814/0x970
> [   13.235533]  mutex_lock_nested+0x54/0x70
> [   13.239091]  __kernfs_remove+0x304/0x378
> [   13.243085]  kernfs_remove_by_name_ns+0x5c/0xc0
> [   13.246991]  sysfs_remove_link+0x30/0x60
> [   13.251246]  device_remove_class_symlinks+0x78/0xa8
> [   13.255411]  device_del+0xb8/0x3c0
>
> [   13.260011]  device_unregister+0x24/0x78
> [   13.263744]  __device_link_free_srcu+0x64/0x70
> [   13.267746]  srcu_invoke_callbacks+0x10c/0x1a0
> [   13.271992]  process_one_work+0x2b0/0x768
> [   13.276417]  worker_thread+0x48/0x498
> [   13.280499]  kthread+0x158/0x168
> [   13.284144]  ret_from_fork+0x10/0x1c
> [   13.289062] BUG: workqueue leaked lock or atomic: kworker/2:4/0xfffffe00/188
> [   13.289062]      last function: srcu_invoke_callbacks
> [   13.291056] no locks held by kworker/2:4/188.
> [   13.302935] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
>       5.8.0-rc6-next-20200721 #1
> [   13.305703] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: registered as rtc0
> [   13.307317] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   13.307333] Workqueue: rcu_gp srcu_invoke_callbacks
> [   13.307349] Call trace:
> [   13.307360]  dump_backtrace+0x0/0x1f8
> [   13.307369]  show_stack+0x2c/0x38
> [   13.307381]  dump_stack+0xf0/0x16c
> [   13.307392]  process_one_work+0x624/0x768
> [   13.347424]  worker_thread+0x48/0x498
> [   13.351501]  kthread+0x158/0x168
> [   13.355146]  ret_from_fork+0x10/0x1c
> [   13.358487] BUG: scheduling while atomic: kworker/2:4/188/0xfffffe01
> [   13.362056] no locks held by kworker/2:4/188.
> [   13.363536] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: setting
> system clock to 1970-01-01T00:00:19 UTC (19)
> [   13.368361] Modules linked in: rtc_pm8xxx(+) videobuf2_memops
> videobuf2_v4l2 mdt_loader videobuf2_common drm_kms_helper qcom_rng
> i2c_qcom_cci display_connector drm socinfo rmtfs_mem rfkill qrtr ns
> fuse
> [   13.382197] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
>       5.8.0-rc6-next-20200721 #1
> [   13.400208] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   13.409418] Workqueue:  0x0 (rcu_gp)
> [   13.416084] Call trace:
> [   13.419646]  dump_backtrace+0x0/0x1f8
> [   13.421815]  show_stack+0x2c/0x38
> [   13.425635]  dump_stack+0xf0/0x16c
> [   13.428933]  __schedule_bug+0x74/0xa0
> [   13.432234]  __schedule+0x890/0x938
> [   13.435967]  schedule+0x48/0x110
> [   13.439262]  worker_thread+0xc0/0x498
> [   13.442735]  kthread+0x158/0x168
> [   13.446294]  ret_from_fork+0x10/0x1c
>
> Full test log,
> https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200721/testrun/2972385/suite/linux-log-parser/test/check-kernel-warning-1595062/log
>
> --
> Linaro LKFT
> https://lkft.linaro.org
