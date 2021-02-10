Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A4C3171B8
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 21:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhBJUxs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 15:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbhBJUxn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 15:53:43 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA721C061756
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 12:53:02 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id my11so3503783pjb.1
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 12:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f4LNIQGMKmwcfMD+j8UPA8S61UM5e7aVrNAHFYEBhak=;
        b=ojk4XfwfQgMpDVlKfy4k/PKtqO4An3XkyG3K86q+l2ZfsQjplfriZKMzQrdGjEGSi6
         Rtkz2IrcGoSqLhItaApvMJjQiFwvkBl18gQrFgWC/fZs4rkO6Oy5abHMPo6hAqqG6nf6
         HiZ8DgtFvkRAilhkLPBVZ+w2/cgIK1m8kIqmUd1ub40eHq8bTwvx3dce4ewpDbHoV6Ou
         PH6WiIY4JF9hLGXoD6WWPe8RXmwroiRZwDOXIfnwx6LzXQkCTAwO+eXG2TPd+9CteOHL
         s/goAMDzm0b7sAdwR3jYrbRKtPKlFJ8NO9X6jVAU9H8F2cOsTFKiwceCEaNUxB6F6cb8
         ReBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f4LNIQGMKmwcfMD+j8UPA8S61UM5e7aVrNAHFYEBhak=;
        b=DMukkphOsbMlMDf1tZ7xbGF3txmvc8kBv+KIrUQeXPDkF/n9N0ydLruAvEWPaJXruD
         hvht0ZqizIcyJSmF+0fxmZFTzMJHyergEmzFbNZLFgIMUjZ/usuSoAwFoZVnTxhDKGef
         t/keEpiWpadWH4KpqYpoXwYd8+Co1p9JxddzVMc5pZyd9UvPiKXy6L47curPdy/tMaVn
         BdkkXdkH1kcyTOg7+NZnXxCzHleFhluZXCDgsux3kWfVHrKuS2GMXy3WzQnQWqYCY+0r
         nYI4zAFAhHzaMTeBFQBDL0wZuDHKitURvZyDbqXg84BdrMPB+fu50j29tfnuTy1itvfr
         A6tw==
X-Gm-Message-State: AOAM53193D8H/qzbx729SmV0RHcDMNEqfgOzQm3Rxf0fx61MPtYNfPgG
        E23XX74B9KMqa/WVsr5CEHWkHTEphWwPmA==
X-Google-Smtp-Source: ABdhPJxfy0XE1yG04n9DTMrAOccFXRwb/W0CCvYDcpxphI8jcG3pDVmI0MKenVT6N+Pa9T+MvNRtxQ==
X-Received: by 2002:a17:90b:611:: with SMTP id gb17mr760119pjb.192.1612990379549;
        Wed, 10 Feb 2021 12:52:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 68sm3419162pfg.90.2021.02.10.12.52.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:52:58 -0800 (PST)
Message-ID: <602447aa.1c69fb81.c1c9d.78df@mx.google.com>
Date:   Wed, 10 Feb 2021 12:52:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20210210
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 231 builds: 30 failed, 201 passed, 85 errors,
 536 warnings (next-20210210)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 231 builds: 30 failed, 201 passed, 85 errors, 536 warnin=
gs (next-20210210)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210210/

Tree: next
Branch: master
Git Describe: next-20210210
Git Commit: 7bbfa63613ebb7e25cf89a3e760fadc9d2be2859
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    aspeed_g5_defconfig: (clang-10) FAIL
    cns3420vb_defconfig: (gcc-8) FAIL
    milbeaut_m10v_defconfig: (gcc-8) FAIL
    multi_v4t_defconfig: (gcc-8) FAIL
    omap2plus_defconfig: (gcc-8) FAIL
    s3c6400_defconfig: (gcc-8) FAIL
    stm32_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig: (gcc-8) FAIL
    bigsur_defconfig: (gcc-8) FAIL
    bmips_be_defconfig: (gcc-8) FAIL
    bmips_stb_defconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    e55_defconfig: (gcc-8) FAIL
    ip27_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL
    malta_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL
    maltaaprp_defconfig: (gcc-8) FAIL
    maltasmvp_defconfig: (gcc-8) FAIL
    maltasmvp_eva_defconfig: (gcc-8) FAIL
    maltaup_defconfig: (gcc-8) FAIL
    maltaup_xpa_defconfig: (gcc-8) FAIL
    nlm_xlp_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    pic32mzda_defconfig: (gcc-8) FAIL
    pistachio_defconfig: (gcc-8) FAIL
    rm200_defconfig: (gcc-8) FAIL
    sb1250_swarm_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-11): 29 warnings
    allmodconfig (gcc-8): 61 warnings
    allmodconfig (clang-10): 33 warnings
    defconfig (clang-11): 4 warnings
    defconfig (clang-10): 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 4 warnings

arm:
    allmodconfig (clang-11): 54 warnings
    allmodconfig (gcc-8): 61 warnings
    aspeed_g5_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (clang-10): 12 errors
    bcm2835_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 6 errors
    davinci_all_defconfig (gcc-8): 1 warning
    exynos_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 6 errors, 1 warning
    multi_v4t_defconfig (gcc-8): 6 errors, 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 3 errors, 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 6 errors
    shmobile_defconfig (gcc-8): 1 warning
    stm32_defconfig (gcc-8): 6 errors
    sunxi_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 6 errors

i386:
    allmodconfig (clang-11): 50 warnings
    allmodconfig (clang-10): 49 warnings

mips:
    32r2el_defconfig (gcc-8): 1 error
    bigsur_defconfig (gcc-8): 1 error
    bmips_be_defconfig (gcc-8): 1 error
    bmips_stb_defconfig (gcc-8): 1 error
    cavium_octeon_defconfig (gcc-8): 1 error
    ci20_defconfig (gcc-8): 1 warning
    cu1000-neo_defconfig (gcc-8): 1 warning
    cu1830-neo_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 6 errors
    gcw0_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 1 error
    loongson3_defconfig (gcc-8): 1 error
    malta_defconfig (gcc-8): 1 error
    malta_kvm_defconfig (gcc-8): 1 error
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaaprp_defconfig (gcc-8): 1 error
    maltasmvp_defconfig (gcc-8): 1 error
    maltasmvp_eva_defconfig (gcc-8): 1 error
    maltaup_defconfig (gcc-8): 1 error
    maltaup_xpa_defconfig (gcc-8): 1 error
    nlm_xlp_defconfig (gcc-8): 1 error
    nlm_xlr_defconfig (gcc-8): 1 error
    pic32mzda_defconfig (gcc-8): 6 errors
    pistachio_defconfig (gcc-8): 1 error
    qi_lb60_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 3 errors, 1 warning
    rs90_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 error
    xway_defconfig (gcc-8): 1 error

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (gcc-8): 65 warnings
    allmodconfig (clang-10): 32 warnings
    allmodconfig (clang-11): 37 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-11): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    19   ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =
=E2=80=98queued_spin_unlock=E2=80=99
    8    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=
=98io_connect=E2=80=99
    8    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=
=98io_accept=E2=80=99
    8    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=
=98io_recv=E2=80=99
    8    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=
=98io_recvmsg=E2=80=99
    8    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=
=98io_send=E2=80=99
    8    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=
=98io_sendmsg=E2=80=99
    2    ERROR: modpost: "udp_sock_create6" [net/rxrpc/rxrpc.ko] undefined!
    2    ERROR: modpost: "udp_sock_create4" [net/rxrpc/rxrpc.ko] undefined!
    2    ERROR: modpost: "setup_udp_tunnel_sock" [net/rxrpc/rxrpc.ko] undef=
ined!
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x377EC): reloca=
tion R_ARM_PREL31 out of range: 2135589196 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3774C): reloca=
tion R_ARM_PREL31 out of range: 2135589356 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3773C): reloca=
tion R_ARM_PREL31 out of range: 2135589372 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376EC): reloca=
tion R_ARM_PREL31 out of range: 2135589452 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376DC): reloca=
tion R_ARM_PREL31 out of range: 2135589468 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376C4): reloca=
tion R_ARM_PREL31 out of range: 2135589492 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376AC): reloca=
tion R_ARM_PREL31 out of range: 2135589516 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3767C): reloca=
tion R_ARM_PREL31 out of range: 2135589564 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3764C): reloca=
tion R_ARM_PREL31 out of range: 2135589612 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3760C): reloca=
tion R_ARM_PREL31 out of range: 2135589676 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375F4): reloca=
tion R_ARM_PREL31 out of range: 2135589700 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34FD8): reloca=
tion R_ARM_PREL31 out of range: 2135533920 is not in [-1073741824, 10737418=
23]

Warnings summary:

    59   1 warning generated.
    34   ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=
=E2=80=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4=
 has type =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm=
20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_translation' exported twice. Previous export was in drivers/media/i2c=
/rdacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_serial_link' exported twice. Previous export was in drivers/media/i2c=
/rdacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_high_threshold' exported twice. Previous export was in drivers/media/=
i2c/rdacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm=
20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_deserializer_address' exported twice. Previous export was in drivers/=
media/i2c/rdacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_set_address' exported twice. Previous export was in drivers/media/i2c/rda=
cm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rd=
acm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_disable_gpios' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_configure_i2c' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_configure_gmsl_link' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    9    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max927=
1_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rda=
cm20-camera_module.ko
    9    2 warnings generated.
    7    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: v=
ariable 'ret' is uninitialized when used here [-Wuninitialized]
    6    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: va=
riable 'stats' is uninitialized when used here [-Wuninitialized]
    6    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: init=
ialize the variable 'stats' to silence this warning
    6    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warnin=
g: variable 'mode' is used uninitialized whenever switch default is taken [=
-Wsometimes-uninitialized]
    6    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note:=
 initialize the variable 'mode' to silence this warning
    6    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: init=
ialize the variable 'ret' to silence this warning
    6    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is unin=
itialized when used here [-Wuninitialized]
    6    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'r=
et' to silence this warning
    6    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: v=
ariable 'structure_size' is used uninitialized whenever switch default is t=
aken [-Wsometimes-uninitialized]
    6    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: ini=
tialize the variable 'structure_size' to silence this warning
    4    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    3    ld.lld: warning: <internal>:(.eh_frame) is being placed in '.eh_fr=
ame'
    2    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    2    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    2    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:554:12: warning: s=
tack frame size of 1148 bytes in function 'mlx5e_hairpin_rss_init' [-Wframe=
-larger-than=3D]
    2    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 28=
32 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the fra=
me size of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame s=
ize of 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame s=
ize of 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame s=
ize of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame s=
ize of 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame s=
ize of 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame=
 size of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2=
720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    net/wireless/nl80211.c:7349:1: warning: the frame size of 2272 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:7349:1: warning: the frame size of 2256 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:7349:1: warning: the frame size of 2240 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5962:1: warning: the frame size of 2912 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5962:1: warning: the frame size of 2904 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:5962:1: warning: the frame size of 2872 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2787:1: warning: the frame size of 5360 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2787:1: warning: the frame size of 5296 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:2787:1: warning: the frame size of 5248 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1969:1: warning: the frame size of 2248 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1969:1: warning: the frame size of 2216 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/wireless/nl80211.c:1969:1: warning: the frame size of 2208 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/rose/rose_subr.o: warning: objtool: rose_write_internal() fall=
s through to next function rose_decode()
    1    net/ipv4/tcp.c:3893:1: warning: the frame size of 2056 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2256 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2224 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2216 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2624 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2592 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/caif/cfctrl.c:549:1: warning: the frame size of 2576 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:306:1: warning: the frame size of 2200 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:306:1: warning: the frame size of 2152 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:306:1: warning: the frame size of 2144 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2744 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2672 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:892:1: warning: the frame size of 2432 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:892:1: warning: the frame size of 2384 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:892:1: warning: the frame size of 2160 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:875:1: warning: the frame size of 2160 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:875:1: warning: the frame size of 2128 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf2: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call t=
o __ubsan_handle_add_overflow() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3=
ce: call to __ubsan_handle_add_overflow() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x1=
3c: call to do_strncpy_from_user() with UACCESS enabled
    1    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2=
384 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2=
112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/bitfield_kunit.c:93:1: warning: the frame size of 11216 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x114d: stack state mismatch: cfa1=3D7+184 cfa2=3D7+176
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2368 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2336 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2192 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1197:1: warning: the frame size of 3184 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1197:1: warning: the frame size of 3176 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/super.c:1197:1: warning: the frame size of 2688 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:2072:1: warning: the frame size of 2064 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2616 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2592 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2480 bytes is =
larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2112 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2072 =
bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2128 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2112 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2756:1: warning: t=
he frame size of 2504 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/media/atomisp/pci/atomisp_cmd.c:5600:5: warning: s=
tack frame size of 1068 bytes in function 'atomisp_set_fmt' [-Wframe-larger=
-than=3D]
    1    drivers/staging/media/atomisp/pci/atomisp_cmd.c:5600:5: warning: s=
tack frame size of 1048 bytes in function 'atomisp_set_fmt' [-Wframe-larger=
-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1756 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1752 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: wa=
rning: the frame size of 4240 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: wa=
rning: the frame size of 4224 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    1    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: wa=
rning: the frame size of 4216 bytes is larger than 2048 bytes [-Wframe-larg=
er-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2688 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the=
 frame size of 2464 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992=
:1: warning: the frame size of 2544 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992=
:1: warning: the frame size of 2480 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992=
:1: warning: the frame size of 2448 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3184 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3136 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894=
:1: warning: the frame size of 3128 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3256 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3168 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552=
:1: warning: the frame size of 3152 bytes is larger than 2048 bytes [-Wfram=
e-larger-than=3D]
    1    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the fr=
ame size of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the fr=
ame size of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2120 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2088 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2080 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/macsec.c:3252:1: warning: the frame size of 4176 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/macsec.c:3252:1: warning: the frame size of 4080 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/macsec.c:3252:1: warning: the frame size of 4040 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2400 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2368 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the fra=
me size of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:137:6: warni=
ng: stack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-l=
arger-than=3D]
    1    drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:554:12: warning: s=
tack frame size of 1208 bytes in function 'mlx5e_hairpin_rss_init' [-Wframe=
-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 28=
16 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the fra=
me size of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3992=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3968=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3952=
 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 4880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 2808 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame s=
ize of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame s=
ize of 5248 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame s=
ize of 5872 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2336 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame s=
ize of 2296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame s=
ize of 2136 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2576 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame s=
ize of 2544 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame s=
ize of 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3008 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame s=
ize of 3000 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame s=
ize of 5312 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame s=
ize of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame s=
ize of 3328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame=
 size of 2816 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame=
 size of 2768 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame=
 size of 2736 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame=
 size of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2=
768 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2152 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
i915_gem_execbuffer2_ioctl()+0x335: call to __ubsan_handle_negate_overflow(=
) with UACCESS enabled
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
i915_gem_execbuffer2_ioctl()+0x2c1: call to __ubsan_handle_negate_overflow(=
) with UACCESS enabled
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size o=
f 2064 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size o=
f 2056 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:979:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:979:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:963:13: warning: stack frame size of 1068 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:963:13: warning: stack frame size of 1036 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:811:13: warning: stack frame size of 1036 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1548 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1212 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1164 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1452 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1212 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1228 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5704 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3005:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    arch/x86/kvm/x86.c:5043:1: warning: the frame size of 2352 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:443:1: warning: the frame size of 3=
880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    :4643:9: note: initialize the variable 'ret' to silence this warni=
ng
    1    /tmp/test-arm-2e5f35.s:18792: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-2e5f35.s:18717: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccJmrPDX.s:18195: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccJmrPDX.s:18123: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1181:warning: override: UNWINDER_GUESS changes choice state
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 65 warnings, 0 secti=
on mismatches

Warnings:
    arch/x86/kernel/cpu/mshyperv.c:443:1: warning: the frame size of 3880 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    arch/x86/kvm/x86.c:5043:1: warning: the frame size of 2352 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2384 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:875:1: warning: the frame size of 2128 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:892:1: warning: the frame size of 2384 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/bitfield_kunit.c:93:1: warning: the frame size of 11216 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1969:1: warning: the frame size of 2216 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:7349:1: warning: the frame size of 2240 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2787:1: warning: the frame size of 5296 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5962:1: warning: the frame size of 2904 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size of 206=
4 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2720 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2832 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3952 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 20=
80 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the frame s=
ize of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:306:1: warning: the frame size of 2152 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3152 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3128 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2448 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2088 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4216 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4040 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2072 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame size o=
f 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame size o=
f 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame size o=
f 5320 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame size o=
f 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame size o=
f 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame size o=
f 2808 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2112 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame size=
 of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame size=
 of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2616 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1197:1: warning: the frame size of 3176 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2592 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2336 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2756:1: warning: the fr=
ame size of 2504 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 50 warnings, 0 sect=
ion mismatches

Warnings:
    ld.lld: warning: <internal>:(.eh_frame) is being placed in '.eh_frame'
    ld.lld: warning: <internal>:(.eh_frame) is being placed in '.eh_frame'
    ld.lld: warning: <internal>:(.eh_frame) is being placed in '.eh_frame'
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
752 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:5600:5: warning: stack =
frame size of 1048 bytes in function 'atomisp_set_fmt' [-Wframe-larger-than=
=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:979:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1228 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1212 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1452 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1212 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:963:13: warning: stack frame size of 1068 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:554:12: warning: stack =
frame size of 1148 bytes in function 'mlx5e_hairpin_rss_init' [-Wframe-larg=
er-than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 49 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
756 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/staging/media/atomisp/pci/atomisp_cmd.c:5600:5: warning: stack =
frame size of 1068 bytes in function 'atomisp_set_fmt' [-Wframe-larger-than=
=3D]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:554:12: warning: stack =
frame size of 1148 bytes in function 'mlx5e_hairpin_rss_init' [-Wframe-larg=
er-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:979:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:811:13: warning: stack frame size of 1036 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:963:13: warning: stack frame size of 1036 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1164 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1548 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 32 warnings, 0 se=
ction mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3ce: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call to __u=
bsan_handle_add_overflow() with UACCESS enabled
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_=
gem_execbuffer2_ioctl()+0x335: call to __ubsan_handle_negate_overflow() wit=
h UACCESS enabled
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 37 warnings, 0 se=
ction mismatches

Warnings:
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf2: call to do_s=
trnlen_user() with UACCESS enabled
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x13c: c=
all to do_strncpy_from_user() with UACCESS enabled
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
114d: stack state mismatch: cfa1=3D7+184 cfa2=3D7+176
    net/rose/rose_subr.o: warning: objtool: rose_write_internal() falls thr=
ough to next function rose_decode()
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_=
gem_execbuffer2_ioctl()+0x2c1: call to __ubsan_handle_negate_overflow() wit=
h UACCESS enabled
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    1 warning generated.
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 29 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 54 warnings, 0 secti=
on mismatches

Warnings:
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-2e5f35.s:18717: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-2e5f35.s:18792: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3005:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/net/ethernet/mellanox/mlx5/core/en_tc.c:554:12: warning: stack =
frame size of 1208 bytes in function 'mlx5e_hairpin_rss_init' [-Wframe-larg=
er-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:137:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 61 warnings, 0 section =
mismatches

Warnings:
    net/ipv4/tcp.c:3893:1: warning: the frame size of 2056 bytes is larger =
than 2048 bytes [-Wframe-larger-than=3D]
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]
    /tmp/ccJmrPDX.s:18123: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccJmrPDX.s:18195: Warning: using r15 results in unpredictable beha=
viour
    lib/test_kasan.c:892:1: warning: the frame size of 2160 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1969:1: warning: the frame size of 2248 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2787:1: warning: the frame size of 5248 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:7349:1: warning: the frame size of 2272 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5962:1: warning: the frame size of 2872 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2768 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2152 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size of 205=
6 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2744 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:306:1: warning: the frame size of 2200 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 21=
04 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2816 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3992 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3256 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3184 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2480 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2480 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    fs/ocfs2/super.c:1197:1: warning: the frame size of 2688 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2192 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4240 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2688 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3000 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame size o=
f 2136 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame size o=
f 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame size o=
f 5328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame size o=
f 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame size o=
f 4880 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame size o=
f 2544 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5872 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5248 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2576 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame size=
 of 2816 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame size=
 of 2768 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2216 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2120 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4080 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2400 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 61 warnings, 0 sectio=
n mismatches

Warnings:
    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2112 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1969:1: warning: the frame size of 2208 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:7349:1: warning: the frame size of 2256 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2787:1: warning: the frame size of 5360 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:875:1: warning: the frame size of 2160 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:892:1: warning: the frame size of 2432 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5962:1: warning: the frame size of 2912 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1663:1: warning: the frame size of 2672 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:306:1: warning: the frame size of 2144 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2720 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2624 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2256 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2112 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3968 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 21=
12 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2128 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:2072:1: warning: the frame size of 2064 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2592 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1197:1: warning: the frame size of 3184 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2832 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2368 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3168 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3136 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2544 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/usb/r8152.c:5524:1: warning: the frame size of 2080 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4176 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4224 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2464 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2368 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2336 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3008 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4568:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1940:1: warning: the frame size o=
f 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1583:1: warning: the frame size o=
f 5312 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2057:1: warning: the frame size o=
f 2576 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:2125:1: warning: the frame size o=
f 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1111:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1195:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:4253:1: warning: the frame size o=
f 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame size=
 of 2736 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame size=
 of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 33 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/media/i2c/imx334.c:793:55: warning: variable 'ret' is uninitial=
ized when used here [-Wuninitialized]
    drivers/media/i2c/imx334.c:783:9: note: initialize the variable 'ret' t=
o silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:764:2: warning: variab=
le 'structure_size' is used uninitialized whenever switch default is taken =
[-Wsometimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:753:25: note: initiali=
ze the variable 'structure_size' to silence this warning
    1 warning generated.
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: va=
riable 'mode' is used uninitialized whenever switch default is taken [-Wsom=
etimes-uninitialized]
    drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: init=
ialize the variable 'mode' to silence this warning
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:409:3: warning: variabl=
e 'stats' is uninitialized when used here [-Wuninitialized]
    drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:401:32: note: initializ=
e the variable 'stats' to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_serial_link' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_high_threshold' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_con=
figure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_cle=
ar_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ena=
ble_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20=
-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_dis=
able_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm2=
0-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_ver=
ify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-ca=
mera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-=
camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_deserializer_address' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
    WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set=
_translation' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/crypto/cast_common.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/clk/keystone/gate.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/clk/keystone/pll.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 12 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34FD8): relocation =
R_ARM_PREL31 out of range: 2135533920 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375F4): relocation =
R_ARM_PREL31 out of range: 2135589700 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3760C): relocation =
R_ARM_PREL31 out of range: 2135589676 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3764C): relocation =
R_ARM_PREL31 out of range: 2135589612 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3767C): relocation =
R_ARM_PREL31 out of range: 2135589564 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376AC): relocation =
R_ARM_PREL31 out of range: 2135589516 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376C4): relocation =
R_ARM_PREL31 out of range: 2135589492 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376DC): relocation =
R_ARM_PREL31 out of range: 2135589468 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x376EC): relocation =
R_ARM_PREL31 out of range: 2135589452 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3773C): relocation =
R_ARM_PREL31 out of range: 2135589372 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3774C): relocation =
R_ARM_PREL31 out of range: 2135589356 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x377EC): relocation =
R_ARM_PREL31 out of range: 2135589196 is not in [-1073741824, 1073741823]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    :4643:9: note: initialize the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4665:9: warning: variab=
le 'ret' is uninitialized when used here [-Wuninitialized]
    drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:4643:9: note: initializ=
e the variable 'ret' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc7-next-20210210/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-11) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-no-pie' [-Wunused=
-command-line-argument]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 section=
 mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

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
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0=
 section mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

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
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_gpiod_=
table=E2=80=99 defined but not used [-Wunused-variable]
    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98ams_del=
ta_camera_power=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "udp_sock_create6" [net/rxrpc/rxrpc.ko] undefined!
    ERROR: modpost: "setup_udp_tunnel_sock" [net/rxrpc/rxrpc.ko] undefined!
    ERROR: modpost: "udp_sock_create4" [net/rxrpc/rxrpc.ko] undefined!

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "udp_sock_create6" [net/rxrpc/rxrpc.ko] undefined!
    ERROR: modpost: "setup_udp_tunnel_sock" [net/rxrpc/rxrpc.ko] undefined!
    ERROR: modpost: "udp_sock_create4" [net/rxrpc/rxrpc.ko] undefined!

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1181:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:5:18: warning: format =E2=80=98%zu=E2=80=
=99 expects argument of type =E2=80=98size_t=E2=80=99, but argument 4 has t=
ype =E2=80=98long unsigned int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    fs/io_uring.c:6329:9: error: too few arguments to function =E2=80=98io_=
sendmsg=E2=80=99
    fs/io_uring.c:6332:9: error: too few arguments to function =E2=80=98io_=
send=E2=80=99
    fs/io_uring.c:6335:9: error: too few arguments to function =E2=80=98io_=
recvmsg=E2=80=99
    fs/io_uring.c:6338:9: error: too few arguments to function =E2=80=98io_=
recv=E2=80=99
    fs/io_uring.c:6347:9: error: too few arguments to function =E2=80=98io_=
accept=E2=80=99
    fs/io_uring.c:6350:9: error: too few arguments to function =E2=80=98io_=
connect=E2=80=99

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    ./arch/mips/include/asm/spinlock.h:17:28: error: redefinition of =E2=80=
=98queued_spin_unlock=E2=80=99

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
