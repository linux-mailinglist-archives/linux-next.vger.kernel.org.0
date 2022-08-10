Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2406658E5DD
	for <lists+linux-next@lfdr.de>; Wed, 10 Aug 2022 05:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiHJD51 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Aug 2022 23:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiHJD5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Aug 2022 23:57:14 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5353D2496E
        for <linux-next@vger.kernel.org>; Tue,  9 Aug 2022 20:57:11 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x23so13145943pll.7
        for <linux-next@vger.kernel.org>; Tue, 09 Aug 2022 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=43DN1GUwYl2NkSdM9DUg4fkBA3hUbov1SYpR3RQv2yg=;
        b=a2yMtk7DehBwSHKZRQ7cYesQbZqtEwic3Vng+wh/UqVKgbVsAcYrM8S2P3tCcsJ77b
         D497Y/pNKwFCKsicLmkm1nT8Zob/nrXRRJ3Ae0Zs9awO7BTUXaesSRuObv9+6ypi6QIU
         QuxUTPstOmynnJI8fcLtD8AU9EMv0unQnrxrvRj+DpliSHu/0VjU6Nxh/CRgXtQyCEKG
         0uTcteMbqF6gVgAfuN7l/xX0NPFmENa0pR3xx7YOKKz9HotXE2/hb+p+tqDNduGYWdyX
         ALUhLpn4M6gjnlmeu1eQSypzD6ugc7t/1XsqUCmgOVB/8sORQMVu6BJoxi0bVR2TRZbd
         hiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=43DN1GUwYl2NkSdM9DUg4fkBA3hUbov1SYpR3RQv2yg=;
        b=FKTjO/XF/yOg32KhyZ1Gh5mhwFwupNWdxk8B+nAjGsKmtKGxqk7YmpKD9rU/Uf80P8
         kNiWbGopKCeqD/0iH1c6QebexPdrAeUfPq4wjRyL3NXB7cZzX8Ufi/6tntpqwqoNMyIf
         Dv7k09168mCg4RW7YTBOSL6GoXUzv5IOTU75PZRPk8UYkvYxfGZmsVxwN8vDBoCyoOsV
         DN2hqjqEdfYzJyqT/8VeOm9sMHzbFCCbnVq7TS6PlWy4nrQvURhU2oQLhSbTy0fLaZsY
         2CKUeevLN5M6s+KfbyAGGqXwltemzabQ2xJNXvz8P7TLAczMXs8I/M3VB4smvzfrU6DP
         eLOA==
X-Gm-Message-State: ACgBeo0Ar5pe2AiLSV9UwjxN6Zcn83isWpU6bXiivsW6r3tw2/24uoPZ
        lGogA6fpHnjZtGv/EHh/VMXbdAfz1+lyaXIKP0o=
X-Google-Smtp-Source: AA6agR5VY2NXtE3mVym0TF0R58HClKc5TG5vKHdvxIzheYAZMc5AQRdh3dU4HhyzFdD04SIFaHzJtg==
X-Received: by 2002:a17:90a:c402:b0:1f7:75ce:1206 with SMTP id i2-20020a17090ac40200b001f775ce1206mr1667349pjt.68.1660103829594;
        Tue, 09 Aug 2022 20:57:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ez7-20020a17090ae14700b001f10c959aa2sm391482pjb.42.2022.08.09.20.57.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:57:09 -0700 (PDT)
Message-ID: <62f32c95.170a0220.1d7e7.0d05@mx.google.com>
Date:   Tue, 09 Aug 2022 20:57:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220810
Subject: next/master build: 219 builds: 8 failed, 211 passed, 102 errors,
 77 warnings (next-20220810)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 219 builds: 8 failed, 211 passed, 102 errors, 77 warning=
s (next-20220810)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220810/

Tree: next
Branch: master
Git Describe: next-20220810
Git Commit: bc6c6584ffb27b62e19ea89553b22b4cad1abaca
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    multi_v5_defconfig: (clang-16) FAIL
    imx_v4_v5_defconfig: (gcc-10) FAIL
    imxrt_defconfig: (gcc-10) FAIL
    multi_v4t_defconfig: (gcc-10) FAIL
    multi_v5_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    vf610m4_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:

arm:
    aspeed_g4_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-16): 12 warnings
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    imx_v4_v5_defconfig (gcc-10): 19 errors, 5 warnings
    imxrt_defconfig (gcc-10): 13 errors, 5 warnings
    multi_v4t_defconfig (gcc-10): 19 errors, 5 warnings
    multi_v5_defconfig (clang-16): 13 errors
    multi_v5_defconfig (gcc-10): 19 errors, 5 warnings
    multi_v7_defconfig (clang-16): 10 warnings
    rpc_defconfig (gcc-10): 2 errors
    u8500_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 13 errors, 5 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 3 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:

Errors summary:

    5    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declarati=
on of function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3D=
implicit-function-declaration]
    5    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member=
 =E2=80=98desc=E2=80=99 in something not a structure or union
    5    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =
=E2=80=98msi_alloc_info_t=E2=80=99
    5    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi=
_domain_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    5    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi=
_domain_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    5    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_P=
CI_MSIX=E2=80=99 undeclared here (not in a function)
    5    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_U=
SE_DEF_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    5    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi=
_domain_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    5    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_=
USE_DEF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    5    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =
=E2=80=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known
    5    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98=
imx_mu_msi_domain_info=E2=80=99 has initializer but incomplete type
    5    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =
=E2=80=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    5    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98=
its_pmsi_ops=E2=80=99 has initializer but incomplete type
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: =E2=80=98const stru=
ct irq_domain_ops=E2=80=99 has no member named =E2=80=98free=E2=80=99
    3    drivers/irqchip/irq-imx-mu-msi.c:229:10: error: initialization of =
=E2=80=98int (*)(struct irq_domain *, struct irq_fwspec *, enum irq_domain_=
bus_token)=E2=80=99 from incompatible pointer type =E2=80=98void (*)(struct=
 irq_domain *, unsigned int,  unsigned int)=E2=80=99 [-Werror=3Dincompatibl=
e-pointer-types]
    3    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: =E2=80=98const stru=
ct irq_domain_ops=E2=80=99 has no member named =E2=80=98alloc=E2=80=99
    3    drivers/irqchip/irq-imx-mu-msi.c:228:11: error: initialization of =
=E2=80=98int (*)(struct irq_domain *, struct device_node *, enum irq_domain=
_bus_token)=E2=80=99 from incompatible pointer type =E2=80=98int (*)(struct=
 irq_domain *, unsigned int,  unsigned int,  void *)=E2=80=99 [-Werror=3Din=
compatible-pointer-types]
    3    drivers/irqchip/irq-imx-mu-msi.c:126:63: error: =E2=80=98struct ir=
q_data=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    3    drivers/irqchip/irq-imx-mu-msi.c:118:63: error: =E2=80=98struct ir=
q_data=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    1    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: call to undeclared=
 function 'platform_msi_create_irq_domain'; ISO C99 and later do not suppor=
t implicit function declarations [-Wimplicit-function-declaration]
    1    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: field designator 'f=
ree' does not refer to any field in type 'const struct irq_domain_ops'
    1    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: field designator 'a=
lloc' does not refer to any field in type 'const struct irq_domain_ops'
    1    drivers/irqchip/irq-imx-mu-msi.c:197:30: error: use of undeclared =
identifier 'info'
    1    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: use of undeclared i=
dentifier 'msi_alloc_info_t'
    1    drivers/irqchip/irq-imx-mu-msi.c:179:20: error: use of undeclared =
identifier 'info'
    1    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: use of undeclared i=
dentifier 'MSI_FLAG_PCI_MSIX'
    1    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: use of undeclared i=
dentifier 'MSI_FLAG_USE_DEF_CHIP_OPS'
    1    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: use of undeclared =
identifier 'MSI_FLAG_USE_DEF_DOM_OPS'
    1    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: variable has incom=
plete type 'struct msi_domain_info'
    1    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: variable has incom=
plete type 'struct msi_domain_ops'
    1    drivers/irqchip/irq-imx-mu-msi.c:126:65: error: no member named 'p=
arent_data' in 'struct irq_data'
    1    drivers/irqchip/irq-imx-mu-msi.c:118:65: error: no member named 'p=
arent_data' in 'struct irq_data'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    22   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =
=E2=80=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes poin=
ter from integer without a cast [-Wint-conversion]
    5    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements =
in struct initializer
    5    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements i=
n struct initializer
    5    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements =
in struct initializer
    5    cc1: some warnings being treated as errors
    2    kernel/trace/ftrace.c:3149:1: warning: =E2=80=98ops_references_rec=
=E2=80=99 defined but not used [-Wunused-function]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    1    kernel/trace/ftrace.c:3149:1: warning: unused function 'ops_refere=
nces_rec' [-Wunused-function]
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: =E2=80=98a=
b8500_chargalg_ex_ac_enable_toggle=E2=80=99 defined but not used [-Wunused-=
variable]
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: unused var=
iable =E2=80=98ab8500_chargalg_ex_ac_enable_toggle=E2=80=99 [-Wunused-varia=
ble]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    1 warning generated.

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/trace/ftrace.c:3149:1: warning: =E2=80=98ops_references_rec=E2=
=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/trace/ftrace.c:3149:1: warning: =E2=80=98ops_references_rec=E2=
=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 12 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    kernel/trace/ftrace.c:3149:1: warning: unused function 'ops_references_=
rec' [-Wunused-function]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

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
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-16) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 19 errors, 5 warnings, 0 =
section mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:118:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:126:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98its_p=
msi_ops=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98imx_m=
u_msi_domain_info=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_USE_D=
EF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_USE_DE=
F_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_PCI_MS=
IX=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =E2=80=
=98msi_alloc_info_t=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member =E2=
=80=98desc=E2=80=99 in something not a structure or union
    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98alloc=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:228:11: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct device_node *, enum irq_domain_bu=
s_token)=E2=80=99 from incompatible pointer type =E2=80=98int (*)(struct ir=
q_domain *, unsigned int,  unsigned int,  void *)=E2=80=99 [-Werror=3Dincom=
patible-pointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98free=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:229:10: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct irq_fwspec *, enum irq_domain_bus=
_token)=E2=80=99 from incompatible pointer type =E2=80=98void (*)(struct ir=
q_domain *, unsigned int,  unsigned int)=E2=80=99 [-Werror=3Dincompatible-p=
ointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declaration of=
 function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =E2=80=
=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =E2=80=
=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known

Warnings:
    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements in str=
uct initializer
    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =E2=80=
=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fr=
om integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 FAIL, 13 errors, 5 warnings, 0 sect=
ion mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98its_p=
msi_ops=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98imx_m=
u_msi_domain_info=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_USE_D=
EF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_USE_DE=
F_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_PCI_MS=
IX=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =E2=80=
=98msi_alloc_info_t=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member =E2=
=80=98desc=E2=80=99 in something not a structure or union
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declaration of=
 function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =E2=80=
=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =E2=80=
=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known

Warnings:
    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements in str=
uct initializer
    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =E2=80=
=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fr=
om integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

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
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 FAIL, 19 errors, 5 warnings, 0 =
section mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:118:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:126:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98its_p=
msi_ops=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98imx_m=
u_msi_domain_info=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_USE_D=
EF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_USE_DE=
F_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_PCI_MS=
IX=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =E2=80=
=98msi_alloc_info_t=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member =E2=
=80=98desc=E2=80=99 in something not a structure or union
    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98alloc=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:228:11: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct device_node *, enum irq_domain_bu=
s_token)=E2=80=99 from incompatible pointer type =E2=80=98int (*)(struct ir=
q_domain *, unsigned int,  unsigned int,  void *)=E2=80=99 [-Werror=3Dincom=
patible-pointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98free=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:229:10: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct irq_fwspec *, enum irq_domain_bus=
_token)=E2=80=99 from incompatible pointer type =E2=80=98void (*)(struct ir=
q_domain *, unsigned int,  unsigned int)=E2=80=99 [-Werror=3Dincompatible-p=
ointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declaration of=
 function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =E2=80=
=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =E2=80=
=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known

Warnings:
    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements in str=
uct initializer
    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =E2=80=
=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fr=
om integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 FAIL, 13 errors, 0 warnings, 0=
 section mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:118:65: error: no member named 'parent=
_data' in 'struct irq_data'
    drivers/irqchip/irq-imx-mu-msi.c:126:65: error: no member named 'parent=
_data' in 'struct irq_data'
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: variable has incomplete=
 type 'struct msi_domain_ops'
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: use of undeclared ident=
ifier 'MSI_FLAG_USE_DEF_DOM_OPS'
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: use of undeclared identi=
fier 'MSI_FLAG_USE_DEF_CHIP_OPS'
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: use of undeclared identi=
fier 'MSI_FLAG_PCI_MSIX'
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: variable has incomplete=
 type 'struct msi_domain_info'
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: use of undeclared identi=
fier 'msi_alloc_info_t'
    drivers/irqchip/irq-imx-mu-msi.c:179:20: error: use of undeclared ident=
ifier 'info'
    drivers/irqchip/irq-imx-mu-msi.c:197:30: error: use of undeclared ident=
ifier 'info'
    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: field designator 'alloc'=
 does not refer to any field in type 'const struct irq_domain_ops'
    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: field designator 'free' =
does not refer to any field in type 'const struct irq_domain_ops'
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: call to undeclared func=
tion 'platform_msi_create_irq_domain'; ISO C99 and later do not support imp=
licit function declarations [-Wimplicit-function-declaration]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 19 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:118:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:126:63: error: =E2=80=98struct irq_dat=
a=E2=80=99 has no member named =E2=80=98parent_data=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98its_p=
msi_ops=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98imx_m=
u_msi_domain_info=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_USE_D=
EF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_USE_DE=
F_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_PCI_MS=
IX=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =E2=80=
=98msi_alloc_info_t=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member =E2=
=80=98desc=E2=80=99 in something not a structure or union
    drivers/irqchip/irq-imx-mu-msi.c:228:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98alloc=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:228:11: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct device_node *, enum irq_domain_bu=
s_token)=E2=80=99 from incompatible pointer type =E2=80=98int (*)(struct ir=
q_domain *, unsigned int,  unsigned int,  void *)=E2=80=99 [-Werror=3Dincom=
patible-pointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:229:3: error: =E2=80=98const struct ir=
q_domain_ops=E2=80=99 has no member named =E2=80=98free=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:229:10: error: initialization of =E2=
=80=98int (*)(struct irq_domain *, struct irq_fwspec *, enum irq_domain_bus=
_token)=E2=80=99 from incompatible pointer type =E2=80=98void (*)(struct ir=
q_domain *, unsigned int,  unsigned int)=E2=80=99 [-Werror=3Dincompatible-p=
ointer-types]
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declaration of=
 function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =E2=80=
=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =E2=80=
=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known

Warnings:
    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements in str=
uct initializer
    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =E2=80=
=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fr=
om integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

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
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
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
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/power/supply/ab8500_chargalg.c:493:13: warning: unused variable=
 =E2=80=98ab8500_chargalg_ex_ac_enable_toggle=E2=80=99 [-Wunused-variable]
    drivers/power/supply/ab8500_chargalg.c:493:13: warning: =E2=80=98ab8500=
_chargalg_ex_ac_enable_toggle=E2=80=99 defined but not used [-Wunused-varia=
ble]

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
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 13 errors, 5 warnings, 0 se=
ction mismatches

Errors:
    drivers/irqchip/irq-imx-mu-msi.c:138:15: error: variable =E2=80=98its_p=
msi_ops=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:141:15: error: variable =E2=80=98imx_m=
u_msi_domain_info=E2=80=99 has initializer but incomplete type
    drivers/irqchip/irq-imx-mu-msi.c:142:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98flags=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:142:12: error: =E2=80=98MSI_FLAG_USE_D=
EF_DOM_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:143:6: error: =E2=80=98MSI_FLAG_USE_DE=
F_CHIP_OPS=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:144:6: error: =E2=80=98MSI_FLAG_PCI_MS=
IX=E2=80=99 undeclared here (not in a function)
    drivers/irqchip/irq-imx-mu-msi.c:145:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98ops=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:146:3: error: =E2=80=98struct msi_doma=
in_info=E2=80=99 has no member named =E2=80=98chip=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:179:2: error: unknown type name =E2=80=
=98msi_alloc_info_t=E2=80=99
    drivers/irqchip/irq-imx-mu-msi.c:197:34: error: request for member =E2=
=80=98desc=E2=80=99 in something not a structure or union
    drivers/irqchip/irq-imx-mu-msi.c:262:25: error: implicit declaration of=
 function =E2=80=98platform_msi_create_irq_domain=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    drivers/irqchip/irq-imx-mu-msi.c:138:30: error: storage size of =E2=80=
=98its_pmsi_ops=E2=80=99 isn=E2=80=99t known
    drivers/irqchip/irq-imx-mu-msi.c:141:31: error: storage size of =E2=80=
=98imx_mu_msi_domain_info=E2=80=99 isn=E2=80=99t known

Warnings:
    drivers/irqchip/irq-imx-mu-msi.c:142:11: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:145:9: warning: excess elements in str=
uct initializer
    drivers/irqchip/irq-imx-mu-msi.c:146:10: warning: excess elements in st=
ruct initializer
    drivers/irqchip/irq-imx-mu-msi.c:262:23: warning: assignment to =E2=80=
=98struct irq_domain *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fr=
om integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
