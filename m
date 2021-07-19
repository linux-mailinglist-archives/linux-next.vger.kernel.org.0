Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94293CD0D4
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 11:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhGSItp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 04:49:45 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:33536 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbhGSItp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2021 04:49:45 -0400
Received: by mail-il1-f198.google.com with SMTP id b8-20020a92c8480000b0290208fe58bd16so10312351ilq.0
        for <linux-next@vger.kernel.org>; Mon, 19 Jul 2021 02:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=67fs8KaUaO1c90Lm7TwHr8NemEvb922vgP6rF13lB64=;
        b=XvwuyHfNUhncUID1KBJl1SL4B4UbdSSYeGbBory0ACS+8XmefkPZgcPFvVCmtO02bH
         UlrOth1IUXRye3Pqonard2uapSSWblMxAtKl5hKD8WfRXQ/5zM0CQCoh1bpiaN5wQ2BR
         UH9MxotKYmSmn4LwK2pkEbJWs3G+3rvFYJoVbnCzFwljiapB4T/bvbGdVcI8ZZ10M48y
         NTFnW3svF1jKnzKxOu1P+GmVVykU5YxyDoFhwVHYG8jjk0fZI1FC26Pl08MmjFOyhMc8
         x374jTpZYq+OPJ+joPqZNf3zKSArmhPBHMaZ86ASC8FsVmogfBb4EyKSSUxvHklKrwCo
         A+gQ==
X-Gm-Message-State: AOAM530jZ905Qx8b+GlqXgn5lF6cUHHhviWU78fs9w3y+aGC6nxXppq9
        3QsbE2aMOPbiGxwI6t+Ro/i1vSzYkb+Evnemnpmx7chpB/rr
X-Google-Smtp-Source: ABdhPJwm+WkM5f20Ofvrm/S6HeDSkgvomzwsJu+/Y4AN5+RFrO0CpYrBnMs+UaP2lqUYVEeoeHQ4CJzCkvZAHak8NiaS2EgRIh9/
MIME-Version: 1.0
X-Received: by 2002:a6b:1497:: with SMTP id 145mr18205338iou.128.1626687024976;
 Mon, 19 Jul 2021 02:30:24 -0700 (PDT)
Date:   Mon, 19 Jul 2021 02:30:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000048d99005c7769606@google.com>
Subject: [syzbot] linux-next boot error: WARNING in debug_vm_pgtable
From:   syzbot <syzbot+8730ec44a441a434a2c8@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    08076eab6fef Add linux-next specific files for 20210719
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16624fd2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=29a82c885e192046
dashboard link: https://syzkaller.appspot.com/bug?extid=8730ec44a441a434a2c8

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8730ec44a441a434a2c8@syzkaller.appspotmail.com

Bluetooth: BNEP filters: protocol multicast
Bluetooth: BNEP socket layer initialized
Bluetooth: CMTP (CAPI Emulation) ver 1.0
Bluetooth: CMTP socket layer initialized
Bluetooth: HIDP (Human Interface Emulation) ver 1.2
Bluetooth: HIDP socket layer initialized
NET: Registered PF_RXRPC protocol family
Key type rxrpc registered
Key type rxrpc_s registered
NET: Registered PF_KCM protocol family
lec:lane_module_init: lec.c: initialized
mpoa:atm_mpoa_init: mpc.c: initialized
l2tp_core: L2TP core driver, V2.0
l2tp_ppp: PPPoL2TP kernel driver, V2.0
l2tp_ip: L2TP IP encapsulation support (L2TPv3)
l2tp_netlink: L2TP netlink interface
l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
l2tp_ip6: L2TP IP encapsulation support for IPv6 (L2TPv3)
NET: Registered PF_PHONET protocol family
8021q: 802.1Q VLAN Support v1.8
DCCP: Activated CCID 2 (TCP-like)
DCCP: Activated CCID 3 (TCP-Friendly Rate Control)
sctp: Hash tables configured (bind 32/56)
NET: Registered PF_RDS protocol family
Registered RDS/infiniband transport
Registered RDS/tcp transport
tipc: Activated (version 2.0.0)
NET: Registered PF_TIPC protocol family
tipc: Started in single node mode
NET: Registered PF_SMC protocol family
9pnet: Installing 9P2000 support
NET: Registered PF_CAIF protocol family
NET: Registered PF_IEEE802154 protocol family
Key type dns_resolver registered
Key type ceph registered
libceph: loaded (mon/osd proto 15/24)
batman_adv: B.A.T.M.A.N. advanced 2021.2 (compatibility version 15) loaded
openvswitch: Open vSwitch switching datapath
NET: Registered PF_VSOCK protocol family
mpls_gso: MPLS GSO support
IPI shorthand broadcast: enabled
AVX2 version of gcm_enc/dec engaged.
AES CTR mode by8 optimization enabled
sched_clock: Marking stable (13057587730, 27846366)->(13084401149, 1032947)
registered taskstats version 1
Loading compiled-in X.509 certificates
Loaded X.509 cert 'Build time autogenerated kernel key: f850c787ad998c396ae089c083b940ff0a9abb77'
zswap: loaded using pool lzo/zbud
debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:5349 current_gfp_context include/linux/sched/mm.h:187 [inline]
WARNING: CPU: 0 PID: 1 at mm/page_alloc.c:5349 __alloc_pages+0x45d/0x500 mm/page_alloc.c:5361
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2-next-20210719-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__alloc_pages+0x45d/0x500 mm/page_alloc.c:5349
Code: be c9 00 00 00 48 c7 c7 80 e4 96 89 c6 05 89 1a a5 0b 01 e8 4d ba 35 07 e9 6a ff ff ff 0f 0b e9 a0 fd ff ff 40 80 e5 3f eb 88 <0f> 0b e9 18 ff ff ff 4c 89 ef 44 89 e6 45 31 ed e8 6e 74 ff ff e9
RSP: 0000:ffffc90000c67b08 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 1ffff9200018cf62 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000012 RDI: 0000000000000cc0
RBP: 0000000000000000 R08: 000000000000003f R09: 0000000000000003
R10: ffffffff81b9a5e8 R11: 0000000000000003 R12: 0000000000000012
R13: 0000000000000012 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000b68e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2124
 alloc_pages+0x26a/0x2d0 mm/mempolicy.c:2274
 alloc_mem mm/debug_vm_pgtable.c:1138 [inline]
 debug_vm_pgtable+0x762/0x2986 mm/debug_vm_pgtable.c:1169
 do_one_initcall+0x103/0x650 init/main.c:1285
 do_initcall_level init/main.c:1360 [inline]
 do_initcalls init/main.c:1376 [inline]
 do_basic_setup init/main.c:1396 [inline]
 kernel_init_freeable+0x6b8/0x741 init/main.c:1598
 kernel_init+0x1a/0x1d0 init/main.c:1490
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
