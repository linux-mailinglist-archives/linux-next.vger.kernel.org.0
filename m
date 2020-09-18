Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9140126F9F7
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 12:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgIRKLA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 06:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgIRKLA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 06:11:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1819FC06174A
        for <linux-next@vger.kernel.org>; Fri, 18 Sep 2020 03:11:00 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id z19so3131952pfn.8
        for <linux-next@vger.kernel.org>; Fri, 18 Sep 2020 03:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MiYgYupjfEvIsz2zJphzhCXHe2pcyjtrNZsxx7pME38=;
        b=EBYXLMLcACDQJ2EgZl/P2dUUM2VbpF+c0vfAeeADKC4iqJ9cKDYcJqcYU+jqEJaytE
         MjhBy0m9N1KM/6q3ru3+Z6b4Yth4QSxHjYBZ8KKpzxVJ9WF+k6p1nbiLpyCOXgp0cW6C
         HYF6aIwYHPmLBEqKJsTU+gWwY51l5wTVJmFCWMtCdd/p/iNQm0PFCYiLaJ9CJWkaDwYe
         MPCHaINx9jkaSP3cdx60YWI9IIMnyjfNmmrgwaBnX9hOBQTuXzQibCBUgXI6BBWIvfXl
         BwweEMnRAsniIDpeSNMd3DbmIGnldRK8whGqL93eLJLhLsp6RnffFz4fYbVzt8Q6x2hl
         iFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MiYgYupjfEvIsz2zJphzhCXHe2pcyjtrNZsxx7pME38=;
        b=HPtQTWbDRgRXFqIEklZO+6kXP3+JVx+6FK7XcZty2ImDsClC/sa7hP8ugIgOYRlHdt
         v/O5J/I4pDx6FeS5nD9AeDyhAsWg6dNCEr6CAWeB0PonFv8QLxxsx/QnEtyEPmPygCJq
         0I0gwZ8e5j0ORAigOP+o6oD+ILGmXvm7VnA2U7AhbQTdPX4yZhaq9Qy6P+jN4cMlmJwv
         JjBSLdB71mA/3rMUFjXgYuuHPVt+f5RQGjN1FNb+bWZnRgDtvgKLX0ejT1k99eOMIhW4
         53SMnArT4yu3T1qKNQZ+Aw0fkc7dBO6iCrLhEEEiMRWFcuabNuz/U3qJMM2xGa3S9Q+T
         RMBg==
X-Gm-Message-State: AOAM533fhAajczPRbjKbVNw0Dts1eZytcTB5wIJ1mDmbM8HxIcsY3GXY
        9Pgvv7ePVFhwdgeadam6Da95XmlczsBUlQ==
X-Google-Smtp-Source: ABdhPJxjOw52i26NAK4mvwAeHRNKh0syv6xUaPGbbHoqOmc66zrbZucQV6UeAwZXQpa7v2hix5s1Og==
X-Received: by 2002:aa7:96e1:0:b029:13e:d13d:a138 with SMTP id i1-20020aa796e10000b029013ed13da138mr30955569pfq.32.1600423856742;
        Fri, 18 Sep 2020 03:10:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gg13sm2367351pjb.3.2020.09.18.03.10.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 03:10:55 -0700 (PDT)
Message-ID: <5f6487af.1c69fb81.ee805.5199@mx.google.com>
Date:   Fri, 18 Sep 2020 03:10:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200918
Subject: next/master build: 228 builds: 17 failed, 211 passed, 1465 errors,
 635 warnings (next-20200918)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 228 builds: 17 failed, 211 passed, 1465 errors, 635 warn=
ings (next-20200918)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200918/

Tree: next
Branch: master
Git Describe: next-20200918
Git Commit: b652d2a5f2a4e93d803cc33eb57fdc41ee528500
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    defconfig: (clang-10) FAIL
    allmodconfig: (clang-9) FAIL
    allnoconfig: (clang-9) FAIL
    defconfig: (clang-9) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-9) FAIL

arm:
    multi_v7_defconfig: (clang-10) FAIL
    allmodconfig: (clang-9) FAIL
    allnoconfig: (clang-9) FAIL
    aspeed_g5_defconfig: (clang-9) FAIL
    multi_v5_defconfig: (clang-9) FAIL
    multi_v7_defconfig: (clang-9) FAIL
    milbeaut_m10v_defconfig: (gcc-8) FAIL

riscv:
    nommu_virt_defconfig: (gcc-8) FAIL

x86_64:
    x86_64_defconfig: (clang-10) FAIL
    allmodconfig: (clang-9) FAIL
    allnoconfig: (clang-9) FAIL
    x86_64_defconfig: (clang-9) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-8): 167 errors, 26 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-9): 2 errors
    allmodconfig (gcc-8): 10 warnings
    allnoconfig (clang-9): 2 errors
    allnoconfig (gcc-8): 2 warnings
    defconfig (clang-9): 1 error
    defconfig (gcc-8): 8 warnings
    defconfig (clang-10): 1 error, 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-9): 1 error
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 8 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 8 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 8 warnings
    defconfig+kselftest (gcc-8): 302 errors, 11 warnings
    tinyconfig (gcc-8): 2 warnings

arm:
    allmodconfig (clang-9): 2 errors
    allmodconfig (gcc-8): 14 warnings
    allnoconfig (clang-9): 2 errors
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (clang-9): 2 errors
    aspeed_g5_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 1 warning
    corgi_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (gcc-8): 2 warnings
    efm32_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 3 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 5 warnings
    moxart_defconfig (gcc-8): 1 warning
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (clang-9): 2 errors
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (clang-9): 2 errors
    multi_v7_defconfig (clang-10): 1 error, 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 6 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 6 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 6 warnings
    multi_v7_defconfig+kselftest (gcc-8): 280 errors, 10 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 3 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 5 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 5 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig+kselftest (gcc-8): 59 errors, 30 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig+kselftest (gcc-8): 280 errors, 23 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 6 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 6 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    cu1000-neo_defconfig (gcc-8): 1 warning
    cu1830-neo_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 warning
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 6 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 6 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 6 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 6 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rs90_defconfig (gcc-8): 1 warning
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig+kselftest (gcc-8): 280 errors, 11 warnings
    nommu_virt_defconfig (gcc-8): 2 errors, 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (gcc-8): 2 warnings
    allmodconfig (clang-9): 1 error
    allnoconfig (clang-9): 2 errors
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-10): 1 error
    x86_64_defconfig (clang-9): 2 errors
    x86_64_defconfig+kselftest (gcc-8): 71 errors, 39 warnings

Errors summary:

    582  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such =
file or directory
    375  /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: =
fatal error: asm/types.h: No such file or directory
    120  /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h:=
 No such file or directory
    17   /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, =
your version of Clang is too old - please use 10.0.1 or newer.
    16   /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h=
: No such file or directory
    15   arc-elf32-gcc: error: unrecognized command line option =E2=80=98-p=
thread=E2=80=99
    14   /bin/sh: 3: llc: not found
    14   /bin/sh: 1: llc: not found
    14   /bin/sh: 1: clang: not found
    11   test_execve.c:4:10: fatal error: cap-ng.h: No such file or directo=
ry
    9    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or dire=
ctory
    9    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or dir=
ectory
    8    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or dire=
ctory
    8    posix_timers.c:10:10: fatal error: sys/time.h: No such file or dir=
ectory
    8    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file =
or directory
    8    collect2: error: ld returned 1 exit status
    8    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such f=
ile or directory
    8    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or=
 directory
    8    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such=
 file or directory
    6    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or direc=
tory
    4    test_verifier.c:25:10: fatal error: sys/capability.h: No such file=
 or directory
    4    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or direc=
tory
    4    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No s=
uch file or directory
    4    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such fi=
le or directory
    4    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h=
: No such file or directory
    3    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or direct=
ory
    3    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or direc=
tory
    3    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directo=
ry
    3    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    3    error: fallthrough annotation does not directly precede switch lab=
el
    2    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or dir=
ectory
    2    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_=
GCM_128=E2=80=99?
    2    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=
=E2=80=99t known
    2    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_=
GCM_128=E2=80=99?
    2    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=
=E2=80=99t known
    2    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared =
here (not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    2    signals.S:4:10: fatal error: asm/unistd.h: No such file or directo=
ry
    2    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    2    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or d=
irectory
    2    regression_enomem.c:5:10: fatal error: linux/types.h: No such file=
 or directory
    2    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such=
 file or directory
    2    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or dir=
ectory
    2    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98flags=E2=80=99
    2    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98parent_tid=E2=80=99
    2    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has init=
ializer but incomplete type
    2    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 =
isn=E2=80=99t known
    2    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    2    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    2    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98parent_tid=E2=80=99
    2    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    2    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    2    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    2    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98flags=E2=80=99
    2    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 ha=
s initializer but incomplete type
    2    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=
=80=99 isn=E2=80=99t known
    2    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or direc=
tory
    2    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or di=
rectory
    2    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98KVM_GET_=
DIRTY_LOG=E2=80=99?
    2    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98num_pages=E2=80=99
    2    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98first_page=E2=80=99
    2    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has i=
nitializer but incomplete type
    2    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98slot=E2=80=99
    2    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    2    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    2    lib/assert.c:12:10: fatal error: execinfo.h: No such file or direc=
tory
    2    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No=
 such file or directory
    2    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    2    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    2    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or =
directory
    2    close_range_test.c:55:10: error: expected expression before =E2=80=
=98return=E2=80=99
    2    close_range_test.c:47:11: error: expected expression before =E2=80=
=98return=E2=80=99
    2    close_range_test.c:200:11: error: expected expression before =E2=
=80=98return=E2=80=99
    2    close_range_test.c:111:11: error: expected expression before =E2=
=80=98return=E2=80=99
    2    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=
=80=99 has initializer but incomplete type
    2    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98a=
rgs=E2=80=99 isn=E2=80=99t known
    2    /scratch/linux/include/linux/compiler-clang.h/scratch/linux/includ=
e/linux/compiler-clang.h::1111::33::  errorerror: : Sorry, your version of =
Clang is too old - please use 10.0.1 or newer.Sorry, your version of Clang =
is too old - please use 10.0.1 or newer.
    1    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No suc=
h file or directory
    1    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or direct=
ory
    1    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    1    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No suc=
h file or directory
    1    splice_read.c:49:15: error: =E2=80=98SPLICE_F_MOVE=E2=80=99 undecl=
ared (first use in this function)
    1    setdate.c:10:10: fatal error: linux/rtc.h: No such file or directo=
ry
    1    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or =
directory
    1    seccomp_bpf.c:16:20: error: missing binary operator before token "=
("
    1    seccomp_benchmark.c:11:10: fatal error: linux/filter.h: No such fi=
le or directory
    1    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    1    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directo=
ry
    1    reuseport_bpf_cpu.c:17:10: fatal error: arpa/inet.h: No such file =
or directory
    1    reuseport_bpf.c:11:10: fatal error: error.h: No such file or direc=
tory
    1    resolve_test.c:12:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    1    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    pm_nl_ctl.c:4:10: fatal error: error.h: No such file or directory
    1    pidns.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    1    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    1    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or dire=
ctory
    1    nosymfollow-test.c:12:10: fatal error: sys/mount.h: No such file o=
r directory
    1    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or direct=
ory
    1    nanosleep.c:27:10: fatal error: sys/timex.h: No such file or direc=
tory
    1    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    1    mq_perf_tests.c:38:10: fatal error: mqueue.h: No such file or dire=
ctory
    1    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or dire=
ctory
    1    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or di=
rectory
    1    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or=
 directory
    1    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrie=
r.h: No such file or directory
    1    membarrier_test_multi_thread.c:3:10: fatal error: linux/membarrier=
.h: No such file or directory
    1    load_address.c:5:10: fatal error: link.h: No such file or directory
    1    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or di=
rectory
    1    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or dir=
ectory
    1    dnotify_test.c:28:42: error: =E2=80=98DN_MULTISHOT=E2=80=99 undecl=
ared (first use in this function)
    1    dnotify_test.c:28:32: error: =E2=80=98DN_CREATE=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98O_CREAT=E2=80=99?
    1    dnotify_test.c:28:22: error: =E2=80=98DN_MODIFY=E2=80=99 undeclare=
d (first use in this function)
    1    dnotify_test.c:28:12: error: =E2=80=98F_NOTIFY=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98O_NOCTTY=E2=80=99?
    1    dnotify_test.c:27:12: error: =E2=80=98F_SETSIG=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98FD_SETSIZE=E2=80=99?
    1    dnotify_test.c:24:12: error: =E2=80=98SIGRTMIN=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98SIGTTIN=E2=80=99?
    1    dnotify_test.c:23:17: error: =E2=80=98SA_SIGINFO=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98S_IFIFO=E2=80=99?
    1    dnotify_test.c:21:5: error: =E2=80=98struct sigaction=E2=80=99 has=
 no member named =E2=80=98sa_sigaction=E2=80=99
    1    dnotify_test.c:13:17: error: =E2=80=98siginfo_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} has no member named =E2=80=98si_fd=E2=80=
=99; did you mean =E2=80=98si_code=E2=80=99?
    1    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or dir=
ectory
    1    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file=
 or directory
    1    clone3_clear_sighand.c:11:10: fatal error: linux/sched.h: No such =
file or directory
    1    clone3.c:8:10: fatal error: linux/types.h: No such file or directo=
ry
    1    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file=
 or directory
    1    11:3: error: Sorry, your version of Clang is too old - please use =
10.0.1 or newer.
    1    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dire=
nt.h> not supported"
    1    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /scratch/linux/mm/secretmem.c:50:33: error: =E2=80=98PMD_PAGE_ORDE=
R=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98M=
AX_ORDER=E2=80=99?
    1    /scratch/linux/mm/secretmem.c:146:6: error: implicit declaration o=
f function =E2=80=98mlock_future_check=E2=80=99; did you mean =E2=80=98lock=
s_free_lock=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    1    /scratch/linux/include/linux/compiler-clang.h/scratch/linux/includ=
e/linux/compiler-clang.h:11::113::3 : errorerror: : Sorry, your version of =
Clang is too old - please use 10.0.1 or newer.Sorry, your version of Clang =
is too old - please use 10.0.1 or newer.
    1    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/in=
t-ll64.h: No such file or directory

Warnings summary:

    384  <stdin>:1532:2: warning: #warning syscall memfd_secret not impleme=
nted [-Wcpp]
    24   cc1: warning: -fsanitize=3Daddress not supported for this target
    18   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    18   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus
    8    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    8    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address=
 are not supported for this target
    8    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: w=
arning: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=
=98long unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=
=99 to =E2=80=98705032704=E2=80=99 [-Woverflow]
    7    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftes=
t/lkdtm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest=
/lkdtm/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/bu=
ild/kselftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /r=
oot/build/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORR=
UPT_STACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_=
GUARD_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING=
.sh /root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/D=
OUBLE_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kself=
test/lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWR=
ITE_ALLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/bui=
ld/kselftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUD=
DY_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root=
/build/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB=
_FREE_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/ks=
elftest/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root=
/build/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.=
sh /root/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXE=
C_STACK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftes=
t/lkdtm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/bu=
ild/kselftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL=
.sh /root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/l=
kdtm/ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kse=
lftest/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.=
sh /root/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselfte=
st/lkdtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_=
NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVER=
FLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselft=
est/lkdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC=
_AND_TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEG=
ATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kself=
test/lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/buil=
d/kselftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REF=
COUNT_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NO=
T_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATUR=
ATED.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /roo=
t/build/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOM=
IC_TIMING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/bui=
ld/kselftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHIT=
ELIST_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/=
build/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lk=
dtm/USERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh=
 /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkd=
tm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE=
.sh
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    6    pidfd.h:30:21: warning: excess elements in struct initializer
    6    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =
=E2=80=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=
=E2=80=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=
=3D]
    6    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    6    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)
    3    WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/im=
x-common.o
    3    1 warning generated.
    3    /scratch/linux/drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unus=
ed variable =E2=80=98desc=E2=80=99 [-Wunused-variable]
    2    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-=
Wunused-variable]
    2    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-=
Wunused-variable]
    2    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
    2    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    2    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    2    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    2    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    2    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    2    pidfd_setns_test.c:80:18: warning: excess elements in struct initi=
alizer
    2    memfd_test.c:90:6: warning: implicit declaration of function =E2=
=80=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    memfd_test.c:64:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    memfd_test.c:397:6: warning: implicit declaration of function =E2=
=80=98fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplici=
t-function-declaration]
    2    lib/kvm_util.c:299:51: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:298:45: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:67: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:54: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=
=80=99 [-Wunused-variable]
    2    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=
=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-functio=
n-declaration]
    2    fuse_test.c:261:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    close_range_test.c:47:5: warning: implicit declaration of function=
 =E2=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
    2    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_ar=
gs=E2=80=99 declared inside parameter list will not be visible outside of t=
his definition or declaration
    2    clone3/clone3_selftests.h:16:25: warning: excess elements in struc=
t initializer
    2    aarch64-linux-gnu-ld: warning: orphan section `.igot.plt' from `ar=
ch/arm64/kernel/head.o' being placed in section `.igot.plt'
    2    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h'=
 differs from latest version at 'include/uapi/linux/netlink.h'
    2    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h'=
 differs from latest version at 'include/uapi/linux/if_link.h'
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: w=
arning: cast from pointer to integer of different size [-Wpointer-to-int-ca=
st]
    2    /scratch/linux/drivers/base/regmap/regmap.c:713:6: warning: variab=
le 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes=
-uninitialized]
    2    /scratch/linux/drivers/base/regmap/regmap.c:711:9: note: initializ=
e the variable 'ret' to silence this warning
    2    /scratch/linux/arch/arm64/kernel/smp.c:967:13: warning: =E2=80=98i=
pi_teardown=E2=80=99 defined but not used [-Wunused-function]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    sync_stress_parallelism.c:93:2: warning: implicit declaration of f=
unction =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atf=
ork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_parallelism.c:100:2: warning: implicit declaration of =
function =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfo=
rk=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:95:3: warning: implicit declaration of func=
tion =E2=80=98pthread_mutex_unlock=E2=80=99; did you mean =E2=80=98pthread_=
atfork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:93:3: warning: implicit declaration of func=
tion =E2=80=98pthread_mutex_lock=E2=80=99; did you mean =E2=80=98pthread_at=
fork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:182:3: warning: implicit declaration of fun=
ction =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:174:3: warning: implicit declaration of fun=
ction =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfor=
k=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:171:2: warning: implicit declaration of fun=
ction =E2=80=98pthread_mutex_init=E2=80=99; did you mean =E2=80=98pthread_a=
tfork=E2=80=99? [-Wimplicit-function-declaration]
    1    splice_read.c:48:12: warning: implicit declaration of function =E2=
=80=98splice=E2=80=99; did you mean =E2=80=98pipe=E2=80=99? [-Wimplicit-fun=
ction-declaration]
    1    posix_timers.c:40:9: warning: implicit declaration of function =E2=
=80=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-functi=
on-declaration]
    1    posix_timers.c:169:8: warning: implicit declaration of function =
=E2=80=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99?=
 [-Wimplicit-function-declaration]
    1    posix_timers.c:156:8: warning: implicit declaration of function =
=E2=80=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? =
[-Wimplicit-function-declaration]
    1    default_file_splice_read.c:7:9: warning: implicit declaration of f=
unction =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-=
Wimplicit-function-declaration]
    1    cc1: some warnings being treated as errors
    1    <stdin>:1532:2: warning: syscall memfd_secret not implemented [-W#=
warnings]
    1    /tmp/ccxLtHJh.s:18192: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccxLtHJh.s:18120: Warning: using r15 results in unpredictable=
 behaviour
    1    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:198:32: w=
arning: cast to pointer from integer of different size [-Wint-to-pointer-ca=
st]
    1    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redef=
ined
    1    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warni=
ng: =E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused=
-function]
    1    .config:1178:warning: override: UNWINDER_GUESS changes choice state
    1    #warning syscall memfd_secret not implemented

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2b4c): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x28fc): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 280 errors, 23 war=
nings, 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 14 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /tmp/ccxLtHJh.s:18120: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccxLtHJh.s:18192: Warning: using r15 results in unpredictable beha=
viour
    /scratch/linux/drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unused va=
riable =E2=80=98desc=E2=80=99 [-Wunused-variable]
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warnin=
g: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-com=
mon.o
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    /scratch/linux/drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unused va=
riable =E2=80=98desc=E2=80=99 [-Wunused-variable]
    WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-com=
mon.o

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h/scratch/linux/include/lin=
ux/compiler-clang.h::1111::33::  errorerror: : Sorry, your version of Clang=
 is too old - please use 10.0.1 or newer.Sorry, your version of Clang is to=
o old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sectio=
n mismatches

Warnings:
    /scratch/linux/drivers/dma/sf-pdma/sf-pdma.c:287:23: warning: unused va=
riable =E2=80=98desc=E2=80=99 [-Wunused-variable]
    WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-com=
mon.o
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section =
mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    /scratch/linux/arch/arm64/kernel/smp.c:967:13: warning: =E2=80=98ipi_te=
ardown=E2=80=99 defined but not used [-Wunused-function]
    aarch64-linux-gnu-ld: warning: orphan section `.igot.plt' from `arch/ar=
m64/kernel/head.o' being placed in section `.igot.plt'

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    11:3: error: Sorry, your version of Clang is too old - please use 10.0.=
1 or newer.

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2b4c): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x28fc): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h/scratch/linux/include/lin=
ux/compiler-clang.h::1111::33::  errorerror: : Sorry, your version of Clang=
 is too old - please use 10.0.1 or newer.Sorry, your version of Clang is to=
o old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 3 warnings, 0 section =
mismatches

Errors:
    error: fallthrough annotation does not directly precede switch label

Warnings:
    /scratch/linux/drivers/base/regmap/regmap.c:713:6: warning: variable 'r=
et' is used uninitialized whenever 'if' condition is true [-Wsometimes-unin=
itialized]
    /scratch/linux/drivers/base/regmap/regmap.c:711:9: note: initialize the=
 variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-9) =E2=80=94 FAIL, 1 err=
or, 0 warnings, 0 section mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h/scratch/linux/include/lin=
ux/compiler-clang.h:11::113::3 : errorerror: : Sorry, your version of Clang=
 is too old - please use 10.0.1 or newer.Sorry, your version of Clang is to=
o old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 8 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 302 errors, 11 warnings,=
 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 280 errors, 11 warnings,=
 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 167 errors, 26=
 warnings, 0 section mismatches

Errors:
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No such fil=
e or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3.c:8:10: fatal error: linux/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/int-ll6=
4.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrier.h: =
No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No such fil=
e or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    reuseport_bpf.c:11:10: fatal error: error.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or directory
    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dirent.h>=
 not supported"
    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    seccomp_bpf.c:16:20: error: missing binary operator before token "("
    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or direc=
tory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or direc=
tory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3_clear_sighand.c:11:10: fatal error: linux/sched.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    load_address.c:5:10: fatal error: link.h: No such file or directory
    dnotify_test.c:13:17: error: =E2=80=98siginfo_t=E2=80=99 {aka =E2=80=98=
struct <anonymous>=E2=80=99} has no member named =E2=80=98si_fd=E2=80=99; d=
id you mean =E2=80=98si_code=E2=80=99?
    dnotify_test.c:21:5: error: =E2=80=98struct sigaction=E2=80=99 has no m=
ember named =E2=80=98sa_sigaction=E2=80=99
    dnotify_test.c:23:17: error: =E2=80=98SA_SIGINFO=E2=80=99 undeclared (f=
irst use in this function); did you mean =E2=80=98S_IFIFO=E2=80=99?
    dnotify_test.c:24:12: error: =E2=80=98SIGRTMIN=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98SIGTTIN=E2=80=99?
    dnotify_test.c:27:12: error: =E2=80=98F_SETSIG=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98FD_SETSIZE=E2=80=99?
    dnotify_test.c:28:12: error: =E2=80=98F_NOTIFY=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98O_NOCTTY=E2=80=99?
    dnotify_test.c:28:22: error: =E2=80=98DN_MODIFY=E2=80=99 undeclared (fi=
rst use in this function)
    dnotify_test.c:28:32: error: =E2=80=98DN_CREATE=E2=80=99 undeclared (fi=
rst use in this function); did you mean =E2=80=98O_CREAT=E2=80=99?
    dnotify_test.c:28:42: error: =E2=80=98DN_MULTISHOT=E2=80=99 undeclared =
(first use in this function)
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_multi_thread.c:3:10: fatal error: linux/membarrier.h: N=
o such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    nosymfollow-test.c:12:10: fatal error: sys/mount.h: No such file or dir=
ectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    mq_perf_tests.c:38:10: fatal error: mqueue.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    reuseport_bpf_cpu.c:17:10: fatal error: arpa/inet.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pm_nl_ctl.c:4:10: fatal error: error.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pidns.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    resolve_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    setdate.c:10:10: fatal error: linux/rtc.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    seccomp_benchmark.c:11:10: fatal error: linux/filter.h: No such file or=
 directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    splice_read.c:49:15: error: =E2=80=98SPLICE_F_MOVE=E2=80=99 undeclared =
(first use in this function)
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    nanosleep.c:27:10: fatal error: sys/timex.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or direc=
tory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    default_file_splice_read.c:7:9: warning: implicit declaration of functi=
on =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-Wimpl=
icit-function-declaration]
    sync_stress_parallelism.c:93:2: warning: implicit declaration of functi=
on =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_parallelism.c:100:2: warning: implicit declaration of funct=
ion =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=
=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:93:3: warning: implicit declaration of function =
=E2=80=98pthread_mutex_lock=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:95:3: warning: implicit declaration of function =
=E2=80=98pthread_mutex_unlock=E2=80=99; did you mean =E2=80=98pthread_atfor=
k=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:171:2: warning: implicit declaration of function=
 =E2=80=98pthread_mutex_init=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:174:3: warning: implicit declaration of function=
 =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=
=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:182:3: warning: implicit declaration of function=
 =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=80=
=99? [-Wimplicit-function-declaration]
    posix_timers.c:40:9: warning: implicit declaration of function =E2=80=
=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-function-=
declaration]
    posix_timers.c:156:8: warning: implicit declaration of function =E2=80=
=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? [-Wimp=
licit-function-declaration]
    posix_timers.c:169:8: warning: implicit declaration of function =E2=80=
=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99? [-Wim=
plicit-function-declaration]
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    splice_read.c:48:12: warning: implicit declaration of function =E2=80=
=98splice=E2=80=99; did you mean =E2=80=98pipe=E2=80=99? [-Wimplicit-functi=
on-declaration]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 59 errors, 30 warnin=
gs, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    close_range_test.c:47:11: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:55:10: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:111:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    close_range_test.c:200:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    collect2: error: ld returned 1 exit status
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    collect2: error: ld returned 1 exit status
    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared here =
(not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=80=99 =
has initializer but incomplete type
    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98args=
=E2=80=99 isn=E2=80=99t known
    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory

Warnings:
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    close_range_test.c:47:5: warning: implicit declaration of function =E2=
=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_args=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_setns_test.c:80:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:16:25: warning: excess elements in struct ini=
tializer

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    error: fallthrough annotation does not directly precede switch label

Warnings:
    <stdin>:1532:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    /scratch/linux/drivers/base/regmap/regmap.c:713:6: warning: variable 'r=
et' is used uninitialized whenever 'if' condition is true [-Wsometimes-unin=
itialized]
    /scratch/linux/drivers/base/regmap/regmap.c:711:9: note: initialize the=
 variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 =
warnings, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 280 errors, 10 wa=
rnings, 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/include/linux/kern_levels.h:5:18: warning: format =E2=80=
=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=
=99, but argument 8 has type =E2=80=98unsigned int=E2=80=99 [-Wformat=3D]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    /scratch/linux/mm/secretmem.c:50:33: error: =E2=80=98PMD_PAGE_ORDER=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98MAX_O=
RDER=E2=80=99?
    /scratch/linux/mm/secretmem.c:146:6: error: implicit declaration of fun=
ction =E2=80=98mlock_future_check=E2=80=99; did you mean =E2=80=98locks_fre=
e_lock=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =
=E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused-fun=
ction]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c:882:19: warnin=
g: conversion from =E2=80=98long long unsigned int=E2=80=99 to =E2=80=98lon=
g unsigned int=E2=80=99 changes value from =E2=80=985000000000=E2=80=99 to =
=E2=80=98705032704=E2=80=99 [-Woverflow]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redefined
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    /scratch/linux/arch/arm64/kernel/smp.c:967:13: warning: =E2=80=98ipi_te=
ardown=E2=80=99 defined but not used [-Wunused-function]
    aarch64-linux-gnu-ld: warning: orphan section `.igot.plt' from `arch/ar=
m64/kernel/head.o' being placed in section `.igot.plt'

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1178:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    error: fallthrough annotation does not directly precede switch label

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-9) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.
    /scratch/linux/include/linux/compiler-clang.h:11:3: error: Sorry, your =
version of Clang is too old - please use 10.0.1 or newer.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 71 errors, 39 wa=
rnings, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    close_range_test.c:47:11: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:55:10: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:111:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    close_range_test.c:200:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    collect2: error: ld returned 1 exit status
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    collect2: error: ld returned 1 exit status
    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared here =
(not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=80=99 =
has initializer but incomplete type
    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98args=
=E2=80=99 isn=E2=80=99t known
    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory

Warnings:
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    close_range_test.c:47:5: warning: implicit declaration of function =E2=
=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_args=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_setns_test.c:80:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:16:25: warning: excess elements in struct ini=
tializer

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1532:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---
For more info write to <info@kernelci.org>
