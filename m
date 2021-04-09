Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB4A35A7C8
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 22:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhDIUXs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 16:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhDIUXr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 16:23:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD03C061762
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 13:23:34 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso3786433pje.0
        for <linux-next@vger.kernel.org>; Fri, 09 Apr 2021 13:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RGEiaBxK//AVSgFWnGW05DHtdlFfZkCCacbGFgyM1hQ=;
        b=Yli5IHIntquTFO/ahgCtyP0UqystXAXd+ilM5c7ikcMjzZtrg2BipASyXfAM/wRC27
         Ax/euwerTe/lPMZBfxlsQksmk0WSXZRpha1Ovzscfw5rJmJfzpCqByCOF9HaHyuOIFrL
         qAteCgrX1xEenLsxl5X8okg1VBHJUeJp+TknK1UcFwMmh+YguZ5Alnr8Mx8w/3gIok+X
         ZciKPQc4HPGFXR15BqeSh5dqm64Ic92PVRDDtuCWv3OlFqBt/w/iYwI0gfwmcF3uS/zb
         z+S4olAB00EZYs3SjpOC/3EmhSIWGcWSF1OhNkEEqz2984nDOoN5JrPQMTxdbWpqEhE/
         yyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RGEiaBxK//AVSgFWnGW05DHtdlFfZkCCacbGFgyM1hQ=;
        b=O8cKNzoQx9ABe91FKnoR7dpwlYEv8w+3PSa/e4u/xAqwyuyRxD83plne93++y9qMqs
         /pif2Fj/hOJwuUkbtdq2gNRkbzf4dL4rQBe3GLolyFND242/pcE/O+BcGu+Ure8Eo3Uj
         IAeRkCi+oOc7KCRtYVZp2YzDWj0FMjKkATugF/N/DLCgyfEEN5VKIUmXp12xXk4NruiS
         7i6JtUF5h+tYAzLnt4jMFTRo+2EhkrrZOkrmRnY/BaFrNWLJ0EP0DsGWtsMj57zl/Rts
         ln+a1/Mq11bZvyl4LyutpXUGaCrgEkKYknWkQq8HYq4WVMGqTrqTL+WJvC9ffxe4phpw
         tLTQ==
X-Gm-Message-State: AOAM533g64OqWCvtXpYI5lYOKTHo8i9/tvokBPBKbdQtejgo96osU2yJ
        5tT5yci3wt0U92VjCQwPwcSYLiVEs5N4c4DS
X-Google-Smtp-Source: ABdhPJwQ6NtiYerR3AH8N5MMoxEUtXQ67FKn60bD51re8nHUkPjko4ExGoK2aRjrHWQe9BJSrgT0Hg==
X-Received: by 2002:a17:90a:7566:: with SMTP id q93mr1434173pjk.103.1617999811525;
        Fri, 09 Apr 2021 13:23:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g3sm2850610pfk.186.2021.04.09.13.23.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 13:23:31 -0700 (PDT)
Message-ID: <6070b7c3.1c69fb81.25147.7e17@mx.google.com>
Date:   Fri, 09 Apr 2021 13:23:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20210409
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 232 builds: 8 failed, 224 passed, 717 errors,
 219 warnings (next-20210409)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 232 builds: 8 failed, 224 passed, 717 errors, 219 warnin=
gs (next-20210409)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210409/

Tree: next
Branch: master
Git Describe: next-20210409
Git Commit: e99d8a8495175df8cb8b739f8cf9b0fc9d0cd3b5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    allmodconfig: (gcc-8) FAIL

mips:
    allnoconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-11): 10 warnings
    allmodconfig (gcc-8): 1 warning
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-10): 2 warnings
    allnoconfig (clang-11): 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-10): 2 warnings
    defconfig (clang-11): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 2 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 1 error, 1 warning
    allmodconfig (clang-10): 1 error, 32 warnings
    allmodconfig (clang-11): 1 error, 30 warnings
    aspeed_g5_defconfig (clang-10): 11 errors
    axm55xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-10): 3 warnings
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-11): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 2 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning

i386:
    allmodconfig (clang-10): 23 warnings
    allmodconfig (clang-11): 25 warnings

mips:
    allnoconfig (gcc-8): 1 error
    cavium_octeon_defconfig (gcc-8): 702 errors, 1 warning
    loongson2k_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaaprp_defconfig (gcc-8): 1 warning
    rb532_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 3 warnings

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    nommu_k210_defconfig (gcc-8): 1 warning
    nommu_k210_sdcard_defconfig (gcc-8): 1 warning
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (clang-10): 10 warnings
    allmodconfig (clang-11): 15 warnings
    allmodconfig (gcc-8): 1 warning
    allnoconfig (clang-10): 2 warnings
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-11): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings
    x86_64_defconfig (clang-11): 2 warnings

Errors summary:

    191  /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined re=
ference to `__raw_copy_from_user'
    184  /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined re=
ference to `__raw_copy_to_user'
    166  mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.=
h:460: undefined reference to `__raw_copy_from_user'
    132  mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.=
h:486: undefined reference to `__raw_copy_to_user'
    4    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.=
h:510: undefined reference to `__raw_copy_in_user'
    3    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iomm=
u_v1.ko] undefined!
    2    mips-linux-gnu-ld: net/ethtool/ioctl.o:/tmp/kci/linux/./arch/mips/=
include/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user=
' follow
    2    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510: undefined re=
ference to `__raw_copy_in_user'
    1    mips-linux-gnu-ld: net/socket.o:/tmp/kci/linux/./arch/mips/include=
/asm/uaccess.h:510: more undefined references to `__raw_copy_in_user' follow
    1    mips-linux-gnu-ld: net/packet/af_packet.o:/tmp/kci/linux/./arch/mi=
ps/include/asm/uaccess.h:460: more undefined references to `__raw_copy_from=
_user' follow
    1    mips-linux-gnu-ld: net/ipv6/ipv6_sockglue.o:/tmp/kci/linux/./arch/=
mips/include/asm/uaccess.h:460: more undefined references to `__raw_copy_fr=
om_user' follow
    1    mips-linux-gnu-ld: net/ipv6/addrconf.o:/tmp/kci/linux/./arch/mips/=
include/asm/uaccess.h:460: more undefined references to `__raw_copy_from_us=
er' follow
    1    mips-linux-gnu-ld: net/ipv4/ip_sockglue.o:/tmp/kci/linux/./arch/mi=
ps/include/asm/uaccess.h:460: more undefined references to `__raw_copy_from=
_user' follow
    1    mips-linux-gnu-ld: net/ethtool/ioctl.o:/tmp/kci/linux/./arch/mips/=
include/asm/uaccess.h:460: more undefined references to `__raw_copy_from_us=
er' follow
    1    mips-linux-gnu-ld: net/core/sock.o:/tmp/kci/linux/./arch/mips/incl=
ude/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' =
follow
    1    mips-linux-gnu-ld: net/core/scm.o:/tmp/kci/linux/./arch/mips/inclu=
de/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' fol=
low
    1    mips-linux-gnu-ld: mm/memory.o:/tmp/kci/linux/./arch/mips/include/=
asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' foll=
ow
    1    mips-linux-gnu-ld: lib/kstrtox.o:/tmp/kci/linux/./arch/mips/includ=
e/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' fo=
llow
    1    mips-linux-gnu-ld: kernel/time/time.o:/tmp/kci/linux/./arch/mips/i=
nclude/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user'=
 follow
    1    mips-linux-gnu-ld: kernel/sys.o:/tmp/kci/linux/./arch/mips/include=
/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    1    mips-linux-gnu-ld: fs/statfs.o:/tmp/kci/linux/./arch/mips/include/=
asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    1    mips-linux-gnu-ld: fs/readdir.o:/tmp/kci/linux/./arch/mips/include=
/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    1    mips-linux-gnu-ld: fs/io_uring.o:/tmp/kci/linux/./arch/mips/includ=
e/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' fo=
llow
    1    mips-linux-gnu-ld: fs/fat/dir.o:/tmp/kci/linux/./arch/mips/include=
/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    1    mips-linux-gnu-ld: fs/ext4/ioctl.o:/tmp/kci/linux/./arch/mips/incl=
ude/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' fo=
llow
    1    mips-linux-gnu-ld: drivers/usb/core/devio.o:/tmp/kci/linux/./arch/=
mips/include/asm/uaccess.h:460: more undefined references to `__raw_copy_fr=
om_user' follow
    1    mips-linux-gnu-ld: drivers/mtd/mtdchar.o:/tmp/kci/linux/./arch/mip=
s/include/asm/uaccess.h:486: more undefined references to `__raw_copy_to_us=
er' follow
    1    mips-linux-gnu-ld: drivers/gpio/gpiolib-cdev.o:/tmp/kci/linux/./ar=
ch/mips/include/asm/uaccess.h:486: more undefined references to `__raw_copy=
_to_user' follow
    1    mips-linux-gnu-ld: block/ioctl.o:/tmp/kci/linux/./arch/mips/includ=
e/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' fo=
llow
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BF4): reloca=
tion R_ARM_PREL31 out of range: 2135575876 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B4C): reloca=
tion R_ARM_PREL31 out of range: 2135576044 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B3C): reloca=
tion R_ARM_PREL31 out of range: 2135576060 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AEC): reloca=
tion R_ARM_PREL31 out of range: 2135576140 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37ADC): reloca=
tion R_ARM_PREL31 out of range: 2135576156 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AC4): reloca=
tion R_ARM_PREL31 out of range: 2135576180 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AAC): reloca=
tion R_ARM_PREL31 out of range: 2135576204 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A7C): reloca=
tion R_ARM_PREL31 out of range: 2135576252 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A4C): reloca=
tion R_ARM_PREL31 out of range: 2135576300 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A04): reloca=
tion R_ARM_PREL31 out of range: 2135576372 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x353D8): reloca=
tion R_ARM_PREL31 out of range: 2135520608 is not in [-1073741824, 10737418=
23]
    1    ERROR: modpost: Section mismatches detected.

Warnings summary:

    59   1 warning generated.
    16   kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=
=E2=80=99 defined but not used [-Wunused-function]
    11   2 warnings generated.
    8    arch/arm64/configs/defconfig:1017:warning: override: reassigning t=
o symbol MTK_PMIC_WRAP
    7    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.=
c:3015:53: warning: address of 'aconnector->mst_port->mst_mgr' will always =
evaluate to 'true' [-Wpointer-bool-conversion]
    7    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (s=
pi_bus_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error,=
 expected "1"
    5    drivers/platform/surface/surface_aggregator_registry.c:478:25: war=
ning: implicit conversion from 'int' to '__u8' (aka 'unsigned char') change=
s value from 65535 to 255 [-Wconstant-conversion]
    5    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit co=
nversion from 'int' to '__u8' (aka 'unsigned char') changes value from 6553=
5 to 255 [-Wconstant-conversion]
    5    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13=
: warning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    4    sound/core/control_led.c:97:12: warning: stack frame size of 1032 =
bytes in function 'snd_ctl_led_get' [-Wframe-larger-than=3D]
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/mod=
ules/5.12.0-rc6-next-20210409/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    #warning This code requires at least version 4.6 of GCC
    3    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13=
: warning: =E2=80=98dm_dmub_trace_high_irq=E2=80=99 defined but not used [-=
Wunused-function]
    2    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1304 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    2    kernel/static_call.c:153:18: warning: unused variable =E2=80=98mod=
=E2=80=99 [-Wunused-variable]
    2    kernel/static_call.c:153:18: warning: unused variable 'mod' [-Wunu=
sed-variable]
    2    kernel/sched/fair.c:8398:13: warning: unused function 'update_nohz=
_stats' [-Wunused-function]
    2    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    2    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    2    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    2    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5536 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    warning: static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParameter=
sWatermarksAndPerformanceCalculation(
    1    sound/core/control_led.c:128:1: warning: the frame size of 1504 by=
tes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    net/rose/rose_subr.o: warning: objtool: rose_write_internal() fall=
s through to next function rose_decode()
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1252 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1248 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x114d: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    1    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame si=
ze of 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/pci/vpd.c:289:13: warning: =E2=80=98pci_vpd_set_size=E2=80=
=99 defined but not used [-Wunused-function]
    1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1068 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1548 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1148 bytes in function 'DISPCL=
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
a_20.c:1085:13:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_m=
ode_vba_21.c:1463:13: warning: stack frame size of 1196 bytes in function '=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    arch/arm/boot/dts/ep7209.dtsi:187.17-192.4: Warning (interrupts_pr=
operty): /keypad: Missing interrupt-parent
    1    .config:1198:warning: override: UNWINDER_GUESS changes choice state
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width o=
f type [-Wshift-count-overflow]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x9edc): Section mismatch in ref=
erence from the function reserve_exception_space() to the function .meminit=
.text:memblock_reserve()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.=
ko] undefined!

Warnings:
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: =E2=80=98dm_dmub_trace_high_irq=E2=80=99 defined but not used [-Wunus=
ed-function]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 23 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1248 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1148 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1548 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 10 warnings, 0 se=
ction mismatches

Warnings:
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
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
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
114d: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    net/rose/rose_subr.o: warning: objtool: rose_write_internal() falls thr=
ough to next function rose_decode()
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 32 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.=
ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1304 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/core/control_led.c:97:12: warning: stack frame size of 1032 bytes=
 in function 'snd_ctl_led_get' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame size of=
 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: =E2=80=98dm_dmub_trace_high_irq=E2=80=99 defined but not used [-Wunus=
ed-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 FAIL, 1 error, 30 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.=
ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1304 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/core/control_led.c:97:12: warning: stack frame size of 1032 bytes=
 in function 'snd_ctl_led_get' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: unused function 'dm_dmub_trace_high_irq' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 25 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1252 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_v=
ba_21.c:1463:13: warning: stack frame size of 1196 bytes in function 'DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    warning: static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWate=
rmarksAndPerformanceCalculation(
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1212 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1452 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1068 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:941:13: war=
ning: =E2=80=98dm_dmub_trace_high_irq=E2=80=99 defined but not used [-Wunus=
ed-function]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/static_call.c:153:18: warning: unused variable 'mod' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: unused function 'update_nohz_stat=
s' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/static_call.c:153:18: warning: unused variable =E2=80=98mod=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: unused function 'update_nohz_stat=
s' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/static_call.c:153:18: warning: unused variable 'mod' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x9edc): Section mismatch in referenc=
e from the function reserve_exception_space() to the function .meminit.text=
:memblock_reserve()

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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 11 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x353D8): relocation =
R_ARM_PREL31 out of range: 2135520608 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A04): relocation =
R_ARM_PREL31 out of range: 2135576372 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A4C): relocation =
R_ARM_PREL31 out of range: 2135576300 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37A7C): relocation =
R_ARM_PREL31 out of range: 2135576252 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AAC): relocation =
R_ARM_PREL31 out of range: 2135576204 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AC4): relocation =
R_ARM_PREL31 out of range: 2135576180 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37ADC): relocation =
R_ARM_PREL31 out of range: 2135576156 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AEC): relocation =
R_ARM_PREL31 out of range: 2135576140 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B3C): relocation =
R_ARM_PREL31 out of range: 2135576060 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B4C): relocation =
R_ARM_PREL31 out of range: 2135576044 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BF4): relocation =
R_ARM_PREL31 out of range: 2135575876 is not in [-1073741824, 1073741823]

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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 702 errors, 1 warning=
, 0 section mismatches

Errors:
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: kernel/sys.o:/tmp/kci/linux/./arch/mips/include/asm/=
uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: kernel/time/time.o:/tmp/kci/linux/./arch/mips/includ=
e/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' foll=
ow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: mm/memory.o:/tmp/kci/linux/./arch/mips/include/asm/u=
access.h:460: more undefined references to `__raw_copy_from_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: fs/readdir.o:/tmp/kci/linux/./arch/mips/include/asm/=
uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: fs/statfs.o:/tmp/kci/linux/./arch/mips/include/asm/u=
access.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: fs/io_uring.o:/tmp/kci/linux/./arch/mips/include/asm=
/uaccess.h:460: more undefined references to `__raw_copy_from_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: fs/ext4/ioctl.o:/tmp/kci/linux/./arch/mips/include/a=
sm/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: fs/fat/dir.o:/tmp/kci/linux/./arch/mips/include/asm/=
uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: block/ioctl.o:/tmp/kci/linux/./arch/mips/include/asm=
/uaccess.h:460: more undefined references to `__raw_copy_from_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: lib/kstrtox.o:/tmp/kci/linux/./arch/mips/include/asm=
/uaccess.h:460: more undefined references to `__raw_copy_from_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: drivers/gpio/gpiolib-cdev.o:/tmp/kci/linux/./arch/mi=
ps/include/asm/uaccess.h:486: more undefined references to `__raw_copy_to_u=
ser' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: drivers/mtd/mtdchar.o:/tmp/kci/linux/./arch/mips/inc=
lude/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' f=
ollow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: drivers/usb/core/devio.o:/tmp/kci/linux/./arch/mips/=
include/asm/uaccess.h:460: more undefined references to `__raw_copy_from_us=
er' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510: undefined referen=
ce to `__raw_copy_in_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510: undefined referen=
ce to `__raw_copy_in_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510=
: undefined reference to `__raw_copy_in_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510=
: undefined reference to `__raw_copy_in_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510=
: undefined reference to `__raw_copy_in_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:510=
: undefined reference to `__raw_copy_in_user'
    mips-linux-gnu-ld: net/socket.o:/tmp/kci/linux/./arch/mips/include/asm/=
uaccess.h:510: more undefined references to `__raw_copy_in_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/core/sock.o:/tmp/kci/linux/./arch/mips/include/a=
sm/uaccess.h:460: more undefined references to `__raw_copy_from_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: net/core/scm.o:/tmp/kci/linux/./arch/mips/include/as=
m/uaccess.h:486: more undefined references to `__raw_copy_to_user' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: net/ethtool/ioctl.o:/tmp/kci/linux/./arch/mips/inclu=
de/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' fol=
low
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/ethtool/ioctl.o:/tmp/kci/linux/./arch/mips/inclu=
de/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' f=
ollow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: net/ethtool/ioctl.o:/tmp/kci/linux/./arch/mips/inclu=
de/asm/uaccess.h:486: more undefined references to `__raw_copy_to_user' fol=
low
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/ipv4/ip_sockglue.o:/tmp/kci/linux/./arch/mips/in=
clude/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user=
' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/ipv6/addrconf.o:/tmp/kci/linux/./arch/mips/inclu=
de/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user' f=
ollow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/ipv6/ipv6_sockglue.o:/tmp/kci/linux/./arch/mips/=
include/asm/uaccess.h:460: more undefined references to `__raw_copy_from_us=
er' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486=
: undefined reference to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460=
: undefined reference to `__raw_copy_from_user'
    mips-linux-gnu-ld: net/packet/af_packet.o:/tmp/kci/linux/./arch/mips/in=
clude/asm/uaccess.h:460: more undefined references to `__raw_copy_from_user=
' follow
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:460: undefined referen=
ce to `__raw_copy_from_user'
    /tmp/kci/linux/./arch/mips/include/asm/uaccess.h:486: undefined referen=
ce to `__raw_copy_to_user'

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings,=
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc6-next-20210409/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc6-next-20210409/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc6-next-20210409/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc6-next-20210409/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP

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
, 1 warning, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1017:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
i386_defconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
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
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    sound/core/control_led.c:128:1: warning: the frame size of 1504 bytes i=
s larger than 1024 bytes [-Wframe-larger-than=3D]

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
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    arch/arm/boot/dts/ep7209.dtsi:187.17-192.4: Warning (interrupts_propert=
y): /keypad: Missing interrupt-parent

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    sound/core/control_led.c:97:12: warning: stack frame size of 1032 bytes=
 in function 'snd_ctl_led_get' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    sound/core/control_led.c:97:12: warning: stack frame size of 1032 bytes=
 in function 'snd_ctl_led_get' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

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
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bu=
s_reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expe=
cted "1"

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
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/pci/vpd.c:289:13: warning: =E2=80=98pci_vpd_set_size=E2=80=99 d=
efined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    .config:1198:warning: override: UNWINDER_GUESS changes choice state
    kernel/static_call.c:153:18: warning: unused variable =E2=80=98mod=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xc6: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x249: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xb8: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/sched/fair.c:8398:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]
    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
