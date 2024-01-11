Return-Path: <linux-next+bounces-718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7082A544
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 01:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7691F23107
	for <lists+linux-next@lfdr.de>; Thu, 11 Jan 2024 00:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A68838F;
	Thu, 11 Jan 2024 00:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="jt+geysp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA036A
	for <linux-next@vger.kernel.org>; Thu, 11 Jan 2024 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28c7c9b19f1so2842971a91.1
        for <linux-next@vger.kernel.org>; Wed, 10 Jan 2024 16:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704933706; x=1705538506; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wY1Vd5tnqZWdj343rb3UWpNv9ccVMtnJPr0OcWKahOM=;
        b=jt+geyspLJea17L6ohqFOpTbe7P8qjLXNKJ9YhoAytdEkXoYxSsitAAiEWBtWwOl0y
         PnWC2gp+roRI7lTLEWkVbjBFiFRjv9HtvDVfrLlwo01/hP8pvDDoLZ3JEKpUA14GV+BP
         oeVQf7HMsAKlYGRpgFzH4Djh5hRQQE41nLriL0G5iIoOnt2a09HSHV942ehvLT3NEUGi
         hI71aGM0pU8+kqkEsahfNnCueoJX4o0rGZc/4G4kdGokRw+0KCfM6VGJy5SPyvIpSARL
         UVj5QtNMlzxOLFmAAOPm5bG4i7geYM+e8WdpTsQ6HIdTrUQWyJ9JbS+JU9ZTRtRN0d9N
         uhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704933706; x=1705538506;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY1Vd5tnqZWdj343rb3UWpNv9ccVMtnJPr0OcWKahOM=;
        b=cp/DEnHboep5shKn5c/liZGvhdLxz4Fs9pcC0D+e89wppkch9uZZZ/TovQ0XTsziMb
         6LL4cmUISze9iq2XIuF+VB+GD9kCnvsrY8uBMplyyepfZTyIY8NGwDTCOalVce6pzxIs
         M9gtV51HejQc/o3fP340fOFmKy6Y87iUNIq9zxB9JwcIvKTjTWqAuYY2U0bxTZS8ES3c
         hQ4maYrz1aKTxpl1rht7LsijZloDmYXW6G670KYKFKkZW9wDSikHtabS5GMpWV6iNZLe
         2bgF/m68YE1TOKJR2yh3ATGPu2rQJKcRfDOhQMd/TAdK623utDOsCrohHKGU2ki1Cr4X
         wQfg==
X-Gm-Message-State: AOJu0YyJD5XSiXspaXLPEPrCr9dEHMNW4WxDmLqA9onmoV/Cc6IYYu5P
	mob9UAroTSuy1lt6w2gaRdv1yHjKZZjd/1FrSXNmq6Z/H6f1vw==
X-Google-Smtp-Source: AGHT+IHKNKdz+PD48au76pzG/afGrkLK4DwDKPpHsBd4iliP5ceEcy/NPdoNkdOYgtnOrb1w8fgfSQ==
X-Received: by 2002:a17:90a:b005:b0:28b:9733:5922 with SMTP id x5-20020a17090ab00500b0028b97335922mr290363pjq.91.1704933706511;
        Wed, 10 Jan 2024 16:41:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090a8c8600b0028db72e6bc6sm2196642pjo.7.2024.01.10.16.41.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 16:41:45 -0800 (PST)
Message-ID: <659f3949.170a0220.dce99.9d2c@mx.google.com>
Date: Wed, 10 Jan 2024 16:41:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-2936-g357881a4f22f3
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 2 failed, 6 passed, 2 errors,
 44 warnings (v6.7-2936-g357881a4f22f3)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 2 failed, 6 passed, 2 errors, 44 warnin=
gs (v6.7-2936-g357881a4f22f3)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-2936-g357881a4f22f3/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-2936-g357881a4f22f3
Git Commit: 357881a4f22f3e32964503b0d30af6b084b4ffb1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

i386:
    i386_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig (gcc-10): 3 warnings

arm64:
    defconfig (gcc-10): 1 warning

arm:

i386:
    i386_defconfig (gcc-10): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 6 warnings

riscv:
    defconfig (gcc-10): 1 warning

sparc:
    sparc64_defconfig (gcc-10): 31 warnings

x86_64:
    x86_64_defconfig (gcc-10): 1 error, 1 warning

Errors summary:

    1    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset =
32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]
    1    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin=
_memcpy=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bou=
nds]

Warnings summary:

    2    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offse=
t 32 is out of the bounds [0, 0] [-Warray-bounds]
    2    kernel/irq_work.c:72:13: warning: no previous prototype for =E2=80=
=98arch_irq_work_raise=E2=80=99 [-Wmissing-prototypes]
    2    cc1: all warnings being treated as errors
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    kernel/irq_work.c:72:13: warning: no previous prototype for 'arch_=
irq_work_raise' [-Wmissing-prototypes]
    1    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =
=E2=80=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    1    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =
=E2=80=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype fo=
r =E2=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for=
 =E2=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:2839:13: warning: no previous prototy=
pe for =E2=80=98trap_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:252:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:2152:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
    1    arch/sparc/kernel/traps_64.c:2034:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype=
 for =E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototyp=
e for =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/pcr.c:47:6: warning: no previous prototype for =
=E2=80=98arch_irq_work_raise=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototy=
pe for =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/asm-offsets.c:48:5: warning: no previous prototy=
pe for =E2=80=98foo=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/asm-offsets.c:29:5: warning: no previous prototy=
pe for =E2=80=98sparc64_foo=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype f=
or =E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype =
for =E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype =
for =E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/vdso/vgettimeofday.c:42:5: warning: no previous prototyp=
e for =E2=80=98__vdso_clock_gettime64=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/vdso/vgettimeofday.c:36:5: warning: no previous prototyp=
e for =E2=80=98__vdso_clock_getres=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/vdso/vgettimeofday.c:28:5: warning: no previous prototyp=
e for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/vdso/vgettimeofday.c:14:5: warning: no previous prototyp=
e for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/fault.c:324:17: warning: no previous prototype for =
=E2=80=98do_page_fault=E2=80=99 [-Wmissing-prototypes]
    1    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype fo=
r 'syscall_trace_enter' [-Wmissing-prototypes]
    1    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype f=
or 'arc_kprobe_handler' [-Wmissing-prototypes]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/mm/fault.c:324:17: warning: no previous prototype for =E2=80=
=98do_page_fault=E2=80=99 [-Wmissing-prototypes]
    arch/mips/vdso/vgettimeofday.c:14:5: warning: no previous prototype for=
 =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/mips/vdso/vgettimeofday.c:28:5: warning: no previous prototype for=
 =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/mips/vdso/vgettimeofday.c:36:5: warning: no previous prototype for=
 =E2=80=98__vdso_clock_getres=E2=80=99 [-Wmissing-prototypes]
    arch/mips/vdso/vgettimeofday.c:42:5: warning: no previous prototype for=
 =E2=80=98__vdso_clock_gettime64=E2=80=99 [-Wmissing-prototypes]
    kernel/irq_work.c:72:13: warning: no previous prototype for =E2=80=98ar=
ch_irq_work_raise=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    security/security.c:810:2: warning: =E2=80=98memcpy=E2=80=99 offset 32 =
is out of the bounds [0, 0] [-Warray-bounds]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'sy=
scall_trace_enter' [-Wmissing-prototypes]
    arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'a=
rc_kprobe_handler' [-Wmissing-prototypes]
    kernel/irq_work.c:72:13: warning: no previous prototype for 'arch_irq_w=
ork_raise' [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/x86/include/asm/string_32.h:150:25: error: =E2=80=98__builtin_memc=
py=E2=80=99 offset 32 is out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 31 warnings, 0 =
section mismatches

Warnings:
    arch/sparc/kernel/asm-offsets.c:29:5: warning: no previous prototype fo=
r =E2=80=98sparc64_foo=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/asm-offsets.c:48:5: warning: no previous prototype fo=
r =E2=80=98foo=E2=80=99 [-Wmissing-prototypes]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:252:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2034:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2152:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2839:13: warning: no previous prototype fo=
r =E2=80=98trap_init=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pcr.c:47:6: warning: no previous prototype for =E2=80=
=98arch_irq_work_raise=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    kernel/irq_work.c:72:13: warning: no previous prototype for =E2=80=98ar=
ch_irq_work_raise=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    security/security.c:810:2: error: =E2=80=98memcpy=E2=80=99 offset 32 is=
 out of the bounds [0, 0] [-Werror=3Darray-bounds]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>

