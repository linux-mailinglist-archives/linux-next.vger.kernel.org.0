Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6150DE9A7F
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 11:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3K4m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 06:56:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32904 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfJ3K4m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 06:56:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so4022626wmf.0
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2019 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aoNnm/jj5xjgxPUx6yHzkmwbGgUSjiKXsSZVhWu6RwQ=;
        b=MW9KMMjJy3oo7r6gEMloDKsTdAl3vbv+PkvrqZmLqi8QC0vct7jm1oUoU2kdRccRf/
         XmRNYyz3uRUOMgurnhQ0zn9btoiBQ3C/3qvJ/Pxlrswl8lVNXNIPSElcrd35eZz2Zz4N
         69xN+2kkcbFSsodgJf9KKNvUuv2Idfczjz0b9VekwKhHfpUz5gMyx70MMMmTzgX93QZN
         XgDoQOt8SQ3IvOqBiw26YmWcl9OeEXbu3z8aFlsUBPPN2z13e5O8rYuTuR5K51iE1/u7
         KTzRaJuHw/z08BcrTWyLGrfz+gh2kq1j7hDRv+bau8jYB49Ekwq/T+wpVR7LNRaUwwC6
         xrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aoNnm/jj5xjgxPUx6yHzkmwbGgUSjiKXsSZVhWu6RwQ=;
        b=jzrqINT6ka5zSW1dMft174LC1H8OF6wYVPI7ojeonn+enzin1tI1o1Lu958qwOj+Jk
         d4mSZ9wdeeaXhZMbBpSKz4GbuZzy4uoHbEBJ1P8PxoI55h6WT4xpoUaBdflBv9sXQrYI
         oQsD0zx3vnJpus1TtDR8Elb0r4svGVFuNGhbr4jqZBrRbwdK+VRz6tky3Em0QWrJoooL
         mZpXsQh5csnagYHzC646Tq/GT1QFB6G8HmH9PfT9oUhEs74TrQ0Zz1m8w4juU9EVYctB
         R6kRZnsQ7coBNyFrQc7KjUXDLmr7UR864Lzmcs96/AQjqLomHbClRHmSvAk0gky6iw/v
         qaOw==
X-Gm-Message-State: APjAAAVVzhkxB4SmboudPVVHiohZQRdYsQmVodjn1cXXzVmCAWbR3NR/
        3LMJwb4XC6OH5XFv/RrpTVkpUtiDavlZ0A==
X-Google-Smtp-Source: APXvYqwajuMYCRj67JlyOQpMhBrxb5ZfkLHl342t/JrLKhMUs8f51E8fQfCpW+faJqfucgB6YMZ43w==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr8223347wml.67.1572432993061;
        Wed, 30 Oct 2019 03:56:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t1sm2561978wrn.81.2019.10.30.03.56.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 03:56:32 -0700 (PDT)
Message-ID: <5db96c60.1c69fb81.c8fe.b1d8@mx.google.com>
Date:   Wed, 30 Oct 2019 03:56:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191030
X-Kernelci-Report-Type: build
Subject: next/master build: 216 builds: 5 failed, 211 passed, 20 errors,
 283 warnings (next-20191030)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 5 failed, 211 passed, 20 errors, 283 warning=
s (next-20191030)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191030/

Tree: next
Branch: master
Git Describe: next-20191030
Git Commit: fdbc6c104f956257ee41b8be7c846e6c2035291e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL
    bcm2835_defconfig: (gcc-8) FAIL
    multi_v7_defconfig+kselftest: (gcc-8) FAIL
    qcom_defconfig: (gcc-8) FAIL

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
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-8): 52 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 6 errors
    bcm2835_defconfig (gcc-8): 3 errors
    eseries_pxa_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 6 errors, 29 warnings
    qcom_defconfig (gcc-8): 1 error
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
    allmodconfig (gcc-8): 2 warnings
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
.c:(.text+0x27a8): more undefined references to `return_address' follow
    1    arm-linux-gnueabihf-ld: /home/buildslave/workspace/kernel-build/li=
nux/build/../kernel/trace/trace_sched_wakeup.c:596: undefined reference to =
`return_address'
    1    /home/buildslave/workspace/workspace/kernel-build@3/linux/build/..=
/drivers/thermal/qcom/tsens-common.c:95: undefined reference to `__aeabi_ul=
divmod'
    1    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trac=
e/trace_sched_wakeup.c:596: undefined reference to `return_address'
    1    /home/buildslave/workspace/kernel-build/linux/build/../kernel/trac=
e/trace_sched_wakeup.c:476: undefined reference to `return_address'

Warnings summary:

    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    17   1 warning generated.
    6    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e100=
0e_s0ix_exit_flow' defined but not used [-Wunused-function]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e100=
0e_s0ix_entry_flow' defined but not used [-Wunused-function]
    6    2 warnings generated.
    3    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rt=
d' [-Wunused-variable]
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
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2520:42: w=
arning: implicit conversion from enumeration type 'enum transmitter' to dif=
ferent enumeration type 'enum physical_phy_id' [-Wenum-conversion]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:25: warning: variable 'cfg=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:20: warning: variable 'cmd=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    WARNING: unmet direct dependencies detected for FSL_RCPM
    1    .config:1166:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.qxLhZL6EPk:8594:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qxLhZL6EPk:8577:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qxLhZL6EPk:8576:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.qxLhZL6EPk:8572:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.qxLhZL6EPk:8552:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.qxLhZL6EPk:8546:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.qxLhZL6EPk:8537:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.qxLhZL6EPk:8535:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qxLhZL6EPk:8534:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.qxLhZL6EPk:8533:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.qxLhZL6EPk:8531:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.qxLhZL6EPk:8530:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.qxLhZL6EPk:8527:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.qxLhZL6EPk:8520:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qxLhZL6EPk:8510:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.qxLhZL6EPk:8499:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qxLhZL6EPk:8391:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.qxLhZL6EPk:8387:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qxLhZL6EPk:8361:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.qxLhZL6EPk:8340:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qxLhZL6EPk:8332:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.qxLhZL6EPk:8328:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.qxLhZL6EPk:8273:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.qxLhZL6EPk:8272:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.qxLhZL6EPk:8268:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.qxLhZL6EPk:8267:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.qxLhZL6EPk:8265:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.qxLhZL6EPk:8264:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.qxLhZL6EPk:8261:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.hTtaPIIAlx:4838:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hTtaPIIAlx:4821:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.hTtaPIIAlx:4820:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.hTtaPIIAlx:4816:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.hTtaPIIAlx:4796:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.hTtaPIIAlx:4790:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.hTtaPIIAlx:4781:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.hTtaPIIAlx:4779:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.hTtaPIIAlx:4778:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.hTtaPIIAlx:4777:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.hTtaPIIAlx:4775:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.hTtaPIIAlx:4774:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.hTtaPIIAlx:4771:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.hTtaPIIAlx:4764:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.hTtaPIIAlx:4754:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.hTtaPIIAlx:4743:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hTtaPIIAlx:4635:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.hTtaPIIAlx:4631:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hTtaPIIAlx:4605:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.hTtaPIIAlx:4584:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.hTtaPIIAlx:4576:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.hTtaPIIAlx:4572:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.hTtaPIIAlx:4517:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.hTtaPIIAlx:4516:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.hTtaPIIAlx:4512:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.hTtaPIIAlx:4511:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.hTtaPIIAlx:4509:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.hTtaPIIAlx:4508:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.hTtaPIIAlx:4505:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.h8nD9zShJB:3996:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.h8nD9zShJB:3979:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.h8nD9zShJB:3978:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.h8nD9zShJB:3974:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.h8nD9zShJB:3954:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.h8nD9zShJB:3948:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.h8nD9zShJB:3939:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.h8nD9zShJB:3937:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.h8nD9zShJB:3936:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.h8nD9zShJB:3935:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.h8nD9zShJB:3933:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.h8nD9zShJB:3932:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.h8nD9zShJB:3929:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.h8nD9zShJB:3922:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.h8nD9zShJB:3912:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.h8nD9zShJB:3901:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.h8nD9zShJB:3793:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.h8nD9zShJB:3789:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.h8nD9zShJB:3763:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.h8nD9zShJB:3742:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.h8nD9zShJB:3734:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.h8nD9zShJB:3730:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.h8nD9zShJB:3675:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.h8nD9zShJB:3674:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.h8nD9zShJB:3670:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.h8nD9zShJB:3669:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.h8nD9zShJB:3667:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.h8nD9zShJB:3666:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.h8nD9zShJB:3663:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cxF9bqBtBM:7987:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cxF9bqBtBM:7970:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cxF9bqBtBM:7969:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.cxF9bqBtBM:7965:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.cxF9bqBtBM:7945:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.cxF9bqBtBM:7939:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.cxF9bqBtBM:7930:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.cxF9bqBtBM:7928:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cxF9bqBtBM:7927:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.cxF9bqBtBM:7926:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.cxF9bqBtBM:7924:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.cxF9bqBtBM:7923:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.cxF9bqBtBM:7920:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cxF9bqBtBM:7913:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cxF9bqBtBM:7903:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.cxF9bqBtBM:7892:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cxF9bqBtBM:7784:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.cxF9bqBtBM:7780:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cxF9bqBtBM:7754:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.cxF9bqBtBM:7733:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cxF9bqBtBM:7725:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.cxF9bqBtBM:7721:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.cxF9bqBtBM:7666:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.cxF9bqBtBM:7665:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.cxF9bqBtBM:7661:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.cxF9bqBtBM:7660:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.cxF9bqBtBM:7658:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.cxF9bqBtBM:7657:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.cxF9bqBtBM:7654:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ZI5b02XVAV:3380:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZI5b02XVAV:3363:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ZI5b02XVAV:3362:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ZI5b02XVAV:3358:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ZI5b02XVAV:3338:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ZI5b02XVAV:3332:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ZI5b02XVAV:3323:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ZI5b02XVAV:3321:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ZI5b02XVAV:3320:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ZI5b02XVAV:3319:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ZI5b02XVAV:3317:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ZI5b02XVAV:3316:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ZI5b02XVAV:3313:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ZI5b02XVAV:3306:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ZI5b02XVAV:3296:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ZI5b02XVAV:3285:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZI5b02XVAV:3177:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ZI5b02XVAV:3173:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZI5b02XVAV:3147:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ZI5b02XVAV:3126:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ZI5b02XVAV:3118:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.ZI5b02XVAV:3114:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.ZI5b02XVAV:3059:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ZI5b02XVAV:3058:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ZI5b02XVAV:3054:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ZI5b02XVAV:3053:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ZI5b02XVAV:3051:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ZI5b02XVAV:3050:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ZI5b02XVAV:3047:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Tb0g551Wca:4901:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tb0g551Wca:4884:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Tb0g551Wca:4883:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Tb0g551Wca:4879:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Tb0g551Wca:4859:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Tb0g551Wca:4853:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Tb0g551Wca:4844:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Tb0g551Wca:4842:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Tb0g551Wca:4841:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Tb0g551Wca:4840:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Tb0g551Wca:4838:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Tb0g551Wca:4837:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Tb0g551Wca:4834:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Tb0g551Wca:4827:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Tb0g551Wca:4817:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Tb0g551Wca:4806:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tb0g551Wca:4698:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Tb0g551Wca:4694:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tb0g551Wca:4668:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Tb0g551Wca:4647:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Tb0g551Wca:4639:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.Tb0g551Wca:4635:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.Tb0g551Wca:4580:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Tb0g551Wca:4579:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Tb0g551Wca:4575:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Tb0g551Wca:4574:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Tb0g551Wca:4572:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Tb0g551Wca:4571:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Tb0g551Wca:4568:warning: override: reassigning to sy=
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
    ./.tmp.config.h8nD9zShJB:3663:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.h8nD9zShJB:3666:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.h8nD9zShJB:3667:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.h8nD9zShJB:3669:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.h8nD9zShJB:3670:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.h8nD9zShJB:3674:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.h8nD9zShJB:3675:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.h8nD9zShJB:3730:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.h8nD9zShJB:3734:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.h8nD9zShJB:3742:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.h8nD9zShJB:3763:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.h8nD9zShJB:3789:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.h8nD9zShJB:3793:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.h8nD9zShJB:3901:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.h8nD9zShJB:3912:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.h8nD9zShJB:3922:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.h8nD9zShJB:3929:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.h8nD9zShJB:3932:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.h8nD9zShJB:3933:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.h8nD9zShJB:3935:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.h8nD9zShJB:3936:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.h8nD9zShJB:3937:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.h8nD9zShJB:3939:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.h8nD9zShJB:3948:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.h8nD9zShJB:3954:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.h8nD9zShJB:3974:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.h8nD9zShJB:3978:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.h8nD9zShJB:3979:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.h8nD9zShJB:3996:warning: override: reassigning to symbol =
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
text+0x27a8): more undefined references to `return_address' follow

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for FSL_RCPM
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 52 warnings, 0 sect=
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
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2520:42: warnin=
g: implicit conversion from enumeration type 'enum transmitter' to differen=
t enumeration type 'enum physical_phy_id' [-Wenum-conversion]
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
    ./.tmp.config.ZI5b02XVAV:3047:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ZI5b02XVAV:3050:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ZI5b02XVAV:3051:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ZI5b02XVAV:3053:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ZI5b02XVAV:3054:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ZI5b02XVAV:3058:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ZI5b02XVAV:3059:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ZI5b02XVAV:3114:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.ZI5b02XVAV:3118:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.ZI5b02XVAV:3126:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ZI5b02XVAV:3147:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ZI5b02XVAV:3173:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ZI5b02XVAV:3177:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ZI5b02XVAV:3285:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ZI5b02XVAV:3296:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ZI5b02XVAV:3306:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ZI5b02XVAV:3313:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ZI5b02XVAV:3316:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ZI5b02XVAV:3317:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ZI5b02XVAV:3319:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ZI5b02XVAV:3320:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ZI5b02XVAV:3321:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ZI5b02XVAV:3323:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ZI5b02XVAV:3332:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ZI5b02XVAV:3338:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ZI5b02XVAV:3358:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ZI5b02XVAV:3362:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ZI5b02XVAV:3363:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ZI5b02XVAV:3380:warning: override: reassigning to symbol =
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
    ./.tmp.config.cxF9bqBtBM:7654:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.cxF9bqBtBM:7657:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.cxF9bqBtBM:7658:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.cxF9bqBtBM:7660:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.cxF9bqBtBM:7661:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.cxF9bqBtBM:7665:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.cxF9bqBtBM:7666:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.cxF9bqBtBM:7721:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.cxF9bqBtBM:7725:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.cxF9bqBtBM:7733:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.cxF9bqBtBM:7754:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.cxF9bqBtBM:7780:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.cxF9bqBtBM:7784:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.cxF9bqBtBM:7892:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.cxF9bqBtBM:7903:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.cxF9bqBtBM:7913:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.cxF9bqBtBM:7920:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.cxF9bqBtBM:7923:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.cxF9bqBtBM:7924:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.cxF9bqBtBM:7926:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.cxF9bqBtBM:7927:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.cxF9bqBtBM:7928:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.cxF9bqBtBM:7930:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.cxF9bqBtBM:7939:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.cxF9bqBtBM:7945:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.cxF9bqBtBM:7965:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.cxF9bqBtBM:7969:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.cxF9bqBtBM:7970:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.cxF9bqBtBM:7987:warning: override: reassigning to symbol =
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
    ./.tmp.config.hTtaPIIAlx:4505:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.hTtaPIIAlx:4508:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.hTtaPIIAlx:4509:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.hTtaPIIAlx:4511:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.hTtaPIIAlx:4512:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.hTtaPIIAlx:4516:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.hTtaPIIAlx:4517:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.hTtaPIIAlx:4572:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.hTtaPIIAlx:4576:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.hTtaPIIAlx:4584:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.hTtaPIIAlx:4605:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.hTtaPIIAlx:4631:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.hTtaPIIAlx:4635:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.hTtaPIIAlx:4743:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.hTtaPIIAlx:4754:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.hTtaPIIAlx:4764:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.hTtaPIIAlx:4771:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.hTtaPIIAlx:4774:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.hTtaPIIAlx:4775:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.hTtaPIIAlx:4777:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.hTtaPIIAlx:4778:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.hTtaPIIAlx:4779:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.hTtaPIIAlx:4781:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.hTtaPIIAlx:4790:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.hTtaPIIAlx:4796:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.hTtaPIIAlx:4816:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.hTtaPIIAlx:4820:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.hTtaPIIAlx:4821:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.hTtaPIIAlx:4838:warning: override: reassigning to symbol =
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
    ./.tmp.config.qxLhZL6EPk:8261:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qxLhZL6EPk:8264:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.qxLhZL6EPk:8265:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.qxLhZL6EPk:8267:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.qxLhZL6EPk:8268:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.qxLhZL6EPk:8272:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.qxLhZL6EPk:8273:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.qxLhZL6EPk:8328:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.qxLhZL6EPk:8332:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.qxLhZL6EPk:8340:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qxLhZL6EPk:8361:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.qxLhZL6EPk:8387:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qxLhZL6EPk:8391:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.qxLhZL6EPk:8499:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qxLhZL6EPk:8510:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.qxLhZL6EPk:8520:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qxLhZL6EPk:8527:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qxLhZL6EPk:8530:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.qxLhZL6EPk:8531:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.qxLhZL6EPk:8533:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.qxLhZL6EPk:8534:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.qxLhZL6EPk:8535:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qxLhZL6EPk:8537:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.qxLhZL6EPk:8546:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.qxLhZL6EPk:8552:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.qxLhZL6EPk:8572:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.qxLhZL6EPk:8576:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.qxLhZL6EPk:8577:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qxLhZL6EPk:8594:warning: override: reassigning to symbol =
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
qcom_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build@3/linux/build/../driv=
ers/thermal/qcom/tsens-common.c:95: undefined reference to `__aeabi_uldivmo=
d'

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
    .config:1166:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.Tb0g551Wca:4568:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Tb0g551Wca:4571:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Tb0g551Wca:4572:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Tb0g551Wca:4574:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Tb0g551Wca:4575:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Tb0g551Wca:4579:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Tb0g551Wca:4580:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Tb0g551Wca:4635:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.Tb0g551Wca:4639:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.Tb0g551Wca:4647:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Tb0g551Wca:4668:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Tb0g551Wca:4694:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Tb0g551Wca:4698:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Tb0g551Wca:4806:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Tb0g551Wca:4817:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Tb0g551Wca:4827:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Tb0g551Wca:4834:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Tb0g551Wca:4837:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Tb0g551Wca:4838:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Tb0g551Wca:4840:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Tb0g551Wca:4841:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Tb0g551Wca:4842:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Tb0g551Wca:4844:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Tb0g551Wca:4853:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Tb0g551Wca:4859:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Tb0g551Wca:4879:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Tb0g551Wca:4883:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Tb0g551Wca:4884:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Tb0g551Wca:4901:warning: override: reassigning to symbol =
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
