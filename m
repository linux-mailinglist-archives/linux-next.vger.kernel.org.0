Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DC0401242
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 02:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhIFAsb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Sep 2021 20:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhIFAsb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Sep 2021 20:48:31 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CDFC061575
        for <linux-next@vger.kernel.org>; Sun,  5 Sep 2021 17:47:27 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id k17so2943246pls.0
        for <linux-next@vger.kernel.org>; Sun, 05 Sep 2021 17:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ABJQ9fKeek9/kZ9zZSVzWmkoV58wsozWQw36QGxrsPM=;
        b=snC4S7H6gvydNC8kvn8PeL2vqXTBTcX0HhNePdSL2Pf6EvgSv+SaOU98fGQNOcBuru
         do8340uJjpynBMq/XqsRXYE3cU6LuPFSVzKAwJZSeZtihKHCcnzoC48COcW6ivy9YXTj
         56BML85yabRoNR+sDGnsNp8MDmu1wdArT/Ky2MBk83I/lM77DwjCA0YqRNxviC1Pxp8o
         r7bMnsP5r0ONoJva/JABw5MYAYB2jtioaiBm3qt2iTQdpgl0spTyqTTgfFY8g8rxJEEd
         /QrHLBZwOaC72ZzOMLWVBkU0RJqDsZtPrv6+kumYLSPCs56YUDS7x8iophGpXC1Xg5ML
         dmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ABJQ9fKeek9/kZ9zZSVzWmkoV58wsozWQw36QGxrsPM=;
        b=Lhoa4KTcGpjg6rDOMwfVYhVTG0j6K2OUAuDzCKkdaKs1qTZuvM1lfXz8vFK4OCpVsR
         5AjxuqK35GzagkXEGHuOrmxxLY0vWqXas16P7/G0vCJliKcsYKkK5bVaeFUSlttiJzye
         hs+Oaybq2GTuQ98WP6PIyCjkGtvIEkoDSBcnpc6mJWVcOsOWOyivvFHp/kgJGKkMEO9g
         f/QbW1RMqiYDTXPg29taJPlqSkxBR8PRltCSWeZFUxlEWQlWyeyln23ULI5Yo/c8wamJ
         VwDpE3Ga92RjRMBPFH1Pel5sitxEXx6QB7I6hcPoFBuRj42GM0kq5rOzgGMXvLFhPtp9
         Oixw==
X-Gm-Message-State: AOAM532R9cDtYftND7ZqcZAOjtQB9Z0PxkCPi6BHq7lBUwdofPfZ5v6T
        EuI+j0atrAfB8qsq9PF8HVnfWfEpaTDB61g7
X-Google-Smtp-Source: ABdhPJzMlPcYFePw+0eCs2RHl/cpuyu8qAV48kHgYhKxmXi97CBJREvyKd01vC/F+KNDJb7xmLM27A==
X-Received: by 2002:a17:903:230e:b0:139:f741:f3c1 with SMTP id d14-20020a170903230e00b00139f741f3c1mr8303910plh.29.1630889245858;
        Sun, 05 Sep 2021 17:47:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6sm5491399pfn.107.2021.09.05.17.47.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 17:47:25 -0700 (PDT)
Message-ID: <6135651d.1c69fb81.8b6b4.fee3@mx.google.com>
Date:   Sun, 05 Sep 2021 17:47:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.14-9800-g9a811bf862bf
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 143 builds: 48 failed, 95 passed, 52 errors,
 52 warnings (v5.14-9800-g9a811bf862bf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 143 builds: 48 failed, 95 passed, 52 errors, 52 w=
arnings (v5.14-9800-g9a811bf862bf)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.14-9800-g9a811bf862bf/

Tree: next
Branch: pending-fixes
Git Describe: v5.14-9800-g9a811bf862bf
Git Commit: 9a811bf862bf4843cbfd00df9d409777c40bc76f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    axs103_defconfig: (gcc-8) FAIL
    axs103_smp_defconfig: (gcc-8) FAIL
    haps_hs_defconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig+kselftest: (gcc-8) FAIL
    hsdk_defconfig: (gcc-8) FAIL
    nsimosci_hs_defconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL
    vdk_hs38_defconfig: (gcc-8) FAIL
    vdk_hs38_smp_defconfig: (gcc-8) FAIL

mips:
    bcm63xx_defconfig: (gcc-8) FAIL
    bigsur_defconfig: (gcc-8) FAIL
    capcella_defconfig: (gcc-8) FAIL
    cobalt_defconfig: (gcc-8) FAIL
    db1xxx_defconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    decstation_defconfig: (gcc-8) FAIL
    decstation_r4k_defconfig: (gcc-8) FAIL
    e55_defconfig: (gcc-8) FAIL
    fuloong2e_defconfig: (gcc-8) FAIL
    gpr_defconfig: (gcc-8) FAIL
    ip22_defconfig: (gcc-8) FAIL
    ip32_defconfig: (gcc-8) FAIL
    jazz_defconfig: (gcc-8) FAIL
    jmr3927_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    loongson2k_defconfig: (gcc-8) FAIL
    malta_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL
    malta_qemu_32r6_defconfig: (gcc-8) FAIL
    maltaaprp_defconfig: (gcc-8) FAIL
    maltasmvp_defconfig: (gcc-8) FAIL
    maltasmvp_eva_defconfig: (gcc-8) FAIL
    maltaup_defconfig: (gcc-8) FAIL
    maltaup_xpa_defconfig: (gcc-8) FAIL
    mpc30x_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    pic32mzda_defconfig: (gcc-8) FAIL
    rb532_defconfig: (gcc-8) FAIL
    rbtx49xx_defconfig: (gcc-8) FAIL
    rm200_defconfig: (gcc-8) FAIL
    sb1250_swarm_defconfig: (gcc-8) FAIL
    tb0219_defconfig: (gcc-8) FAIL
    tb0226_defconfig: (gcc-8) FAIL
    tb0287_defconfig: (gcc-8) FAIL
    workpad_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

riscv:
    rv32_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-8): 1 error, 1 warning
    axs103_smp_defconfig (gcc-8): 1 error, 1 warning
    haps_hs_defconfig (gcc-8): 1 error, 1 warning
    haps_hs_smp_defconfig (gcc-8): 1 error, 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 errors, 2 warnings
    hsdk_defconfig (gcc-8): 1 error, 1 warning
    nsimosci_hs_defconfig (gcc-8): 1 error, 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 1 error, 1 warning
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 error, 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 error, 1 warning

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig+kselftest (gcc-8): 1 warning
    bcm63xx_defconfig (gcc-8): 1 error, 1 warning
    bigsur_defconfig (gcc-8): 1 error, 1 warning
    capcella_defconfig (gcc-8): 1 error, 1 warning
    cobalt_defconfig (gcc-8): 1 error, 1 warning
    db1xxx_defconfig (gcc-8): 1 error, 1 warning
    decstation_64_defconfig (gcc-8): 1 error, 1 warning
    decstation_defconfig (gcc-8): 1 error, 1 warning
    decstation_r4k_defconfig (gcc-8): 1 error, 1 warning
    e55_defconfig (gcc-8): 1 error, 1 warning
    fuloong2e_defconfig (gcc-8): 1 error, 1 warning
    gpr_defconfig (gcc-8): 1 error, 1 warning
    ip22_defconfig (gcc-8): 1 error, 1 warning
    ip32_defconfig (gcc-8): 1 error, 1 warning
    jazz_defconfig (gcc-8): 1 error, 1 warning
    jmr3927_defconfig (gcc-8): 1 error, 1 warning
    lemote2f_defconfig (gcc-8): 1 error, 1 warning
    loongson2k_defconfig (gcc-8): 1 error, 1 warning
    malta_defconfig (gcc-8): 1 error, 1 warning
    malta_kvm_defconfig (gcc-8): 1 error, 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 error, 1 warning
    maltaaprp_defconfig (gcc-8): 1 error, 1 warning
    maltasmvp_defconfig (gcc-8): 1 error, 1 warning
    maltasmvp_eva_defconfig (gcc-8): 1 error, 1 warning
    maltaup_defconfig (gcc-8): 1 error, 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 error, 1 warning
    mpc30x_defconfig (gcc-8): 1 error, 1 warning
    mtx1_defconfig (gcc-8): 1 error, 1 warning
    pic32mzda_defconfig (gcc-8): 1 error, 1 warning
    rb532_defconfig (gcc-8): 1 error, 1 warning
    rbtx49xx_defconfig (gcc-8): 1 error, 1 warning
    rm200_defconfig (gcc-8): 1 error, 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 error, 1 warning
    tb0219_defconfig (gcc-8): 1 error, 1 warning
    tb0226_defconfig (gcc-8): 1 error, 1 warning
    tb0287_defconfig (gcc-8): 1 error, 1 warning
    workpad_defconfig (gcc-8): 1 error, 1 warning
    xway_defconfig (gcc-8): 2 errors, 1 warning

riscv:
    rv32_defconfig (gcc-8): 3 errors, 1 warning

x86_64:

Errors summary:

    45   block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 def=
ined but not used [-Werror=3Dunused-function]
    1    drivers/net/ethernet/lantiq_etop.c:281:4: error: ignoring return v=
alue of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_=
result [-Werror=3Dunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: error: ignoring return v=
alue of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_=
result [-Werror=3Dunused-result]
    1    drivers/net/ethernet/8390/ne.c:909:20: error: =E2=80=98ne_add_devi=
ces=E2=80=99 defined but not used [-Werror=3Dunused-function]
    1    arch/arc/include/asm/perf_event.h:91:27: error: =E2=80=98arc_pmu_e=
v_hw_map=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: error: =E2=80=98arc_pmu_=
cache_map=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
    1    <stdin>:834:2: error: #warning syscall fstat64 not implemented [-W=
error=3Dcpp]
    1    <stdin>:1515:2: error: #warning syscall clone3 not implemented [-W=
error=3Dcpp]
    1    <stdin>:1131:2: error: #warning syscall fstatat64 not implemented =
[-Werror=3Dcpp]

Warnings summary:

    49   cc1: all warnings being treated as errors
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 FAIL, 2 errors, 2 wa=
rnings, 0 section mismatches

Errors:
    arch/arc/include/asm/perf_event.h:126:27: error: =E2=80=98arc_pmu_cache=
_map=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: error: =E2=80=98arc_pmu_ev_hw_=
map=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+crypto (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+ima (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    drivers/net/ethernet/8390/ne.c:909:20: error: =E2=80=98ne_add_devices=
=E2=80=99 defined but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    <stdin>:834:2: error: #warning syscall fstat64 not implemented [-Werror=
=3Dcpp]
    <stdin>:1131:2: error: #warning syscall fstatat64 not implemented [-Wer=
ror=3Dcpp]
    <stdin>:1515:2: error: #warning syscall clone3 not implemented [-Werror=
=3Dcpp]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 =
section mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    block/mq-deadline.c:274:12: error: =E2=80=98dd_queued=E2=80=99 defined =
but not used [-Werror=3Dunused-function]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    drivers/net/ethernet/lantiq_etop.c:273:4: error: ignoring return value =
of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_resul=
t [-Werror=3Dunused-result]
    drivers/net/ethernet/lantiq_etop.c:281:4: error: ignoring return value =
of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_resul=
t [-Werror=3Dunused-result]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>
