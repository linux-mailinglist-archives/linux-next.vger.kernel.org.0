Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE3A2CFA2B
	for <lists+linux-next@lfdr.de>; Sat,  5 Dec 2020 08:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbgLEHCu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Sat, 5 Dec 2020 02:02:50 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:45895 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgLEHCu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 5 Dec 2020 02:02:50 -0500
Received: by mail-io1-f69.google.com with SMTP id x7so7253960ion.12
        for <linux-next@vger.kernel.org>; Fri, 04 Dec 2020 23:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=r+mWvnbTKF/iYjNtm6BSrreLwJ0c5mkcYjnkGdZvHNM=;
        b=Vp/YCcrUKmm4J72aAn0HVvgJsziRRogy8NkO0NuX6GQwkd62k121TipgvlaB7r8an+
         Z5tcIAk2Ux6RIACtkLxxlcXxRWiTloqHD7tjd4m7+wcV9ziJIExsI03uSDJn1Pcffb3I
         ArsH5YPZgfQczSANIffCARBuZZaMyDioaHC5OpVywjDdky6/p/Lx3oXpdmZLh0y9DZ0K
         PpaCkgwOjtpn2gn5Vo0/wIm0TOtuQpMWfrLagNobveqctQ2V8CtT/4eJ7zDvb+oB+i5y
         3/QAiZcc2eKiXcnakf1YqkfS1h919pJlaXEHStoAAEU4CNQ6dTQ9P6r+lj4Fd3QA6/KE
         PnPQ==
X-Gm-Message-State: AOAM530n2uvcJsLFXzt1vUDR4Zno+C/9xQZ/yIlMBkxmIouNstwAZZjs
        nZ4vGJHXDWjfGGepIP8o0YbEZKb74wQizOXISbycNzzjp4IG
X-Google-Smtp-Source: ABdhPJyBgtK7p9aLOHNVPXn1dGBFY6vna5NDZRZAoxGU+wCiuep5dkt026YZO7uV67Vf8QwQNWiRogqa13TbDTABrHP5iqH/vv/+
MIME-Version: 1.0
X-Received: by 2002:a92:40c6:: with SMTP id d67mr10519386ill.236.1607151729169;
 Fri, 04 Dec 2020 23:02:09 -0800 (PST)
Date:   Fri, 04 Dec 2020 23:02:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000eadc6b05b5b22baf@google.com>
Subject: linux-next boot error: kernel BUG at mm/page_alloc.c:LINE!
From:   syzbot <syzbot+6db3aa7ac26c2c53bf44@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-next@vger.kernel.org, rppt@kernel.org,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    2996bd3f Add linux-next specific files for 20201204
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16e3f06d500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94ba7fafa89f1c3f
dashboard link: https://syzkaller.appspot.com/bug?extid=6db3aa7ac26c2c53bf44
compiler:       gcc (GCC) 10.1.0-syz 20200507

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6db3aa7ac26c2c53bf44@syzkaller.appspotmail.com

Zone ranges:
  DMA      [mem 0x0000000000001000-0x0000000000ffffff]
  DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000023fffffff]
  Device   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000000001000-0x000000000009efff]
  node   0: [mem 0x0000000000100000-0x00000000bfffcfff]
  node   0: [mem 0x0000000100000000-0x000000013fffffff]
  node   1: [mem 0x0000000140000000-0x000000023fffffff]
Initmem setup node 0 [mem 0x0000000000001000-0x000000013fffffff]
DMA: Zeroed struct page in unavailable ranges: 98
DMA32: Zeroed struct page in unavailable ranges: 3
Initmem setup node 1 [mem 0x0000000140000000-0x000000023fffffff]
kasan: KernelAddressSanitizer initialized
ACPI: PM-Timer IO Port: 0xb008
ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
Using ACPI (MADT) for SMP configuration information
smpboot: Allowing 2 CPUs, 0 hotplug CPUs
PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
PM: hibernation: Registered nosave memory: [mem 0xbfffd000-0xbfffffff]
PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xfffbbfff]
PM: hibernation: Registered nosave memory: [mem 0xfffbc000-0xffffffff]
[mem 0xc0000000-0xfffbbfff] available for PCI devices
Booting paravirtualized kernel on KVM
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_node_ids:2
percpu: Embedded 64 pages/cpu s223240 r8192 d30712 u1048576
kvm-guest: stealtime: cpu 0, msr b9c1fb80
kvm-guest: PV spinlocks enabled
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Built 2 zonelists, mobility grouping on.  Total pages: 2064262
Policy zone: Normal
Kernel command line: earlyprintk=serial oops=panic panic_on_warn=1 nmi_watchdog=panic panic=86400 net.ifnames=0 sysctl.kernel.hung_task_all_cpu_backtrace=1 ima_policy=tcb watchdog_thresh=55 workqueue.watchdog_thresh=140 kvm-intel.nested=1 nf-conntrack-ftp.ports=20000 nf-conntrack-tftp.ports=20000 nf-conntrack-sip.ports=20000 nf-conntrack-irc.ports=20000 nf-conntrack-sane.ports=20000 vivid.n_devs=16 vivid.multiplanar=1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 netrom.nr_ndevs=16 rose.rose_ndevs=16 spec_store_bypass_disable=prctl numa=fake=2 nopcid dummy_hcd.num=8 binder.debug_mask=0 rcupdate.rcu_expedited=1 root=/dev/sda console=ttyS0 vsyscall=native BOOT_IMAGE=/vmlinuz root=/dev/sda1 console=ttyS0 earlyprintk=serial vsyscall=native oops=panic panic_on_warn=1 nmi_watchdog=panic panic=86400 net.ifnames=0 sysctl.kernel.hung_task_all_cpu_backtrace=1
mem auto-init: stack:off, heap alloc:on, heap free:off
page:(____ptrval____) refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11
flags: 0x7ff00000000000()
raw: 007ff00000000000 ffffea0000000448 ffffea0000000448 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(pfn & ((1 << order) - 1))
------------[ cut here ]------------
kernel BUG at mm/page_alloc.c:1015!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc6-next-20201204-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__free_one_page+0xa49/0xe00 mm/page_alloc.c:1015
Code: ef e8 ab 39 f7 ff 0f 0b 48 c7 c6 e0 49 76 89 4c 89 ff e8 9a 39 f7 ff 0f 0b 0f 0b 48 c7 c6 40 4a 76 89 4c 89 ff e8 87 39 f7 ff <0f> 0b 48 c7 c6 a0 4a 76 89 4c 89 ff e8 76 39 f7 ff 0f 0b 41 83 fc
RSP: 0000:ffffffff8b407c98 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffffffff8b49bc00 RSI: ffffffff88c8495e RDI: 0000000000000003
RBP: 0000000000000011 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff88c84940 R11: 0000000000000000 R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000003 R15: ffffea0000000440
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000b48e000 CR4: 00000000000406b0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 free_one_page+0x7b/0x1e0 mm/page_alloc.c:1447
 __free_pages_ok+0x4af/0xec0 mm/page_alloc.c:1538
 __free_pages_memory mm/memblock.c:2021 [inline]
 __free_memory_core mm/memblock.c:2037 [inline]
 free_low_memory_core_early mm/memblock.c:2060 [inline]
 memblock_free_all+0x240/0x332 mm/memblock.c:2100
 mem_init+0x1d/0x2b5 arch/x86/mm/init_64.c:1292
 mm_init+0xa4/0xcc init/main.c:831
 start_kernel+0x184/0x4bc init/main.c:907
 secondary_startup_64_no_verify+0xb0/0xbb
Modules linked in:
random: get_random_bytes called from init_oops_id kernel/panic.c:546 [inline] with crng_init=0
random: get_random_bytes called from init_oops_id kernel/panic.c:543 [inline] with crng_init=0
random: get_random_bytes called from print_oops_end_marker kernel/panic.c:556 [inline] with crng_init=0
random: get_random_bytes called from oops_exit+0x58/0x80 kernel/panic.c:567 with crng_init=0
---[ end trace 72f44cbe4160a0f3 ]---
RIP: 0010:__free_one_page+0xa49/0xe00 mm/page_alloc.c:1015
Code: ef e8 ab 39 f7 ff 0f 0b 48 c7 c6 e0 49 76 89 4c 89 ff e8 9a 39 f7 ff 0f 0b 0f 0b 48 c7 c6 40 4a 76 89 4c 89 ff e8 87 39 f7 ff <0f> 0b 48 c7 c6 a0 4a 76 89 4c 89 ff e8 76 39 f7 ff 0f 0b 41 83 fc
RSP: 0000:ffffffff8b407c98 EFLAGS: 00010086
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffffffff8b49bc00 RSI: ffffffff88c8495e RDI: 0000000000000003
RBP: 0000000000000011 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff88c84940 R11: 0000000000000000 R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000003 R15: ffffea0000000440
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000b48e000 CR4: 00000000000406b0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
