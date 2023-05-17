Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B33E70707A
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 20:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjEQSMH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 14:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjEQSMG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 14:12:06 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BD57EC3
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 11:12:03 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-757741ca000so120705685a.2
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684347122; x=1686939122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvEllXM1JJYO7RfsivO2PGQg/2rZoNyUY5HT/G80kvQ=;
        b=eIolC0T7IY2mOdjn8osS1nUTw1rsq9bTuGOqL8/t7VOEbbGO4Z9iWokUDZ9NShl7o+
         CtNy+njaBycUDYGWGg4kkD2DpChSfCMDI2/f7wsuZ5YAGrd00OzSVkSTHh90ZsWoBAKq
         g1OlFU0dX3RgaIUY5VCJvzovJACZClGQ9tkzSum1/ZjDw11vDin6U1neAeF0RfFtMkoG
         9i5dDdHXB9JwrJ2azoGWUVV8u0tvwItLMZ/i6Njpzh2SoD2f96b62jy++M54bDE43Hgv
         lKiEfHJ0dMChit4TALhvNI9QFwzf2dIIPWoYMzT3NsN0pYsW/x6Yv4wmKtqgTs0ctPvq
         Ccng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684347122; x=1686939122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvEllXM1JJYO7RfsivO2PGQg/2rZoNyUY5HT/G80kvQ=;
        b=CZdUVq+3oRQLLLMAQoEpDoXzGl/eE8lafVHh0s2ehH2pZ0g6TcB4PWBHet8i2t92vW
         T+Y1PSKfoWrFZvXOY9/T60ikI9K9+xzuOHmc/QKKKViKNhdquN7SVw5r6WELtlNRPu8U
         tfGobaMpK7c2tRCESiUcSJuJ0Wbch9FO3EHu0VbUVYSdhfk1px5AuqnDASZfL7cnQ+yu
         SRrHN5pA86WAobOWZvGPLHZUopxPJH+g0jSC0oRWMfJ58r0kHq9ZTRuYl/G0T2SWoiG4
         wmHfhc3nj36dr6sKXIP5mWruLhbPpgrDKcgRJecGS+OhJUjbeYLCsmNhkrTxjIOQ2T8x
         KQTg==
X-Gm-Message-State: AC+VfDwtpqPdMKMlDf+ObexuXTNT5g/9OctxfzJCpX0oOm4jMMNuk47h
        5Yl4aOTKtNeH6+xvkT6UISsr+A9cZuM/P/Moz06dFg==
X-Google-Smtp-Source: ACHHUZ5Fg20/XTyO6+BDiHNk5KWLulDAkCl2mPT06TTX8527HZwesB6Axz0sROvLVi4j6LYaS7tUf5fMzvrWwnzzSgs=
X-Received: by 2002:a05:6214:ca1:b0:5ef:46a9:15d2 with SMTP id
 s1-20020a0562140ca100b005ef46a915d2mr1350358qvs.7.1684347122171; Wed, 17 May
 2023 11:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvhPgoP57ip1cW5TaWJfkbkHA2SZqd5fFoTJ7rDGA138w@mail.gmail.com>
In-Reply-To: <CA+G9fYvhPgoP57ip1cW5TaWJfkbkHA2SZqd5fFoTJ7rDGA138w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 11:11:51 -0700
Message-ID: <CAKwvOdkABkajMqBS=xcHxXUTQGXbTN3tj1GcPqpGgGkmAGLkDA@mail.gmail.com>
Subject: Re: next: i386-boot: clang-nightly: failed - intermittently - BUG:
 unable to handle page fault for address: 000024c0
To:     Naresh Kamboju <naresh.kamboju@linaro.org>, x86@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Borislav Petkov <bp@alien8.de>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Nathan Chancellor <nathan@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 17, 2023 at 8:21=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Linux next-20230517 build with clang nightly for i386 boot fails intermit=
tently.

Keyword: intermittently. That will make tracking this down fun.

Our CI also hit a boot failure on tip/master with the same splat:
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/499=
8374271/jobs/8957285746
Though the CI pulled down a SHA
0932447780e1f9a43bf68ef7fe3d9b41b46d58fc
which looks weird on
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=3D09=
32447780e1f9a43bf68ef7fe3d9b41b46d58fc
>> Notice: this object is not reachable from any branch.

That this failed in -next and -tip in the same way makes me wonder if
something affecting this is coming in via -tip? Maybe the splat looks
familiar to x86 folks?

I haven't been able to reproduce locally when my machine is relatively
load-less.  If I do a kernel build in the background, I was able to
get QEMU to hang, but without any splat. That was using tip/master @
f81d8f759e7f.

Naresh, when you say "intermittent" do you have any data on the
relative frequency of this boot failure? (Also, please make sure to
use llvm@lists.linux.dev in the future; we moved mailing lists years
ago).

Looks like our CI report linked above has an additional splat though
via apply_alternatives and optimize_nops.

>> [ 0.166742] Code: Unable to access opcode bytes at 0x36.

Peter, that smells like perhaps either:
commit b6c881b248ef ("x86/alternative: Complicate optimize_nops() some more=
")
commit 6c480f222128 ("x86/alternative: Rewrite optimize_nops() some")

Looks like BP committed them May 11; maybe just recently they were
merged into tip/master?


>   - i386: boot/clang-nightly-lkftconfig - failed
>
> Please find detailed log here,
>
> boot log:
> =3D=3D=3D=3D=3D
> [    0.000000] Linux version 6.4.0-rc2-next-20230517 (tuxmake@tuxmake)
> (Debian clang version 17.0.0
> (++20230507093322+728b8a139804-1~exp1~20230507093335.652), Debian LLD
> 17.0.0) #1 SMP PREEMPT_DYNAMIC @1684291209
> <6>[    0.000000] x86/fpu: x87 FPU will use FXSAVE
> <6>[    0.000000] signal: max sigframe size: 1440
> <6>[    0.000000] BIOS-provided physical RAM map:
> <6>[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] =
usable
> <6>[    0.000000] BIOS-e820: [mem
> 0x000000000009fc00-0x000000000009ffff] reserved
> <6>[    0.000000] BIOS-e820: [mem
> 0x00000000000f0000-0x00000000000fffff] reserved
> <6>[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000007ffdefff] =
usable
> <6>[    0.000000] BIOS-e820: [mem
> 0x000000007ffdf000-0x000000007fffffff] reserved
> <6>[    0.000000] BIOS-e820: [mem
> 0x00000000b0000000-0x00000000bfffffff] reserved
> <6>[    0.000000] BIOS-e820: [mem
> 0x00000000fed1c000-0x00000000fed1ffff] reserved
> <6>[    0.000000] BIOS-e820: [mem
> 0x00000000fffc0000-0x00000000ffffffff] reserved
> <6>[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000017fffffff] =
usable
> <5>[    0.000000] random: crng init done
> <5>[    0.000000] Notice: NX (Execute Disable) protection cannot be
> enabled: non-PAE kernel!
> <7>[    0.000000] e820: update [mem 0x00cfce20-0x00cfce2f] usable =3D=3D>=
 usable
> <7>[    0.000000] e820: update [mem 0x00cfce20-0x00cfce2f] usable =3D=3D>=
 usable
> <6>[    0.000000] extended physical RAM map:
> <6>[    0.000000] reserve setup_data: [mem
> 0x0000000000000000-0x000000000009fbff] usable
> <6>[    0.000000] reserve setup_data: [mem
> 0x000000000009fc00-0x000000000009ffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x00000000000f0000-0x00000000000fffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x0000000000100000-0x0000000000cfce1f] usable
> <6>[    0.000000] reserve setup_data: [mem
> 0x0000000000cfce20-0x0000000000cfce2f] usable
> <6>[    0.000000] reserve setup_data: [mem
> 0x0000000000cfce30-0x000000007ffdefff] usable
> <6>[    0.000000] reserve setup_data: [mem
> 0x000000007ffdf000-0x000000007fffffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x00000000b0000000-0x00000000bfffffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x00000000fed1c000-0x00000000fed1ffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x00000000fffc0000-0x00000000ffffffff] reserved
> <6>[    0.000000] reserve setup_data: [mem
> 0x0000000100000000-0x000000017fffffff] usable
> <6>[    0.000000] SMBIOS 2.8 present.
> <6>[    0.000000] DMI: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> 1.14.0-2 04/01/2014
> <6>[    0.000000] tsc: Fast TSC calibration using PIT
> <6>[    0.000000] tsc: Detected 3000.002 MHz processor
> <7>[    0.009140] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D>=
 reserved
> <7>[    0.009369] e820: remove [mem 0x000a0000-0x000fffff] usable
> <6>[    0.009688] last_pfn =3D 0x7ffdf max_arch_pfn =3D 0x100000
> <6>[    0.010313] x86/PAT: PAT not supported by the CPU.
> <6>[    0.010476] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  U=
C- UC
> <6>[    0.028035] found SMP MP-table at [mem 0x000f5ce0-0x000f5cef]
> <7>[    0.029050] initial memory mapped: [mem 0x00000000-0x18ffffff]
> <6>[    0.032814] ACPI: Early table checksum verification disabled
> <6>[    0.033316] ACPI: RSDP 0x00000000000F5B10 000014 (v00 BOCHS )
> <6>[    0.033820] ACPI: RSDT 0x000000007FFE2319 000038 (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.034477] ACPI: FACP 0x000000007FFE2109 0000F4 (v03 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035093] ACPI: DSDT 0x000000007FFE0040 0020C9 (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035191] ACPI: FACS 0x000000007FFE0000 000040
> <6>[    0.035258] ACPI: APIC 0x000000007FFE21FD 000080 (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035306] ACPI: HPET 0x000000007FFE227D 000038 (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035336] ACPI: MCFG 0x000000007FFE22B5 00003C (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035365] ACPI: WAET 0x000000007FFE22F1 000028 (v01 BOCHS
> BXPC     00000001 BXPC 00000001)
> <6>[    0.035470] ACPI: Reserving FACP table memory at [mem
> 0x7ffe2109-0x7ffe21fc]
> <6>[    0.035522] ACPI: Reserving DSDT table memory at [mem
> 0x7ffe0040-0x7ffe2108]
> <6>[    0.035533] ACPI: Reserving FACS table memory at [mem
> 0x7ffe0000-0x7ffe003f]
> <6>[    0.035542] ACPI: Reserving APIC table memory at [mem
> 0x7ffe21fd-0x7ffe227c]
> <6>[    0.035550] ACPI: Reserving HPET table memory at [mem
> 0x7ffe227d-0x7ffe22b4]
> <6>[    0.035558] ACPI: Reserving MCFG table memory at [mem
> 0x7ffe22b5-0x7ffe22f0]
> <6>[    0.035566] ACPI: Reserving WAET table memory at [mem
> 0x7ffe22f1-0x7ffe2318]
> <5>[    0.036775] 1167MB HIGHMEM available.
> <5>[    0.036823] 879MB LOWMEM available.
> <6>[    0.036848]   mapped low ram: 0 - 36ffe000
> <6>[    0.036864]   low ram: 0 - 36ffe000
> <6>[    0.037465] Zone ranges:
> <6>[    0.037490]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> <6>[    0.037576]   Normal   [mem 0x0000000001000000-0x0000000036ffdfff]
> <6>[    0.037591]   HighMem  [mem 0x0000000036ffe000-0x000000007ffdefff]
> <6>[    0.037610] Movable zone start for each node
> <6>[    0.037625] Early memory node ranges
> <6>[    0.037668]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> <6>[    0.037741]   node   0: [mem 0x0000000000100000-0x000000007ffdefff]
> <6>[    0.037912] Initmem setup node 0 [mem
> 0x0000000000001000-0x000000007ffdefff]
> <6>[    0.039699] On node 0, zone DMA: 1 pages in unavailable ranges
> <6>[    0.040493] On node 0, zone DMA: 97 pages in unavailable ranges
> <6>[    0.068623] Using APIC driver default
> <6>[    0.069096] ACPI: PM-Timer IO Port: 0x608
> <6>[    0.069764] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> <6>[    0.070159] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, G=
SI 0-23
> <6>[    0.070278] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl=
)
> <6>[    0.070576] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high le=
vel)
> <6>[    0.070611] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high le=
vel)
> <6>[    0.070722] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high =
level)
> <6>[    0.070735] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high =
level)
> <6>[    0.070968] ACPI: Using ACPI (MADT) for SMP configuration informati=
on
> <6>[    0.071240] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> <6>[    0.072248] PM: hibernation: Registered nosave memory: [mem
> 0x00000000-0x00000fff]
> <6>[    0.072334] PM: hibernation: Registered nosave memory: [mem
> 0x0009f000-0x0009ffff]
> <6>[    0.072384] PM: hibernation: Registered nosave memory: [mem
> 0x000a0000-0x000effff]
> <6>[    0.072394] PM: hibernation: Registered nosave memory: [mem
> 0x000f0000-0x000fffff]
> <6>[    0.072405] PM: hibernation: Registered nosave memory: [mem
> 0x00cfc000-0x00cfcfff]
> <6>[    0.072417] PM: hibernation: Registered nosave memory: [mem
> 0x00cfc000-0x00cfcfff]
> <6>[    0.072636] [mem 0xc0000000-0xfed1bfff] available for PCI devices
> <6>[    0.072683] Booting paravirtualized kernel on bare hardware
> <6>[    0.073201] clocksource: refined-jiffies: mask: 0xffffffff
> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
> <6>[    0.073674] setup_percpu: NR_CPUS:8 nr_cpumask_bits:2
> nr_cpu_ids:2 nr_node_ids:1
> <6>[    0.075154] percpu: Embedded 31 pages/cpu s96372 r0 d30604 u126976
> <7>[    0.075652] pcpu-alloc: s96372 r0 d30604 u126976 alloc=3D31*4096
> <7>[    0.075742] pcpu-alloc: [0] 0 [0] 1
> <5>[    0.077147] Kernel command line: console=3DttyS0,115200 rootwait
> root=3D/dev/sda debug verbose console_msg_format=3Dsyslog earlycon
> <5>[    0.078730] Unknown kernel command line parameters \"verbose\",
> will be passed to user space.
> <6>[    0.080340] Dentry cache hash table entries: 131072 (order: 7,
> 524288 bytes, linear)
> <6>[    0.081003] Inode-cache hash table entries: 65536 (order: 6,
> 262144 bytes, linear)
> <6>[    0.082840] Built 1 zonelists, mobility grouping on.  Total pages: =
521957
> <6>[    0.088082] mem auto-init: stack:all(zero), heap alloc:off, heap fr=
ee:off
> <6>[    0.088308] Initializing HighMem for node 0 (00036ffe:0007ffdf)
> <6>[    0.454727] Initializing Movable for node 0 (00000000:00000000)
> <6>[    0.459790] Checking if this processor honours the WP bit even
> in supervisor mode...Ok.
> <6>[    0.460945] Memory: 2046372K/2096628K available (15688K kernel
> code, 2173K rwdata, 5772K rodata, 996K init, 780K bss, 50256K
> reserved, 0K cma-reserved, 1195908K highmem)
> <6>[    0.466051] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=
=3D2, Nodes=3D1
> <6>[    0.468048] ftrace: allocating 54241 entries in 106 pages
> <6>[    0.511020] ftrace: allocated 106 pages with 4 groups
> <6>[    0.514727] trace event string verifier disabled
> <6>[    0.519501] Dynamic Preempt: voluntary
> <6>[    0.522734] rcu: Preemptible hierarchical RCU implementation.
> <6>[    0.522756] rcu: RCU event tracing is enabled.
> <6>[    0.522785] rcu: RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_id=
s=3D2.
> <6>[    0.522916] Trampoline variant of Tasks RCU enabled.
> <6>[    0.522927] Rude variant of Tasks RCU enabled.
> <6>[    0.523017] rcu: RCU calculated value of scheduler-enlistment
> delay is 100 jiffies.
> <6>[    0.523045] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cp=
u_ids=3D2
> <6>[    0.538503] NR_IRQS: 2304, nr_irqs: 440, preallocated irqs: 16
> <6>[    0.543029] rcu: srcu_init: Setting srcu_struct sizes based on cont=
ention.
> <6>[    0.546346] kfence: initialized - using 2097152 bytes for 255
> objects at 0x(ptrval)-0x(ptrval)
> <6>[    0.551378] Console: colour VGA+ 80x25
> <6>[    0.553103] printk: console [ttyS0] enabled
> <6>[    0.626471] ACPI: Core revision 20230331
> <6>[    0.637882] APIC: Switch to symmetric I/O mode setup
> <6>[    0.638348] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> <6>[    0.644118] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pi=
n2=3D-1
> <6>[    0.650790] clocksource: tsc-early: mask: 0xffffffffffffffff
> max_cycles: 0x2b3e46fa93c, max_idle_ns: 440795237232 ns
> <6>[    0.652683] Calibrating delay loop (skipped), value calculated
> using timer frequency.. 6000.00 BogoMIPS (lpj=3D3000002)
> <6>[    0.654599] pid_max: default: 32768 minimum: 301
> <6>[    0.656733] LSM: initializing lsm=3Dcapability,selinux,integrity
> <6>[    0.657713] SELinux:  Initializing.
> <6>[    0.660732] Mount-cache hash table entries: 2048 (order: 1, 8192
> bytes, linear)
> <6>[    0.661233] Mountpoint-cache hash table entries: 2048 (order: 1,
> 8192 bytes, linear)
> <6>[    0.682197] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> <6>[    0.682458] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> <6>[    0.682670] Spectre V1 : Mitigation: usercopy/swapgs barriers
> and __user pointer sanitization
> <6>[    0.684632] Spectre V2 : Mitigation: Retpolines
> <6>[    0.684930] Spectre V2 : Spectre v2 / SpectreRSB mitigation:
> Filling RSB on context switch
> <6>[    0.685539] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on V=
MEXIT
> <4>[    0.686934] L1TF: Kernel not compiled for PAE. No mitigation for L1=
TF
> <6>[    0.688097] MDS: Vulnerable: Clear CPU buffers attempted, no microc=
ode
> <6>[    0.688548] MMIO Stale Data: Unknown: No mitigations
> <0>[    0.692458] __common_interrupt: 0.79 No irq handler for vector
> <0>[    0.692458] __common_interrupt: 0.160 No irq handler for vector
> <1>[    0.692458] BUG: unable to handle page fault for address: 000024c0
> <1>[    0.692458] #PF: user read access in kernel mode
> <1>[    0.692458] #PF: error_code(0x0004) - not-present page
> <6>[    0.692458] *pde =3D 00000000
> <4>[    0.692458] Oops: 0004 [#1] PREEMPT SMP
> <4>[    0.692458] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.4.0-rc2-next-20230517 #1
> <4>[    0.692458] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS 1.14.0-2 04/01/2014
> <4>[    0.692458] EIP: 0x60
> <4>[    0.692458] Code: Unable to access opcode bytes at 0x36.
> <4>[    0.692458] EAX: 00000060 EBX: 00000000 ECX: b51e0945 EDX: 006afcf0
> <4>[    0.692458] ESI: 00000060 EDI: 00000020 EBP: d86f7c04 ESP: d86f7ce0
> <4>[    0.692458] DS: 0000 ES: 0000 FS: 0000 GS: 0000 SS: 7c8c EFLAGS: 00=
324b92
> <4>[    0.692458] CR0: 80050033 CR2: 000024c0 CR3: 18a49000 CR4: 000006d0
> <4>[    0.692458] Call Trace:
> <4>[    0.692458]  ? vscnprintf+0x12/0x30
> <4>[    0.692458]  ? prb_read_valid+0x31/0x50
> <4>[    0.692458]  ? console_unlock+0x94/0xc0
> <4>[    0.692458]  ? vprintk_emit+0xf4/0x230
> <4>[    0.692458]  ? vprintk_emit+0xf4/0x230
> <4>[    0.692458]  ? vprintk_default+0x15/0x20
> <4>[    0.692458]  ? __is_insn_slot_addr+0x41/0x50
> <4>[    0.692458]  ? kernel_text_address+0x7c/0x90
> <4>[    0.692458]  ? __kernel_text_address+0x10/0x40
> <4>[    0.692458]  ? show_trace_log_lvl.17+0x1f5/0x2f0
> <4>[    0.692458]  ? __die_body+0x54/0x90
> <4>[    0.692458]  ? __die+0x70/0x80
> <4>[    0.692458]  ? page_fault_oops+0x2d3/0x310
> <4>[    0.692458]  ? kernelmode_fixup_or_oops+0xa5/0xc0
> <4>[    0.692458]  ? __bad_area_nosemaphore+0x59/0x1d0
> <4>[    0.692458]  ? bad_area_nosemaphore+0x12/0x20
> <4>[    0.692458]  ? do_user_addr_fault+0x156/0x400
> <4>[    0.692458]  ? irqentry_enter+0x32/0x38
> <4>[    0.692458]  ? trace_hardirqs_off_finish+0x2c/0x70
> <4>[    0.692458]  ? exc_page_fault+0x50/0x154
> <4>[    0.692458]  ? pvclock_clocksource_read_nowd+0xdc/0xdc
> <4>[    0.692458]  ? handle_exception+0x133/0x133
> <4>[    0.692458]  ? pvclock_clocksource_read_nowd+0xdc/0xdc
> <4>[    0.692458] Modules linked in:
> <4>[    0.692458] CR2: 00000000000024c0
> <4>[    0.692458] ---[ end trace 0000000000000000 ]---
> <4>[    0.692458] EIP: 0x60
> <4>[    0.692458] Code: Unable to access opcode bytes at 0x36.
> <4>[    0.692458] EAX: 00000060 EBX: 00000000 ECX: b51e0945 EDX: 006afcf0
> <4>[    0.692458] ESI: 00000060 EDI: 00000020 EBP: d86f7c04 ESP: d86f7ce0
> <4>[    0.692458] DS: 0000 ES: 0000 FS: 0000 GS: 0000 SS: 7c8c EFLAGS: 00=
324b92
> <4>[    0.692458] CR0: 80050033 CR2: 000024c0 CR3: 18a49000 CR4: 000006d0
> <0>[    0.692458] Kernel panic - not syncing: Attempted to kill the idle =
task!
> <0>[    0.692458] ---[ end Kernel panic - not syncing: Attempted to
> kill the idle task! ]---
> poweroff
>
>
> logs:
> =3D=3D=3D
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202305=
17/testrun/17029757/suite/boot/test/clang-nightly-lkftconfig/log
>  - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2Ptyo=
Y5qEJrKsuIBPRVSIGK02m3
>
>
> Steps to reproduce intermittently,
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> # To install tuxrun on your system globally:
> # sudo pip3 install -U tuxrun=3D=3D0.42.0
> #
> # See https://tuxrun.org/ for complete documentation.
>
> tuxrun   \
>  --runtime podman   \
>  --device qemu-i386   \
>  --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylXBv=
ODt99O8r9YKOEwj0fQc/bzImage
>   \
>  --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylXB=
vODt99O8r9YKOEwj0fQc/modules.tar.xz
>   \
>  --rootfs https://storage.tuxsuite.com/public/linaro/lkft/oebuilds/2PeQhk=
n36JqPowQBZge0AFhBav6/images/intel-core2-32/lkft-tux-image-intel-core2-32-2=
0230511145016.rootfs.ext4.gz
>   \
>  --parameters SKIPFILE=3Dskipfile-lkft.yaml   \
>  --parameters SHARD_NUMBER=3D10   \
>  --parameters SHARD_INDEX=3D2   \
>  --image docker.io/lavasoftware/lava-dispatcher:2023.01.0020.gc1598238f  =
 \
>  --tests ltp-syscalls   \
>  --timeouts boot=3D15 ltp-syscalls=3D50
>
> --
> Linaro LKFT
> https://lkft.linaro.org



--=20
Thanks,
~Nick Desaulniers
