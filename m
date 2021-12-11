Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B62D470F2C
	for <lists+linux-next@lfdr.de>; Sat, 11 Dec 2021 01:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244030AbhLKAJ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Dec 2021 19:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243876AbhLKAJ2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Dec 2021 19:09:28 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14074C061714
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 16:05:53 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso10618636pji.0
        for <linux-next@vger.kernel.org>; Fri, 10 Dec 2021 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GiRAd2TMqvPMFTebizino8bQhTQmL+MJ89rqBIFTXgs=;
        b=HP6AIeLY1EWd6AuNakDQHQKyZahf/LEgJEgE8+OtZ5Xp4pnkaceiaik33sKnX/zEwb
         WvjL5pxKb0dl+9/mEWCtb/MLhjZKtWjRh6YD64PLV/xjXBZF2KNDbAl8vDfcpmU0hc4e
         nttjNPxaa6jJtvwpyB646hXD4kRe6H8cMRf7YaHge1nqURj90qQkMUomoRKifqd3rWhX
         6cNJkKB1iFnb4CFA+MrqhL5nDvOCMnpYO1eoZSEQbW0r5NnD/pGLA0BK/yC4h/N8J3U7
         BUzZuF9RLmPInKoWcmbQ5vz2REn1aRHw9h1lIuqRdcaWrNcIP8uFu8qOVPkBqpFN5OHT
         dzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GiRAd2TMqvPMFTebizino8bQhTQmL+MJ89rqBIFTXgs=;
        b=Puo6LwoVrG2LCyksA3JQ5z7YgtzZh/IXOAyBAW3Se3f9hRrUHYYEfYHEitx0M2bASA
         Y4a1rg1wSIT+WZ8xb89IMaiR32qNBEIe4iPZrpN26V01iqRXZiiAfQDqeaIn1OtLwqXX
         Mw3lzLlZKc+JJIrOtWiVxL2h8EDMlRBHAAZ51rgFcTTr58Dp1xs31m1YAyw+BxcV+V4X
         a5qIa0PlJ6Gfs0F3MxhY5YCJLmtyf2wEMFovLHSkK08EGJulJH4SCiFg6OsXLvmPgLob
         ZzWSMiA8bVac44bo1ebGIQtx5dO1DnQJs2UYqdzTUzQyqYb9EPT1R7cvXsmHaincERkf
         sTDg==
X-Gm-Message-State: AOAM533ICZD18zJMSIsf1tXX2LWFuCio1MlqWOawj7BCY9npwIlzQQWM
        nEO6q4d/NGyVR1E2KvPl73QSlwsY3+QYyium
X-Google-Smtp-Source: ABdhPJyhmoUgQsR7N1CqvvWJlY2GcQ4TBEOt9PpmwIPHUuJRaLoao5jPrR1amFmMsd6yv0g/LrnnqQ==
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr27739891pjb.232.1639181150614;
        Fri, 10 Dec 2021 16:05:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y31sm4587788pfa.92.2021.12.10.16.05.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 16:05:49 -0800 (PST)
Message-ID: <61b3eb5d.1c69fb81.78ea1.ed66@mx.google.com>
Date:   Fri, 10 Dec 2021 16:05:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.16-rc4-6579-gea922272cbe5
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 207 builds: 62 failed, 145 passed, 3280 errors,
 1136 warnings (v5.16-rc4-6579-gea922272cbe5)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 207 builds: 62 failed, 145 passed, 3280 errors, 1136 war=
nings (v5.16-rc4-6579-gea922272cbe5)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/v5=
.16-rc4-6579-gea922272cbe5/

Tree: next
Branch: master
Git Describe: v5.16-rc4-6579-gea922272cbe5
Git Commit: ea922272cbe547bdf58da2aaf240d59782c6a009
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-10) FAIL
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
    capcella_defconfig: (gcc-10) FAIL
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
    ip28_defconfig: (gcc-10) FAIL
    jazz_defconfig: (gcc-10) FAIL
    jmr3927_defconfig: (gcc-10) FAIL
    lemote2f_defconfig: (gcc-10) FAIL
    loongson1b_defconfig: (gcc-10) FAIL
    loongson1c_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL
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
    tb0287_defconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL
    workpad_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    tinyconfig (gcc-10): 1 warning

arm64:
    defconfig (clang-13): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 2 warnings

arm:
    allmodconfig (gcc-10): 1 error, 1 warning
    aspeed_g5_defconfig (clang-13): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 warnings
    multi_v7_defconfig (clang-13): 12 warnings
    multi_v7_defconfig+kselftest (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 6 errors
    i386_defconfig (clang-13): 2 warnings
    i386_defconfig+kselftest (gcc-10): 1 warning

mips:
    32r2el_defconfig (gcc-10): 52 errors, 17 warnings
    32r2el_defconfig+debug (gcc-10): 52 errors, 17 warnings
    32r2el_defconfig+kselftest (gcc-10): 148 errors, 59 warnings
    allnoconfig (gcc-10): 52 errors, 16 warnings
    ar7_defconfig (gcc-10): 52 errors, 16 warnings
    ath25_defconfig (gcc-10): 52 errors, 16 warnings
    ath79_defconfig (gcc-10): 52 errors, 16 warnings
    bcm47xx_defconfig (gcc-10): 52 errors, 16 warnings
    bigsur_defconfig (gcc-10): 55 errors, 16 warnings
    bmips_be_defconfig (gcc-10): 52 errors, 16 warnings
    bmips_stb_defconfig (gcc-10): 52 errors, 16 warnings
    capcella_defconfig (gcc-10): 52 errors, 16 warnings
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
    loongson1c_defconfig (gcc-10): 90 errors, 43 warnings
    loongson2k_defconfig (gcc-10): 55 errors, 16 warnings
    loongson3_defconfig (gcc-10): 55 errors, 16 warnings
    malta_kvm_defconfig (gcc-10): 52 errors, 16 warnings
    malta_qemu_32r6_defconfig (gcc-10): 52 errors, 16 warnings
    maltaaprp_defconfig (gcc-10): 52 errors, 16 warnings
    maltasmvp_defconfig (gcc-10): 90 errors, 43 warnings
    maltasmvp_eva_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_xpa_defconfig (gcc-10): 52 errors, 16 warnings
    mpc30x_defconfig (gcc-10): 52 errors, 16 warnings
    mtx1_defconfig (gcc-10): 52 errors, 16 warnings
    omega2p_defconfig (gcc-10): 52 errors, 16 warnings
    pic32mzda_defconfig (gcc-10): 52 errors, 16 warnings
    qi_lb60_defconfig (gcc-10): 52 errors, 16 warnings
    rb532_defconfig (gcc-10): 90 errors, 43 warnings
    rbtx49xx_defconfig (gcc-10): 52 errors, 16 warnings
    rm200_defconfig (gcc-10): 138 errors, 47 warnings
    rs90_defconfig (gcc-10): 52 errors, 16 warnings
    rt305x_defconfig (gcc-10): 52 errors, 16 warnings
    sb1250_swarm_defconfig (gcc-10): 55 errors, 16 warnings
    tb0219_defconfig (gcc-10): 52 errors, 16 warnings
    tb0287_defconfig (gcc-10): 52 errors, 16 warnings
    vocore2_defconfig (gcc-10): 52 errors, 16 warnings
    workpad_defconfig (gcc-10): 52 errors, 16 warnings
    xway_defconfig (gcc-10): 52 errors, 16 warnings

riscv:

x86_64:
    allmodconfig (clang-13): 1 error, 16 warnings
    x86_64_defconfig (clang-13): 2 warnings

Errors summary:

    280  kernel/futex/core.c:1141:1: error: expected declaration or stateme=
nt at end of input
    64   kernel/futex/futex.h:33:20: error: invalid storage class for funct=
ion =E2=80=98should_fail_futex=E2=80=99
    64   kernel/futex/futex.h:249:1: error: invalid storage class for funct=
ion =E2=80=98double_unlock_hb=E2=80=99
    64   kernel/futex/futex.h:238:1: error: invalid storage class for funct=
ion =E2=80=98double_lock_hb=E2=80=99
    64   kernel/futex/futex.h:205:19: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_pending=E2=80=99
    64   kernel/futex/futex.h:198:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_dec=E2=80=99
    64   kernel/futex/futex.h:183:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_inc=E2=80=99
    64   kernel/futex/futex.h:169:20: error: invalid storage class for func=
tion =E2=80=98futex_queue=E2=80=99
    64   kernel/futex/futex.h:134:19: error: invalid storage class for func=
tion =E2=80=98futex_match=E2=80=99
    64   arch/mips/include/asm/futex.h:89:9: error: implicit declaration of=
 function =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean=
 =E2=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
    64   arch/mips/include/asm/futex.h:23:39: error: invalid storage class =
for function =E2=80=98futex_atomic_cmpxchg_inatomic=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:93:19: error: invalid sto=
rage class for function =E2=80=98rt_mutex_has_waiters=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:199:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_init_rtlock_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:190:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_init_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:184:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_free_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:178:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_init_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:172:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_proxy_unlock=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:166:20: error: invalid st=
orage class for function =E2=80=98debug_rt_mutex_unlock=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:158:20: error: invalid st=
orage class for function =E2=80=98__rt_mutex_base_init=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:136:35: error: invalid st=
orage class for function =E2=80=98rt_mutex_owner=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:128:39: error: invalid st=
orage class for function =E2=80=98task_top_pi_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:123:19: error: invalid st=
orage class for function =E2=80=98task_has_pi_waiters=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:111:39: error: invalid st=
orage class for function =E2=80=98rt_mutex_top_waiter=E2=80=99
    58   kernel/futex/../locking/rtmutex_common.h:103:20: error: invalid st=
orage class for function =E2=80=98rt_mutex_waiter_is_top_waiter=E2=80=99
    56   kernel/futex/core.c:935:13: error: invalid storage class for funct=
ion =E2=80=98exit_pi_state_list=E2=80=99
    56   kernel/futex/core.c:765:13: error: invalid storage class for funct=
ion =E2=80=98exit_robust_list=E2=80=99
    56   kernel/futex/core.c:744:19: error: invalid storage class for funct=
ion =E2=80=98fetch_robust_entry=E2=80=99
    56   kernel/futex/core.c:637:12: error: invalid storage class for funct=
ion =E2=80=98handle_futex_death=E2=80=99
    56   kernel/futex/core.c:620:6: error: static declaration of =E2=80=98f=
utex_unqueue_pi=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:573:5: error: static declaration of =E2=80=98f=
utex_unqueue=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:543:6: error: static declaration of =E2=80=98_=
_futex_queue=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:536:6: error: static declaration of =E2=80=98f=
utex_q_unlock=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:513:27: error: static declaration of =E2=80=98=
futex_q_lock=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:499:6: error: static declaration of =E2=80=98_=
_futex_unqueue=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:469:6: error: static declaration of =E2=80=98w=
ait_for_owner_exiting=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:451:5: error: static declaration of =E2=80=98f=
utex_get_value_locked=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:440:5: error: static declaration of =E2=80=98f=
utex_cmpxchg_value_locked=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:429:17: error: static declaration of =E2=80=98=
futex_top_waiter=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:409:5: error: static declaration of =E2=80=98f=
ault_in_user_writeable=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:220:5: error: static declaration of =E2=80=98g=
et_futex_key=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:171:12: error: invalid storage class for funct=
ion =E2=80=98get_inode_sequence_number=E2=80=99
    56   kernel/futex/core.c:135:1: error: static declaration of =E2=80=98f=
utex_setup_timer=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:115:27: error: static declaration of =E2=80=98=
futex_hash=E2=80=99 follows non-static declaration
    56   kernel/futex/core.c:1141:15: error: initializer element is not con=
stant
    56   kernel/futex/core.c:1115:19: error: invalid storage class for func=
tion =E2=80=98futex_init=E2=80=99
    56   kernel/futex/core.c:1076:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup_end=E2=80=99
    56   kernel/futex/core.c:1050:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup_begin=E2=80=99
    56   kernel/futex/core.c:1007:13: error: invalid storage class for func=
tion =E2=80=98futex_cleanup=E2=80=99
    30   kernel/futex/syscalls.c:374:1: error: expected declaration or stat=
ement at end of input
    10   kernel/futex/pi.c:1232:1: error: expected declaration or statement=
 at end of input
    8    kernel/futex/core.c:859:13: error: invalid storage class for funct=
ion =E2=80=98compat_exit_robust_list=E2=80=99
    8    kernel/futex/core.c:841:1: error: invalid storage class for functi=
on =E2=80=98compat_fetch_robust_entry=E2=80=99
    8    kernel/futex/core.c:828:21: error: invalid storage class for funct=
ion =E2=80=98futex_uaddr=E2=80=99
    6    kernel/futex/syscalls.c:197:12: error: invalid storage class for f=
unction =E2=80=98futex_parse_waitv=E2=80=99
    6    kernel/futex/syscalls.c:151:1: error: invalid storage class for fu=
nction =E2=80=98futex_init_timeout=E2=80=99
    6    kernel/futex/syscalls.c:137:29: error: invalid storage class for f=
unction =E2=80=98futex_cmd_has_timeout=E2=80=99
    6    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    6    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    6    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    6    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    6    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    6    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__=
se_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    6    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__=
do_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    6    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_fut=
ex=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    6    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_s=
ys_futex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    6    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_time32=E2=80=99; did you mean =E2=80=98__se_=
sys_futex_time32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    6    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    6    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    6    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex=E2=80=99 follows non-static declaration
    6    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    6    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_time32=E2=80=99 follows non-static declaration
    6    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    6    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    6    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    6    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    6    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    2    net/wireless/reg.c:1137:23: error: implicit conversion from enumer=
ation type 'enum nl80211_user_reg_hint_type' to different enumeration type =
'enum nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    2    kernel/futex/pi.c:930:5: error: static declaration of =E2=80=98fut=
ex_lock_pi=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:884:5: error: static declaration of =E2=80=98fix=
up_pi_owner=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:855:12: error: invalid storage class for functio=
n =E2=80=98fixup_pi_state_owner=E2=80=99
    2    kernel/futex/pi.c:77:6: error: static declaration of =E2=80=98put_=
pi_state=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:68:6: error: static declaration of =E2=80=98get_=
pi_state=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:683:12: error: invalid storage class for functio=
n =E2=80=98__fixup_pi_state_owner=E2=80=99
    2    kernel/futex/pi.c:613:12: error: invalid storage class for functio=
n =E2=80=98wake_futex_pi=E2=80=99
    2    kernel/futex/pi.c:514:5: error: static declaration of =E2=80=98fut=
ex_lock_pi_atomic=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:474:12: error: invalid storage class for functio=
n =E2=80=98lock_pi_update_atomic=E2=80=99
    2    kernel/futex/pi.c:45:13: error: invalid storage class for function=
 =E2=80=98pi_state_update_owner=E2=80=99
    2    kernel/futex/pi.c:410:12: error: invalid storage class for functio=
n =E2=80=98attach_to_pi_owner=E2=80=99
    2    kernel/futex/pi.c:376:13: error: invalid storage class for functio=
n =E2=80=98__attach_to_pi_owner=E2=80=99
    2    kernel/futex/pi.c:35:31: error: invalid storage class for function=
 =E2=80=98alloc_pi_state=E2=80=99
    2    kernel/futex/pi.c:320:12: error: invalid storage class for functio=
n =E2=80=98handle_exit_race=E2=80=99
    2    kernel/futex/pi.c:30:26: error: assignment to =E2=80=98struct fute=
x_pi_state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex_=
pi_state *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    2    kernel/futex/pi.c:202:12: error: invalid storage class for functio=
n =E2=80=98attach_to_pi_state=E2=80=99
    2    kernel/futex/pi.c:12:5: error: static declaration of =E2=80=98refi=
ll_pi_state_cache=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:1100:5: error: static declaration of =E2=80=98fu=
tex_unlock_pi=E2=80=99 follows non-static declaration
    2    kernel/futex/pi.c:108:27: error: assignment to =E2=80=98struct fut=
ex_pi_state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex=
_pi_state *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    2    include/asm-generic/current.h:7:23: error: initialization of =E2=
=80=98struct futex_pi_state *=E2=80=99 from incompatible pointer type =E2=
=80=98struct futex_pi_state *=E2=80=99 [-Werror=3Dincompatible-pointer-type=
s]
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
    1    drivers/staging/greybus/audio_topology.c:977:12: error: stack fram=
e size (1828) exceeds limit (1024) in function 'gbaudio_tplg_create_widget'=
 [-Werror,-Wframe-larger-than]
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
    1    drivers/android/binder.c:2511:21: error: cast to pointer from inte=
ger of different size [-Werror=3Dint-to-pointer-cast]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    64   cc1: some warnings being treated as errors
    64   arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixe=
d declarations and code [-Wdeclaration-after-statement]
    56   kernel/futex/futex.h:111:29: warning: unused variable =E2=80=98fut=
ex_q_init=E2=80=99 [-Wunused-variable]
    56   kernel/futex/core.c:620:6: warning: =E2=80=98futex_unqueue_pi=E2=
=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:573:5: warning: =E2=80=98futex_unqueue=E2=80=
=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:543:6: warning: =E2=80=98__futex_queue=E2=80=
=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:536:6: warning: =E2=80=98futex_q_unlock=E2=80=
=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:513:27: warning: =E2=80=98futex_q_lock=E2=80=
=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:469:6: warning: =E2=80=98wait_for_owner_exitin=
g=E2=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:451:5: warning: =E2=80=98futex_get_value_locke=
d=E2=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:429:17: warning: =E2=80=98futex_top_waiter=E2=
=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:220:5: warning: =E2=80=98get_futex_key=E2=80=
=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:135:1: warning: =E2=80=98futex_setup_timer=E2=
=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:1108:6: warning: =E2=80=98futex_exit_release=
=E2=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:1090:6: warning: =E2=80=98futex_exec_release=
=E2=80=99 defined but not used [-Wunused-function]
    56   kernel/futex/core.c:1042:6: warning: =E2=80=98futex_exit_recursive=
=E2=80=99 defined but not used [-Wunused-function]
    30   include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    30   include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    30   include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed de=
clarations and code [-Wdeclaration-after-statement]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    6    net/wireless/reg.c:1137:23: warning: implicit conversion from enum=
eration type 'enum nl80211_user_reg_hint_type' to different enumeration typ=
e 'enum nl80211_reg_initiator' [-Wenum-conversion]
    6    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    6    kernel/futex/syscalls.c:357:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    6    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    6    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    6    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    6    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    6    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    6    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=
=E2=80=99 defined but not used [-Wunused-function]
    6    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
waitv=E2=80=99 defined but not used [-Wunused-function]
    6    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
time32=E2=80=99 defined but not used [-Wunused-function]
    6    1 warning generated.
    5    include/linux/syscalls.h:179:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    5    include/linux/syscalls.h:155:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    3    drivers/android/binder.c:2511:21: warning: cast to pointer from in=
teger of different size [-Wint-to-pointer-cast]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    kernel/futex/pi.c:930:5: warning: =E2=80=98futex_lock_pi=E2=80=99 =
defined but not used [-Wunused-function]
    2    kernel/futex/pi.c:1100:5: warning: =E2=80=98futex_unlock_pi=E2=80=
=99 defined but not used [-Wunused-function]
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_setup()+0xa4: call to cpuid_eax()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_sta=
ck_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0xce: call to mce_=
gather_info() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    1    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_reque=
st_post() falls through to next function mpi3mr_process_op_reply_q()
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15e197): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15e122): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15e10e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 148 errors, 59 wa=
rnings, 0 section mismatches

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
    kernel/futex/pi.c:12:5: error: static declaration of =E2=80=98refill_pi=
_state_cache=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:30:26: error: assignment to =E2=80=98struct futex_pi_=
state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex_pi_st=
ate *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:35:31: error: invalid storage class for function =E2=
=80=98alloc_pi_state=E2=80=99
    include/asm-generic/current.h:7:23: error: initialization of =E2=80=98s=
truct futex_pi_state *=E2=80=99 from incompatible pointer type =E2=80=98str=
uct futex_pi_state *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:45:13: error: invalid storage class for function =E2=
=80=98pi_state_update_owner=E2=80=99
    kernel/futex/pi.c:68:6: error: static declaration of =E2=80=98get_pi_st=
ate=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:77:6: error: static declaration of =E2=80=98put_pi_st=
ate=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:108:27: error: assignment to =E2=80=98struct futex_pi=
_state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex_pi_s=
tate *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:202:12: error: invalid storage class for function =E2=
=80=98attach_to_pi_state=E2=80=99
    kernel/futex/pi.c:320:12: error: invalid storage class for function =E2=
=80=98handle_exit_race=E2=80=99
    kernel/futex/pi.c:376:13: error: invalid storage class for function =E2=
=80=98__attach_to_pi_owner=E2=80=99
    kernel/futex/pi.c:410:12: error: invalid storage class for function =E2=
=80=98attach_to_pi_owner=E2=80=99
    kernel/futex/pi.c:474:12: error: invalid storage class for function =E2=
=80=98lock_pi_update_atomic=E2=80=99
    kernel/futex/pi.c:514:5: error: static declaration of =E2=80=98futex_lo=
ck_pi_atomic=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:613:12: error: invalid storage class for function =E2=
=80=98wake_futex_pi=E2=80=99
    kernel/futex/pi.c:683:12: error: invalid storage class for function =E2=
=80=98__fixup_pi_state_owner=E2=80=99
    kernel/futex/pi.c:855:12: error: invalid storage class for function =E2=
=80=98fixup_pi_state_owner=E2=80=99
    kernel/futex/pi.c:884:5: error: static declaration of =E2=80=98fixup_pi=
_owner=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:930:5: error: static declaration of =E2=80=98futex_lo=
ck_pi=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:1100:5: error: static declaration of =E2=80=98futex_u=
nlock_pi=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
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
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    kernel/futex/pi.c:1100:5: warning: =E2=80=98futex_unlock_pi=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/pi.c:930:5: warning: =E2=80=98futex_lock_pi=E2=80=99 defin=
ed but not used [-Wunused-function]
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
    drivers/android/binder.c:2511:21: warning: cast to pointer from integer=
 of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    drivers/android/binder.c:2511:21: error: cast to pointer from integer o=
f different size [-Werror=3Dint-to-pointer-cast]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 16 warnings, 0 sec=
tion mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_pa=
ge() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_setup()+0xa4: call to cpuid_eax() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0xce: call to mce_gathe=
r_info() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_request_po=
st() falls through to next function mpi3mr_process_op_reply_q()

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x15e10e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15e122): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15e197): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    drivers/staging/greybus/audio_topology.c:977:12: error: stack frame siz=
e (1828) exceeds limit (1024) in function 'gbaudio_tplg_create_widget' [-We=
rror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1548) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sectio=
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
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

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
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, =
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
capcella_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0=
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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    drivers/android/binder.c:2511:21: warning: cast to pointer from integer=
 of different size [-Wint-to-pointer-cast]

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
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
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
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
loongson1c_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings,=
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
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings, =
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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

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
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    drivers/android/binder.c:2511:21: warning: cast to pointer from integer=
 of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings, 0 se=
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
rm200_defconfig (mips, gcc-10) =E2=80=94 FAIL, 138 errors, 47 warnings, 0 s=
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
    kernel/futex/pi.c:12:5: error: static declaration of =E2=80=98refill_pi=
_state_cache=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:30:26: error: assignment to =E2=80=98struct futex_pi_=
state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex_pi_st=
ate *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:35:31: error: invalid storage class for function =E2=
=80=98alloc_pi_state=E2=80=99
    include/asm-generic/current.h:7:23: error: initialization of =E2=80=98s=
truct futex_pi_state *=E2=80=99 from incompatible pointer type =E2=80=98str=
uct futex_pi_state *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:45:13: error: invalid storage class for function =E2=
=80=98pi_state_update_owner=E2=80=99
    kernel/futex/pi.c:68:6: error: static declaration of =E2=80=98get_pi_st=
ate=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:77:6: error: static declaration of =E2=80=98put_pi_st=
ate=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:108:27: error: assignment to =E2=80=98struct futex_pi=
_state *=E2=80=99 from incompatible pointer type =E2=80=98struct futex_pi_s=
tate *=E2=80=99 [-Werror=3Dincompatible-pointer-types]
    kernel/futex/pi.c:202:12: error: invalid storage class for function =E2=
=80=98attach_to_pi_state=E2=80=99
    kernel/futex/pi.c:320:12: error: invalid storage class for function =E2=
=80=98handle_exit_race=E2=80=99
    kernel/futex/pi.c:376:13: error: invalid storage class for function =E2=
=80=98__attach_to_pi_owner=E2=80=99
    kernel/futex/pi.c:410:12: error: invalid storage class for function =E2=
=80=98attach_to_pi_owner=E2=80=99
    kernel/futex/pi.c:474:12: error: invalid storage class for function =E2=
=80=98lock_pi_update_atomic=E2=80=99
    kernel/futex/pi.c:514:5: error: static declaration of =E2=80=98futex_lo=
ck_pi_atomic=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:613:12: error: invalid storage class for function =E2=
=80=98wake_futex_pi=E2=80=99
    kernel/futex/pi.c:683:12: error: invalid storage class for function =E2=
=80=98__fixup_pi_state_owner=E2=80=99
    kernel/futex/pi.c:855:12: error: invalid storage class for function =E2=
=80=98fixup_pi_state_owner=E2=80=99
    kernel/futex/pi.c:884:5: error: static declaration of =E2=80=98fixup_pi=
_owner=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:930:5: error: static declaration of =E2=80=98futex_lo=
ck_pi=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:1100:5: error: static declaration of =E2=80=98futex_u=
nlock_pi=E2=80=99 follows non-static declaration
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
    kernel/futex/pi.c:1232:1: error: expected declaration or statement at e=
nd of input
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
    arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    cc1: some warnings being treated as errors
    kernel/futex/pi.c:1100:5: warning: =E2=80=98futex_unlock_pi=E2=80=99 de=
fined but not used [-Wunused-function]
    kernel/futex/pi.c:930:5: warning: =E2=80=98futex_lock_pi=E2=80=99 defin=
ed but not used [-Wunused-function]
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
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

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
workpad_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 =
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
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

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
