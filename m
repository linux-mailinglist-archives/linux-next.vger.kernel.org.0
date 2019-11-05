Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119C0EFCF9
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 13:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388008AbfKEMMq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 07:12:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46259 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388328AbfKEMMp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 07:12:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id b3so15314637wrs.13
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 04:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/P6/iPiKnVqU14CJFbgjeVpEPBunjr3bUiRrT8/6QpY=;
        b=DRhiQfotaUdYaI4dpAb6+C6NpEKN/9Ans2r8ZCYR5wYjfMUSlyQpf2Gl9ULWEtzVUB
         Xdy+eLw7aAUrCL1bX1mOhXHYE9pJB2GFM5ovnVauB4UhrjLRqoQXf4PdltpsfAV0Oawm
         u1oGqNm89HTtZyUF+XjV5dRYSbCE3y95w5DXY1fyYRN892e8LTKbR0qdb3WnAB+8rsix
         0e3fLSEJYzCDeI6V+CZUcVDevhcCCyLep+NB18Nha2HnOpr8gqasAbmgITotHRlbGTh6
         aGT4NNxM+stTYYm26W0TWHpwa3v4KHd1JNdUXQX1wZd0PBuZFHlJuRK6dlEcY1oeyGCh
         SMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/P6/iPiKnVqU14CJFbgjeVpEPBunjr3bUiRrT8/6QpY=;
        b=lyBzuI1OQO3hk5Q11ZNaXMJgFF+0Vm/E0vpuA9kgVV8DW8xW5qnxHYUbOmo7C+PjFM
         f9YoKXAUJ79zh0SWgilLljNHS4hGe6avlLPGejy/Du+x+h3Oiug0zX0dFfO8Tt9yafQY
         TXMYQjXp6hn164zqOOBsdxeJMx3VPwvoH7Fzkx85w3x2bUINgOUYU7Mo7XikIAmD3Zbi
         2PsSknJ0SiOiov6oypXEqVvs1wOfomhO0wV/QDpMl1vI4TsRln9xAfAShMaUmQv2W8+R
         NpO5y0NFz+Oq8qWlLWscpkKnna/ghlghTsw1MiAOoNmBItS24kF8iCXERzPYl4T7SCD0
         XerA==
X-Gm-Message-State: APjAAAWegyI1xZD3iNPIui1IOYxzzuDoe8EswtfxCNjnidForfZiXh4c
        LlKzv9PH2p6H2MfDi+FJFiFe6cy+o9TRcA==
X-Google-Smtp-Source: APXvYqybCvEiMWrs8CeoR6zaWdhhbHCLpAlHMPxwLyVbujDOb21ZFmrCnZENdorTOp+wW/sq03JHJw==
X-Received: by 2002:a05:6000:1008:: with SMTP id a8mr27644053wrx.60.1572955952140;
        Tue, 05 Nov 2019 04:12:32 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z14sm9057907wrl.60.2019.11.05.04.12.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 04:12:31 -0800 (PST)
Message-ID: <5dc1672f.1c69fb81.be611.395e@mx.google.com>
Date:   Tue, 05 Nov 2019 04:12:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191105
Subject: next/master build: 216 builds: 2 failed, 214 passed, 6 errors,
 456 warnings (next-20191105)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 2 failed, 214 passed, 6 errors, 456 warnings=
 (next-20191105)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191105/

Tree: next
Branch: master
Git Describe: next-20191105
Git Commit: 51309b9d73f5de2d8cba2c850df0c3b5d9125bee
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 3 warnings
    axs103_smp_defconfig (gcc-8): 3 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (clang-8): 46 warnings
    allmodconfig (gcc-8): 1 warning
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 2 errors, 20 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 3 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 32 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 3 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 warning
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 3 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 31 warnings

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig (gcc-8): 32 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 1 warning
    cavium_octeon_defconfig (gcc-8): 4 errors, 4 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 1 warning
    fuloong2e_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 1 warning
    mips_paravirt_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 1 warning
    tb0287_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 30 warnings
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allmodconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 29 warnings

Errors summary:

    1    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    1    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'

Warnings summary:

    105  fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   1 warning generated.
    6    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    4    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    4    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 5 has type 'unsigned int' [-=
Wformat=3D]
    4    2 warnings generated.
    2    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning:=
 'spec' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cv=
mx_helper_link_info' declared inside parameter list will not be visible out=
side of this definition or declaration
    1    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeu=
p' is uninitialized when used within its own initialization [-Wuninitialize=
d]
    1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:720:37: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:719:37: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:718:43: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    WARNING: unmet direct dependencies detected for FSL_RCPM
    1    3 warnings generated.
    1    .config:1166:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.vqZIUqRrzd:3999:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vqZIUqRrzd:3982:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vqZIUqRrzd:3981:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vqZIUqRrzd:3977:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vqZIUqRrzd:3957:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vqZIUqRrzd:3951:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vqZIUqRrzd:3942:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vqZIUqRrzd:3940:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vqZIUqRrzd:3939:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vqZIUqRrzd:3938:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vqZIUqRrzd:3936:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vqZIUqRrzd:3935:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vqZIUqRrzd:3932:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vqZIUqRrzd:3925:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vqZIUqRrzd:3915:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vqZIUqRrzd:3904:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vqZIUqRrzd:3796:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vqZIUqRrzd:3792:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vqZIUqRrzd:3766:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vqZIUqRrzd:3745:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vqZIUqRrzd:3737:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.vqZIUqRrzd:3733:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.vqZIUqRrzd:3678:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vqZIUqRrzd:3677:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vqZIUqRrzd:3673:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vqZIUqRrzd:3672:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vqZIUqRrzd:3670:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vqZIUqRrzd:3669:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vqZIUqRrzd:3666:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.tWIduLVvTT:3380:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tWIduLVvTT:3363:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.tWIduLVvTT:3362:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.tWIduLVvTT:3358:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.tWIduLVvTT:3338:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.tWIduLVvTT:3332:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.tWIduLVvTT:3323:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.tWIduLVvTT:3321:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.tWIduLVvTT:3320:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.tWIduLVvTT:3319:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.tWIduLVvTT:3317:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.tWIduLVvTT:3316:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.tWIduLVvTT:3313:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.tWIduLVvTT:3306:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.tWIduLVvTT:3296:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.tWIduLVvTT:3285:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tWIduLVvTT:3177:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.tWIduLVvTT:3173:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tWIduLVvTT:3147:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.tWIduLVvTT:3126:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.tWIduLVvTT:3118:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.tWIduLVvTT:3114:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.tWIduLVvTT:3059:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.tWIduLVvTT:3058:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.tWIduLVvTT:3054:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.tWIduLVvTT:3053:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.tWIduLVvTT:3051:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.tWIduLVvTT:3050:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.tWIduLVvTT:3047:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.lnAvAAfT8M:4901:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lnAvAAfT8M:4884:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.lnAvAAfT8M:4883:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.lnAvAAfT8M:4879:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.lnAvAAfT8M:4859:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.lnAvAAfT8M:4853:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.lnAvAAfT8M:4844:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.lnAvAAfT8M:4842:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.lnAvAAfT8M:4841:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.lnAvAAfT8M:4840:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.lnAvAAfT8M:4838:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.lnAvAAfT8M:4837:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.lnAvAAfT8M:4834:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.lnAvAAfT8M:4827:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.lnAvAAfT8M:4817:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.lnAvAAfT8M:4806:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lnAvAAfT8M:4698:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.lnAvAAfT8M:4694:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lnAvAAfT8M:4668:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.lnAvAAfT8M:4647:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.lnAvAAfT8M:4639:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.lnAvAAfT8M:4635:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.lnAvAAfT8M:4580:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.lnAvAAfT8M:4579:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.lnAvAAfT8M:4575:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.lnAvAAfT8M:4574:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.lnAvAAfT8M:4572:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.lnAvAAfT8M:4571:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.lnAvAAfT8M:4568:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.SI4flU8F6A:4838:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SI4flU8F6A:4821:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.SI4flU8F6A:4820:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.SI4flU8F6A:4816:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.SI4flU8F6A:4796:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.SI4flU8F6A:4790:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.SI4flU8F6A:4781:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.SI4flU8F6A:4779:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.SI4flU8F6A:4778:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.SI4flU8F6A:4777:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.SI4flU8F6A:4775:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.SI4flU8F6A:4774:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.SI4flU8F6A:4771:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.SI4flU8F6A:4764:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.SI4flU8F6A:4754:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.SI4flU8F6A:4743:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SI4flU8F6A:4635:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.SI4flU8F6A:4631:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SI4flU8F6A:4605:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.SI4flU8F6A:4584:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.SI4flU8F6A:4576:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.SI4flU8F6A:4572:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.SI4flU8F6A:4517:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.SI4flU8F6A:4516:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.SI4flU8F6A:4512:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.SI4flU8F6A:4511:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.SI4flU8F6A:4509:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.SI4flU8F6A:4508:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.SI4flU8F6A:4505:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.LI37HXHJLA:8609:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LI37HXHJLA:8592:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.LI37HXHJLA:8591:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.LI37HXHJLA:8587:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.LI37HXHJLA:8567:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.LI37HXHJLA:8561:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.LI37HXHJLA:8552:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.LI37HXHJLA:8550:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.LI37HXHJLA:8549:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.LI37HXHJLA:8548:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.LI37HXHJLA:8546:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.LI37HXHJLA:8545:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.LI37HXHJLA:8542:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.LI37HXHJLA:8535:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.LI37HXHJLA:8525:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.LI37HXHJLA:8514:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LI37HXHJLA:8406:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.LI37HXHJLA:8402:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LI37HXHJLA:8376:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.LI37HXHJLA:8355:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.LI37HXHJLA:8347:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.LI37HXHJLA:8343:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.LI37HXHJLA:8288:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.LI37HXHJLA:8287:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.LI37HXHJLA:8283:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.LI37HXHJLA:8282:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.LI37HXHJLA:8280:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.LI37HXHJLA:8279:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.LI37HXHJLA:8276:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.FsUxrEMXiQ:8008:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FsUxrEMXiQ:7991:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.FsUxrEMXiQ:7990:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.FsUxrEMXiQ:7986:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.FsUxrEMXiQ:7966:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.FsUxrEMXiQ:7960:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.FsUxrEMXiQ:7951:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.FsUxrEMXiQ:7949:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.FsUxrEMXiQ:7948:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.FsUxrEMXiQ:7947:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.FsUxrEMXiQ:7945:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.FsUxrEMXiQ:7944:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.FsUxrEMXiQ:7941:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.FsUxrEMXiQ:7934:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.FsUxrEMXiQ:7924:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.FsUxrEMXiQ:7913:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FsUxrEMXiQ:7805:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.FsUxrEMXiQ:7801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FsUxrEMXiQ:7775:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.FsUxrEMXiQ:7754:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.FsUxrEMXiQ:7746:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.FsUxrEMXiQ:7742:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.FsUxrEMXiQ:7687:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.FsUxrEMXiQ:7686:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.FsUxrEMXiQ:7682:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.FsUxrEMXiQ:7681:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.FsUxrEMXiQ:7679:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.FsUxrEMXiQ:7678:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.FsUxrEMXiQ:7675:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    4    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismat=
ch in reference from the variable bcm_iproc_gpio_driver to the variable .in=
it.rodata:bcm_iproc_gpio_of_match
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.data+0xbe040): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    2    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.data+0xdde6c): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xc6028): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xbe380): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x110e20): Section mismatch in reference =
from the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ip=
roc_gpio_of_match

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 32 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.vqZIUqRrzd:3666:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vqZIUqRrzd:3669:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vqZIUqRrzd:3670:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vqZIUqRrzd:3672:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vqZIUqRrzd:3673:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vqZIUqRrzd:3677:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vqZIUqRrzd:3678:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vqZIUqRrzd:3733:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.vqZIUqRrzd:3737:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.vqZIUqRrzd:3745:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vqZIUqRrzd:3766:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vqZIUqRrzd:3792:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vqZIUqRrzd:3796:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vqZIUqRrzd:3904:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vqZIUqRrzd:3915:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vqZIUqRrzd:3925:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vqZIUqRrzd:3932:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vqZIUqRrzd:3935:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vqZIUqRrzd:3936:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vqZIUqRrzd:3938:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vqZIUqRrzd:3939:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vqZIUqRrzd:3940:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vqZIUqRrzd:3942:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vqZIUqRrzd:3951:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vqZIUqRrzd:3957:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vqZIUqRrzd:3977:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vqZIUqRrzd:3981:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vqZIUqRrzd:3982:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vqZIUqRrzd:3999:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 46 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/bus/fsl-mc/fsl-mc-bus.c:718:43: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    drivers/bus/fsl-mc/fsl-mc-bus.c:719:37: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    drivers/bus/fsl-mc/fsl-mc-bus.c:720:37: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    3 warnings generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for FSL_RCPM
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 20 warnings, 0 section =
mismatches

Errors:
    ERROR: "__aeabi_ldivmod" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
    ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

Warnings:
    /tmp/cco1s4iX.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cco1s4iX.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
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
    include/linux/kern_levels.h:5:18: warning: format '%ld' expects argumen=
t of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'}=
 [-Wformat=3D]
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x2c): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the (unknown referenc=
e) .init.rodata:(unknown)

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings,=
 0 section mismatches

Errors:
    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing pointer =
to incomplete type 'struct cvmx_wqe'
    drivers/staging/octeon/ethernet.c:463:30: error: storage size of 'link_=
info' isn't known
    drivers/staging/octeon/ethernet.c:499:30: error: storage size of 'link_=
info' isn't known
    drivers/staging/octeon/ethernet.c:516:29: error: type of formal paramet=
er 2 is incomplete

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.tWIduLVvTT:3047:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.tWIduLVvTT:3050:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.tWIduLVvTT:3051:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.tWIduLVvTT:3053:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.tWIduLVvTT:3054:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.tWIduLVvTT:3058:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.tWIduLVvTT:3059:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.tWIduLVvTT:3114:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.tWIduLVvTT:3118:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.tWIduLVvTT:3126:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.tWIduLVvTT:3147:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.tWIduLVvTT:3173:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.tWIduLVvTT:3177:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.tWIduLVvTT:3285:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.tWIduLVvTT:3296:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.tWIduLVvTT:3306:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.tWIduLVvTT:3313:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.tWIduLVvTT:3316:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.tWIduLVvTT:3317:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.tWIduLVvTT:3319:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.tWIduLVvTT:3320:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.tWIduLVvTT:3321:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.tWIduLVvTT:3323:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.tWIduLVvTT:3332:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.tWIduLVvTT:3338:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.tWIduLVvTT:3358:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.tWIduLVvTT:3362:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.tWIduLVvTT:3363:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.tWIduLVvTT:3380:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.FsUxrEMXiQ:7675:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.FsUxrEMXiQ:7678:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.FsUxrEMXiQ:7679:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.FsUxrEMXiQ:7681:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.FsUxrEMXiQ:7682:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.FsUxrEMXiQ:7686:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.FsUxrEMXiQ:7687:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.FsUxrEMXiQ:7742:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.FsUxrEMXiQ:7746:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.FsUxrEMXiQ:7754:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.FsUxrEMXiQ:7775:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.FsUxrEMXiQ:7801:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.FsUxrEMXiQ:7805:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.FsUxrEMXiQ:7913:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.FsUxrEMXiQ:7924:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.FsUxrEMXiQ:7934:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.FsUxrEMXiQ:7941:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.FsUxrEMXiQ:7944:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.FsUxrEMXiQ:7945:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.FsUxrEMXiQ:7947:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.FsUxrEMXiQ:7948:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.FsUxrEMXiQ:7949:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.FsUxrEMXiQ:7951:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.FsUxrEMXiQ:7960:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.FsUxrEMXiQ:7966:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.FsUxrEMXiQ:7986:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.FsUxrEMXiQ:7990:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.FsUxrEMXiQ:7991:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.FsUxrEMXiQ:8008:warning: override: reassigning to symbol =
USER_NS

Section mismatches:
    WARNING: vmlinux.o(.data+0x110e20): Section mismatch in reference from =
the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_g=
pio_of_match

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 31 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.SI4flU8F6A:4505:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.SI4flU8F6A:4508:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.SI4flU8F6A:4509:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.SI4flU8F6A:4511:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.SI4flU8F6A:4512:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.SI4flU8F6A:4516:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.SI4flU8F6A:4517:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.SI4flU8F6A:4572:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.SI4flU8F6A:4576:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.SI4flU8F6A:4584:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.SI4flU8F6A:4605:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.SI4flU8F6A:4631:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.SI4flU8F6A:4635:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.SI4flU8F6A:4743:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.SI4flU8F6A:4754:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.SI4flU8F6A:4764:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.SI4flU8F6A:4771:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.SI4flU8F6A:4774:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.SI4flU8F6A:4775:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.SI4flU8F6A:4777:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.SI4flU8F6A:4778:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.SI4flU8F6A:4779:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.SI4flU8F6A:4781:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.SI4flU8F6A:4790:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.SI4flU8F6A:4796:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.SI4flU8F6A:4816:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.SI4flU8F6A:4820:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.SI4flU8F6A:4821:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.SI4flU8F6A:4838:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe040): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe040): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe380): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 =
warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xc6028): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 32 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.LI37HXHJLA:8276:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.LI37HXHJLA:8279:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.LI37HXHJLA:8280:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.LI37HXHJLA:8282:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.LI37HXHJLA:8283:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.LI37HXHJLA:8287:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.LI37HXHJLA:8288:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.LI37HXHJLA:8343:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.LI37HXHJLA:8347:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.LI37HXHJLA:8355:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.LI37HXHJLA:8376:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.LI37HXHJLA:8402:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.LI37HXHJLA:8406:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.LI37HXHJLA:8514:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.LI37HXHJLA:8525:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.LI37HXHJLA:8535:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.LI37HXHJLA:8542:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.LI37HXHJLA:8545:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.LI37HXHJLA:8546:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.LI37HXHJLA:8548:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.LI37HXHJLA:8549:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.LI37HXHJLA:8550:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.LI37HXHJLA:8552:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.LI37HXHJLA:8561:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.LI37HXHJLA:8567:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.LI37HXHJLA:8587:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.LI37HXHJLA:8591:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.LI37HXHJLA:8592:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.LI37HXHJLA:8609:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

Section mismatches:
    WARNING: vmlinux.o(.data+0xdde6c): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1166:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 29 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.lnAvAAfT8M:4568:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.lnAvAAfT8M:4571:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.lnAvAAfT8M:4572:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.lnAvAAfT8M:4574:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.lnAvAAfT8M:4575:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.lnAvAAfT8M:4579:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.lnAvAAfT8M:4580:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.lnAvAAfT8M:4635:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.lnAvAAfT8M:4639:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.lnAvAAfT8M:4647:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.lnAvAAfT8M:4668:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.lnAvAAfT8M:4694:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.lnAvAAfT8M:4698:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.lnAvAAfT8M:4806:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.lnAvAAfT8M:4817:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.lnAvAAfT8M:4827:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.lnAvAAfT8M:4834:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.lnAvAAfT8M:4837:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.lnAvAAfT8M:4838:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.lnAvAAfT8M:4840:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.lnAvAAfT8M:4841:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.lnAvAAfT8M:4842:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.lnAvAAfT8M:4844:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.lnAvAAfT8M:4853:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.lnAvAAfT8M:4859:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.lnAvAAfT8M:4879:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.lnAvAAfT8M:4883:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.lnAvAAfT8M:4884:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.lnAvAAfT8M:4901:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---
For more info write to <info@kernelci.org>
