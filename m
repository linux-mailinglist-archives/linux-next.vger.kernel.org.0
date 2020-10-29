Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543C029DC0A
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 01:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732930AbgJ2ATK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 20:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388949AbgJ2ATA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 20:19:00 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5E7C0613CF
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 17:19:00 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y14so827446pfp.13
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 17:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hL1zfVe9VmkgkKhsuoFLtJQ6k13FqeTnBUQtbfowi9A=;
        b=a2VxuSYAo0ODtPx9tCtFru3bLIeDtTQ35SoObu+dmCoslNFpBtBHDURjVN6bsZMg+S
         WQO00aQmyQoUTRCK/2Ew/ll3ArvTiou+Eh1pUpeQ9EQbF8sQwC20CCCXDHWCKEjRZq6b
         2eqVR9BQULJWqSGeluTvrVgFT0S5UFjefTuUbMS+fWJHiM6iDjA+vPRDaLCsnjdpZWsD
         MgY+YsUhgNI720nl7R0NhiTKFAxmj3BEZeQdCRgH4aK6yULxLloVdqnzUpuV39cBq3Wa
         2++LaZ1xyXZqLGfcnyRhiMuWIllXPsmDBTRq0Dlx49e+lr+ABoY6BNB9XNUy09hAxpIy
         JHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hL1zfVe9VmkgkKhsuoFLtJQ6k13FqeTnBUQtbfowi9A=;
        b=Bxw2SZ00YTiOoBU2+S49WRw/wFU1dS3XrigLmTXRJb7zIUgjEDUsxrMyazvVrvLDH2
         VxiJa7Y3ZMBoEbtybGKPiwlTCE9jIHcCS2b1W9x+147rZPyfP1K3z4kssNstyoG7l67M
         HjXLpebtA1Q0+K12STtmab9eg5z8jhnSdugO/DEB8Ie+uMUBSTZ6/o9+FQHB7htJUomh
         rUzhw+njB5xdPhCzyLzzUnPXCuGrgxfZsQSU5VW1G9Fn3wTBHsdejIRUZIvOy0kJRBSo
         TdjJcVetS5qOhLqp9K11jvnVMdnjiDjMUP62rKFcymw4ZXQ+cmwnVOnopq9HArM2JGkr
         Vmzg==
X-Gm-Message-State: AOAM531R2GuCaXCZvMmeETpU96Jzda0Mz9lYvSznCmSUFR/nJCdgwhXq
        iksv8KJEd/Fs5UvyHYas47vxs/lnRN0SQQ==
X-Google-Smtp-Source: ABdhPJysrJu/QiJNq9VhueJxxsoVdCsWmMe5pi34Gh821J6PyF9vCpCk+rAIqlsBof4LHdJvwZ8TAQ==
X-Received: by 2002:a62:7d14:0:b029:155:2add:290e with SMTP id y20-20020a627d140000b02901552add290emr1473982pfc.41.1603930737559;
        Wed, 28 Oct 2020 17:18:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d7sm515846pjx.33.2020.10.28.17.18.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 17:18:56 -0700 (PDT)
Message-ID: <5f9a0a70.1c69fb81.29566.1b5d@mx.google.com>
Date:   Wed, 28 Oct 2020 17:18:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-327-ge6d922c77db2
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 211 builds: 2 failed, 209 passed, 808 errors,
 373 warnings (v5.10-rc1-327-ge6d922c77db2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 211 builds: 2 failed, 209 passed, 808 errors, 373=
 warnings (v5.10-rc1-327-ge6d922c77db2)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.10-rc1-327-ge6d922c77db2/

Tree: next
Branch: pending-fixes
Git Describe: v5.10-rc1-327-ge6d922c77db2
Git Commit: e6d922c77db276a16f0b7933c2a9951dc9c0052c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    milbeaut_m10v_defconfig: (gcc-8) FAIL
    rpc_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 142 errors, 22 warnings

arm64:
    allmodconfig (gcc-8): 9 warnings
    defconfig (gcc-8): 8 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 8 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 8 warnings
    defconfig+kselftest (gcc-8): 125 errors, 79 warnings

arm:
    allmodconfig (gcc-8): 12 warnings
    mmp2_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 3 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 warnings
    multi_v7_defconfig+kselftest (gcc-8): 95 errors, 62 warnings
    omap1_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 3 warnings
    pxa910_defconfig (gcc-8): 3 warnings
    s5pv210_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig+kselftest (gcc-8): 97 errors, 50 warnings

mips:
    32r2el_defconfig+kselftest (gcc-8): 120 errors, 11 warnings
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 1 warning

riscv:
    defconfig+kselftest (gcc-8): 120 errors, 7 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig+kselftest (gcc-8): 109 errors, 60 warnings

Errors summary:

    126  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such =
file or directory
    56   /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h:=
 No such file or directory
    15   arc-elf32-gcc: error: unrecognized command line option =E2=80=98-p=
thread=E2=80=99
    14   /bin/sh: 3: llc: not found
    14   /bin/sh: 1: llc: not found
    14   /bin/sh: 1: clang: not found
    12   ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or direc=
tory
    8    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or dir=
ectory
    8    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or d=
irectory
    8    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such=
 file or directory
    8    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or dir=
ectory
    8    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98exit_signal=E2=80=99
    8    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98flags=E2=80=99
    8    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98pidfd=E2=80=99
    8    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98parent_tid=E2=80=99
    8    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has init=
ializer but incomplete type
    8    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 =
isn=E2=80=99t known
    8    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98exit_signal=E2=80=99
    8    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98flags=E2=80=99
    8    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98pidfd=E2=80=99
    8    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98parent_tid=E2=80=99
    8    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has init=
ializer but incomplete type
    8    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 =
isn=E2=80=99t known
    8    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    8    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    8    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    8    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98parent_tid=E2=80=99
    8    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    8    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    8    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98MEMBARRI=
ER_CMD_SHARED=E2=80=99?
    8    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPED=
ITED_RSEQ=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    8    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or di=
rectory
    8    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or direc=
tory
    8    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    8    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98exit_signal=E2=80=99
    8    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98flags=E2=80=99
    8    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 h=
as initializer but incomplete type
    8    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=
=80=99 isn=E2=80=99t known
    8    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98exit_signal=E2=80=99
    8    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98flags=E2=80=99
    8    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 h=
as initializer but incomplete type
    8    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=
=80=99 isn=E2=80=99t known
    8    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeo=
f=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    8    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98cgroup=E2=80=99
    8    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    8    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    8    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    8    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    8    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No s=
uch file or directory
    8    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h=
: No such file or directory
    6    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directo=
ry
    6    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or dire=
ctory
    6    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or dir=
ectory
    6    collect2: error: ld returned 1 exit status
    4    tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 =
undeclared (first use in this function); did you mean =E2=80=98PR_GET_DUMPA=
BLE=E2=80=99?
    4    tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98PR_GET_T=
ID_ADDRESS=E2=80=99?
    4    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or dire=
ctory
    4    posix_timers.c:10:10: fatal error: sys/time.h: No such file or dir=
ectory
    4    param_test.c:1299:21: error: =E2=80=98MEMBARRIER_CMD_REGISTER_PRIV=
ATE_EXPEDITED_RSEQ=E2=80=99 undeclared (first use in this function); did yo=
u mean =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED=E2=80=99?
    4    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98KVM_GET_=
DIRTY_LOG=E2=80=99?
    4    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98num_pages=E2=80=99
    4    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98first_page=E2=80=99
    4    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has i=
nitializer but incomplete type
    4    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98slot=E2=80=99
    4    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    4    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    4    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file =
or directory
    4    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No=
 such file or directory
    4    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such f=
ile or directory
    4    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or=
 directory
    4    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such=
 file or directory
    4    /scratch/linux/tools/testing/selftests/arm64/fp/sve-ptrace.c:321: =
undefined reference to `sve_store_patterns'
    4    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h=
: No such file or directory
    3    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or direc=
tory
    3    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directo=
ry
    3    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    2    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No suc=
h file or directory
    2    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or direct=
ory
    2    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    2    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No suc=
h file or directory
    2    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or =
directory
    2    seccomp_bpf.c:16:20: error: missing binary operator before token "=
("
    2    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    2    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directo=
ry
    2    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    2    reuseport_bpf.c:11:10: fatal error: error.h: No such file or direc=
tory
    2    regression_enomem.c:5:10: fatal error: linux/types.h: No such file=
 or directory
    2    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    2    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    2    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    2    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    2    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    2    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or direc=
tory
    2    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    2    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or di=
rectory
    2    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or dire=
ctory
    2    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or direct=
ory
    2    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    2    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or dire=
ctory
    2    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or di=
rectory
    2    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or=
 directory
    2    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrie=
r.h: No such file or directory
    2    lib/assert.c:12:10: fatal error: execinfo.h: No such file or direc=
tory
    2    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or di=
rectory
    2    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    2    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or di=
rectory
    2    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or dir=
ectory
    2    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or dir=
ectory
    2    default_file_splice_read.c:(.text+0x28): undefined reference to `s=
plice'
    2    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or =
directory
    2    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file=
 or directory
    2    clone3.c:8:10: fatal error: linux/types.h: No such file or directo=
ry
    2    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file=
 or directory
    2    breakpoint_test_arm64.c:179:25: error: =E2=80=98TRAP_HWBKPT=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98TRAP_BRK=
PT=E2=80=99?
    2    /usr/bin/../lib/gcc/arc-elf32/8.3.1/../../../../arc-elf32/bin/ld: =
default_file_splice_read.c:(.text+0x28): undefined reference to `splice'
    2    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dire=
nt.h> not supported"
    2    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    2    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such fi=
le or directory
    2    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/in=
t-ll64.h: No such file or directory

Warnings summary:

    40   pidfd_wait.c:22:25: warning: excess elements in struct initializer
    16   pidfd.h:30:21: warning: excess elements in struct initializer
    15   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    15   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    12   cc1: warning: -fsanitize=3Daddress not supported for this target
    9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus
    8    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    8    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    8    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    8    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    8    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    8    close_range_test.c:191:18: warning: excess elements in struct init=
ializer
    8    close_range_test.c:190:12: warning: excess elements in struct init=
ializer
    8    close_range_test.c:102:18: warning: excess elements in struct init=
ializer
    8    close_range_test.c:101:12: warning: excess elements in struct init=
ializer
    8    clone3/clone3_selftests.h:19:27: warning: excess elements in struc=
t initializer
    8    cgroup_util.c:343:13: warning: excess elements in struct initializ=
er
    8    cgroup_util.c:342:18: warning: excess elements in struct initializ=
er
    8    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=
=99 [-Wunused-variable]
    7    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftes=
t/lkdtm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest=
/lkdtm/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/bu=
ild/kselftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /r=
oot/build/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORR=
UPT_STACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_=
GUARD_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING=
.sh /root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/D=
OUBLE_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kself=
test/lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWR=
ITE_ALLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/bui=
ld/kselftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUD=
DY_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root=
/build/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB=
_FREE_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/ks=
elftest/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root=
/build/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.=
sh /root/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXE=
C_STACK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftes=
t/lkdtm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/bu=
ild/kselftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL=
.sh /root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/l=
kdtm/ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kse=
lftest/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.=
sh /root/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselfte=
st/lkdtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_=
NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVER=
FLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselft=
est/lkdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC=
_AND_TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEG=
ATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kself=
test/lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/buil=
d/kselftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REF=
COUNT_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NO=
T_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATUR=
ATED.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /roo=
t/build/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOM=
IC_TIMING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/bui=
ld/kselftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHIT=
ELIST_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/=
build/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lk=
dtm/USERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh=
 /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkd=
tm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE=
.sh
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    5    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set bu=
t not used [-Wunused-but-set-variable]
    5    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    5    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)
    4    param_test.c:1164:10: warning: implicit declaration of function =
=E2=80=98rseq_offset_deref_addv=E2=80=99 [-Wimplicit-function-declaration]
    4    memfd_test.c:90:6: warning: implicit declaration of function =E2=
=80=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-func=
tion-declaration]
    4    memfd_test.c:64:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    4    memfd_test.c:397:6: warning: implicit declaration of function =E2=
=80=98fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplici=
t-function-declaration]
    4    lib/kvm_util.c:299:51: warning: excess elements in struct initiali=
zer
    4    lib/kvm_util.c:298:45: warning: excess elements in struct initiali=
zer
    4    lib/kvm_util.c:297:67: warning: excess elements in struct initiali=
zer
    4    lib/kvm_util.c:297:54: warning: excess elements in struct initiali=
zer
    4    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=
=80=99 [-Wunused-variable]
    4    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=
=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-functio=
n-declaration]
    4    fuse_test.c:261:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    4    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address=
 are not supported for this target
    4    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h'=
 differs from latest version at 'include/uapi/linux/netlink.h'
    4    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h'=
 differs from latest version at 'include/uapi/linux/if_link.h'
    3    /scratch/linux/kernel/rcu/tasks.h:710:13: warning: =E2=80=98show_r=
cu_tasks_rude_gp_kthread=E2=80=99 defined but not used [-Wunused-function]
    3    /scratch/linux/drivers/usb/dwc2/platform.c:611:1: warning: label =
=E2=80=98error_debugfs=E2=80=99 defined but not used [-Wunused-label]
    2    proc-pid-vm.c:214:19: warning: =E2=80=98str_vsyscall=E2=80=99 defi=
ned but not used [-Wunused-const-variable=3D]
    2    proc-pid-vm.c:212:13: warning: =E2=80=98g_vsyscall=E2=80=99 define=
d but not used [-Wunused-variable]
    2    posix_timers.c:40:9: warning: implicit declaration of function =E2=
=80=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-functi=
on-declaration]
    2    posix_timers.c:169:8: warning: implicit declaration of function =
=E2=80=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99?=
 [-Wimplicit-function-declaration]
    2    posix_timers.c:156:8: warning: implicit declaration of function =
=E2=80=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? =
[-Wimplicit-function-declaration]
    2    lib/kvm_util.c:220:14: warning: implicit declaration of function =
=E2=80=98KVM_VM_TYPE_ARM_IPA_SIZE=E2=80=99; did you mean =E2=80=98KVM_DEV_T=
YPE_ARM_VGIC_ITS=E2=80=99? [-Wimplicit-function-declaration]
    2    default_file_splice_read.c:7:9: warning: implicit declaration of f=
unction =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-=
Wimplicit-function-declaration]
    2    WARNING: modpost: missing MODULE_LICENSE() in drivers/hwtracing/co=
resight/coresight.o
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    sync_stress_parallelism.c:93:2: warning: implicit declaration of f=
unction =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atf=
ork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_parallelism.c:100:2: warning: implicit declaration of =
function =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfo=
rk=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:95:3: warning: implicit declaration of func=
tion =E2=80=98pthread_mutex_unlock=E2=80=99; did you mean =E2=80=98pthread_=
atfork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:93:3: warning: implicit declaration of func=
tion =E2=80=98pthread_mutex_lock=E2=80=99; did you mean =E2=80=98pthread_at=
fork=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:182:3: warning: implicit declaration of fun=
ction =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:174:3: warning: implicit declaration of fun=
ction =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfor=
k=E2=80=99? [-Wimplicit-function-declaration]
    1    sync_stress_consumer.c:171:2: warning: implicit declaration of fun=
ction =E2=80=98pthread_mutex_init=E2=80=99; did you mean =E2=80=98pthread_a=
tfork=E2=80=99? [-Wimplicit-function-declaration]
    1    lib/io.c:51:26: warning: format =E2=80=98%li=E2=80=99 expects argu=
ment of type =E2=80=98long int=E2=80=99, but argument 6 has type =E2=80=98s=
ize_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    1    lib/io.c:128:26: warning: format =E2=80=98%li=E2=80=99 expects arg=
ument of type =E2=80=98long int=E2=80=99, but argument 6 has type =E2=80=98=
size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    1    lib/elf.c:81:30: warning: format =E2=80=98%zi=E2=80=99 expects arg=
ument of type =E2=80=98signed size_t=E2=80=99, but argument 6 has type =E2=
=80=98off_t=E2=80=99 {aka =E2=80=98long int=E2=80=99} [-Wformat=3D]
    1    lib/elf.c:169:36: warning: format =E2=80=98%lx=E2=80=99 expects ar=
gument of type =E2=80=98long unsigned int=E2=80=99, but argument 8 has type=
 =E2=80=98vm_vaddr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99=
} [-Wformat=3D]
    1    lib/elf.c:169:36: warning: format =E2=80=98%lx=E2=80=99 expects ar=
gument of type =E2=80=98long unsigned int=E2=80=99, but argument 7 has type=
 =E2=80=98vm_vaddr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99=
} [-Wformat=3D]
    1    /tmp/cc78mu3J.s:18192: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc78mu3J.s:18120: Warning: using r15 results in unpredictable=
 behaviour
    1    /scratch/linux/lib/bitfield_kunit.c:93:1: warning: the frame size =
of 4200 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    /scratch/linux/drivers/misc/habanalabs/common/command_buffer.c:512=
:44: warning: cast to pointer from integer of different size [-Wint-to-poin=
ter-cast]
    1    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redef=
ined
    1    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warni=
ng: =E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused=
-function]
    1    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: =
Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
    1    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: =
Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
    1    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: =
Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
    1    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5=
: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing inter=
rupt-parent
    1    .config:1168:warning: override: UNWINDER_GUESS changes choice state

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 120 errors, 11 war=
nings, 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section=
 mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in drivers/hwtracing/coresig=
ht/coresight.o
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 section =
mismatches

Warnings:
    /tmp/cc78mu3J.s:18120: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc78mu3J.s:18192: Warning: using r15 results in unpredictable beha=
viour
    /scratch/linux/drivers/misc/habanalabs/common/command_buffer.c:512:44: =
warning: cast to pointer from integer of different size [-Wint-to-pointer-c=
ast]
    /scratch/linux/lib/bitfield_kunit.c:93:1: warning: the frame size of 42=
00 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    WARNING: modpost: missing MODULE_LICENSE() in drivers/hwtracing/coresig=
ht/coresight.o
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'
    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warni=
ng (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warni=
ng (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warni=
ng (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
    /scratch/linux/arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: War=
ning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-=
parent

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    /scratch/linux/kernel/rcu/tasks.h:710:13: warning: =E2=80=98show_rcu_ta=
sks_rude_gp_kthread=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    /scratch/linux/kernel/rcu/tasks.h:710:13: warning: =E2=80=98show_rcu_ta=
sks_rude_gp_kthread=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    /scratch/linux/kernel/rcu/tasks.h:710:13: warning: =E2=80=98show_rcu_ta=
sks_rude_gp_kthread=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 8 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 125 errors, 79 warnings,=
 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98PR_GET_TID_ADDR=
ESS=E2=80=99?
    tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98PR_GET_DUMPABLE=
=E2=80=99?
    /scratch/linux/tools/testing/selftests/arm64/fp/sve-ptrace.c:321: undef=
ined reference to `sve_store_patterns'
    collect2: error: ld returned 1 exit status
    breakpoint_test_arm64.c:179:25: error: =E2=80=98TRAP_HWBKPT=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98TRAP_BRKPT=E2=
=80=99?
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98PR_GET_TID_ADDR=
ESS=E2=80=99?
    tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98PR_GET_DUMPABLE=
=E2=80=99?
    /scratch/linux/tools/testing/selftests/arm64/fp/sve-ptrace.c:321: undef=
ined reference to `sve_store_patterns'
    collect2: error: ld returned 1 exit status
    tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98PR_GET_TID_ADDR=
ESS=E2=80=99?
    tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98PR_GET_DUMPABLE=
=E2=80=99?
    /scratch/linux/tools/testing/selftests/arm64/fp/sve-ptrace.c:321: undef=
ined reference to `sve_store_patterns'
    collect2: error: ld returned 1 exit status
    breakpoint_test_arm64.c:179:25: error: =E2=80=98TRAP_HWBKPT=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98TRAP_BRKPT=E2=
=80=99?
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    tags_test.c:21:12: error: =E2=80=98PR_SET_TAGGED_ADDR_CTRL=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98PR_GET_TID_ADDR=
ESS=E2=80=99?
    tags_test.c:21:37: error: =E2=80=98PR_TAGGED_ADDR_ENABLE=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98PR_GET_DUMPABLE=
=E2=80=99?
    /scratch/linux/tools/testing/selftests/arm64/fp/sve-ptrace.c:321: undef=
ined reference to `sve_store_patterns'
    collect2: error: ld returned 1 exit status

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)
    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set but not=
 used [-Wunused-but-set-variable]
    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set but not=
 used [-Wunused-but-set-variable]
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    lib/kvm_util.c:220:14: warning: implicit declaration of function =E2=80=
=98KVM_VM_TYPE_ARM_IPA_SIZE=E2=80=99; did you mean =E2=80=98KVM_DEV_TYPE_AR=
M_VGIC_ITS=E2=80=99? [-Wimplicit-function-declaration]
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    proc-pid-vm.c:214:19: warning: =E2=80=98str_vsyscall=E2=80=99 defined b=
ut not used [-Wunused-const-variable=3D]
    proc-pid-vm.c:212:13: warning: =E2=80=98g_vsyscall=E2=80=99 defined but=
 not used [-Wunused-variable]
    param_test.c:1164:10: warning: implicit declaration of function =E2=80=
=98rseq_offset_deref_addv=E2=80=99 [-Wimplicit-function-declaration]
    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set but not=
 used [-Wunused-but-set-variable]
    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set but not=
 used [-Wunused-but-set-variable]
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    lib/kvm_util.c:220:14: warning: implicit declaration of function =E2=80=
=98KVM_VM_TYPE_ARM_IPA_SIZE=E2=80=99; did you mean =E2=80=98KVM_DEV_TYPE_AR=
M_VGIC_ITS=E2=80=99? [-Wimplicit-function-declaration]
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    param_test.c:1164:10: warning: implicit declaration of function =E2=80=
=98rseq_offset_deref_addv=E2=80=99 [-Wimplicit-function-declaration]
    sve-ptrace.c:311:6: warning: variable =E2=80=98ret=E2=80=99 set but not=
 used [-Wunused-but-set-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 120 errors, 7 warnings, =
0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or=
 directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

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
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 142 errors, 22=
 warnings, 0 section mismatches

Errors:
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No such fil=
e or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3.c:8:10: fatal error: linux/types.h: No such file or directory
    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file or d=
irectory
    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or directory
    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or directory
    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or directo=
ry
    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/int-ll6=
4.h: No such file or directory
    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or directo=
ry
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrier.h: =
No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or dire=
ctory
    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No such fil=
e or directory
    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or directory
    reuseport_bpf.c:11:10: fatal error: error.h: No such file or directory
    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or directo=
ry
    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or directory
    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or directory
    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dirent.h>=
 not supported"
    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directory
    seccomp_bpf.c:16:20: error: missing binary operator before token "("
    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or direc=
tory
    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    default_file_splice_read.c:(.text+0x28): undefined reference to `splice'
    /usr/bin/../lib/gcc/arc-elf32/8.3.1/../../../../arc-elf32/bin/ld: defau=
lt_file_splice_read.c:(.text+0x28): undefined reference to `splice'
    collect2: error: ld returned 1 exit status
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file or d=
irectory
    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or direc=
tory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No such fil=
e or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3.c:8:10: fatal error: linux/types.h: No such file or directory
    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file or d=
irectory
    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or directory
    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or directory
    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or directo=
ry
    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/int-ll6=
4.h: No such file or directory
    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or directo=
ry
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrier.h: =
No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or dire=
ctory
    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No such fil=
e or directory
    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or directory
    reuseport_bpf.c:11:10: fatal error: error.h: No such file or directory
    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or directo=
ry
    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or directory
    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or directory
    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dirent.h>=
 not supported"
    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type name =E2=
=80=98DIR=E2=80=99
    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directory
    seccomp_bpf.c:16:20: error: missing binary operator before token "("
    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or direc=
tory
    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    default_file_splice_read.c:(.text+0x28): undefined reference to `splice'
    /usr/bin/../lib/gcc/arc-elf32/8.3.1/../../../../arc-elf32/bin/ld: defau=
lt_file_splice_read.c:(.text+0x28): undefined reference to `splice'
    collect2: error: ld returned 1 exit status
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98CLOCK_REALT=
IME=E2=80=99?
    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK_RE=
ALTIME=E2=80=99?
    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file or d=
irectory
    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or direc=
tory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    default_file_splice_read.c:7:9: warning: implicit declaration of functi=
on =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-Wimpl=
icit-function-declaration]
    sync_stress_parallelism.c:93:2: warning: implicit declaration of functi=
on =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_parallelism.c:100:2: warning: implicit declaration of funct=
ion =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=
=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:93:3: warning: implicit declaration of function =
=E2=80=98pthread_mutex_lock=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:95:3: warning: implicit declaration of function =
=E2=80=98pthread_mutex_unlock=E2=80=99; did you mean =E2=80=98pthread_atfor=
k=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:171:2: warning: implicit declaration of function=
 =E2=80=98pthread_mutex_init=E2=80=99; did you mean =E2=80=98pthread_atfork=
=E2=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:174:3: warning: implicit declaration of function=
 =E2=80=98pthread_create=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=
=80=99? [-Wimplicit-function-declaration]
    sync_stress_consumer.c:182:3: warning: implicit declaration of function=
 =E2=80=98pthread_join=E2=80=99; did you mean =E2=80=98pthread_atfork=E2=80=
=99? [-Wimplicit-function-declaration]
    posix_timers.c:40:9: warning: implicit declaration of function =E2=80=
=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-function-=
declaration]
    posix_timers.c:156:8: warning: implicit declaration of function =E2=80=
=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? [-Wimp=
licit-function-declaration]
    posix_timers.c:169:8: warning: implicit declaration of function =E2=80=
=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99? [-Wim=
plicit-function-declaration]
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    default_file_splice_read.c:7:9: warning: implicit declaration of functi=
on =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-Wimpl=
icit-function-declaration]
    posix_timers.c:40:9: warning: implicit declaration of function =E2=80=
=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-function-=
declaration]
    posix_timers.c:156:8: warning: implicit declaration of function =E2=80=
=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? [-Wimp=
licit-function-declaration]
    posix_timers.c:169:8: warning: implicit declaration of function =E2=80=
=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99? [-Wim=
plicit-function-declaration]

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 97 errors, 50 warnin=
gs, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    param_test.c:1299:21: error: =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_E=
XPEDITED_RSEQ=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    param_test.c:1299:21: error: =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_E=
XPEDITED_RSEQ=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory

Warnings:
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 95 errors, 62 war=
nings, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    lib/elf.c:81:30: warning: format =E2=80=98%zi=E2=80=99 expects argument=
 of type =E2=80=98signed size_t=E2=80=99, but argument 6 has type =E2=80=98=
off_t=E2=80=99 {aka =E2=80=98long int=E2=80=99} [-Wformat=3D]
    lib/elf.c:169:36: warning: format =E2=80=98%lx=E2=80=99 expects argumen=
t of type =E2=80=98long unsigned int=E2=80=99, but argument 7 has type =E2=
=80=98vm_vaddr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-=
Wformat=3D]
    lib/elf.c:169:36: warning: format =E2=80=98%lx=E2=80=99 expects argumen=
t of type =E2=80=98long unsigned int=E2=80=99, but argument 8 has type =E2=
=80=98vm_vaddr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-=
Wformat=3D]
    lib/io.c:51:26: warning: format =E2=80=98%li=E2=80=99 expects argument =
of type =E2=80=98long int=E2=80=99, but argument 6 has type =E2=80=98size_t=
=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    lib/io.c:128:26: warning: format =E2=80=98%li=E2=80=99 expects argument=
 of type =E2=80=98long int=E2=80=99, but argument 6 has type =E2=80=98size_=
t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=3D]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    proc-pid-vm.c:214:19: warning: =E2=80=98str_vsyscall=E2=80=99 defined b=
ut not used [-Wunused-const-variable=3D]
    proc-pid-vm.c:212:13: warning: =E2=80=98g_vsyscall=E2=80=99 defined but=
 not used [-Wunused-variable]
    param_test.c:1164:10: warning: implicit declaration of function =E2=80=
=98rseq_offset_deref_addv=E2=80=99 [-Wimplicit-function-declaration]
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    param_test.c:1164:10: warning: implicit declaration of function =E2=80=
=98rseq_offset_deref_addv=E2=80=99 [-Wimplicit-function-declaration]

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
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =
=E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused-fun=
ction]

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
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    /scratch/linux/drivers/usb/dwc2/platform.c:611:1: warning: label =E2=80=
=98error_debugfs=E2=80=99 defined but not used [-Wunused-label]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 section =
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
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    /scratch/linux/drivers/usb/dwc2/platform.c:611:1: warning: label =E2=80=
=98error_debugfs=E2=80=99 defined but not used [-Wunused-label]

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
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1168:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 109 errors, 60 w=
arnings, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    param_test.c:1299:21: error: =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_E=
XPEDITED_RSEQ=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    cgroup_util.c:340:9: error: variable =E2=80=98args=E2=80=99 has initial=
izer but incomplete type
    cgroup_util.c:341:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98flags=E2=80=99
    cgroup_util.c:342:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98exit_signal=E2=80=99
    cgroup_util.c:343:4: error: =E2=80=98struct clone_args=E2=80=99 has no =
member named =E2=80=98cgroup=E2=80=99
    cgroup_util.c:340:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    cgroup_util.c:346:33: error: invalid application of =E2=80=98sizeof=E2=
=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    close_range_test.c:100:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:101:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:102:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:100:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    close_range_test.c:189:9: error: variable =E2=80=98args=E2=80=99 has in=
itializer but incomplete type
    close_range_test.c:190:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98flags=E2=80=99
    close_range_test.c:191:4: error: =E2=80=98struct clone_args=E2=80=99 ha=
s no member named =E2=80=98exit_signal=E2=80=99
    close_range_test.c:189:20: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has initia=
lizer but incomplete type
    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98slot=E2=80=99
    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98first_page=E2=80=99
    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=E2=80=
=99 has no member named =E2=80=98num_pages=E2=80=99
    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=99 is=
n=E2=80=99t known
    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98KVM_GET_DIRTY_L=
OG=E2=80=99?
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:31:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:44:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:45:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:46:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:47:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:48:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:44:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:93:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:94:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:95:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:96:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:97:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:93:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:146:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:147:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:148:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:149:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:146:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    param_test.c:1244:22: error: =E2=80=98MEMBARRIER_CMD_PRIVATE_EXPEDITED_=
RSEQ=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98MEMBARRIER_CMD_PRIVATE_EXPEDITED=E2=80=99?
    param_test.c:1245:6: error: =E2=80=98MEMBARRIER_CMD_FLAG_CPU=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MEMBARRIER_CM=
D_SHARED=E2=80=99?
    param_test.c:1299:21: error: =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_E=
XPEDITED_RSEQ=E2=80=99 undeclared (first use in this function); did you mea=
n =E2=80=98MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED=E2=80=99?
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory

Warnings:
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    memfd_test.c:64:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:90:6: warning: implicit declaration of function =E2=80=98f=
cntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-de=
claration]
    memfd_test.c:397:6: warning: implicit declaration of function =E2=80=98=
fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplicit-func=
tion-declaration]
    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=98fc=
ntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-function-dec=
laration]
    fuse_test.c:261:7: warning: implicit declaration of function =E2=80=98o=
pen=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-function-de=
claration]
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:19:27: warning: excess elements in struct ini=
tializer
    cgroup_util.c:342:18: warning: excess elements in struct initializer
    cgroup_util.c:343:13: warning: excess elements in struct initializer
    cgroup_util.c:340:20: warning: unused variable =E2=80=98args=E2=80=99 [=
-Wunused-variable]
    close_range_test.c:101:12: warning: excess elements in struct initializ=
er
    close_range_test.c:102:18: warning: excess elements in struct initializ=
er
    close_range_test.c:190:12: warning: excess elements in struct initializ=
er
    close_range_test.c:191:18: warning: excess elements in struct initializ=
er
    lib/kvm_util.c:297:54: warning: excess elements in struct initializer
    lib/kvm_util.c:297:67: warning: excess elements in struct initializer
    lib/kvm_util.c:298:45: warning: excess elements in struct initializer
    lib/kvm_util.c:299:51: warning: excess elements in struct initializer
    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=80=99 =
[-Wunused-variable]
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/STACK_GUARD=
_PAGE_LEADING.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /=
root/build/kselftest/lkdtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE=
_FAULT.sh /root/build/kselftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/=
lkdtm/UNALIGNED_LOAD_STORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_A=
LLOCATION.sh /root/build/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/ks=
elftest/lkdtm/READ_AFTER_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AF=
TER_FREE.sh /root/build/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/buil=
d/kselftest/lkdtm/SLAB_FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE=
_CROSS.sh /root/build/kselftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselfte=
st/lkdtm/SOFTLOCKUP.sh /root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/buil=
d/kselftest/lkdtm/SPINLOCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /r=
oot/build/kselftest/lkdtm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STA=
CK.sh /root/build/kselftest/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkd=
tm/EXEC_VMALLOC.sh /root/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/k=
selftest/lkdtm/EXEC_USERSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /=
root/build/kselftest/lkdtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/=
ACCESS_NULL.sh /root/build/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftes=
t/lkdtm/WRITE_RO_AFTER_INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /r=
oot/build/kselftest/lkdtm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lk=
dtm/REFCOUNT_ADD_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_Z=
ERO_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.=
sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/l=
kdtm/REFCOUNT_DEC_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_=
TEST_NEGATIVE.sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/=
lkdtm/REFCOUNT_ADD_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURAT=
ED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kse=
lftest/lkdtm/REFCOUNT_ADD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT=
_INC_NOT_ZERO_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZER=
O_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.=
sh /root/build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/bui=
ld/kselftest/lkdtm/REFCOUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TI=
MING.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/ks=
elftest/lkdtm/USERCOPY_HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCO=
PY_HEAP_WHITELIST_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST=
_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build=
/kselftest/lkdtm/USERCOPY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/U=
SERCOPY_STACK_BEYOND.sh /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /roo=
t/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/build/kselftest/lkdtm/CF=
I_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    pidfd_wait.c:29:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:48:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:97:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:148:12: warning: excess elements in struct initializer
    pidfd_wait.c:149:18: warning: excess elements in struct initializer

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    /scratch/linux/drivers/usb/dwc2/platform.c:611:1: warning: label =E2=80=
=98error_debugfs=E2=80=99 defined but not used [-Wunused-label]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
