Return-Path: <linux-next+bounces-3473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F0962366
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 11:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 463D61C20841
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF85A48;
	Wed, 28 Aug 2024 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="QalUUfXW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E615B107
	for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837470; cv=none; b=bdwDRBy3DxS/8L8lLMAIxetlhKaOBQvtkT3IBHoUGVIyosxqLgve/lZCm3mjWM4DUl0WJpqMYpNd/MDTIhUNutdJa6IYlMv4BGOpXYEmMblWo6WrOxzc661JWVoY8LjjwQONiKwVm8l346WNexZ83XV4/GB0RrJ4TouULnh3CDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837470; c=relaxed/simple;
	bh=vFGn8Qh3Xt/qVWGMIZvQstrT2zW10aH0fbhpQaEb6Lc=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=DYVPUrUdgfSDrp4t5q+oiNcmx0sTTmX3q6JpunPmQm0ehGh1DOdyRmwLhPx7+jitw4+51vlw6rSA3RoSoM+KK/sdMirKiI7VwJ//9CT6xIWNUjSii4FQBuBQr7kyDv3RwtvB/9GlnuaGnSjrplGFfk7voohbD25HljBNYBIQK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=QalUUfXW; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db2315d7ceso980687b6e.1
        for <linux-next@vger.kernel.org>; Wed, 28 Aug 2024 02:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1724837442; x=1725442242; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c+4UdW5k1LHh45trDbzW5yKqYBqgoZtnWPLOIxCIRr4=;
        b=QalUUfXWlrC2t1527nUOtI79DnhQfTIWn5ykdzfDdHV4hQXBuUum2uPNTDfqGJjw/0
         k4st6BJ2K+VBeSofhuWjerjzqCKIH1Q3jRUmc98zaSgaYTIqVZUuu/nJNk7YqMIy0jmR
         SMmaghPjPLCjL+e+Wx6+1jDGh2nl46fSF08QNIgXz3sLF+sAKvD1ZDT/rAKnNFguBwvB
         cp+Am+37NReaLn3073pbf7/ZkkRooxyEA5JbDgq1u/ZiZGgAqzNZuzavEgJL5QTBXNzR
         4q9l1Yh2Npf+ntxjBDsEacnxciXKXyZOSGfDmWxdKnZJ/jhdTiYkHxZYtS7j1o2NQ1ps
         BShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837442; x=1725442242;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+4UdW5k1LHh45trDbzW5yKqYBqgoZtnWPLOIxCIRr4=;
        b=Q7JhDaTekYGu/t01k27birVdbE9aX+G5FjFOQluZalN1lWyzNnRRpeC7lb7XQvLEm8
         bHVqCWVVMRk84RFeaebtxRMvm23iPm9DhKLlH2S+X/uZVHxaEDXXPJbCH9AXM50thEtE
         8p0oB89yUUEnTwRPBlEcCKM3wJ/cb+sde3nugVPZQu8B/aYFSirhRaCs91n74nVCOTL1
         bIqdonHepw7Ro1ageuQHmPVx/AHpbAkl5xzhpbh92yZQAgE4zdBibNz8gjGI4C6QRTIT
         INtEg4OMZAgMIjN5625u87eqmD2+60z6GnNoQ6rg2P9umDxw8fLsS7wGhopnveEuob4R
         /Dpw==
X-Gm-Message-State: AOJu0YwwBko65odfEJF6bzaoQYrDJtaEgq+WK2xE+kwYWtOueIWrPB2i
	VNgGPQridBgEDmk7czZ+bHUDR9ZzkDNhSj4DN4/ap4pv+WPlIcXVb+yVNG6vuD50brAu8vxfZQa
	fML8=
X-Google-Smtp-Source: AGHT+IH2/NNXVWxkzsERgBo6+2o+efRBLYDShE53x4ARtIpDG5bdvs9GYxl04ZTUcOFeyFQ5pty4qA==
X-Received: by 2002:a05:6808:1981:b0:3da:a779:ab70 with SMTP id 5614622812f47-3deffba953amr1491611b6e.45.1724837440280;
        Wed, 28 Aug 2024 02:30:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9aca1193sm9158223a12.6.2024.08.28.02.30.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:30:39 -0700 (PDT)
Message-ID: <66ceee3f.050a0220.1bb96f.21c7@mx.google.com>
Date: Wed, 28 Aug 2024 02:30:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20240828
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 187 builds: 19 failed, 168 passed, 21 errors,
 5473 warnings (next-20240828)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 187 builds: 19 failed, 168 passed, 21 errors, 5473 warni=
ngs (next-20240828)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20240828/

Tree: next
Branch: master
Git Describe: next-20240828
Git Commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-12) FAIL

arm64:
    defconfig+arm64-chromebook: (gcc-12) FAIL
    defconfig+arm64-chromebook+kselftest: (gcc-12) FAIL

arm:
    allnoconfig: (clang-17) FAIL
    allnoconfig: (gcc-12) FAIL
    imxrt_defconfig: (gcc-12) FAIL
    lpc18xx_defconfig: (gcc-12) FAIL
    mps2_defconfig: (gcc-12) FAIL
    stm32_defconfig: (gcc-12) FAIL
    tinyconfig: (gcc-12) FAIL
    vf610m4_defconfig: (gcc-12) FAIL

i386:
    i386_defconfig+kselftest: (gcc-12) FAIL

mips:
    decstation_64_defconfig: (gcc-12) FAIL

riscv:
    nommu_k210_defconfig: (clang-17) FAIL
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_virt_defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (gcc-12) FAIL
    nommu_k210_sdcard_defconfig: (gcc-12) FAIL
    nommu_virt_defconfig: (gcc-12) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-12): 5 warnings
    axs103_defconfig (gcc-12): 14 warnings
    axs103_smp_defconfig (gcc-12): 13 warnings
    haps_hs_defconfig (gcc-12): 11 warnings
    haps_hs_smp_defconfig (gcc-12): 10 warnings
    haps_hs_smp_defconfig+debug (gcc-12): 10 warnings
    haps_hs_smp_defconfig+kselftest (gcc-12): 6 warnings
    hsdk_defconfig (gcc-12): 10 warnings
    nsimosci_hs_defconfig (gcc-12): 11 warnings
    nsimosci_hs_smp_defconfig (gcc-12): 10 warnings
    tinyconfig (gcc-12): 4 warnings
    vdk_hs38_defconfig (gcc-12): 9 warnings
    vdk_hs38_smp_defconfig (gcc-12): 8 warnings

arm64:
    defconfig (gcc-12): 8 warnings
    defconfig (clang-17): 18 warnings
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-12): 8 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-12): 8 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-12): 8 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-12): 8 warnings
    defconfig+arm64-chromebook (gcc-12): 4 warnings
    defconfig+arm64-chromebook+kselftest (gcc-12): 4 warnings
    defconfig+debug (gcc-12): 8 warnings
    defconfig+kselftest (gcc-12): 8 warnings

arm:
    allnoconfig (gcc-12): 1 error, 1 warning
    allnoconfig (clang-17): 1 error, 2 warnings
    am200epdkit_defconfig (gcc-12): 1 warning
    aspeed_g4_defconfig (gcc-12): 1 warning
    assabet_defconfig (gcc-12): 1 warning
    at91_dt_defconfig (gcc-12): 1 warning
    bcm2835_defconfig (gcc-12): 1 warning
    collie_defconfig (gcc-12): 2 warnings
    davinci_all_defconfig (gcc-12): 2 warnings
    footbridge_defconfig (gcc-12): 1 warning
    gemini_defconfig (gcc-12): 1 warning
    h3600_defconfig (gcc-12): 1 warning
    imx_v4_v5_defconfig (gcc-12): 1 warning
    imxrt_defconfig (gcc-12): 1 error, 1 warning
    integrator_defconfig (gcc-12): 1 warning
    ixp4xx_defconfig (gcc-12): 1 warning
    jornada720_defconfig (gcc-12): 1 warning
    lpc18xx_defconfig (gcc-12): 1 error, 1 warning
    lpc32xx_defconfig (gcc-12): 1 warning
    mmp2_defconfig (gcc-12): 1 warning
    moxart_defconfig (gcc-12): 1 warning
    mps2_defconfig (gcc-12): 1 error, 1 warning
    multi_v4t_defconfig (gcc-12): 1 warning
    multi_v5_defconfig (clang-17): 2 warnings
    multi_v5_defconfig (gcc-12): 1 warning
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-12): 1 warning
    multi_v7_defconfig+kselftest (gcc-12): 1 warning
    mvebu_v5_defconfig (gcc-12): 1 warning
    mxs_defconfig (gcc-12): 1 warning
    neponset_defconfig (gcc-12): 1 warning
    netwinder_defconfig (gcc-12): 1 warning
    nhk8815_defconfig (gcc-12): 1 warning
    orion5x_defconfig (gcc-12): 1 warning
    pxa168_defconfig (gcc-12): 1 warning
    pxa3xx_defconfig (gcc-12): 1 warning
    pxa910_defconfig (gcc-12): 1 warning
    pxa_defconfig (gcc-12): 2 warnings
    s3c6400_defconfig (gcc-12): 1 warning
    s5pv210_defconfig (gcc-12): 1 warning
    sama5_defconfig (gcc-12): 1 warning
    sama7_defconfig (gcc-12): 1 warning
    spear3xx_defconfig (gcc-12): 1 warning
    spear6xx_defconfig (gcc-12): 1 warning
    spitz_defconfig (gcc-12): 1 warning
    stm32_defconfig (gcc-12): 1 error, 1 warning
    tinyconfig (gcc-12): 1 error
    versatile_defconfig (gcc-12): 1 warning
    vf610m4_defconfig (gcc-12): 1 error, 1 warning
    vt8500_v6_v7_defconfig (gcc-12): 1 warning
    wpcm450_defconfig (gcc-12): 1 warning

i386:
    allnoconfig (gcc-12): 1 warning
    allnoconfig (clang-17): 2 warnings
    i386_defconfig+kselftest (gcc-12): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-12): 3 warnings
    32r2el_defconfig+debug (gcc-12): 3 warnings
    32r2el_defconfig+kselftest (gcc-12): 4 warnings
    ath25_defconfig (gcc-12): 1 warning
    ath79_defconfig (gcc-12): 4 warnings
    bcm47xx_defconfig (gcc-12): 1 warning
    bcm63xx_defconfig (gcc-12): 1 warning
    bigsur_defconfig (gcc-12): 15 warnings
    cavium_octeon_defconfig (gcc-12): 12 warnings
    ci20_defconfig (gcc-12): 1 warning
    cobalt_defconfig (gcc-12): 1 warning
    cu1000-neo_defconfig (gcc-12): 1 warning
    cu1830-neo_defconfig (gcc-12): 1 warning
    db1xxx_defconfig (gcc-12): 23 warnings
    decstation_64_defconfig (gcc-12): 10 warnings
    decstation_defconfig (gcc-12): 10 warnings
    decstation_r4k_defconfig (gcc-12): 10 warnings
    eyeq5_defconfig (gcc-12): 1 warning
    eyeq6_defconfig (gcc-12): 1 warning
    fuloong2e_defconfig (gcc-12): 2 warnings
    gcw0_defconfig (gcc-12): 1 warning
    gpr_defconfig (gcc-12): 2 warnings
    ip22_defconfig (gcc-12): 3 warnings
    ip28_defconfig (gcc-12): 4 warnings
    ip32_defconfig (gcc-12): 2 warnings
    jazz_defconfig (gcc-12): 7 warnings
    lemote2f_defconfig (gcc-12): 23 warnings
    loongson1b_defconfig (gcc-12): 2 warnings
    loongson1c_defconfig (gcc-12): 2 warnings
    loongson2k_defconfig (gcc-12): 6 warnings
    loongson3_defconfig (gcc-12): 5 warnings
    malta_defconfig (gcc-12): 1 warning
    malta_kvm_defconfig (gcc-12): 1 warning
    malta_qemu_32r6_defconfig (gcc-12): 2 warnings
    maltaaprp_defconfig (gcc-12): 5 warnings
    maltasmvp_defconfig (gcc-12): 1 warning
    maltasmvp_eva_defconfig (gcc-12): 1 warning
    maltaup_defconfig (gcc-12): 1 warning
    maltaup_xpa_defconfig (gcc-12): 1 warning
    mtx1_defconfig (gcc-12): 1 warning
    omega2p_defconfig (gcc-12): 3 warnings
    pic32mzda_defconfig (gcc-12): 1 warning
    qi_lb60_defconfig (gcc-12): 1 warning
    rb532_defconfig (gcc-12): 2 warnings
    rbtx49xx_defconfig (gcc-12): 1 warning
    rm200_defconfig (gcc-12): 10 warnings
    rs90_defconfig (gcc-12): 1 warning
    rt305x_defconfig (gcc-12): 3 warnings
    sb1250_swarm_defconfig (gcc-12): 16 warnings
    vocore2_defconfig (gcc-12): 3 warnings

riscv:
    defconfig (clang-17): 18 warnings
    defconfig (gcc-12): 8 warnings
    defconfig+debug (gcc-12): 8 warnings
    nommu_k210_defconfig (clang-17): 2 errors, 1619 warnings
    nommu_k210_defconfig (gcc-12): 2 errors, 4 warnings
    nommu_k210_sdcard_defconfig (gcc-12): 2 errors, 4 warnings
    nommu_k210_sdcard_defconfig (clang-17): 2 errors, 1605 warnings
    nommu_virt_defconfig (clang-17): 2 errors, 1675 warnings
    nommu_virt_defconfig (gcc-12): 2 errors, 4 warnings

sparc:
    allnoconfig (gcc-12): 4 warnings
    sparc32_defconfig (gcc-12): 5 warnings
    sparc64_defconfig (gcc-12): 18 warnings
    sparc64_defconfig+debug (gcc-12): 16 warnings
    tinyconfig (gcc-12): 3 warnings

x86_64:
    allnoconfig (clang-17): 2 warnings
    allnoconfig (gcc-12): 1 warning
    x86_64_defconfig+kselftest (rustc-1.75): 1 warning

Errors summary:

    10   mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 un=
declared (first use in this function)
    4    mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLE=
S_CEILING'
    3    mm/vma.h:183:28: error: =E2=80=98FIRST_USER_ADDRESS=E2=80=99 undec=
lared (first use in this function)
    3    mm/vma.h:183:21: error: use of undeclared identifier 'FIRST_USER_A=
DDRESS'
    1    fs/xfs/xfs_super.c:1654:1: error: format =E2=80=98%ld=E2=80=99 exp=
ects argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dfo=
rmat=3D]

Warnings summary:

    348  include/asm-generic/io.h:787:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    348  include/asm-generic/io.h:760:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    348  include/asm-generic/io.h:752:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    348  include/asm-generic/io.h:585:33: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    348  include/asm-generic/io.h:574:61: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    347  include/asm-generic/io.h:778:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    347  include/asm-generic/io.h:769:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    347  include/asm-generic/io.h:548:31: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    347  include/asm-generic/io.h:1115:55: warning: performing pointer arit=
hmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    344  include/asm-generic/io.h:605:59: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    343  include/asm-generic/io.h:595:59: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    341  include/asm-generic/io.h:561:61: warning: performing pointer arith=
metic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    339  include/asm-generic/io.h:744:2: warning: performing pointer arithm=
etic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    334  13 warnings generated.
    84   kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=
=E2=80=99 [-Wunused-variable]
    44   <stdin>:1612:2: warning: #warning syscall removexattrat not implem=
ented [-Wcpp]
    44   <stdin>:1609:2: warning: #warning syscall listxattrat not implemen=
ted [-Wcpp]
    44   <stdin>:1606:2: warning: #warning syscall getxattrat not implement=
ed [-Wcpp]
    44   <stdin>:1603:2: warning: #warning syscall setxattrat not implement=
ed [-Wcpp]
    16   fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 e=
xpects argument of type =E2=80=98long int=E2=80=99, but argument 5 has type=
 =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    8    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    7    kernel/fork.c:3075:2: warning: #warning clone3() entry point is mi=
ssing, please fix [-Wcpp]
    7    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W=
#warnings]
    7    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#w=
arnings]
    7    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#wa=
rnings]
    7    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#wa=
rnings]
    7    4 warnings generated.
    7    3075 | #warning clone3() entry point is missing, please fix
    7    1612 | #warning syscall removexattrat not implemented
    7    1609 | #warning syscall listxattrat not implemented
    7    1606 | #warning syscall getxattrat not implemented
    7    1603 | #warning syscall setxattrat not implemented
    5    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunus=
ed-variable]
    5    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last'=
 is used uninitialized [-Wuninitialized]
    5    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index=
' is used uninitialized [-Wuninitialized]
    4    kernel/irq/proc.c:343:10: warning: unused variable 'umode' [-Wunus=
ed-variable]
    4    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (in=
terrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, bu=
t node is not an interrupt provider
    4    1 warning generated.
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
    3    13 warnings and 2 errors generated.
    2    {standard input}:152: Warning: macro instruction expanded into mul=
tiple instructions
    2    warning: performing pointer arithmetic on a null pointer has undef=
ined behavior [-Wnull-pointer-arithmetic]
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
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    2    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    2    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    2    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
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
    2    :2: warning: performing pointer arithmetic on a null pointer has u=
ndefined behavior [-Wnull-pointer-arithmetic]
    2    37 | #define __le16_to_cpu(x) ((__for13 warnings generated.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14ed29
    1    sl(addr,../include/asm-generic/io.h :561:61: warning: performing p=
ointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-=
arithmetic]
    1    l(addr, buffer, ../include/asm-generic/io.h:595:59: warning: perfo=
rming pointer arithmetic on a null pointer has undefined behavior [-Wnull-p=
ointer-arithmetic]
    1    include/uapi/linux/byteorder/little_endian.h warning: performing p=
ointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-=
arithmetic]
    1    include/asm-generic/io.hP:C778I:_2I:O Bwarning: ASperforming point=
er arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arit=
hmetic]E
    1    include/asm-generic/io.h:595:../include/asm-generic/io.h:561:61: w=
arning: performing pointer arithmetic on a null pointer has undefined behav=
ior [-Wnull-pointer-arithmetic]
    1    include/asm-generic/io.h:1115:55:../include/asm-generic/io.h:561:6=
1: warning: performing pointer arithmetic on a null pointer has undefined b=
ehavior [-Wnull-pointer-arithmetic]
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
    1    count) __insl../include/asm-generic/io.h:605:59: warning: performi=
ng pointer arithmetic on a null pointer has undefined behavior [-Wnull-poin=
ter-arithmetic]
    1    ce)cpu_to_le../include/asm-generic/io.h:595:59: warning: performin=
g pointer arithmetic on a null pointer has undefined behavior [-Wnull-point=
er-arithmetic]
    1    cc1: all warnings being treated as errors
    1    b(addr, buffe../include/asm-generic/io.h:605:59: warning: performi=
ng pointer arithmetic on a null pointer has undefined behavior [-Wnull-poin=
ter-arithmetic]
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
    1    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =
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
    1    _cpu(x) ((__force../include/asm-generic/io.h:561:61: warning: perf=
orming pointer arithmetic on a null pointer has undefined behavior [-Wnull-=
pointer-arithmetic]
    1    In file included from 13 warnings generated.
    1    In file included from ../arch/riscv/kernel/perf_regs.c../include/a=
sm-generic/io.h:605:59: warning: performing pointer arithmetic on a null po=
inter has undefined behavior [-Wnull-pointer-arithmetic]
    1    :744:2: warning: performing pointer arithmetic on a null pointer h=
as undefined behavior [-Wnull-pointer-arithmetic]
    1    : warning: performing pointer arithmetic on a null pointer has und=
efined behavior [-Wnull-pointer-arithmetic]
    1    76913 warnings generated.
    1    744 |         insb(addr, buffer, c13o warnings generated.
    1    744 |         insb(addr, buffer, c../include/asm-generic/io.h:744:=
2: warning: performing pointer arithmetic on a null pointer has undefined b=
ehavior [-Wnull-pointer-arithmetic]
    1    744 |         insb(../include/asm-generic/io.h:561:61: warning: pe=
rforming pointer arithmetic on a null pointer has undefined behavior [-Wnul=
l-pointer-arithmetic]
    1    605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IO=
BASE../include/asm-generic/io.h :+744 :a2d:d rwarning: );performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
    1    605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IO=
BASE + addr)../include/asm-generic/io.h;:744:2: warning: performing pointer=
 arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithm=
etic]
    1    595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IO=
BA13 warnings generated.
    1    595 |         ../include/asm-generic/io.h_:744:2: warning: perform=
ing pointer arithmetic on a null pointer has undefined behavior [-Wnull-poi=
nter-arithmetic]
    1    585 |         __raw_writeb(value, PCI_IOBASE +../include/asm-gener=
ic/io.h:744:2: warning: performing pointer arithmetic on a null pointer has=
 undefined behavior [-Wnull-pointer-arithmetic]
    1    585 |         __raw_writeb(value, PCI../include/asm-generic/io.h:5=
61:61: warning: performing pointer arithmetic on a null pointer has undefin=
ed behavior [-Wnull-pointer-arithmetic]
    1    574 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PC=
I13 warnings generated.
    1    561 |         val =3D __le16_to_cpu((13 warnings generated.
    1    548 |         val =3D _../include/asm-generic/io.h:744:2: warning:=
 performing pointer arithmetic on a null pointer has undefined behavior [-W=
null-pointer-arithmetic]
    1    2: warning: performing pointer arithmetic on a null pointer has un=
defined behavior [-Wnull-pointer-arithmetic]
    1    16(value), ../include/asm-generic/io.h:605:59: warning: performing=
 pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointe=
r-arithmetic]
    1    119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (13 =
warnings generated.
    1    118 | #define outs../include/asm-generic/io.h:595:59: warning: per=
forming pointer arithmetic on a null pointer has undefined behavior [-Wnull=
-pointer-arithmetic]
    1    105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (a13 w=
arnings generated.
    1    104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE13 warnin=
gs generated.
    1    104 | #define insb(addr, b../include/asm-generic/io.h:561:61: warn=
ing: performing pointer arithmetic on a null pointer has undefined behavior=
 [-Wnull-pointer-arithmetic]

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
32r2el_defconfig+kselftest (mips, gcc-12) =E2=80=94 PASS, 0 errors, 4 warni=
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
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-va=
riable]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:10: warning: unused variable 'umode' [-Wunused-va=
riable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section =
mismatches

Errors:
    mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLES_CEI=
LING'

Warnings:
    kernel/irq/proc.c:343:10: warning: unused variable 'umode' [-Wunused-va=
riable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:10: warning: unused variable 'umode' [-Wunused-va=
riable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
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
axs103_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 14 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider):=
 /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider=
): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an =
interrupt provider
    arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequis=
ite 'interrupt_provider'
    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-va=
riable]
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
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
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

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
ci20_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    drivers/pcmcia/pxa2xx_sharpsl.c:206:5: warning: no previous prototype f=
or =E2=80=98pcmcia_collie_init=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 23 warnings, 0 se=
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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
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
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-12) =E2=80=94 FAIL, 0 errors, 10 warning=
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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnin=
gs, 0 section mismatches

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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    arch/mips/dec/prom/init.c:45:13: warning: no previous prototype for =E2=
=80=98which_prom=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 18 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 18 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 erro=
rs, 8 warnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 erro=
rs, 8 warnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 error=
s, 8 warnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-12) =E2=80=94 PASS, 0 error=
s, 8 warnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-12) =E2=80=94 FAIL, 0 errors, 4 warn=
ings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-12) =E2=80=94 FAIL, 0 erro=
rs, 4 warnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

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
footbridge_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous pro=
totype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    drivers/net/ethernet/amd/au1000_eth.c:574:6: warning: no previous proto=
type for =E2=80=98au1000_ReleaseDB=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 11 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provider):=
 /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
    arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed prerequi=
site 'interrupt_provider'
    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-va=
riable]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-12) =E2=80=94 PASS, 0 errors, 10 warn=
ings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-12) =E2=80=94 FAIL, 0 errors, 6 w=
arnings, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
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
hsdk_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches

Errors:
    fs/xfs/xfs_super.c:1654:1: error: format =E2=80=98%ld=E2=80=99 expects =
argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=80=
=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=
=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/sgi-ip22/ip28-berr.c:474:5: warning: no previous prototype fo=
r =E2=80=98ip28_show_be_info=E2=80=99 [-Wmissing-prototypes]
    arch/mips/sgi-ip22/ip22-eisa.c:95:12: warning: no previous prototype fo=
r =E2=80=98ip22_eisa_init=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    drivers/scsi/sgiwd93.c:173:6: warning: no previous prototype for =E2=80=
=98sgiwd93_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ip30_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    drivers/net/ethernet/sgi/meth.c:271:5: warning: no previous prototype f=
or =E2=80=98meth_reset=E2=80=99 [-Wmissing-prototypes]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
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
    arch/mips/jazz/setup.c:54:13: warning: no previous prototype for =E2=80=
=98plat_mem_setup=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 23 warnings, 0 =
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
    arch/mips/loongson2ef/common/pm.c:59:13: warning: no previous prototype=
 for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:66:12: warning: no previous prototype=
 for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:114:13: warning: no previous prototyp=
e for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/common/pm.c:118:13: warning: no previous prototyp=
e for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous =
prototype for =E2=80=98mach_prom_init_machtype=E2=80=99 [-Wmissing-prototyp=
es]
    arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototy=
pe for =E2=80=98setup_wakeup_events=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototy=
pe for =E2=80=98wakeup_loongson=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous proto=
type for =E2=80=98mach_suspend=E2=80=99 [-Wmissing-prototypes]
    arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous proto=
type for =E2=80=98mach_resume=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/mips/loongson32/common/platform.c:71:5: warning: no previous proto=
type for =E2=80=98ls1x_eth_mux_init=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

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
lpc18xx_defconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
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
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/irq/proc.c:343:10: warning: unused variable 'umode' [-Wunused-va=
riable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-12) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 FAIL, 2 errors, 1619 warni=
ngs, 0 section mismatches

Errors:
    mm/vma.h:183:21: error: use of undeclared identifier 'FIRST_USER_ADDRES=
S'
    mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLES_CEI=
LING'

Warnings:
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings and 2 errors generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    76913 warnings generated.
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE.=
./include/asm-generic/io.h :+744 :a2d:d rwarning: );performing pointer arit=
hmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from 13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    _cpu(x) ((__force../include/asm-generic/io.h:561:61: warning: performin=
g pointer arithmetic on a null pointer has undefined behavior [-Wnull-point=
er-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    In file included from ../arch/riscv/kernel/perf_regs.c../include/asm-ge=
neric/io.h:605:59: warning: performing pointer arithmetic on a null pointer=
 has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    585 |         __raw_writeb(value, PCI_IOBASE +../include/asm-generic/io=
.h:744:2: warning: performing pointer arithmetic on a null pointer has unde=
fined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    warning: performing pointer arithmetic on a null pointer has undefined =
behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    37 | #define __le16_to_cpu(x) ((__for13 warnings generated.
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    744 |         insb(addr, buffer, c13o warnings generated.
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBA13 =
warnings generated.
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:../include/asm-generic/io.h:561:61: warnin=
g: performing pointer arithmetic on a null pointer has undefined behavior [=
-Wnull-pointer-arithmetic]
    : warning: performing pointer arithmetic on a null pointer has undefine=
d behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    ce)cpu_to_le../include/asm-generic/io.h:595:59: warning: performing poi=
nter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-ar=
ithmetic]
    16(value), ../include/asm-generic/io.h:605:59: warning: performing poin=
ter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-ari=
thmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE =
+ addr)../include/asm-generic/io.h;:744:2: warning: performing pointer arit=
hmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    574 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI13 w=
arnings generated.
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    585 |         __raw_writeb(value, PCI../include/asm-generic/io.h:561:61=
: warning: performing pointer arithmetic on a null pointer has undefined be=
havior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    595 |         ../include/asm-generic/io.h_:744:2: warning: performing p=
ointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-=
arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    2: warning: performing pointer arithmetic on a null pointer has undefin=
ed behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-12) =E2=80=94 FAIL, 2 errors, 4 warnings, =
0 section mismatches

Errors:
    mm/vma.h:183:28: error: =E2=80=98FIRST_USER_ADDRESS=E2=80=99 undeclared=
 (first use in this function)
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-12) =E2=80=94 FAIL, 2 errors, 4 war=
nings, 0 section mismatches

Errors:
    mm/vma.h:183:28: error: =E2=80=98FIRST_USER_ADDRESS=E2=80=99 undeclared=
 (first use in this function)
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 2 errors, 160=
5 warnings, 0 section mismatches

Errors:
    mm/vma.h:183:21: error: use of undeclared identifier 'FIRST_USER_ADDRES=
S'
    mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLES_CEI=
LING'

Warnings:
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings and 2 errors generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, clang-17) =E2=80=94 FAIL, 2 errors, 1675 warni=
ngs, 0 section mismatches

Errors:
    mm/vma.h:183:21: error: use of undeclared identifier 'FIRST_USER_ADDRES=
S'
    mm/vma.h:184:19: error: use of undeclared identifier 'USER_PGTABLES_CEI=
LING'

Warnings:
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    <stdin>:1603:2: warning: syscall setxattrat not implemented [-W#warning=
s]
    1603 | #warning syscall setxattrat not implemented
    <stdin>:1606:2: warning: syscall getxattrat not implemented [-W#warning=
s]
    1606 | #warning syscall getxattrat not implemented
    <stdin>:1609:2: warning: syscall listxattrat not implemented [-W#warnin=
gs]
    1609 | #warning syscall listxattrat not implemented
    <stdin>:1612:2: warning: syscall removexattrat not implemented [-W#warn=
ings]
    1612 | #warning syscall removexattrat not implemented
    4 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings and 2 errors generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    warning: performing pointer arithmetic on a null pointer has undefined =
behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (a13 warnin=
gs generated.
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55:../include/asm-generic/io.h:561:61: wa=
rning: performing pointer arithmetic on a null pointer has undefined behavi=
or [-Wnull-pointer-arithmetic]
    include/uapi/linux/byteorder/little_endian.h warning: performing pointe=
r arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arith=
metic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    548 |         val =3D _../include/asm-generic/io.h:744:2: warning: perf=
orming pointer arithmetic on a null pointer has undefined behavior [-Wnull-=
pointer-arithmetic]
    104 | #define insb(addr, b../include/asm-generic/io.h:561:61: warning: =
performing pointer arithmetic on a null pointer has undefined behavior [-Wn=
ull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    :2: warning: performing pointer arithmetic on a null pointer has undefi=
ned behavior [-Wnull-pointer-arithmetic]
    118 | #define outs../include/asm-generic/io.h:595:59: warning: performi=
ng pointer arithmetic on a null pointer has undefined behavior [-Wnull-poin=
ter-arithmetic]
    b(addr, buffe../include/asm-generic/io.h:605:59: warning: performing po=
inter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-a=
rithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (13 warni=
ngs generated.
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    561 |         val =3D __le16_to_cpu((13 warnings generated.
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE13 warnings ge=
nerated.
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    :2: warning: performing pointer arithmetic on a null pointer has undefi=
ned behavior [-Wnull-pointer-arithmetic]
    744 |         insb(../include/asm-generic/io.h:561:61: warning: perform=
ing pointer arithmetic on a null pointer has undefined behavior [-Wnull-poi=
nter-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    l(addr, buffer, ../include/asm-generic/io.h:595:59: warning: performing=
 pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointe=
r-arithmetic]
    count) __insl../include/asm-generic/io.h:605:59: warning: performing po=
inter arithmetic on a null pointer has undefined behavior [-Wnull-pointer-a=
rithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    :744:2: warning: performing pointer arithmetic on a null pointer has un=
defined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    744 |         insb(addr, buffer, c../include/asm-generic/io.h:744:2: wa=
rning: performing pointer arithmetic on a null pointer has undefined behavi=
or [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.hP:C778I:_2I:O Bwarning: ASperforming pointer ar=
ithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmeti=
c]E
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    sl(addr,../include/asm-generic/io.h :561:61: warning: performing pointe=
r arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arith=
metic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    37 | #define __le16_to_cpu(x) ((__for13 warnings generated.
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.
    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:744:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:752:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:760:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:769:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:778:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:787:2: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    include/asm-generic/io.h:1115:55: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    13 warnings generated.

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-12) =E2=80=94 FAIL, 2 errors, 4 warnings, =
0 section mismatches

Errors:
    mm/vma.h:183:28: error: =E2=80=98FIRST_USER_ADDRESS=E2=80=99 undeclared=
 (first use in this function)
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 11 warnings, =
0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'
    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-va=
riable]
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_pr=
ovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt =
provider
    arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed =
prerequisite 'interrupt_provider'
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    arch/mips/rb532/serial.c:48:12: warning: no previous prototype for =E2=
=80=98setup_serial_port=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

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
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_super.c:1654:1: warning: format =E2=80=98%ld=E2=80=99 expect=
s argument of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=
=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

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
sparc32_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
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
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
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
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

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
tinyconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/fork.c:3075:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3075 | #warning clone3() entry point is missing, please fix

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

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
vdk_hs38_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 9 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
    arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_pro=
vider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node i=
s not an interrupt provider
    arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'
    kernel/irq/proc.c:343:17: warning: unused variable 'umode' [-Wunused-va=
riable]
    drivers/base/regmap/regcache-maple.c:115:23: warning: 'upper_index' is =
used uninitialized [-Wuninitialized]
    drivers/base/regmap/regcache-maple.c:115:36: warning: 'upper_last' is u=
sed uninitialized [-Wuninitialized]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 8 warnings, =
0 section mismatches

Warnings:
    <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-=
Wcpp]
    <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-=
Wcpp]
    <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [=
-Wcpp]
    <stdin>:1612:2: warning: #warning syscall removexattrat not implemented=
 [-Wcpp]
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
versatile_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-12) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    mm/vma.h:184:26: error: =E2=80=98USER_PGTABLES_CEILING=E2=80=99 undecla=
red (first use in this function)

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/mips/ralink/irq.c:86:5: warning: no previous prototype for =E2=80=
=98get_c0_perfcount_int=E2=80=99 [-Wmissing-prototypes]
    arch/mips/ralink/irq.c:92:14: warning: no previous prototype for =E2=80=
=98get_c0_compare_int=E2=80=99 [-Wmissing-prototypes]
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/irq/proc.c:343:17: warning: unused variable =E2=80=98umode=E2=80=
=99 [-Wunused-variable]

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
BR: .text+0x14ed29

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

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-12) =E2=80=94 PASS, 0 err=
ors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>

