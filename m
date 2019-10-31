Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8237AEAC1B
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 10:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfJaJDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Oct 2019 05:03:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33188 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfJaJDp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2019 05:03:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id s1so5345668wro.0
        for <linux-next@vger.kernel.org>; Thu, 31 Oct 2019 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VB+ydqC6x+W2beY4kJQID1z9belHzK/vT02swyOMUnI=;
        b=JAhomA+DCnzCYbWynNwpixz/UgXN83ED/nissGYGDdeXzpspvyFzJn8iwDFJIpO0gg
         W0C+PCyBmmIJbQSM3Y3lvEjkgkG4TiVIZ1pKIFd6C9YZasP0AdYAb00xOhlAKOmsmxbl
         aG2V/2RJ5p+ygxRM2YlkFdqdVO4NgQWE8sFlpXa9YoLxsgDhQyVpR7I8dV7PDEtkKHHC
         U6PDeBCEkhgCCF2ynAM2ShZphoQAY/WNXEWLzfcZm6aZ0JRmHGSEXvSasFcdJSwpXcfx
         HG5MSAugxPeplaKzuAaq9XjWBTT5jbJ5mI1wP2Fco4aC+mIQ3gVmEiU8y+lZnKG3Dd9p
         eUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VB+ydqC6x+W2beY4kJQID1z9belHzK/vT02swyOMUnI=;
        b=eWTkL1dhhDKBWzc73uVeb5K4cqQAEQDikJvM2PVke37wFRP5MF7D6UGkADMwrOfWUm
         plA+q3ERqWrYSYP5HHgfP5gudKgOEyTsqM3hXUppuinRdtsLvzNrWraqzkLb3lV90qih
         kK5l4UqDixMEW+aEWjToL7pmoD7OXINbb515ZuEq8FuFLxGHCefirDPXPQjawuh0hCiy
         A6gr/xrteKVirnmUgiiRoDnr+pzotMpbZZhrh14QMRuPeebCnNKELKABsCWCUBdlnFTy
         /EDABvX5KDbpCpZiOCgRAtr0wi4PXiGuWwNjUZP2wcAciKwjIOBwOOtVW8gA0xr/33g3
         t5CQ==
X-Gm-Message-State: APjAAAWhUc43S/S6tw+LIZlJj+tJIhmKZOXl2WbwEIAMSg4wLbCjxSpz
        otDt08jumy/MY8UlIz6sXEb6AZbWaXT5PA==
X-Google-Smtp-Source: APXvYqyu7IUPXoLtzwo5VLvOVRRqu58bgCaP3IU0UgzFenTHSPzV944vD4ymuuPI4w4/lNI+Q1GTlA==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr4256239wrn.243.1572512614420;
        Thu, 31 Oct 2019 02:03:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b3sm3228352wrv.40.2019.10.31.02.03.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 02:03:33 -0700 (PDT)
Message-ID: <5dbaa365.1c69fb81.aef91.1f39@mx.google.com>
Date:   Thu, 31 Oct 2019 02:03:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191031
X-Kernelci-Report-Type: build
Subject: next/master build: 216 builds: 4 failed, 212 passed, 19 errors,
 277 warnings (next-20191031)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 4 failed, 212 passed, 19 errors, 277 warning=
s (next-20191031)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191031/

Tree: next
Branch: master
Git Describe: next-20191031
Git Commit: 49afce6d47fe05ee01f1a41129b835fe4cca7eea
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL
    bcm2835_defconfig: (gcc-8) FAIL
    multi_v7_defconfig+kselftest: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 48 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 6 errors
    bcm2835_defconfig (gcc-8): 3 errors
    eseries_pxa_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 6 errors, 29 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 31 warnings

mips:
    32r2el_defconfig (gcc-8): 31 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 3 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 4 warnings
    rbtx49xx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 31 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 29 warnings

Errors summary:

    1    trace_preemptirq.c:(.text+0xd14): undefined reference to `return_a=
ddress'
    1    trace_preemptirq.c:(.text+0x710): undefined reference to `return_a=
ddress'
    1    trace_preemptirq.c:(.text+0x470): undefined reference to `return_a=
ddress'
    1    trace_preemptirq.c:(.text+0x2a8): undefined reference to `return_a=
ddress'
    1    trace_irqsoff.c:(.text+0xa70): undefined reference to `return_addr=
ess'
    1    trace_irqsoff.c:(.text+0x7a8): undefined reference to `return_addr=
ess'
    1    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    1    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'
    1    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0xda0): undefine=
d reference to `return_address'
    1    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0xb10): undefine=
d reference to `return_address'
    1    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0x49c): undefine=
d reference to `return_address'
    1    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0x2e4): undefine=
d reference to `return_address'
    1    arm-linux-gnueabihf-ld: kernel/trace/trace_irqsoff.o:trace_irqsoff=
.c:(.text+0xee4): more undefined references to `return_address' follow
    1    arm-linux-gnueabihf-ld: kernel/trace/trace_irqsoff.o:trace_irqsoff=
.c:(.text+0x27d4): more undefined references to `return_address' follow
    1    arm-linux-gnueabihf-ld: /home/buildslave/workspace/kernel-build/li=
nux/build/../kernel/trace/trace_sched_wakeup.c:596: undefined reference to =
`return_address'
    1    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trac=
e/trace_sched_wakeup.c:596: undefined reference to `return_address'
    1    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trac=
e/trace_sched_wakeup.c:476: undefined reference to `return_address'

Warnings summary:

    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   1 warning generated.
    6    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e100=
0e_s0ix_exit_flow' defined but not used [-Wunused-function]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e100=
0e_s0ix_entry_flow' defined but not used [-Wunused-function]
    6    2 warnings generated.
    3    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    3    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 5 has type 'unsigned int' [-=
Wformat=3D]
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
    1    drivers/net/wireless/realtek/rtw88/phy.c:2074:55: warning: address=
 of array 'swing_table->p' will always evaluate to 'true' [-Wpointer-bool-c=
onversion]
    1    drivers/net/wireless/realtek/rtw88/phy.c:2074:36: warning: address=
 of array 'swing_table->n' will always evaluate to 'true' [-Wpointer-bool-c=
onversion]
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
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:25: warning: variable 'cfg=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:20: warning: variable 'cmd=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    WARNING: unmet direct dependencies detected for FSL_RCPM
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.splU4w1k0v:7987:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.splU4w1k0v:7970:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.splU4w1k0v:7969:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.splU4w1k0v:7965:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.splU4w1k0v:7945:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.splU4w1k0v:7939:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.splU4w1k0v:7930:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.splU4w1k0v:7928:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.splU4w1k0v:7927:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.splU4w1k0v:7926:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.splU4w1k0v:7924:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.splU4w1k0v:7923:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.splU4w1k0v:7920:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.splU4w1k0v:7913:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.splU4w1k0v:7903:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.splU4w1k0v:7892:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.splU4w1k0v:7784:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.splU4w1k0v:7780:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.splU4w1k0v:7754:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.splU4w1k0v:7733:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.splU4w1k0v:7725:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.splU4w1k0v:7721:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.splU4w1k0v:7666:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.splU4w1k0v:7665:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.splU4w1k0v:7661:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.splU4w1k0v:7660:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.splU4w1k0v:7658:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.splU4w1k0v:7657:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.splU4w1k0v:7654:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ba6id5KDSu:3995:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ba6id5KDSu:3978:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ba6id5KDSu:3977:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ba6id5KDSu:3973:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ba6id5KDSu:3953:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ba6id5KDSu:3947:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ba6id5KDSu:3938:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ba6id5KDSu:3936:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ba6id5KDSu:3935:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ba6id5KDSu:3934:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ba6id5KDSu:3932:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ba6id5KDSu:3931:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ba6id5KDSu:3928:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ba6id5KDSu:3921:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ba6id5KDSu:3911:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ba6id5KDSu:3900:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ba6id5KDSu:3792:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ba6id5KDSu:3788:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ba6id5KDSu:3762:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ba6id5KDSu:3741:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ba6id5KDSu:3733:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.ba6id5KDSu:3729:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.ba6id5KDSu:3674:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ba6id5KDSu:3673:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ba6id5KDSu:3669:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ba6id5KDSu:3668:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ba6id5KDSu:3666:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ba6id5KDSu:3665:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ba6id5KDSu:3662:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aZ1oqzw4pd:3380:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aZ1oqzw4pd:3363:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aZ1oqzw4pd:3362:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.aZ1oqzw4pd:3358:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.aZ1oqzw4pd:3338:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.aZ1oqzw4pd:3332:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.aZ1oqzw4pd:3323:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.aZ1oqzw4pd:3321:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aZ1oqzw4pd:3320:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.aZ1oqzw4pd:3319:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.aZ1oqzw4pd:3317:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.aZ1oqzw4pd:3316:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.aZ1oqzw4pd:3313:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aZ1oqzw4pd:3306:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aZ1oqzw4pd:3296:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.aZ1oqzw4pd:3285:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aZ1oqzw4pd:3177:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.aZ1oqzw4pd:3173:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aZ1oqzw4pd:3147:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.aZ1oqzw4pd:3126:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aZ1oqzw4pd:3118:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.aZ1oqzw4pd:3114:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.aZ1oqzw4pd:3059:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.aZ1oqzw4pd:3058:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.aZ1oqzw4pd:3054:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.aZ1oqzw4pd:3053:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.aZ1oqzw4pd:3051:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.aZ1oqzw4pd:3050:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.aZ1oqzw4pd:3047:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ROAP1GT9JN:8597:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ROAP1GT9JN:8580:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ROAP1GT9JN:8579:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ROAP1GT9JN:8575:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ROAP1GT9JN:8555:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ROAP1GT9JN:8549:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ROAP1GT9JN:8540:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ROAP1GT9JN:8538:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ROAP1GT9JN:8537:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ROAP1GT9JN:8536:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ROAP1GT9JN:8534:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ROAP1GT9JN:8533:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ROAP1GT9JN:8530:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ROAP1GT9JN:8523:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ROAP1GT9JN:8513:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ROAP1GT9JN:8502:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ROAP1GT9JN:8394:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ROAP1GT9JN:8390:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ROAP1GT9JN:8364:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ROAP1GT9JN:8343:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ROAP1GT9JN:8335:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.ROAP1GT9JN:8331:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.ROAP1GT9JN:8276:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ROAP1GT9JN:8275:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ROAP1GT9JN:8271:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ROAP1GT9JN:8270:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ROAP1GT9JN:8268:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ROAP1GT9JN:8267:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ROAP1GT9JN:8264:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EhvFnj8w1Q:4900:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EhvFnj8w1Q:4883:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EhvFnj8w1Q:4882:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.EhvFnj8w1Q:4878:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.EhvFnj8w1Q:4858:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.EhvFnj8w1Q:4852:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.EhvFnj8w1Q:4843:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.EhvFnj8w1Q:4841:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EhvFnj8w1Q:4840:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.EhvFnj8w1Q:4839:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.EhvFnj8w1Q:4837:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.EhvFnj8w1Q:4836:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.EhvFnj8w1Q:4833:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EhvFnj8w1Q:4826:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EhvFnj8w1Q:4816:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.EhvFnj8w1Q:4805:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EhvFnj8w1Q:4697:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.EhvFnj8w1Q:4693:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EhvFnj8w1Q:4667:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.EhvFnj8w1Q:4646:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EhvFnj8w1Q:4638:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.EhvFnj8w1Q:4634:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.EhvFnj8w1Q:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.EhvFnj8w1Q:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.EhvFnj8w1Q:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.EhvFnj8w1Q:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.EhvFnj8w1Q:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.EhvFnj8w1Q:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.EhvFnj8w1Q:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7ZxsmYxbNe:4837:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7ZxsmYxbNe:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7ZxsmYxbNe:4819:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7ZxsmYxbNe:4815:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7ZxsmYxbNe:4795:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7ZxsmYxbNe:4789:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7ZxsmYxbNe:4780:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7ZxsmYxbNe:4778:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7ZxsmYxbNe:4777:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7ZxsmYxbNe:4776:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7ZxsmYxbNe:4774:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7ZxsmYxbNe:4773:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7ZxsmYxbNe:4770:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7ZxsmYxbNe:4763:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7ZxsmYxbNe:4753:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7ZxsmYxbNe:4742:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7ZxsmYxbNe:4634:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7ZxsmYxbNe:4630:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7ZxsmYxbNe:4604:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7ZxsmYxbNe:4583:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7ZxsmYxbNe:4575:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.7ZxsmYxbNe:4571:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.7ZxsmYxbNe:4516:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7ZxsmYxbNe:4515:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7ZxsmYxbNe:4511:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7ZxsmYxbNe:4510:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7ZxsmYxbNe:4508:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7ZxsmYxbNe:4507:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7ZxsmYxbNe:4504:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 31 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.ba6id5KDSu:3662:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ba6id5KDSu:3665:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ba6id5KDSu:3666:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ba6id5KDSu:3668:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ba6id5KDSu:3669:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ba6id5KDSu:3673:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ba6id5KDSu:3674:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ba6id5KDSu:3729:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.ba6id5KDSu:3733:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.ba6id5KDSu:3741:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ba6id5KDSu:3762:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ba6id5KDSu:3788:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ba6id5KDSu:3792:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ba6id5KDSu:3900:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ba6id5KDSu:3911:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ba6id5KDSu:3921:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ba6id5KDSu:3928:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ba6id5KDSu:3931:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ba6id5KDSu:3932:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ba6id5KDSu:3934:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ba6id5KDSu:3935:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ba6id5KDSu:3936:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ba6id5KDSu:3938:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ba6id5KDSu:3947:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ba6id5KDSu:3953:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ba6id5KDSu:3973:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ba6id5KDSu:3977:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ba6id5KDSu:3978:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ba6id5KDSu:3995:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 section m=
ismatches

Errors:
    trace_preemptirq.c:(.text+0x710): undefined reference to `return_addres=
s'
    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0xb10): undefined ref=
erence to `return_address'
    trace_preemptirq.c:(.text+0xd14): undefined reference to `return_addres=
s'
    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0xda0): undefined ref=
erence to `return_address'
    trace_irqsoff.c:(.text+0xa70): undefined reference to `return_address'
    arm-linux-gnueabihf-ld: kernel/trace/trace_irqsoff.o:trace_irqsoff.c:(.=
text+0x27d4): more undefined references to `return_address' follow

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 48 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
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
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:20: warning: variable 'cmd' is =
uninitialized when used within its own initialization [-Wuninitialized]
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:25: warning: variable 'cfg' is =
uninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
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
    drivers/net/wireless/realtek/rtw88/phy.c:2074:36: warning: address of a=
rray 'swing_table->n' will always evaluate to 'true' [-Wpointer-bool-conver=
sion]
    drivers/net/wireless/realtek/rtw88/phy.c:2074:55: warning: address of a=
rray 'swing_table->p' will always evaluate to 'true' [-Wpointer-bool-conver=
sion]
    2 warnings generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: unmet direct dependencies detected for FSL_RCPM

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

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
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trace/tra=
ce_sched_wakeup.c:596: undefined reference to `return_address'
    arm-linux-gnueabihf-ld: /home/buildslave/workspace/kernel-build/linux/b=
uild/../kernel/trace/trace_sched_wakeup.c:596: undefined reference to `retu=
rn_address'
    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trace/tra=
ce_sched_wakeup.c:476: undefined reference to `return_address'

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 3 warnings,=
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
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

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
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 31 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.aZ1oqzw4pd:3047:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aZ1oqzw4pd:3050:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.aZ1oqzw4pd:3051:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.aZ1oqzw4pd:3053:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.aZ1oqzw4pd:3054:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.aZ1oqzw4pd:3058:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.aZ1oqzw4pd:3059:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.aZ1oqzw4pd:3114:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.aZ1oqzw4pd:3118:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.aZ1oqzw4pd:3126:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aZ1oqzw4pd:3147:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.aZ1oqzw4pd:3173:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aZ1oqzw4pd:3177:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.aZ1oqzw4pd:3285:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aZ1oqzw4pd:3296:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.aZ1oqzw4pd:3306:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aZ1oqzw4pd:3313:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aZ1oqzw4pd:3316:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.aZ1oqzw4pd:3317:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.aZ1oqzw4pd:3319:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.aZ1oqzw4pd:3320:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.aZ1oqzw4pd:3321:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aZ1oqzw4pd:3323:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.aZ1oqzw4pd:3332:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.aZ1oqzw4pd:3338:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.aZ1oqzw4pd:3358:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.aZ1oqzw4pd:3362:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.aZ1oqzw4pd:3363:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aZ1oqzw4pd:3380:warning: override: reassigning to symbol =
USER_NS
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.splU4w1k0v:7654:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.splU4w1k0v:7657:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.splU4w1k0v:7658:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.splU4w1k0v:7660:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.splU4w1k0v:7661:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.splU4w1k0v:7665:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.splU4w1k0v:7666:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.splU4w1k0v:7721:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.splU4w1k0v:7725:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.splU4w1k0v:7733:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.splU4w1k0v:7754:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.splU4w1k0v:7780:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.splU4w1k0v:7784:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.splU4w1k0v:7892:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.splU4w1k0v:7903:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.splU4w1k0v:7913:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.splU4w1k0v:7920:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.splU4w1k0v:7923:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.splU4w1k0v:7924:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.splU4w1k0v:7926:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.splU4w1k0v:7927:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.splU4w1k0v:7928:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.splU4w1k0v:7930:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.splU4w1k0v:7939:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.splU4w1k0v:7945:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.splU4w1k0v:7965:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.splU4w1k0v:7969:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.splU4w1k0v:7970:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.splU4w1k0v:7987:warning: override: reassigning to symbol =
USER_NS

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
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
    ./.tmp.config.7ZxsmYxbNe:4504:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7ZxsmYxbNe:4507:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7ZxsmYxbNe:4508:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7ZxsmYxbNe:4510:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7ZxsmYxbNe:4511:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7ZxsmYxbNe:4515:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7ZxsmYxbNe:4516:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7ZxsmYxbNe:4571:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.7ZxsmYxbNe:4575:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.7ZxsmYxbNe:4583:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7ZxsmYxbNe:4604:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7ZxsmYxbNe:4630:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7ZxsmYxbNe:4634:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7ZxsmYxbNe:4742:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7ZxsmYxbNe:4753:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7ZxsmYxbNe:4763:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7ZxsmYxbNe:4770:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7ZxsmYxbNe:4773:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7ZxsmYxbNe:4774:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7ZxsmYxbNe:4776:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7ZxsmYxbNe:4777:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7ZxsmYxbNe:4778:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7ZxsmYxbNe:4780:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7ZxsmYxbNe:4789:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7ZxsmYxbNe:4795:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7ZxsmYxbNe:4815:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7ZxsmYxbNe:4819:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7ZxsmYxbNe:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7ZxsmYxbNe:4837:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

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
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 29 warn=
ings, 0 section mismatches

Errors:
    trace_preemptirq.c:(.text+0x2a8): undefined reference to `return_addres=
s'
    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0x2e4): undefined ref=
erence to `return_address'
    trace_preemptirq.c:(.text+0x470): undefined reference to `return_addres=
s'
    arm-linux-gnueabihf-ld: trace_preemptirq.c:(.text+0x49c): undefined ref=
erence to `return_address'
    trace_irqsoff.c:(.text+0x7a8): undefined reference to `return_address'
    arm-linux-gnueabihf-ld: kernel/trace/trace_irqsoff.o:trace_irqsoff.c:(.=
text+0xee4): more undefined references to `return_address' follow

Warnings:
    ./.tmp.config.ROAP1GT9JN:8264:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ROAP1GT9JN:8267:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ROAP1GT9JN:8268:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ROAP1GT9JN:8270:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ROAP1GT9JN:8271:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ROAP1GT9JN:8275:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ROAP1GT9JN:8276:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ROAP1GT9JN:8331:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.ROAP1GT9JN:8335:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.ROAP1GT9JN:8343:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ROAP1GT9JN:8364:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ROAP1GT9JN:8390:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ROAP1GT9JN:8394:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ROAP1GT9JN:8502:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ROAP1GT9JN:8513:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ROAP1GT9JN:8523:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ROAP1GT9JN:8530:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ROAP1GT9JN:8533:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ROAP1GT9JN:8534:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ROAP1GT9JN:8536:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ROAP1GT9JN:8537:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ROAP1GT9JN:8538:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ROAP1GT9JN:8540:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ROAP1GT9JN:8549:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ROAP1GT9JN:8555:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ROAP1GT9JN:8575:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ROAP1GT9JN:8579:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ROAP1GT9JN:8580:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ROAP1GT9JN:8597:warning: override: reassigning to symbol =
USER_NS

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

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
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    .config:1165:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 29 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.EhvFnj8w1Q:4567:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EhvFnj8w1Q:4570:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.EhvFnj8w1Q:4571:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.EhvFnj8w1Q:4573:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.EhvFnj8w1Q:4574:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.EhvFnj8w1Q:4578:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.EhvFnj8w1Q:4579:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.EhvFnj8w1Q:4634:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.EhvFnj8w1Q:4638:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.EhvFnj8w1Q:4646:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EhvFnj8w1Q:4667:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.EhvFnj8w1Q:4693:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EhvFnj8w1Q:4697:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.EhvFnj8w1Q:4805:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EhvFnj8w1Q:4816:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.EhvFnj8w1Q:4826:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EhvFnj8w1Q:4833:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EhvFnj8w1Q:4836:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.EhvFnj8w1Q:4837:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.EhvFnj8w1Q:4839:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.EhvFnj8w1Q:4840:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.EhvFnj8w1Q:4841:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EhvFnj8w1Q:4843:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.EhvFnj8w1Q:4852:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.EhvFnj8w1Q:4858:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.EhvFnj8w1Q:4878:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.EhvFnj8w1Q:4882:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.EhvFnj8w1Q:4883:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EhvFnj8w1Q:4900:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
