Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7500590E37
	for <lists+linux-next@lfdr.de>; Fri, 12 Aug 2022 11:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238082AbiHLJgb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Aug 2022 05:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238066AbiHLJga (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Aug 2022 05:36:30 -0400
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF6F979D9
        for <linux-next@vger.kernel.org>; Fri, 12 Aug 2022 02:36:29 -0700 (PDT)
Received: by mail-io1-f71.google.com with SMTP id p123-20020a6bbf81000000b00674f66cf13aso268555iof.23
        for <linux-next@vger.kernel.org>; Fri, 12 Aug 2022 02:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=bPYi2L+v51JCGntT1zZ6lVPE53BP8c9+iw/NkBv0V6I=;
        b=Lr7j+8kFihW9I0NPqeJup9aHmHRNMQNZNlsIPhAQ6zG7eHhiodgLEtYm5LP/mxiZUl
         1IHhEXlytQgGyu4GRpPJkzgAEnF6jIwlVLXy2GsLUzLTvmcgfL0u1F3AWrTXjs/VS4ua
         C+3Eeg3yT1YvQ/HSMoUW0BDQxxnSAa4IzEHzWO3ml8TI9RPE+NI54IlQ/kepHFpKCK78
         D9wu93iWzJRt5xg9liS0MiBlOT/7Rgvbx4YeHpsizsQ8gD2uGX2ibqQVAiqBtS94sQUX
         IiFk3p8QNlXCcY3zPEeD6NtU3BWmbjjuTLHAlVJZNTeiXd2jf5IoJq8A0pBRX8QfEgJs
         SnhQ==
X-Gm-Message-State: ACgBeo3xePT6yLocaXWACsDH/cQvBelyuovZpbd1uHRVjFUMXpZVT7ke
        R3EjoAhwG4Aw0QfQZhWU0hpfLYDBOUsJNbmyplDeciCYeH0T
X-Google-Smtp-Source: AA6agR5VPjqtXl+grCuz01B7ohQPXFQoqRK3BQMiAZRWGjdZ0ZL+ZtYXNONbTw2/Ubtp0Y66pSvJbbhLCChKUsIe422uBS9cEh1Q
MIME-Version: 1.0
X-Received: by 2002:a05:6638:380a:b0:343:5bad:bf8d with SMTP id
 i10-20020a056638380a00b003435badbf8dmr1606271jav.206.1660296988622; Fri, 12
 Aug 2022 02:36:28 -0700 (PDT)
Date:   Fri, 12 Aug 2022 02:36:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a85f505e60804db@google.com>
Subject: [syzbot] linux-next boot error: kernel BUG in __phys_addr
From:   syzbot <syzbot+c257efdd53a617c7caf7@syzkaller.appspotmail.com>
To:     bpf@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        fw@strlen.de, harshit.m.mogalapalli@oracle.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        netdev@vger.kernel.org, pabeni@redhat.com, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    7bb4fa8a025a Add linux-next specific files for 20220812
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15ddd587080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5ae8cfa8d7075d1
dashboard link: https://syzkaller.appspot.com/bug?extid=c257efdd53a617c7caf7
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c257efdd53a617c7caf7@syzkaller.appspotmail.com

udevd[2975]: starting eudev-3.2.10
------------[ cut here ]------------
kernel BUG at arch/x86/mm/physaddr.c:28!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 2975 Comm: udevd Not tainted 5.19.0-next-20220812-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:__phys_addr+0xd3/0x140 arch/x86/mm/physaddr.c:28
Code: e3 44 89 e9 31 ff 48 d3 eb 48 89 de e8 56 21 45 00 48 85 db 75 0f e8 6c 24 45 00 4c 89 e0 5b 5d 41 5c 41 5d c3 e8 5d 24 45 00 <0f> 0b e8 56 24 45 00 48 c7 c0 10 50 cb 8b 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90002dbf8b8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff000000000000 RCX: 0000000000000000
RDX: ffff88807cd11d80 RSI: ffffffff8136e1c3 RDI: 0000000000000006
RBP: ffff000080000000 R08: 0000000000000006 R09: ffff000080000000
R10: ffff778000000000 R11: 0000000000000000 R12: ffff778000000000
R13: ffffc90002dbf920 R14: ffff000000000000 R15: 0000000000000000
FS:  00007f9b90cd2840(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e07825a388 CR3: 000000002641b000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 virt_to_folio include/linux/mm.h:856 [inline]
 virt_to_slab mm/kasan/../slab.h:175 [inline]
 qlink_to_cache mm/kasan/quarantine.c:131 [inline]
 qlist_free_all+0x86/0x170 mm/kasan/quarantine.c:184
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:447
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:727 [inline]
 slab_alloc_node mm/slub.c:3243 [inline]
 kmem_cache_alloc_node+0x2b1/0x3f0 mm/slub.c:3293
 __alloc_skb+0x210/0x2f0 net/core/skbuff.c:418
 alloc_skb include/linux/skbuff.h:1257 [inline]
 netlink_alloc_large_skb net/netlink/af_netlink.c:1191 [inline]
 netlink_sendmsg+0x9a2/0xe10 net/netlink/af_netlink.c:1896
 sock_sendmsg_nosec net/socket.c:714 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:734
 ____sys_sendmsg+0x6eb/0x810 net/socket.c:2482
 ___sys_sendmsg+0x110/0x1b0 net/socket.c:2536
 __sys_sendmsg+0xf3/0x1c0 net/socket.c:2565
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f9b90935163
Code: 64 89 02 48 c7 c0 ff ff ff ff eb b7 66 2e 0f 1f 84 00 00 00 00 00 90 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 89 54 24 1c 48
RSP: 002b:00007ffd32cf5c38 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000055e078203db0 RCX: 00007f9b90935163
RDX: 0000000000000000 RSI: 00007ffd32cf5c48 RDI: 0000000000000004
RBP: 000055e0782390e0 R08: 0000000000000001 R09: 000055e07822f540
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000070 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__phys_addr+0xd3/0x140 arch/x86/mm/physaddr.c:28
Code: e3 44 89 e9 31 ff 48 d3 eb 48 89 de e8 56 21 45 00 48 85 db 75 0f e8 6c 24 45 00 4c 89 e0 5b 5d 41 5c 41 5d c3 e8 5d 24 45 00 <0f> 0b e8 56 24 45 00 48 c7 c0 10 50 cb 8b 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc90002dbf8b8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff000000000000 RCX: 0000000000000000
RDX: ffff88807cd11d80 RSI: ffffffff8136e1c3 RDI: 0000000000000006
RBP: ffff000080000000 R08: 0000000000000006 R09: ffff000080000000
R10: ffff778000000000 R11: 0000000000000000 R12: ffff778000000000
R13: ffffc90002dbf920 R14: ffff000000000000 R15: 0000000000000000
FS:  00007f9b90cd2840(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d17224b028 CR3: 000000002641b000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
