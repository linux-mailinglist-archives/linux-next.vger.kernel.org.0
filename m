Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3AE26F4B4
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 05:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgIRD2q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 23:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIRD2q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 23:28:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D36C06174A
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 20:28:45 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id y6so2232040plt.9
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 20:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YMK4Grm/tLLilCXmN1hZYbGoMrUatB0YKyOEkzPvaRo=;
        b=GzADHivDnxg04Ak23vnELWvacYatm/C1UhDamKDxiWkM3dg/6EZQaJ6JjZ/LWet5NQ
         wMOCuDKJtFboq7kHnpT2OHqm+0x9ddaahCwid/hHVXoVy2ReNuT9UqJuRGLRceugmzQS
         DpSVP3C2KAlnoGmtwoWVAIXHx8hqWYC1Rf3JdiWeGRczG6Hec71Vx/WZGHytNh3PXQQs
         bPQ/Ci0+eFTU+TFTX3de6x23/FkWm/hkQLRLFyiYUj34uWnsqAUjAqUYuYmEe8g08mjC
         Sc1bYk6Yh0Kg9RFeVcxiEBKqOVB+NNOr1S3pJIaK+fuRxvLZhG8nij0p55u5WpSsC460
         I3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YMK4Grm/tLLilCXmN1hZYbGoMrUatB0YKyOEkzPvaRo=;
        b=l3D+ZA2TeKP5fE+6qPkezxR79W0gOitrcp9uTGW9w285nimnH+LSHk39V1WSKx+pYx
         f5qkibZEFmlIv5X+qVc6yEUlRRJrGVdECd3BXPyEhLlCK7bcTXPUZ4cbQPvFwzR63P4w
         b+HZBtvxlAd+0UGc/C5+uLIFrmAMim3x0fMX4YsKl/mXU5nF+wTeV1uCoVW/jRwHEj9E
         P9mEElRG7cVkzPB6A+DeDzPhDFI0FW7fVGTlVKR2c6BIGxXnyX/doZ6/slV4v1mLpNki
         0Fqib1gA0NNP4sX/JKh75DpKQ+sWHfziJLHXqckxaPVV4LBXLVNKA2DN0n/62JeGnsPz
         DqDg==
X-Gm-Message-State: AOAM531twK6sBZDYfa84IVwlUQfA/FsRFezkckN73XX+HwuML+jeNJgX
        9glkDiz1fW5zksjcClIkcusPT7waB4Ma9g==
X-Google-Smtp-Source: ABdhPJyeYY7zjFB3mO7lZxpayLCQ8aZIb97Nc+uh0WQpVzLxc94Pwac9s3CYRo7ssvMgGfSaN1UB/w==
X-Received: by 2002:a17:90b:317:: with SMTP id ay23mr11033557pjb.68.1600399722992;
        Thu, 17 Sep 2020 20:28:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g21sm1181340pfh.30.2020.09.17.20.28.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 20:28:42 -0700 (PDT)
Message-ID: <5f64296a.1c69fb81.d13d0.39c2@mx.google.com>
Date:   Thu, 17 Sep 2020 20:28:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.9-rc5-353-gfc14a2f59553
Subject: next/pending-fixes build: 213 builds: 0 failed, 213 passed,
 1438 errors, 223 warnings (v5.9-rc5-353-gfc14a2f59553)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 213 builds: 0 failed, 213 passed, 1438 errors, 22=
3 warnings (v5.9-rc5-353-gfc14a2f59553)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.9-rc5-353-gfc14a2f59553/

Tree: next
Branch: pending-fixes
Git Describe: v5.9-rc5-353-gfc14a2f59553
Git Commit: fc14a2f595533d6cc1d072694d15821dcd3d6a91
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 166 errors, 23 warnings

arm64:
    allmodconfig (gcc-8): 8 warnings
    defconfig (gcc-8): 8 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 8 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 8 warnings
    defconfig+kselftest (gcc-8): 302 errors, 11 warnings

arm:
    allmodconfig (gcc-8): 9 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 3 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 warnings
    multi_v7_defconfig+kselftest (gcc-8): 280 errors, 6 warnings
    omap1_defconfig (gcc-8): 3 warnings
    pxa168_defconfig (gcc-8): 3 warnings
    pxa910_defconfig (gcc-8): 3 warnings

i386:
    i386_defconfig+kselftest (gcc-8): 59 errors, 29 warnings

mips:
    32r2el_defconfig+kselftest (gcc-8): 280 errors, 19 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 3 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 1 warning
    rs90_defconfig (gcc-8): 2 warnings

riscv:
    defconfig+kselftest (gcc-8): 280 errors, 11 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig+kselftest (gcc-8): 71 errors, 39 warnings

Errors summary:

    582  /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such =
file or directory
    375  /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: =
fatal error: asm/types.h: No such file or directory
    120  /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h:=
 No such file or directory
    16   /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h=
: No such file or directory
    15   arc-elf32-gcc: error: unrecognized command line option =E2=80=98-p=
thread=E2=80=99
    14   /bin/sh: 3: llc: not found
    14   /bin/sh: 1: llc: not found
    14   /bin/sh: 1: clang: not found
    11   test_execve.c:4:10: fatal error: cap-ng.h: No such file or directo=
ry
    9    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or dire=
ctory
    9    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or dir=
ectory
    8    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or dire=
ctory
    8    posix_timers.c:10:10: fatal error: sys/time.h: No such file or dir=
ectory
    8    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file =
or directory
    8    collect2: error: ld returned 1 exit status
    8    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such f=
ile or directory
    8    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or=
 directory
    8    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such=
 file or directory
    6    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or direc=
tory
    4    test_verifier.c:25:10: fatal error: sys/capability.h: No such file=
 or directory
    4    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No s=
uch file or directory
    4    ../kselftest_harness.h:56:10: fatal error: asm/types.h: No such fi=
le or directory
    4    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h=
: No such file or directory
    3    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or direct=
ory
    3    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or direc=
tory
    3    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directo=
ry
    3    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    2    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or dir=
ectory
    2    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_=
GCM_128=E2=80=99?
    2    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=
=E2=80=99t known
    2    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_=
GCM_128=E2=80=99?
    2    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=
=E2=80=99t known
    2    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared =
here (not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    2    signals.S:4:10: fatal error: asm/unistd.h: No such file or directo=
ry
    2    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    2    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or d=
irectory
    2    regression_enomem.c:5:10: fatal error: linux/types.h: No such file=
 or directory
    2    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such=
 file or directory
    2    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or dir=
ectory
    2    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98flags=E2=80=99
    2    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has =
no member named =E2=80=98parent_tid=E2=80=99
    2    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has init=
ializer but incomplete type
    2    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 =
isn=E2=80=99t known
    2    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    2    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    2    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98parent_tid=E2=80=99
    2    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    2    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    2    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    2    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98pidfd=E2=80=99
    2    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98exit_signal=E2=80=99
    2    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=
=99 has no member named =E2=80=98flags=E2=80=99
    2    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 ha=
s initializer but incomplete type
    2    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=
=80=99 isn=E2=80=99t known
    2    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or direc=
tory
    2    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or di=
rectory
    2    mlock-random-test.c:8:10: fatal error: sys/capability.h: No such f=
ile or directory
    2    lib/kvm_util.c:302:22: error: =E2=80=98KVM_CLEAR_DIRTY_LOG=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98KVM_GET_=
DIRTY_LOG=E2=80=99?
    2    lib/kvm_util.c:299:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98num_pages=E2=80=99
    2    lib/kvm_util.c:298:32: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98first_page=E2=80=99
    2    lib/kvm_util.c:297:9: error: variable =E2=80=98args=E2=80=99 has i=
nitializer but incomplete type
    2    lib/kvm_util.c:297:60: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98slot=E2=80=99
    2    lib/kvm_util.c:297:39: error: =E2=80=98struct kvm_clear_dirty_log=
=E2=80=99 has no member named =E2=80=98dirty_bitmap=E2=80=99
    2    lib/kvm_util.c:297:29: error: storage size of =E2=80=98args=E2=80=
=99 isn=E2=80=99t known
    2    lib/assert.c:12:10: fatal error: execinfo.h: No such file or direc=
tory
    2    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No=
 such file or directory
    2    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or direc=
tory
    2    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    2    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    2    close_range_test.c:55:10: error: expected expression before =E2=80=
=98return=E2=80=99
    2    close_range_test.c:47:11: error: expected expression before =E2=80=
=98return=E2=80=99
    2    close_range_test.c:200:11: error: expected expression before =E2=
=80=98return=E2=80=99
    2    close_range_test.c:111:11: error: expected expression before =E2=
=80=98return=E2=80=99
    2    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=
=80=99 has initializer but incomplete type
    2    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98a=
rgs=E2=80=99 isn=E2=80=99t known
    1    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No suc=
h file or directory
    1    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or direct=
ory
    1    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    1    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No suc=
h file or directory
    1    splice_read.c:49:15: error: =E2=80=98SPLICE_F_MOVE=E2=80=99 undecl=
ared (first use in this function)
    1    setdate.c:10:10: fatal error: linux/rtc.h: No such file or directo=
ry
    1    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or =
directory
    1    seccomp_bpf.c:16:20: error: missing binary operator before token "=
("
    1    seccomp_benchmark.c:11:10: fatal error: linux/filter.h: No such fi=
le or directory
    1    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    1    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directo=
ry
    1    reuseport_bpf_cpu.c:17:10: fatal error: arpa/inet.h: No such file =
or directory
    1    reuseport_bpf.c:11:10: fatal error: error.h: No such file or direc=
tory
    1    resolve_test.c:12:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    recursion-depth.c:24:10: fatal error: sys/mount.h: No such file or=
 directory
    1    proc.h:10:10: fatal error: sys/syscall.h: No such file or directory
    1    posix_timers.c:217:25: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:205:25: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:150:22: error: =E2=80=98CLOCK_PROCESS_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    posix_timers.c:148:15: error: =E2=80=98CLOCK_THREAD_CPUTIME_ID=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98CLOCK=
_REALTIME=E2=80=99?
    1    pm_nl_ctl.c:4:10: fatal error: error.h: No such file or directory
    1    pidns.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    1    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    1    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or dire=
ctory
    1    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or direct=
ory
    1    nanosleep.c:27:10: fatal error: sys/timex.h: No such file or direc=
tory
    1    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    1    mq_perf_tests.c:38:10: fatal error: mqueue.h: No such file or dire=
ctory
    1    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or dire=
ctory
    1    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or di=
rectory
    1    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or=
 directory
    1    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrie=
r.h: No such file or directory
    1    membarrier_test_multi_thread.c:3:10: fatal error: linux/membarrier=
.h: No such file or directory
    1    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or di=
rectory
    1    gup_benchmark.c:6:10: fatal error: sys/ioctl.h: No such file or di=
rectory
    1    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or di=
rectory
    1    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or dir=
ectory
    1    dnotify_test.c:28:42: error: =E2=80=98DN_MULTISHOT=E2=80=99 undecl=
ared (first use in this function)
    1    dnotify_test.c:28:32: error: =E2=80=98DN_CREATE=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98O_CREAT=E2=80=99?
    1    dnotify_test.c:28:22: error: =E2=80=98DN_MODIFY=E2=80=99 undeclare=
d (first use in this function)
    1    dnotify_test.c:28:12: error: =E2=80=98F_NOTIFY=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98O_NOCTTY=E2=80=99?
    1    dnotify_test.c:27:12: error: =E2=80=98F_SETSIG=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98FD_SETSIZE=E2=80=99?
    1    dnotify_test.c:24:12: error: =E2=80=98SIGRTMIN=E2=80=99 undeclared=
 (first use in this function); did you mean =E2=80=98SIGTTIN=E2=80=99?
    1    dnotify_test.c:23:17: error: =E2=80=98SA_SIGINFO=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98S_IFIFO=E2=80=99?
    1    dnotify_test.c:21:5: error: =E2=80=98struct sigaction=E2=80=99 has=
 no member named =E2=80=98sa_sigaction=E2=80=99
    1    dnotify_test.c:13:17: error: =E2=80=98siginfo_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} has no member named =E2=80=98si_fd=E2=80=
=99; did you mean =E2=80=98si_code=E2=80=99?
    1    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or dir=
ectory
    1    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or =
directory
    1    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file=
 or directory
    1    clone3_clear_sighand.c:11:10: fatal error: linux/sched.h: No such =
file or directory
    1    clone3.c:8:10: fatal error: linux/types.h: No such file or directo=
ry
    1    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file=
 or directory
    1    /usr/arc-elf32/sys-include/sys/dirent.h:10:2: error: #error "<dire=
nt.h> not supported"
    1    /usr/arc-elf32/sys-include/dirent.h:76:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:73:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:72:15: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:61:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:58:16: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:56:11: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:54:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:53:1: error: unknown type name=
 =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:51:17: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    /usr/arc-elf32/sys-include/dirent.h:48:12: error: unknown type nam=
e =E2=80=98DIR=E2=80=99
    1    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/in=
t-ll64.h: No such file or directory

Warnings summary:

    24   cc1: warning: -fsanitize=3Daddress not supported for this target
    15   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    15   /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus
    8    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    8    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address=
 are not supported for this target
    7    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftes=
t/lkdtm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest=
/lkdtm/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/bu=
ild/kselftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /r=
oot/build/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORR=
UPT_STACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUP=
T_USER_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/=
build/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lk=
dtm/UNSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/k=
selftest/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_ST=
ORE_WRITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/buil=
d/kselftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTE=
R_FREE.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build=
/kselftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_=
FREE_DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/k=
selftest/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh =
/root/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINL=
OCKUP.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkd=
tm/EXEC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kself=
test/lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /roo=
t/build/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USE=
RSPACE.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lk=
dtm/ACCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/bu=
ild/kselftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_=
INIT.sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkd=
tm/REFCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFL=
OW.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/b=
uild/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftes=
t/lkdtm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGAT=
IVE.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/=
build/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselfte=
st/lkdtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO=
.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kself=
test/lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_A=
DD_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED=
.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/bu=
ild/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftes=
t/lkdtm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFC=
OUNT_TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kse=
lftest/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_=
HEAP_SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh=
 /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/ks=
elftest/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCO=
PY_STACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh=
 /root/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm=
/USERCOPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /ro=
ot/build/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE=
.sh
    7    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    6    pidfd.h:30:21: warning: excess elements in struct initializer
    5    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    5    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)
    3    /scratch/linux/drivers/iio/iio_core_trigger.h:42:13: warning: =E2=
=80=98iio_device_unregister_trigger_consumer=E2=80=99 defined but not used =
[-Wunused-function]
    3    /scratch/linux/drivers/iio/iio_core_trigger.h:33:12: warning: =E2=
=80=98iio_device_register_trigger_consumer=E2=80=99 defined but not used [-=
Wunused-function]
    2    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-=
Wunused-variable]
    2    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-=
Wunused-variable]
    2    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
    2    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    2    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    2    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    2    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    2    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    2    pidfd_setns_test.c:80:18: warning: excess elements in struct initi=
alizer
    2    memfd_test.c:90:6: warning: implicit declaration of function =E2=
=80=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    memfd_test.c:64:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    memfd_test.c:397:6: warning: implicit declaration of function =E2=
=80=98fallocate=E2=80=99; did you mean =E2=80=98alloca=E2=80=99? [-Wimplici=
t-function-declaration]
    2    lib/kvm_util.c:299:51: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:298:45: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:67: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:54: warning: excess elements in struct initiali=
zer
    2    lib/kvm_util.c:297:29: warning: unused variable =E2=80=98args=E2=
=80=99 [-Wunused-variable]
    2    fuse_test.c:67:6: warning: implicit declaration of function =E2=80=
=98fcntl=E2=80=99; did you mean =E2=80=98fcvt=E2=80=99? [-Wimplicit-functio=
n-declaration]
    2    fuse_test.c:261:7: warning: implicit declaration of function =E2=
=80=98open=E2=80=99; did you mean =E2=80=98popen=E2=80=99? [-Wimplicit-func=
tion-declaration]
    2    close_range_test.c:47:5: warning: implicit declaration of function=
 =E2=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
    2    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_ar=
gs=E2=80=99 declared inside parameter list will not be visible outside of t=
his definition or declaration
    2    clone3/clone3_selftests.h:16:25: warning: excess elements in struc=
t initializer
    2    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h'=
 differs from latest version at 'include/uapi/linux/netlink.h'
    2    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h'=
 differs from latest version at 'include/uapi/linux/if_link.h'
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    /scratch/linux/kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_r=
cu_tasks_classic_gp_kthread=E2=80=99 defined but not used [-Wunused-functio=
n]
    2    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: w=
arning: cast from pointer to integer of different size [-Wpointer-to-int-ca=
st]
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
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
    1    splice_read.c:48:12: warning: implicit declaration of function =E2=
=80=98splice=E2=80=99; did you mean =E2=80=98pipe=E2=80=99? [-Wimplicit-fun=
ction-declaration]
    1    posix_timers.c:40:9: warning: implicit declaration of function =E2=
=80=98brk=E2=80=99; did you mean =E2=80=98sbrk=E2=80=99? [-Wimplicit-functi=
on-declaration]
    1    posix_timers.c:169:8: warning: implicit declaration of function =
=E2=80=98timer_settime=E2=80=99; did you mean =E2=80=98timerisset=E2=80=99?=
 [-Wimplicit-function-declaration]
    1    posix_timers.c:156:8: warning: implicit declaration of function =
=E2=80=98timer_create=E2=80=99; did you mean =E2=80=98timerclear=E2=80=99? =
[-Wimplicit-function-declaration]
    1    default_file_splice_read.c:7:9: warning: implicit declaration of f=
unction =E2=80=98splice=E2=80=99; did you mean =E2=80=98select=E2=80=99? [-=
Wimplicit-function-declaration]
    1    /tmp/ccAcGp5U.s:18192: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccAcGp5U.s:18120: Warning: using r15 results in unpredictable=
 behaviour
    1    /scratch/linux/drivers/vhost/vhost.c:1906:1: warning: the frame si=
ze of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    /scratch/linux/drivers/vhost/scsi.c:1374:1: warning: the frame siz=
e of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:198:32: w=
arning: cast to pointer from integer of different size [-Wint-to-pointer-ca=
st]
    1    /scratch/linux/drivers/media/tuners/mxl5005s.c:3953:1: warning: th=
e frame size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=
=3D]
    1    /scratch/linux/drivers/gpio/gpio-omap.c:1531:12: warning: =E2=80=
=98omap_gpio_resume=E2=80=99 defined but not used [-Wunused-function]
    1    /scratch/linux/drivers/gpio/gpio-omap.c:1519:12: warning: =E2=80=
=98omap_gpio_suspend=E2=80=99 defined but not used [-Wunused-function]
    1    /scratch/linux/drivers/crypto/sa2ul.c:1486:33: warning: cast from =
pointer to integer of different size [-Wpointer-to-int-cast]
    1    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redef=
ined
    1    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warni=
ng: =E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused=
-function]
    1    .config:1169:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2a94): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x2848): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 280 errors, 19 war=
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
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
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress and -fsanitize=3Dkernel-address are =
not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section m=
ismatches

Warnings:
    /tmp/ccAcGp5U.s:18120: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccAcGp5U.s:18192: Warning: using r15 results in unpredictable beha=
viour
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:197:33: warnin=
g: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    /scratch/linux/drivers/net/ethernet/intel/ice/ice_flow.h:198:32: warnin=
g: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    /scratch/linux/drivers/crypto/sa2ul.c:1486:33: warning: cast from point=
er to integer of different size [-Wpointer-to-int-cast]
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
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    /scratch/linux/kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_ta=
sks_classic_gp_kthread=E2=80=99 defined but not used [-Wunused-function]

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
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    /scratch/linux/kernel/rcu/tasks.h:593:13: warning: =E2=80=98show_rcu_ta=
sks_classic_gp_kthread=E2=80=99 defined but not used [-Wunused-function]

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2a94): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x2848): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 280 errors, 11 warnings,=
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 302 errors, 11 warnings,=
 0 section mismatches

Errors:
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    signals.S:4:10: fatal error: asm/unistd.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/

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
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    /scratch/linux/drivers/iio/iio_core_trigger.h:42:13: warning: =E2=80=98=
iio_device_unregister_trigger_consumer=E2=80=99 defined but not used [-Wunu=
sed-function]
    /scratch/linux/drivers/iio/iio_core_trigger.h:33:12: warning: =E2=80=98=
iio_device_register_trigger_consumer=E2=80=99 defined but not used [-Wunuse=
d-function]

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
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 166 errors, 23=
 warnings, 0 section mismatches

Errors:
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    step_after_suspend_test.c:16:10: fatal error: sys/ptrace.h: No such fil=
e or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3.c:8:10: fatal error: linux/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    close_range_test.c:6:10: fatal error: linux/kernel.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    udmabuf.c:7:10: fatal error: linux/fcntl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    open-unlink.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    devpts_pts.c:11:10: fatal error: asm/ioctls.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    epoll_wakeup_test.c:4:10: fatal error: poll.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    fw_namespace.c:14:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    test_fpu.c:12:10: fatal error: fenv.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    msgque.c:7:10: fatal error: sys/msg.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../include/uapi/linux/types.h:5:10: fatal error: asm-generic/int-ll6=
4.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    kcmp_test.c:12:10: fatal error: linux/unistd.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_single_thread.c:3:10: fatal error: linux/membarrier.h: =
No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    mincore_selftest.c:14:10: fatal error: sys/mman.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    unprivileged-remount-test.c:8:10: fatal error: sys/mount.h: No such fil=
e or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    mq_open_tests.c:33:10: fatal error: mqueue.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    reuseport_bpf.c:11:10: fatal error: error.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    mptcp_connect.c:17:10: fatal error: sys/poll.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    nf-queue.c:11:10: fatal error: arpa/inet.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    owner.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    openat2_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    rtctest.c:10:10: fatal error: linux/rtc.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    seccomp_bpf.c:16:20: error: missing binary operator before token "("
    seccomp_bpf.c:24:10: fatal error: linux/filter.h: No such file or direc=
tory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    sas.c:14:10: fatal error: sys/mman.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    bug-link-o-tmpfile.c:23:10: fatal error: sys/mount.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    compaction_test.c:12:10: fatal error: sys/mman.h: No such file or direc=
tory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    ion.h:18:10: fatal error: linux/ioctl.h: No such file or directory
    ipcsocket.c:6:10: fatal error: sys/socket.h: No such file or directory
    ionutils.c:7:10: fatal error: sys/ioctl.h: No such file or directory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    clone3_clear_sighand.c:11:10: fatal error: linux/sched.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    recursion-depth.c:24:10: fatal error: sys/mount.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    dnotify_test.c:13:17: error: =E2=80=98siginfo_t=E2=80=99 {aka =E2=80=98=
struct <anonymous>=E2=80=99} has no member named =E2=80=98si_fd=E2=80=99; d=
id you mean =E2=80=98si_code=E2=80=99?
    dnotify_test.c:21:5: error: =E2=80=98struct sigaction=E2=80=99 has no m=
ember named =E2=80=98sa_sigaction=E2=80=99
    dnotify_test.c:23:17: error: =E2=80=98SA_SIGINFO=E2=80=99 undeclared (f=
irst use in this function); did you mean =E2=80=98S_IFIFO=E2=80=99?
    dnotify_test.c:24:12: error: =E2=80=98SIGRTMIN=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98SIGTTIN=E2=80=99?
    dnotify_test.c:27:12: error: =E2=80=98F_SETSIG=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98FD_SETSIZE=E2=80=99?
    dnotify_test.c:28:12: error: =E2=80=98F_NOTIFY=E2=80=99 undeclared (fir=
st use in this function); did you mean =E2=80=98O_NOCTTY=E2=80=99?
    dnotify_test.c:28:22: error: =E2=80=98DN_MODIFY=E2=80=99 undeclared (fi=
rst use in this function)
    dnotify_test.c:28:32: error: =E2=80=98DN_CREATE=E2=80=99 undeclared (fi=
rst use in this function); did you mean =E2=80=98O_CREAT=E2=80=99?
    dnotify_test.c:28:42: error: =E2=80=98DN_MULTISHOT=E2=80=99 undeclared =
(first use in this function)
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    lib/assert.c:12:10: fatal error: execinfo.h: No such file or directory
    membarrier_test_multi_thread.c:3:10: fatal error: linux/membarrier.h: N=
o such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    ../../../include/uapi/linux/fcntl.h:5:10: fatal error: asm/fcntl.h: No =
such file or directory
    mq_perf_tests.c:38:10: fatal error: mqueue.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    reuseport_bpf_cpu.c:17:10: fatal error: arpa/inet.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pm_nl_ctl.c:4:10: fatal error: error.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pidns.c:12:10: fatal error: sys/ioctl.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    regression_enomem.c:5:10: fatal error: linux/types.h: No such file or d=
irectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    pidfd/pidfd.h:14:10: fatal error: syscall.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    resolve_test.c:12:10: fatal error: sys/mount.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    helpers.c:12:10: fatal error: syscall.h: No such file or directory
    rseq.c:25:10: fatal error: syscall.h: No such file or directory
    setdate.c:10:10: fatal error: linux/rtc.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    seccomp_benchmark.c:11:10: fatal error: linux/filter.h: No such file or=
 directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    splice_read.c:49:15: error: =E2=80=98SPLICE_F_MOVE=E2=80=99 undeclared =
(first use in this function)
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    arc-elf32-gcc: error: unrecognized command line option =E2=80=98-pthrea=
d=E2=80=99
    nanosleep.c:27:10: fatal error: sys/timex.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    gup_benchmark.c:6:10: fatal error: sys/ioctl.h: No such file or directo=
ry
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory

Warnings:
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
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
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    cc1: warning: -fsanitize=3Daddress not supported for this target
    splice_read.c:48:12: warning: implicit declaration of function =E2=80=
=98splice=E2=80=99; did you mean =E2=80=98pipe=E2=80=99? [-Wimplicit-functi=
on-declaration]

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 59 errors, 29 warnin=
gs, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    close_range_test.c:47:11: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:55:10: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:111:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    close_range_test.c:200:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    udmabuf.c:13:10: fatal error: linux/udmabuf.h: No such file or directory
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    fuse_mnt.c:17:10: fatal error: fuse.h: No such file or directory
    collect2: error: ld returned 1 exit status
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    binderfs_test.c:22:10: fatal error: linux/android/binderfs.h: No such f=
ile or directory
    include/x86_64/processor.h:14:10: fatal error: asm/msr-index.h: No such=
 file or directory
    collect2: error: ld returned 1 exit status
    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared here =
(not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=80=99 =
has initializer but incomplete type
    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98args=
=E2=80=99 isn=E2=80=99t known
    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    mlock-random-test.c:8:10: fatal error: sys/capability.h: No such file o=
r directory

Warnings:
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    close_range_test.c:47:5: warning: implicit declaration of function =E2=
=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
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
    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_args=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_setns_test.c:80:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:16:25: warning: excess elements in struct ini=
tializer

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /scratch/linux/drivers/media/tuners/mxl5005s.c:3953:1: warning: the fra=
me size of 1120 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    /scratch/linux/drivers/vhost/scsi.c:1374:1: warning: the frame size of =
1040 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    /scratch/linux/drivers/vhost/vhost.c:1906:1: warning: the frame size of=
 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]

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
    {standard input}:141: Warning: macro instruction expanded into multiple=
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
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 280 errors, 6 war=
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
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
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    execveat.c:11:10: fatal error: sys/sendfile.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/poll.h:1:10: fatal error: sys/poll.h: No such file or dire=
ctory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/linux/ioctl.h:5:10: fatal error: asm/ioctl.h: No such file=
 or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdlib.h:25:10: fatal error: bits/libc-header-start.h: No =
such file or directory
    /usr/include/syscall.h:1:10: fatal error: sys/syscall.h: No such file o=
r directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    kselftest_harness.h:56:10: fatal error: asm/types.h: No such file or di=
rectory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    seccomp_bpf.c:9:10: fatal error: sys/types.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    get_size.c:29:10: fatal error: sys/sysinfo.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    posix_timers.c:10:10: fatal error: sys/time.h: No such file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory
    /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No s=
uch file or directory
    /scratch/linux/tools/testing/selftests/kselftest_harness.h:56:10: fatal=
 error: asm/types.h: No such file or directory
    /usr/include/features.h:424:12: fatal error: sys/cdefs.h: No such file =
or directory

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING.sh
    install -m 0744 run.sh /root/build/kselftest/lkdtm/WARNING_MESSAGE.sh
    rsync -a /root/build/kselftest/lkdtm/PANIC.sh /root/build/kselftest/lkd=
tm/BUG.sh /root/build/kselftest/lkdtm/WARNING.sh /root/build/kselftest/lkdt=
m/WARNING_MESSAGE.sh /root/build/kselftest/lkdtm/EXCEPTION.sh /root/build/k=
selftest/lkdtm/LOOP.sh /root/build/kselftest/lkdtm/EXHAUST_STACK.sh /root/b=
uild/kselftest/lkdtm/CORRUPT_STACK.sh /root/build/kselftest/lkdtm/CORRUPT_S=
TACK_STRONG.sh /root/build/kselftest/lkdtm/CORRUPT_LIST_ADD.sh /root/build/=
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =
=E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused-fun=
ction]
    /scratch/linux/drivers/gpio/gpio-omap.c:1531:12: warning: =E2=80=98omap=
_gpio_resume=E2=80=99 defined but not used [-Wunused-function]
    /scratch/linux/drivers/gpio/gpio-omap.c:1519:12: warning: =E2=80=98omap=
_gpio_suspend=E2=80=99 defined but not used [-Wunused-function]

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
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    /scratch/linux/drivers/iio/iio_core_trigger.h:42:13: warning: =E2=80=98=
iio_device_unregister_trigger_consumer=E2=80=99 defined but not used [-Wunu=
sed-function]
    /scratch/linux/drivers/iio/iio_core_trigger.h:33:12: warning: =E2=80=98=
iio_device_register_trigger_consumer=E2=80=99 defined but not used [-Wunuse=
d-function]

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
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    /scratch/linux/drivers/iio/iio_core_trigger.h:42:13: warning: =E2=80=98=
iio_device_unregister_trigger_consumer=E2=80=99 defined but not used [-Wunu=
sed-function]
    /scratch/linux/drivers/iio/iio_core_trigger.h:33:12: warning: =E2=80=98=
iio_device_register_trigger_consumer=E2=80=99 defined but not used [-Wunuse=
d-function]

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
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1169:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 71 errors, 39 wa=
rnings, 0 section mismatches

Errors:
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    test_execve.c:4:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
    close_range_test.c:47:11: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:55:10: error: expected expression before =E2=80=98re=
turn=E2=80=99
    close_range_test.c:111:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
    close_range_test.c:200:11: error: expected expression before =E2=80=98r=
eturn=E2=80=99
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
    collect2: error: ld returned 1 exit status
    reuseport_bpf_numa.c:24:10: fatal error: numa.h: No such file or direct=
ory
    pm_nl_ctl.c:19:10: fatal error: linux/mptcp.h: No such file or directory
    nf-queue.c:13:10: fatal error: libmnl/libmnl.h: No such file or directo=
ry
    pidfd_wait.c:26:43: error: invalid application of =E2=80=98sizeof=E2=80=
=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    pidfd_wait.c:40:9: error: variable =E2=80=98args=E2=80=99 has initializ=
er but incomplete type
    pidfd_wait.c:41:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:42:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:43:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98flags=E2=80=99
    pidfd_wait.c:44:4: error: =E2=80=98struct clone_args=E2=80=99 has no me=
mber named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:40:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    pidfd_wait.c:125:9: error: variable =E2=80=98args=E2=80=99 has initiali=
zer but incomplete type
    pidfd_wait.c:126:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98parent_tid=E2=80=99
    pidfd_wait.c:127:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98pidfd=E2=80=99
    pidfd_wait.c:128:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98flags=E2=80=99
    pidfd_wait.c:129:4: error: =E2=80=98struct clone_args=E2=80=99 has no m=
ember named =E2=80=98exit_signal=E2=80=99
    pidfd_wait.c:125:20: error: storage size of =E2=80=98args=E2=80=99 isn=
=E2=80=99t known
    proc-fsconfig-hidepid.c:20:10: fatal error: linux/mount.h: No such file=
 or directory
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    ionmap_test.c:14:10: fatal error: drm/drm.h: No such file or directory
    test_verifier.c:25:10: fatal error: sys/capability.h: No such file or d=
irectory
    validate_cap.c:2:10: fatal error: cap-ng.h: No such file or directory
    collect2: error: ld returned 1 exit status
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
    collect2: error: ld returned 1 exit status
    tls.c:116:17: error: =E2=80=98TLS_1_3_VERSION=E2=80=99 undeclared here =
(not in a function); did you mean =E2=80=98TLS_1_2_VERSION=E2=80=99?
    tls.c:1221:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1230:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    tls.c:1273:39: error: storage size of =E2=80=98tls12=E2=80=99 isn=E2=80=
=99t known
    tls.c:1284:27: error: =E2=80=98TLS_CIPHER_AES_GCM_256=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98TLS_CIPHER_AES_GCM_1=
28=E2=80=99?
    clone3/clone3_selftests.h:55:9: error: variable =E2=80=98args=E2=80=99 =
has initializer but incomplete type
    clone3/clone3_selftests.h:55:20: error: storage size of =E2=80=98args=
=E2=80=99 isn=E2=80=99t known
    pidfd_setns_test.c:78:9: error: variable =E2=80=98args=E2=80=99 has ini=
tializer but incomplete type
    pidfd_setns_test.c:79:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98flags=E2=80=99
    pidfd_setns_test.c:80:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98exit_signal=E2=80=99
    pidfd_setns_test.c:81:4: error: =E2=80=98struct clone_args=E2=80=99 has=
 no member named =E2=80=98pidfd=E2=80=99
    pidfd_setns_test.c:78:20: error: storage size of =E2=80=98args=E2=80=99=
 isn=E2=80=99t known
    pidfd_setns_test.c:84:34: error: invalid application of =E2=80=98sizeof=
=E2=80=99 to incomplete type =E2=80=98struct clone_args=E2=80=99
    /bin/sh: 1: llc: not found
    /bin/sh: 1: clang: not found
    /bin/sh: 3: llc: not found
    mlock-random-test.c:8:10: fatal error: sys/capability.h: No such file o=
r directory

Warnings:
    Warning: Kernel ABI header at 'tools/include/uapi/linux/netlink.h' diff=
ers from latest version at 'include/uapi/linux/netlink.h'
    Warning: Kernel ABI header at 'tools/include/uapi/linux/if_link.h' diff=
ers from latest version at 'include/uapi/linux/if_link.h'
    close_range_test.c:47:5: warning: implicit declaration of function =E2=
=80=98XFAIL=E2=80=99 [-Wimplicit-function-declaration]
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
    pidfd_wait.c:24:32: warning: =E2=80=98struct clone_args=E2=80=99 declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:44:18: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd_wait.c:22:25: warning: excess elements in struct initializer
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_wait.c:129:18: warning: excess elements in struct initializer
    proc-loadavg-001.c:17: warning: "_GNU_SOURCE" redefined
    proc-self-syscall.c:16: warning: "_GNU_SOURCE" redefined
    proc-uptime-002.c:18: warning: "_GNU_SOURCE" redefined
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
kselftest/lkdtm/CORRUPT_LIST_DEL.sh /root/build/kselftest/lkdtm/CORRUPT_USE=
R_DS.sh /root/build/kselftest/lkdtm/STACK_GUARD_PAGE_LEADING.sh /root/build=
/kselftest/lkdtm/STACK_GUARD_PAGE_TRAILING.sh /root/build/kselftest/lkdtm/U=
NSET_SMEP.sh /root/build/kselftest/lkdtm/DOUBLE_FAULT.sh /root/build/kselft=
est/lkdtm/CORRUPT_PAC.sh /root/build/kselftest/lkdtm/UNALIGNED_LOAD_STORE_W=
RITE.sh /root/build/kselftest/lkdtm/OVERWRITE_ALLOCATION.sh /root/build/kse=
lftest/lkdtm/WRITE_AFTER_FREE.sh /root/build/kselftest/lkdtm/READ_AFTER_FRE=
E.sh /root/build/kselftest/lkdtm/WRITE_BUDDY_AFTER_FREE.sh /root/build/ksel=
ftest/lkdtm/READ_BUDDY_AFTER_FREE.sh /root/build/kselftest/lkdtm/SLAB_FREE_=
DOUBLE.sh /root/build/kselftest/lkdtm/SLAB_FREE_CROSS.sh /root/build/kselft=
est/lkdtm/SLAB_FREE_PAGE.sh /root/build/kselftest/lkdtm/SOFTLOCKUP.sh /root=
/build/kselftest/lkdtm/HARDLOCKUP.sh /root/build/kselftest/lkdtm/SPINLOCKUP=
.sh /root/build/kselftest/lkdtm/HUNG_TASK.sh /root/build/kselftest/lkdtm/EX=
EC_DATA.sh /root/build/kselftest/lkdtm/EXEC_STACK.sh /root/build/kselftest/=
lkdtm/EXEC_KMALLOC.sh /root/build/kselftest/lkdtm/EXEC_VMALLOC.sh /root/bui=
ld/kselftest/lkdtm/EXEC_RODATA.sh /root/build/kselftest/lkdtm/EXEC_USERSPAC=
E.sh /root/build/kselftest/lkdtm/EXEC_NULL.sh /root/build/kselftest/lkdtm/A=
CCESS_USERSPACE.sh /root/build/kselftest/lkdtm/ACCESS_NULL.sh /root/build/k=
selftest/lkdtm/WRITE_RO.sh /root/build/kselftest/lkdtm/WRITE_RO_AFTER_INIT.=
sh /root/build/kselftest/lkdtm/WRITE_KERN.sh /root/build/kselftest/lkdtm/RE=
FCOUNT_INC_OVERFLOW.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_OVERFLOW.sh=
 /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_OVERFLOW.sh /root/build/=
kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_OVERFLOW.sh /root/build/kselftest/lkd=
tm/REFCOUNT_DEC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_DEC_NEGATIVE.s=
h /root/build/kselftest/lkdtm/REFCOUNT_DEC_AND_TEST_NEGATIVE.sh /root/build=
/kselftest/lkdtm/REFCOUNT_SUB_AND_TEST_NEGATIVE.sh /root/build/kselftest/lk=
dtm/REFCOUNT_INC_ZERO.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_ZERO.sh /=
root/build/kselftest/lkdtm/REFCOUNT_INC_SATURATED.sh /root/build/kselftest/=
lkdtm/REFCOUNT_DEC_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_ADD_SA=
TURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_INC_NOT_ZERO_SATURATED.sh /=
root/build/kselftest/lkdtm/REFCOUNT_ADD_NOT_ZERO_SATURATED.sh /root/build/k=
selftest/lkdtm/REFCOUNT_DEC_AND_TEST_SATURATED.sh /root/build/kselftest/lkd=
tm/REFCOUNT_SUB_AND_TEST_SATURATED.sh /root/build/kselftest/lkdtm/REFCOUNT_=
TIMING.sh /root/build/kselftest/lkdtm/ATOMIC_TIMING.sh /root/build/kselftes=
t/lkdtm/USERCOPY_HEAP_SIZE_TO.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_=
SIZE_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_TO.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_HEAP_WHITELIST_FROM.sh /root/build/kselfte=
st/lkdtm/USERCOPY_STACK_FRAME_TO.sh /root/build/kselftest/lkdtm/USERCOPY_ST=
ACK_FRAME_FROM.sh /root/build/kselftest/lkdtm/USERCOPY_STACK_BEYOND.sh /roo=
t/build/kselftest/lkdtm/USERCOPY_KERNEL.sh /root/build/kselftest/lkdtm/USER=
COPY_KERNEL_DS.sh /root/build/kselftest/lkdtm/STACKLEAK_ERASING.sh /root/bu=
ild/kselftest/lkdtm/CFI_FORWARD_PROTO.sh /root/build/_kselftest_/lkdtm/
    tls.c:1221:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    tls.c:1273:39: warning: unused variable =E2=80=98tls12=E2=80=99 [-Wunus=
ed-variable]
    clone3/clone3_selftests.h:45:32: warning: =E2=80=98struct clone_args=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
    pidfd.h:30:21: warning: excess elements in struct initializer
    pidfd_setns_test.c:80:18: warning: excess elements in struct initializer
    clone3/clone3_selftests.h:16:25: warning: excess elements in struct ini=
tializer

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
