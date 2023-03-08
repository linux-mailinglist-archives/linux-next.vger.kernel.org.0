Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D646B0040
	for <lists+linux-next@lfdr.de>; Wed,  8 Mar 2023 08:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjCHHxy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Mar 2023 02:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCHHxy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Mar 2023 02:53:54 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE73287365
        for <linux-next@vger.kernel.org>; Tue,  7 Mar 2023 23:53:49 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u5so16876015plq.7
        for <linux-next@vger.kernel.org>; Tue, 07 Mar 2023 23:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678262029;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YDUjldCVVoyGQ6eMJMvAv9khwg8ynlADJX3LzBc6jk4=;
        b=BVne4giru2LIyoVmzljzz9MQjvD3uNJ+zeRwgAxbuE1scBk1wv7YBfpf+nSzWs5eIk
         80J5qWcT1nCGsgxqI6zYDyUv30OuGqhJbw9n69A+WV+pkMNvPANwezNgPERsg8k6ujr0
         h8U/3shNkUIflaU+sLHL4ZXp7HiE8AraMJQ2CF4PLTMGYB3PMkOImVC18jHVQvWN0Jlz
         CTblBuf/2nEHz9BC572bNGAH6wE1XoURpqfNklQ3qm/gtUs9OZo7ySnvJdsDscqrZIM2
         r7djEQ6VzgOgfITa0sgqNLm0ma1gFqht2mjMupNdHn29xhwMI11Aq1yxcsNHfTjoErqA
         x7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678262029;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDUjldCVVoyGQ6eMJMvAv9khwg8ynlADJX3LzBc6jk4=;
        b=sPGfpJUFw+65BmdO2UoIWjHlcqCJ7jyG6F+EAbn+ub/WYyThHGoPi6gPOGSUbNXgo+
         qbAqakpI6rzy+0TSRvLV/MxD2n4IGH+b7m5Xf8Jn7FnjheAwuG/PDi/1rhGyqJnu9UcH
         /0YgMyGUozr8y9q/2s07N7+cZb2vDLD6/e7QO0D+Ed8pUWu7GH0B+cvz80092aZAzBXw
         508nq2Y0nCp06mC2J+IEHDqxwPkAmP2EXow0+AW5Dwep0hFabewTf//KSHQ4w2eC/H/+
         k3+XpWEXUK4tQ+Qg49pev8rvyQXGskNtfUOAuXvr3mMQ4CUFl56Po9EsonCUqqrkKK9l
         YvTw==
X-Gm-Message-State: AO0yUKXX5ECamcdmw1MdGkkWrkSex1kGuwbEt2s3/dJ7e/BvENAQMWvR
        0NSpfLuflhG+VNEQpQfGORQqsyQay67Va5ElQzp2BA==
X-Google-Smtp-Source: AK7set+NfigjBJoGJkY5+EjDgZ0PU/T+wfidMjKQC9MdmRqrRWGsppnlnCpVdPqAEu/9xQ+WMmlkRg==
X-Received: by 2002:a17:902:d506:b0:19e:2717:3de9 with SMTP id b6-20020a170902d50600b0019e27173de9mr22115792plg.52.1678262027774;
        Tue, 07 Mar 2023 23:53:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019a7d6a9a76sm9436847plc.111.2023.03.07.23.53.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:53:47 -0800 (PST)
Message-ID: <64083f0b.170a0220.328b4.21dd@mx.google.com>
Date:   Tue, 07 Mar 2023 23:53:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230308
X-Kernelci-Report-Type: build
Subject: next/master build: 211 builds: 14 failed, 197 passed, 48 errors,
 32 warnings (next-20230308)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 211 builds: 14 failed, 197 passed, 48 errors, 32 warning=
s (next-20230308)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230308/

Tree: next
Branch: master
Git Describe: next-20230308
Git Commit: fc31900c948610e7b5c2f15fb7795832c8325327
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    multi_v5_defconfig: (clang-17) FAIL
    multi_v5_defconfig: (gcc-10) FAIL
    mvebu_v5_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    ar7_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-17): 3 errors, 3 warnings

arm:
    allmodconfig (clang-17): 3 errors, 3 warnings
    multi_v5_defconfig (clang-17): 4 errors
    multi_v5_defconfig (gcc-10): 5 errors
    mvebu_v5_defconfig (gcc-10): 5 errors
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 3 errors, 3 warnings

mips:
    ar7_defconfig (gcc-10): 11 errors, 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    xway_defconfig (gcc-10): 1 error

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 3 errors, 6 warnings
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 3 errors, 3 warnings
    x86_64_defconfig+kselftest (rustc-1.62): 1 warning

Errors summary:

    8    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135=
_clk_of_clk_init_declare" on integer constant
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:115=
2:34: error: variable 'software_shutdown_temp' is uninitialized when used h=
ere [-Werror,-Wuninitialized]
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
9:24: error: variable 'memlimit' is uninitialized when used here [-Werror,-=
Wuninitialized]
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
6:3: error: variable 'hotspotlimit' is uninitialized when used here [-Werro=
r,-Wuninitialized]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in de=
cimal constant
    2    drivers/clk/mvebu/kirkwood.c:358:16: error: expected identifier or=
 =E2=80=98(=E2=80=99 before numeric constant
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error: linux/gpio/legac=
y-of-mm-gpiochip.h.h: No such file or directory
    1    drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or =
'('
    1    arch/mips/ar7/gpio.c:93:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:78:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:68:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:55:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:42:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:32:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:318:8: error: implicit declaration of functio=
n =E2=80=98gpiochip_add_data=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
    1    arch/mips/ar7/gpio.c:24:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:24:31: error: implicit declaration of functio=
n =E2=80=98gpiochip_get_data=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
    1    arch/mips/ar7/gpio.c:19:19: error: field =E2=80=98chip=E2=80=99 ha=
s incomplete type
    1    arch/mips/ar7/gpio.c:105:31: error: initialization of =E2=80=98str=
uct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from =
integer without a cast [-Werror=3Dint-conversion]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
6:18: note: initialize the variable 'memlimit' to silence this warning
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
5:22: note: initialize the variable 'hotspotlimit' to silence this warning
    5    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
4:32: note: initialize the variable 'software_shutdown_temp' to silence thi=
s warning
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: machine_kexec_prepare+0x27d
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7612: sta=
ck state mismatch: cfa1=3D4+360 cfa2=3D4+352
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function __cfi_m5mols_get_fmt()
    1    cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 secti=
on mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 3 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: machine_kexec_prepare+0x27d
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7612: stack st=
ate mismatch: cfa1=3D4+360 cfa2=3D4+352
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning
    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() f=
alls through to next function __cfi_m5mols_get_fmt()

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
ar7_defconfig (mips, gcc-10) =E2=80=94 FAIL, 11 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/ar7/gpio.c:19:19: error: field =E2=80=98chip=E2=80=99 has inc=
omplete type
    arch/mips/ar7/gpio.c:24:31: error: implicit declaration of function =E2=
=80=98gpiochip_get_data=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    arch/mips/ar7/gpio.c:24:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:32:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:42:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:55:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:68:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:78:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:93:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:105:31: error: initialization of =E2=80=98struct a=
r7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integ=
er without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:318:8: error: implicit declaration of function =E2=
=80=98gpiochip_add_data=E2=80=99 [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: all warnings being treated as errors

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
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

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
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 =
section mismatches

Errors:
    drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or '('
    drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant
    drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant
    drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal=
 constant

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: expected identifier or =E2=
=80=98(=E2=80=99 before numeric constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: expected identifier or =E2=
=80=98(=E2=80=99 before numeric constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant
    drivers/clk/mvebu/kirkwood.c:358:16: error: invalid suffix "dx1135_clk_=
of_clk_init_declare" on integer constant

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

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
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error: linux/gpio/legacy-of-=
mm-gpiochip.h.h: No such file or directory

---
For more info write to <info@kernelci.org>
