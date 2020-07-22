Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32B42298DF
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 15:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732357AbgGVNBL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 09:01:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:50180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgGVNBK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Jul 2020 09:01:10 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-111-31.bvtn.or.frontiernet.net [50.39.111.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DF1720771;
        Wed, 22 Jul 2020 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595422869;
        bh=re2SLMvaPX33VyGgSQ8AOGuG0q3Enka/EZTlLd3Zh8Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rWoEHvufV+awCSjF877unkE43g2tM+oXSeytgYmR+D1BKxsZ16DlQWDj4b2OLT10/
         2MR5jwtW1tlEiVlqXyB0K513GPqtHM0U+7nbRLvqtnlWg8Hfyt0jrW/ha51Gv2TEQ0
         T2oWk0Lcdu2yl2sBCbeKuGeXb8g3LnA1MmcF56Wk=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 57ED13522753; Wed, 22 Jul 2020 06:01:09 -0700 (PDT)
Date:   Wed, 22 Jul 2020 06:01:09 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        walter-zh.wu@mediatek.com, neeraju@codeaurora.org,
        Vinod Koul <vinod.koul@linaro.org>, saravanak@google.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: BUG: sleeping function called from invalid context at
 kernel/locking/mutex.c db410c
Message-ID: <20200722130109.GO9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYvHH7nDRYE6-tZL6+QmyX21D4OOQ4YU+v+okE6FEqqkhg@mail.gmail.com>
 <CAK8P3a01smLHy0vyPX0WxDRWWPxDCbZhRCBB5qGFvMCnsghwjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a01smLHy0vyPX0WxDRWWPxDCbZhRCBB5qGFvMCnsghwjg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 10:04:21AM +0200, Arnd Bergmann wrote:
> On Wed, Jul 22, 2020 at 9:44 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Kernel BUG noticed on arm64 db410c device while booting linux next 20200721 tag.
> > Continually popping up these BUG messages on the boot console and kernel warning
> > also noticed.
> >
> > metadata:
> >   git branch: master
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   git commit: de2e69cfe54a8f2ed4b75f09d3110c514f45d38e
> >   git describe: next-20200721
> >   kernel-config:
> > http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818/config
> >   build-location:
> > http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/818
> >
> > Crash log:
> > [    0.444349] BUG: sleeping function called from invalid context at
> > /usr/src/kernel/kernel/locking/mutex.c:935
> > [    0.444422] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
> > 30, name: kworker/0:1
> > [    0.444458] 2 locks held by kworker/0:1/30:
> > [    0.444489]  #0: ffff00000eb15138
> > ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> > [    0.444627]  #1: ffff800013713df0
> > ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> > process_one_work+0x208/0x768
> > [    0.444761] CPU: 0 PID: 30 Comm: kworker/0:1 Not tainted
> > 5.8.0-rc6-next-20200721 #1
> > [    0.444787] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [    0.444817] Workqueue: rcu_gp srcu_invoke_callbacks
> > [    0.444856] Call trace:
> > [    0.444883]  dump_backtrace+0x0/0x1f8
> > [    0.444910]  show_stack+0x2c/0x38
> > [    0.444939]  dump_stack+0xf0/0x16c
> > [    0.444969]  ___might_sleep+0x144/0x208
> > [    0.444996]  __might_sleep+0x54/0x90
> > [    0.445027]  __mutex_lock+0x64/0x970
> > [    0.445055]  mutex_lock_nested+0x54/0x70
> > [    0.445084]  device_del+0x44/0x3c0
> > [    0.445110]  device_unregister+0x24/0x78
> > [    0.445138]  __device_link_free_srcu+0x64/0x70
> > [    0.445164]  srcu_invoke_callbacks+0x10c/0x1a0
> 
> The device_unregister() was added to __device_link_free_srcu() as part
> of commit 287905e68dd2 ("driver core: Expose device link details in sysfs")
> 
> I'm fairly sure this is what introduced the console output, though the
> code before it is already suspicious:
> 
> call_srcu(&device_links_srcu, &link->rcu_head, __device_link_free_srcu);
> 
> According to the documentation, call_srcu() must not call any sleeping
> functions, which is what the 'in_atomic(): 1' above is about.

Yes, the callback function, in this case __device_link_free_srcu(),
will execute from softirq context.

> However, from what I can tell, the put_device() and pm_runtime_put()
> calls in device_link_free() can also potentially sleep even if they normally
> don't warn about that.

The usual workaround is to have __device_link_free_srcu() schedule a
workqueue that invokes the potentially sleeping functions.

							Thanx, Paul

>        Arnd
> 
> > [    0.445191]  process_one_work+0x2b0/0x768
> > [    0.445218]  worker_thread+0x48/0x498
> > [    0.445246]  kthread+0x158/0x168
> > [    0.445274]  ret_from_fork+0x10/0x1c
> >
> > <>
> >
> > [   13.015528] BUG: sleeping function called from invalid context at
> > /usr/src/kernel/kernel/locking/mutex.c:935
> > [   13.015588] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid:
> > 188, name: kworker/2:4
> > [   13.025268] 2 locks held by kworker/2:4/188:
> > [   13.032647]  #0: ffff00000eb15138
> > ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> > [   13.036920]  #1: ffff80001426bdf0
> > ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> > process_one_work+0x208/0x768
> > [   13.046032] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
> >       5.8.0-rc6-next-20200721 #1
> > [   13.056039] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   13.065417] Workqueue: rcu_gp srcu_invoke_callbacks
> > [   13.072091] Call trace:
> > [   13.076695]  dump_backtrace+0x0/0x1f8
> > [   13.079124]  show_stack+0x2c/0x38
> > [   13.082944]  dump_stack+0xf0/0x16c
> > [   13.086243]  ___might_sleep+0x144/0x208
> > [   13.089542]  __might_sleep+0x54/0x90
> > [   13.093274]  __mutex_lock+0x64/0x970
> > [   13.097094]  mutex_lock_nested+0x54/0x70
> > [   13.100654]  device_del+0x44/0x3c0
> > [   13.104556]  device_unregister+0x24/0x78
> > [   13.107771]  __device_link_free_srcu+0x64/0x70
> > [   13.111850]  srcu_invoke_callbacks+0x10c/0x1a0
> > [   13.116103]  process_one_work+0x2b0/0x768
> > [   13.120530]  worker_thread+0x48/0x498
> > [   13.124610]  kthread+0x158/0x168
> > [   13.128254]  ret_from_fork+0x10/0x1c
> > [   13.131818] BUG: scheduling while atomic: kworker/2:4/188/0x00000201
> > [   13.135243] 3 locks held by kworker/2:4/188:
> > [   13.141558]  #0: ffff00000eb15138
> > ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x208/0x768
> > [   13.145834]  #1: ffff80001426bdf0
> > ((work_completion)(&sdp->work)){+.+.}-{0:0}, at:
> > process_one_work+0x208/0x768
> > [   13.154924]  #2: ffff8000127f2fd0 (kernfs_mutex){+.+.}-{3:3}, at:
> > __kernfs_remove+0x304/0x378
> > [   13.164952] Modules linked in: mdt_loader videobuf2_common
> > drm_kms_helper qcom_rng i2c_qcom_cci display_connector drm socinfo
> > rmtfs_mem rfkill qrtr ns fuse
> > [   13.173653] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
> >       5.8.0-rc6-next-20200721 #1
> > [   13.187296] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   13.196666] Workqueue: rcu_gp srcu_invoke_callbacks
> > [   13.203340] Call trace:
> > [[0;32m  OK  [0m] Started Network Manager Script Dispatcher Servic[
> > 13.207942]  dump_backtrace+0x0/0x1f8
> > e.[   13.221350]  __schedule_bug+0x74/0xa0
> > [   13.221386]  __schedule+0x890/0x938
> > [   13.224160]  schedule+0x48/0x110
> > [   13.227462]  schedule_preempt_disabled+0x1c/0x30
> > [   13.230933]  __mutex_lock+0x814/0x970
> > [   13.235533]  mutex_lock_nested+0x54/0x70
> > [   13.239091]  __kernfs_remove+0x304/0x378
> > [   13.243085]  kernfs_remove_by_name_ns+0x5c/0xc0
> > [   13.246991]  sysfs_remove_link+0x30/0x60
> > [   13.251246]  device_remove_class_symlinks+0x78/0xa8
> > [   13.255411]  device_del+0xb8/0x3c0
> >
> > [   13.260011]  device_unregister+0x24/0x78
> > [   13.263744]  __device_link_free_srcu+0x64/0x70
> > [   13.267746]  srcu_invoke_callbacks+0x10c/0x1a0
> > [   13.271992]  process_one_work+0x2b0/0x768
> > [   13.276417]  worker_thread+0x48/0x498
> > [   13.280499]  kthread+0x158/0x168
> > [   13.284144]  ret_from_fork+0x10/0x1c
> > [   13.289062] BUG: workqueue leaked lock or atomic: kworker/2:4/0xfffffe00/188
> > [   13.289062]      last function: srcu_invoke_callbacks
> > [   13.291056] no locks held by kworker/2:4/188.
> > [   13.302935] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
> >       5.8.0-rc6-next-20200721 #1
> > [   13.305703] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: registered as rtc0
> > [   13.307317] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   13.307333] Workqueue: rcu_gp srcu_invoke_callbacks
> > [   13.307349] Call trace:
> > [   13.307360]  dump_backtrace+0x0/0x1f8
> > [   13.307369]  show_stack+0x2c/0x38
> > [   13.307381]  dump_stack+0xf0/0x16c
> > [   13.307392]  process_one_work+0x624/0x768
> > [   13.347424]  worker_thread+0x48/0x498
> > [   13.351501]  kthread+0x158/0x168
> > [   13.355146]  ret_from_fork+0x10/0x1c
> > [   13.358487] BUG: scheduling while atomic: kworker/2:4/188/0xfffffe01
> > [   13.362056] no locks held by kworker/2:4/188.
> > [   13.363536] rtc-pm8xxx 200f000.spmi:pm8916@0:rtc@6000: setting
> > system clock to 1970-01-01T00:00:19 UTC (19)
> > [   13.368361] Modules linked in: rtc_pm8xxx(+) videobuf2_memops
> > videobuf2_v4l2 mdt_loader videobuf2_common drm_kms_helper qcom_rng
> > i2c_qcom_cci display_connector drm socinfo rmtfs_mem rfkill qrtr ns
> > fuse
> > [   13.382197] CPU: 2 PID: 188 Comm: kworker/2:4 Tainted: G        W
> >       5.8.0-rc6-next-20200721 #1
> > [   13.400208] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   13.409418] Workqueue:  0x0 (rcu_gp)
> > [   13.416084] Call trace:
> > [   13.419646]  dump_backtrace+0x0/0x1f8
> > [   13.421815]  show_stack+0x2c/0x38
> > [   13.425635]  dump_stack+0xf0/0x16c
> > [   13.428933]  __schedule_bug+0x74/0xa0
> > [   13.432234]  __schedule+0x890/0x938
> > [   13.435967]  schedule+0x48/0x110
> > [   13.439262]  worker_thread+0xc0/0x498
> > [   13.442735]  kthread+0x158/0x168
> > [   13.446294]  ret_from_fork+0x10/0x1c
> >
> > Full test log,
> > https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200721/testrun/2972385/suite/linux-log-parser/test/check-kernel-warning-1595062/log
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org
