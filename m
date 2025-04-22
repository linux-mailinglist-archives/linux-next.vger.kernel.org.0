Return-Path: <linux-next+bounces-6327-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F04A96A57
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 14:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F5F3A1F28
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666F027CCDF;
	Tue, 22 Apr 2025 12:41:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED33202960
	for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325691; cv=none; b=U0NdqnMS51VcADxYrqLZAx13Xw530YEwWbHo0RK/b3DmmwsX004wwXbDadt0ap4xSuYeaFB1zFJRejcpKJGJEuTRGDF1zdmNvoMiIGc2AVrrZoFAjn+aFOScQf4WuNsH/04V0GGfVrgMISulHEs6OAtFJTQB9CDjz7nKAyzWYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325691; c=relaxed/simple;
	bh=yrR7LOXwJQk7YQ1++keSJbA50DlyDggdAVg3h1c50S4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PDOe5KaUWw80es6esMVVw65rb8O3b1dCHsQ7nSy2g2sq6KsKRZ0zlKmrRsgvysaU4jAi0JCTTJK8G+CcP9j5xIGagdNXIBDd2hkO9M5lKlyzS/sJK8v7n6ZrE3aVULT6JX3D72m68xSM9wUZZTnfiESMs22pCKe+s8yKIp0DMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3d8fc035433so66320875ab.1
        for <linux-next@vger.kernel.org>; Tue, 22 Apr 2025 05:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325688; x=1745930488;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHaMmz1KAcplF6Q361yXlo+F2t66/ZiHyob+lJweXSw=;
        b=aQFtjRnPaKQjUO0b/wkfAANPIUEJ715YWXZ3+BUWZOyn4Oh6LWYykGn04kbsYG9IzS
         LGl0ZhKtqGFXeRCsZPS2EPdVIlyPI3Bc0+Ea0EMKGMCr6r9W2kzNVWoCwLyWlrUSB9Xq
         pdpKawVk4RXIOtt6660n7SZ+VRuVRwN00OO8Q/4W9ppNvbxrxgVU5xbwMQK3DdEtpDXB
         KM8xyipHHER3u197xl5FT87qwJ8lw6VN8m8HlT/AL8llOHIvoct+fsV+L+2h+sHbep75
         DkyAbppKv2MIiWk+qx4jau3pFhE2v+X1Ey/H0GDNwjgkSWPRpBdF63fZqWiFnFdGKiUW
         vOaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWacxt6Tj8U1DwEpJ6VrXodcA1/0YhfoujYDRjH1BmCUmph6DCka/M63t3+9I9IQolnEutpcgsQjbfa@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSUNeM/jr7U3gafHSXkS93BZmnpTeYqi035UKt8Psc/iNaOew
	avZ+Sq3rqPIgYZTHqvhHFX242R4JbQ7eLqClkqCILZscau+ldzE6+ayTj1ULywrgU2uw43imiy+
	ATXFAu/gXR5O4FxXGzN5tBxoEsjE4ZzxYj8xxflCD/rW/yIb6Y94fefw=
X-Google-Smtp-Source: AGHT+IHm7TwyyFiErPZqJRZMqdjsfoBD/EOXnH9bRtYg+WVOwKN8X6SvbPB8XXmyVLL4nzY9TDLeb5+2xonzOlFmX0x3O4/WCJ0n
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b01:b0:3d6:d147:81c9 with SMTP id
 e9e14a558f8ab-3d88ee0018fmr178968965ab.12.1745325688677; Tue, 22 Apr 2025
 05:41:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 05:41:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68078e78.050a0220.8500a.0014.GAE@google.com>
Subject: [syzbot] [trace?] linux-next test error: WARNING in trace_event_raw_init
From: syzbot <syzbot+52d4b07bbd2e3a104dc9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, rostedt@goodmis.org, sfr@canb.auug.org.au, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    2c9c612abeb3 Add linux-next specific files for 20250422
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1624afac580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbba13bd7967a7c4=
b
dashboard link: https://syzkaller.appspot.com/bug?extid=3D52d4b07bbd2e3a104=
dc9
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b491f42bb495/disk-=
2c9c612a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a3ea2226cf2/vmlinux-=
2c9c612a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cf779772656e/bzI=
mage-2c9c612a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+52d4b07bbd2e3a104dc9@syzkaller.appspotmail.com

CPU topo: Max. threads per core:   2
CPU topo: Num. cores per package:     1
CPU topo: Num. threads per package:   2
CPU topo: Allowing 2 present CPUs plus 0 hotplug CPUs
PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
PM: hibernation: Registered nosave memory: [mem 0xbfffd000-0xffffffff]
[mem 0xc0000000-0xfffbbfff] available for PCI devices
Booting paravirtualized kernel on KVM
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idle_ns: 19112604462750000 ns
setup_percpu: NR_CPUS:8 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:2
percpu: Embedded 70 pages/cpu s245960 r8192 d32568 u1048576
kvm-guest: PV spinlocks enabled
PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
Kernel command line: earlyprintk=3Dserial net.ifnames=3D0 sysctl.kernel.hun=
g_task_all_cpu_backtrace=3D1 ima_policy=3Dtcb nf-conntrack-ftp.ports=3D2000=
0 nf-conntrack-tftp.ports=3D20000 nf-conntrack-sip.ports=3D20000 nf-conntra=
ck-irc.ports=3D20000 nf-conntrack-sane.ports=3D20000 binder.debug_mask=3D0 =
rcupdate.rcu_expedited=3D1 rcupdate.rcu_cpu_stall_cputime=3D1 no_hash_point=
ers page_owner=3Don sysctl.vm.nr_hugepages=3D4 sysctl.vm.nr_overcommit_huge=
pages=3D4 secretmem.enable=3D1 sysctl.max_rcu_stall_to_panic=3D1 msr.allow_=
writes=3Doff coredump_filter=3D0xffff root=3D/dev/sda console=3DttyS0 vsysc=
all=3Dnative numa=3Dfake=3D2 kvm-intel.nested=3D1 spec_store_bypass_disable=
=3Dprctl nopcid vivid.n_devs=3D64 vivid.multiplanar=3D1,2,1,2,1,2,1,2,1,2,1=
,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,=
1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 netrom.nr_ndevs=3D32 rose.rose_ndevs=3D32 s=
mp.csd_lock_timeout=3D100000 watchdog_thresh=3D55 workqueue.watchdog_thresh=
=3D140 sysctl.net.core.netdev_unregister_timeout_secs=3D140 dummy_hcd.num=
=3D32 max_loop=3D32 nbds_max=3D32 panic_on_warn
Unknown kernel command line parameters "spec_store_bypass_disable=3Dprctl n=
bds_max=3D32 BOOT_IMAGE=3D/boot/bzImage", will be passed to user space.
random: crng init done
printk: log buffer data + meta data: 262144 + 917504 =3D 1179648 bytes
software IO TLB: area num 2.
Fallback order for Node 0: 0 1=20
Fallback order for Node 1: 1 0=20
Built 2 zonelists, mobility grouping on.  Total pages: 2097051
Policy zone: Normal
mem auto-init: stack:all(zero), heap alloc:on, heap free:off
stackdepot: allocating hash table via alloc_large_system_hash
stackdepot hash table entries: 1048576 (order: 12, 16777216 bytes, linear)
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D2
allocated 167772160 bytes of page_ext
Node 0, zone      DMA: page owner found early allocated 0 pages
Node 0, zone    DMA32: page owner found early allocated 21222 pages
Node 0, zone   Normal: page owner found early allocated 0 pages
Node 1, zone   Normal: page owner found early allocated 19843 pages
Kernel/User page tables isolation: enabled
Dynamic Preempt: full
Running RCU self tests
Running RCU synchronous self tests
rcu: Preemptible hierarchical RCU implementation.
rcu: 	RCU lockdep checking is enabled.
rcu: 	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.
rcu: 	RCU callback double-/use-after-free debug is enabled.
rcu: 	RCU debug extended QS entry/exit.
	All grace periods are expedited (rcu_expedited).
	Trampoline variant of Tasks RCU enabled.
	Tracing variant of Tasks RCU enabled.
rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D2
Running RCU synchronous self tests
RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=3D1 rcu_task_=
cpu_ids=3D2.
RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=3D1 rcu=
_task_cpu_ids=3D2.
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:596 test_event_printk=
 kernel/trace/trace_events.c:596 [inline]
WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:596 trace_event_raw_i=
nit+0xbda/0x1170 kernel/trace/trace_events.c:616
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.15.0-rc3-next-20250422-s=
yzkaller #0 PREEMPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 02/12/2025
RIP: 0010:test_event_printk kernel/trace/trace_events.c:596 [inline]
RIP: 0010:trace_event_raw_init+0xbda/0x1170 kernel/trace/trace_events.c:616
Code: 89 d8 48 83 c4 48 5b 41 5c 41 5d 41 5e 41 5f 5d e9 1b 1e 64 0a 80 3d =
0e 26 7e 0e 01 0f 85 7e 03 00 00 e8 79 50 f7 ff eb d5 90 <0f> 0b 90 4c 89 f=
6 48 83 e6 01 31 ff e8 45 55 f7 ff 4c 89 f3 49 83
RSP: 0000:ffffffff8ea07e30 EFLAGS: 00010002
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8ea965c0
RDX: 0000000000000000 RSI: 0000000000000020 RDI: 0000000000000000
RBP: 0000000000000020 R08: ffffffff81cbc889 R09: ffffffff8ebf6886
R10: ffffffff8ebf6886 R11: ffffffff8ebf6886 R12: 0000000000000005
R13: ffffffff8ebf67e0 R14: 0000000000000020 R15: 0000000000000028
FS:  0000000000000000(0000) GS:ffff888124f9f000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000eb38000 CR4: 00000000000000b0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 event_init kernel/trace/trace_events.c:3111 [inline]
 event_trace_enable+0x1f3/0x3a0 kernel/trace/trace_events.c:4455
 trace_event_init+0x13/0x20 kernel/trace/trace_events.c:4548
 trace_init+0xf/0x40 kernel/trace/trace.c:11070
 start_kernel+0x206/0x510 init/main.c:994
 x86_64_start_reservations+0x2a/0x30 arch/x86/kernel/head64.c:304
 x86_64_start_kernel+0x66/0x70 arch/x86/kernel/head64.c:285
 common_startup_64+0x13e/0x147
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

