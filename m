Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA7A306399
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 19:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhA0SxE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 13:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhA0SxB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 13:53:01 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF93C061574
        for <linux-next@vger.kernel.org>; Wed, 27 Jan 2021 10:52:21 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id g3so1559325plp.2
        for <linux-next@vger.kernel.org>; Wed, 27 Jan 2021 10:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6jwNs3t49b2ol92vLDlDwF8DFpZVVQhLbQmD41TU0to=;
        b=n+ax8a6AovxNqupQl/SwA1h8t/zpHWNgr3wim5AZPfyuS8qubqPU1qnaVOo73HxICA
         QV1eN8vOqqdG3iRZ2pjpgkLmSBQG1QAYpGYa7TXkV1HdGTpNhtGVs8aAJlUZL9E810rB
         eEkdMeIBLqeps293En3/isC6dySfmudSfbZI6ZkcL7PFzQobrBbRNf3qe3E/ivSSWoti
         yWb3aaOnud+1vq23mfg0zZl0R+HuKGu8Q3dNnJyjfM3fFu6dlfr2zDY4aWxOPDM0SDF1
         mn6502wMjH2hNlsyGDhEstDFprRoghMg1IAGqVkVPakwKqvFFu9LGiB1oueAsN5sD2tQ
         mGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6jwNs3t49b2ol92vLDlDwF8DFpZVVQhLbQmD41TU0to=;
        b=VFyvl9LEs9a0H3WU+bSHKMfX/t15Xvqm4G6KRWeo43aNOLM/K7tWPfzbQAO8x1uQbF
         7nwRM9+J2nXxzwNDpfGgTV0Y2YzCkyO2fiK9CNZCdF5KO9amubpqhOfh0TUiOOTLhBfc
         CiGxAKI9iDFBML1upIsjBjOBzBWbpSo+7Fioh7B7axRH2JTVOYunHytrR6SAVRLnKQX2
         XK8mFYq0W8ln/9f1s9HUFY1U1Ztq+xbOTiRjg1x42kKNrarrJbVZypKdZz2h9jIcZ6HO
         64EIl4BRFpslKFzN/0zcjatwAPF2t/SKcooFsdZSIb/abBoRdwfWVqzLfOVXkKO5jm7I
         J8FQ==
X-Gm-Message-State: AOAM531ssNv4twIpioJs9aacrkUVRdYFUHVqxNNAUpxY7BDxtF4RT+R2
        /Xq7ahDiHsWuCdG8skxPG0cP2Ib9NZ9wjcgR
X-Google-Smtp-Source: ABdhPJxRRk265BjYXg3zOR3FjPKU/Veexldmvwu9apgLvJ25Jom5H4IudzV1cI3UKX+0s/xpKtmREg==
X-Received: by 2002:a17:902:b496:b029:da:d356:be8c with SMTP id y22-20020a170902b496b02900dad356be8cmr12873102plr.56.1611773537413;
        Wed, 27 Jan 2021 10:52:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z15sm3229140pfr.89.2021.01.27.10.52.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:52:16 -0800 (PST)
Message-ID: <6011b660.1c69fb81.d112a.76b5@mx.google.com>
Date:   Wed, 27 Jan 2021 10:52:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210127
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 225 builds: 6 failed, 219 passed, 19 errors,
 685 warnings (next-20210127)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 225 builds: 6 failed, 219 passed, 19 errors, 685 warning=
s (next-20210127)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210127/

Tree: next
Branch: master
Git Describe: next-20210127
Git Commit: b28241d8a5fa9c5ee743973ace171792138a43e7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL

arm:
    aspeed_g5_defconfig: (clang-10) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-11): 1 error
    allmodconfig (clang-10): 1 error
    allmodconfig (gcc-8): 77 warnings
    defconfig (clang-10): 29 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 28 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 29 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 29 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 error
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 28 warnings

arm:
    allmodconfig (clang-10): 66 warnings
    allmodconfig (gcc-8): 80 warnings
    allmodconfig (clang-11): 64 warnings
    aspeed_g5_defconfig (clang-10): 12 errors
    axm55xx_defconfig (gcc-8): 4 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings

i386:

mips:
    db1xxx_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 30 warnings
    jazz_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 30 warnings
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 1 warning
    malta_kvm_defconfig (gcc-8): 1 warning
    malta_kvm_guest_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 1 warning
    maltasmvp_defconfig (gcc-8): 1 warning
    maltasmvp_eva_defconfig (gcc-8): 1 warning
    maltaup_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 29 warnings
    nlm_xlr_defconfig (gcc-8): 29 warnings
    pic32mzda_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (clang-10): 2 errors, 3 warnings
    allmodconfig (gcc-8): 82 warnings
    allmodconfig (clang-11): 2 errors, 6 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-11): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    2    ld.lld: error: undefined symbol: __compiletime_assert_420
    2    ld.lld: error: undefined symbol: __compiletime_assert_1282
    2    ld.lld: error: undefined symbol: __compiletime_assert_1276
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3769C): reloca=
tion R_ARM_PREL31 out of range: 2135589532 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375FC): reloca=
tion R_ARM_PREL31 out of range: 2135589692 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375EC): reloca=
tion R_ARM_PREL31 out of range: 2135589708 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3759C): reloca=
tion R_ARM_PREL31 out of range: 2135589788 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3758C): reloca=
tion R_ARM_PREL31 out of range: 2135589804 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37574): reloca=
tion R_ARM_PREL31 out of range: 2135589828 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3755C): reloca=
tion R_ARM_PREL31 out of range: 2135589852 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3752C): reloca=
tion R_ARM_PREL31 out of range: 2135589900 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374FC): reloca=
tion R_ARM_PREL31 out of range: 2135589948 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374BC): reloca=
tion R_ARM_PREL31 out of range: 2135590012 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374A4): reloca=
tion R_ARM_PREL31 out of range: 2135590036 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34E88): reloca=
tion R_ARM_PREL31 out of range: 2135534256 is not in [-1073741824, 10737418=
23]
    1    error: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o: assertion elf.ehdr-=
>e_ident[5] =3D=3D 1 failed (lhs=3D2, rhs=3D1, line=3D250)

Warnings summary:

    25   1 warning generated.
    20   fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=
=80=99 [-Wunused-variable]
    14   fs/btrfs/space-info.c:572: warning: expecting prototype for Possib=
ly commit the transaction if its ok to(). Prototype was for may_commit_tran=
saction() instead
    14   fs/btrfs/space-info.c:1640: warning: expecting prototype for Try t=
o reserve data bytes for an allocation(). Prototype was for btrfs_reserve_d=
ata_bytes() instead
    14   fs/btrfs/space-info.c:1604: warning: expecting prototype for s spa=
ce(). Prototype was for btrfs_reserve_metadata_bytes() instead
    14   fs/btrfs/space-info.c:1478: warning: expecting prototype for s spa=
ce(). Prototype was for __reserve_bytes() instead
    14   fs/btrfs/space-info.c:1373: warning: expecting prototype for Do th=
e appropriate flushing and waiting for a ticket(). Prototype was for handle=
_reserve_ticket() instead
    14   fs/btrfs/space-info.c:1373: warning: Function parameter or member =
'start_ns' not described in 'handle_reserve_ticket'
    14   fs/btrfs/space-info.c:1373: warning: Function parameter or member =
'orig_bytes' not described in 'handle_reserve_ticket'
    14   fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for f=
lushing all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs(=
) instead
    14   fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for=
 Write out cached info to an inode(). Prototype was for __btrfs_write_out_c=
ache() instead
    14   fs/btrfs/file-item.c:82: warning: expecting prototype for Mark ran=
ge within a file as having a new extent inserted(). Prototype was for btrfs=
_inode_set_file_extent_range() instead
    14   fs/btrfs/file-item.c:44: warning: expecting prototype for s size a=
ccording to filesystem options(). Prototype was for btrfs_inode_safe_disk_i=
_size_write() instead
    14   fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on =
line:
    14   fs/btrfs/file-item.c:110: warning: expecting prototype for Marks a=
n inode range as not having a backing extent(). Prototype was for btrfs_ino=
de_clear_file_extent_range() instead
    14   fs/btrfs/extent_map.c:603: warning: expecting prototype for Add ex=
tent mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() i=
nstead
    14   fs/btrfs/extent_map.c:402: warning: expecting prototype for Add ne=
w extent map to the extent tree(). Prototype was for add_extent_mapping() i=
nstead
    14   fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on=
 line:
    14   fs/btrfs/extent_io.c:415: warning: expecting prototype for Such en=
try would have(). Prototype was for __etree_search() instead
    14   fs/btrfs/extent_io.c:1646: warning: expecting prototype for This r=
ange could start before(). Prototype was for find_first_clear_extent_bit() =
instead
    14   fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a=
 contiguous area of bits(). Prototype was for find_contiguous_extent_bit() =
instead
    14   fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find=
_next_block_group(). Prototype was for peek_discard_list() instead
    14   fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s rese=
rvation(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    14   fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refil=
l based on our delayed refs usage(). Prototype was for btrfs_delayed_refs_r=
sv_refill() instead
    14   fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Trans=
fer bytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_del=
ayed_refs_rsv() instead
    14   fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Re=
lease data and metadata space for delalloc(). Prototype was for btrfs_delal=
loc_release_space() instead
    14   fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Re=
lease a metadata reservation for an inode(). Prototype was for btrfs_delall=
oc_release_metadata() instead
    14   fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Re=
lease any excessive reservation(). Prototype was for btrfs_inode_rsv_releas=
e() instead
    14   fs/btrfs/block-group.c:1583: warning: expecting prototype for Map =
a physical disk address to a list of logical addresses(). Prototype was for=
 btrfs_rmap_block() instead
    14   fs/btrfs/backref.c:1525: warning: expecting prototype for Check if=
 an extent is shared or not(). Prototype was for btrfs_check_shared() inste=
ad
    5    2 warnings generated.
    4    fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable =E2=80=98mp=
=E2=80=99 [-Wunused-variable]
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    WARNING: unmet direct dependencies detected for NETFS_SUPPORT
    4    #warning This code requires at least version 4.6 of GCC
    3    fs/nfs/fscache.c:505:16: warning: unused variable =E2=80=98inode=
=E2=80=99 [-Wunused-variable]
    3    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.11.0-rc5-next-20210127/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    3    WARNING: unmet direct dependencies detected for DRM_I915_WERROR
    2    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 b=
ytes in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    2    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    2    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the =
frame size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    2    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warni=
ng: stack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-l=
arger-than=3D]
    2    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator '?:' has=
 lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditio=
nal-parentheses]
    2    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: note: place parentheses ar=
ound the '|' expression to silence this warning
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
    2    drivers/input/touchscreen/iqs5xx.c:866:6: warning: variable 'error=
_bl' is used uninitialized whenever 'if' condition is true [-Wsometimes-uni=
nitialized]
    2    drivers/input/touchscreen/iqs5xx.c:855:21: note: initialize the va=
riable 'error_bl' to silence this warning
    2    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2=
720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5704 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3005:6:=
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
    2    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 5 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    2    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=
=E2=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but=
 argument 4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    2    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=
=E2=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument=
 8 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    2    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=
=E2=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument=
 7 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
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
    1    net/bridge/br_netlink.c:299:1: warning: the frame size of 2072 byt=
es is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2744 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2696 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2672 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:804:1: warning: the frame size of 2416 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:804:1: warning: the frame size of 2384 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:804:1: warning: the frame size of 2160 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:787:1: warning: the frame size of 2160 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    1    lib/test_kasan.c:787:1: warning: the frame size of 2128 bytes is l=
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
    1    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame si=
ze of 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2756:1: warning: t=
he frame size of 2504 bytes is larger than 2048 bytes [-Wframe-larger-than=
=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1848 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
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
    1    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2120 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2088 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2080 by=
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
    1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2104 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size =
of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
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
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2152 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the =
frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
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
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1272 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    arch/x86/kvm/x86.c:5034:1: warning: the frame size of 2096 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/x86/kernel/cpu/mshyperv.c:385:1: warning: the frame size of 2=
856 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    /tmp/test-arm-724f4a.s:18794: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-724f4a.s:18719: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-1f7c16.s:18792: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-1f7c16.s:18717: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccjXe6Fm.s:18195: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccjXe6Fm.s:18123: Warning: using r15 results in unpredictable=
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
    1    ./include/linux/kern_levels.h:5:18: warning: too many arguments fo=
r format [-Wformat-extra-args]

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
allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_420

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_420

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1276
    ld.lld: error: undefined symbol: __compiletime_assert_1282

Warnings:
    WARNING: unmet direct dependencies detected for DRM_I915_WERROR
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3ce: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call to __u=
bsan_handle_add_overflow() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 66 warnings, 0 secti=
on mismatches

Warnings:
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-724f4a.s:18719: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-724f4a.s:18794: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1272 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator '?:' has lowe=
r precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-p=
arentheses]
    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: note: place parentheses around =
the '|' expression to silence this warning
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
848 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/input/touchscreen/iqs5xx.c:866:6: warning: variable 'error_bl' =
is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitia=
lized]
    drivers/input/touchscreen/iqs5xx.c:855:21: note: initialize the variabl=
e 'error_bl' to silence this warning
    1 warning generated.
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3005:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame size of=
 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 bytes =
in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 82 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: unmet direct dependencies detected for DRM_I915_WERROR
    arch/x86/kernel/cpu/mshyperv.c:385:1: warning: the frame size of 2856 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    ./include/linux/kern_levels.h:5:18: warning: too many arguments for for=
mat [-Wformat-extra-args]
    arch/x86/kvm/x86.c:5034:1: warning: the frame size of 2096 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2384 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:787:1: warning: the frame size of 2128 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:804:1: warning: the frame size of 2384 bytes is larger=
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
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2720 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size of 206=
4 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 20=
80 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3152 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3128 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2832 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2448 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3952 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the frame s=
ize of 2112 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2696 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4216 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2088 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2472 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4040 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2072 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2112 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    net/caif/cfctrl.c:549:1: warning: the frame size of 2592 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2616 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2224 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    drivers/media/dvb-frontends/stv090x.c:2496:1: warning: the frame size o=
f 2328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:1842:1: warning: the frame size o=
f 3016 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/super.c:1197:1: warning: the frame size of 3176 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/media/dvb-frontends/stv090x.c:1152:1: warning: the frame size o=
f 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/stv090x.c:3078:1: warning: the frame size o=
f 5888 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    drivers/media/dvb-frontends/stv090x.c:3419:1: warning: the frame size o=
f 5280 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2336 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3296 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame size=
 of 2720 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame size=
 of 2784 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2360 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:2756:1: warning: the fr=
ame size of 2504 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 77 warnings, 0 sectio=
n mismatches

Warnings:
    lib/crypto/curve25519-hacl64.c:601:1: warning: the frame size of 2112 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:787:1: warning: the frame size of 2160 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/test_kasan.c:804:1: warning: the frame size of 2416 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2720 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1969:1: warning: the frame size of 2208 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:7349:1: warning: the frame size of 2256 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2787:1: warning: the frame size of 5360 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2096 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5962:1: warning: the frame size of 2912 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/dlm/dlmrecovery.c:737:1: warning: the frame size of 2112 bytes=
 is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 21=
12 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/aops.c:1884:1: warning: the frame size of 2128 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/ocfs2/namei.c:2072:1: warning: the frame size of 2064 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2592 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/ocfs2/super.c:1197:1: warning: the frame size of 3184 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2368 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2672 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3168 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3136 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2544 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable =E2=80=98mp=E2=80=
=99 [-Wunused-variable]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2464 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4224 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2656 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3968 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2832 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2080 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4176 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    net/caif/cfctrl.c:549:1: warning: the frame size of 2624 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2256 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
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

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1276
    ld.lld: error: undefined symbol: __compiletime_assert_1282

Warnings:
    WARNING: unmet direct dependencies detected for DRM_I915_WERROR
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x13c: c=
all to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf2: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 80 warnings, 0 section =
mismatches

Warnings:
    net/ipv4/tcp.c:3893:1: warning: the frame size of 2056 bytes is larger =
than 2048 bytes [-Wframe-larger-than=3D]
    /tmp/ccjXe6Fm.s:18123: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccjXe6Fm.s:18195: Warning: using r15 results in unpredictable beha=
viour
    lib/test_kasan.c:804:1: warning: the frame size of 2160 bytes is larger=
 than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:1969:1: warning: the frame size of 2248 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:2787:1: warning: the frame size of 5248 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:7349:1: warning: the frame size of 2272 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    net/wireless/nl80211.c:5962:1: warning: the frame size of 2872 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    lib/bitfield_kunit.c:93:1: warning: the frame size of 11296 bytes is la=
rger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:1646:1: warning: the frame size of 2744 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    net/bridge/br_netlink.c:299:1: warning: the frame size of 2072 bytes is=
 larger than 2048 bytes [-Wframe-larger-than=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 7 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 8 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 5 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]
    drivers/gpu/drm/tiny/ili9225.c:281:1: warning: the frame size of 2768 b=
ytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/bridge/tc358768.c:843:1: warning: the frame size of 205=
6 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/gpu/drm/panel/panel-sitronix-st7701.c:195:1: warning: the frame=
 size of 2152 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    drivers/net/bonding/bond_netlink.c:685:1: warning: the frame size of 21=
04 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/ocfs2/namei.c:1694:1: warning: the frame size of 2480 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/ocfs2/super.c:1197:1: warning: the frame size of 2688 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/i2c/tvp5150.c:273:1: warning: the frame size of 3992 byte=
s is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/ocfs2/xattr.c:3678:1: warning: the frame size of 2192 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/tuners/r820t.c:1327:1: warning: the frame size of 2816 by=
tes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    drivers/net/wireguard/selftest/allowedips.c:675:1: warning: the frame s=
ize of 2088 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    net/caif/cfctrl.c:549:1: warning: the frame size of 2576 bytes is large=
r than 2048 bytes [-Wframe-larger-than=3D]
    net/ieee802154/nl802154.c:541:1: warning: the frame size of 2216 bytes =
is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/usb/r8152.c:5495:1: warning: the frame size of 2120 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/pci/saa7134/saa7134-cards.c:8074:1: warning: the frame si=
ze of 2144 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/macsec.c:3252:1: warning: the frame size of 4080 bytes is l=
arger than 2048 bytes [-Wframe-larger-than=3D]
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
    drivers/media/dvb-frontends/stv0367.c:1902:1: warning: the frame size o=
f 3328 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3640:1: warning: the frame size=
 of 2816 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/media/dvb-frontends/cxd2841er.c:3124:1: warning: the frame size=
 of 2768 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16552:1: w=
arning: the frame size of 3256 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:16894:1: w=
arning: the frame size of 3184 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/realtek/rtl818x/rtl8180/rtl8225se.c:386:1: warning=
: the frame size of 4240 bytes is larger than 2048 bytes [-Wframe-larger-th=
an=3D]
    drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:25992:1: w=
arning: the frame size of 2480 bytes is larger than 2048 bytes [-Wframe-lar=
ger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt2500usb.c:880:1: warning: the fram=
e size of 2568 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/wireless/ralink/rt2x00/rt73usb.c:1283:1: warning: the frame=
 size of 2688 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/net/ethernet/rocker/rocker_ofdpa.c:560:1: warning: the frame si=
ze of 2400 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 64 warnings, 0 secti=
on mismatches

Warnings:
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-1f7c16.s:18717: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-1f7c16.s:18792: Warning: using r15 results in unpredictab=
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
    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: warning: operator '?:' has lowe=
r precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-p=
arentheses]
    drivers/misc/bcm-vk/bcm_vk_msg.c:56:35: note: place parentheses around =
the '|' expression to silence this warning
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/input/touchscreen/iqs5xx.c:866:6: warning: variable 'error_bl' =
is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitia=
lized]
    drivers/input/touchscreen/iqs5xx.c:855:21: note: initialize the variabl=
e 'error_bl' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3005:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 bytes =
in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 12 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34E88): relocation =
R_ARM_PREL31 out of range: 2135534256 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374A4): relocation =
R_ARM_PREL31 out of range: 2135590036 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374BC): relocation =
R_ARM_PREL31 out of range: 2135590012 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x374FC): relocation =
R_ARM_PREL31 out of range: 2135589948 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3752C): relocation =
R_ARM_PREL31 out of range: 2135589900 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3755C): relocation =
R_ARM_PREL31 out of range: 2135589852 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37574): relocation =
R_ARM_PREL31 out of range: 2135589828 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3758C): relocation =
R_ARM_PREL31 out of range: 2135589804 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3759C): relocation =
R_ARM_PREL31 out of range: 2135589788 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375EC): relocation =
R_ARM_PREL31 out of range: 2135589708 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x375FC): relocation =
R_ARM_PREL31 out of range: 2135589692 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3769C): relocation =
R_ARM_PREL31 out of range: 2135589532 is not in [-1073741824, 1073741823]

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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 7 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 8 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]
    ./include/linux/kern_levels.h:17:22: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 5 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: unmet direct dependencies detected for NETFS_SUPPORT
    WARNING: unmet direct dependencies detected for NETFS_SUPPORT

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 29 warnings, 0 sectio=
n mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc5-next-20210127/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 28 warnings, 0 section mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 29 warnings, 0 section mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc5-next-20210127/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 29 warnings, 0 section mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc5-next-20210127/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 0 warnings, 0 section mismatches

Errors:
    error: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o: assertion elf.ehdr->e_id=
ent[5] =3D=3D 1 failed (lhs=3D2, rhs=3D1, line=3D250)

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
, 28 warnings, 0 section mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead

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
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0 secti=
on mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable =E2=80=98mp=E2=80=
=99 [-Wunused-variable]
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead

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
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0 s=
ection mismatches

Warnings:
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable =E2=80=98mp=E2=80=
=99 [-Wunused-variable]

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_ioctl32.c:441:20: warning: unused variable =E2=80=98mp=E2=80=
=99 [-Wunused-variable]

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
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0 se=
ction mismatches

Warnings:
    fs/nfs/fscache.c:505:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0 se=
ction mismatches

Warnings:
    fs/nfs/fscache.c:505:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    fs/btrfs/file-item.c:44: warning: expecting prototype for s size accord=
ing to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size=
_write() instead
    fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range wi=
thin a file as having a new extent inserted(). Prototype was for btrfs_inod=
e_set_file_extent_range() instead
    fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an ino=
de range as not having a backing extent(). Prototype was for btrfs_inode_cl=
ear_file_extent_range() instead
    fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
    fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushi=
ng all delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() ins=
tead
    fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new ext=
ent map to the extent tree(). Prototype was for add_extent_mapping() instead
    fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent =
mapping into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
    fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry w=
ould have(). Prototype was for __etree_search() instead
    fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a cont=
iguous area of bits(). Prototype was for find_contiguous_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range =
could start before(). Prototype was for find_first_clear_extent_bit() inste=
ad
    fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
    fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Writ=
e out cached info to an inode(). Prototype was for __btrfs_write_out_cache(=
) instead
    fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservati=
on(). Prototype was for btrfs_delayed_refs_rsv_release() instead
    fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer b=
ytes to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_=
refs_rsv() instead
    fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill bas=
ed on our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_re=
fill() instead
    fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an e=
xtent is shared or not(). Prototype was for btrfs_check_shared() instead
    fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly co=
mmit the transaction if its ok to(). Prototype was for may_commit_transacti=
on() instead
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'star=
t_ns' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig=
_bytes' not described in 'handle_reserve_ticket'
    fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the app=
ropriate flushing and waiting for a ticket(). Prototype was for handle_rese=
rve_ticket() instead
    fs/btrfs/space-info.c:1478: warning: expecting prototype for s space().=
 Prototype was for __reserve_bytes() instead
    fs/btrfs/space-info.c:1604: warning: expecting prototype for s space().=
 Prototype was for btrfs_reserve_metadata_bytes() instead
    fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to res=
erve data bytes for an allocation(). Prototype was for btrfs_reserve_data_b=
ytes() instead
    fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release=
 any excessive reservation(). Prototype was for btrfs_inode_rsv_release() i=
nstead
    fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release=
 a metadata reservation for an inode(). Prototype was for btrfs_delalloc_re=
lease_metadata() instead
    fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release=
 data and metadata space for delalloc(). Prototype was for btrfs_delalloc_r=
elease_space() instead
    fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next=
_block_group(). Prototype was for peek_discard_list() instead
    fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a phy=
sical disk address to a list of logical addresses(). Prototype was for btrf=
s_rmap_block() instead

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    WARNING: unmet direct dependencies detected for NETFS_SUPPORT
    WARNING: unmet direct dependencies detected for NETFS_SUPPORT

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/nfs/fscache.c:505:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/xfs/xfs_log.c:1111:16: warning: unused variable =E2=80=98log=E2=80=
=99 [-Wunused-variable]

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
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1181:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

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
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
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
