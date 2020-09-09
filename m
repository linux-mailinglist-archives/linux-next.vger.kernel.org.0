Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4A1262FF7
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 16:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729942AbgIIOkd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 10:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730189AbgIIMfk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 08:35:40 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F44321D40;
        Wed,  9 Sep 2020 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599654292;
        bh=RC4ET4UGGwvfPfKXEGUHg+8Sd219Ylt06e+SU6Ko5hM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b+LfyXyZQizdA4JwxUxSlquVnPdTwlFvX+Iq3KUpeJ5+vLMP9JaTQdqULPdOLd/7P
         MSb8LZLCWdX7xemIfNhjp1INideHCg6/7krAk9I2LvLLog/L5KPRR6YebpAmHbMXGI
         8t9rt8nzDtt965PnucWv+/2y8otm7hvZM5cJLHko=
Date:   Wed, 9 Sep 2020 14:25:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jim Cromie <jim.cromie@gmail.com>, Petr Mladek <pmladek@suse.com>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, jbaron@akamai.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, jim.cromie@gmail.com,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>
Subject: Re: kernel BUG at /usr/src/kernel/lib/dynamic_debug.c:267!
Message-ID: <20200909122502.GB668220@kroah.com>
References: <CA+G9fYvg7voMNArr3nPpv_dRn10RwYos075NW_b5rFbBLZ=-8g@mail.gmail.com>
 <20200909144745.504c4cbfeea9bc298e3c6b9b@kernel.org>
 <20200909080025.GC3864@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909080025.GC3864@alley>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 10:00:25AM +0200, Petr Mladek wrote:
> On Wed 2020-09-09 14:47:45, Masami Hiramatsu wrote:
> > Hi Naresh,
> > 
> > Thanks for reporting, it seems that you have run the kselftests/livepatch/test-livepatch.sh.
> > Then, I think it is better to report to Livepatch maintainers too. (I Cc'd them)
> > 
> > Thank you,
> > 
> > On Wed, 9 Sep 2020 10:24:09 +0530
> > Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > 
> > > While testing livepatch test cases on x86_64 with Linux next 20200908 tag kernel
> > > this kernel BUG noticed several times.
> > > 
> > > metadata:
> > >   git branch: master
> > >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >   git commit: dff9f829e5b0181d4ed9d35aa62d695292399b54
> > >   git describe: next-20200908
> > >     kernel-config:
> > > http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/853/config
> > > 
> > > kernel BUG log,
> > > ----------------------
> > > [  634.063970] % rmmod test_klp_livepatch
> > > [  634.114787] test_klp_atomic_replace: this has been live patched
> > > [  634.121953] % echo 0 > /sys/kernel/livepatch/test_klp_atomic_replace/enabled
> > > [  634.129391] livepatch: 'test_klp_atomic_replace': starting
> > > unpatching transition
> > > [  634.143990] livepatch: 'test_klp_atomic_replace': unpatching complete
> > > [  634.156223] % rmmod test_klp_atomic_replace
> > > [  634.235451] ------------[ cut here ]------------
> > > [  634.240314] kernel BUG at /usr/src/kernel/lib/dynamic_debug.c:267!
> > > [  634.246584] invalid opcode: 0000 [#1] SMP PTI
> > > [  634.250955] CPU: 0 PID: 12791 Comm: test-livepatch. Tainted: G
> > >   W     K   5.9.0-rc4-next-20200908 #1
> > > [  634.260615] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > > 2.2 05/23/2018
> > > [  634.268007] RIP: 0010:ddebug_exec_query+0x77b/0xb90
> > > [  634.272886] Code: 4c 89 ad 70 ff ff ff e9 db fb ff ff b8 03 00 00
> > > 00 e9 20 fb ff ff b8 02 00 00 00 e9 16 fb ff ff b8 01 00 00 00 e9 0c
> > > fb ff ff <0f> 0b 31 c0 e9 03 fb ff ff 49 89 f4 48 89 f7 e9 78 f9 ff ff
> > > 8b 15
> > > [  634.291630] RSP: 0018:ffff9f0c80a5bd18 EFLAGS: 00010246
> > > [  634.296856] RAX: 000000000000003d RBX: 0000000000000000 RCX: 0000000000000000
> > > [  634.303987] RDX: 000000000000003d RSI: 0000000000000000 RDI: ffff90db906583ec
> > > [  634.311111] RBP: ffff9f0c80a5bde8 R08: 000000000000000a R09: 000000000000003b
> > > [  634.318236] R10: ffff90db92610000 R11: 0000000000000246 R12: ffff90db906583ec
> > > [  634.325368] R13: ffffffffbe87cbc0 R14: 0000000000000000 R15: 0000000000000004
> > > [  634.332500] FS:  00007fd37249a740(0000) GS:ffff90dbefa00000(0000)
> > > knlGS:0000000000000000
> > > [  634.340578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  634.346315] CR2: 0000000000e6d00c CR3: 000000026a4b8004 CR4: 00000000003706f0
> > > [  634.353446] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > [  634.360570] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > [  634.367693] Call Trace:
> > > [  634.370139]  ? lock_acquire+0xa6/0x390
> > > [  634.373892]  ? __might_fault+0x34/0x80
> > > [  634.377648]  ddebug_exec_queries+0x6e/0x140
> > > [  634.381831]  ddebug_proc_write+0x4b/0xa0
> > > [  634.385756]  full_proxy_write+0x5f/0x90
> > > [  634.389595]  vfs_write+0xed/0x240
> > > [  634.392915]  ksys_write+0xad/0xf0
> > > [  634.396233]  ? syscall_trace_enter+0x17a/0x240
> > > [  634.400670]  __x64_sys_write+0x1a/0x20
> > > [  634.404416]  do_syscall_64+0x37/0x50
> > > [  634.407993]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > [  634.413038] RIP: 0033:0x7fd371b84144
> > > [  634.416617] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00
> > > 00 00 00 00 66 90 48 8d 05 c1 e7 2c 00 8b 00 85 c0 75 13 b8 01 00 00
> > > 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 41 54 49 89 d4 55 48 89
> > > f5 53
> > > [  634.435362] RSP: 002b:00007ffd19447658 EFLAGS: 00000246 ORIG_RAX:
> > > 0000000000000001
> > > [  634.442928] RAX: ffffffffffffffda RBX: 00000000000000bc RCX: 00007fd371b84144
> > > [  634.450059] RDX: 00000000000000bc RSI: 0000000000e6cf70 RDI: 0000000000000001
> > > [  634.457181] RBP: 0000000000e6cf70 R08: 00000000000000e9 R09: 0000000000000000
> > > [  634.464305] R10: 00007ffd19447c48 R11: 0000000000000246 R12: 00007fd371e4e760
> > > [  634.471429] R13: 00000000000000bc R14: 00007fd371e49760 R15: 00000000000000bc
> > > [  634.478559] Modules linked in: trace_printk sch_fq 8021q
> > > iptable_filter xt_mark ip_tables cls_bpf sch_ingress veth algif_hash
> > > x86_pkg_temp_thermal fuse [last unloaded: test_klp_atomic_replace]
> > > [  634.495695] ---[ end trace d04d7e11bd1458bf ]---
> > > [  634.500333] RIP: 0010:ddebug_exec_query+0x77b/0xb90
> > > [  634.505218] Code: 4c 89 ad 70 ff ff ff e9 db fb ff ff b8 03 00 00
> > > 00 e9 20 fb ff ff b8 02 00 00 00 e9 16 fb ff ff b8 01 00 00 00 e9 0c
> > > fb ff ff <0f> 0b 31 c0 e9 03 fb ff ff 49 89 f4 48 89 f7 e9 78 f9 ff ff
> > > 8b 15
> > > [  634.523969] RSP: 0018:ffff9f0c80a5bd18 EFLAGS: 00010246
> > > [  634.529197] RAX: 000000000000003d RBX: 0000000000000000 RCX: 0000000000000000
> > > [  634.536330] RDX: 000000000000003d RSI: 0000000000000000 RDI: ffff90db906583ec
> > > [  634.543462] RBP: ffff9f0c80a5bde8 R08: 000000000000000a R09: 000000000000003b
> > > [  634.550593] R10: ffff90db92610000 R11: 0000000000000246 R12: ffff90db906583ec
> > > [  634.557727] R13: ffffffffbe87cbc0 R14: 0000000000000000 R15: 0000000000000004
> > > [  634.564869] FS:  00007fd37249a740(0000) GS:ffff90dbefa00000(0000)
> > > knlGS:0000000000000000
> > > [  634.572953] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [  634.578699] CR2: 0000000000e6d00c CR3: 000000026a4b8004 CR4: 00000000003706f0
> > > [  634.585829] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > [  634.592964] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> It is caused by the commit 42f07816ac0cc79792811 ("dyndbg:
> fix problem parsing format="foo bar"). It modified the condition
> when the above BUG() gets triggered.
> 
> It has even been reported by the kernel test robot, see
> https://lore.kernel.org/lkml/20200902074124.GP4299@shao2-debian/
> 
> 
> It is triggered when the livepatching selftest is trying to restore the
> original setting of dynamic debug messages in the livepatch framework.
> 
> It can get reliably reproduced by the following call:
> 
> $> echo -n 'file kernel/livepatch/transition.c line 586 =_' > \
>    /sys/kernel/debug/dynamic_debug/control
> 
> 
> Adding people from the problematic patch into CC.
> 
> I haven't dived into the dynamic debug code yet. The logic might
> be wrong.
> 
> Anyway, the BUG_ON() should get replaced by a normal error message.
> There is no reason to panic() when a string can't be parsed !!!

The above mentioned patch was trying to fix things so that the BUG_ON()
would not be hit, I guess that's not really happening here :(

Jim, can you look into this?

thanks,

greg k-h
