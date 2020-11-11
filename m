Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDB12AEA4E
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 08:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgKKHp1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 11 Nov 2020 02:45:27 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:46860 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKKHpU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 02:45:20 -0500
Received: by mail-il1-f199.google.com with SMTP id q5so768186ilc.13
        for <linux-next@vger.kernel.org>; Tue, 10 Nov 2020 23:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=DgdwDD3uMpEOnZc7ZuBnM/QlpjarkOygh97T2WmhMdg=;
        b=hevms4SjkiA6FZbhz0NXv7yZtm4aHFBB3XNpNIAtH8ZJFYw08meLjIwGUfI6t+AVOf
         bjNatedhOfr5mg6MfBIzNhnNKHKqowURyf+Q5QKRTP+5ghNJ5SztqfH4zZShOiZLPtMg
         /p03YxlI6v4AUCpIDKKYuens5NgC9RwbqxKT+UQeLztYjXOXukQeKsrjCm2iZdIB0BA5
         9/mcsVjA8E1GP2HYqQhV8s+nX4wUlkO/gBmTaCs+J7lRjP/zJbRxBMudphA62RhrDmot
         laoYUJbVBOP8/Ukx9e8pZ9H6Sq6i+6FB+uE+EKjgSnS9fsMrJxTxz4ZbnvVxe5wA9FJQ
         GUdA==
X-Gm-Message-State: AOAM530+VLlvMv7hJdYuP0zDPtTxELeoreFMKGDDcnYdX3daEeJzjvn5
        szIvhsEaGqcCzgsnrLJmfvksCSCCN1RkE/SFIULtZOoL5sqv
X-Google-Smtp-Source: ABdhPJxZUmACq6tm0WFlMNHQfoBsoRUeBKxwW4n2FVefYAX06oqZsZIXiXsV1zwC0HrTfVNZb54WMAIeTwGH8lDqFDCKKZ+xhB7X
MIME-Version: 1.0
X-Received: by 2002:a92:8707:: with SMTP id m7mr17134397ild.217.1605080717348;
 Tue, 10 Nov 2020 23:45:17 -0800 (PST)
Date:   Tue, 10 Nov 2020 23:45:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fe575905b3cff92c@google.com>
Subject: linux-next boot error: BUG: unable to handle kernel NULL pointer
 dereference in mempool_init_node
From:   syzbot <syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3e14f70c Add linux-next specific files for 20201111
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12e6af62500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f4c7e100b61b76
dashboard link: https://syzkaller.appspot.com/bug?extid=2d6f3dad1a42d86a5801
compiler:       gcc (GCC) 10.1.0-syz 20200507

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com

RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
NET: Registered protocol family 44
pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfefff window]
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
PCI: CLS 0 bytes, default 64
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0x00000000b5e00000-0x00000000b9e00000] (64MB)
RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl timer
kvm: already loaded the other module
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x212735223b2, max_idle_ns: 440795277976 ns
clocksource: Switched to clocksource tsc
Initialise system trusted keyrings
workingset: timestamp_bits=40 max_order=21 bucket_order=0
zbud: loaded
DLM installed
squashfs: version 4.0 (2009/01/31) Phillip Lougher
FS-Cache: Netfs 'nfs' registered for caching
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
nfs4filelayout_init: NFSv4 File Layout Driver Registering...
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
FS-Cache: Netfs 'cifs' registered for caching
Key type cifs.spnego registered
Key type cifs.idmap registered
ntfs: driver 2.1.32 [Flags: R/W].
efs: 1.0a - http://aeschi.ch.eu.org/efs/
jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
QNX4 filesystem 0.2.3 registered.
qnx6: QNX6 filesystem 1.0.0 registered.
fuse: init (API version 7.32)
orangefs_debugfs_init: called with debug mask: :none: :0:
orangefs_init: module version upstream loaded
JFS: nTxBlock = 8192, nTxLock = 65536
SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
9p: Installing v9fs 9p2000 file system support
FS-Cache: Netfs '9p' registered for caching
NILFS version 2 loaded
befs: version: 0.9.3
ocfs2: Registered cluster interface o2cb
ocfs2: Registered cluster interface user
OCFS2 User DLM kernel interface loaded
gfs2: GFS2 installed
BUG: kernel NULL pointer dereference, address: 0000000000000018
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc3-next-20201111-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:nearest_obj include/linux/slub_def.h:169 [inline]
RIP: 0010:____kasan_slab_free+0x19/0x110 mm/kasan/common.c:350
Code: 00 48 c7 c0 fb ff ff ff c3 cc cc cc cc cc cc cc cc 41 55 49 89 d5 41 54 49 89 fc 48 89 f7 55 48 89 f5 53 89 cb e8 f7 27 7e ff <41> 8b 7c 24 18 48 be 00 00 00 00 00 16 00 00 48 c1 e8 0c 48 89 c1
RSP: 0000:ffffc90000c67d30 EFLAGS: 00010293
RAX: 00000001436d0000 RBX: 0000000000000000 RCX: ffffffff8130a760
RDX: ffff888140748000 RSI: ffffffff8130a76a RDI: 0000000000000007
RBP: ffff8881436d0000 R08: 00000000000000fe R09: ffffed10286da800
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff81945766 R14: ffff888143557944 R15: ffffffff81943b80
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000018 CR3: 000000000b08e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 kasan_slab_free_mempool include/linux/kasan.h:202 [inline]
 kasan_poison_element mm/mempool.c:107 [inline]
 add_element mm/mempool.c:124 [inline]
 mempool_init_node+0x37e/0x580 mm/mempool.c:205
 mempool_create_node mm/mempool.c:269 [inline]
 mempool_create+0x76/0xc0 mm/mempool.c:254
 mempool_create_kmalloc_pool include/linux/mempool.h:88 [inline]
 init_caches fs/ceph/super.c:785 [inline]
 init_ceph+0x193/0x2d7 fs/ceph/super.c:1261
 do_one_initcall+0x103/0x650 init/main.c:1212
 do_initcall_level init/main.c:1285 [inline]
 do_initcalls init/main.c:1301 [inline]
 do_basic_setup init/main.c:1321 [inline]
 kernel_init_freeable+0x600/0x684 init/main.c:1521
 kernel_init+0xd/0x1b8 init/main.c:1410
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Modules linked in:
CR2: 0000000000000018
---[ end trace d7568b3491dd0938 ]---
RIP: 0010:nearest_obj include/linux/slub_def.h:169 [inline]
RIP: 0010:____kasan_slab_free+0x19/0x110 mm/kasan/common.c:350
Code: 00 48 c7 c0 fb ff ff ff c3 cc cc cc cc cc cc cc cc 41 55 49 89 d5 41 54 49 89 fc 48 89 f7 55 48 89 f5 53 89 cb e8 f7 27 7e ff <41> 8b 7c 24 18 48 be 00 00 00 00 00 16 00 00 48 c1 e8 0c 48 89 c1
RSP: 0000:ffffc90000c67d30 EFLAGS: 00010293
RAX: 00000001436d0000 RBX: 0000000000000000 RCX: ffffffff8130a760
RDX: ffff888140748000 RSI: ffffffff8130a76a RDI: 0000000000000007
RBP: ffff8881436d0000 R08: 00000000000000fe R09: ffffed10286da800
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffffffff81945766 R14: ffff888143557944 R15: ffffffff81943b80
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000018 CR3: 000000000b08e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
