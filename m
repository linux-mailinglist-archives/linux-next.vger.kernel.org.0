Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60940677513
	for <lists+linux-next@lfdr.de>; Mon, 23 Jan 2023 07:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjAWGRe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Jan 2023 01:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjAWGRd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Jan 2023 01:17:33 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D4A166FC
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 22:17:28 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id c6so10444019pls.4
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 22:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KKOqdLytCUjRytKn5gn6nkqqova+xm/BmcHQhtS7j20=;
        b=4b0S4RK8aVNpGLsKJk+3m5iekBA6U+9Wwd87o5Vm5jA4U1XGfDINOsL7exyc/ydahd
         KZOGSbLI3+X2lNLCmtIIsxiw3O21P9bXy5oBkXs0x1QMOTyTvS9tQX8wqyIojAzbvgTo
         KUNEvmkoxmzPzRwmOT+7vogXF3pZfxQ8Bmdn2qVTX7OewkEXZhaV3wWbxSW2EAWOpBr5
         gb9ZBSdIpw/Nvk3AGnegpm7FoKZrLoIJN4uyOkbSJ9KD6na2JCVMAdC8kwONApeWloi1
         n49KiwrFWZbmWLtZ5lt1VKoDvrJoI7xHHMFeKC/BEODV/6nl7dHLd/ZKor1i7anROtI9
         KzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKOqdLytCUjRytKn5gn6nkqqova+xm/BmcHQhtS7j20=;
        b=ZbXifhdL1etLocv4/HJM1sPULit6XrC3q07cwn6S1B2ABBKpJP2Yp4RGUqYww/fPP5
         ZNeito3nyEJHuggdvcV4jDyt4APIwzwQsbw+N/oKWyuvxuMaBPW4lqnKZIbujTzcl7uT
         TUkd/Nyp5NbPwCJ7DVUQ4vFX7UCWjGF9me2AZuNF3wkzqQEAStw6Ox23LHdBHVK2ZB4Y
         EUkJBzlvfYPUmen8f/phuQmhkvagNWC+1H3OjNV13xcIT9kHuBNJ/M3V09xcCjfoXtVB
         TomdLrPcNexWovSiCLjm9+mMgVfMZgNpNc0CjuqD4bORiXaemrhiT0q4ndhpT34Vznvf
         Z3UQ==
X-Gm-Message-State: AFqh2kqYb8KQCoNdx/FW6vqw6jPTIEL8PhdV5bYyIUmRFt8uYJ5Qbhlu
        wdivj7Ejsj8PcQfEfLZSaj4lbq0J8pH2rSF6Pwo=
X-Google-Smtp-Source: AMrXdXvEivg2GoIzH7M98jWv2nC42GU6UyQQR4A/+j9uWLYAP4wXBqdlVcAPC+2FoX6yMKu7PwqSKA==
X-Received: by 2002:a05:6a20:9c89:b0:b0:3512:4d5e with SMTP id mj9-20020a056a209c8900b000b035124d5emr25597897pzb.18.1674454647285;
        Sun, 22 Jan 2023 22:17:27 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b2-20020a631b42000000b004cd1e132865sm10329958pgm.84.2023.01.22.22.17.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:17:26 -0800 (PST)
Message-ID: <63ce2676.630a0220.74d29.f9c2@mx.google.com>
Date:   Sun, 22 Jan 2023 22:17:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230123
X-Kernelci-Report-Type: build
Subject: next/master build: 196 builds: 15 failed, 181 passed, 52 errors,
 424 warnings (next-20230123)
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

next/master build: 196 builds: 15 failed, 181 passed, 52 errors, 424 warnin=
gs (next-20230123)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230123/

Tree: next
Branch: master
Git Describe: next-20230123
Git Commit: 691781f561e9868a94c3ed7daf4adad7f8af5d16
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

arm:
    allmodconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    imx_v6_v7_defconfig: (gcc-10) FAIL
    pxa3xx_defconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+rust: (rustc-1.62) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
2 errors, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 2 errors, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 2 errors, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 2 errors, 1 warning
    defconfig+arm64-chromebook (clang-13): 4 warnings

arm:
    allmodconfig (clang-16): 12 errors
    allmodconfig (gcc-10): 20 errors, 1 warning
    imx_v6_v7_defconfig (gcc-10): 1 error
    imxrt_defconfig (gcc-10): 51 warnings
    lpc18xx_defconfig (gcc-10): 53 warnings
    milbeaut_m10v_defconfig (gcc-10): 79 warnings
    mps2_defconfig (gcc-10): 50 warnings
    pxa3xx_defconfig (gcc-10): 1 error
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    sp7021_defconfig (gcc-10): 65 warnings
    stm32_defconfig (gcc-10): 48 warnings
    vf610m4_defconfig (gcc-10): 47 warnings

i386:
    allmodconfig (clang-16): 1 error

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
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
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+kselftest (rustc-1.62): 3 warnings
    x86_64_defconfig+rust (rustc-1.62): 1 error

Errors summary:

    4    drivers/hwtracing/coresight/coresight-core.c:1193:2: error: variab=
le 'hash' is used uninitialized whenever switch default is taken [-Werror,-=
Wsometimes-uninitialized]
    4    drivers/hwtracing/coresight/coresight-core.c:1178:7: error: variab=
le 'hash' is used uninitialized whenever switch case is taken [-Werror,-Wso=
metimes-uninitialized]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    drivers/gpu/drm/msm/msm_drv.h:237:38: error: field =E2=80=98gpu_de=
vfreq_config=E2=80=99 has incomplete type
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    error: aborting due to previous error
    1    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3602:12: error: =
stack frame size (1076) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-=
Wframe-larger-than]
    1    drivers/gpio/gpio-zevio.c:219:25: error: a parameter list without =
types is only allowed in a function definition
    1    drivers/gpio/gpio-zevio.c:219:1: error: type specifier missing, de=
faults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-=
int]
    1    drivers/gpio/gpio-zevio.c:219:1: error: type defaults to =E2=80=98=
int=E2=80=99 in declaration of =E2=80=98builtin_platform_driver=E2=80=99 [-=
Werror=3Dimplicit-int]
    1    drivers/gpio/gpio-zevio.c:219:1: error: parameter names (without t=
ypes) in function declaration [-Werror]
    1    drivers/gpio/gpio-zevio.c:219:1: error: data definition has no typ=
e or storage class [-Werror]
    1    drivers/gpio/gpio-zevio.c:217:3: error: =E2=80=98struct platform_d=
river=E2=80=99 has no member named =E2=80=98probe=E2=80=99
    1    drivers/gpio/gpio-zevio.c:217:12: error: excess elements in struct=
 initializer [-Werror]
    1    drivers/gpio/gpio-zevio.c:212:3: error: =E2=80=98struct platform_d=
river=E2=80=99 has no member named =E2=80=98driver=E2=80=99
    1    drivers/gpio/gpio-zevio.c:212:13: error: extra brace group at end =
of initializer
    1    drivers/gpio/gpio-zevio.c:212:13: error: excess elements in struct=
 initializer [-Werror]
    1    drivers/gpio/gpio-zevio.c:211:31: error: =E2=80=98zevio_gpio_drive=
r=E2=80=99 defined but not used [-Werror=3Dunused-variable]
    1    drivers/gpio/gpio-zevio.c:211:31: error: variable has incomplete t=
ype 'struct platform_driver'
    1    drivers/gpio/gpio-zevio.c:211:31: error: storage size of =E2=80=98=
zevio_gpio_driver=E2=80=99 isn=E2=80=99t known
    1    drivers/gpio/gpio-zevio.c:211:15: error: variable =E2=80=98zevio_g=
pio_driver=E2=80=99 has initializer but incomplete type
    1    drivers/gpio/gpio-zevio.c:191:16: error: invalid use of undefined =
type =E2=80=98struct platform_device=E2=80=99
    1    drivers/gpio/gpio-zevio.c:191:16: error: incomplete definition of =
type 'struct platform_device'
    1    drivers/gpio/gpio-zevio.c:189:39: error: invalid use of undefined =
type =E2=80=98struct platform_device=E2=80=99
    1    drivers/gpio/gpio-zevio.c:189:39: error: incomplete definition of =
type 'struct platform_device'
    1    drivers/gpio/gpio-zevio.c:186:29: error: invalid use of undefined =
type =E2=80=98struct platform_device=E2=80=99
    1    drivers/gpio/gpio-zevio.c:186:29: error: incomplete definition of =
type 'struct platform_device'
    1    drivers/gpio/gpio-zevio.c:184:21: error: implicit declaration of f=
unction =E2=80=98devm_platform_ioremap_resource=E2=80=99; did you mean =E2=
=80=98devm_ioremap_resource=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
    1    drivers/gpio/gpio-zevio.c:184:21: error: call to undeclared functi=
on 'devm_platform_ioremap_resource'; ISO C99 and later do not support impli=
cit function declarations [-Wimplicit-function-declaration]
    1    drivers/gpio/gpio-zevio.c:184:19: error: incompatible integer to p=
ointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1    drivers/gpio/gpio-zevio.c:184:19: error: assignment to =E2=80=98vo=
id *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer without=
 a cast [-Werror=3Dint-conversion]
    1    drivers/gpio/gpio-zevio.c:182:33: error: invalid use of undefined =
type =E2=80=98struct platform_device=E2=80=99
    1    drivers/gpio/gpio-zevio.c:182:33: error: incomplete definition of =
type 'struct platform_device'
    1    drivers/gpio/gpio-zevio.c:178:2: error: implicit declaration of fu=
nction =E2=80=98platform_set_drvdata=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
    1    drivers/gpio/gpio-zevio.c:178:2: error: call to undeclared functio=
n 'platform_set_drvdata'; ISO C99 and later do not support implicit functio=
n declarations [-Wimplicit-function-declaration]
    1    drivers/gpio/gpio-zevio.c:174:33: error: invalid use of undefined =
type =E2=80=98struct platform_device=E2=80=99
    1    drivers/gpio/gpio-zevio.c:174:33: error: incomplete definition of =
type 'struct platform_device'
    1    drivers/gpio/gpio-zevio.c:169:36: error: =E2=80=98struct platform_=
device=E2=80=99 declared inside parameter list will not be visible outside =
of this definition or declaration [-Werror]
    1    drivers/gpio/gpio-zevio.c:169:36: error: declaration of 'struct pl=
atform_device' will not be visible outside of this function [-Werror,-Wvisi=
bility]
    1    arch/arm/mach-pxa/pxa320.h:6:10: fatal error: mfp-pxa320.h: No suc=
h file or directory
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    393  <command-line>: warning: "__thumb2__" redefined
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initia=
lize the variable 'hash' to silence this warning
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: .text+0x143de6
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: .text+0x143f5b
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    vmlinux.o: warning: objtool: __asan_memset+0x36: call to __memset(=
) with UACCESS enabled
    1    vmlinux.o: warning: objtool: __asan_memmove+0x4f: call to __memmov=
e() with UACCESS enabled
    1    vmlinux.o: warning: objtool: __asan_memcpy+0x4f: call to __memcpy(=
) with UACCESS enabled
    1    drivers/hwtracing/coresight/coresight-core.c:1193:2: warning: vari=
able 'hash' is used uninitialized whenever switch default is taken [-Wsomet=
imes-uninitialized]
    1    drivers/hwtracing/coresight/coresight-core.c:1178:7: warning: vari=
able 'hash' is used uninitialized whenever switch case is taken [-Wsometime=
s-uninitialized]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    cc1: all warnings being treated as errors
    1    2 warnings generated.

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
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 12 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/gpio/gpio-zevio.c:169:36: error: declaration of 'struct platfor=
m_device' will not be visible outside of this function [-Werror,-Wvisibilit=
y]
    drivers/gpio/gpio-zevio.c:174:33: error: incomplete definition of type =
'struct platform_device'
    drivers/gpio/gpio-zevio.c:178:2: error: call to undeclared function 'pl=
atform_set_drvdata'; ISO C99 and later do not support implicit function dec=
larations [-Wimplicit-function-declaration]
    drivers/gpio/gpio-zevio.c:182:33: error: incomplete definition of type =
'struct platform_device'
    drivers/gpio/gpio-zevio.c:184:21: error: call to undeclared function 'd=
evm_platform_ioremap_resource'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
    drivers/gpio/gpio-zevio.c:184:19: error: incompatible integer to pointe=
r conversion assigning to 'void *' from 'int' [-Wint-conversion]
    drivers/gpio/gpio-zevio.c:186:29: error: incomplete definition of type =
'struct platform_device'
    drivers/gpio/gpio-zevio.c:189:39: error: incomplete definition of type =
'struct platform_device'
    drivers/gpio/gpio-zevio.c:191:16: error: incomplete definition of type =
'struct platform_device'
    drivers/gpio/gpio-zevio.c:211:31: error: variable has incomplete type '=
struct platform_driver'
    drivers/gpio/gpio-zevio.c:219:1: error: type specifier missing, default=
s to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    drivers/gpio/gpio-zevio.c:219:25: error: a parameter list without types=
 is only allowed in a function definition

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 20 errors, 1 warning, 0 section =
mismatches

Errors:
    drivers/gpio/gpio-zevio.c:169:36: error: =E2=80=98struct platform_devic=
e=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration [-Werror]
    drivers/gpio/gpio-zevio.c:174:33: error: invalid use of undefined type =
=E2=80=98struct platform_device=E2=80=99
    drivers/gpio/gpio-zevio.c:178:2: error: implicit declaration of functio=
n =E2=80=98platform_set_drvdata=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
    drivers/gpio/gpio-zevio.c:182:33: error: invalid use of undefined type =
=E2=80=98struct platform_device=E2=80=99
    drivers/gpio/gpio-zevio.c:184:21: error: implicit declaration of functi=
on =E2=80=98devm_platform_ioremap_resource=E2=80=99; did you mean =E2=80=98=
devm_ioremap_resource=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    drivers/gpio/gpio-zevio.c:184:19: error: assignment to =E2=80=98void *=
=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer without a c=
ast [-Werror=3Dint-conversion]
    drivers/gpio/gpio-zevio.c:186:29: error: invalid use of undefined type =
=E2=80=98struct platform_device=E2=80=99
    drivers/gpio/gpio-zevio.c:189:39: error: invalid use of undefined type =
=E2=80=98struct platform_device=E2=80=99
    drivers/gpio/gpio-zevio.c:191:16: error: invalid use of undefined type =
=E2=80=98struct platform_device=E2=80=99
    drivers/gpio/gpio-zevio.c:211:15: error: variable =E2=80=98zevio_gpio_d=
river=E2=80=99 has initializer but incomplete type
    drivers/gpio/gpio-zevio.c:212:3: error: =E2=80=98struct platform_driver=
=E2=80=99 has no member named =E2=80=98driver=E2=80=99
    drivers/gpio/gpio-zevio.c:212:13: error: extra brace group at end of in=
itializer
    drivers/gpio/gpio-zevio.c:212:13: error: excess elements in struct init=
ializer [-Werror]
    drivers/gpio/gpio-zevio.c:217:3: error: =E2=80=98struct platform_driver=
=E2=80=99 has no member named =E2=80=98probe=E2=80=99
    drivers/gpio/gpio-zevio.c:217:12: error: excess elements in struct init=
ializer [-Werror]
    drivers/gpio/gpio-zevio.c:219:1: error: data definition has no type or =
storage class [-Werror]
    drivers/gpio/gpio-zevio.c:219:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98builtin_platform_driver=E2=80=99 [-Wer=
ror=3Dimplicit-int]
    drivers/gpio/gpio-zevio.c:219:1: error: parameter names (without types)=
 in function declaration [-Werror]
    drivers/gpio/gpio-zevio.c:211:31: error: storage size of =E2=80=98zevio=
_gpio_driver=E2=80=99 isn=E2=80=99t known
    drivers/gpio/gpio-zevio.c:211:31: error: =E2=80=98zevio_gpio_driver=E2=
=80=99 defined but not used [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-16) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3602:12: error: stack=
 frame size (1076) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wfram=
e-larger-than]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mismatches

Errors:
    drivers/hwtracing/coresight/coresight-core.c:1178:7: error: variable 'h=
ash' is used uninitialized whenever switch case is taken [-Werror,-Wsometim=
es-uninitialized]
    drivers/hwtracing/coresight/coresight-core.c:1193:2: error: variable 'h=
ash' is used uninitialized whenever switch default is taken [-Werror,-Wsome=
times-uninitialized]

Warnings:
    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initialize =
the variable 'hash' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mismatches

Errors:
    drivers/hwtracing/coresight/coresight-core.c:1178:7: error: variable 'h=
ash' is used uninitialized whenever switch case is taken [-Werror,-Wsometim=
es-uninitialized]
    drivers/hwtracing/coresight/coresight-core.c:1193:2: error: variable 'h=
ash' is used uninitialized whenever switch default is taken [-Werror,-Wsome=
times-uninitialized]

Warnings:
    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initialize =
the variable 'hash' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mismat=
ches

Errors:
    drivers/hwtracing/coresight/coresight-core.c:1178:7: error: variable 'h=
ash' is used uninitialized whenever switch case is taken [-Werror,-Wsometim=
es-uninitialized]
    drivers/hwtracing/coresight/coresight-core.c:1193:2: error: variable 'h=
ash' is used uninitialized whenever switch default is taken [-Werror,-Wsome=
times-uninitialized]

Warnings:
    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initialize =
the variable 'hash' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mism=
atches

Errors:
    drivers/hwtracing/coresight/coresight-core.c:1178:7: error: variable 'h=
ash' is used uninitialized whenever switch case is taken [-Werror,-Wsometim=
es-uninitialized]
    drivers/hwtracing/coresight/coresight-core.c:1193:2: error: variable 'h=
ash' is used uninitialized whenever switch default is taken [-Werror,-Wsome=
times-uninitialized]

Warnings:
    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initialize =
the variable 'hash' to silence this warning

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
defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 4 wa=
rnings, 0 section mismatches

Warnings:
    drivers/hwtracing/coresight/coresight-core.c:1178:7: warning: variable =
'hash' is used uninitialized whenever switch case is taken [-Wsometimes-uni=
nitialized]
    drivers/hwtracing/coresight/coresight-core.c:1193:2: warning: variable =
'hash' is used uninitialized whenever switch default is taken [-Wsometimes-=
uninitialized]
    drivers/hwtracing/coresight/coresight-core.c:1166:10: note: initialize =
the variable 'hash' to silence this warning
    2 warnings generated.

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
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
i386_defconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    drivers/gpu/drm/msm/msm_drv.h:237:38: error: field =E2=80=98gpu_devfreq=
_config=E2=80=99 has incomplete type

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
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
nommu_k210_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/mach-pxa/pxa320.h:6:10: fatal error: mfp-pxa320.h: No such fil=
e or directory

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
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    drivers/gpu/drm/msm/msm_drv.h:237:38: error: field =E2=80=98gpu_devfreq=
_config=E2=80=99 has incomplete type

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
rv32_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 47 warnings, 0 se=
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
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: __asan_memset+0x36: call to __memset() wit=
h UACCESS enabled
    vmlinux.o: warning: objtool: __asan_memmove+0x4f: call to __memmove() w=
ith UACCESS enabled
    vmlinux.o: warning: objtool: __asan_memcpy+0x4f: call to __memcpy() wit=
h UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: .text+0x143f5b
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !END=
BR: .text+0x143de6
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 FAIL, 1 error, 0 warni=
ngs, 0 section mismatches

Errors:
    error: aborting due to previous error

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

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

---
For more info write to <info@kernelci.org>
