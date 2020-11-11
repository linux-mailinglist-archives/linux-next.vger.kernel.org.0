Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317F22AF645
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 17:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgKKQ0W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 11:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50511 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726361AbgKKQ0V (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 11:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605111979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M7eWW2J4R8TsefoHyN5vuJS4u5lIWG/lXZWc3MtZNQ0=;
        b=I4gHIx3CNP5TdSpghKsfJzToQdeHztDlhH3FvVsOFmGzchUApbEsVYMFVbLfk/7t3vrmHH
        fi+OtIe5iO5rK9E+IK9LJYj5TtnH/R4P5ppQRkC8VA8TVNk8ZKd8vHhFZSMgqRNdAav4T6
        q/Mi+Ny/3ZpKvBg5UGHV6BM+TsmkwfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-ad52oLT6MP6qOiYi1EeH3w-1; Wed, 11 Nov 2020 11:26:15 -0500
X-MC-Unique: ad52oLT6MP6qOiYi1EeH3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45FA1016D16;
        Wed, 11 Nov 2020 16:25:57 +0000 (UTC)
Received: from ovpn-66-204.rdu2.redhat.com (ovpn-66-204.rdu2.redhat.com [10.10.66.204])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 530E260CD0;
        Wed, 11 Nov 2020 16:25:56 +0000 (UTC)
Message-ID: <bf31020f4e50b303fd0dd3dfda0e50de79ed25db.camel@redhat.com>
Subject: Re: linux-next boot error: BUG: unable to handle kernel NULL
 pointer dereference in mempool_init_node
From:   Qian Cai <cai@redhat.com>
To:     syzbot <syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com>,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Date:   Wed, 11 Nov 2020 11:25:55 -0500
In-Reply-To: <000000000000fe575905b3cff92c@google.com>
References: <000000000000fe575905b3cff92c@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

It looks to me the code paths below had recently been modified heavily by this
patchset. If this is reproducible, it can be confirmed by reverting it.

https://lore.kernel.org/linux-arm-kernel/cover.1605046662.git.andreyknvl@google.com/

On Tue, 2020-11-10 at 23:45 -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3e14f70c Add linux-next specific files for 20201111
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=12e6af62500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f4c7e100b61b76
> dashboard link: https://syzkaller.appspot.com/bug?extid=2d6f3dad1a42d86a5801
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com
> 
> RPC: Registered named UNIX socket transport module.
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> NET: Registered protocol family 44
> pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
> pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfefff window]
> pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> PCI: CLS 0 bytes, default 64
> PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> software IO TLB: mapped [mem 0x00000000b5e00000-0x00000000b9e00000] (64MB)
> RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl
> timer
> kvm: already loaded the other module
> clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x212735223b2,
> max_idle_ns: 440795277976 ns
> clocksource: Switched to clocksource tsc
> Initialise system trusted keyrings
> workingset: timestamp_bits=40 max_order=21 bucket_order=0
> zbud: loaded
> DLM installed
> squashfs: version 4.0 (2009/01/31) Phillip Lougher
> FS-Cache: Netfs 'nfs' registered for caching
> NFS: Registering the id_resolver key type
> Key type id_resolver registered
> Key type id_legacy registered
> nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> FS-Cache: Netfs 'cifs' registered for caching
> Key type cifs.spnego registered
> Key type cifs.idmap registered
> ntfs: driver 2.1.32 [Flags: R/W].
> efs: 1.0a - http://aeschi.ch.eu.org/efs/
> jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
> romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> QNX4 filesystem 0.2.3 registered.
> qnx6: QNX6 filesystem 1.0.0 registered.
> fuse: init (API version 7.32)
> orangefs_debugfs_init: called with debug mask: :none: :0:
> orangefs_init: module version upstream loaded
> JFS: nTxBlock = 8192, nTxLock = 65536
> SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
> 9p: Installing v9fs 9p2000 file system support
> FS-Cache: Netfs '9p' registered for caching
> NILFS version 2 loaded
> befs: version: 0.9.3
> ocfs2: Registered cluster interface o2cb
> ocfs2: Registered cluster interface user
> OCFS2 User DLM kernel interface loaded
> gfs2: GFS2 installed
> BUG: kernel NULL pointer dereference, address: 0000000000000018
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0 
> Oops: 0000 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.0-rc3-next-20201111-syzkaller
> #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google
> 01/01/2011
> RIP: 0010:nearest_obj include/linux/slub_def.h:169 [inline]
> RIP: 0010:____kasan_slab_free+0x19/0x110 mm/kasan/common.c:350
> Code: 00 48 c7 c0 fb ff ff ff c3 cc cc cc cc cc cc cc cc 41 55 49 89 d5 41 54
> 49 89 fc 48 89 f7 55 48 89 f5 53 89 cb e8 f7 27 7e ff <41> 8b 7c 24 18 48 be
> 00 00 00 00 00 16 00 00 48 c1 e8 0c 48 89 c1
> RSP: 0000:ffffc90000c67d30 EFLAGS: 00010293
> RAX: 00000001436d0000 RBX: 0000000000000000 RCX: ffffffff8130a760
> RDX: ffff888140748000 RSI: ffffffff8130a76a RDI: 0000000000000007
> RBP: ffff8881436d0000 R08: 00000000000000fe R09: ffffed10286da800
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: ffffffff81945766 R14: ffff888143557944 R15: ffffffff81943b80
> FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000018 CR3: 000000000b08e000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  kasan_slab_free_mempool include/linux/kasan.h:202 [inline]
>  kasan_poison_element mm/mempool.c:107 [inline]
>  add_element mm/mempool.c:124 [inline]
>  mempool_init_node+0x37e/0x580 mm/mempool.c:205
>  mempool_create_node mm/mempool.c:269 [inline]
>  mempool_create+0x76/0xc0 mm/mempool.c:254
>  mempool_create_kmalloc_pool include/linux/mempool.h:88 [inline]
>  init_caches fs/ceph/super.c:785 [inline]
>  init_ceph+0x193/0x2d7 fs/ceph/super.c:1261
>  do_one_initcall+0x103/0x650 init/main.c:1212
>  do_initcall_level init/main.c:1285 [inline]
>  do_initcalls init/main.c:1301 [inline]
>  do_basic_setup init/main.c:1321 [inline]
>  kernel_init_freeable+0x600/0x684 init/main.c:1521
>  kernel_init+0xd/0x1b8 init/main.c:1410
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> Modules linked in:
> CR2: 0000000000000018
> ---[ end trace d7568b3491dd0938 ]---
> RIP: 0010:nearest_obj include/linux/slub_def.h:169 [inline]
> RIP: 0010:____kasan_slab_free+0x19/0x110 mm/kasan/common.c:350
> Code: 00 48 c7 c0 fb ff ff ff c3 cc cc cc cc cc cc cc cc 41 55 49 89 d5 41 54
> 49 89 fc 48 89 f7 55 48 89 f5 53 89 cb e8 f7 27 7e ff <41> 8b 7c 24 18 48 be
> 00 00 00 00 00 16 00 00 48 c1 e8 0c 48 89 c1
> RSP: 0000:ffffc90000c67d30 EFLAGS: 00010293
> RAX: 00000001436d0000 RBX: 0000000000000000 RCX: ffffffff8130a760
> RDX: ffff888140748000 RSI: ffffffff8130a76a RDI: 0000000000000007
> RBP: ffff8881436d0000 R08: 00000000000000fe R09: ffffed10286da800
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: ffffffff81945766 R14: ffff888143557944 R15: ffffffff81943b80
> FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000018 CR3: 000000000b08e000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

