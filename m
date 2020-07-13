Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7DF621DE00
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 18:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgGMQ5w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 12:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729644AbgGMQ5w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 12:57:52 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28135C061755
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 09:57:52 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gc9so146354pjb.2
        for <linux-next@vger.kernel.org>; Mon, 13 Jul 2020 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LqZqtPHRx83L0oPTQz+Eqk2kwRZdq+K2Zi6jqI8rWF0=;
        b=TBQy0XM+kN1O159wV8LdUkQtVxRSuSHilWU9LX23ZiNIX8DnGryuiUCA3dWkyBVOPy
         /VYPIw2yEypxsmEdzmPUVPZEnwkCYk8NKQXM/xJJWlpx+ss0oH9QpDui64DnfXHEYxMj
         VyxOXDBmCVCvHS7KqVGFHThPn8Zp5oX6qc24KsWv4bBtBaGA1vCk2UX8oEJCyYVQsfYM
         3q+pWWgI+ZMpeoS3sP2VdlwXBQ2f+aGFpeVJ93Yuiz0p/+hRemFHUj4/XSp86csxCK4E
         O6l+Bds7yuR+IkQukHwvxHmkrVmy/9JSAwqQpejyghyce21UN2DiJnU9OK9DadALLf84
         Sinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LqZqtPHRx83L0oPTQz+Eqk2kwRZdq+K2Zi6jqI8rWF0=;
        b=OpkiIjMITlfnFgKJzPelrrR0JBqDSh7ymjl4h8w8g5SjBWyUx4j/b1opF6QkoQE95C
         7c7pXyUFSUDNu8t41lQt9xl/3VjaTX8nyJTw/CL+g1BXCYDvJGCnFVzKWMNVth0xxDzS
         xfq5Z25FIJIJfold/VNuTS9FIICPsojyb3gbqFJfjSuJMmCM2JQ3846/MyV/FUr09PoJ
         95n4WR/mFPX9/EkSm5uowjYHqf5PNdjsTY3U8UrsODXeLBCLWppuPLXLuK48UsgPLEpr
         7ZH9BfHMA+PxtY9ECjObVB/mxwAVv9x14B6dlFdY43PwFZtQH2zAiXzSK7bJsH3V/lpd
         6mEA==
X-Gm-Message-State: AOAM530TMI/0oEpl1UWP/lU9EoSrDkrNAbJzXctWRfx3QI1eaFeOihWe
        SPuZbNbJAelTGPNBFyccXN341CyjQy0=
X-Google-Smtp-Source: ABdhPJzl8VtEYY8D5zmRcn5Ofl6BQG65TeFnzdsHa7/AEsuSEgnaHWoCL7y80Iads6aKbYGIsZ18zA==
X-Received: by 2002:a17:902:fe11:: with SMTP id g17mr483331plj.145.1594659469348;
        Mon, 13 Jul 2020 09:57:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u8sm134261pjn.24.2020.07.13.09.57.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 09:57:47 -0700 (PDT)
Message-ID: <5f0c928b.1c69fb81.585b4.060e@mx.google.com>
Date:   Mon, 13 Jul 2020 09:57:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200713
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 157 builds: 15 failed, 142 passed, 17 errors,
 856 warnings (next-20200713)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 157 builds: 15 failed, 142 passed, 17 errors, 856 warnin=
gs (next-20200713)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200713/

Tree: next
Branch: master
Git Describe: next-20200713
Git Commit: be978f8feb1d4678b941a3ccf181eea1039110e2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    defconfig: (clang-10) FAIL
    allmodconfig: (clang-9) FAIL
    defconfig: (clang-9) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
    defconfig+kselftest: (gcc-8) FAIL

arm:
    allmodconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    h3600_defconfig: (gcc-8) FAIL
    qcom_defconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig: (gcc-8) FAIL
    bcm63xx_defconfig: (gcc-8) FAIL
    ip22_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (clang-9): 1 error, 8 warnings
    allnoconfig (clang-9): 3 warnings
    allnoconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 1 error, 4 warnings
    defconfig (clang-9): 1 error, 5 warnings
    defconfig (clang-10): 1 error, 464 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 error, 4 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 error, 4 warnings
    defconfig+kselftest (gcc-8): 1 error, 4 warnings
    tinyconfig (gcc-8): 2 warnings

arm:
    allmodconfig (gcc-8): 1 error, 11 warnings
    allmodconfig (clang-9): 1 error, 34 warnings
    allnoconfig (clang-9): 3 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 3 warnings
    aspeed_g5_defconfig (clang-9): 3 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (gcc-8): 3 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    efm32_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    gemini_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    moxart_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (clang-9): 3 warnings
    multi_v7_defconfig (clang-10): 3 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 2 warnin=
gs
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 5 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 1 error, 5 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 2 warnings

mips:
    32r2el_defconfig+kselftest (gcc-8): 4 warnings
    allnoconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 error
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    cu1000-neo_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 3 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 5 errors, 2 warnings
    ip27_defconfig (gcc-8): 2 warnings
    ip28_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 2 warnings
    lemote2f_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 3 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 1 error
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 3 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 3 warnings
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    sb1250_swarm_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    nommu_virt_defconfig (gcc-8): 2 warnings
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 2 warnings

x86_64:
    allnoconfig (clang-9): 3 warnings
    allnoconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 3 warnings
    x86_64_defconfig+kselftest (gcc-8): 2 warnings

Errors summary:

    6    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaratio=
n of function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    4    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaratio=
n of function 'kzalloc' [-Werror,-Wimplicit-function-declaration]
    1    drivers/video/console/newport_con.c:598:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:594:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:370:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:368:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    drivers/video/console/newport_con.c:365:15: error: =E2=80=98struct=
 vc_data=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you m=
ean =E2=80=98vc_cols=E2=80=99?
    1    arch/mips/kvm/emulate.c:2130:3: error: too many arguments to funct=
ion =E2=80=98kvm_mips_complete_mmio_load=E2=80=99
    1    ./../include/linux/kconfig.h:7:10: fatal error: generated/autoconf=
.h: No such file or directory

Warnings summary:

    144  fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=
=80=99 [-Wunused-variable]
    144  fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=
=E2=80=99 [-Wunused-variable]
    83   aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    11   2 warnings generated.
    10   fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-=
variable]
    10   fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunuse=
d-variable]
    8    1 warning generated.
    6    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=
=3D width of type [-Wshift-count-overflow]
    6    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=
=80=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes=
 pointer from integer without a cast [-Wint-conversion]
    6    cc1: some warnings being treated as errors
    4    drivers/remoteproc/qcom_common.c:210:7: warning: incompatible inte=
ger to pointer conversion assigning to 'struct qcom_ssr_subsystem *' from '=
int' [-Wint-conversion]
    4    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut2=
24.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_tra=
ce.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exy=
nos-arm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-s=
ys.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-p=
eri.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-m=
io.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallba=
ck_table.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.as=
n1.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-=
ctype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    1 warning and 1 error generated.
    3    mm/hugetlb.c:49:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined=
 but not used [-Wunused-variable]
    2    kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_tasks_classi=
c_gp_kthread=E2=80=99 defined but not used [-Wunused-function]
    2    drivers/remoteproc/qcom_pil_info.c:111:14: warning: right shift co=
unt >=3D width of type [-Wshift-count-overflow]
    2    drivers/net/ethernet/intel/igc/igc_mac.c:374:6: warning: variable =
'link' is used uninitialized whenever 'if' condition is true [-Wsometimes-u=
ninitialized]
    2    drivers/net/ethernet/intel/igc/igc_mac.c:367:11: note: initialize =
the variable 'link' to silence this warning
    2    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast fr=
om pointer to integer of different size [-Wpointer-to-int-cast]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    security/integrity/ima/ima_crypto.c:592:12: warning: stack frame s=
ize of 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larg=
er-than=3D]
    1    include/linux/compiler_attributes.h:214:41: warning: statement wil=
l never be executed [-Wswitch-unreachable]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning: cast to=
 pointer from integer of different size [-Wint-to-pointer-cast]
    1    drivers/media/tuners/mxl5005s.c:3953:1: warning: the frame size of=
 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/omapdrm/omap_connector.c:92:9: warning: braces aro=
und scalar initializer
    1    drivers/gpu/drm/omapdrm/omap_connector.c:92:39: warning: braces ar=
ound scalar initializer [-Wbraced-scalar-init]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5648 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6:=
 warning: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/gpio/gpio-omap.c:1520:12: warning: =E2=80=98omap_gpio_resu=
me=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/gpio/gpio-omap.c:1508:12: warning: =E2=80=98omap_gpio_susp=
end=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: st=
ack frame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-la=
rger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    aarch64-linux-gnu-strip: warning: drivers/firmware/efi/libstub/lib=
-ctype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-objdump: warning: drivers/firmware/efi/libstub/l=
ib-ctype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-objcopy: warning: drivers/firmware/efi/libstub/l=
ib-ctype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: sound/hda/trace.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/wireless/trace.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/wireless/shipped-certs.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: net/mac80211/trace.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/tables.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/int32.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: lib/raid6/int16.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/qmi=
_wlfw_v01.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_qmi_msg.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sdm845.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sc7180.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4_trace_point=
s.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/trace.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev=
/pci/agp.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev=
/bios/shadowof.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgp107.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgp104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgk208.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgk110b.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf119.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf110.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine=
/gr/ctxgf104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_gpu_tracepo=
ints.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_atomic_trac=
epoints.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima_trace.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_trace_points.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/nmi_backtrace.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/irq_regs.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/ctype.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: lib/clz_tab.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-ar: warning: drivers/firmware/efi/libstub/lib-ct=
ype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    6 warnings generated.
    1    /tmp/test-arm-6b0677.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-6b0677.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccxmS9LS.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccxmS9LS.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1171:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2bb4): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2950): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnin=
gs, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 8 warnings, 0 sectio=
n mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function 'kzalloc' [-Werror,-Wimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.
    drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer t=
o pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' =
[-Wint-conversion]
    1 warning and 1 error generated.
    drivers/net/ethernet/intel/igc/igc_mac.c:374:6: warning: variable 'link=
' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninit=
ialized]
    drivers/net/ethernet/intel/igc/igc_mac.c:367:11: note: initialize the v=
ariable 'link' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 11 warnings, 0 section m=
ismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    /tmp/ccxmS9LS.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccxmS9LS.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/gpu/drm/omapdrm/omap_connector.c:92:9: warning: braces around s=
calar initializer
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors
    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]
    drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warning: cast to poin=
ter from integer of different size [-Wint-to-pointer-cast]
    drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warning: cast from po=
inter to integer of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 34 warnings, 0 section=
 mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function 'kzalloc' [-Werror,-Wimplicit-function-declaration]

Warnings:
    security/integrity/ima/ima_crypto.c:592:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.
    /tmp/test-arm-6b0677.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-6b0677.s:18788: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    drivers/gpu/drm/omapdrm/omap_connector.c:92:39: warning: braces around =
scalar initializer [-Wbraced-scalar-init]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/ethernet/intel/igc/igc_mac.c:374:6: warning: variable 'link=
' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninit=
ialized]
    drivers/net/ethernet/intel/igc/igc_mac.c:367:11: note: initialize the v=
ariable 'link' to silence this warning
    1 warning generated.
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: shift count >=3D wi=
dth of type [-Wshift-count-overflow]
    6 warnings generated.
    drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer t=
o pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' =
[-Wint-conversion]
    1 warning and 1 error generated.
    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: stack f=
rame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6: warn=
ing: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5648 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_tasks_classic_gp_=
kthread=E2=80=99 defined but not used [-Wunused-function]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_tasks_classic_gp_=
kthread=E2=80=99 defined but not used [-Wunused-function]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    ./../include/linux/kconfig.h:7:10: fatal error: generated/autoconf.h: N=
o such file or directory

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    mm/hugetlb.c:49:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2bb4): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2950): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 section mis=
matches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section m=
ismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function 'kzalloc' [-Werror,-Wimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.
    drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer t=
o pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' =
[-Wint-conversion]
    1 warning and 1 error generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 464 warnings, 0 sectio=
n mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function 'kzalloc' [-Werror,-Wimplicit-function-declaration]

Warnings:
    aarch64-linux-gnu-ar: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.
    aarch64-linux-gnu-strip: warning: drivers/firmware/efi/libstub/lib-ctyp=
e.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objdump: warning: drivers/firmware/efi/libstub/lib-ct=
ype.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: drivers/firmware/efi/libstub/lib-ct=
ype.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ar: warning: drivers/firmware/efi/libstub/lib-ctype.s=
tub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms1: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/version.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: init/init_task.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ./drivers/firmware/efi/libstub/lib-ctype=
.stub.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/highmem.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: mm/init-mm.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/iomap/trace.o: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/ext2/symlink.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfstrace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: fs/nfs/nfs4trace.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: ipc/syscall.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: security/keys/sysctl.o: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsapubkey.asn1.o: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/rsaprivkey.asn1.o: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509.asn1.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/x509_akid.asn1.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/asymmetric_keys/pkcs7.asn1.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: crypto/hash_info.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/bitrev.o: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_inflate/inflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/zlib_deflate/deflate_syms.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/xz/xz_dec_syms.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x8.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/fonts/font_8x16.o: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/clz_tab.o: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/ctype.o: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/irq_regs.o: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/nmi_backtrace.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/pinctrl/samsung/pinctrl-exynos-a=
rm64.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/video/logo/logo_linux_clut224.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evevent.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeblk.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeinit.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evgpeutil.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evglock.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evsci.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfevnt.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/evxfgpe.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/exdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwacpi.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwgpe.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/hwsleep.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/nsdump.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/psopcode.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsdumpinfo.o: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsinfo.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsio.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsirq.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsmemory.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/rsserial.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utdebug.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utglobal.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/acpi/acpica/utresdecode.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-sys.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-mio.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/clk/uniphier/clk-uniphier-peri.o=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-am654.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/dma/ti/k3-psil-j721e.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774a1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a774b1-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77965-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77970-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77980-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/soc/renesas/r8a77995-sysc.o: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/consolemap_deftbl.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/tty/vt/defkeymap.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/iommu/iommu-traces.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/base/firmware_loader/fallback_ta=
ble.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/catalyst.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/eon.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/esmt.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/everspin.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/fujitsu.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/mtd/spi-nor/xmc.o: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/host/xhci-trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/usb/gadget/udc/trace.o: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/thermal/qcom/tsens-v2.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/platform/chrome/cros_ec_trace.o:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra124.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/memory/tegra/tegra210.o: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/ipv4/udp_tunnel_stub.o: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/sysctl.o: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/sunrpc/auth_gss/trace.o: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: vmlinux: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-nm: warning: .tmp_vmlinux.kallsyms2: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-objcopy: warning: vmlinux: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: sound/hda/trace.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/trace.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/wireless/shipped-certs.o: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/wireless/ath/ath10k/qmi_wlfw=
_v01.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/vc4/vc4_trace_points.o: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/tables.o: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/int16.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: lib/raid6/int32.o: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/tegra/trace.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/lima/lima_trace.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: net/mac80211/trace.o: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_qmi_msg.o: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sdm845.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/net/ipa/ipa_data-sc7180.o: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_atomic_tracepoin=
ts.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/msm/msm_gpu_tracepoints.=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    drivers/remoteproc/qcom_common.c:210:7: warning: incompatible integer t=
o pointer conversion assigning to 'struct qcom_ssr_subsystem *' from 'int' =
[-Wint-conversion]
    1 warning and 1 error generated.
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/drm_trace_points.o: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev/bios=
/shadowof.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/subdev/pci/=
agp.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf110.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgf119.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgk110b.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgk208.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgp104.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-ld: warning: drivers/gpu/drm/nouveau/nvkm/engine/gr/c=
txgp107.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 4 warnings, 0 section mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 4 warnings, 0 section mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 s=
ection mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    mm/hugetlb.c:49:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 5 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    drivers/video/console/newport_con.c:365:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:368:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:370:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:594:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?
    drivers/video/console/newport_con.c:598:15: error: =E2=80=98struct vc_d=
ata=E2=80=99 has no member named =E2=80=98vc_color=E2=80=99; did you mean =
=E2=80=98vc_cols=E2=80=99?

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/media/tuners/mxl5005s.c:3953:1: warning: the frame size of 1120=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/kvm/emulate.c:2130:3: error: too many arguments to function =
=E2=80=98kvm_mips_complete_mmio_load=E2=80=99

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    mm/hugetlb.c:49:20: warning: =E2=80=98hugetlb_cma=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/compiler_attributes.h:214:41: warning: statement will nev=
er be executed [-Wswitch-unreachable]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-var=
iable]
    fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-varia=
ble]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98ams_del=
ta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    drivers/gpio/gpio-omap.c:1520:12: warning: =E2=80=98omap_gpio_resume=E2=
=80=99 defined but not used [-Wunused-function]
    drivers/gpio/gpio-omap.c:1508:12: warning: =E2=80=98omap_gpio_suspend=
=E2=80=99 defined but not used [-Wunused-function]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section =
mismatches

Errors:
    drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of =
function =E2=80=98kzalloc=E2=80=99; did you mean =E2=80=98vzalloc=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    drivers/remoteproc/qcom_pil_info.c:111:14: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
    drivers/remoteproc/qcom_common.c:210:7: warning: assignment to =E2=80=
=98struct qcom_ssr_subsystem *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    .config:1171:warning: override: UNWINDER_GUESS changes choice state
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/nsfs.c:195:14: warning: unused variable =E2=80=98pid_struct=E2=80=99=
 [-Wunused-variable]
    fs/nsfs.c:194:22: warning: unused variable =E2=80=98child_reaper=E2=80=
=99 [-Wunused-variable]

---
For more info write to <info@kernelci.org>
