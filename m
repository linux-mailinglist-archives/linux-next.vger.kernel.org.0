Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F5C473D02
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 07:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhLNGKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 01:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhLNGKx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 01:10:53 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064A1C061574
        for <linux-next@vger.kernel.org>; Mon, 13 Dec 2021 22:10:53 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so16391045pja.1
        for <linux-next@vger.kernel.org>; Mon, 13 Dec 2021 22:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dGaoF+OkmwX2PbZbRnOGLxOyIm3XhA2iLxMfEYwcJF0=;
        b=zClF4kcUfM2Er27W8xO16fjsmTF5zLzZZcVCxMQLMWFoXeVS9arJFWthkQkhmN6BFm
         +G9TPSkE4O67E+Ame65otaay00qI61Ird9uYZNntEjfU7szu1LC++Krs9lQp1ZSiOkol
         9aJEGmcvS9frd/0b7xuVPFEQvVYJDRW+EEddV+V1tVL2QEn29sdZLvEbRSZKSdpqTx1Z
         wb4Xbi7ePIMnj93yquSwk4mD0iG/7YS26n0B/HoY0HTMmQPDFyEj/Mb81RzaKbTEbQgK
         imVzGf3B09upv3GemFgVlDuGA46L6HCW/VkhXbUTH5otWc72dnmsHF2ope66/XFjPcFW
         +mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dGaoF+OkmwX2PbZbRnOGLxOyIm3XhA2iLxMfEYwcJF0=;
        b=3ppRiztoHXL0i2+RcJhsvIi651cvHSTBcEXjyWZcrl11WuS2rkjCD5o6HRVE33DTzs
         N0OX2kq0N6WhTzjjDTDXIiS/3505U/snYYLlDERo9qIB2GQosII8DFwm13ubS1nxHRY/
         oE4RQsHGrin7o+LL1cv8gB1htFr43UhSq98zZ6t6n/oTsg/8Wq8eQuQ1tBWEm/lF4oW7
         15/krO6xj643fWafDqkWPM5/iVY94h4egko9X/NLoo6lKbULYMRUx1dMicZ08cRhpOJS
         1IeDfpU+aBQk8npHrHO9YQ+os9UbPaI12Ydv41py0+ti23qMnT6l0t5/VjNf5mFzfyf/
         B/Ew==
X-Gm-Message-State: AOAM530qiY7j880ewLc7ChBOV7LytxUMNdjw4aYN8GZeeRBsBpcmuUMO
        1BRXOLuCeOU57IkRd1fNIewVawue33/5wVx8
X-Google-Smtp-Source: ABdhPJzoQmltxjXa7HbvHV5HDn2yXP3zhQC4rwmtNkudrypvC2WHWdAlM9zMsu+h0BH4fiqPhgkYyQ==
X-Received: by 2002:a17:90a:6045:: with SMTP id h5mr3483378pjm.147.1639462250402;
        Mon, 13 Dec 2021 22:10:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p124sm14336603pfg.110.2021.12.13.22.10.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 22:10:49 -0800 (PST)
Message-ID: <61b83569.1c69fb81.1007c.8f19@mx.google.com>
Date:   Mon, 13 Dec 2021 22:10:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc5-6644-gbcd5ddb85fad
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 210 builds: 63 failed, 147 passed, 3073 errors,
 1016 warnings (v5.16-rc5-6644-gbcd5ddb85fad)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 210 builds: 63 failed, 147 passed, 3073 errors, 1016 war=
nings (v5.16-rc5-6644-gbcd5ddb85fad)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/v5=
.16-rc5-6644-gbcd5ddb85fad/

Tree: next
Branch: master
Git Describe: v5.16-rc5-6644-gbcd5ddb85fad
Git Commit: bcd5ddb85fad453da26afd5b3fca8ad931b5253d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL

arm:
    allmodconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    32r2el_defconfig: (gcc-10) FAIL
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    allnoconfig: (gcc-10) FAIL
    ar7_defconfig: (gcc-10) FAIL
    ath25_defconfig: (gcc-10) FAIL
    ath79_defconfig: (gcc-10) FAIL
    bcm47xx_defconfig: (gcc-10) FAIL
    bigsur_defconfig: (gcc-10) FAIL
    bmips_be_defconfig: (gcc-10) FAIL
    bmips_stb_defconfig: (gcc-10) FAIL
    cavium_octeon_defconfig: (gcc-10) FAIL
    ci20_defconfig: (gcc-10) FAIL
    cobalt_defconfig: (gcc-10) FAIL
    cu1000-neo_defconfig: (gcc-10) FAIL
    cu1830-neo_defconfig: (gcc-10) FAIL
    db1xxx_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    e55_defconfig: (gcc-10) FAIL
    fuloong2e_defconfig: (gcc-10) FAIL
    gcw0_defconfig: (gcc-10) FAIL
    gpr_defconfig: (gcc-10) FAIL
    ip22_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    jazz_defconfig: (gcc-10) FAIL
    jmr3927_defconfig: (gcc-10) FAIL
    lemote2f_defconfig: (gcc-10) FAIL
    loongson1b_defconfig: (gcc-10) FAIL
    loongson1c_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL
    malta_defconfig: (gcc-10) FAIL
    malta_kvm_defconfig: (gcc-10) FAIL
    malta_qemu_32r6_defconfig: (gcc-10) FAIL
    maltaaprp_defconfig: (gcc-10) FAIL
    maltasmvp_defconfig: (gcc-10) FAIL
    maltasmvp_eva_defconfig: (gcc-10) FAIL
    maltaup_defconfig: (gcc-10) FAIL
    maltaup_xpa_defconfig: (gcc-10) FAIL
    mpc30x_defconfig: (gcc-10) FAIL
    mtx1_defconfig: (gcc-10) FAIL
    omega2p_defconfig: (gcc-10) FAIL
    pic32mzda_defconfig: (gcc-10) FAIL
    qi_lb60_defconfig: (gcc-10) FAIL
    rb532_defconfig: (gcc-10) FAIL
    rbtx49xx_defconfig: (gcc-10) FAIL
    rm200_defconfig: (gcc-10) FAIL
    rs90_defconfig: (gcc-10) FAIL
    rt305x_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL
    tb0219_defconfig: (gcc-10) FAIL
    tb0226_defconfig: (gcc-10) FAIL
    tb0287_defconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-13): 1 error
    defconfig (clang-13): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 2 warnings

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 warnings
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-13): 12 warnings
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 10 errors
    i386_defconfig (clang-13): 2 warnings

mips:
    32r2el_defconfig (gcc-10): 52 errors, 17 warnings
    32r2el_defconfig+debug (gcc-10): 52 errors, 17 warnings
    32r2el_defconfig+kselftest (gcc-10): 52 errors, 17 warnings
    allnoconfig (gcc-10): 86 errors, 38 warnings
    ar7_defconfig (gcc-10): 52 errors, 16 warnings
    ath25_defconfig (gcc-10): 52 errors, 16 warnings
    ath79_defconfig (gcc-10): 52 errors, 16 warnings
    bcm47xx_defconfig (gcc-10): 52 errors, 16 warnings
    bigsur_defconfig (gcc-10): 55 errors, 16 warnings
    bmips_be_defconfig (gcc-10): 52 errors, 16 warnings
    bmips_stb_defconfig (gcc-10): 100 errors, 53 warnings
    cavium_octeon_defconfig (gcc-10): 55 errors, 16 warnings
    ci20_defconfig (gcc-10): 52 errors, 17 warnings
    cobalt_defconfig (gcc-10): 52 errors, 16 warnings
    cu1000-neo_defconfig (gcc-10): 52 errors, 16 warnings
    cu1830-neo_defconfig (gcc-10): 52 errors, 16 warnings
    db1xxx_defconfig (gcc-10): 52 errors, 16 warnings
    decstation_64_defconfig (gcc-10): 55 errors, 16 warnings
    decstation_defconfig (gcc-10): 52 errors, 16 warnings
    decstation_r4k_defconfig (gcc-10): 52 errors, 16 warnings
    e55_defconfig (gcc-10): 52 errors, 16 warnings
    fuloong2e_defconfig (gcc-10): 55 errors, 16 warnings
    gcw0_defconfig (gcc-10): 90 errors, 43 warnings
    gpr_defconfig (gcc-10): 52 errors, 16 warnings
    ip22_defconfig (gcc-10): 52 errors, 16 warnings
    jazz_defconfig (gcc-10): 52 errors, 16 warnings
    jmr3927_defconfig (gcc-10): 52 errors, 16 warnings
    lemote2f_defconfig (gcc-10): 55 errors, 16 warnings
    loongson1b_defconfig (gcc-10): 52 errors, 16 warnings
    loongson1c_defconfig (gcc-10): 52 errors, 16 warnings
    loongson2k_defconfig (gcc-10): 55 errors, 16 warnings
    loongson3_defconfig (gcc-10): 55 errors, 16 warnings
    malta_defconfig (gcc-10): 52 errors, 16 warnings
    malta_kvm_defconfig (gcc-10): 52 errors, 16 warnings
    malta_qemu_32r6_defconfig (gcc-10): 52 errors, 16 warnings
    maltaaprp_defconfig (gcc-10): 52 errors, 16 warnings
    maltasmvp_defconfig (gcc-10): 52 errors, 16 warnings
    maltasmvp_eva_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_xpa_defconfig (gcc-10): 52 errors, 16 warnings
    mpc30x_defconfig (gcc-10): 52 errors, 16 warnings
    mtx1_defconfig (gcc-10): 52 errors, 16 warnings
    omega2p_defconfig (gcc-10): 52 errors, 16 warnings
    pic32mzda_defconfig (gcc-10): 52 errors, 16 warnings
    qi_lb60_defconfig (gcc-10): 52 errors, 16 warnings
    rb532_defconfig (gcc-10): 52 errors, 16 warnings
    rbtx49xx_defconfig (gcc-10): 52 errors, 16 warnings
    rm200_defconfig (gcc-10): 52 errors, 16 warnings
    rs90_defconfig (gcc-10): 52 errors, 16 warnings
    rt305x_defconfig (gcc-10): 52 errors, 16 warnings
    sb1250_swarm_defconfig (gcc-10): 55 errors, 16 warnings
    tb0219_defconfig (gcc-10): 52 errors, 16 warnings
    tb0226_defconfig (gcc-10): 52 errors, 16 warnings
    tb0287_defconfig (gcc-10): 52 errors, 16 warnings
    vocore2_defconfig (gcc-10): 52 errors, 16 warnings
    xway_defconfig (gcc-10): 52 errors, 16 warnings

riscv:

x86_64:
    allmodconfig (gcc-10): 2 errors
    x86_64_defconfig (clang-13): 2 warnings

Errors summary:

    285  kernel/futex/core.c:1141:1: error: expected declaration or stateme=
nt at end of input
    60   kernel/futex/futex.h:33:20: error: invalid storage class for funct=
ion =E2=80=98should_fail_futex=E2=80=99
    60   kernel/futex/futex.h:249:1: error: invalid storage class for funct=
ion =E2=80=98double_unlock_hb=E2=80=99
    60   kernel/futex/futex.h:238:1: error: invalid storage class for funct=
ion =E2=80=98double_lock_hb=E2=80=99
    60   kernel/futex/futex.h:205:19: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_pending=E2=80=99
    60   kernel/futex/futex.h:198:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_dec=E2=80=99
    60   kernel/futex/futex.h:183:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_inc=E2=80=99
    60   kernel/futex/futex.h:169:20: error: invalid storage class for func=
tion =E2=80=98futex_queue=E2=80=99
    60   kernel/futex/futex.h:134:19: error: invalid storage class for func=
tion =E2=80=98futex_match=E2=80=99
    60   arch/mips/include/asm/futex.h:89:9: error: implicit declaration of=
 function =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean=
 =E2=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
    60   arch/mips/include/asm/futex.h:23:39: error: invalid storage class =
for function =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    57   kernel/futex/core.c:935:13: error: invalid storage class for funct=
ion =E2=80=98exit_pi_state_list=E2=80=99
    57   kernel/futex/core.c:765:13: error: invalid storage class for funct=
ion =E2=80=98exit_robust_list=E2=80=99
    57   kernel/futex/core.c:744:19: error: invalid storage class for funct=
ion =E2=80=98fetch_robust_entry=E2=80=99
    57   kernel/futex/core.c:637:12: error: invalid storage class for funct=
ion =E2=80=98handle_futex_death=E2=80=99
    57   kernel/futex/core.c:620:6: error: static declaration of =E2=80=98f=
utex_unqueue_pi=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:573:5: error: static declaration of =E2=80=98f=
utex_unqueue=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:543:6: error: static declaration of =E2=80=98_=
_futex_queue=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:536:6: error: static declaration of =E2=80=98f=
utex_q_unlock=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:513:27: error: static declaration of =E2=80=98=
futex_q_lock=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:499:6: error: static declaration of =E2=80=98_=
_futex_unqueue=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:469:6: error: static declaration of =E2=80=98w=
ait_for_owner_exiting=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:451:5: error: static declaration of =E2=80=98f=
utex_get_value_locked=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:440:5: error: static declaration of =E2=80=98f=
utex_cmpxchg_value_locked=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:429:17: error: static declaration of =E2=80=98=
futex_top_waiter=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:409:5: error: static declaration of =E2=80=98f=
ault_in_user_writeable=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:220:5: error: static declaration of =E2=80=98g=
et_futex_key=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:171:12: error: invalid storage class for funct=
ion =E2=80=98get_inode_sequence_number=E2=80=99
    57   kernel/futex/core.c:135:1: error: static declaration of =E2=80=98f=
utex_setup_timer=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:115:27: error: static declaration of =E2=80=98=
futex_hash=E2=80=99 follows non-static declaration
    57   kernel/futex/core.c:1141:15: error: initializer element is not con=
stant
    57   kernel/futex/core.c:1115:19: error: invalid storage class for func=
tion =E2=80=98futex_init=E2=80=99
    57   kernel/futex/core.c:1076:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup_end=E2=80=99
    57   kernel/futex/core.c:1050:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup_begin=E2=80=99
    57   kernel/futex/core.c:1007:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid sto=
rage class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid st=
orage class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid st=
orage class for function =E2=80=98rt_mutex_owner=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid st=
orage class for function =E2=80=98task_top_pi_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid st=
orage class for function =E2=80=98task_has_pi_waiters=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid st=
orage class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    57   kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    10   kernel/futex/syscalls.c:374:1: error: expected declaration or stat=
ement at end of input
    8    kernel/futex/core.c:859:13: error: invalid storage class for funct=
ion =E2=80=98compat_exit_robust_list=E2=80=99
    8    kernel/futex/core.c:841:1: error: invalid storage class for functi=
on =E2=80=98compat_fetch_robust_entry=E2=80=99
    8    kernel/futex/core.c:828:21: error: invalid storage class for funct=
ion =E2=80=98futex_uaddr=E2=80=99
    5    kernel/futex/syscalls.c:303:1: error: expected declaration or stat=
ement at end of input
    3    kernel/futex/syscalls.c:197:12: error: invalid storage class for f=
unction =E2=80=98futex_parse_waitv=E2=80=99
    3    kernel/futex/syscalls.c:151:1: error: invalid storage class for fu=
nction =E2=80=98futex_init_timeout=E2=80=99
    3    kernel/futex/syscalls.c:137:29: error: invalid storage class for f=
unction =E2=80=98futex_cmd_has_timeout=E2=80=99
    3    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    3    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    3    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    3    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    3    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__=
se_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__=
do_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_fut=
ex=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_s=
ys_futex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    3    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    3    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex=E2=80=99 follows non-static declaration
    3    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    3    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    3    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    3    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    3    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    2    net/wireless/reg.c:1137:23: error: implicit conversion from enumer=
ation type 'enum nl80211_user_reg_hint_type' to different enumeration type =
'enum nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    2    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    2    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_time32=E2=80=99; did you mean =E2=80=98__se_=
sys_futex_time32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    2    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_time32=E2=80=99 follows non-static declaration
    2    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98_=
_syscall_meta__set_robust_list=E2=80=99 with no linkage
    1    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98_=
_syscall_meta__get_robust_list=E2=80=99 with no linkage
    1    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98_=
_syscall_meta__futex=E2=80=99 with no linkage
    1    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98_=
_syscall_meta__futex_waitv=E2=80=99 with no linkage
    1    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98_=
_syscall_meta__futex_time32=E2=80=99 with no linkage
    1    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98=
__syscall_meta__set_robust_list=E2=80=99 with no linkage
    1    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98=
__syscall_meta__get_robust_list=E2=80=99 with no linkage
    1    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98=
__syscall_meta__futex=E2=80=99 with no linkage
    1    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98=
__syscall_meta__futex_waitv=E2=80=99 with no linkage
    1    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98=
__syscall_meta__futex_time32=E2=80=99 with no linkage
    1    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%=
d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 h=
as type =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: error: stack fram=
e size (1828) exceeds limit (1024) in function 'gbaudio_tplg_create_widget'=
 [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1244) exceeds limit (1024) in funct=
ion 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1212) exceeds limit (1024) in func=
tion 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanc=
eCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in fun=
ction 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larg=
er-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in fu=
nction 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAnd=
PerformanceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1548) exceeds limit (1024) in funct=
ion 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1356) exceeds limit (1024) in func=
tion 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerf=
ormanceCalculation' [-Werror,-Wframe-larger-than]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'

Warnings summary:

    60   cc1: some warnings being treated as errors
    60   arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixe=
d declarations and code [-Wdeclaration-after-statement]
    57   kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98fut=
ex_q_init=E2=80=99 [-Wunused-variable]
    57   kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=
=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=
=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=
=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=
=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=
=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exitin=
g=E2=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locke=
d=E2=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=
=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=
=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=
=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=
=E2=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=
=E2=80=99 defined but not used [-Wunused-function]
    57   kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=
=E2=80=99 defined but not used [-Wunused-function]
    14   include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    14   include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    14   include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed de=
clarations and code [-Wdeclaration-after-statement]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    6    net/wireless/reg.c:1137:23: warning: implicit conversion from enum=
eration type 'enum nl80211_user_reg_hint_type' to different enumeration typ=
e 'enum nl80211_reg_initiator' [-Wenum-conversion]
    6    1 warning generated.
    5    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    5    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    3    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    3    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    3    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    3    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    3    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    3    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    3    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=
=E2=80=99 defined but not used [-Wunused-function]
    3    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
waitv=E2=80=99 defined but not used [-Wunused-function]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    kernel/futex/syscalls.c:357:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    2    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
time32=E2=80=99 defined but not used [-Wunused-function]
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    1    cc1: all warnings being treated as errors
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 17 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 17 warning=
s, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 17 war=
nings, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 10 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    drivers/staging/greybus/audio_topology.c:977:12: error: stack frame siz=
e (1828) exceeds limit (1024) in function 'gbaudio_tplg_create_widget' [-We=
rror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1212) exceeds limit (1024) in function =
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalc=
ulation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1548) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1244) exceeds limit (1024) in function '=
dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

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
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-10) =E2=80=94 FAIL, 86 errors, 38 warnings, 0 sectio=
n mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__se_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__do_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    kernel/futex/syscalls.c:137:29: error: invalid storage class for functi=
on =E2=80=98futex_cmd_has_timeout=E2=80=99
    kernel/futex/syscalls.c:151:1: error: invalid storage class for functio=
n =E2=80=98futex_init_timeout=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_futex=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    kernel/futex/syscalls.c:197:12: error: invalid storage class for functi=
on =E2=80=98futex_parse_waitv=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_sys_fu=
tex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    kernel/futex/syscalls.c:303:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:303:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:303:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:303:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:303:1: error: expected declaration or statement=
 at end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_waitv=
=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=E2=80=
=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0=
 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 FAIL, 100 errors, 53 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98__sys=
call_meta__set_robust_list=E2=80=99 with no linkage
    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98__sysc=
all_meta__set_robust_list=E2=80=99 with no linkage
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__se_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98__sys=
call_meta__get_robust_list=E2=80=99 with no linkage
    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98__sysc=
all_meta__get_robust_list=E2=80=99 with no linkage
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__do_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    kernel/futex/syscalls.c:137:29: error: invalid storage class for functi=
on =E2=80=98futex_cmd_has_timeout=E2=80=99
    kernel/futex/syscalls.c:151:1: error: invalid storage class for functio=
n =E2=80=98futex_init_timeout=E2=80=99
    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98__sys=
call_meta__futex=E2=80=99 with no linkage
    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98__sysc=
all_meta__futex=E2=80=99 with no linkage
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_futex=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    kernel/futex/syscalls.c:197:12: error: invalid storage class for functi=
on =E2=80=98futex_parse_waitv=E2=80=99
    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98__sys=
call_meta__futex_waitv=E2=80=99 with no linkage
    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98__sysc=
all_meta__futex_waitv=E2=80=99 with no linkage
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_sys_fu=
tex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    include/linux/syscalls.h:155:33: error: redeclaration of =E2=80=98__sys=
call_meta__futex_time32=E2=80=99 with no linkage
    include/linux/syscalls.h:180:4: error: redeclaration of =E2=80=98__sysc=
all_meta__futex_time32=E2=80=99 with no linkage
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_time32=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex_time32=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex_time32=E2=80=99; did you mean =E2=80=98__se_sys_f=
utex_time32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_time32=E2=80=99
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:357:16: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_time3=
2=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_waitv=
=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=E2=80=
=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnin=
gs, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 17 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnin=
gs, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warni=
ngs, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__se_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_set_robust_list=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__do_sy=
s_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_get_robust_list=E2=80=99
    kernel/futex/syscalls.c:137:29: error: invalid storage class for functi=
on =E2=80=98futex_cmd_has_timeout=E2=80=99
    kernel/futex/syscalls.c:151:1: error: invalid storage class for functio=
n =E2=80=98futex_init_timeout=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_futex=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex=E2=80=99
    kernel/futex/syscalls.c:197:12: error: invalid storage class for functi=
on =E2=80=98futex_parse_waitv=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_sys_fu=
tex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_waitv=E2=80=99
    include/linux/syscalls.h:245:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_time32=E2=80=99
    include/linux/syscalls.h:247:18: error: static declaration of =E2=80=98=
__se_sys_futex_time32=E2=80=99 follows non-static declaration
    include/linux/syscalls.h:249:14: error: implicit declaration of functio=
n =E2=80=98__do_sys_futex_time32=E2=80=99; did you mean =E2=80=98__se_sys_f=
utex_time32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/linux/syscalls.h:255:21: error: invalid storage class for funct=
ion =E2=80=98__do_sys_futex_time32=E2=80=99
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input
    kernel/futex/syscalls.c:374:1: error: expected declaration or statement=
 at end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:357:16: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed declara=
tions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed declarat=
ions and code [-Wdeclaration-after-statement]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_time3=
2=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_waitv=
=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=E2=80=
=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_robust_=
list=E2=80=99 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' =
defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' d=
efined but not used [-Wunused-const-variable=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings, 0=
 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warn=
ings, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnin=
gs, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings=
, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 12 warnings, 0=
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
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, =
0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0=
 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warning=
s, 0 section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:828:21: error: invalid storage class for function =
=E2=80=98futex_uaddr=E2=80=99
    kernel/futex/core.c:841:1: error: invalid storage class for function =
=E2=80=98compat_fetch_robust_entry=E2=80=99
    kernel/futex/core.c:859:13: error: invalid storage class for function =
=E2=80=98compat_exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
section mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/include/asm/futex.h:89:9: error: implicit declaration of func=
tion =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean =E2=
=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    arch/mips/include/asm/futex.h:23:39: error: invalid storage class for f=
unction =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    kernel/futex/futex.h:33:20: error: invalid storage class for function =
=E2=80=98should_fail_futex=E2=80=99
    kernel/futex/futex.h:134:19: error: invalid storage class for function =
=E2=80=98futex_match=E2=80=99
    kernel/futex/futex.h:169:20: error: invalid storage class for function =
=E2=80=98futex_queue=E2=80=99
    kernel/futex/futex.h:183:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_inc=E2=80=99
    kernel/futex/futex.h:198:20: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_dec=E2=80=99
    kernel/futex/futex.h:205:19: error: invalid storage class for function =
=E2=80=98futex_hb_waiters_pending=E2=80=99
    kernel/futex/futex.h:238:1: error: invalid storage class for function =
=E2=80=98double_lock_hb=E2=80=99
    kernel/futex/futex.h:249:1: error: invalid storage class for function =
=E2=80=98double_unlock_hb=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid storage =
class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid storage=
 class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid storage=
 class for function =E2=80=98task_has_pi_waiters=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid storage=
 class for function =E2=80=98task_top_pi_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid storage=
 class for function =E2=80=98rt_mutex_owner=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid storage=
 class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid storage=
 class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid storage=
 class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    kernel/futex/core.c:115:27: error: static declaration of =E2=80=98futex=
_hash=E2=80=99 follows non-static declaration
    kernel/futex/core.c:135:1: error: static declaration of =E2=80=98futex_=
setup_timer=E2=80=99 follows non-static declaration
    kernel/futex/core.c:171:12: error: invalid storage class for function =
=E2=80=98get_inode_sequence_number=E2=80=99
    kernel/futex/core.c:220:5: error: static declaration of =E2=80=98get_fu=
tex_key=E2=80=99 follows non-static declaration
    kernel/futex/core.c:409:5: error: static declaration of =E2=80=98fault_=
in_user_writeable=E2=80=99 follows non-static declaration
    kernel/futex/core.c:429:17: error: static declaration of =E2=80=98futex=
_top_waiter=E2=80=99 follows non-static declaration
    kernel/futex/core.c:440:5: error: static declaration of =E2=80=98futex_=
cmpxchg_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:451:5: error: static declaration of =E2=80=98futex_=
get_value_locked=E2=80=99 follows non-static declaration
    kernel/futex/core.c:469:6: error: static declaration of =E2=80=98wait_f=
or_owner_exiting=E2=80=99 follows non-static declaration
    kernel/futex/core.c:499:6: error: static declaration of =E2=80=98__fute=
x_unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:513:27: error: static declaration of =E2=80=98futex=
_q_lock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:536:6: error: static declaration of =E2=80=98futex_=
q_unlock=E2=80=99 follows non-static declaration
    kernel/futex/core.c:543:6: error: static declaration of =E2=80=98__fute=
x_queue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:573:5: error: static declaration of =E2=80=98futex_=
unqueue=E2=80=99 follows non-static declaration
    kernel/futex/core.c:620:6: error: static declaration of =E2=80=98futex_=
unqueue_pi=E2=80=99 follows non-static declaration
    kernel/futex/core.c:637:12: error: invalid storage class for function =
=E2=80=98handle_futex_death=E2=80=99
    kernel/futex/core.c:744:19: error: invalid storage class for function =
=E2=80=98fetch_robust_entry=E2=80=99
    kernel/futex/core.c:765:13: error: invalid storage class for function =
=E2=80=98exit_robust_list=E2=80=99
    kernel/futex/core.c:935:13: error: invalid storage class for function =
=E2=80=98exit_pi_state_list=E2=80=99
    kernel/futex/core.c:1007:13: error: invalid storage class for function =
=E2=80=98futex_cleanup=E2=80=99
    kernel/futex/core.c:1050:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_begin=E2=80=99
    kernel/futex/core.c:1076:13: error: invalid storage class for function =
=E2=80=98futex_cleanup_end=E2=80=99
    kernel/futex/core.c:1115:19: error: invalid storage class for function =
=E2=80=98futex_init=E2=80=99
    kernel/futex/core.c:1141:15: error: initializer element is not constant
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input
    kernel/futex/core.c:1141:1: error: expected declaration or statement at=
 end of input

Warnings:
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98futex_q_=
init=E2=80=99 [-Wunused-variable]
    kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=E2=80=
=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exiting=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locked=E2=
=80=99 defined but not used [-Wunused-function]
    kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=80=99=
 defined but not used [-Wunused-function]
    kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=99 def=
ined but not used [-Wunused-function]
    kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=80=99=
 defined but not used [-Wunused-function]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
