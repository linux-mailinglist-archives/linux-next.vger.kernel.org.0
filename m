Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADAB766406
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 08:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjG1GTD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jul 2023 02:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbjG1GS6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jul 2023 02:18:58 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331BF3A99
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 23:18:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bb775625e2so11297005ad.1
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 23:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690525082; x=1691129882;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sNxhTYkcMoh9ZKNvWNArVtU+L64SIZNqzZ85ABD+dNs=;
        b=FrV4Vze1sApktNrq+4kxugJPA0vxEcZbmcZM1x3CLYCsSVggbH+Mv3byu5GrH0PjHA
         pHGKyxaGQkrC80hgi7EYQY9Rzo92RNvB2d8MrLPNdrR+tqu6cZ3bNyQDsDj2OTI+RoQc
         6cubAXWXj4gxzbvXrjxcV9U3rtPYTlven2ddHQuMICoyFFB9VegHOHXeZ7cP1rBW/STG
         V6z0Vsmnbp6JWiaJfyDPYOJOX7llhw5dbERJ76ISzaqsrIbQSWtXMWAuPL0+RKUxeNB9
         RjtyXb7roIeZ8KwvtPLJpDi1eEsQbP2Q7MHJAHi+20KNf2OKYSbxFyYDUK0xZAFChqTB
         xtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690525082; x=1691129882;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNxhTYkcMoh9ZKNvWNArVtU+L64SIZNqzZ85ABD+dNs=;
        b=l+y+gG5A41TXMNT0uL6h2NtXl0olSwQv8yKjOEcaV1UgdMXRUNzC/YWZGSvUjEV2NQ
         qfjLxKrJXIbeJBJKBo0geC+e7Vk6BoQqkplen3cJDrG2zDH6oiNw4SYH0mTCPSWhJFWk
         FFP2UVFpmC/xsPhqr0XBEZSJjQw0dD7QTHPGritZ65ZLSM7l7wpEy3MxNhjrwHF6qESC
         vMIwjTJVCqg+pg8LBa0MStfn78QOzh5vsMy7b6hfAvHcK1nQRoTL0al5NVDU5rC6PJ3I
         T4gZ92E/5sR7bF+IrBxiOAEcSOAee03cKTxfCN/94mC+zTGJf/3K52/V4wEGXJhybs0l
         ZJrg==
X-Gm-Message-State: ABy/qLbzMjbYqJsFFGuxY9S+pdGQ4lcD+NH9vNBlDmOhRHIbfCR3zkm/
        vN0VpTyoGkfME/MyF3tdgHuqWOMJrpbd0h4Vx8Kn9Q==
X-Google-Smtp-Source: APBJJlFFyYW+eq3nbxWbAm2rG0W2m89ZMP215BRLNu7WV73w2vaDd9dMgKCcV4FThfS0WY5LUWTuLw==
X-Received: by 2002:a17:902:b202:b0:1bb:cd5a:ba53 with SMTP id t2-20020a170902b20200b001bbcd5aba53mr969211plr.14.1690525081699;
        Thu, 27 Jul 2023 23:18:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id iy7-20020a170903130700b001b898595be7sm2671494plb.291.2023.07.27.23.18.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:18:00 -0700 (PDT)
Message-ID: <64c35d98.170a0220.d051b.51f8@mx.google.com>
Date:   Thu, 27 Jul 2023 23:18:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230728
X-Kernelci-Report-Type: build
Subject: next/master build: 30 builds: 3 failed, 27 passed, 9 errors,
 6 warnings (next-20230728)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 30 builds: 3 failed, 27 passed, 9 errors, 6 warnings (ne=
xt-20230728)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230728/

Tree: next
Branch: master
Git Describe: next-20230728
Git Commit: d7b3af5a77e8d8da28f435f313e069aea5bcf172
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    xway_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+rust: (rustc-1.70) FAIL

Errors and Warnings Detected:

arc:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:
    rpc_defconfig (gcc-10): 8 errors

mips:
    xway_defconfig (gcc-10): 1 error, 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings

x86_64:

Errors summary:

    1    arch/mips/lantiq/xway/gptu.c:140:6: error: implicit declaration of=
 function =E2=80=98of_irq_to_resource_table=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=
=3D0x'

Warnings summary:

    3    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    cc1: all warnings being treated as errors
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    fs/btrfs/extent_io.c:232:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.70) =E2=80=94 FAIL, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/lantiq/xway/gptu.c:140:6: error: implicit declaration of func=
tion =E2=80=98of_irq_to_resource_table=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>
