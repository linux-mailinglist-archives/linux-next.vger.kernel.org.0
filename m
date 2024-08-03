Return-Path: <linux-next+bounces-3220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B0946837
	for <lists+linux-next@lfdr.de>; Sat,  3 Aug 2024 08:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD0E3B2115A
	for <lists+linux-next@lfdr.de>; Sat,  3 Aug 2024 06:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3C514D2B8;
	Sat,  3 Aug 2024 06:38:22 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CB641A8E
	for <linux-next@vger.kernel.org>; Sat,  3 Aug 2024 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722667102; cv=none; b=fHz+q9oM4k2Y8bIUFux9r+ldhxsUnWlgmIzoCZ7frs5lJ19koCvSJc2lWWvL0XZU0YbRW/5hWwXXfFfm1IYFp4zV1bJY/UUUA0hQ63myf+6y2uvMwjj5eeZOq6hSwPOqstK6yufTygnlYkUUKEPWYQDZR2rVud8/RhVjXy+ML0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722667102; c=relaxed/simple;
	bh=zQL5tacdZJS7FolWbOfYx7hyvXV/x2KEk7bHdRiMWmo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fSfSsILyobayVjOk9IkNpwHkUx1PECSaOEPY/FEsadG6SqXC0rhLPCkpCx8ijO14+vikqD9gwiCyyJaLDdMUddwTpBYFQPAiwaCXLz1vpPMJUeN8ggFllNZ+lwmsqx2AAT+d7G1GWQ7DVFjvmSgNKzOWZJViofe3CnmP7M8PYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39a06767cd3so134762355ab.0
        for <linux-next@vger.kernel.org>; Fri, 02 Aug 2024 23:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722667100; x=1723271900;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxpkPNZRt0bGtsa2noBOupZtwqWb53ezzFJmjsuefJc=;
        b=ROZfMXsQl4trzjTtBdfMxnIO2TNWvTSvCQxJrwgwOJ93JBM+ozGycA4ljVRq14/enM
         wyhGtNQrMAuQfWk0zTYRJLiUy46onb15KKsClBoE5/aBQikkaKjRTbxAKAwVtz0BnrWS
         Cy+o83bHCfCeK6KtnnjHccT4013DloRVVgrBbOqZG5iH2+mljcCrFMu4c0h3e1sfVFUn
         Pn3pttGqRVMuiE9Gi19UMr/xoLkc/DDKHeKr/VWatvMIcOdzF9iBTY6NPiQntWdVQW9J
         xBG8LLg6ZmWgwhHQGBCOYr87MK5wM1UMM6nwD+D0F4UoAxJILaDR9Vw6dLLOQpdnykt+
         yrkA==
X-Forwarded-Encrypted: i=1; AJvYcCXROSmk4p7+tfiVmffd3nDZ4J7CwXXhl3mjC1mncSYkiE4/8eh+JC4WbH/ASFPgB8zlzVF9YjFJS9jEV8/Rg8zV/d258+HqAlHJ9g==
X-Gm-Message-State: AOJu0YwsQkjbRyM2cNRkEt69Dxe/7ky6u5m2qO/xziq/TYHoClH4ELvM
	JTdj9w9/BIQnK0/TYUzcdxTpE8PIHwMLepJaXa9O35ByfNirByOukQ4fEoWLGq5rc86oHT0sj2p
	AQR1aRwkO3ql+vY1ItsEPzwnh7GnYne+m86RyF/i7llzNjpWQlZB+IWY=
X-Google-Smtp-Source: AGHT+IHBqnb9S/zm/IFIH9cTGejgie9A6OWkuiZc3BVMpZ5nZore5Z/zmUQRkbNYzBWnFMrUEn+e45VEWAEnUyRORPkhcH80yq+T
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:15c3:b0:39a:e8c5:ba1b with SMTP id
 e9e14a558f8ab-39b1fc6cfa8mr3755695ab.6.1722667099790; Fri, 02 Aug 2024
 23:38:19 -0700 (PDT)
Date: Fri, 02 Aug 2024 23:38:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008caf56061ec1b051@google.com>
Subject: [syzbot] [kernel?] linux-next test error: WARNING in __static_call_update
From: syzbot <syzbot+01e01e53b1a7ac908deb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    cd19ac2f9032 Add linux-next specific files for 20240730
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D129583bd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd30cbb2338538ae=
9
dashboard link: https://syzkaller.appspot.com/bug?extid=3D01e01e53b1a7ac908=
deb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/95309178e193/disk-=
cd19ac2f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/beafc3338d59/vmlinux-=
cd19ac2f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a588fe0099e3/bzI=
mage-cd19ac2f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+01e01e53b1a7ac908deb@syzkaller.appspotmail.com

Linux version 6.11.0-rc1-next-20240730-syzkaller (syzkaller@syzkaller) (Deb=
ian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40) #0 SMP PRE=
EMPT_DYNAMIC now
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/static_call_inline.c:153 __static_call_upd=
ate+0x5ce/0x5e0 kernel/static_call_inline.c:153
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.11.0-rc1-next-20240730-syz=
kaller #0
RIP: 0010:__static_call_update+0x5ce/0x5e0 kernel/static_call_inline.c:153
Code: 8b 04 25 28 00 00 00 48 3b 84 24 a0 00 00 00 75 1e 48 8d 65 d8 5b 41 =
5c 41 5d 41 5e 41 5f 5d e9 68 74 04 0a e8 63 e0 d1 ff 90 <0f> 0b 90 eb a8 e=
8 58 1a fa 09 0f 1f 84 00 00 00 00 00 90 90 90 90
RSP: 0000:ffffffff8e607d20 EFLAGS: 00010093 ORIG_RAX: 0000000000000000
RAX: ffffffff81c1da7d RBX: 0000000000000000 RCX: ffffffff8e694680
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffff8e607e18 R08: ffffffff81c1d597 R09: 1ffffffff1cc0f94
R10: dffffc0000000000 R11: fffffbfff1cc0f95 R12: dffffc0000000000
R13: ffffffff8e30be88 R14: ffffffff8bc6f238 R15: ffffffff8efcb480
FS:  0000000000000000(0000) GS:ffffffff9174d000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88800008a000 CR3: 000000001193e000 CR4: 00000000000000b0
Call Trace:
 <TASK>
 </TASK>
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<0000000000000000>] 0x0
softirqs last  enabled at (0): [<0000000000000000>] 0x0
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
static_key_enable_cpuslocked(): static key 'security_hook_active_locked_dow=
n_0+0x0/0x20' used before call to jump_label_init()
WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:199 static_key_enable_cpusloc=
ked+0x186/0x260 kernel/jump_label.c:199
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G        W          6.11.0-rc1-=
next-20240730-syzkaller #0
Tainted: [W]=3DWARN
RIP: 0010:static_key_enable_cpuslocked+0x186/0x260 kernel/jump_label.c:199
Code: 9e 8e 5b 41 5e 41 5f 5d e9 e7 a0 fb 09 e8 d2 8d ca ff 90 48 c7 c7 40 =
ae 13 8c 48 c7 c6 66 c6 08 8e 4c 89 fa e8 bb 64 8c ff 90 <0f> 0b 90 90 e9 c=
2 fe ff ff e8 ac 8d ca ff 90 0f 0b 90 e9 21 ff ff
RSP: 0000:ffffffff8e607e40 EFLAGS: 00010046 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: ffffffff95134b80 RCX: ffffffff8e694680
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff81559472 R09: 1ffffffff1d025ef
R10: dffffc0000000000 R11: fffffbfff1d025f0 R12: ffffffff8e30be80
R13: dffffc0000000000 R14: dffffc0000000000 R15: ffffffff95134b80
FS:  0000000000000000(0000) GS:ffffffff9174d000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88800008a000 CR3: 000000001193e000 CR4: 00000000000000b0
Call Trace:
 <TASK>
 </TASK>
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<0000000000000000>] 0x0
softirqs last  enabled at (0): [<0000000000000000>] 0x0
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---
Command line: BOOT_IMAGE=3D/boot/bzImage root=3D/dev/sda1 console=3DttyS0
KERNEL supported cpus:
  Intel GenuineIntel
  AMD AuthenticAMD
BIOS-provided physical RAM map:
BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
BIOS-e820: [mem 0x0000000000100000-0x00000000bfffcfff] usable
BIOS-e820: [mem 0x00000000bfffd000-0x00000000bfffffff] reserved
BIOS-e820: [mem 0x00000000fffbc000-0x00000000ffffffff] reserved
BIOS-e820: [mem 0x0000000100000000-0x000000023fffffff] usable
printk: legacy bootconsole [earlyser0] enabled
ERROR: earlyprintk=3D earlyser already used
ERROR: earlyprintk=3D earlyser already used
**********************************************************
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**                                                      **
** This system shows unhashed kernel memory addresses   **
** via the console, logs, and other interfaces. This    **
** might reduce the security of your system.            **
**                                                      **
** If you see this message and you are not debugging    **
** the kernel, report this immediately to your system   **
** administrator!                                       **
**                                                      **
**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
**********************************************************
Malformed early option 'vsyscall'
nopcid: PCID feature disabled
NX (Execute Disable) protection: active
APIC: Static calls initialized
SMBIOS 2.4 present.
DMI: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/=
2024
DMI: Memory slots populated: 1/1
Hypervisor detected: KVM
kvm-clock: Using msrs 4b564d01 and 4b564d00
kvm-clock: using sched offset of 4847382850 cycles
clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb,=
 max_idle_ns: 881590591483 ns
tsc: Detected 2200.170 MHz processor
last_pfn =3D 0x240000 max_arch_pfn =3D 0x400000000
MTRR map: 4 entries (3 fixed + 1 variable; max 19), built from 8 variable M=
TRRs
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT =20
last_pfn =3D 0xbfffd max_arch_pfn =3D 0x400000000
found SMP MP-table at [mem 0x000f2a50-0x000f2a5f]
Using GB pages for direct mapping
ACPI: Early table checksum verification disabled
ACPI: RSDP 0x00000000000F27D0 000014 (v00 Google)
ACPI: RSDT 0x00000000BFFFFFA0 000038 (v01 Google GOOGRSDT 00000001 GOOG 000=
00001)
ACPI: FACP 0x00000000BFFFF330 0000F4 (v02 Google GOOGFACP 00000001 GOOG 000=
00001)
ACPI: DSDT 0x00000000BFFFD8C0 001A64 (v01 Google GOOGDSDT 00000001 GOOG 000=
00001)
ACPI: FACS 0x00000000BFFFD880 000040
ACPI: FACS 0x00000000BFFFD880 000040
ACPI: SRAT 0x00000000BFFFFE60 0000C8 (v03 Google GOOGSRAT 00000001 GOOG 000=
00001)
ACPI: APIC 0x00000000BFFFFDB0 000076 (v05 Google GOOGAPIC 00000001 GOOG 000=
00001)
ACPI: SSDT 0x00000000BFFFF430 000980 (v01 Google GOOGSSDT 00000001 GOOG 000=
00001)
ACPI: WAET 0x00000000BFFFFE30 000028 (v01 Google GOOGWAET 00000001 GOOG 000=
00001)
ACPI: Reserving FACP table memory at [mem 0xbffff330-0xbffff423]
ACPI: Reserving DSDT table memory at [mem 0xbfffd8c0-0xbffff323]
ACPI: Reserving FACS table memory at [mem 0xbfffd880-0xbfffd8bf]
ACPI: Reserving FACS table memory at [mem 0xbfffd880-0xbfffd8bf]
ACPI: Reserving SRAT table memory at [mem 0xbffffe60-0xbfffff27]
ACPI: Reserving APIC table memory at [mem 0xbffffdb0-0xbffffe25]
ACPI: Reserving SSDT table memory at [mem 0xbffff430-0xbffffdaf]
ACPI: Reserving WAET table memory at [mem 0xbffffe30-0xbffffe57]
SRAT: PXM 0 -> APIC 0x00 -> Node 0
SRAT: PXM 0 -> APIC 0x01 -> Node 0
ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0xbfffffff]
ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x23fffffff]
NUMA: Node 0 [mem 0x00000000-0x0009ffff] + [mem 0x00100000-0xbfffffff] -> [=
mem 0x00000000-0xbfffffff]
NUMA: Node 0 [mem 0x00000000-0xbfffffff] + [mem 0x100000000-0x23fffffff] ->=
 [mem 0x00000000-0x23fffffff]
Faking node 0 at [mem 0x0000000000000000-0x000000013fffffff] (5120MB)
Faking node 1 at [mem 0x0000000140000000-0x000000023fffffff] (4096MB)
NODE_DATA(0) allocated [mem 0x13fffa000-0x13fffffff]
NODE_DATA(1) allocated [mem 0x23fff7000-0x23fffcfff]
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
Initmem setup node 1 [mem 0x0000000140000000-0x000000023fffffff]
On node 0, zone DMA: 1 pages in unavailable ranges
On node 0, zone DMA: 97 pages in unavailable ranges
On node 0, zone Normal: 3 pages in unavailable ranges
kasan: KernelAddressSanitizer initialized
ACPI: PM-Timer IO Port: 0xb008
ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
ACPI: Using ACPI (MADT) for SMP configuration information
CPU topo: Max. logical packages:   1
CPU topo: Max. logical dies:       1
CPU topo: Max. dies per package:   1
CPU topo: Max. threads per core:   2
CPU topo: Num. cores per package:     1
CPU topo: Num. threads per package:   2
CPU topo: Allowing 2 present CPUs plus 0 hotplug CPUs
PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
PM: hibernation: Registered nosave memory: [mem 0xbfffd000-0xbfffffff]
PM: hibernation: Registered nosave memory: [mem 0xc0000000-0xfffbbfff]
PM: hibernation: Registered nosave memory: [mem 0xfffbc000-0xffffffff]
[mem 0xc0000000-0xfffbbfff] available for PCI devices
Booting paravirtualized kernel on KVM
clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_=
idle_ns: 19112604462750000 ns
setup_percpu: NR_CPUS:8 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:2
percpu: Embedded 74 pages/cpu s264328 r8192 d30584 u1048576
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
=3Dprctl nopcid vivid.n_devs=3D16 vivid.multiplanar=3D1,2,1,2,1,2,1,2,1,2,1=
,2,1,2,1,2 netrom.nr_ndevs=3D16 rose.rose_ndevs=3D16 smp.csd_lock_timeout=
=3D100000 watchdog_thresh=3D55 workqueue.watchdog_thresh=3D140 sysctl.net.c=
ore.netdev_unregister_timeout_secs=3D140 dummy_hcd.num=3D8 panic_on_warn=3D=
1 BOOT_IMAGE=3D/boot/bzImage root=3D/dev/sda1 console=3DttyS0
Unknown kernel command line parameters "spec_store_bypass_disable=3Dprctl B=
OOT_IMAGE=3D/boot/bzImage", will be passed to user space.
random: crng init done
Fallback order for Node 0: 0 1=20
Fallback order for Node 1: 1 0=20
Built 2 zonelists, mobility grouping on.  Total pages: 2097051
Policy zone: Normal
mem auto-init: stack:all(zero), heap alloc:on, heap free:off
stackdepot: allocating hash table via alloc_large_system_hash
stackdepot hash table entries: 1048576 (order: 12, 16777216 bytes, linear)
software IO TLB: area num 2.
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D2
allocated 167772160 bytes of page_ext
Node 0, zone      DMA: page owner found early allocated 0 pages
Node 0, zone    DMA32: page owner found early allocated 20582 pages
Node 0, zone   Normal: page owner found early allocated 0 pages
Node 1, zone   Normal: page owner found early allocated 20483 pages
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
RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=3D1.
RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=3D1.
NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
rcu: srcu_init: Setting srcu_struct sizes based on contention.
kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823bc0=
0000-0xffff88823be00000
Console: colour VGA+ 80x25
printk: legacy console [ttyS0] enabled
printk: legacy console [ttyS0] enabled
printk: legacy bootconsole [earlyser0] disabled
printk: legacy bootconsole [earlyser0] disabled
Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
... MAX_LOCKDEP_SUBCLASSES:  8
... MAX_LOCK_DEPTH:          48
... MAX_LOCKDEP_KEYS:        8192
... CLASSHASH_SIZE:          4096
... MAX_LOCKDEP_ENTRIES:     131072
... MAX_LOCKDEP_CHAINS:      262144
... CHAINHASH_SIZE:          131072
 memory used by lock dependency info: 20721 kB
 memory used for stack traces: 8320 kB
 per task-struct memory footprint: 1920 bytes
mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing=
=3D or the kernel.numa_balancing sysctl
ACPI: Core revision 20240322
APIC: Switch to symmetric I/O mode setup
x2apic enabled
APIC: Switched APIC routing to: physical x2apic
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D0 apic2=3D-1 pin2=3D-1
clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb6d394f62,=
 max_idle_ns: 440795316813 ns
Calibrating delay loop (skipped) preset value.. 4400.34 BogoMIPS (lpj=3D220=
01700)
Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer saniti=
zation
Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
Spectre V2 : Mitigation: IBRS
Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context swi=
tch
Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
RETBleed: Mitigation: IBRS
Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Ba=
rrier
Spectre V2 : User space: Mitigation: STIBP via prctl
Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via=
 prctl
MDS: Mitigation: Clear CPU buffers
TAA: Mitigation: Clear CPU buffers
MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'sta=
ndard' format.
Freeing SMP alternatives memory: 128K
pid_max: default: 32768 minimum: 301
LSM: initializing lsm=3Dlockdown,capability,landlock,yama,safesetid,tomoyo,=
apparmor,bpf,ima,evm
landlock: Up and running.
Yama: becoming mindful.
TOMOYO Linux initialized
AppArmor: AppArmor initialized
LSM support for eBPF active
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc=
 hugepage)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc h=
ugepage)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc=
)
Running RCU synchronous self tests
Running RCU synchronous self tests


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

