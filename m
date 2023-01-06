Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48AB65F905
	for <lists+linux-next@lfdr.de>; Fri,  6 Jan 2023 02:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234403AbjAFBWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 20:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjAFBWL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 20:22:11 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664526AD89
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 17:17:05 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id c4so166947plc.5
        for <linux-next@vger.kernel.org>; Thu, 05 Jan 2023 17:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OWEfNW9fZL6NoGZa/dq37JXPY85QUL7DLpkP3cns4FQ=;
        b=ndipFz7iOAqpRL8+nZNFeVEkSEqqml8kdNbmyrDyCbnsBPhwG0ZJrA3mzw66yhP8l7
         515POW+yYZgd8dFysflvBSa5P5/tjZi6S6WCS15xcyPJjzjwcvFhROEUc/w2W0g5iOIU
         8ETjCKQRdk5a0Q1uodDc5Fy+6yK1oaTlheTkpULph48K1blLTYsDvvx9exGygy9DtREX
         5K6HGGdGx8Oa+ykjV7mDJs2W7VECYfgbH/sm9/erf8kygabZW9ddckfiKyw2m6UYthmS
         uGlxwSwLwgAQOjDM/cUImOM0WjBiKiJbBltoGf9J4r2RY7zssX8dSNZnS+r1ai5xgOHN
         4owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWEfNW9fZL6NoGZa/dq37JXPY85QUL7DLpkP3cns4FQ=;
        b=OpmC3L6yNELdLM8zNJ1yyv1+mzLV13FAPG4kOTaLoZI8X9kBi3HTRSBKcxZwZ/XYN4
         uFDNjhgoEHzmjgOPaKzLFztcqmfOTDuHrXqlZvSMWPEnd3hwE4nO9XjA05e22CS8o9lf
         2gIDzwXSuz7ZhjaV97xD5M1JNXzxiA69noWdPJtNRV+lotOlA750ZmJHGCIew72Z1KRu
         WZNm5JPDDG0cPhXBuTzFnPod/4ORCyiaFmktivABbd3RE7axf76Cc2QvmZdhtwMJNWAG
         SMPEU3j8Z/hZ/q4HPuufQJeXcj1mwRroT2Ur5oymo6RMdYqfgoNY663JsGReCbZuxvA1
         qA5Q==
X-Gm-Message-State: AFqh2krhIDeEKbZx0ZpIkxBgbg0k+ptrRZNWcyAtmq4QhkHiPapPYA4w
        jR0+9YPg0IBh1qso73OGknK26XIXSLNFDVYmY3rCrQ==
X-Google-Smtp-Source: AMrXdXvP8RBbcZIvPUK+z1iCu84d7Q92bJrdUxqg5801f4ZzihQpHsTScKRm/d4T4b8736TKKj3OrA==
X-Received: by 2002:a17:902:7141:b0:192:86ff:c26 with SMTP id u1-20020a170902714100b0019286ff0c26mr31247724plm.66.1672967776621;
        Thu, 05 Jan 2023 17:16:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902db0300b001930e89f5f6sm30094plx.98.2023.01.05.17.16.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:16:16 -0800 (PST)
Message-ID: <63b77660.170a0220.b8684.0172@mx.google.com>
Date:   Thu, 05 Jan 2023 17:16:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc2-415-g7dcb1029a6d41
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 187 builds: 5 failed, 182 passed, 8 errors,
 495 warnings (v6.2-rc2-415-g7dcb1029a6d41)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 187 builds: 5 failed, 182 passed, 8 errors, 495 w=
arnings (v6.2-rc2-415-g7dcb1029a6d41)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.2-rc2-415-g7dcb1029a6d41/

Tree: next
Branch: pending-fixes
Git Describe: v6.2-rc2-415-g7dcb1029a6d41
Git Commit: 7dcb1029a6d41f874e3edb104e37b12aef4d120b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    imxrt_defconfig (gcc-10): 51 warnings
    keystone_defconfig (gcc-10): 1 warning
    lpc18xx_defconfig (gcc-10): 53 warnings
    milbeaut_m10v_defconfig (gcc-10): 79 warnings
    moxart_defconfig (gcc-10): 1 warning
    mps2_defconfig (gcc-10): 50 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 123 warnings
    rpc_defconfig (gcc-10): 2 errors
    sp7021_defconfig (gcc-10): 65 warnings
    stm32_defconfig (gcc-10): 48 warnings
    tct_hammer_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    viper_defconfig (gcc-10): 1 warning

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:

Errors summary:

    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    include/linux/fortify-string.h:57:29: error: argument 2 null where=
 non-null expected [-Werror=3Dnonnull]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    469  <command-line>: warning: "__thumb2__" redefined
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    cc1: all warnings being treated as errors
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    include/linux/fortify-string.h:57:29: error: argument 2 null where non-=
null expected [-Werror=3Dnonnull]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: argument 2 null where non-=
null expected [-Werror=3Dnonnull]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 51 warnings, 0 sect=
ion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 53 warnings, 0 se=
ction mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 79 warnings=
, 0 section mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 50 warnings, 0 secti=
on mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 123 warnings, 0 section mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+crypto (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+ima (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 65 warnings, 0 sec=
tion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 48 warnings, 0 sect=
ion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
