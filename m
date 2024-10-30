Return-Path: <linux-next+bounces-4537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF39B6285
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 13:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 647E02824FB
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 12:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93811E7C0C;
	Wed, 30 Oct 2024 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2EkgMVo+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6D1E7C07
	for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289822; cv=none; b=ZfiNkEqIm3tT0n2pxw+9Yaj1qO1yN6BQMB6YgnCd5CocN3IBaZCIVokgkGN/IF5gyp2iInLQkxjTelG4eUCLLLqZCOJ9/1upSb//hkuP+J9Kr8r+caNnliMwKn7uU1aQ+eAfy4lNIvaB79Pjpvnp7S+pnN9jfiEqvS5M8KaDShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289822; c=relaxed/simple;
	bh=EUz0EDAOlEMmaPD5pKL0Hfsx36ma2TPkN2mtiDPXEFI=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=K3AyK81KtUZNl0efkiOlgywvMUxiuyI6OuKPj/Lw9pvTTMZhapGXmfVfdwEmYHjVj69fU8vmrRJqM9VwS3QaucbDeX4hhqI60SO4IJlDAsMI1B2UCfTUYBZISlLh6N3xoC1xLUWEQXQYb+H7SOKXTFnvXpp0Q1xW62tZtxv0k/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2EkgMVo+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so5005708a12.1
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730289758; x=1730894558; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nIWnqYTnrKHu+4Hw2LPmtmvtTTqQCpp6TAxzxTOWGaQ=;
        b=2EkgMVo+45WEf5ckxR1fNZ83Hs9KQH9Dnb9S6uSHICosnPQ7pDC1d0Y871uXliL0mr
         aEo+594xSAj6DE8HmRno0vSO4KcrlSzHCrHJjfkW0FNbE+CDm6lWagMV0glAqzYJ27t8
         OPMmcqCujPuVMtug5EeUyUCU1HrPJv1XCBu7CJzgh9zQxnEDnx3cnWCgFg9aUiFsHYOg
         W0WVRwl3mOR3k7YmyZSoiYBUMJc6bN5XajdXDcdbuOPW+wysnlqOSLK4Hm8lUQ9Hr/58
         ix9tf75Nags5OLVloM3XmiCAnLbYxMEFbJh1P39p5fIFBhpu7V0Lb/+A2vPruNMygGh9
         VaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289758; x=1730894558;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIWnqYTnrKHu+4Hw2LPmtmvtTTqQCpp6TAxzxTOWGaQ=;
        b=j3fd3UU/kRn1RC7aPN3ZusvCCYcpZ0hRHHusVLQRYGfKtdov9M+RVMm2wgaMUU1wq9
         qsjXXbKmqhOwX51oY/SrMbo5f4NAvMwwlf3VoLTbmAFvS9bo0ItK9D93ta7BiETSPVIz
         CkshTmD8D+Hk2dPgqTVBjGwBnVW17G8R9IWk+OW66z1vV1rnR8V67VTQiJlnEWvelvBj
         l+0Qq3XHZ5LO90C8dtpHGd6rnOH3zdPkQe8iSJq8kTI78ksn+VyCt4R9HASdDttxfwUz
         QXALun+J31nOo4mv4Y5O8X4pD9+AvlnWTXSRy3/cUJV4/FprLrVRtfhTSr2GBQngjhT7
         rNgQ==
X-Gm-Message-State: AOJu0Yzm9J49jQyMezTEAkeZjCiIwPPBXjHRWGJPnv1dufDbjE2JiBmH
	rT31XUoeONuQJv8dRllZa6reYCWVmGaeCZ4mQiY40JkPWRaiJq/sAGhAnoS+NW5vOr87Plz0vkP
	S
X-Google-Smtp-Source: AGHT+IH3+G7aVXMEByazf7w8Z9fPWM7M41jLggny6LP4wTju1uYlZaHO8PlDztpE6T4w96matm0lrw==
X-Received: by 2002:a17:90b:17cb:b0:2e2:cc47:ce1a with SMTP id 98e67ed59e1d1-2e8f104ec26mr19439618a91.1.1730289755740;
        Wed, 30 Oct 2024 05:02:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa3cdb8sm1501083a91.22.2024.10.30.05.02.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 05:02:33 -0700 (PDT)
Message-ID: <67222059.170a0220.1d289f.419b@mx.google.com>
Date: Wed, 30 Oct 2024 05:02:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20241030
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 181 builds: 4 failed, 177 passed,
 5895 warnings (next-20241030)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 181 builds: 4 failed, 177 passed, 5895 warnings (next-20=
241030)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20241030/

Tree: next
Branch: master
Git Describe: next-20241030
Git Commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-12) FAIL

arm64:
    defconfig+arm64-chromebook: (gcc-12) FAIL
    defconfig+arm64-chromebook+kselftest: (gcc-12) FAIL

mips:
    decstation_64_defconfig: (gcc-12) FAIL

Warnings Detected:

arc:
    axs103_defconfig (gcc-12): 5 warnings
    axs103_smp_defconfig (gcc-12): 5 warnings
    haps_hs_defconfig (gcc-12): 2 warnings
    haps_hs_smp_defconfig (gcc-12): 2 warnings
    haps_hs_smp_defconfig+debug (gcc-12): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-12): 2 warnings
    hsdk_defconfig (gcc-12): 2 warnings
    nsimosci_hs_defconfig (gcc-12): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-12): 2 warnings
    vdk_hs38_defconfig (gcc-12): 4 warnings
    vdk_hs38_smp_defconfig (gcc-12): 4 warnings

arm64:

arm:
    collie_defconfig (gcc-12): 1 warning

i386:

mips:
    32r2el_defconfig (gcc-12): 3 warnings
    32r2el_defconfig+debug (gcc-12): 3 warnings
    32r2el_defconfig+kselftest (gcc-12): 3 warnings
    ath79_defconfig (gcc-12): 3 warnings
    bigsur_defconfig (gcc-12): 15 warnings
    cavium_octeon_defconfig (gcc-12): 12 warnings
    db1xxx_defconfig (gcc-12): 21 warnings
    decstation_64_defconfig (gcc-12): 9 warnings
    decstation_defconfig (gcc-12): 9 warnings
    decstation_r4k_defconfig (gcc-12): 9 warnings
    eyeq5_defconfig (gcc-12): 1 warning
    eyeq6_defconfig (gcc-12): 1 warning
    fuloong2e_defconfig (gcc-12): 1 warning
    gpr_defconfig (gcc-12): 1 warning
    ip22_defconfig (gcc-12): 1 warning
    ip28_defconfig (gcc-12): 3 warnings
    ip32_defconfig (gcc-12): 1 warning
    jazz_defconfig (gcc-12): 5 warnings
    lemote2f_defconfig (gcc-12): 22 warnings
    loongson1b_defconfig (gcc-12): 1 warning
    loongson1c_defconfig (gcc-12): 1 warning
    loongson2k_defconfig (gcc-12): 5 warnings
    loongson3_defconfig (gcc-12): 5 warnings
    maltaaprp_defconfig (gcc-12): 4 warnings
    omega2p_defconfig (gcc-12): 2 warnings
    rb532_defconfig (gcc-12): 1 warning
    rm200_defconfig (gcc-12): 8 warnings
    rt305x_defconfig (gcc-12): 2 warnings
    sb1250_swarm_defconfig (gcc-12): 16 warnings
    vocore2_defconfig (gcc-12): 2 warnings

riscv:
    defconfig (clang-17): 2 warnings
    nommu_k210_defconfig (clang-17): 2525 warnings
    nommu_k210_sdcard_defconfig (clang-17): 3104 warnings

sparc:
    allnoconfig (gcc-12): 3 warnings
    sparc32_defconfig (gcc-12): 4 warnings
    sparc64_defconfig (gcc-12): 18 warnings
    sparc64_defconfig+debug (gcc-12): 16 warnings
    sparc64_defconfig+kselftest (gcc-12): 16 warnings
    tinyconfig (gcc-12): 3 warnings

x86_64:
    x86_64_defconfig+kselftest (rustc-1.75): 1 warning


Warnings summary:

    704  include/asm-generic/io.h:829:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    704  include/asm-generic/io.h:820:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    703  include/asm-generic/io.h:847:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    703  include/asm-generic/io.h:838:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    703  include/asm-generic/io.h:812:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    703  include/asm-generic/io.h:804:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    702  include/asm-generic/io.h:1175:55: warning: performing pointer arit=
hmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    687  7 warnings generated.
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    kernel/fork.c:3074:2: warning: #warning clone3() entry point is mi=
ssing, please fix [-Wcpp]
    9    3074 | #warning clone3() entry point is missing, please fix
    5    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last'=
 is used uninitialized [-Wuninitialized]
    5    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index=
' is used uninitialized [-Wuninitialized]
    4    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (in=
terrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, bu=
t node is not an interrupt provider
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    3    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    3    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    3    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =
=E2=80=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =
=E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototyp=
e for =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototyp=
e for =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous protot=
ype for =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =
=E2=80=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =
=E2=80=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =
=E2=80=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =
=E2=80=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =
=E2=80=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype fo=
r =E2=80=98which_prom=E2=80=99 [-Wmissing-prototypes]
    3    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cel=
ls' found, but node is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node=
 is not an interrupt provider
    3    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    3    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_p=
rovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    3    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    3    77 warning warningss generated generated.
    2    {standard input}:152: Warning: macro instruction expanded into mul=
tiple instructions
    2    warnings generated.
    2    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o:=
 missing .note.GNU-stack section implies executable stack
    2    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missin=
g .note.GNU-stack section implies executable stack
    2    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =
=E2=80=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]
    2    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous =
prototype for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    2    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototyp=
e for =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous=
 prototype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previou=
s prototype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous=
 prototype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous pr=
ototype for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous p=
rototype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous pr=
ototype for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for=
 =E2=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson32/common/platform.c:71:5: warning: no previous =
prototype for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    2    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previou=
s prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4:=
 Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missi=
ng '#interrupt-cells' in interrupt provider
    2    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (i=
nterrupt_map): Failed prerequisite 'interrupt_provider'
    2    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrup=
t_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but n=
ode is not an interrupt provider
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14edc9
    1    llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': inval=
id PT_DYNAMIC size (0x138)
    1    llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': PT_DY=
NAMIC dynamic table is invalid: SHT_DYNAMIC will be used
    1    include/asm-generic/io.hI_I:O804B:A2S: warning: E performing point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]+
    1    include/asm-generic/io.h:1175:55: warning: In file included from .=
./fs/iomap/iter.c:7:
    1    include/asm-generic/io.h:1175:55: In file included from warning: .=
./lib/devres.c:7:
    1    i../include/asm-generic/io.hn:e847 :i2:n swarning: wperforming poi=
nter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-ar=
ithmetic](
    1    drivers/watchdog/octeon-wdt-main.c:210:6: warning: no previous pro=
totype for =E2=80=98octeon_wdt_nmi_stage3=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototy=
pe for =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    1    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototy=
pe for =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    1    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous protot=
ype for =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous protot=
ype for =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous protot=
ype for =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prot=
otype for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous protot=
ype for =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =
=E2=80=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =
=E2=80=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =
=E2=80=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =
=E2=80=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=
=80=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=
=80=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=
=80=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =
=E2=80=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototy=
pe for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype=
 for =E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototyp=
e for =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototy=
pe for =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous proto=
type for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototy=
pe for =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous protot=
ype for =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototyp=
e for =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototy=
pe for =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prot=
otype for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous protot=
ype for =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototy=
pe for =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototy=
pe for =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for=
 =E2=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/pcie-octeon.c:1471:5: warning: no previous prototype=
 for =E2=80=98octeon_pcie_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/pci-octeon.c:234:12: warning: no previous prototype =
for =E2=80=98octeon_pci_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/pci/msi-octeon.c:343:12: warning: no previous prototype =
for =E2=80=98octeon_msi_initialize=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for=
 =E2=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =
=E2=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =
=E2=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous pr=
ototype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous pr=
ototype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous =
prototype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous =
prototype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no prev=
ious prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prot=
otype for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prot=
otype for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous pro=
totype for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous pro=
totype for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: n=
o previous prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no=
 previous prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: n=
o previous prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: n=
o previous prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no=
 previous prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: n=
o previous prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: n=
o previous prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-pr=
ototypes]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no=
 previous prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-proto=
types]
    1    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no=
 previous prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prot=
otypes]
    1    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype fo=
r =E2=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype fo=
r =E2=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype fo=
r =E2=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype fo=
r =E2=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototy=
pe for =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous protot=
ype for =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototyp=
e for =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototy=
pe for =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/setup.c:52:13: warning: no previous prototype for =
=E2=80=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =
=E2=80=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=
=80=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=
=80=98disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =
=E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototyp=
e for =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no prev=
ious prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-p=
rototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: w=
arning: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en=
_enable=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warni=
ng: no previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd=
_order_cdr=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous=
 prototype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-pro=
totypes]
    1    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previou=
s prototype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous p=
rototype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous =
prototype for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous p=
rototype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous =
prototype for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous =
prototype for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous =
prototype for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous =
prototype for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous =
prototype for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:94:12: warning: no previous p=
rototype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:450:12: warning: no previous =
prototype for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/alchemy/devboards/db1000.c:36:12: warning: no previous p=
rototype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    1    arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Faile=
d prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed pr=
erequisite 'interrupt_provider'
    1    arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interru=
pt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an inter=
rupt provider
    1    arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Fa=
iled prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_p=
rovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    1    arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provi=
der): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt pro=
vider
    1    arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed pre=
requisite 'interrupt_provider'
    1    arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    1    arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_p=
rovider): /cpu_card/pct: '#interrupt-cells' found, but node is not an inter=
rupt provider
    1    arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt=
_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    1    arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provi=
der): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    1    arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_pro=
vider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is no=
t an interrupt provider
    1    S../include/asm-generic/io.hE: 838+: 2(:a dwarning: dperforming po=
inter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-a=
rithmetic]r
    1    In file included from 7../include/asm-generic/hardirq.h: warning17=
s:
    1    In file included from 7 warnings generated.
    1    In file included from ../include/linux/memcontrol.h7 warnings gene=
rated.
    1    In file included from ../include/linux/irq.h:207 warnings generate=
d.
    1    In file included from ../arch/riscv/include/asm/io.h:7 warnings ge=
nerated.
    1    : warning: performing pointer arithmetic on a null pointer has und=
efined behavior [-Wnull-pointer-arithmetic]
    1    812 |         i7 warnings generated.
    1    804 |         insb(a7 warnings generated.
    1    118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (add=
r), b7 warnings generated.
    1    106 | #define insl(addr, bu7 warnings generated.
    1    ..sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.=
o: missing .note.GNU-stack section implies executable stack
    1    .../arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no =
previous prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissi=
ng-prototypes]
    1    .....sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: m=
issing .note.GNU-stack section implies executable stack

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/irqchip/irq-ath79-cpu.c:89:13: warning: no previous prototype f=
or =E2=80=98ath79_cpu_irq_init=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:26:5: warning: no previous prototype f=
or =E2=80=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    drivers/irqchip/irq-ath79-misc.c:181:13: warning: no previous prototype=
 for =E2=80=98ath79_misc_irq_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider):=
 /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider=
): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an =
interrupt provider
    arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequis=
ite 'interrupt_provider'
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provid=
er): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_prov=
ider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not=
 an interrupt provider
    arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prere=
quisite 'interrupt_provider'
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/sibyte/bcm1480/setup.c:104:13: warning: no previous prototype=
 for =E2=80=98bcm1480_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/irq.c:200:13: warning: no previous prototype f=
or =E2=80=98init_bcm1480_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/time.c:10:13: warning: no previous prototype f=
or =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:49:6: warning: no previous prototype for=
 =E2=80=98bcm1480_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/bcm1480/smp.c:158:6: warning: no previous prototype fo=
r =E2=80=98bcm1480_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-bcm1480.c:96:6: warning: no previous prototype fo=
r =E2=80=98sb1480_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-bcm1480.c:37:13: warning: no previous prototype f=
or =E2=80=98sb1480_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 12 warning=
s, 0 section mismatches

Warnings:
    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:53:6: warnin=
g: no previous prototype for =E2=80=98__cvmx_interrupt_gmxx_rxx_int_en_enab=
le=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/executive/cvmx-helper-errata.c:49:6: warning: n=
o previous prototype for =E2=80=98__cvmx_helper_errata_qlm_disable_2nd_orde=
r_cdr=E2=80=99 [-Wmissing-prototypes]
    arch/mips/cavium-octeon/octeon-platform.c:701:13: warning: no previous =
prototype for =E2=80=98octeon_fill_mac_addresses=E2=80=99 [-Wmissing-protot=
ypes]
    arch/mips/cavium-octeon/smp.c:100:6: warning: no previous prototype for=
 =E2=80=98octeon_send_ipi_single=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:297:5: warning: no previous prototype for =E2=
=80=98register_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:303:5: warning: no previous prototype for =E2=
=80=98unregister_co_cache_error_notifier=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:342:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_recoverable=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/c-octeon.c:351:17: warning: no previous prototype for =E2=
=80=98cache_parity_error_octeon_non_recoverable=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/pci/pci-octeon.c:234:12: warning: no previous prototype for =
=E2=80=98octeon_pci_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/pci/pcie-octeon.c:1471:5: warning: no previous prototype for =
=E2=80=98octeon_pcie_pcibios_map_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/pci/msi-octeon.c:343:12: warning: no previous prototype for =
=E2=80=98octeon_msi_initialize=E2=80=99 [-Wmissing-prototypes]
    drivers/watchdog/octeon-wdt-main.c:210:6: warning: no previous prototyp=
e for =E2=80=98octeon_wdt_nmi_stage3=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous prot=
otype for =E2=80=98db1x_register_pcmcia_socket=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/alchemy/devboards/platform.c:152:12: warning: no previous pro=
totype for =E2=80=98db1x_register_norflash=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:36:12: warning: no previous protot=
ype for =E2=80=98db1000_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:94:12: warning: no previous protot=
ype for =E2=80=98db1500_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1000.c:450:12: warning: no previous proto=
type for =E2=80=98db1000_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:116:12: warning: no previous proto=
type for =E2=80=98db1200_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1200.c:799:12: warning: no previous proto=
type for =E2=80=98db1200_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:786:12: warning: no previous proto=
type for =E2=80=98db1300_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1300.c:855:12: warning: no previous proto=
type for =E2=80=98db1300_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:56:12: warning: no previous protot=
ype for =E2=80=98db1550_board_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:501:12: warning: no previous proto=
type for =E2=80=98db1550_pci_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1550.c:582:12: warning: no previous proto=
type for =E2=80=98db1550_dev_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/alchemy/devboards/db1xxx.c:52:13: warning: no previous protot=
ype for =E2=80=98get_system_type=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:138:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_setmode=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:235:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_setcolreg=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:294:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_pan_display=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:341:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_fb_mmap=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:523:6: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_remove=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:548:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_suspend=E2=80=99 [-Wmissing-prototypes]
    drivers/video/fbdev/au1100fb.c:565:5: warning: no previous prototype fo=
r =E2=80=98au1100fb_drv_resume=E2=80=99 [-Wmissing-prototypes]
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-12) =E2=80=94 FAIL, 0 errors, 9 warnings=
, 0 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 9 warnings, 0=
 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 9 warning=
s, 0 section mismatches

Warnings:
    arch/mips/dec/reset.c:22:17: warning: no previous prototype for =E2=80=
=98dec_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:27:17: warning: no previous prototype for =E2=80=
=98dec_machine_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:32:17: warning: no previous prototype for =E2=80=
=98dec_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/reset.c:38:13: warning: no previous prototype for =E2=80=
=98dec_intr_halt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/setup.c:780:25: warning: no previous prototype for =E2=80=
=98dec_irq_dispatch=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:15:5: warning: no previous prototype for=
 =E2=80=98ds1287_timer_state=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:20:5: warning: no previous prototype for=
 =E2=80=98ds1287_set_base_clock=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-ds1287.c:103:12: warning: no previous prototype f=
or =E2=80=98ds1287_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': invalid PT=
_DYNAMIC size (0x138)
    llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': PT_DYNAMIC=
 dynamic table is invalid: SHT_DYNAMIC will be used

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-12) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-12) =E2=80=94 FAIL, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eyeq5_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    {standard input}:152: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
eyeq6_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    {standard input}:152: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provider):=
 /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
    arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed prerequi=
site 'interrupt_provider'

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-12) =E2=80=94 FAIL, 0 errors, 2 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototype fo=
r =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototype fo=
r =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip30_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous prototype f=
or =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/jazz/irq.c:38:6: warning: no previous prototype for =E2=80=98=
disable_r4030_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:55:13: warning: no previous prototype for =E2=80=
=98init_r4030_ints=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/irq.c:128:13: warning: no previous prototype for =E2=80=
=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/reset.c:49:6: warning: no previous prototype for =E2=80=
=98jazz_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/jazz/setup.c:52:13: warning: no previous prototype for =E2=80=
=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 22 warnings, 0 =
section mismatches

Warnings:
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_ide_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no prev=
ious prototype for =E2=80=98pci_ide_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no prev=
ious prototype for =E2=80=98pci_acc_write_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no prev=
ious prototype for =E2=80=98pci_acc_read_reg=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ohci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: no pre=
vious prototype for =E2=80=98pci_ohci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no prev=
ious prototype for =E2=80=98pci_isa_write_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_bar=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: no pre=
vious prototype for =E2=80=98pci_isa_write_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: no pre=
vious prototype for =E2=80=98pci_isa_read_reg=E2=80=99 [-Wmissing-prototype=
s]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: no pre=
vious prototype for =E2=80=98pci_ehci_write_reg=E2=80=99 [-Wmissing-prototy=
pes]
    arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: no pre=
vious prototype for =E2=80=98pci_ehci_read_reg=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous =
prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prototype=
 for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prototype=
 for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous prototyp=
e for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous prototyp=
e for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototy=
pe for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototy=
pe for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous proto=
type for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous proto=
type for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warn=
ing (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#=
interrupt-cells' in interrupt provider
    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interru=
pt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but nod=
e is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interr=
upt_map): Failed prerequisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/mips/kernel/vpe-mt.c:177:7: warning: no previous prototype for =E2=
=80=98vpe_alloc=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:195:5: warning: no previous prototype for =E2=
=80=98vpe_start=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:205:5: warning: no previous prototype for =E2=
=80=98vpe_stop=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/vpe-mt.c:226:5: warning: no previous prototype for =E2=
=80=98vpe_free=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-12) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-12) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-12) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2525 warni=
ngs, 0 section mismatches

Warnings:
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    S../include/asm-generic/io.hE: 838+: 2(:a dwarning: dperforming pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]r
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    i../include/asm-generic/io.hn:e847 :i2:n swarning: wperforming pointer =
arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithme=
tic](
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    77 warning warningss generated generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    77 warning warningss generated generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from 7../include/asm-generic/hardirq.h: warning17s:
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    77 warning warningss generated generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.hI_I:O804B:A2S: warning: E performing pointer ar=
ithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmeti=
c]+
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 310=
4 warnings, 0 section mismatches

Warnings:
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    In file included from 7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    warnings generated.
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    warnings generated.
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    812 |         i7 warnings generated.
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: In file included from ../fs/=
iomap/iter.c:7:
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from ../include/linux/irq.h:207 warnings generated.
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from ../arch/riscv/include/asm/io.h:7 warnings generat=
ed.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    : warning: performing pointer arithmetic on a null pointer has undefine=
d behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: In file included from warning: ../lib=
/devres.c:7:
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    804 |         insb(a7 warnings generated.
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from ../include/linux/memcontrol.h7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), b=
7 warnings generated.
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    106 | #define insl(addr, bu7 warnings generated.
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:804:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:812:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:820:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:829:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:838:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:847:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1175:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.
    7 warnings generated.

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_pr=
ovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for =E2=
=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/sni/reset.c:28:6: warning: no previous prototype for =E2=80=
=98sni_machine_restart=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/reset.c:45:6: warning: no previous prototype for =E2=80=
=98sni_machine_power_off=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:211:6: warning: no previous prototype for =E2=80=
=98sni_rm200_mask_and_ack_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:331:6: warning: no previous prototype for =E2=80=
=98sni_rm200_init_8259A=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:387:13: warning: no previous prototype for =E2=80=
=98sni_rm200_i8259_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/rm200.c:428:6: warning: no previous prototype for =E2=80=
=98disable_rm200_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcimt.c:206:6: warning: no previous prototype for =E2=80=
=98disable_pcimt_irq=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sni/pcit.c:168:6: warning: no previous prototype for =E2=80=
=98disable_pcit_irq=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 16 warnings=
, 0 section mismatches

Warnings:
    arch/mips/sibyte/sb1250/setup.c:79:5: warning: no previous prototype fo=
r =E2=80=98sb1250_m3_workaround_needed=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/setup.c:168:13: warning: no previous prototype =
for =E2=80=98sb1250_setup=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/irq.c:182:13: warning: no previous prototype fo=
r =E2=80=98init_sb1250_irqs=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/time.c:10:13: warning: no previous prototype fo=
r =E2=80=98plat_time_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:38:6: warning: no previous prototype for =
=E2=80=98sb1250_smp_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/sb1250/smp.c:147:6: warning: no previous prototype for=
 =E2=80=98sb1250_mailbox_interrupt=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/setup.c:59:5: warning: no previous prototype for=
 =E2=80=98swarm_be_handler=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:108:5: warning: no previous prot=
otype for =E2=80=98xicor_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:167:10: warning: no previous pro=
totype for =E2=80=98xicor_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_xicor1241.c:203:5: warning: no previous prot=
otype for =E2=80=98xicor_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:139:5: warning: no previous prototy=
pe for =E2=80=98m41t81_set_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:186:10: warning: no previous protot=
ype for =E2=80=98m41t81_get_time=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sibyte/swarm/rtc_m41t81.c:219:5: warning: no previous prototy=
pe for =E2=80=98m41t81_probe=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/cevt-sb1250.c:95:6: warning: no previous prototype for=
 =E2=80=98sb1250_clockevent_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/kernel/csrc-sb1250.c:53:13: warning: no previous prototype fo=
r =E2=80=98sb1250_clocksource_init=E2=80=99 [-Wmissing-prototypes]
    arch/mips/mm/cerr-sb1.c:165:17: warning: no previous prototype for =E2=
=80=98sb1_cache_error=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 18 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missing .no=
te.GNU-stack section implies executable stack
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o: miss=
ing .note.GNU-stack section implies executable stack
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 16 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missing .no=
te.GNU-stack section implies executable stack
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o: miss=
ing .note.GNU-stack section implies executable stack
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 16 wa=
rnings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
    .../arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previ=
ous prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-pr=
ototypes]
    .....sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missin=
g .note.GNU-stack section implies executable stack
    ..sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o: mi=
ssing .note.GNU-stack section implies executable stack
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/fork.c:3074:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3074 | #warning clone3() entry point is missing, please fix

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_pro=
vider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_pro=
vider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed pre=
requisite 'interrupt_provider'
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.75) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.75) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14edc9

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.75) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.75) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---
For more info write to <info@kernelci.org>

