Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E832CD422
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 12:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbgLCLBL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 3 Dec 2020 06:01:11 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:33192 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgLCLBG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 06:01:06 -0500
Received: by mail-il1-f199.google.com with SMTP id a10so1299676iln.0
        for <linux-next@vger.kernel.org>; Thu, 03 Dec 2020 03:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=s7wpIQYD7HOHVPoKzCJyXbPlEInW7mVrYwkI7T/QRJQ=;
        b=REjJMBXI/HWSlhojC+cvzALieVL7S/IWAWoCDcB3khj+36UqDqHv3AmdLqHfe0aXzU
         CZ1z0oOtVKNJFrujSZYvUca1c6txYRkPwVNBqLt1Pm+UO67YMdLC+ZUv69CG55Ichmyv
         ij6j1QNye/yLqzylseS5l7Gh7CTJ0MPxGg+bIInl3g/zsh6t7OVnelhC6sss3jalc9MA
         2s3Q7LK4pT3NjRNauFUWbYJiGuxQJJ7qtv9o3fyDyOUasUsA6yDMmMFvqNtUIHv/O2Br
         QAM5vAz77UIOJAsM6yERrUaawXhDMdGdzCbEn00HcdCmuXWCINvWMYnT1DpKYx+/gU+i
         LBbg==
X-Gm-Message-State: AOAM533/Q/0t9a/ICleCFAOjzo1NNWp8eb97D4qYrfXh/x3RjZWb0Kmi
        U2g2mf2/6i6zBuvXOaZg3yNGhpiaKhkaqFFN7kIjCTKqA5Pr
X-Google-Smtp-Source: ABdhPJweJ8AbF1iH6ngtDCAfGuAVk6pJ26+tLMvrhopTnHYj37h30tcZI/Ams8E4TM/ELH/1j3as+gDu73pJP+Bvo/hvV1mBebiW
MIME-Version: 1.0
X-Received: by 2002:a5e:d717:: with SMTP id v23mr2665788iom.60.1606993225116;
 Thu, 03 Dec 2020 03:00:25 -0800 (PST)
Date:   Thu, 03 Dec 2020 03:00:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056f29e05b58d448f@google.com>
Subject: linux-next boot error: kernel BUG at include/linux/page-flags.h:LINE!
From:   syzbot <syzbot+86800a8349c0f3f9466e@syzkaller.appspotmail.com>
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

HEAD commit:    bfd521e1 Add linux-next specific files for 20201203
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14d5d403500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76090eb4ba939f87
dashboard link: https://syzkaller.appspot.com/bug?extid=86800a8349c0f3f9466e
compiler:       gcc (GCC) 10.1.0-syz 20200507

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+86800a8349c0f3f9466e@syzkaller.appspotmail.com

NODE_DATA(1) allocated [mem 0x23fff8000-0x23fffcfff]
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
DMA: Zeroed struct page in unavailable ranges: 97
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
percpu: Embedded 64 pages/cpu s223304 r8192 d30648 u1048576
kvm-guest: stealtime: cpu 0, msr b9e1fb80
kvm-guest: PV spinlocks enabled
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Built 2 zonelists, mobility grouping on.  Total pages: 2064262
Policy zone: Normal
Kernel command line: earlyprintk=serial oops=panic panic_on_warn=1 nmi_watchdog=panic panic=86400 net.ifnames=0 sysctl.kernel.hung_task_all_cpu_backtrace=1 ima_policy=tcb watchdog_thresh=55 workqueue.watchdog_thresh=140 kvm-intel.nested=1 nf-conntrack-ftp.ports=20000 nf-conntrack-tftp.ports=20000 nf-conntrack-sip.ports=20000 nf-conntrack-irc.ports=20000 nf-conntrack-sane.ports=20000 vivid.n_devs=16 vivid.multiplanar=1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 netrom.nr_ndevs=16 rose.rose_ndevs=16 spec_store_bypass_disable=prctl numa=fake=2 nopcid dummy_hcd.num=8 binder.debug_mask=0 rcupdate.rcu_expedited=1 root=/dev/sda console=ttyS0 vsyscall=native BOOT_IMAGE=/vmlinuz root=/dev/sda1 console=ttyS0 earlyprintk=serial vsyscall=native oops=panic panic_on_warn=1 nmi_watchdog=panic panic=86400 net.ifnames=0 sysctl.kernel.hung_task_all_cpu_backtrace=1
mem auto-init: stack:off, heap alloc:on, heap free:off
page:ffffea0000000000 is uninitialized and poisoned
raw: ffffffffffffffff ffffea0000000008 ffffea0000000008 ffffffffffffffff
raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
------------[ cut here ]------------
kernel BUG at include/linux/page-flags.h:356!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-rc6-next-20201203-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__SetPageReserved include/linux/page-flags.h:356 [inline]
RIP: 0010:reserve_bootmem_region+0xc8/0x128 mm/page_alloc.c:1522
Code: e8 03 42 80 3c 30 00 74 08 48 89 ef e8 a1 54 c3 f8 48 8b 45 00 0f ba e0 10 73 11 48 c7 c6 00 e9 55 89 48 89 ef e8 08 53 b1 f8 <0f> 0b 4c 89 e8 48 c1 e8 03 42 80 3c 30 00 74 08 4c 89 ef e8 70 54
RSP: 0000:ffffffff8b007d98 EFLAGS: 00010096
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffffffff8b09b000 RSI: ffffffff88b71174 RDI: 0000000000000003
RBP: ffffea0000000000 R08: ffffffffffffffff R09: 0000000000000001
R10: ffffffff88b7111b R11: 0000000000000000 R12: 0000000000000010
R13: ffffea0000000008 R14: dffffc0000000000 R15: ffffffff8b007e20
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000b08e000 CR4: 00000000000406b0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 free_low_memory_core_early mm/memblock.c:2051 [inline]
 memblock_free_all+0xf0/0x2c7 mm/memblock.c:2100
 mem_init+0x1d/0x2b5 arch/x86/mm/init_64.c:1292
 mm_init+0xa4/0xcc init/main.c:831
 start_kernel+0x184/0x491 init/main.c:907
 secondary_startup_64_no_verify+0xb0/0xbb
Modules linked in:
random: get_random_bytes called from init_oops_id kernel/panic.c:546 [inline] with crng_init=0
random: get_random_bytes called from init_oops_id kernel/panic.c:543 [inline] with crng_init=0
random: get_random_bytes called from print_oops_end_marker kernel/panic.c:556 [inline] with crng_init=0
random: get_random_bytes called from oops_exit+0x58/0x80 kernel/panic.c:567 with crng_init=0
---[ end trace 9fcd7b4745fb867f ]---
RIP: 0010:__SetPageReserved include/linux/page-flags.h:356 [inline]
RIP: 0010:reserve_bootmem_region+0xc8/0x128 mm/page_alloc.c:1522
Code: e8 03 42 80 3c 30 00 74 08 48 89 ef e8 a1 54 c3 f8 48 8b 45 00 0f ba e0 10 73 11 48 c7 c6 00 e9 55 89 48 89 ef e8 08 53 b1 f8 <0f> 0b 4c 89 e8 48 c1 e8 03 42 80 3c 30 00 74 08 4c 89 ef e8 70 54
RSP: 0000:ffffffff8b007d98 EFLAGS: 00010096
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffffffff8b09b000 RSI: ffffffff88b71174 RDI: 0000000000000003
RBP: ffffea0000000000 R08: ffffffffffffffff R09: 0000000000000001
R10: ffffffff88b7111b R11: 0000000000000000 R12: 0000000000000010
R13: ffffea0000000008 R14: dffffc0000000000 R15: ffffffff8b007e20
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000b08e000 CR4: 00000000000406b0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
