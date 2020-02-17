Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDF4161BE3
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 20:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgBQTvS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 14:51:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46609 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbgBQTvS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2020 14:51:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so21162177wrl.13
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2020 11:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+wTTRe4R7USU7V7fcy9cV0DkVK4lH88s+tnTXXnFQLM=;
        b=kn9trun4+AkqSwawAgXGrmGsfXR/n9Z6lIdHKuRJDQLHkaPbO0qsc5gLOsEyhPNYdn
         OTNVKFq4lr1rYQb3QxuAtFht0ZfeFi5sNsHCPAjs899a9Lh5mZxe6sMAfwDx8GmwlZU4
         o5hFHIauv//pEuj0aBk5KgI44E3vS2UwqJedta1rdjwafZQearan710L69qcPwuvX1V4
         c5OtnX4CYzaejK9FLRn2PFHHW8qR6t+MxJbVXqXGt/6HlR7IOr6QdW5aFiEgqSm8aQkG
         5x9SfXXqREKf2G0/M4sk3uuCzQWtqChIaCbPxV/YITiYeGBhaBOglbZ3Sr+K/2vBNFaE
         D03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+wTTRe4R7USU7V7fcy9cV0DkVK4lH88s+tnTXXnFQLM=;
        b=HlDXEBTXL9r66OyzD/XMCk0mgvL5lsWaQhLA/e9ZqXUkQzmP1m5Wq2fCOBavaEFrIT
         MnvSvwBs78LpU14GvLkpIGK1Y+pfXP1oVD9PGToQljPQr5SEvPesdKXL/mOYVL01jr5V
         Lb4RBF3B+i34AjRKxkC/CH8Xn6+5fOm7c+UM8LUQYrroPA+hvsMiqRhUgFsJFZpMJ49N
         A1NNacMNKQSOVWFobLQ6Gn1FpFDSul69xd8D8U1VqdfcO3qPJmsaLXHHG2eWdJ1rhIha
         9vgzQBrS1K6jKLNZ8WktWl9cFk7ABBh2t6hhy6r0sIFLJY2KXGnMxI4Fs9q7l3eKrA9L
         lJ1A==
X-Gm-Message-State: APjAAAU1d01OOtDTWSxIpHjvIa28Lufq6Va73TXQl9nBrjMMBFQ3PnfW
        jmE2D6cyp72WPTbEcqtSJ5BVZ/3PHTed4w==
X-Google-Smtp-Source: APXvYqyUoY6ZzrU+wJG2uLit8w1Q/evrb8qcy80lIbOgsYal7cppQyLW5ExLWL/Qkz1Bauhy/8D4Ng==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr23485345wrr.268.1581969069319;
        Mon, 17 Feb 2020 11:51:09 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o2sm552482wmh.46.2020.02.17.11.51.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:51:08 -0800 (PST)
Message-ID: <5e4aeeac.1c69fb81.531e1.2d6b@mx.google.com>
Date:   Mon, 17 Feb 2020 11:51:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200217
Subject: next/master build: 168 builds: 0 failed, 168 passed,
 528 warnings (next-20200217)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 168 builds: 0 failed, 168 passed, 528 warnings (next-202=
00217)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200217/

Tree: next
Branch: master
Git Describe: next-20200217
Git Commit: c25a951c50dca1da4a449a985a9debd82dc18573
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (clang-8): 74 warnings
    allmodconfig (gcc-8): 1 warning
    defconfig (clang-8): 12 warnings
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 25 warnings
    am200epdkit_defconfig (gcc-8): 3 warnings
    aspeed_g4_defconfig (gcc-8): 4 warnings
    aspeed_g5_defconfig (gcc-8): 7 warnings
    at91_dt_defconfig (gcc-8): 3 warnings
    badge4_defconfig (gcc-8): 3 warnings
    bcm2835_defconfig (gcc-8): 3 warnings
    cerfcube_defconfig (gcc-8): 3 warnings
    clps711x_defconfig (gcc-8): 3 warnings
    cm_x2xx_defconfig (gcc-8): 3 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 3 warnings
    colibri_pxa270_defconfig (gcc-8): 3 warnings
    collie_defconfig (gcc-8): 3 warnings
    corgi_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 3 warnings
    ebsa110_defconfig (gcc-8): 3 warnings
    em_x270_defconfig (gcc-8): 3 warnings
    ep93xx_defconfig (gcc-8): 3 warnings
    eseries_pxa_defconfig (gcc-8): 3 warnings
    exynos_defconfig (gcc-8): 3 warnings
    ezx_defconfig (gcc-8): 3 warnings
    gemini_defconfig (gcc-8): 3 warnings
    hackkit_defconfig (gcc-8): 3 warnings
    hisi_defconfig (gcc-8): 3 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 3 warnings
    imx_v6_v7_defconfig (gcc-8): 3 warnings
    integrator_defconfig (gcc-8): 3 warnings
    iop32x_defconfig (gcc-8): 3 warnings
    ixp4xx_defconfig (gcc-8): 3 warnings
    jornada720_defconfig (gcc-8): 3 warnings
    keystone_defconfig (gcc-8): 3 warnings
    lart_defconfig (gcc-8): 3 warnings
    lpc32xx_defconfig (gcc-8): 3 warnings
    lpd270_defconfig (gcc-8): 3 warnings
    magician_defconfig (gcc-8): 3 warnings
    mainstone_defconfig (gcc-8): 3 warnings
    milbeaut_m10v_defconfig (gcc-8): 3 warnings
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 3 warnings
    moxart_defconfig (gcc-8): 3 warnings
    multi_v4t_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    mv78xx0_defconfig (gcc-8): 3 warnings
    mvebu_v5_defconfig (gcc-8): 3 warnings
    mxs_defconfig (gcc-8): 3 warnings
    neponset_defconfig (gcc-8): 3 warnings
    nhk8815_defconfig (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 3 warnings
    omap2plus_defconfig (gcc-8): 3 warnings
    oxnas_v6_defconfig (gcc-8): 3 warnings
    pleb_defconfig (gcc-8): 3 warnings
    prima2_defconfig (gcc-8): 3 warnings
    pxa168_defconfig (gcc-8): 3 warnings
    pxa255-idp_defconfig (gcc-8): 3 warnings
    pxa3xx_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 3 warnings
    rpc_defconfig (gcc-8): 3 warnings
    s3c2410_defconfig (gcc-8): 3 warnings
    s3c6400_defconfig (gcc-8): 3 warnings
    s5pv210_defconfig (gcc-8): 3 warnings
    sama5_defconfig (gcc-8): 3 warnings
    shannon_defconfig (gcc-8): 3 warnings
    shmobile_defconfig (gcc-8): 3 warnings
    simpad_defconfig (gcc-8): 3 warnings
    spear13xx_defconfig (gcc-8): 3 warnings
    spear3xx_defconfig (gcc-8): 3 warnings
    spear6xx_defconfig (gcc-8): 3 warnings
    spitz_defconfig (gcc-8): 3 warnings
    sunxi_defconfig (gcc-8): 4 warnings
    tango4_defconfig (gcc-8): 3 warnings
    trizeps4_defconfig (gcc-8): 3 warnings
    u300_defconfig (gcc-8): 3 warnings
    vexpress_defconfig (gcc-8): 3 warnings
    viper_defconfig (gcc-8): 3 warnings
    vt8500_v6_v7_defconfig (gcc-8): 3 warnings
    zeus_defconfig (gcc-8): 3 warnings
    zx_defconfig (gcc-8): 3 warnings

i386:
    i386_defconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    ar7_defconfig (gcc-8): 3 warnings
    ath79_defconfig (gcc-8): 3 warnings
    bcm47xx_defconfig (gcc-8): 3 warnings
    bigsur_defconfig (gcc-8): 3 warnings
    bmips_be_defconfig (gcc-8): 3 warnings
    capcella_defconfig (gcc-8): 3 warnings
    cobalt_defconfig (gcc-8): 3 warnings
    cu1000-neo_defconfig (gcc-8): 3 warnings
    db1xxx_defconfig (gcc-8): 3 warnings
    decstation_defconfig (gcc-8): 3 warnings
    fuloong2e_defconfig (gcc-8): 3 warnings
    gcw0_defconfig (gcc-8): 3 warnings
    gpr_defconfig (gcc-8): 3 warnings
    ip22_defconfig (gcc-8): 3 warnings
    ip27_defconfig (gcc-8): 4 warnings
    ip32_defconfig (gcc-8): 3 warnings
    jazz_defconfig (gcc-8): 3 warnings
    lasat_defconfig (gcc-8): 3 warnings
    lemote2f_defconfig (gcc-8): 4 warnings
    loongson1b_defconfig (gcc-8): 3 warnings
    loongson1c_defconfig (gcc-8): 3 warnings
    loongson3_defconfig (gcc-8): 3 warnings
    malta_defconfig (gcc-8): 3 warnings
    malta_kvm_defconfig (gcc-8): 3 warnings
    malta_kvm_guest_defconfig (gcc-8): 3 warnings
    malta_qemu_32r6_defconfig (gcc-8): 4 warnings
    maltaaprp_defconfig (gcc-8): 3 warnings
    maltasmvp_defconfig (gcc-8): 3 warnings
    maltasmvp_eva_defconfig (gcc-8): 3 warnings
    maltaup_defconfig (gcc-8): 3 warnings
    maltaup_xpa_defconfig (gcc-8): 3 warnings
    mpc30x_defconfig (gcc-8): 3 warnings
    msp71xx_defconfig (gcc-8): 3 warnings
    mtx1_defconfig (gcc-8): 3 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    pnx8335_stb225_defconfig (gcc-8): 3 warnings
    qi_lb60_defconfig (gcc-8): 3 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 3 warnings
    sb1250_swarm_defconfig (gcc-8): 3 warnings
    tb0226_defconfig (gcc-8): 3 warnings
    tb0287_defconfig (gcc-8): 3 warnings
    workpad_defconfig (gcc-8): 3 warnings

riscv:
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 4 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning


Warnings summary:

    128  include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct re=
sv_map=E2=80=99 declared inside parameter list will not be visible outside =
of this definition or declaration
    128  include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct fi=
le_region=E2=80=99 declared inside parameter list will not be visible outsi=
de of this definition or declaration
    128  include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct re=
sv_map=E2=80=99 declared inside parameter list will not be visible outside =
of this definition or declaration
    27   1 warning generated.
    11   fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=
=80=98write_one_page=E2=80=99, declared with attribute warn_unused_result [=
-Wunused-result]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    7    2 warnings generated.
    6    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    6    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    6    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    6    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    5    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [=
-Wunused-value]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    drivers/gpu/drm/drm_dp_mst_topology.c:5400:30: warning: suggest br=
aces around initialization of subobject [-Wmissing-braces]
    2    net/bluetooth/smp.c:2185:8: warning: variable 'passkey' is uniniti=
alized when used here [-Wuninitialized]
    2    net/bluetooth/smp.c:2119:13: note: initialize the variable 'passke=
y' to silence this warning
    2    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of funct=
ion declared with 'warn_unused_result' attribute [-Wunused-result]
    2    fs/btrfs/backref.c:394:30: warning: suggest braces around initiali=
zation of subobject [-Wmissing-braces]
    2    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: suggest br=
aces around initialization of subobject [-Wmissing-braces]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2675:80=
: warning: suggest braces around initialization of subobject [-Wmissing-bra=
ces]
    2    3 warnings generated.
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2742:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1985:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:464:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1638:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3213:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1736:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:84:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_sli.c:11909:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4728:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: var=
iable 'rate_idx' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    1    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initia=
lize the variable 'rate_idx' to silence this warning
    1    drivers/net/usb/lan78xx.c:2659:34: warning: variable 'unlink_wakeu=
p' is uninitialized when used within its own initialization [-Wuninitialize=
d]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    drivers/net/ethernet/amazon/ena/ena_netdev.c:313:38: warning: sugg=
est braces around initialization of subobject [-Wmissing-braces]
    1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/infiniband/core/security.c:351:41: warning: use of logical=
 '||' with constant operand [-Wconstant-logical-operand]
    1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2673:53=
: warning: suggest braces around initialization of subobject [-Wmissing-bra=
ces]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:980:36: wa=
rning: address of 'sink->edid_caps.panel_patch.skip_scdc_overwrite' will al=
ways evaluate to 'true' [-Wpointer-bool-conversion]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:342=
:53: warning: suggest braces around initialization of subobject [-Wmissing-=
braces]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:116=
:62: warning: suggest braces around initialization of subobject [-Wmissing-=
braces]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:4=
1: warning: suggest braces around initialization of subobject [-Wmissing-br=
aces]
    1    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8538:4=
3: warning: suggest braces around initialization of subobject [-Wmissing-br=
aces]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    /tmp/cc8QZZL1.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc8QZZL1.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 74 warnings, 0 sect=
ion mismatches

Warnings:
    fs/proc/base.c:1985:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    mm/shmem.c:2742:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1736:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3213:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/bluetooth/smp.c:2185:8: warning: variable 'passkey' is uninitialize=
d when used here [-Wuninitialized]
    net/bluetooth/smp.c:2119:13: note: initialize the variable 'passkey' to=
 silence this warning
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of function d=
eclared with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    fs/cifs/readdir.c:84:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/btrfs/backref.c:394:30: warning: suggest braces around initializatio=
n of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/infiniband/core/security.c:351:41: warning: use of logical '||'=
 with constant operand [-Wconstant-logical-operand]
    1 warning generated.
    fs/nfs/dir.c:464:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1638:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/ethernet/amazon/ena/ena_netdev.c:313:38: warning: suggest b=
races around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/net/usb/lan78xx.c:2659:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/drm_dp_mst_topology.c:5400:30: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    drivers/gpu/drm/drm_dp_mst_topology.c:5400:30: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    2 warnings generated.
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: variable=
 'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsomet=
imes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initialize =
the variable 'rate_idx' to silence this warning
    3 warnings generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8538:43: wa=
rning: suggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_sli.c:11909:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4728:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:116:62: =
warning: suggest braces around initialization of subobject [-Wmissing-brace=
s]
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:342:53: =
warning: suggest braces around initialization of subobject [-Wmissing-brace=
s]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:41: wa=
rning: suggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:980:36: warning=
: address of 'sink->edid_caps.panel_patch.skip_scdc_overwrite' will always =
evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2673:53: war=
ning: suggest braces around initialization of subobject [-Wmissing-braces]
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2675:80: war=
ning: suggest braces around initialization of subobject [-Wmissing-braces]
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:2675:80: war=
ning: suggest braces around initialization of subobject [-Wmissing-braces]
    3 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 25 warnings, 0 section =
mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    /tmp/cc8QZZL1.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc8QZZL1.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunu=
sed-value]
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to integ=
er of different size [-Wpointer-to-int-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 section=
 mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of function d=
eclared with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    fs/btrfs/backref.c:394:30: warning: suggest braces around initializatio=
n of subobject [-Wmissing-braces]
    1 warning generated.
    net/bluetooth/smp.c:2185:8: warning: variable 'passkey' is uninitialize=
d when used here [-Wuninitialized]
    net/bluetooth/smp.c:2119:13: note: initialize the variable 'passkey' to=
 silence this warning
    1 warning generated.
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:722:36: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/drm/drm_dp_mst_topology.c:5400:30: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    drivers/gpu/drm/drm_dp_mst_topology.c:5400:30: warning: suggest braces =
around initialization of subobject [-Wmissing-braces]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

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
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, =
0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunu=
sed-value]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 8 warnings, 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunu=
sed-value]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 =
warnings, 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunu=
sed-value]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, =
0 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunu=
sed-value]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1165:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/btrfs/volumes.c:7338:3: warning: ignoring return value of =E2=80=98w=
rite_one_page=E2=80=99, declared with attribute warn_unused_result [-Wunuse=
d-result]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section m=
ismatches

Warnings:
    include/linux/hugetlb_cgroup.h:146:21: warning: =E2=80=98struct file_re=
gion=E2=80=99 declared inside parameter list will not be visible outside of=
 this definition or declaration
    include/linux/hugetlb_cgroup.h:145:63: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration
    include/linux/hugetlb_cgroup.h:233:59: warning: =E2=80=98struct resv_ma=
p=E2=80=99 declared inside parameter list will not be visible outside of th=
is definition or declaration

---
For more info write to <info@kernelci.org>
