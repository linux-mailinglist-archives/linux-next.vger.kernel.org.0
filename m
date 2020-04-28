Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2EF1BC05B
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 15:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgD1N5C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 09:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgD1N5C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 09:57:02 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73245C03C1A9
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 06:57:02 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b188so20212637qkd.9
        for <linux-next@vger.kernel.org>; Tue, 28 Apr 2020 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bnjOOvh4SMYLoB4ygqU5KXt2AopllOYg67zW9fgDCNE=;
        b=A4dGhCCaKxI4AU9G03hChxAqCSkhA71uO8KNLuohGzG0mJFT4Lp6Wh1TKfGr5BNZc6
         Q/uT3GKjILE5nH9jbXtaoVq0q/4Ee+BQTiDpYeQvuKGelLa75+6+EbUJkiyblBO7VWZx
         EXkLAGCs9OrP5m4MxvNr/jqwft6y6pT8ofrzBGlRY2CTsidC8jTeekQN5oeUzuJVhtB3
         URjAAr77a9wxzmUiiwDD0eBCUtz1Us87LVmw5R4Z1nXvGsMOarA8oFckw/57kYPNCc1n
         Be3JJqAC0MlLAhHu7rUn0cmV/bGFX8kuzDhvETpzLgIv3wrrnb9+gEezBdhVN/OCgWN3
         l8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=bnjOOvh4SMYLoB4ygqU5KXt2AopllOYg67zW9fgDCNE=;
        b=fxVOKmcDjcESozu/okd4/qNUlTVelA4nRvMjIVFBY4ovDMnGEqYPvODxkgyhCuYyRU
         5lKjgkTqkTaIlig4/unZQjbg2dmuSjV+PYw7TR9hwWr6uJeXtRBjMvYjxasFFWKAiKCr
         gYluqTCdEo2SA4zTqUpefjJ6GlCLS1HG/7Usy+deGJEoq2LdVZDlj3iKdiv8hHq+9FV/
         o/EmtiwWr9O/CvtCmfcxy7edjk0P621BYgH9T2AVlNsHrqTa0Dr+AnIay/UPMFhJLX2C
         LMMBceC/i3tFbGzHJwyp7CRB2UBNC36p0bwyf1s8rqhwUXuU/uuCLYndtR3gl3XeBOBq
         KzoA==
X-Gm-Message-State: AGi0Pua13tbVL+8jy+hQX1Zqx2aocPK/XOO9ASv2jND5JTb+PVvQVImh
        Jy6ZMKd8CdcFxiDvBxGQGFzs0A==
X-Google-Smtp-Source: APiQypLeiLlI+LOU+p/8ztIa9gNMSBld4WWzJ561dEk9dxi+ri8pRessRnzlrEK+25gUPQWqWAcxIg==
X-Received: by 2002:a05:620a:70f:: with SMTP id 15mr27416361qkc.68.1588082221618;
        Tue, 28 Apr 2020 06:57:01 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id r6sm14179799qtc.28.2020.04.28.06.57.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 06:57:00 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: linux-next boot error: WARNING: suspicious RCU usage in
 ipmr_get_table
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_mvKHf--Z80Z3wkyK1Q@mail.gmail.com>
Date:   Tue, 28 Apr 2020 09:56:59 -0400
Cc:     syzbot <syzbot+1519f497f2f9f08183c6@syzkaller.appspotmail.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <34558B83-103E-4205-8D3D-534978D5A498@lca.pw>
References: <000000000000df9a9805a455e07b@google.com>
 <CACT4Y+YnjK+kq0pfb5fe-q1bqe2T1jq_mvKHf--Z80Z3wkyK1Q@mail.gmail.com>
To:     Dmitry Vyukov <dvyukov@google.com>,
        Amol Grover <frextrite@gmail.com>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Apr 28, 2020, at 4:57 AM, Dmitry Vyukov <dvyukov@google.com> wrote:
>> net/ipv4/ipmr.c:136 RCU-list traversed in non-reader section!!

=
https://lore.kernel.org/netdev/20200222063835.14328-2-frextrite@gmail.com/=


Never been picked up for a few months due to some reasons. You could =
probably
need to convince David, Paul, Steven or Linus to unblock the bot or =
carry patches
on your own?

>> net/ipv6/ip6mr.c:124 RCU-list traversed in non-reader section!!

Not sure about this if anyone is working on it. Adding a few people...

>>=20
>> other info that might help us debug this:
>>=20
>>=20
>> rcu_scheduler_active =3D 2, debug_locks =3D 1
>> 1 lock held by swapper/0/1:
>> #0: ffffffff8a5a6330 (pernet_ops_rwsem){+.+.}-{3:3}, at: =
register_pernet_subsys+0x16/0x40 net/core/net_namespace.c:1257
>>=20
>> stack backtrace:
>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted =
5.7.0-rc3-next-20200428-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
>> Call Trace:
>> __dump_stack lib/dump_stack.c:77 [inline]
>> dump_stack+0x18f/0x20d lib/dump_stack.c:118
>> ip6mr_get_table+0x153/0x180 net/ipv6/ip6mr.c:124
>> ip6mr_new_table+0x1b/0x70 net/ipv6/ip6mr.c:382
>> ip6mr_rules_init net/ipv6/ip6mr.c:236 [inline]
>> ip6mr_net_init+0x133/0x3f0 net/ipv6/ip6mr.c:1310
>> ops_init+0xaf/0x420 net/core/net_namespace.c:151
>> __register_pernet_operations net/core/net_namespace.c:1140 [inline]
>> register_pernet_operations+0x346/0x840 net/core/net_namespace.c:1217
>> register_pernet_subsys+0x25/0x40 net/core/net_namespace.c:1258
>> ip6_mr_init+0x49/0x152 net/ipv6/ip6mr.c:1363
>> inet6_init+0x1d7/0x6dc net/ipv6/af_inet6.c:1032
>> do_one_initcall+0x10a/0x7d0 init/main.c:1159
>> do_initcall_level init/main.c:1232 [inline]
>> do_initcalls init/main.c:1248 [inline]
>> do_basic_setup init/main.c:1268 [inline]
>> kernel_init_freeable+0x501/0x5ae init/main.c:1454
>> kernel_init+0xd/0x1bb init/main.c:1359
>> ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> WARNING: suspicious RCU usage
>> 5.7.0-rc3-next-20200428-syzkaller #0 Not tainted
>> -----------------------------
>> security/integrity/evm/evm_main.c:231 RCU-list traversed in =
non-reader section!!

Ditto.

>>=20
>> other info that might help us debug this:
>>=20
>>=20
>> rcu_scheduler_active =3D 2, debug_locks =3D 1
>> 2 locks held by systemd/1:
>> #0: ffff888098dfa450 (sb_writers#8){.+.+}-{0:0}, at: sb_start_write =
include/linux/fs.h:1659 [inline]
>> #0: ffff888098dfa450 (sb_writers#8){.+.+}-{0:0}, at: =
mnt_want_write+0x3a/0xb0 fs/namespace.c:354
>> #1: ffff8880988e8310 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: =
inode_lock include/linux/fs.h:799 [inline]
>> #1: ffff8880988e8310 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: =
vfs_setxattr+0x92/0xf0 fs/xattr.c:219
>>=20
>> stack backtrace:
>> CPU: 0 PID: 1 Comm: systemd Not tainted =
5.7.0-rc3-next-20200428-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, =
BIOS Google 01/01/2011
>> Call Trace:
>> __dump_stack lib/dump_stack.c:77 [inline]
>> dump_stack+0x18f/0x20d lib/dump_stack.c:118
>> evm_protected_xattr+0x1c2/0x210 security/integrity/evm/evm_main.c:231
>> evm_protect_xattr.isra.0+0xb6/0x3d0 =
security/integrity/evm/evm_main.c:318
>> evm_inode_setxattr+0xc4/0xf0 security/integrity/evm/evm_main.c:387
>> security_inode_setxattr+0x18f/0x200 security/security.c:1297
>> vfs_setxattr+0xa7/0xf0 fs/xattr.c:220
>> setxattr+0x23d/0x330 fs/xattr.c:451
>> path_setxattr+0x170/0x190 fs/xattr.c:470
>> __do_sys_setxattr fs/xattr.c:485 [inline]
>> __se_sys_setxattr fs/xattr.c:481 [inline]
>> __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:481
>> do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
>> entry_SYSCALL_64_after_hwframe+0x49/0xb3
>> RIP: 0033:0x7fe46005e67a
>> Code: 48 8b 0d 21 18 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f =
84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 bc 00 00 00 0f 05 <48> 3d =
01 f0 ff ff 73 01 c3 48 8b 0d ee 17 2b 00 f7 d8 64 89 01 48
>> RSP: 002b:00007fffef423568 EFLAGS: 00000246 ORIG_RAX: =
00000000000000bc
>> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe46005e67a
>> RDX: 00007fffef4235e0 RSI: 0000556ea53ddf9b RDI: 0000556ea6766760
>> RBP: 0000556ea53ddf9b R08: 0000000000000000 R09: 0000000000000030
>> R10: 0000000000000020 R11: 0000000000000246 R12: 00007fffef4235e0
>> R13: 0000000000000020 R14: 0000000000000000 R15: 0000556ea6751700
>>=20
>> security/device_cgroup.c:357 RCU-list traversed in non-reader =
section!!

=
https://lore.kernel.org/lkml/20200406105950.GA2285@workstation-kernel-dev/=


The same story. The patch had been ignored for a while.



