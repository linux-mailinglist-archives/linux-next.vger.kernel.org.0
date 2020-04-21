Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8C21B2457
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 12:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgDUKu5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Apr 2020 06:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUKu4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2020 06:50:56 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBBAC061A10
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 03:50:56 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id w18so5846730qvs.3
        for <linux-next@vger.kernel.org>; Tue, 21 Apr 2020 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X97gowXSXVuj90hXQ6kQpDZGS51aik4UM3Tpue+54yo=;
        b=eFCf/fNPi3IrRTS06krXS2ZMEjJX8GKQ2J7VKIUNFHjMEHXoiLJBPNpxCePML0yGxn
         jSN6Bi1BtJqbNIv6rNs4TSS/q33MdfZzi2ZsR5r2KFTIxgOclA+Q1+ZpLaHBvwRSPajI
         LidR7KucPFXVKb2H1IHYcI7Nt6kxMIrbf1YbmLsHx1Lba0zX3QKpn5UxbaRDjqqzGyGO
         o2AauplIbuT6czoZn4D20ciho6JwKS6XcD4Fxp0CZhjbNIRoEZkhX2aNIHRRIf0y4c4N
         3q3v6rMwxGZuPM/4wRHTFaAkR1k3wIF/FqoVfnQVAw5vlry/yu1YUuHI3HEcMd4YAp/y
         2xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X97gowXSXVuj90hXQ6kQpDZGS51aik4UM3Tpue+54yo=;
        b=ThTgc87Lx6vsg+yWtST1QebI9uFlxIbrhkZtZrqcdffmEnkR7BjdsrK8BMj8VO4DVI
         X1wCV/rZgW11OY2y6VFLjI5G38zaSZrfdoos2q5IdsDRuOhDmTCZSNXZ38DrztQGBbaT
         Ku0CdlT+YZjE3NPq/xq2bLYAxxT0LVZvyVlmY4kxmyDavqE4VQARB+AxL5iPM3e99wl4
         koswiENAQuUDaJw2/PqC9GuASDXirpbg3vcCVE+rj0vNdr5QBzHsAq2kk2BtM2YQMxti
         IlAlnVJTJPI86FIXPMV2gEBoGXReGUZfA9625umRpG0i703vnJbe/B0VBI0dL9ZIYEDe
         prBA==
X-Gm-Message-State: AGi0PualkbYisUWHr799xZAK9BdDH9tnEXtRn2wmaFwO5siVqYJe+7XK
        0SaZlZuTY2/tffK1i/8fFiPK2nsF3ieaa8Du4HQBeQ==
X-Google-Smtp-Source: APiQypJV/TkyKYL3JG6ZElcl+LDXWVoV5Zz2Nn/25blcKt7NCRqYuax1dcadhWUfAfrBLAbzu71QX7wTora2Y1MAEUU=
X-Received: by 2002:ad4:4d06:: with SMTP id l6mr5926201qvl.34.1587466255012;
 Tue, 21 Apr 2020 03:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004ede4505a3cab90e@google.com>
In-Reply-To: <0000000000004ede4505a3cab90e@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 21 Apr 2020 12:50:43 +0200
Message-ID: <CACT4Y+ZuGaeyyVsCkqJRo4+0hoMP8Eq_JTuU0L-NFqTrQP_czA@mail.gmail.com>
Subject: Re: linux-next test error: WARNING: suspicious RCU usage in ipmr_device_event
To:     syzbot <syzbot+21f82f61c24a7295edf5@syzkaller.appspotmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>, kuba@kernel.org,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 21, 2020 at 12:46 PM syzbot
<syzbot+21f82f61c24a7295edf5@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    39a314cd Add linux-next specific files for 20200421
> git tree:       linux-next

+linux-next, Stephen for a new linux-next breakage

> console output: https://syzkaller.appspot.com/x/log.txt?x=127ede73e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8ef80c3f5d43f5bd
> dashboard link: https://syzkaller.appspot.com/bug?extid=21f82f61c24a7295edf5
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+21f82f61c24a7295edf5@syzkaller.appspotmail.com
>
> tipc: TX() has been purged, node left!
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc2-next-20200421-syzkaller #0 Not tainted
> -----------------------------
> net/ipv4/ipmr.c:1757 RCU-list traversed in non-reader section!!
>
> other info that might help us debug this:
>
>
> rcu_scheduler_active = 2, debug_locks = 1
> 4 locks held by kworker/u4:0/7:
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: __write_once_size include/linux/compiler.h:250 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:615 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
>  #0: ffff8880a9772138 ((wq_completion)netns){+.+.}-{0:0}, at: process_one_work+0x844/0x16a0 kernel/workqueue.c:2239
>  #1: ffffc90000cdfdc0 (net_cleanup_work){+.+.}-{0:0}, at: process_one_work+0x878/0x16a0 kernel/workqueue.c:2243
>  #2: ffffffff8a5a2b70 (pernet_ops_rwsem){++++}-{3:3}, at: cleanup_net+0x9b/0xa50 net/core/net_namespace.c:565
>  #3: ffffffff8a5aeae8 (rtnl_mutex){+.+.}-{3:3}, at: ip6gre_exit_batch_net+0x88/0x700 net/ipv6/ip6_gre.c:1602
>
> stack backtrace:
> CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.7.0-rc2-next-20200421-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: netns cleanup_net
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x188/0x20d lib/dump_stack.c:118
>  ipmr_device_event+0x240/0x2b0 net/ipv4/ipmr.c:1757
>  notifier_call_chain+0xc0/0x230 kernel/notifier.c:83
>  call_netdevice_notifiers_info net/core/dev.c:1948 [inline]
>  call_netdevice_notifiers_info+0xb5/0x130 net/core/dev.c:1933
>  call_netdevice_notifiers_extack net/core/dev.c:1960 [inline]
>  call_netdevice_notifiers net/core/dev.c:1974 [inline]
>  rollback_registered_many+0x75c/0xe70 net/core/dev.c:8828
>  unregister_netdevice_many.part.0+0x16/0x1e0 net/core/dev.c:9993
>  unregister_netdevice_many+0x36/0x50 net/core/dev.c:9992
>  ip6gre_exit_batch_net+0x4e8/0x700 net/ipv6/ip6_gre.c:1605
>  ops_exit_list.isra.0+0x103/0x150 net/core/net_namespace.c:189
>  cleanup_net+0x511/0xa50 net/core/net_namespace.c:603
>  process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
>  worker_thread+0x96/0xe20 kernel/workqueue.c:2414
>  kthread+0x38b/0x470 kernel/kthread.c:274
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000004ede4505a3cab90e%40google.com.
