Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0976350B9
	for <lists+linux-next@lfdr.de>; Wed, 23 Nov 2022 07:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbiKWG6O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Nov 2022 01:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236178AbiKWG6M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Nov 2022 01:58:12 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56521786DC
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 22:58:09 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so3137677pjt.0
        for <linux-next@vger.kernel.org>; Tue, 22 Nov 2022 22:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ9Pct/Q2ifC630VN0gV7f4BG3gxD0YXShSi45X0a3M=;
        b=xVjahegQ6Mr/10Gb+zNxppouPZtyCIyG4XIRPG+kQMrvjzutTj5VLji6DpjeyxQOiT
         sECIz5nKJDBFS8vQQkQV3p7oKxqOABdF0t/2qZY0EUKHzCtB0l319pf6TCBLIhgmY2j8
         3OSJ0iVwQDci2OSalcmrSZblo09cFmZJubBCS1RHRkPjny+yoFPIxn2CI0vKCeLjnt3v
         ZwMjKPNuyxYk7+JF9ws/Y0zSwcnXaFI2Ccf6n1ZUlPgWXT5JW73C3ZePCnM+GhOjC2BB
         afK2DDEGESAZ/UL8zcFoGQALWoIS7PrpZavLs7VQ+ao1cD+jeD5gHlQlwcWOokyfH1te
         DPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ9Pct/Q2ifC630VN0gV7f4BG3gxD0YXShSi45X0a3M=;
        b=odbh60c8Zp18tPBatymQYFHnSsKNf0iuX4EqZNqGiiB+OjP/Vioqb6w+UPwzOYtGoo
         1pwGr1N6OBBzIOPDrvjiXTEd89hvOII+M7HmQf2UUw0jJYJUOBhPTJ0XEaTgkm4P78xJ
         g/DkA0F5FkrdmfHc4/st08ei78KHoe+M9stPYiWVr2cmt9uN7FHG6EnCJOFW+50vQrxR
         +Vq+jeHyZXK/qI73FsWIcjn8nuA3ru0oyaD8ZMBR17/xRhcdxtNxtFAyrmKMOSFEKIuL
         QZGY0/enOaGOZ98P5q6QEV+EPzupZwgMvgpU1JT1hPZyoBGB1uPOpeHhaDkUeacjA+Vj
         PsgA==
X-Gm-Message-State: ANoB5pnBX94RfwE/PggRQmdjzd/RodOz9+yF8aXi++e8BKXTgFcthL3A
        rrOwf11slc5e85IcelNQycTMppuLngcHMpPZBug=
X-Google-Smtp-Source: AA0mqf5UgPfgtSPiEoXD6roto5IF50a7ZCtk/XVa7TUOKhKRYjf1w5jwuIiQxMe36fOlxmHJ+NV9Ag==
X-Received: by 2002:a17:903:240a:b0:188:5d24:87e with SMTP id e10-20020a170903240a00b001885d24087emr7362441plo.87.1669186687228;
        Tue, 22 Nov 2022 22:58:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i63-20020a626d42000000b0056bc1d7816dsm12131690pfc.99.2022.11.22.22.58.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 22:58:06 -0800 (PST)
Message-ID: <637dc47e.620a0220.98444.38fb@mx.google.com>
Date:   Tue, 22 Nov 2022 22:58:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221123
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 153 builds: 24 failed, 129 passed, 140 errors,
 397 warnings (next-20221123)
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

next/master build: 153 builds: 24 failed, 129 passed, 140 errors, 397 warni=
ngs (next-20221123)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221123/

Tree: next
Branch: master
Git Describe: next-20221123
Git Commit: 736b6d81d93cf61a0601af90bd552103ef997b3f
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
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL
    allmodconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    mini2440_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    s3c2410_defconfig: (gcc-10) FAIL
    s3c6400_defconfig: (gcc-10) FAIL
    tct_hammer_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

sparc:
    tinyconfig: (gcc-10) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL
    allmodconfig: (clang-16) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
8 errors
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 8 errors
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 8 errors
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 8 errors
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 8 errors
    defconfig+arm64-chromebook (clang-13): 11 warnings

arm:
    allmodconfig (gcc-10): 1 error
    allmodconfig (clang-16): 10 errors
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 8 =
errors
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 8 errors
    imxrt_defconfig (gcc-10): 51 warnings
    lpc18xx_defconfig (gcc-10): 53 warnings
    milbeaut_m10v_defconfig (gcc-10): 79 warnings
    mini2440_defconfig (gcc-10): 1 error
    moxart_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 1 error
    s3c6400_defconfig (gcc-10): 1 error
    sp7021_defconfig (gcc-10): 65 warnings
    stm32_defconfig (gcc-10): 48 warnings
    tct_hammer_defconfig (gcc-10): 1 error
    vf610m4_defconfig (gcc-10): 47 warnings
    viper_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-16): 8 errors

mips:
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 1 warning
    bmips_be_defconfig (gcc-10): 11 warnings
    bmips_stb_defconfig (gcc-10): 11 warnings
    fuloong2e_defconfig (gcc-10): 1 error
    rs90_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 8 errors, 4 warnings

x86_64:
    allmodconfig (clang-16): 9 errors
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 8 errors
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 8 errors
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 8 errors
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 8 errors
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 8 errors

Errors summary:

    12   kernel/bpf/verifier.c:8955:31: error: array index 7 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8950:31: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8942:24: error: array index 5 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8690:25: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8447:19: error: array index 5 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8200:23: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:15221:23: error: array index 7 is past the e=
nd of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:15220:30: error: array index 6 is past the e=
nd of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    3    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    3    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the e=
nd of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-=
Warray-bounds]
    3    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the e=
nd of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-=
Warray-bounds]
    3    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_dat=
a/dma-s3c24xx.h: No such file or directory
    2    kernel/bpf/helpers.c:2025:40: error: multiple unsequenced modifica=
tions to 'idx' [-Werror,-Wunsequenced]
    2    arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/d=
ma-s3c24xx.h: No such file or directory
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    kernel/printk/printk.c:95:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98DEFINE_STATIC_SRCU=E2=80=99 [-Werror=
=3Dimplicit-int]
    1    kernel/printk/printk.c:3523:20: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
setup=E2=80=99?
    1    kernel/printk/printk.c:3471:20: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
setup=E2=80=99?
    1    kernel/printk/printk.c:3124:20: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
setup=E2=80=99?
    1    kernel/printk/printk.c:302:28: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
sem=E2=80=99?
    1    kernel/printk/printk.c:290:1: error: control reaches end of non-vo=
id function [-Werror=3Dreturn-type]
    1    kernel/printk/printk.c:289:33: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
sem=E2=80=99?
    1    kernel/printk/printk.c:261:29: error: =E2=80=98console_srcu=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98console_=
sem=E2=80=99?
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arch/arm/mach-s3c/devs.c:32:10: fatal error: 'linux/platform_data/=
dma-s3c24xx.h' file not found
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    295  <command-line>: warning: "__thumb2__" redefined
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    4    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:120.5-22: Warning (reg_forma=
t): /ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (=
8 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #size-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #address-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_forma=
t): /ubus/timer-mfd@10000080/timer@0:reg: property has invalid length (8 by=
tes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #=
size-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #=
address-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_fo=
rmat): /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid lengt=
h (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (s=
pi_bus_reg): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (p=
ci_device_reg): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (p=
ci_device_bus_num): Failed prerequisite 'reg_format'
    2    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i=
2c_bus_reg): Failed prerequisite 'reg_format'
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    kernel/printk/printk.c:95:1: warning: parameter names (without typ=
es) in function declaration
    1    kernel/printk/printk.c:95:1: warning: data definition has no type =
or storage class
    1    kernel/bpf/verifier.c:8955:31: warning: array index 7 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8950:31: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8942:24: warning: array index 5 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8690:25: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8447:19: warning: array index 5 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8200:23: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:15221:23: warning: array index 7 is past the=
 end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:15220:30: warning: array index 6 is past the=
 end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/helpers.c:2025:40: warning: multiple unsequenced modifi=
cations to 'idx' [-Wunsequenced]
    1    cc1: some warnings being treated as errors
    1    8 warnings generated.
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
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
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3=
c24xx.h: No such file or directory

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 10 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/mach-s3c/devs.c:32:10: fatal error: 'linux/platform_data/dma-s=
3c24xx.h' file not found
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/helpers.c:2025:40: error: multiple unsequenced modifications=
 to 'idx' [-Werror,-Wunsequenced]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-16) =E2=80=94 FAIL, 9 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/helpers.c:2025:40: error: multiple unsequenced modifications=
 to 'idx' [-Werror,-Wunsequenced]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-16) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]

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
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 11 warnings, 0 =
section mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/timer@0:reg: property has invalid length (8 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:120.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (8 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_format)=
: /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid length (12=
 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2, #si=
ze-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #addre=
ss-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #size-=
cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 11 warnings, 0=
 section mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/timer@0:reg: property has invalid length (8 bytes) =
(#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:120.5-22: Warning (reg_format): /=
ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (8 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_format)=
: /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid length (12=
 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2, #si=
ze-cells =3D=3D 1)
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (pci_de=
vice_bus_num): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (i2c_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb: Warning (spi_bu=
s_reg): Failed prerequisite 'reg_format'
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #addre=
ss-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.12-116.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/timer@0: Relying on default #size-=
cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:118.21-126.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

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
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatch=
es

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section misma=
tches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section misma=
tches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mis=
matches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section =
mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section =
mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatc=
hes

Errors:
    kernel/bpf/verifier.c:8200:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 11 w=
arnings, 0 section mismatches

Warnings:
    kernel/bpf/verifier.c:8200:23: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8447:19: warning: array index 5 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8690:25: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8942:24: warning: array index 5 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8950:31: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8955:31: warning: array index 7 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:15220:30: warning: array index 6 is past the end =
of the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:15221:23: warning: array index 7 is past the end =
of the array (which contains 5 elements) [-Warray-bounds]
    8 warnings generated.
    kernel/bpf/helpers.c:2025:40: warning: multiple unsequenced modificatio=
ns to 'idx' [-Wunsequenced]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
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
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
mini2440_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_data/dma=
-s3c24xx.h: No such file or directory

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

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
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
s3c2410_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_data/dma=
-s3c24xx.h: No such file or directory

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3=
c24xx.h: No such file or directory

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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_data/dma=
-s3c24xx.h: No such file or directory

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 FAIL, 8 errors, 4 warnings, 0 section =
mismatches

Errors:
    kernel/printk/printk.c:95:1: error: type defaults to =E2=80=98int=E2=80=
=99 in declaration of =E2=80=98DEFINE_STATIC_SRCU=E2=80=99 [-Werror=3Dimpli=
cit-int]
    kernel/printk/printk.c:261:29: error: =E2=80=98console_srcu=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98console_sem=E2=
=80=99?
    kernel/printk/printk.c:289:33: error: =E2=80=98console_srcu=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98console_sem=E2=
=80=99?
    kernel/printk/printk.c:302:28: error: =E2=80=98console_srcu=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98console_sem=E2=
=80=99?
    kernel/printk/printk.c:3124:20: error: =E2=80=98console_srcu=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98console_setup=
=E2=80=99?
    kernel/printk/printk.c:3471:20: error: =E2=80=98console_srcu=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98console_setup=
=E2=80=99?
    kernel/printk/printk.c:3523:20: error: =E2=80=98console_srcu=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98console_setup=
=E2=80=99?
    kernel/printk/printk.c:290:1: error: control reaches end of non-void fu=
nction [-Werror=3Dreturn-type]

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/printk/printk.c:95:1: warning: data definition has no type or st=
orage class
    kernel/printk/printk.c:95:1: warning: parameter names (without types) i=
n function declaration
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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

---
For more info write to <info@kernelci.org>
