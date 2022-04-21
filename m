Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7033E509AA9
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 10:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386596AbiDUIcW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 04:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiDUIcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 04:32:21 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B92112749
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 01:29:32 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id n11-20020a17090a73cb00b001d1d3a7116bso5357168pjk.0
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0IluLCrzLBUy1GeKmDq9E8OK7oQvkA7h+8j2YVPegrA=;
        b=RpOLuoXPNXi0VGwO5l2HFzry/aP6+yLETOwgMTel8zIjpZWgfwBEvH1FsGFhZ0AGRH
         JktZ1j4XNkZyTqMfA4SwLMuwaYg21vzLZG0Hc1PdOm1l4kTj39/0H+uSWuzPDweapon+
         wlemCpcn4Q4fPs4sY5RtdKv0i3FAFTQ6DHrwOD+Yrx341zU0nuFl/GybxWfBZ8ORYBFI
         YaCzCNOZx56RPnKV/REdp9eHAPE6brwH6n+yXXAQmaNzzltZv8ICHtkTH8PBznnpXDlm
         pTuNYdx7J12KJxAeVOhKKRl4ko4qCGvyTL194S8HAv25wC1scwgkbES7LECww9gAr5ci
         0d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0IluLCrzLBUy1GeKmDq9E8OK7oQvkA7h+8j2YVPegrA=;
        b=yGvZlo9ONY6nexzKvdR2vccZXsbiPdWC5SmsFAMys6KVVuiTxxdhFoS+JzGn4+WX24
         ncZsVUW9dbBw69hpiUFNdiEeyxK8ygP0HTat4u4DjxmwwhzGkH2tchkrBAtCJVbdFL1Z
         zUgEwry2Yq/gHm43pNOu9GEdCRrZ4CCbYqUHIPqmnh3cfBb5lxP1fQhINGUI+f9o9dC5
         iaBbzfnSNn5KUlq7rMpVFt92jhvZiBB53hGEC2nYsOTPiXGxcim1Q3eWvmcQkhHDljTp
         7FBwYBXH9XmPaK0gW6bJP01CPgIBOCk63eFSyWwoILUHIzQW+IJs9gwtlfa3ohdQRGzw
         7+YA==
X-Gm-Message-State: AOAM5327hBPrhGDjN683Za5A15lEDdWH5ybxFHsccgunMpctju7EziYY
        guFnxI7cIRrUe4jGFIs/+8yOLhBytjZkrAz0CaE=
X-Google-Smtp-Source: ABdhPJyuEJVUL1rlq4w5Y1LA3E8zk7oGBEs4yU2iORzLdgOZfE99r0niYJx0M4lNckDKYtN4m9u/jA==
X-Received: by 2002:a17:902:8d84:b0:159:5e8:ed01 with SMTP id v4-20020a1709028d8400b0015905e8ed01mr16660496plo.30.1650529771687;
        Thu, 21 Apr 2022 01:29:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090ae38400b001cd4989feb8sm1806467pjz.4.2022.04.21.01.29.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 01:29:31 -0700 (PDT)
Message-ID: <626115eb.1c69fb81.a9ab0.4919@mx.google.com>
Date:   Thu, 21 Apr 2022 01:29:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220421
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 29 builds: 3 failed, 26 passed, 6 errors,
 17 warnings (next-20220421)
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

next/master build: 29 builds: 3 failed, 26 passed, 6 errors, 17 warnings (n=
ext-20220421)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220421/

Tree: next
Branch: master
Git Describe: next-20220421
Git Commit: 65eb92e4c9f0a962656f131521f4fbc0d24c9d4c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    rpc_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arm64:
    allmodconfig (clang-14): 2 errors

arm:
    allmodconfig (clang-14): 2 errors, 14 warnings
    rpc_defconfig (gcc-10): 2 errors

i386:
    allnoconfig (gcc-10): 1 warning

mips:
    bigsur_defconfig (gcc-10): 1 warning

x86_64:
    tinyconfig (gcc-10): 1 warning

Errors summary:

    1    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2192) =
exceeds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    1    include/linux/fortify-string.h:328:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-large=
r-than]
    1    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limi=
t (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    14   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    2    drivers/base/topology.c:158:17: warning: unused variable =E2=80=98=
dev=E2=80=99 [-Wunused-variable]
    1    drivers/pci/pci-driver.c:533:12: warning: =E2=80=98pci_restore_sta=
ndard_config=E2=80=99 defined but not used [-Wunused-function]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 2 errors, 14 warnings, 0 secti=
on mismatches

Errors:
    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (10=
24) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-tha=
n]

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

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    sound/soc/intel/avs/path.c:815:18: error: stack frame size (2192) excee=
ds limit (2048) in 'avs_path_create' [-Werror,-Wframe-larger-than]
    include/linux/fortify-string.h:328:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/base/topology.c:158:17: warning: unused variable =E2=80=98dev=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/pci/pci-driver.c:533:12: warning: =E2=80=98pci_restore_standard=
_config=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
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
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

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
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/base/topology.c:158:17: warning: unused variable =E2=80=98dev=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
