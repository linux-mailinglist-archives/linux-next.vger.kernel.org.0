Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF9130A41B
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 10:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhBAJLn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 04:11:43 -0500
Received: from ozlabs.org ([203.11.71.1]:36415 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232760AbhBAJKP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Feb 2021 04:10:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DThw35LmRz9tkv;
        Mon,  1 Feb 2021 20:09:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612170568;
        bh=ljBLYpfNdmAsSJfPZlQ4urBMboDGg46okkY8abAMm/g=;
        h=Date:From:To:Cc:Subject:From;
        b=gbLYfs9kmwEG1UuLUf+Ou7E5GaQVshynxXEuI+PrCGA/C7CCGtHZt2Qq2EO57/C2S
         ODZkYhWTyaU52KCy58C4hN5HjbH4njY8U3KFNxVosYzQjAaNHLHQPIWkEwPyh65upY
         2mh7zT33Aleh60XLRBim8PI+f1QXymOTfsxmpbaIAxRc77dCMn4PHi4fAx2svy5X/j
         1opvEwq8npKQjpOeUeN5b1P9NL3IpY0ZU9yjlQAXNM+i7/WnWxB4Z5Vv091VsN+dpk
         4+gpl7zFnl2GZtmaXwJkrT8ccnjVNL9opWAlOo6sS7xeaybUakJo8sGjrn+gF2tnAu
         gtNsPMEfXW+3A==
Date:   Mon, 1 Feb 2021 20:09:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: qemu boot failure after merge of the tip tree
Message-ID: <20210201200918.386682c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rtzDT0lOsqDmNa.g.71eRf_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rtzDT0lOsqDmNa.g.71eRf_
Content-Type: multipart/mixed; boundary="MP_/dkosMs+=xWfUNGc_JKUUXjP"

--MP_/dkosMs+=xWfUNGc_JKUUXjP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

After merging the tip tree, today's linux-next qemu boot test (powerpc
pseries_le_defconfig) failed like this:

[    0.005355][    T1] smp: Brought up 1 node, 1 CPU
[    0.005415][    T1] numa: Node 0 CPUs: 0
[    0.005496][    T1] BUG: Unable to handle kernel instruction fetch (NULL=
 pointer?)
[    0.005559][    T1] Faulting instruction address: 0x00000000
[    0.005613][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.005665][    T1] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUM=
A pSeries
[    0.005719][    T1] Modules linked in:
[    0.005754][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc6=
 #2
[    0.005808][    T1] NIP:  0000000000000000 LR: c0000000001a22ac CTR: 000=
0000000000001
[    0.005870][    T1] REGS: c0000000063a3860 TRAP: 0480   Not tainted  (5.=
11.0-rc6)
[    0.005933][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24002242  XER: 20000000
[    0.006014][    T1] CFAR: c0000000001a22a8 IRQMASK: 0=20
[    0.006014][    T1] GPR00: c0000000001a21ac c0000000063a3b00 c0000000014=
39400 0000000000000000=20
[    0.006014][    T1] GPR04: 0000000000000000 00000000000000c4 00000000000=
00001 c000000001509400=20
[    0.006014][    T1] GPR08: 0000000000000000 c0000000011f5af0 000000007ea=
a0000 0000000000000001=20
[    0.006014][    T1] GPR12: 0000000000000001 c000000001610000 c0000000063=
50f18 0000000000000001=20
[    0.006014][    T1] GPR16: c000000001507bb0 0000000000000000 c0000000012=
106b0 c00000000146dce0=20
[    0.006014][    T1] GPR20: c000000006054a90 0000000000000001 00000000000=
00000 00000000ffff8ad0=20
[    0.006014][    T1] GPR24: 00000000ffff8ad0 c000000006054a00 00000000000=
00000 c000000006055000=20
[    0.006014][    T1] GPR28: 0000000000000000 c000000006350f00 c0000000063=
50f00 c000000001472380=20
[    0.006590][    T1] NIP [0000000000000000] 0x0
[    0.006633][    T1] LR [c0000000001a22ac] build_sched_domains+0x47c/0x15=
00
[    0.006687][    T1] Call Trace:
[    0.006719][    T1] [c0000000063a3b00] [c0000000001a21ac] build_sched_do=
mains+0x37c/0x1500 (unreliable)
[    0.006794][    T1] [c0000000063a3c40] [c0000000001a42d0] sched_init_dom=
ains+0xe0/0x120
[    0.006858][    T1] [c0000000063a3c90] [c000000001075f38] sched_init_smp=
+0x50/0xc4
[    0.006922][    T1] [c0000000063a3cc0] [c0000000010545a4] kernel_init_fr=
eeable+0x1d4/0x398
[    0.006987][    T1] [c0000000063a3da0] [c000000000013144] kernel_init+0x=
2c/0x168
[    0.007051][    T1] [c0000000063a3e10] [c00000000000dff0] ret_from_kerne=
l_thread+0x5c/0x6c
[    0.007116][    T1] Instruction dump:
[    0.007150][    T1] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXX=
X XXXXXXXX XXXXXXXX=20
[    0.007226][    T1] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXX=
X XXXXXXXX XXXXXXXX=20
[    0.007310][    T1] ---[ end trace e117133fa9cbc962 ]---

(full boot log attached)

Presumably caused by commit

  620a6dc40754 ("sched/topology: Make sched_init_numa() use a set for the d=
eduplicating sort")

I note a similar report from the kernel test robot on LKML.

I have reverted that commit for today (which fixed the boot failure).

--=20
Cheers,
Stephen Rothwell

--MP_/dkosMs+=xWfUNGc_JKUUXjP
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=bootlog.txt

spawn qemu-system-ppc64 -M pseries -m 2G -vga none -nographic -enable-kvm -=
kernel /home/sfr/next/powerpc_pseries_le_defconfig/vmlinux -initrd ./ppc64l=
e-rootfs.cpio.gz
KVM: Failed to create TCE64 table for liobn 0x71000002
KVM: Failed to create TCE64 table for liobn 0x71000003
KVM: Failed to create TCE64 table for liobn 0x80000000


SLOF=1B[0m=1B[?25l ********************************************************=
**************
=1B[1mQEMU Starting
=1B[0m Build Date =3D Dec 29 2020 12:07:03
 FW Version =3D release 20200717
 Press "s" to enter Open Firmware.

=1B[0m=1B[?25hC0000C0100C0120C0140C0200C0240C0260C02E0C0300C0320C0340C0360C=
0370C0380C0371C0373C0374C03F0C0400C0480C04C0C04D0C0500Populating /vdevice m=
ethods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /vdevice/l-lan@71000002
Populating /vdevice/v-scsi@71000003
       SCSI: Looking for devices
          8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
C05A0Populating /pci@800000020000000
C0600C06C0C0700C0800C0880No NVRAM common partition, re-initializing...
C0890C08A0C08A8C08B0Scanning USB=20
C08C0C08D0Using default console: /vdevice/vty@71000000
C08E0C08E8Detected RAM kernel at 400000 (160a5a8 bytes)=20
C08FF    =20
  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@71000000
Preparing to boot Linux version 5.11.0-rc6 (sfr@ash) (gcc (Debian 10.2.1-3)=
 10.2.1 20201224, GNU ld (GNU Binutils for Debian) 2.35.1) #2 SMP Mon Feb 1=
 19:12:28 AEDT 2021
Detected machine type: 0000000000000101
command line: =20
Max number of cores passed to firmware: 2048 (NR_CPUS =3D 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 0000000001bf0000
  alloc_top    : 0000000030000000
  alloc_top_hi : 0000000080000000
  rmo_top      : 0000000030000000
  ram_top      : 0000000080000000
instantiating rtas at 0x000000002fff0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000001c00000 -> 0x0000000001c00a77
Device tree struct  0x0000000001c10000 -> 0x0000000001c20000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x0000000000400000 ...
[    0.000000][    T0] hash-mmu: Page sizes from device-tree:
[    0.000000][    T0] hash-mmu: base_shift=3D12: shift=3D12, sllp=3D0x0000=
, avpnm=3D0x00000000, tlbiel=3D1, penc=3D0
[    0.000000][    T0] hash-mmu: base_shift=3D16: shift=3D16, sllp=3D0x0110=
, avpnm=3D0x00000000, tlbiel=3D1, penc=3D1
[    0.000000][    T0] Using 1TB segments
[    0.000000][    T0] hash-mmu: Initializing hash mmu with SLB
[    0.000000][    T0] Linux version 5.11.0-rc6 (sfr@ash) (gcc (Debian 10.2=
.1-3) 10.2.1 20201224, GNU ld (GNU Binutils for Debian) 2.35.1) #2 SMP Mon =
Feb 1 19:12:28 AEDT 2021
[    0.000000][    T0] Found initrd at 0xc000000001a20000:0xc000000001bed70b
[    0.000000][    T0] Using pSeries machine description
[    0.000000][    T0] printk: bootconsole [udbg0] enabled
[    0.000000][    T0] Partition configured for 1 cpus.
[    0.000000][    T0] CPU maps initialized for 1 thread per core
[    0.000000][    T0] -----------------------------------------------------
[    0.000000][    T0] phys_mem_size     =3D 0x80000000
[    0.000000][    T0] dcache_bsize      =3D 0x80
[    0.000000][    T0] icache_bsize      =3D 0x80
[    0.000000][    T0] cpu_features      =3D 0x000002eb8f4d9187
[    0.000000][    T0]   possible        =3D 0x000ffbfbcf5fb187
[    0.000000][    T0]   always          =3D 0x0000000380008181
[    0.000000][    T0] cpu_user_features =3D 0xdc0065c2 0xae000000
[    0.000000][    T0] mmu_features      =3D 0x78006001
[    0.000000][    T0] firmware_features =3D 0x00000085455a445f
[    0.000000][    T0] vmalloc start     =3D 0xc008000000000000
[    0.000000][    T0] IO start          =3D 0xc00a000000000000
[    0.000000][    T0] vmemmap start     =3D 0xc00c000000000000
[    0.000000][    T0] hash-mmu: ppc64_pft_size    =3D 0x18
[    0.000000][    T0] hash-mmu: htab_hash_mask    =3D 0x1ffff
[    0.000000][    T0] -----------------------------------------------------
[    0.000000][    T0] numa:   NODE_DATA [mem 0x7ffe7080-0x7ffebfff]
[    0.000000][    T0] rfi-flush: fallback displacement flush available
[    0.000000][    T0] rfi-flush: ori type flush available
[    0.000000][    T0] rfi-flush: mttrig type flush available
[    0.000000][    T0] count-cache-flush: hardware flush enabled.
[    0.000000][    T0] link-stack-flush: software flush enabled.
[    0.000000][    T0] stf-barrier: hwsync barrier available
[    0.000000][    T0] PCI host bridge /pci@800000020000000  ranges:
[    0.000000][    T0]   IO 0x0000200000000000..0x000020000000ffff -> 0x000=
0000000000000
[    0.000000][    T0]  MEM 0x0000200080000000..0x00002000ffffffff -> 0x000=
0000080000000=20
[    0.000000][    T0]  MEM 0x0000210000000000..0x000021ffffffffff -> 0x000=
0210000000000=20
[    0.000000][    T0] PCI: OF: PROBE_ONLY disabled
[    0.000000][    T0] PPC64 nvram contains 65536 bytes
[    0.000000][    T0] PV qspinlock hash table entries: 4096 (order: 0, 655=
36 bytes, linear)
[    0.000000][    T0] barrier-nospec: using ORI speculation barrier
[    0.000000][    T0] Zone ranges:
[    0.000000][    T0]   Normal   [mem 0x0000000000000000-0x000000007ffffff=
f]
[    0.000000][    T0] Movable zone start for each node
[    0.000000][    T0] Early memory node ranges
[    0.000000][    T0]   node   0: [mem 0x0000000000000000-0x000000007fffff=
ff]
[    0.000000][    T0] Initmem setup node 0 [mem 0x0000000000000000-0x00000=
0007fffffff]
[    0.000000][    T0] percpu: Embedded 10 pages/cpu s604440 r0 d50920 u104=
8576
[    0.000000][    T0] Built 1 zonelists, mobility grouping on.  Total page=
s: 32736
[    0.000000][    T0] Policy zone: Normal
[    0.000000][    T0] Kernel command line:=20
[    0.000000][    T0] Dentry cache hash table entries: 262144 (order: 5, 2=
097152 bytes, linear)
[    0.000000][    T0] Inode-cache hash table entries: 131072 (order: 4, 10=
48576 bytes, linear)
[    0.000000][    T0] mem auto-init: stack:off, heap alloc:off, heap free:=
off
[    0.000000][    T0] Memory: 1999872K/2097152K available (13824K kernel c=
ode, 2688K rwdata, 2816K rodata, 1728K init, 1449K bss, 97280K reserved, 0K=
 cma-reserved)
[    0.000000][    T0] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CP=
Us=3D1, Nodes=3D1
[    0.000000][    T0] ftrace: allocating 32011 entries in 12 pages
[    0.000000][    T0] ftrace: allocated 12 pages with 2 groups
[    0.000000][    T0] rcu: Hierarchical RCU implementation.
[    0.000000][    T0] rcu: 	RCU event tracing is enabled.
[    0.000000][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to nr=
_cpu_ids=3D1.
[    0.000000][    T0] 	Rude variant of Tasks RCU enabled.
[    0.000000][    T0] 	Tracing variant of Tasks RCU enabled.
[    0.000000][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 10 jiffies.
[    0.000000][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr=
_cpu_ids=3D1
[    0.000000][    T0] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000][    T0] random: get_random_u64 called from start_kernel+0x4e=
c/0x728 with crng_init=3D0
[    0.000001][    T0] clocksource: timebase: mask: 0xffffffffffffffff max_=
cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.001234][    T0] clocksource: timebase mult[1f40000] shift[24] regist=
ered
[    0.002066][    T0] Console: colour dummy device 80x25
[    0.002643][    T0] printk: console [hvc0] enabled
[    0.002643][    T0] printk: console [hvc0] enabled
[    0.003220][    T0] printk: bootconsole [udbg0] disabled
[    0.003220][    T0] printk: bootconsole [udbg0] disabled
[    0.003912][    T0] pid_max: default: 32768 minimum: 301
[    0.003989][    T0] Mount-cache hash table entries: 8192 (order: 0, 6553=
6 bytes, linear)
[    0.004061][    T0] Mountpoint-cache hash table entries: 8192 (order: 0,=
 65536 bytes, linear)
[    0.004655][    T1] POWER8 performance monitor hardware support register=
ed
[    0.004712][    T1] power8-pmu: PMAO restore workaround active.
[    0.004778][    T1] rcu: Hierarchical SRCU implementation.
[    0.005308][    T1] smp: Bringing up secondary CPUs ...
[    0.005355][    T1] smp: Brought up 1 node, 1 CPU
[    0.005415][    T1] numa: Node 0 CPUs: 0
[    0.005496][    T1] BUG: Unable to handle kernel instruction fetch (NULL=
 pointer?)
[    0.005559][    T1] Faulting instruction address: 0x00000000
[    0.005613][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.005665][    T1] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUM=
A pSeries
[    0.005719][    T1] Modules linked in:
[    0.005754][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc6=
 #2
[    0.005808][    T1] NIP:  0000000000000000 LR: c0000000001a22ac CTR: 000=
0000000000001
[    0.005870][    T1] REGS: c0000000063a3860 TRAP: 0480   Not tainted  (5.=
11.0-rc6)
[    0.005933][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24002242  XER: 20000000
[    0.006014][    T1] CFAR: c0000000001a22a8 IRQMASK: 0=20
[    0.006014][    T1] GPR00: c0000000001a21ac c0000000063a3b00 c0000000014=
39400 0000000000000000=20
[    0.006014][    T1] GPR04: 0000000000000000 00000000000000c4 00000000000=
00001 c000000001509400=20
[    0.006014][    T1] GPR08: 0000000000000000 c0000000011f5af0 000000007ea=
a0000 0000000000000001=20
[    0.006014][    T1] GPR12: 0000000000000001 c000000001610000 c0000000063=
50f18 0000000000000001=20
[    0.006014][    T1] GPR16: c000000001507bb0 0000000000000000 c0000000012=
106b0 c00000000146dce0=20
[    0.006014][    T1] GPR20: c000000006054a90 0000000000000001 00000000000=
00000 00000000ffff8ad0=20
[    0.006014][    T1] GPR24: 00000000ffff8ad0 c000000006054a00 00000000000=
00000 c000000006055000=20
[    0.006014][    T1] GPR28: 0000000000000000 c000000006350f00 c0000000063=
50f00 c000000001472380=20
[    0.006590][    T1] NIP [0000000000000000] 0x0
[    0.006633][    T1] LR [c0000000001a22ac] build_sched_domains+0x47c/0x15=
00
[    0.006687][    T1] Call Trace:
[    0.006719][    T1] [c0000000063a3b00] [c0000000001a21ac] build_sched_do=
mains+0x37c/0x1500 (unreliable)
[    0.006794][    T1] [c0000000063a3c40] [c0000000001a42d0] sched_init_dom=
ains+0xe0/0x120
[    0.006858][    T1] [c0000000063a3c90] [c000000001075f38] sched_init_smp=
+0x50/0xc4
[    0.006922][    T1] [c0000000063a3cc0] [c0000000010545a4] kernel_init_fr=
eeable+0x1d4/0x398
[    0.006987][    T1] [c0000000063a3da0] [c000000000013144] kernel_init+0x=
2c/0x168
[    0.007051][    T1] [c0000000063a3e10] [c00000000000dff0] ret_from_kerne=
l_thread+0x5c/0x6c
[    0.007116][    T1] Instruction dump:
[    0.007150][    T1] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXX=
X XXXXXXXX XXXXXXXX=20
[    0.007226][    T1] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXX=
X XXXXXXXX XXXXXXXX=20
[    0.007310][    T1] ---[ end trace e117133fa9cbc962 ]---
[    0.007354][    T1]=20
[    1.007387][    T1] Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b
qemu-system-ppc64: OS terminated: OS panic: Attempted to kill init! exitcod=
e=3D0x0000000b

--MP_/dkosMs+=xWfUNGc_JKUUXjP--

--Sig_/rtzDT0lOsqDmNa.g.71eRf_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAXxT4ACgkQAVBC80lX
0GwzJgf5AeLsImklI/rszc12IAQWY2LLWLtBxNJdH6tReZChepEoXE8LfRI2A1tQ
14QOC3SPdcfNGnv0JRAm1LmAIcC7j7F6vFYirD67TwU94YiDoJDue4UN6IIreQea
fHUlkofleCMK9Yn5lV8BxJfFcGV1oxDQdMuW/SIYj6gfr5YVHkZpOFvHCJyss8vW
9CeOeq/t3Px7CMb5pNwT9PmY7hBsOgU9T9z/RHae7IrECX04VGesftrb2xdEM6T/
qnnQYYbXpvp/Rsvg2ydc/ko3AXtARyVr4Erxn1sVljDmAtpZol5Yyslb2Ye82bha
UkxPGlVGIqDpmLKezbzVTZOn7u+Q/g==
=3njj
-----END PGP SIGNATURE-----

--Sig_/rtzDT0lOsqDmNa.g.71eRf_--
