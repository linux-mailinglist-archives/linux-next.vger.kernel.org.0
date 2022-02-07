Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F484AB588
	for <lists+linux-next@lfdr.de>; Mon,  7 Feb 2022 08:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiBGHG4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Feb 2022 02:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbiBGGwR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Feb 2022 01:52:17 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF2BC043181
        for <linux-next@vger.kernel.org>; Sun,  6 Feb 2022 22:52:14 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so12478788pjb.1
        for <linux-next@vger.kernel.org>; Sun, 06 Feb 2022 22:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5RPUGT2RB+mbxB/RF1lEJ230DFyITlpB1KqAvvO0cR4=;
        b=O/OZnU2660DcbaiSdsVqNnhMFkmyfPSy/cPyoQkgSoZetMNXleEWZgUcwHp6xBOarr
         G9bA255ImQ3sOc9a4XR3wfAHqx90kPG+ZEm84fHjFIEJvX0WOvuwoxHbIM6VvnwwigAg
         +isQT8vJlS/4d5VqpGxLH0YQrJP6nKhL5PISXMz42rGYWqXvOuhcj3SZorz5kmJ0sgmO
         PQOt+GKMCGGyj78i9kC4M+1qmEwmTcqcONQun4LYNSLc4WHuXHv0AlKsDUIVoC0WovaN
         BFtCnYnWIdtNJVr0d0GU2r1ZWYuNJ4e74om+rnd6YisYw5z2XTDMR4rpaBcfNVFpXcv/
         gQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5RPUGT2RB+mbxB/RF1lEJ230DFyITlpB1KqAvvO0cR4=;
        b=2qdROO8lV/XxbMLsOVLMKdg7VgMWUBKLowCIISU6v4p/lcF8LRMiPa6j84FfwPbHb+
         VkTBAk5QgjRA+a/FnnGcs90a7PjMYtPUoyq4sft5xE4sG2dCNL9TOqJGpZ5wjjSlM4qT
         aUbH8m6DfbzHTzheXeUbhA59ax1FhSmutEt3Kl2WrK2HB3HsAvNmEygG5qnGPu7mhSKN
         hsjJ4+BXVtzTwk5yNTsL47HxsRbj4HZgcc9uH0CubvRRmsHOGUhqS//OAAutFR7WWoPz
         tGTgMtK5iiRI0nYXy2fFksNilf8QN1DeLSwj55KYSxNAlbN2rA1ntSv6xHBRVit4sQYg
         Djuw==
X-Gm-Message-State: AOAM533ihOZTVlZvmY9634Pn+NtzMEcvF3z0yPMe75qVp+T9Y/5X/ODS
        MpCOnJsE36EshH3YHma5falkElarzjS7NHre
X-Google-Smtp-Source: ABdhPJzDgyMyVxSOZKJSpQeJIswy4kzhImHsMEQiwWq1fSXNT22WP/oTzPpiie9zd/uE9QlW2BqTMA==
X-Received: by 2002:a17:90b:4a8d:: with SMTP id lp13mr12299634pjb.206.1644216732020;
        Sun, 06 Feb 2022 22:52:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l21sm10699318pfu.120.2022.02.06.22.52.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 22:52:11 -0800 (PST)
Message-ID: <6200c19b.1c69fb81.bd18b.b9a2@mx.google.com>
Date:   Sun, 06 Feb 2022 22:52:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220207
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 206 builds: 20 failed, 186 passed, 23 errors,
 1053 warnings (next-20220207)
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

next/master build: 206 builds: 20 failed, 186 passed, 23 errors, 1053 warni=
ngs (next-20220207)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220207/

Tree: next
Branch: master
Git Describe: next-20220207
Git Commit: b3c0a155ef77550d48f6eb7c6fdd6075764a5622
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    lpc32xx_defconfig: (gcc-10) FAIL
    omap2plus_defconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    realview_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    sama5_defconfig: (gcc-10) FAIL
    shmobile_defconfig: (gcc-10) FAIL
    sunxi_defconfig: (gcc-10) FAIL
    versatile_defconfig: (gcc-10) FAIL
    vexpress_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    axs103_defconfig (gcc-10): 1 warning
    haps_hs_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 warning
    hsdk_defconfig (gcc-10): 6 warnings
    nsimosci_hs_defconfig (gcc-10): 1 warning
    nsimosci_hs_smp_defconfig (gcc-10): 1 warning
    vdk_hs38_defconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-14): 1 error, 1 warning
    defconfig (gcc-10): 17 warnings
    defconfig (clang-14): 37 warnings
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 17 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 17 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-14): 37 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 17 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 17 warnings
    defconfig+arm64-chromebook (gcc-10): 17 warnings
    defconfig+crypto (gcc-10): 17 warnings
    defconfig+debug (gcc-10): 17 warnings
    defconfig+ima (gcc-10): 17 warnings
    defconfig+kselftest (gcc-10): 17 warnings

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-14): 2 errors, 13 warnings
    am200epdkit_defconfig (gcc-10): 5 warnings
    aspeed_g4_defconfig (gcc-10): 5 warnings
    aspeed_g5_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-14): 47 warnings
    assabet_defconfig (gcc-10): 5 warnings
    at91_dt_defconfig (gcc-10): 5 warnings
    axm55xx_defconfig (gcc-10): 5 warnings
    badge4_defconfig (gcc-10): 5 warnings
    bcm2835_defconfig (gcc-10): 6 warnings
    cerfcube_defconfig (gcc-10): 5 warnings
    cm_x300_defconfig (gcc-10): 5 warnings
    colibri_pxa270_defconfig (gcc-10): 5 warnings
    colibri_pxa300_defconfig (gcc-10): 5 warnings
    collie_defconfig (gcc-10): 5 warnings
    corgi_defconfig (gcc-10): 5 warnings
    davinci_all_defconfig (gcc-10): 1 warning
    dove_defconfig (gcc-10): 9 warnings
    ep93xx_defconfig (gcc-10): 5 warnings
    eseries_pxa_defconfig (gcc-10): 5 warnings
    ezx_defconfig (gcc-10): 5 warnings
    footbridge_defconfig (gcc-10): 5 warnings
    gemini_defconfig (gcc-10): 6 warnings
    h3600_defconfig (gcc-10): 5 warnings
    h5000_defconfig (gcc-10): 4 warnings
    hackkit_defconfig (gcc-10): 5 warnings
    hisi_defconfig (gcc-10): 5 warnings
    imote2_defconfig (gcc-10): 5 warnings
    imx_v4_v5_defconfig (gcc-10): 4 warnings
    imx_v6_v7_defconfig (gcc-10): 6 warnings
    integrator_defconfig (gcc-10): 1 warning
    iop32x_defconfig (gcc-10): 5 warnings
    ixp4xx_defconfig (gcc-10): 5 warnings
    jornada720_defconfig (gcc-10): 5 warnings
    keystone_defconfig (gcc-10): 6 warnings
    lart_defconfig (gcc-10): 5 warnings
    lpc32xx_defconfig (gcc-10): 1 error, 5 warnings
    lpd270_defconfig (gcc-10): 5 warnings
    magician_defconfig (gcc-10): 5 warnings
    mainstone_defconfig (gcc-10): 5 warnings
    milbeaut_m10v_defconfig (gcc-10): 1 warning
    mini2440_defconfig (gcc-10): 10 warnings
    moxart_defconfig (gcc-10): 5 warnings
    multi_v4t_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (gcc-10): 14 warnings
    multi_v7_defconfig (clang-14): 44 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 14 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 14 warn=
ings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 16 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 14 warnings
    multi_v7_defconfig+debug (gcc-10): 14 warnings
    mvebu_v5_defconfig (gcc-10): 10 warnings
    mvebu_v7_defconfig (gcc-10): 11 warnings
    mxs_defconfig (gcc-10): 5 warnings
    netwinder_defconfig (gcc-10): 5 warnings
    nhk8815_defconfig (gcc-10): 1 warning
    omap1_defconfig (gcc-10): 5 warnings
    omap2plus_defconfig (gcc-10): 1 error, 8 warnings
    orion5x_defconfig (gcc-10): 5 warnings
    oxnas_v6_defconfig (gcc-10): 1 warning
    palmz72_defconfig (gcc-10): 5 warnings
    pcm027_defconfig (gcc-10): 5 warnings
    pleb_defconfig (gcc-10): 5 warnings
    pxa168_defconfig (gcc-10): 5 warnings
    pxa255-idp_defconfig (gcc-10): 5 warnings
    pxa3xx_defconfig (gcc-10): 5 warnings
    pxa910_defconfig (gcc-10): 5 warnings
    pxa_defconfig (gcc-10): 9 warnings
    qcom_defconfig (gcc-10): 1 error, 6 warnings
    realview_defconfig (gcc-10): 1 error, 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s3c6400_defconfig (gcc-10): 5 warnings
    s5pv210_defconfig (gcc-10): 5 warnings
    sama5_defconfig (gcc-10): 1 error, 5 warnings
    sama7_defconfig (gcc-10): 1 warning
    shannon_defconfig (gcc-10): 5 warnings
    shmobile_defconfig (gcc-10): 1 error, 6 warnings
    simpad_defconfig (gcc-10): 5 warnings
    socfpga_defconfig (gcc-10): 5 warnings
    spear13xx_defconfig (gcc-10): 5 warnings
    spear3xx_defconfig (gcc-10): 5 warnings
    spear6xx_defconfig (gcc-10): 5 warnings
    spitz_defconfig (gcc-10): 5 warnings
    sunxi_defconfig (gcc-10): 1 error, 6 warnings
    tct_hammer_defconfig (gcc-10): 5 warnings
    tegra_defconfig (gcc-10): 8 warnings
    trizeps4_defconfig (gcc-10): 5 warnings
    u8500_defconfig (gcc-10): 6 warnings
    versatile_defconfig (gcc-10): 1 error, 1 warning
    vexpress_defconfig (gcc-10): 1 error, 1 warning
    viper_defconfig (gcc-10): 5 warnings
    vt8500_v6_v7_defconfig (gcc-10): 5 warnings
    zeus_defconfig (gcc-10): 5 warnings

i386:
    allmodconfig (clang-14): 1 error, 1 warning
    allnoconfig (gcc-10): 1 warning
    allnoconfig (clang-14): 5 warnings
    i386_defconfig (gcc-10): 6 warnings
    i386_defconfig (clang-14): 15 warnings
    i386_defconfig+debug (gcc-10): 6 warnings
    i386_defconfig+kselftest (gcc-10): 6 warnings

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 2 warnings
    bcm47xx_defconfig (gcc-10): 1 warning
    bcm63xx_defconfig (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 warning
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 1 warning
    capcella_defconfig (gcc-10): 1 warning
    ci20_defconfig (gcc-10): 1 warning
    cobalt_defconfig (gcc-10): 1 warning
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_defconfig (gcc-10): 1 warning
    decstation_r4k_defconfig (gcc-10): 1 warning
    e55_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error, 1 warning
    gcw0_defconfig (gcc-10): 7 warnings
    ip22_defconfig (gcc-10): 5 warnings
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 1 warning
    jmr3927_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error, 5 warnings
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson2k_defconfig (gcc-10): 1 warning
    loongson3_defconfig (gcc-10): 2 errors, 1 warning
    malta_defconfig (gcc-10): 1 warning
    malta_kvm_defconfig (gcc-10): 1 warning
    malta_qemu_32r6_defconfig (gcc-10): 1 warning
    maltaaprp_defconfig (gcc-10): 1 warning
    maltasmvp_defconfig (gcc-10): 1 warning
    maltasmvp_eva_defconfig (gcc-10): 1 warning
    maltaup_defconfig (gcc-10): 1 warning
    mpc30x_defconfig (gcc-10): 1 warning
    mtx1_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 1 warning
    rb532_defconfig (gcc-10): 1 warning
    rbtx49xx_defconfig (gcc-10): 1 warning
    rm200_defconfig (gcc-10): 1 warning
    rs90_defconfig (gcc-10): 1 warning
    sb1250_swarm_defconfig (gcc-10): 1 warning
    tb0219_defconfig (gcc-10): 1 warning
    tb0287_defconfig (gcc-10): 1 warning

riscv:
    defconfig (gcc-10): 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-14): 5 warnings
    defconfig+debug (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning
    rv32_defconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-14): 1 error, 2 warnings
    allmodconfig (gcc-10): 2 errors
    allnoconfig (gcc-10): 1 warning
    allnoconfig (clang-14): 5 warnings
    x86_64_defconfig (clang-14): 16 warnings
    x86_64_defconfig (gcc-10): 6 warnings
    x86_64_defconfig+amdgpu (gcc-10): 6 warnings
    x86_64_defconfig+crypto (gcc-10): 6 warnings
    x86_64_defconfig+debug (gcc-10): 8 warnings
    x86_64_defconfig+ima (gcc-10): 6 warnings
    x86_64_defconfig+kselftest (gcc-10): 6 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 6 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 6 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 6 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 6 warnings

Errors summary:

    4    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_au=
x_backlight'
    3    fs/io_uring.c:9396:9: error: variable 'ret' is uninitialized when =
used here [-Werror,-Wuninitialized]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    panel-edp.c:(.text+0xc0c): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    panel-edp.c:(.text+0xbdc): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    panel-edp.c:(.text+0xb7c): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    panel-edp.c:(.text+0xb28): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    mips-linux-gnu-ld: (.init.text+0x1720): undefined reference to `no=
de_data'
    1    include/linux/tpm.h:290:2: error: field  within 'struct tpm_header=
' is less aligned than 'union tpm_header::(anonymous at ../include/linux/tp=
m.h:290:2)' and is usually due to 'struct tpm_header' being packed, which c=
an lead to unaligned accesses [-Werror,-Wunaligned-access]
    1    fs/proc/task_mmu.c:1444:7: error: unused variable =E2=80=98migrati=
on=E2=80=99 [-Werror=3Dunused-variable]
    1    fs/proc/task_mmu.c:1444:7: error: unused variable 'migration' [-We=
rror,-Wunused-variable]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    ERROR: modpost: "drm_panel_dp_aux_backlight" [drivers/gpu/drm/pane=
l/panel-edp.ko] undefined!
    1    (.init.text+0x16f8): undefined reference to `node_data'

Warnings summary:

    348  drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct=
 cpu_capability=E2=80=99 declared inside parameter list will not be visible=
 outside of this definition or declaration
    148  fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migra=
tion=E2=80=99 [-Wunused-variable]
    90   1 warning generated.
    62   arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    47   drivers/thermal/thermal_netlink.h:113:71: warning: declaration of =
'struct cpu_capability' will not be visible outside of this function [-Wvis=
ibility]
    24   drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=
=98struct cpu_capability=E2=80=99 declared inside parameter list will not b=
e visible outside of this definition or declaration
    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    17   fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-=
Wunused-variable]
    16   drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=
=80=98struct cpu_capability=E2=80=99 declared inside parameter list will no=
t be visible outside of this definition or declaration
    12   fs/io_uring.c:9373:13: note: initialize the variable 'ret' to sile=
nce this warning
    10   drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=
=98struct cpu_capability=E2=80=99 declared inside parameter list will not b=
e visible outside of this definition or declaration
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    9    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within =
'struct sockaddr_pppox' is less aligned than 'union (unnamed union at ../in=
clude/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_p=
ppox' being packed, which can lead to unaligned accesses [-Wunaligned-acces=
s]
    9    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized whe=
n used here [-Wuninitialized]
    7    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'str=
uct v4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonym=
ous at ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'st=
ruct v4l2_ext_control' being packed, which can lead to unaligned accesses [=
-Wunaligned-access]
    6    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    5    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_cap=
ability' declared inside parameter list will not be visible outside of this=
 definition or declaration
    4    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: declar=
ation of 'struct cpu_capability' will not be visible outside of this functi=
on [-Wvisibility]
    3    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: decl=
aration of 'struct cpu_capability' will not be visible outside of this func=
tion [-Wvisibility]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: declara=
tion of 'struct cpu_capability' will not be visible outside of this functio=
n [-Wvisibility]
    1    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable=
 instruction
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 =
is outside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-boun=
ds]
    1    drivers/thermal/st/../thermal_netlink.h:113:71: warning: declarati=
on of 'struct cpu_capability' will not be visible outside of this function =
[-Wvisibility]
    1    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used =
uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'v=
al' to silence this warning
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arm/mach-vexpress/spc.c:592:18: warning: array subscript -1 i=
s below array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=
=80=99} [-Warray-bounds]
    1    arch/arm/mach-vexpress/spc.c:583:21: warning: array subscript -1 i=
s below array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=
=80=99} [-Warray-bounds]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    fs/io_uring.c:9396:9: error: variable 'ret' is uninitialized when used =
here [-Werror,-Wuninitialized]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    fs/proc/task_mmu.c:1444:7: error: unused variable =E2=80=98migration=E2=
=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    fs/io_uring.c:9396:9: error: variable 'ret' is uninitialized when used =
here [-Werror,-Wuninitialized]

Warnings:
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 2 errors, 13 warnings, 0 secti=
on mismatches

Errors:
    include/linux/tpm.h:290:2: error: field  within 'struct tpm_header' is =
less aligned than 'union tpm_header::(anonymous at ../include/linux/tpm.h:2=
90:2)' and is usually due to 'struct tpm_header' being packed, which can le=
ad to unaligned accesses [-Werror,-Wunaligned-access]
    fs/proc/task_mmu.c:1444:7: error: unused variable 'migration' [-Werror,=
-Wunused-variable]

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

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    fs/io_uring.c:9396:9: error: variable 'ret' is uninitialized when used =
here [-Werror,-Wuninitialized]

Warnings:
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 47 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
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
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

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
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

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
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 warnings, 0 section =
mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 37 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: declarati=
on of 'struct cpu_capability' will not be visible outside of this function =
[-Wvisibility]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: declaration =
of 'struct cpu_capability' will not be visible outside of this function [-W=
visibility]
    1 warning generated.
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: declaration=
 of 'struct cpu_capability' will not be visible outside of this function [-=
Wvisibility]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 17 warnings, 0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 17 warnings, 0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-14) =E2=80=94 PASS, 0 er=
rors, 37 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: declarati=
on of 'struct cpu_capability' will not be visible outside of this function =
[-Wvisibility]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: declaration =
of 'struct cpu_capability' will not be visible outside of this function [-W=
visibility]
    1 warning generated.
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: declaration=
 of 'struct cpu_capability' will not be visible outside of this function [-=
Wvisibility]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 17 warnings, 0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 PASS, 0 errors, 5 warn=
ings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 17 warnings, 0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 war=
nings, 0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 warnings, 0 s=
ection mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 warnings, 0 se=
ction mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 17 warnings, =
0 section mismatches

Warnings:
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/qcom/../thermal_netlink.h:113:71: warning: =E2=80=98str=
uct cpu_capability=E2=80=99 declared inside parameter list will not be visi=
ble outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 is ou=
tside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 w=
arning, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_capabili=
ty' declared inside parameter list will not be visible outside of this defi=
nition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_capabili=
ty' declared inside parameter list will not be visible outside of this defi=
nition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_capabili=
ty' declared inside parameter list will not be visible outside of this defi=
nition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_capabili=
ty' declared inside parameter list will not be visible outside of this defi=
nition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: 'struct cpu_capabili=
ty' declared inside parameter list will not be visible outside of this defi=
nition or declaration

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 6 warning=
s, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 5 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    (.init.text+0x16f8): undefined reference to `node_data'
    mips-linux-gnu-ld: (.init.text+0x1720): undefined reference to `node_da=
ta'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sect=
ion mismatches

Errors:
    panel-edp.c:(.text+0xc0c): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 10 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 14 warnings, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 44 warnings, 0=
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
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: declarati=
on of 'struct cpu_capability' will not be visible outside of this function =
[-Wvisibility]
    1 warning generated.
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: declaration of=
 'struct cpu_capability' will not be visible outside of this function [-Wvi=
sibility]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used unini=
tialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' t=
o silence this warning
    1 warning generated.
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: declaration=
 of 'struct cpu_capability' will not be visible outside of this function [-=
Wvisibility]
    1 warning generated.
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: declaration=
 of 'struct cpu_capability' will not be visible outside of this function [-=
Wvisibility]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 14 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 14 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
6 warnings, 0 section mismatches

Warnings:
    arch/arm/mach-vexpress/spc.c:583:21: warning: array subscript -1 is bel=
ow array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=80=
=99} [-Warray-bounds]
    arch/arm/mach-vexpress/spc.c:592:18: warning: array subscript -1 is bel=
ow array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=80=
=99} [-Warray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 14 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 14 warning=
s, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/samsung/../thermal_netlink.h:113:71: warning: =E2=80=98=
struct cpu_capability=E2=80=99 declared inside parameter list will not be v=
isible outside of this definition or declaration
    drivers/thermal/st/../thermal_netlink.h:113:71: warning: =E2=80=98struc=
t cpu_capability=E2=80=99 declared inside parameter list will not be visibl=
e outside of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 10 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 11 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 8 warnings, 0 se=
ction mismatches

Errors:
    ERROR: modpost: "drm_panel_dp_aux_backlight" [drivers/gpu/drm/panel/pan=
el-edp.ko] undefined!

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 6 warnings, 0 section=
 mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    panel-edp.c:(.text+0xb7c): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

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
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sectio=
n mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 6 warnings, 0 sec=
tion mismatches

Errors:
    panel-edp.c:(.text+0xbdc): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 6 warnings, 0 sectio=
n mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration
    drivers/thermal/tegra/../thermal_netlink.h:113:71: warning: =E2=80=98st=
ruct cpu_capability=E2=80=99 declared inside parameter list will not be vis=
ible outside of this definition or declaration

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    panel-edp.c:(.text+0xb28): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, =
0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 16 warnings, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable 'migration' [-Wunus=
ed-variable]
    1 warning generated.
    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable inst=
ruction
    fs/io_uring.c:9396:9: warning: variable 'ret' is uninitialized when use=
d here [-Wuninitialized]
    fs/io_uring.c:9373:13: note: initialize the variable 'ret' to silence t=
his warning
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.
    drivers/thermal/thermal_netlink.h:113:71: warning: declaration of 'stru=
ct cpu_capability' will not be visible outside of this function [-Wvisibili=
ty]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnin=
gs, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnin=
gs, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 8 warning=
s, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6 war=
nings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
6 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 6 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 6 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 6=
 warnings, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration
    drivers/thermal/thermal_netlink.h:113:71: warning: =E2=80=98struct cpu_=
capability=E2=80=99 declared inside parameter list will not be visible outs=
ide of this definition or declaration

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    fs/proc/task_mmu.c:1444:7: warning: unused variable =E2=80=98migration=
=E2=80=99 [-Wunused-variable]

---
For more info write to <info@kernelci.org>
