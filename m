Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F5B2872D0
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 12:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgJHKu1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbgJHKu0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 06:50:26 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC76BC0613D2
        for <linux-next@vger.kernel.org>; Thu,  8 Oct 2020 03:50:24 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id d197so5729538iof.0
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2020 03:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lCm297Vem0VVU5uh4PlRGksWcmheqp1kHsr1sCk3vEQ=;
        b=Ww4JSUfHMPPfwlzZyS0BTvwk+OnxpizFDPIUZPAf8uINL/ETi2pA0YVhIayYu3tHav
         ktnlXZZqGBG2B3dtP3X1CICe4KR9MsEObwngxzj+BxuYEh+LQwJBpy8qAQjPT25l4x/u
         L5xFhZedNbILdA5r673RuhVFaEBNxAVOAGbu5N3bkADWcQf4g5qWhr6X8sBM9YnYWJnF
         L/MKdm9II+L+7a3vtSCVbY9/v/gXHKa+qlnCF1e8LNWgdXLeFYyOLjbHAnT2s7Cm0h0z
         YnMULSSHtSLgqlRTtkrrd6zuHbDWGpGz6ZRESnnHznkzKoz1ya3jbHdvF59+JyVs7tUY
         pfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lCm297Vem0VVU5uh4PlRGksWcmheqp1kHsr1sCk3vEQ=;
        b=H3/FncCjVQt+hwGdP1CdAxO9eTN0GT0rtE9ck+cFrBxX9tO/LVgskuLe/2oIhy4oPQ
         6ARwFtw7bXzbzN72U80OLZjXtsobvVOKlQotIE3c76IHl094a8TOuJKycpSJzUQEDBYY
         qZSFMT7ovcDkvN3jFUo68wP1b0BHKXik97ry0EzhiGEf/LVz/6BGyV3VnKB2huFcppON
         K5U91NuhcKR4umsqUBdDD8US6MQr3TSn3L+1133oA2IRBtijYn2KM/kfth5kuqjl3/5m
         xeo79vccvrxXoM7z35F8WRouw/iysBZDgxs1Qjp7rLuqrw2gOXYJ2E03VBbnoiz9C0YQ
         BgVQ==
X-Gm-Message-State: AOAM531MXcm4Kkn0Fr8wHvLv8mOiiOVmR2yBCPuh+LxVJeobT82tQ5JS
        BP7pqmbHnIctNW1Ltq/6jV26vi3u7z2YrwD5edJdBeugokFwQfZX
X-Google-Smtp-Source: ABdhPJzqfGvqXmzn7/akNG1mmzNVXYsu6UXhrpSxwtIMee+JnFkLzEm3kbDMipEUpCzb7ZnxjURtu7+0nZmWmn7PqO8=
X-Received: by 2002:a5e:9b11:: with SMTP id j17mr5376667iok.176.1602154223557;
 Thu, 08 Oct 2020 03:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvVEhs_HROaXaW70mWrp_z6N4mJ-3rfFs0iAcT9Kg3A1A@mail.gmail.com>
 <20200814084123.5b64c0cf@oasis.local.home> <CA+G9fYv0mhj1VVb99mS1akTaQxZD9TBcrFVoU9pdctMhG1r8BQ@mail.gmail.com>
In-Reply-To: <CA+G9fYv0mhj1VVb99mS1akTaQxZD9TBcrFVoU9pdctMhG1r8BQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 8 Oct 2020 16:20:12 +0530
Message-ID: <CA+G9fYu00aRZtxhckXFBgZRYKnp7Y2BRFHr2w9MuT-LAei50Cg@mail.gmail.com>
Subject: Re: WARNING: at kernel/trace/trace.c:1727 update_max_tr_single.part.0+0xa8/0x148
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sean Paul <sean@poorly.run>, lkft-triage@lists.linaro.org,
        Ingo Molnar <mingo@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 14 Aug 2020 at 19:57, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Fri, 14 Aug 2020 at 18:11, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Fri, 14 Aug 2020 14:53:36 +0530
> > Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > > steps to reproduce:
> > > # Boot qemu arm64 with trace configs enabled ^.
> > > # cd /opt/ltp
> > > # ./runltp -f tracing

FYI,
Just for the record the reported issue still exists,
These warnings are noticed on arm64 Juno-r2 device with
CONFIG_ARM64_64K_PAGES=y

[  125.616489] WARNING: CPU: 5 PID: 742 at kernel/trace/trace.c:1727
update_max_tr_single.part.0+0xa8/0x148
[  126.732433] WARNING: CPU: 5 PID: 63 at
kernel/trace/ring_buffer.c:1836 rb_update_pages+0x378/0x3a0
[  127.025416] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  231.493344] BUG: Bad page state in process sh  pfn:98af8

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git describe: v5.9-rc8-156-gc85fb28b6f99
  kernel-config:
https://builds.tuxbuild.com/DCkyQvsHwDF-E3sOHqN7SA/kernel.config


Test crash log,
--------------------
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
[  125.611831] ------------[ cut here ]------------
[  125.616489] WARNING: CPU: 5 PID: 742 at kernel/trace/trace.c:1727
update_max_tr_single.part.0+0xa8/0x148
[  125.626057] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  125.633532] CPU: 5 PID: 742 Comm: sh Not tainted 5.9.0-rc8 #1
[  125.639345] Hardware name: ARM Juno development board (r2) (DT)
[  125.645310] pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=--)
[  125.651033] pc : update_max_tr_single.part.0+0xa8/0x148
[  125.656304] lr : update_max_tr_single.part.0+0x94/0x148
[  125.661569] sp : ffff80001666f7d0
[  125.664918] x29: ffff80001666f7d0 x28: ffff8000123f1000
[  125.670287] x27: ffff800012744000 x26: 0000000000000002
[  125.675657] x25: ffff8000127e4580 x24: ffff8000100b2060
[  125.681026] x23: 0000000000000005 x22: ffff800012425880
[  125.686395] x21: ffff000907113b00 x20: 0000000000000005
[  125.691764] x19: ffff800012425880 x18: 0000000000000000
[  125.697133] x17: 0000000000000000 x16: 0000000000000000
[  125.702501] x15: 0000000000000000 x14: ffff8000102b1f20
[  125.707870] x13: ffff8000102b0904 x12: ffff8000102c98b0
[  125.713239] x11: ffff8000102c6eb4 x10: ffff8000102b1ab4
[  125.718612] x9 : ffff00094056d800 x8 : 0000000000000001
[  125.723987] x7 : 00000000000004ec x6 : 000000000000013a
[  125.729362] x5 : ffff000940120200 x4 : ffff000940134e00
[  125.734737] x3 : ffff000940135000 x2 : 0000000000000005
[  125.740112] x1 : ffff000940120100 x0 : 00000000ffffffea
[  125.745493] Call trace:
[  125.747991]  update_max_tr_single.part.0+0xa8/0x148
[  125.752924]  update_max_tr_single+0x1c/0x28
[  125.757165]  check_critical_timing+0x1fc/0x210
[  125.761663]  tracer_hardirqs_on+0x128/0x170
[  125.765900]  trace_hardirqs_on+0x9c/0x250
[  125.769968]  _raw_spin_unlock_irq+0x20/0x58
[  125.774207]  finish_task_switch+0x78/0x258
[  125.778356]  __schedule+0x2d4/0x798
[  125.781895]  schedule+0x50/0x110
[  125.785174]  schedule_preempt_disabled+0x20/0x38
[  125.789845]  __mutex_lock.isra.0+0x184/0x590
[  125.794168]  __mutex_lock_slowpath+0x1c/0x28
[  125.798490]  mutex_lock+0x50/0x60
[  125.801857]  trace_array_get+0x24/0xa0
[  125.805658]  tracing_check_open_get_tr+0x3c/0x60
[  125.810329]  tracing_open_generic_tr+0x20/0x40
[  125.814830]  do_dentry_open+0x134/0x3a0
[  125.818717]  vfs_open+0x34/0x40
[  125.821910]  path_openat+0x85c/0xde0
[  125.825537]  do_filp_open+0x80/0x108
[  125.829166]  do_sys_openat2+0x1ec/0x2a0
[  125.833054]  do_sys_open+0x60/0xa8
[  125.836507]  __arm64_sys_openat+0x2c/0x38
[  125.840572]  do_el0_svc+0x8c/0x1d8
[  125.844028]  el0_sync_handler+0x9c/0x1bc
[  125.848003]  el0_sync+0x158/0x180
[  125.851365] ---[ end trace 6655e5f102a04398 ]---
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
[  126.727724] ------------[ cut here ]------------
[  126.732433] WARNING: CPU: 5 PID: 63 at
kernel/trace/ring_buffer.c:1836 rb_update_pages+0x378/0x3a0
[  126.741455] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  126.748913] CPU: 5 PID: 63 Comm: kworker/5:1 Tainted: G        W
     5.9.0-rc8 #1
[  126.756809] Hardware name: ARM Juno development board (r2) (DT)
[  126.762808] Workqueue: events update_pages_handler
[  126.767669] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[  126.773305] pc : rb_update_pages+0x378/0x3a0
[  126.777633] lr : rb_update_pages+0x22c/0x3a0
[  126.781953] sp : ffff800013b6fd40
[  126.785320] x29: ffff800013b6fd40 x28: ffff8000123f1000
[  126.790712] x27: ffff80001300fcd8 x26: ffff0009427b2780
[  126.796102] x25: 000000000000fff0 x24: ffff000940135088
[  126.801489] x23: ffff000940135078 x22: ffff0009427b8180
[  126.806877] x21: fffffffffffffeb4 x20: ffff0009427b2780
[  126.812267] x19: ffff000940135000 x18: 0000000000000000
[  126.817654] x17: 0000000000000000 x16: 0000000000000000
[  126.823041] x15: 0000000000000000 x14: 000002c8000002d8
[  126.828427] x13: 000002e800000318 x12: 0000000000100000
[  126.833814] x11: 0000000000100000 x10: ffff800013b6fac0
[  126.839199] x9 : ffff8000102839b8 x8 : 0000000000000001
[  126.844587] x7 : 00000000820000ea x6 : 00000000000209c4
[  126.849974] x5 : ffff800010188abc x4 : ffffffe002309ee0
[  126.855361] x3 : ffff0009427b2780 x2 : 0000000000000000
[  126.860750] x1 : 0000000000000001 x0 : ffff000940120108
[  126.866143] Call trace:
[  126.868650]  rb_update_pages+0x378/0x3a0
[  126.872633]  update_pages_handler+0x1c/0x38
[  126.876884]  process_one_work+0x1c8/0x488
[  126.880961]  worker_thread+0x54/0x428
[  126.884693]  kthread+0x120/0x158
[  126.887990]  ret_from_fork+0x10/0x30
[  126.891628] ---[ end trace 6655e5f102a04399 ]---
[  126.972927] Unable to handle kernel paging request at virtual
address 00646c2f62696c2c
[  126.982191] Mem abort info:
[  126.985172]   ESR = 0x96000004
[  126.989355]   EC = 0x25: DABT (current EL), IL = 32 bits
[  126.997080]   SET = 0, FnV = 0
[  127.001549]   EA = 0, S1PTW = 0
[  127.005144] Data abort info:
[  127.009065]   ISV = 0, ISS = 0x00000004
[  127.013931]   CM = 0, WnR = 0
[  127.017086] [00646c2f62696c2c] address between user and kernel address ranges
[  127.025416] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  127.031066] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  127.038523] CPU: 3 PID: 744 Comm: sh Tainted: G        W         5.9.0-rc8 #1
[  127.045717] Hardware name: ARM Juno development board (r2) (DT)
[  127.051695] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
[  127.057335] pc : rb_check_pages+0x40/0x210
[  127.061488] lr : rb_check_pages+0x20/0x210
[  127.065636] sp : ffff8000166afc40
[  127.068999] x29: ffff8000166afc40 x28: ffff000907111d80
[  127.074382] x27: ffff8000124258a8 x26: 0000000000000143
[  127.079765] x25: 0000000000000000 x24: ffff8000123f4420
[  127.085181] x23: ffff000940120138 x22: ffff000940120110
[  127.090576] x21: ffff000940120100 x20: 000000000142ebd0
[  127.095960] x19: ffff000940120108 x18: 0000000000000000
[  127.101344] x17: 0000000000000000 x16: 0000000000000000
[  127.106727] x15: 000000000000037f x14: 0000000000000401
[  127.112110] x13: 0000000000000003 x12: 0000000000000000
[  127.117493] x11: 0000000000000005 x10: ffff000940134a10
[  127.122876] x9 : 0000000000000000 x8 : ffff00090b4ce600
[  127.128261] x7 : ffff0009427bd200 x6 : ffff000940135000
[  127.133667] x5 : 0000000000000003 x4 : ffff0009427bb780
[  127.139064] x3 : ffff0009427bb780 x2 : 2d646c2f62696c2c
[  127.144448] x1 : 2d646c2f62696c2c x0 : ffff0009427bd200
[  127.149834] Call trace:
[  127.152337]  rb_check_pages+0x40/0x210
[  127.156143]  ring_buffer_resize+0x324/0x4e0
[  127.160388]  resize_buffer_duplicate_size.isra.0+0x74/0x130
[  127.166023]  __tracing_resize_ring_buffer+0xfc/0x118
[  127.171051]  tracing_resize_ring_buffer+0x7c/0xb0
[  127.175816]  tracing_entries_write+0x74/0xd0
[  127.180226]  vfs_write+0xf8/0x238
[  127.183597]  ksys_write+0x74/0x100
[  127.187054]  __arm64_sys_write+0x24/0x30
[  127.191036]  do_el0_svc+0x8c/0x1d8
[  127.194496]  el0_sync_handler+0x9c/0x1bc
[  127.198474]  el0_sync+0x158/0x180
[  127.201852] Code: f9401cc0 f9400002 eb02001f 54000100 (f9400041)
[  127.208022] ---[ end trace 6655e5f102a0439a ]---
Oct  6 21:53:20 juno daemon.info haveged: haveged: Stopping due to signal 15
[  190.436243] ------------[ cut here ]------------
[  190.440892] WARNING: CPU: 2 PID: 2783 at
kernel/trace/ring_buffer.c:4134 rb_get_reader_page+0x264/0x2a8
[  190.450315] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  190.457663] CPU: 2 PID: 2783 Comm: cat Tainted: G      D W
5.9.0-rc8 #1
[  190.464981] Hardware name: ARM Juno development board (r2) (DT)
[  190.470910] pstate: 60000085 (nZCv daIf -PAN -UAO BTYPE=--)
[  190.476491] pc : rb_get_reader_page+0x264/0x2a8
[  190.481026] lr : rb_get_reader_page+0x148/0x2a8
[  190.485559] sp : ffff800018e8fba0
[  190.488874] x29: ffff800018e8fba0 x28: ffff00090b1affe8
[  190.494192] x27: ffff000940135004 x26: 0000000000000060
[  190.499511] x25: ffff000901a21d80 x24: ffff800018e8fd18
[  190.504829] x23: ffff800018e8fd20 x22: ffff0009427b8b00
[  190.510147] x21: 0000000000000080 x20: 0000000000000080
[  190.515470] x19: ffff000940135000 x18: 0000000000000001
[  190.520796] x17: 0000000000000000 x16: 0000000000000000
[  190.526125] x15: ffff000901a22200 x14: ffffffffffffffff
[  190.531463] x13: ffff000948d600b8 x12: 0000000000000018
[  190.536803] x11: 0101010101010101 x10: ffff800018e8fc00
[  190.542143] x9 : 0000000000000000 x8 : 0000000000000001
[  190.547483] x7 : 0000000000000000 x6 : ffff0009401350b8
[  190.552823] x5 : 000000000001ccc7 x4 : ffff0009427b8c00
[  190.558163] x3 : ffff0009427b3400 x2 : 0000000000000000
[  190.563502] x1 : 0000000000100003 x0 : ffff000940120108
[  190.568843] Call trace:
[  190.571336]  rb_get_reader_page+0x264/0x2a8
[  190.575541]  rb_buffer_peek+0x34/0x168
[  190.579311]  ring_buffer_peek+0x94/0x1b8
[  190.583256]  peek_next_entry+0xa0/0xc8
[  190.587026]  __find_next_entry+0xc4/0x1c0
[  190.591057]  trace_find_next_entry_inc+0x34/0x98
[  190.595696]  tracing_read_pipe+0x190/0x308
[  190.599815]  vfs_read+0xb4/0x1e0
[  190.603061]  ksys_read+0x74/0x100
[  190.606420]  __arm64_sys_read+0x24/0x30
[  190.610278]  do_el0_svc+0x8c/0x1d8
[  190.613700]  el0_sync_handler+0x9c/0x1bc
[  190.617642]  el0_sync+0x158/0x180
[  190.620974] ---[ end trace 6655e5f102a0439b ]---
ftrace-stress-test 1 TINFO: killing 721
[  231.493344] BUG: Bad page state in process sh  pfn:98af8
[  231.498686] page:0000000044ba8ba8 refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98af8
[  231.508100] flags: 0x2ffff00000000000()
[  231.511948] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  231.519710] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  231.527467] page dumped because: nonzero _refcount
[  231.532265] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  231.539653] CPU: 4 PID: 7037 Comm: sh Tainted: G      D W
5.9.0-rc8 #1
[  231.546930] Hardware name: ARM Juno development board (r2) (DT)
[  231.552893] Call trace:
[  231.555403]  dump_backtrace+0x0/0x1e0
[  231.559107]  show_stack+0x20/0x30
[  231.562466]  dump_stack+0xe8/0x15c
[  231.565911]  bad_page+0xd4/0x100
[  231.569182]  check_new_page_bad+0x84/0xa0
[  231.573307]  get_page_from_freelist+0x12e0/0x19c0
[  231.578060]  __alloc_pages_nodemask+0x164/0x370
[  231.582638]  alloc_pages_current+0x90/0x108
[  231.586873]  skb_page_frag_refill+0xa8/0xf8
[  231.591103]  sk_page_frag_refill+0x28/0x90
[  231.595247]  tcp_sendmsg_locked+0x338/0xc00
[  231.599477]  tcp_sendmsg+0x40/0x68
[  231.602925]  inet_sendmsg+0x4c/0x78
[  231.606467]  sock_sendmsg+0x24/0x40
[  231.610002]  xprt_sock_sendmsg+0xe4/0x2c0
[  231.614059]  xs_tcp_send_request+0xd0/0x1c8
[  231.618289]  xprt_transmit+0x1ac/0x4b0
[  231.622085]  call_transmit+0x9c/0xb8
[  231.625706]  __rpc_execute+0x8c/0x560
[  231.629414]  rpc_execute+0x150/0x168
[  231.633034]  rpc_run_task+0x15c/0x1c0
[  231.636740]  rpc_call_sync+0x5c/0xb8
[  231.640369]  nfs3_rpc_wrapper+0x58/0xd8
[  231.644252]  nfs3_proc_getattr+0x74/0xa0
[  231.648222]  __nfs_revalidate_inode+0x14c/0x3c0
[  231.652806]  nfs_lookup_verify_inode+0x84/0xa8
[  231.657299]  nfs_do_lookup_revalidate+0x168/0x428
[  231.662051]  __nfs_lookup_revalidate+0x84/0xb0
[  231.666543]  nfs_lookup_revalidate+0x20/0x30
[  231.670860]  lookup_fast+0x180/0x190
[  231.674481]  path_openat+0x110/0xde0
[  231.678102]  do_filp_open+0x80/0x108
[  231.681723]  do_open_execat+0x78/0x1e0
[  231.685519]  bprm_execve+0x154/0x668
[  231.689140]  do_execveat_common+0x164/0x1b0
[  231.693371]  __arm64_sys_execve+0x40/0x58
[  231.697428]  do_el0_svc+0x8c/0x1d8
[  231.700876]  el0_sync_handler+0x9c/0x1bc
[  231.704844]  el0_sync+0x158/0x180
[  232.169547] BUG: Bad page state in process sh  pfn:98af9
[  232.174898] page:000000008ece15a1 refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98af9
[  232.184326] flags: 0x2ffff00000000000()
[  232.188188] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  232.195963] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  232.203736] page dumped because: nonzero _refcount
[  232.208550] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  232.215925] CPU: 1 PID: 7059 Comm: sh Tainted: G    B D W
5.9.0-rc8 #1
[  232.223176] Hardware name: ARM Juno development board (r2) (DT)
[  232.229122] Call trace:
[  232.231594]  dump_backtrace+0x0/0x1e0
[  232.235280]  show_stack+0x20/0x30
[  232.238620]  dump_stack+0xe8/0x15c
[  232.242047]  bad_page+0xd4/0x100
[  232.245298]  check_new_page_bad+0x84/0xa0
[  232.249333]  get_page_from_freelist+0x12e0/0x19c0
[  232.254062]  __alloc_pages_nodemask+0x164/0x370
[  232.258619]  alloc_pages_current+0x90/0x108
[  232.262828]  __get_free_pages+0x1c/0x58
[  232.266688]  tlb_remove_table+0x84/0x118
[  232.270636]  free_pgd_range+0x198/0x340
[  232.274497]  free_pgtables+0x100/0x140
[  232.278269]  exit_mmap+0xe4/0x188
[  232.281607]  mmput+0x8c/0x160
[  232.284598]  begin_new_exec+0x2d0/0xcf0
[  232.288460]  load_elf_binary+0x3a4/0x16b8
[  232.292495]  bprm_execve+0x290/0x668
[  232.296095]  do_execveat_common+0x164/0x1b0
[  232.300304]  __arm64_sys_execve+0x40/0x58
[  232.304340]  do_el0_svc+0x8c/0x1d8
[  232.307766]  el0_sync_handler+0x9c/0x1bc
[  232.311713]  el0_sync+0x158/0x180
[  235.802764] BUG: Bad page state in process sh  pfn:98afa
[  235.808108] page:0000000082dda10f refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98afa
[  235.817524] flags: 0x2ffff00000000000()
[  235.821372] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  235.829133] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  235.836890] page dumped because: nonzero _refcount
[  235.841688] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  235.849031] CPU: 5 PID: 7166 Comm: sh Tainted: G    B D W
5.9.0-rc8 #1
[  235.856266] Hardware name: ARM Juno development board (r2) (DT)
[  235.862199] Call trace:
[  235.864656]  dump_backtrace+0x0/0x1e0
[  235.868370]  show_stack+0x20/0x30
[  235.871709]  dump_stack+0xe8/0x15c
[  235.875136]  bad_page+0xd4/0x100
[  235.878387]  check_new_page_bad+0x84/0xa0
[  235.882431]  get_page_from_freelist+0x12e0/0x19c0
[  235.887176]  __alloc_pages_nodemask+0x164/0x370
[  235.891752]  alloc_pages_current+0x90/0x108
[  235.895983]  skb_page_frag_refill+0xa8/0xf8
[  235.900210]  sk_page_frag_refill+0x28/0x90
[  235.904352]  tcp_sendmsg_locked+0x338/0xc00
[  235.908651]  tcp_sendmsg+0x40/0x68
[  235.912100]  inet_sendmsg+0x4c/0x78
[  235.915643]  sock_sendmsg+0x24/0x40
[  235.919178]  xprt_sock_sendmsg+0xe4/0x2c0
[  235.923234]  xs_tcp_send_request+0xd0/0x1c8
[  235.927465]  xprt_transmit+0x1ac/0x4b0
[  235.931262]  call_transmit+0x9c/0xb8
[  235.934883]  __rpc_execute+0x8c/0x560
[  235.938591]  rpc_execute+0x150/0x168
[  235.942211]  rpc_run_task+0x15c/0x1c0
[  235.945918]  rpc_call_sync+0x5c/0xb8
[  235.949547]  nfs3_rpc_wrapper+0x58/0xd8
[  235.953429]  nfs3_proc_getattr+0x74/0xa0
[  235.957400]  __nfs_revalidate_inode+0x14c/0x3c0
[  235.961984]  nfs_lookup_verify_inode+0x84/0xa8
[  235.966478]  nfs_do_lookup_revalidate+0x168/0x428
[  235.971231]  __nfs_lookup_revalidate+0x84/0xb0
[  235.975722]  nfs_lookup_revalidate+0x20/0x30
[  235.980040]  lookup_fast+0x180/0x190
[  235.983660]  path_openat+0x110/0xde0
[  235.987281]  do_filp_open+0x80/0x108
[  235.990903]  do_open_execat+0x78/0x1e0
[  235.994698]  bprm_execve+0x154/0x668
[  235.998320]  do_execveat_common+0x164/0x1b0
[  236.002551]  __arm64_sys_execve+0x40/0x58
[  236.006608]  do_el0_svc+0x8c/0x1d8
[  236.010056]  el0_sync_handler+0x9c/0x1bc
[  236.014025]  el0_sync+0x158/0x180
[  238.715995] BUG: Bad page state in process cat  pfn:98afb
[  238.721438] page:000000002ed6a442 refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98afb
[  238.730868] flags: 0x2ffff00000000000()
[  238.734731] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  238.742509] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  238.750282] page dumped because: nonzero _refcount
[  238.755095] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  238.762478] CPU: 4 PID: 7218 Comm: cat Tainted: G    B D W
5.9.0-rc8 #1
[  238.769816] Hardware name: ARM Juno development board (r2) (DT)
[  238.775762] Call trace:
[  238.778236]  dump_backtrace+0x0/0x1e0
[  238.781923]  show_stack+0x20/0x30
[  238.785265]  dump_stack+0xe8/0x15c
[  238.788694]  bad_page+0xd4/0x100
[  238.791947]  check_new_page_bad+0x84/0xa0
[  238.795984]  get_page_from_freelist+0x12e0/0x19c0
[  238.800715]  __alloc_pages_nodemask+0x164/0x370
[  238.805274]  alloc_pages_current+0x90/0x108
[  238.809484]  __get_free_pages+0x1c/0x58
[  238.813345]  tlb_remove_table+0x84/0x118
[  238.817295]  free_pgd_range+0x198/0x340
[  238.821157]  free_pgtables+0x100/0x140
[  238.824931]  exit_mmap+0xe4/0x188
[  238.828271]  mmput+0x8c/0x160
[  238.831263]  do_exit+0x2ac/0x9f8
[  238.834516]  do_group_exit+0x4c/0xa8
[  238.838117]  __wake_up_parent+0x0/0x38
[  238.841895]  do_el0_svc+0x8c/0x1d8
[  238.845323]  el0_sync_handler+0x9c/0x1bc
[  238.849271]  el0_sync+0x158/0x180
[  247.784141] BUG: Bad page state in process sh  pfn:98afc
[  247.789495] page:000000004431112a refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98afc
[  247.798921] flags: 0x2ffff00000000000()
[  247.802782] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  247.810556] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  247.818325] page dumped because: nonzero _refcount
[  247.823135] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  247.830498] CPU: 5 PID: 736 Comm: sh Tainted: G    B D W         5.9.0-rc8 #1
[  247.837658] Hardware name: ARM Juno development board (r2) (DT)
[  247.843601] Call trace:
[  247.846070]  dump_backtrace+0x0/0x1e0
[  247.849753]  show_stack+0x20/0x30
[  247.853089]  dump_stack+0xe8/0x15c
[  247.856512]  bad_page+0xd4/0x100
[  247.859761]  check_new_page_bad+0x84/0xa0
[  247.863792]  get_page_from_freelist+0x12e0/0x19c0
[  247.868518]  __alloc_pages_nodemask+0x164/0x370
[  247.873072]  alloc_pages_current+0x90/0x108
[  247.877277]  __vmalloc_node_range+0x1e0/0x2b0
[  247.881657]  copy_process+0x2c8/0x1710
[  247.885425]  _do_fork+0x98/0x488
[  247.888672]  __do_sys_clone+0x58/0x80
[  247.892354]  __arm64_sys_clone+0x28/0x38
[  247.896300]  do_el0_svc+0x8c/0x1d8
[  247.899722]  el0_sync_handler+0x9c/0x1bc
[  247.903666]  el0_sync+0x158/0x180
[  247.907003] BUG: Bad page state in process sh  pfn:98afd
[  247.912344] page:000000007895a095 refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98afd
[  247.921808] flags: 0x2ffff00000000000()
[  247.925667] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  247.933477] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  247.941246] page dumped because: nonzero _refcount
[  247.946055] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  247.953415] CPU: 4 PID: 7520 Comm: sh Tainted: G    B D W
5.9.0-rc8 #1
[  247.960662] Hardware name: ARM Juno development board (r2) (DT)
[  247.966603] Call trace:
[  247.969068]  dump_backtrace+0x0/0x1e0
[  247.972750]  show_stack+0x20/0x30
[  247.976086]  dump_stack+0xe8/0x15c
[  247.979509]  bad_page+0xd4/0x100
[  247.982757]  check_new_page_bad+0x84/0xa0
[  247.986787]  get_page_from_freelist+0x12e0/0x19c0
[  247.991513]  __alloc_pages_nodemask+0x164/0x370
[  247.996066]  alloc_pages_current+0x90/0x108
[  248.000275]  skb_page_frag_refill+0xa8/0xf8
[  248.004479]  sk_page_frag_refill+0x28/0x90
[  248.008598]  tcp_sendmsg_locked+0x338/0xc00
[  248.012803]  tcp_sendmsg+0x40/0x68
[  248.016225]  inet_sendmsg+0x4c/0x78
[  248.019742]  sock_sendmsg+0x24/0x40
[  248.023252]  xprt_sock_sendmsg+0xe4/0x2c0
[  248.027283]  xs_tcp_send_request+0xd0/0x1c8
[  248.031487]  xprt_transmit+0x1ac/0x4b0
[  248.035258]  call_transmit+0x9c/0xb8
[  248.038854]  __rpc_execute+0x8c/0x560
[  248.042536]  rpc_execute+0x150/0x168
[  248.046130]  rpc_run_task+0x15c/0x1c0
[  248.049811]  rpc_call_sync+0x5c/0xb8
[  248.053415]  nfs3_rpc_wrapper+0x58/0xd8
[  248.057272]  nfs3_proc_getattr+0x74/0xa0
[  248.061217]  __nfs_revalidate_inode+0x14c/0x3c0
[  248.065775]  nfs_lookup_verify_inode+0x84/0xa8
[  248.070244]  nfs_do_lookup_revalidate+0x168/0x428
[  248.074971]  __nfs_lookup_revalidate+0x84/0xb0
[  248.079437]  nfs_lookup_revalidate+0x20/0x30
[  248.083729]  lookup_fast+0x180/0x190
[  248.087324]  path_openat+0x110/0xde0
[  248.090919]  do_filp_open+0x80/0x108
[  248.094516]  do_open_execat+0x78/0x1e0
[  248.098286]  bprm_execve+0x154/0x668
[  248.101882]  do_execveat_common+0x164/0x1b0
[  248.106087]  __arm64_sys_execve+0x40/0x58
[  248.110119]  do_el0_svc+0x8c/0x1d8
[  248.113541]  el0_sync_handler+0x9c/0x1bc
[  248.117484]  el0_sync+0x158/0x180
[  248.120818] BUG: Bad page state in process sh  pfn:98afe
[  248.126154] page:0000000029e006c6 refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98afe
[  248.135578] flags: 0x2ffff00000000000()
[  248.139435] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  248.147208] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  248.154977] page dumped because: nonzero _refcount
[  248.159786] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  248.167142] CPU: 4 PID: 7520 Comm: sh Tainted: G    B D W
5.9.0-rc8 #1
[  248.174389] Hardware name: ARM Juno development board (r2) (DT)
[  248.180330] Call trace:
[  248.182793]  dump_backtrace+0x0/0x1e0
[  248.186475]  show_stack+0x20/0x30
[  248.189809]  dump_stack+0xe8/0x15c
[  248.193231]  bad_page+0xd4/0x100
[  248.196479]  check_new_page_bad+0x84/0xa0
[  248.200509]  get_page_from_freelist+0x12e0/0x19c0
[  248.205235]  __alloc_pages_nodemask+0x164/0x370
[  248.209787]  alloc_pages_current+0x90/0x108
[  248.213991]  skb_page_frag_refill+0xa8/0xf8
[  248.218195]  sk_page_frag_refill+0x28/0x90
[  248.222313]  tcp_sendmsg_locked+0x338/0xc00
[  248.226518]  tcp_sendmsg+0x40/0x68
[  248.229940]  inet_sendmsg+0x4c/0x78
[  248.233450]  sock_sendmsg+0x24/0x40
[  248.236958]  xprt_sock_sendmsg+0xe4/0x2c0
[  248.240989]  xs_tcp_send_request+0xd0/0x1c8
[  248.245193]  xprt_transmit+0x1ac/0x4b0
[  248.248963]  call_transmit+0x9c/0xb8
[  248.252558]  __rpc_execute+0x8c/0x560
[  248.256240]  rpc_execute+0x150/0x168
[  248.259835]  rpc_run_task+0x15c/0x1c0
[  248.263516]  rpc_call_sync+0x5c/0xb8
[  248.267113]  nfs3_rpc_wrapper+0x58/0xd8
[  248.270970]  nfs3_proc_getattr+0x74/0xa0
[  248.274913]  __nfs_revalidate_inode+0x14c/0x3c0
[  248.279466]  nfs_lookup_verify_inode+0x84/0xa8
[  248.283933]  nfs_do_lookup_revalidate+0x168/0x428
[  248.288660]  __nfs_lookup_revalidate+0x84/0xb0
[  248.293126]  nfs_lookup_revalidate+0x20/0x30
[  248.297418]  lookup_fast+0x180/0x190
[  248.301012]  path_openat+0x110/0xde0
[  248.304608]  do_filp_open+0x80/0x108
[  248.308204]  do_open_execat+0x78/0x1e0
[  248.311974]  bprm_execve+0x154/0x668
[  248.315570]  do_execveat_common+0x164/0x1b0
[  248.319775]  __arm64_sys_execve+0x40/0x58
[  248.323806]  do_el0_svc+0x8c/0x1d8
[  248.327228]  el0_sync_handler+0x9c/0x1bc
[  248.331171]  el0_sync+0x158/0x180
[  248.334504] BUG: Bad page state in process sh  pfn:98aff
[  248.339840] page:0000000011eee57f refcount:-1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x98aff
[  248.349264] flags: 0x2ffff00000000000()
[  248.353121] raw: 2ffff00000000000 dead000000000100 dead000000000122
0000000000000000
[  248.360894] raw: 0000000000000000 0000000000000000 ffffffffffffffff
0000000000000000
[  248.368663] page dumped because: nonzero _refcount
[  248.373471] Modules linked in: tda998x cec drm_kms_helper drm
crct10dif_ce fuse
[  248.380827] CPU: 4 PID: 7520 Comm: sh Tainted: G    B D W
5.9.0-rc8 #1
[  248.388074] Hardware name: ARM Juno development board (r2) (DT)
[  248.394014] Call trace:
[  248.396478]  dump_backtrace+0x0/0x1e0
[  248.400159]  show_stack+0x20/0x30
[  248.403493]  dump_stack+0xe8/0x15c
[  248.406915]  bad_page+0xd4/0x100
[  248.410163]  check_new_page_bad+0x84/0xa0
[  248.414193]  get_page_from_freelist+0x12e0/0x19c0
[  248.418918]  __alloc_pages_nodemask+0x164/0x370
[  248.423470]  alloc_pages_current+0x90/0x108
[  248.427676]  skb_page_frag_refill+0xa8/0xf8
[  248.431880]  sk_page_frag_refill+0x28/0x90
[  248.435998]  tcp_sendmsg_locked+0x338/0xc00
[  248.440202]  tcp_sendmsg+0x40/0x68
[  248.443624]  inet_sendmsg+0x4c/0x78
[  248.447133]  sock_sendmsg+0x24/0x40
[  248.450642]  xprt_sock_sendmsg+0xe4/0x2c0
[  248.454673]  xs_tcp_send_request+0xd0/0x1c8
[  248.458876]  xprt_transmit+0x1ac/0x4b0
[  248.462647]  call_transmit+0x9c/0xb8
[  248.466241]  __rpc_execute+0x8c/0x560
[  248.469923]  rpc_execute+0x150/0x168
[  248.473517]  rpc_run_task+0x15c/0x1c0
[  248.477199]  rpc_call_sync+0x5c/0xb8
[  248.480796]  nfs3_rpc_wrapper+0x58/0xd8
[  248.484652]  nfs3_proc_getattr+0x74/0xa0
[  248.488595]  __nfs_revalidate_inode+0x14c/0x3c0
[  248.493149]  nfs_lookup_verify_inode+0x84/0xa8
[  248.497616]  nfs_do_lookup_revalidate+0x168/0x428
[  248.502343]  __nfs_lookup_revalidate+0x84/0xb0
[  248.506809]  nfs_lookup_revalidate+0x20/0x30
[  248.511100]  lookup_fast+0x180/0x190
[  248.514695]  path_openat+0x110/0xde0
[  248.518290]  do_filp_open+0x80/0x108
[  248.521887]  do_open_execat+0x78/0x1e0
[  248.525657]  bprm_execve+0x154/0x668
[  248.529253]  do_execveat_common+0x164/0x1b0
[  248.533458]  __arm64_sys_execve+0x40/0x58
[  248.537489]  do_el0_svc+0x8c/0x1d8
[  248.540912]  el0_sync_handler+0x9c/0x1bc
[  248.544854]  el0_sync+0x158/0x180

full test log,
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v5.9-rc8-156-gc85fb28b6f99/testrun/3277053/suite/linux-log-parser/test/check-kernel-bug-1820367/log


-- 
Linaro LKFT
https://lkft.linaro.org
