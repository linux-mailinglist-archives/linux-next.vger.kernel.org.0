Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD5C631EF2
	for <lists+linux-next@lfdr.de>; Mon, 21 Nov 2022 12:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiKULCN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Nov 2022 06:02:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiKULCM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2022 06:02:12 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA9AA1A03
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 03:02:08 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id q71so10814649pgq.8
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WsMKU16uNBbrLpOGeoqJFCIsNNBhKzMbuGcqHPW+1cg=;
        b=4qgAMlWCjD+y/CSkYBoDo6z+FG4gY/aMajNvvSh58oFrcWl2dzqKCOmTiqLGsLnsIs
         PB/ncDn4ooiQFfSFmc0yfeN7u5FFAatzWjuRFuSLHRRNjaF3mk61lWRK21Xqk4qsAb6C
         Qi+8JOi7nAbyqSlZmGapCuSS9MWuN+wxN4PJWHOm/xK4tNpm8kMh0x51TDkeuoK3ukk3
         iFkKsKZaqDc/v6v6ppfOgo7US6hthnMlvYuSpXEniUQt63IVqr1NtxVM9fEaB3Kk7WiZ
         ne002xtwyHD0HJmJb9DGWmclx1OyDlZFItTRDgKpIv/3GIRqqKRyBMfwpqNmi7c/Hlc4
         +gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsMKU16uNBbrLpOGeoqJFCIsNNBhKzMbuGcqHPW+1cg=;
        b=1r3ObknRXvOL3nUyN0bM+q6G6V6Kwfr85L2iPLuSULo2qy4SwKQmoW2qlVPCL3Au5A
         tv958k0KHab5Tm+BMCcad1oWjdYVvxePuKVSVbOXoQxNUBL1Clx9BHlatbuArugJI3G7
         dXxQB1/vfmFnNalPJwgq4lnqYqCJc0ZH7yQnpItb8Si7ri/Qa1SEN3wy99SMYzltfgWo
         uAvZoVf6G41NdSWU2AyTM5FYAXMAB+zt//UitVOSVwpRysZdthYGDYh08JoRr1qn0j2D
         1bNvPxO0yoZ4hNI0zv5i6qvuuqz4HvED0ppT6ljAwC2alsXIiSbojVap3phrzyBC5fto
         4d4Q==
X-Gm-Message-State: ANoB5plebOiJrXUiMYTmHnSEKCjFTcpbd8XtjnBz+R4UUApjay2za+Ro
        QVABl3ljjYtIoCyh55QYc/eV6/O8zySmARnHRn4=
X-Google-Smtp-Source: AA0mqf7Tb/5RBU1SFPo8TkWBfD/NCsj2Nll0wQFgBFWGJLCfly3y09gvlcAcp4/9aJI6PdYUtRY+rw==
X-Received: by 2002:a63:748:0:b0:439:6dfb:3bc3 with SMTP id 69-20020a630748000000b004396dfb3bc3mr17068986pgh.167.1669028525585;
        Mon, 21 Nov 2022 03:02:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d20-20020aa797b4000000b005722f4dfbefsm8364004pfq.193.2022.11.21.03.02.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:02:05 -0800 (PST)
Message-ID: <637b5aad.a70a0220.ee55.bad9@mx.google.com>
Date:   Mon, 21 Nov 2022 03:02:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221121
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 234 builds: 25 failed, 209 passed, 167 errors,
 606 warnings (next-20221121)
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

next/master build: 234 builds: 25 failed, 209 passed, 167 errors, 606 warni=
ngs (next-20221121)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221121/

Tree: next
Branch: master
Git Describe: next-20221121
Git Commit: e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
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
    allmodconfig: (clang-16) FAIL

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
    ath25_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

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
    allmodconfig (clang-16): 9 errors, 1 warning
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
    defconfig (clang-16): 9 warnings
    defconfig+arm64-chromebook (clang-13): 9 warnings

arm:
    allmodconfig (clang-16): 10 errors, 1 warning
    allmodconfig (gcc-10): 1 error
    aspeed_g5_defconfig (clang-16): 9 warnings
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 8 =
errors
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 8 errors
    imxrt_defconfig (gcc-10): 51 warnings
    keystone_defconfig (gcc-10): 1 warning
    lpc18xx_defconfig (gcc-10): 53 warnings
    milbeaut_m10v_defconfig (gcc-10): 79 warnings
    mini2440_defconfig (gcc-10): 1 error
    moxart_defconfig (gcc-10): 1 warning
    mps2_defconfig (gcc-10): 50 warnings
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 1 warni=
ng
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 124 warnings
    multi_v7_defconfig+debug (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 1 error
    s3c6400_defconfig (gcc-10): 1 error
    sp7021_defconfig (gcc-10): 65 warnings
    stm32_defconfig (gcc-10): 48 warnings
    tct_hammer_defconfig (gcc-10): 1 error
    tegra_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 47 warnings
    viper_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-16): 9 errors, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 1 warning
    ath25_defconfig (gcc-10): 22 errors
    bmips_be_defconfig (gcc-10): 8 warnings
    bmips_stb_defconfig (gcc-10): 8 warnings
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-16): 12 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-16): 9 errors, 1 warning
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

    12   kernel/bpf/verifier.c:8951:31: error: array index 7 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8946:31: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8938:24: error: array index 5 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8686:25: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8443:19: error: array index 5 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:8196:23: error: array index 6 is past the en=
d of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:15217:23: error: array index 7 is past the e=
nd of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    12   kernel/bpf/verifier.c:15216:30: error: array index 6 is past the e=
nd of the array (which contains 5 elements) [-Werror,-Warray-bounds]
    4    mm/rmap.c:1236:13: error: variable 'first' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    4    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the en=
d of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-W=
array-bounds]
    4    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the e=
nd of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-=
Warray-bounds]
    4    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the e=
nd of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-=
Warray-bounds]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_dat=
a/dma-s3c24xx.h: No such file or directory
    2    arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/d=
ma-s3c24xx.h: No such file or directory
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    mips-linux-gnu-ld: hid-input.c:(.text+0xd90): undefined reference =
to `input_free_device'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x5274): undefined reference=
 to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x5194): undefined reference=
 to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4fa0): undefined reference=
 to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4f8c): undefined reference=
 to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4dc): undefined reference =
to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4d08): undefined reference=
 to `input_register_device'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4c8): undefined reference =
to `input_event'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4c10): undefined reference=
 to `input_free_device'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x4aa4): undefined reference=
 to `input_set_abs_params'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x1928): undefined reference=
 to `input_alloc_absinfo'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x190c): undefined reference=
 to `input_set_abs_params'
    1    mips-linux-gnu-ld: hid-input.c:(.text+0x1230): undefined reference=
 to `input_free_device'
    1    mips-linux-gnu-ld: drivers/hid/hid-input.o:hid-input.c:(.text+0x52=
a8): more undefined references to `input_event' follow
    1    hid-input.c:(.text+0xd6c): undefined reference to `input_unregiste=
r_device'
    1    hid-input.c:(.text+0xbf8): undefined reference to `input_ff_event'
    1    hid-input.c:(.text+0x710): undefined reference to `input_scancode_=
to_scalar'
    1    hid-input.c:(.text+0x540): undefined reference to `input_event'
    1    hid-input.c:(.text+0x4df8): undefined reference to `input_event'
    1    hid-input.c:(.text+0x4b4): undefined reference to `input_event'
    1    hid-input.c:(.text+0x410): undefined reference to `input_event'
    1    hid-input.c:(.text+0x1034): undefined reference to `input_allocate=
_device'
    1    arch/arm/mach-s3c/devs.c:32:10: fatal error: 'linux/platform_data/=
dma-s3c24xx.h' file not found
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    516  <command-line>: warning: "__thumb2__" redefined
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=98100000=
0000 << 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=
=80=99 only has 32 bits [-Wshift-overflow=3D]
    7    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    5    mm/rmap.c:1223:12: note: initialize the variable 'first' to silenc=
e this warning
    4    8 warnings generated.
    3    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the =
end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-=
bounds]
    3    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the=
 end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray=
-bounds]
    3    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the=
 end of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray=
-bounds]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_forma=
t): /ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (=
8 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #size-cells value
    2    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid=
_default_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on defau=
lt #address-cells value
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
    1    mm/rmap.c:1236:13: warning: variable 'first' is used uninitialized=
 whenever 'if' condition is false [-Wsometimes-uninitialized]
    1    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the =
end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the=
 end of the array (which contains 5 elements) [-Warray-bounds]
    1    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the=
 end of the array (which contains 5 elements) [-Warray-bounds]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    1 warning generated.

Section mismatches summary:

    14   WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch i=
n reference: init_module (section: .init.text) -> cc_debugfs_global_fini (s=
ection: .exit.text)

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
allmodconfig (i386, clang-16) =E2=80=94 FAIL, 9 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/rmap.c:1236:13: error: variable 'first' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]

Warnings:
    mm/rmap.c:1223:12: note: initialize the variable 'first' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-16) =E2=80=94 FAIL, 9 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/rmap.c:1236:13: error: variable 'first' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]

Warnings:
    mm/rmap.c:1223:12: note: initialize the variable 'first' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 10 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/arm/mach-s3c/devs.c:32:10: fatal error: 'linux/platform_data/dma-s=
3c24xx.h' file not found
    mm/rmap.c:1236:13: error: variable 'first' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]

Warnings:
    mm/rmap.c:1223:12: note: initialize the variable 'first' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-16) =E2=80=94 FAIL, 9 errors, 1 warning, 0 secti=
on mismatches

Errors:
    mm/rmap.c:1236:13: error: variable 'first' is used uninitialized whenev=
er 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warray=
-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Werror,-Warra=
y-bounds]

Warnings:
    mm/rmap.c:1223:12: note: initialize the variable 'first' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3=
c24xx.h: No such file or directory

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
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
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
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 9 warnings, 0=
 section mismatches

Warnings:
    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    8 warnings generated.

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
ath25_defconfig (mips, gcc-10) =E2=80=94 FAIL, 22 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    hid-input.c:(.text+0x410): undefined reference to `input_event'
    hid-input.c:(.text+0x4b4): undefined reference to `input_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4c8): undefined reference to `i=
nput_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4dc): undefined reference to `i=
nput_event'
    hid-input.c:(.text+0x540): undefined reference to `input_event'
    hid-input.c:(.text+0x710): undefined reference to `input_scancode_to_sc=
alar'
    hid-input.c:(.text+0xbf8): undefined reference to `input_ff_event'
    hid-input.c:(.text+0xd6c): undefined reference to `input_unregister_dev=
ice'
    mips-linux-gnu-ld: hid-input.c:(.text+0xd90): undefined reference to `i=
nput_free_device'
    hid-input.c:(.text+0x1034): undefined reference to `input_allocate_devi=
ce'
    mips-linux-gnu-ld: hid-input.c:(.text+0x1230): undefined reference to `=
input_free_device'
    mips-linux-gnu-ld: hid-input.c:(.text+0x190c): undefined reference to `=
input_set_abs_params'
    mips-linux-gnu-ld: hid-input.c:(.text+0x1928): undefined reference to `=
input_alloc_absinfo'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4aa4): undefined reference to `=
input_set_abs_params'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4c10): undefined reference to `=
input_free_device'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4d08): undefined reference to `=
input_register_device'
    hid-input.c:(.text+0x4df8): undefined reference to `input_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4f8c): undefined reference to `=
input_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x4fa0): undefined reference to `=
input_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x5194): undefined reference to `=
input_event'
    mips-linux-gnu-ld: hid-input.c:(.text+0x5274): undefined reference to `=
input_event'
    mips-linux-gnu-ld: drivers/hid/hid-input.o:hid-input.c:(.text+0x52a8): =
more undefined references to `input_event' follow

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
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
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
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /=
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
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #a=
ddress-cells value
    arch/mips/boot/dts/brcm/bcm63268.dtsi:113.21-121.6: Warning (avoid_defa=
ult_addr_size): /ubus/timer-mfd@10000080/watchdog@1c: Relying on default #s=
ize-cells value

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
) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatch=
es

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section misma=
tches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section misma=
tches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mis=
matches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section =
mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section =
mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mismatc=
hes

Errors:
    kernel/bpf/verifier.c:8196:23: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: error: array index 5 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: error: array index 6 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: error: array index 7 is past the end of =
the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: error: array index 6 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: error: array index 7 is past the end of=
 the array (which contains 5 elements) [-Werror,-Warray-bounds]

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
defconfig (arm64, clang-16) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section=
 mismatches

Warnings:
    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    8 warnings generated.

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-16) =E2=80=94 PASS, 0 errors, 12 war=
nings, 0 section mismatches

Warnings:
    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the end o=
f the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-bound=
s]
    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the end =
of the array (that has type 'u32[5]' (aka 'unsigned int[5]')) [-Warray-boun=
ds]
    8 warnings generated.
    mm/rmap.c:1236:13: warning: variable 'first' is used uninitialized when=
ever 'if' condition is false [-Wsometimes-uninitialized]
    mm/rmap.c:1223:12: note: initialize the variable 'first' to silence thi=
s warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 9 wa=
rnings, 0 section mismatches

Warnings:
    kernel/bpf/verifier.c:8196:23: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8443:19: warning: array index 5 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8686:25: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8938:24: warning: array index 5 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8946:31: warning: array index 6 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:8951:31: warning: array index 7 is past the end o=
f the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:15216:30: warning: array index 6 is past the end =
of the array (which contains 5 elements) [-Warray-bounds]
    kernel/bpf/verifier.c:15217:23: warning: array index 7 is past the end =
of the array (which contains 5 elements) [-Warray-bounds]
    8 warnings generated.

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: drivers/crypto/ccree/ccree.o: section mismatch in ref=
erence: init_module (section: .init.text) -> cc_debugfs_global_fini (sectio=
n: .exit.text)

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
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 1 warning, 0 section mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 124 warnings, 0 section mismatches

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
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

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
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    arch/arm/mach-s3c/s3c24xx.c:21:10: fatal error: linux/platform_data/dma=
-s3c24xx.h: No such file or directory

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/coredump.c:842:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]
    drivers/pwm/pwm-tegra.c:148:53: warning: result of =E2=80=981000000000 =
<< 8=E2=80=99 requires 39 bits to represent, but =E2=80=98long int=E2=80=99=
 only has 32 bits [-Wshift-overflow=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
