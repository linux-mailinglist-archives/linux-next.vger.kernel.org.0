Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCB61BC0CC
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 16:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgD1OLY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 10:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgD1OLX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 10:11:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829F8C03C1A9;
        Tue, 28 Apr 2020 07:11:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h69so10379486pgc.8;
        Tue, 28 Apr 2020 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xjtieliq6TUIPTk1KZwdT+BI4FV+JKQhvNa0mOc/Kj0=;
        b=kWAvqgz7oheXnWxczzfP5mI2EuexL0EIvHoPiPWeTnApOMqC9Z4PcsRFMa+c+auGPF
         81oKdZe1dndBoNPJY5zXrkkDVQje37rIguzUSPjUftqhkTeZCg2wK3DcwpsroedAlTGh
         p3jFZt/S/s3S3X7QyBTOiwgDS+sCXq4IKGrEKqnGYBtOh428LZHyXAirvSBKKG037jMT
         1LZ6EpQWGIcRE7ftpM0qCaV6h2WghjLCV8wdgA8jREstsMi8XgNO7B9CzIwAluxPTNYb
         47ToXf9UrLPu4cKIC+cgwtQDoCcozWhjow50CxvsRHLYimjaUMOoydaR1txRFdCGO5qU
         UQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xjtieliq6TUIPTk1KZwdT+BI4FV+JKQhvNa0mOc/Kj0=;
        b=jUXTpQ4sldbWybphWtR/Ue+5+Po78N15lm1Dte4u1jwqaN2VLDq+w/JwFlM6MeP405
         Sy/vSV/v8xFlzoWhxmA78JibgqLXTRlUzj8aPvIad61lWcRhjPavhipyo7bbRMfcq0RF
         491qUu9Tr8EQW6Oc8nzDiWczz8XYfqq25Cp3RZSBINw8QZUBBXeOP9tP/zBHbIublK/l
         JKMIcUJaPEPONO950DBdgahWoAil3SVmsTkbRuM6sj2tw5VGdtlzX8nBn9hCRwVOZCHZ
         ZXDqMJTZeIk6HaRwFk2Ji/jHvQIMnlCp4fRC9Se+VczVH4mN23i1enL4JwQcwSGKITwS
         9NPw==
X-Gm-Message-State: AGi0PubXkH99Sy2jgw4sP5/uvQ0/Ssgldq7pheBqGoeCMt7iFZN4oPDv
        v88KlyD1QseMLGg30mqMPw==
X-Google-Smtp-Source: APiQypKQmLuR+ZTcuQosMy20qQlPtC6e9KuT+BurmUwR+/+YrWnT8lz/gDrfNUIdcS4V12CpzIJj2Q==
X-Received: by 2002:a63:b219:: with SMTP id x25mr1764030pge.251.1588083082791;
        Tue, 28 Apr 2020 07:11:22 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:d33:c58:9c84:8ece:9d0f:426b])
        by smtp.gmail.com with ESMTPSA id h8sm1708015pfo.143.2020.04.28.07.11.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 07:11:21 -0700 (PDT)
From:   Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date:   Tue, 28 Apr 2020 19:41:14 +0530
To:     Qian Cai <cai@lca.pw>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Amol Grover <frextrite@gmail.com>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        syzbot <syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "paul E. McKenney" <paulmck@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next boot error: WARNING: suspicious RCU usage in
 ipmr_get_table
Message-ID: <20200428141114.GA23123@madhuparna-HP-Notebook>
References: <000000000000df9a9805a455e07b@google.com>
 <CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_mvKHf--Z80Z3wkyK1Q@mail.gmail.com>
 <34558B83-103E-4205-8D3D-534978D5A498@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34558B83-103E-4205-8D3D-534978D5A498@lca.pw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 28, 2020 at 09:56:59AM -0400, Qian Cai wrote:
> 
> 
> > On Apr 28, 2020, at 4:57 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
> >> net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!
> 
> https://lore.kernel.org/netdev/20200222063835.14328-2-frextrite@gmail.com/
> 
> Never been picked up for a few months due to some reasons. You could probably
> need to convince David, Paul, Steven or Linus to unblock the bot or carry patches
> on your own?
> 
> >> net/ipv6/ip6mr.c:124 RCU-list traversed in non-reader section!!
> 
> Not sure about this if anyone is working on it. Adding a few people...
>
I will have a look at this one.

> >> 
> >> other info that might help us debug this:
> >> 
> >> 
> >> rcu_scheduler_active = 2, debug_locks = 1
> >> 1 lock held by swapper/0/1:
> >> #0: ffffffff8a5a6330 (pernet_ops_rwsem){+.+.}-{3:3}, at: register_pernet_subsys+0x16/0x40 net/core/net_namespace.c:1257
> >> 
> >> stack backtrace:
> >> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc3-next-20200428-syzkaller #0
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> >> Call Trace:
> >> __dump_stack lib/dump_stack.c:77 [inline]
> >> dump_stack+0x18f/0x20d lib/dump_stack.c:118
> >> ip6mr_get_table+0x153/0x180 net/ipv6/ip6mr.c:124
> >> ip6mr_new_table+0x1b/0x70 net/ipv6/ip6mr.c:382
> >> ip6mr_rules_init net/ipv6/ip6mr.c:236 [inline]
> >> ip6mr_net_init+0x133/0x3f0 net/ipv6/ip6mr.c:1310
> >> ops_init+0xaf/0x420 net/core/net_namespace.c:151
> >> __register_pernet_operations net/core/net_namespace.c:1140 [inline]
> >> register_pernet_operations+0x346/0x840 net/core/net_namespace.c:1217
> >> register_pernet_subsys+0x25/0x40 net/core/net_namespace.c:1258
> >> ip6_mr_init+0x49/0x152 net/ipv6/ip6mr.c:1363
> >> inet6_init+0x1d7/0x6dc net/ipv6/af_inet6.c:1032
> >> do_one_initcall+0x10a/0x7d0 init/main.c:1159
> >> do_initcall_level init/main.c:1232 [inline]
> >> do_initcalls init/main.c:1248 [inline]
> >> do_basic_setup init/main.c:1268 [inline]
> >> kernel_init_freeable+0x501/0x5ae init/main.c:1454
> >> kernel_init+0xd/0x1bb init/main.c:1359
> >> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
> >> 
> >> =============================
> >> WARNING: suspicious RCU usage
> >> 5.7.0-rc3-next-20200428-syzkaller #0 Not tainted
> >> -----------------------------
> >> security/integrity/evm/evm_main.c:231 RCU-list traversed in non-reader section!!
> 
> Ditto.
>
I am working on this one(evm_main.c). I am in touch with the maintaners
and I will fix this one soon.

Thank you,
Madhuparna
> >> 
> >> other info that might help us debug this:
> >> 
> >> 
> >> rcu_scheduler_active = 2, debug_locks = 1
> >> 2 locks held by systemd/1:
> >> #0: ffff888098dfa450 (sb_writers#8){.+.+}-{0:0}, at: sb_start_write include/linux/fs.h:1659 [inline]
> >> #0: ffff888098dfa450 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x3a/0xb0 fs/namespace.c:354
> >> #1: ffff8880988e8310 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: inode_lock include/linux/fs.h:799 [inline]
> >> #1: ffff8880988e8310 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: vfs_setxattr+0x92/0xf0 fs/xattr.c:219
> >> 
> >> stack backtrace:
> >> CPU: 0 PID: 1 Comm: systemd Not tainted 5.7.0-rc3-next-20200428-syzkaller #0
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> >> Call Trace:
> >> __dump_stack lib/dump_stack.c:77 [inline]
> >> dump_stack+0x18f/0x20d lib/dump_stack.c:118
> >> evm_protected_xattr+0x1c2/0x210 security/integrity/evm/evm_main.c:231
> >> evm_protect_xattr.isra.0+0xb6/0x3d0 security/integrity/evm/evm_main.c:318
> >> evm_inode_setxattr+0xc4/0xf0 security/integrity/evm/evm_main.c:387
> >> security_inode_setxattr+0x18f/0x200 security/security.c:1297
> >> vfs_setxattr+0xa7/0xf0 fs/xattr.c:220
> >> setxattr+0x23d/0x330 fs/xattr.c:451
> >> path_setxattr+0x170/0x190 fs/xattr.c:470
> >> __do_sys_setxattr fs/xattr.c:485 [inline]
> >> __se_sys_setxattr fs/xattr.c:481 [inline]
> >> __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:481
> >> do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
> >> entry_SYSCALL_64_after_hwframe+0x49/0xb3
> >> RIP: 0033:0x7fe46005e67a
> >> Code: 48 8b 0d 21 18 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 bc 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ee 17 2b 00 f7 d8 64 89 01 48
> >> RSP: 002b:00007fffef423568 EFLAGS: 00000246 ORIG_RAX: 00000000000000bc
> >> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe46005e67a
> >> RDX: 00007fffef4235e0 RSI: 0000556ea53ddf9b RDI: 0000556ea6766760
> >> RBP: 0000556ea53ddf9b R08: 0000000000000000 R09: 0000000000000030
> >> R10: 0000000000000020 R11: 0000000000000246 R12: 00007fffef4235e0
> >> R13: 0000000000000020 R14: 0000000000000000 R15: 0000556ea6751700
> >> 
> >> security/device_cgroup.c:357 RCU-list traversed in non-reader section!!
> 
> https://lore.kernel.org/lkml/20200406105950.GA2285@workstation-kernel-dev/
> 
> The same story. The patch had been ignored for a while.
> 
> 
> 
