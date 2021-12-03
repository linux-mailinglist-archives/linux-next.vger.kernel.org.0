Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153E64675D5
	for <lists+linux-next@lfdr.de>; Fri,  3 Dec 2021 12:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243864AbhLCLFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Dec 2021 06:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbhLCLFk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Dec 2021 06:05:40 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65928C06173E
        for <linux-next@vger.kernel.org>; Fri,  3 Dec 2021 03:02:15 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id f125so2729182pgc.0
        for <linux-next@vger.kernel.org>; Fri, 03 Dec 2021 03:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kFMbPsssU2JrWYqLuamRBX+Z8BJDk2QRv9vg3YBpkb4=;
        b=eMNeC+WD65wfWMg1mEiu+ObU12clvgxS2EAV0BbfopUxXK13r/L6HzbMQI+IaKS/l+
         mr0SV4kkahNkdRSod1z6FmzxzKwf1+5eR+4HFuqG8JItamtA1l/Of9QK6iECBPd0M15O
         mEHT2+IwO04BTjBdO+Cm6ePcKJqBypL2fjqWj7+g9b9IGL6pEzuTS2d9pCojtUTmhJFV
         i9vd2pNgXQ+KvR1dLmlBgefU9JwBH2jmzPy3xkNnpHUEUeo8TYED1MjZlANQj/jTe3nB
         GYIXvh2xHllKIoqq4SNkJCdN3NLn3uQfaT7H4bz2v1qXQ2tAihUE7FDSUMJs2wlfrFVE
         WFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kFMbPsssU2JrWYqLuamRBX+Z8BJDk2QRv9vg3YBpkb4=;
        b=Nr/sHdkGkHWlcwnOqRu2MJntxVshrleZRAJ7eSkZj04dfyx2CgOeVisfokT3FAvLkF
         HhWBUuJf5gcOs/RKryHbW7jxS3skqKxYv/YNXCbaDVji/mgz+wAag5BICw8XISGdXKGG
         94+5Aj0QoDzIPln9wIG1Y1EYzy8CsPl61bvA1b4rC+BnHSpjgrXUK4qWJgpDNbSWSkZ4
         2mdT65Pd2rxf2rBMjQsdAIwVVP4vmTj8VSEuaG8obKkuG30yn2HuyR9qnfCpER4yqQBO
         MqX+zPOk/5ktEZbVZkDmL60rdzmB87rfp0j3f1uYnUBt8gSS6o/86cna5/BrNFLCyYgw
         Nafw==
X-Gm-Message-State: AOAM532CDiJDiK2IadoU9mB/rGnNfb/0MP14d3LMhhja99Zosbd8iO5I
        Weds9LjS+gCG+5ttvnNupHXfp17XGYzXR6uu
X-Google-Smtp-Source: ABdhPJypLIfRjDsdJcsEoat3Ho3eCX7dQBGNrBBzP20gW+bNRDVcXJpWb7YujVG0ZGbu0setQPGCdQ==
X-Received: by 2002:aa7:93ce:0:b0:4a8:19fc:f024 with SMTP id y14-20020aa793ce000000b004a819fcf024mr18613717pff.10.1638529332889;
        Fri, 03 Dec 2021 03:02:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t67sm2902303pfd.24.2021.12.03.03.02.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 03:02:12 -0800 (PST)
Message-ID: <61a9f934.1c69fb81.1fff2.8907@mx.google.com>
Date:   Fri, 03 Dec 2021 03:02:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20211203
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 211 builds: 68 failed, 143 passed, 3181 errors,
 1127 warnings (next-20211203)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 211 builds: 68 failed, 143 passed, 3181 errors, 1127 war=
nings (next-20211203)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211203/

Tree: next
Branch: master
Git Describe: next-20211203
Git Commit: 7afeac307a9561e3a93682c1e7eb22f918aa1187
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL

arm:
    allmodconfig: (clang-13) FAIL
    aspeed_g5_defconfig: (clang-13) FAIL
    aspeed_g5_defconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    32r2el_defconfig: (gcc-10) FAIL
    32r2el_defconfig+debug: (gcc-10) FAIL
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
    ip32_defconfig: (gcc-10) FAIL
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
    sb1250_swarm_defconfig: (gcc-10) FAIL
    tb0219_defconfig: (gcc-10) FAIL
    tb0226_defconfig: (gcc-10) FAIL
    tb0287_defconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL
    workpad_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    tinyconfig (gcc-10): 3 warnings

arm64:
    allmodconfig (clang-13): 2 errors, 1 warning
    defconfig (clang-13): 4 warnings
    defconfig (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 4 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 1 warning
    defconfig+arm64-chromebook+kselftest (gcc-10): 1 warning
    defconfig+debug (gcc-10): 1 warning

arm:
    allmodconfig (clang-13): 5 errors, 16 warnings
    aspeed_g5_defconfig (clang-13): 3 errors, 9 warnings
    aspeed_g5_defconfig (gcc-10): 3 errors
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 warnings
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-13): 12 warnings
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    tct_hammer_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-13): 10 errors, 1 warning
    i386_defconfig (clang-13): 2 warnings
    tinyconfig (gcc-10): 2 warnings

mips:
    32r2el_defconfig (gcc-10): 52 errors, 17 warnings
    32r2el_defconfig+debug (gcc-10): 52 errors, 17 warnings
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
    fuloong2e_defconfig (gcc-10): 101 errors, 53 warnings
    gcw0_defconfig (gcc-10): 52 errors, 16 warnings
    gpr_defconfig (gcc-10): 52 errors, 16 warnings
    ip22_defconfig (gcc-10): 52 errors, 16 warnings
    ip32_defconfig (gcc-10): 55 errors, 16 warnings
    jazz_defconfig (gcc-10): 52 errors, 16 warnings
    jmr3927_defconfig (gcc-10): 52 errors, 16 warnings
    lemote2f_defconfig (gcc-10): 55 errors, 16 warnings
    loongson1b_defconfig (gcc-10): 52 errors, 16 warnings
    loongson1c_defconfig (gcc-10): 52 errors, 16 warnings
    loongson2k_defconfig (gcc-10): 55 errors, 16 warnings
    loongson3_defconfig (gcc-10): 55 errors, 16 warnings
    malta_defconfig (gcc-10): 52 errors, 16 warnings
    malta_kvm_defconfig (gcc-10): 52 errors, 16 warnings
    malta_qemu_32r6_defconfig (gcc-10): 90 errors, 43 warnings
    maltaaprp_defconfig (gcc-10): 52 errors, 16 warnings
    maltasmvp_defconfig (gcc-10): 52 errors, 16 warnings
    maltasmvp_eva_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_defconfig (gcc-10): 52 errors, 16 warnings
    maltaup_xpa_defconfig (gcc-10): 52 errors, 16 warnings
    mpc30x_defconfig (gcc-10): 52 errors, 16 warnings
    mtx1_defconfig (gcc-10): 52 errors, 16 warnings
    omega2p_defconfig (gcc-10): 90 errors, 43 warnings
    pic32mzda_defconfig (gcc-10): 52 errors, 16 warnings
    qi_lb60_defconfig (gcc-10): 52 errors, 16 warnings
    rb532_defconfig (gcc-10): 52 errors, 16 warnings
    rbtx49xx_defconfig (gcc-10): 90 errors, 43 warnings
    rm200_defconfig (gcc-10): 52 errors, 16 warnings
    rs90_defconfig (gcc-10): 52 errors, 16 warnings
    sb1250_swarm_defconfig (gcc-10): 55 errors, 16 warnings
    tb0219_defconfig (gcc-10): 52 errors, 16 warnings
    tb0226_defconfig (gcc-10): 52 errors, 16 warnings
    tb0287_defconfig (gcc-10): 52 errors, 16 warnings
    vocore2_defconfig (gcc-10): 52 errors, 16 warnings
    workpad_defconfig (gcc-10): 52 errors, 16 warnings
    xway_defconfig (gcc-10): 52 errors, 16 warnings

riscv:
    defconfig (gcc-10): 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-13): 2 warnings
    defconfig+debug (gcc-10): 1 warning
    rv32_defconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-13): 2 errors, 15 warnings
    tinyconfig (gcc-10): 2 warnings
    x86_64_defconfig (clang-13): 2 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 1 warning

Errors summary:

    285  kernel/futex/core.c:1141:1: error: expected declaration or stateme=
nt at end of input
    61   kernel/futex/futex.h:33:20: error: invalid storage class for funct=
ion =E2=80=98should_fail_futex=E2=80=99
    61   kernel/futex/futex.h:249:1: error: invalid storage class for funct=
ion =E2=80=98double_unlock_hb=E2=80=99
    61   kernel/futex/futex.h:238:1: error: invalid storage class for funct=
ion =E2=80=98double_lock_hb=E2=80=99
    61   kernel/futex/futex.h:205:19: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_pending=E2=80=99
    61   kernel/futex/futex.h:198:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_dec=E2=80=99
    61   kernel/futex/futex.h:183:20: error: invalid storage class for func=
tion =E2=80=98futex_hb_waiters_inc=E2=80=99
    61   kernel/futex/futex.h:169:20: error: invalid storage class for func=
tion =E2=80=98futex_queue=E2=80=99
    61   kernel/futex/futex.h:134:19: error: invalid storage class for func=
tion =E2=80=98futex_match=E2=80=99
    61   arch/mips/include/asm/futex.h:89:9: error: implicit declaration of=
 function =E2=80=98arch_futex_atomic_op_inuser_local=E2=80=99; did you mean=
 =E2=80=98futex_atomic_op_inuser_local=E2=80=99? [-Werror=3Dimplicit-functi=
on-declaration]
    61   arch/mips/include/asm/futex.h:23:39: error: invalid storage class =
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
    20   kernel/futex/syscalls.c:374:1: error: expected declaration or stat=
ement at end of input
    9    kernel/futex/core.c:859:13: error: invalid storage class for funct=
ion =E2=80=98compat_exit_robust_list=E2=80=99
    9    kernel/futex/core.c:841:1: error: invalid storage class for functi=
on =E2=80=98compat_fetch_robust_entry=E2=80=99
    9    kernel/futex/core.c:828:21: error: invalid storage class for funct=
ion =E2=80=98futex_uaddr=E2=80=99
    4    net/wireless/reg.c:1137:23: error: implicit conversion from enumer=
ation type 'enum nl80211_user_reg_hint_type' to different enumeration type =
'enum nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    4    kernel/futex/syscalls.c:197:12: error: invalid storage class for f=
unction =E2=80=98futex_parse_waitv=E2=80=99
    4    kernel/futex/syscalls.c:151:1: error: invalid storage class for fu=
nction =E2=80=98futex_init_timeout=E2=80=99
    4    kernel/futex/syscalls.c:137:29: error: invalid storage class for f=
unction =E2=80=98futex_cmd_has_timeout=E2=80=99
    4    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    4    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    4    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    4    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    4    include/linux/syscalls.h:255:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    4    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__=
se_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__=
do_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex=E2=80=99; did you mean =E2=80=98__se_sys_fut=
ex=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_waitv=E2=80=99; did you mean =E2=80=98__se_s=
ys_futex_waitv=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    include/linux/syscalls.h:249:14: error: implicit declaration of fu=
nction =E2=80=98__do_sys_futex_time32=E2=80=99; did you mean =E2=80=98__se_=
sys_futex_time32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_set_robust_list=E2=80=99 follows non-static declaration
    4    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_get_robust_list=E2=80=99 follows non-static declaration
    4    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex=E2=80=99 follows non-static declaration
    4    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_waitv=E2=80=99 follows non-static declaration
    4    include/linux/syscalls.h:247:18: error: static declaration of =E2=
=80=98__se_sys_futex_time32=E2=80=99 follows non-static declaration
    4    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_set_robust_list=E2=80=99
    4    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_get_robust_list=E2=80=99
    4    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex=E2=80=99
    4    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_waitv=E2=80=99
    4    include/linux/syscalls.h:245:21: error: invalid storage class for =
function =E2=80=98__do_sys_futex_time32=E2=80=99
    4    fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitiali=
zed whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    ld.lld: error: undefined symbol: drm_gem_cma_prime_import_sg_table
    1    ld.lld: error: undefined symbol: drm_gem_cma_dumb_create
    1    ld.lld: error: undefined symbol: drm_fb_cma_get_gem_obj
    1    include/linux/compat.h:87:21: error: invalid storage class for fun=
ction =E2=80=98__do_compat_sys_set_robust_list=E2=80=99
    1    include/linux/compat.h:87:21: error: invalid storage class for fun=
ction =E2=80=98__do_compat_sys_get_robust_list=E2=80=99
    1    include/linux/compat.h:82:14: error: implicit declaration of funct=
ion =E2=80=98__do_compat_sys_set_robust_list=E2=80=99; did you mean =E2=80=
=98__se_compat_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    1    include/linux/compat.h:82:14: error: implicit declaration of funct=
ion =E2=80=98__do_compat_sys_get_robust_list=E2=80=99; did you mean =E2=80=
=98__do_compat_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
    1    include/linux/compat.h:80:18: error: static declaration of =E2=80=
=98__se_compat_sys_set_robust_list=E2=80=99 follows non-static declaration
    1    include/linux/compat.h:80:18: error: static declaration of =E2=80=
=98__se_compat_sys_get_robust_list=E2=80=99 follows non-static declaration
    1    include/linux/compat.h:78:21: error: invalid storage class for fun=
ction =E2=80=98__do_compat_sys_set_robust_list=E2=80=99
    1    include/linux/compat.h:78:21: error: invalid storage class for fun=
ction =E2=80=98__do_compat_sys_get_robust_list=E2=80=99
    1    drivers/staging/greybus/audio_topology.c:977:12: error: stack fram=
e size (1804) exceeds limit (1024) in function 'gbaudio_tplg_create_widget'=
 [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1032) exceeds limit (1024) in function '__igt_reserve' [-Werror,-Wfr=
ame-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1116) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1276) exceeds limit (1024) in funct=
ion 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1196) exceeds limit (1024) in func=
tion 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanc=
eCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in fun=
ction 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larg=
er-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1276) exceeds limit (1024) in fu=
nction 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAnd=
PerformanceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1612) exceeds limit (1024) in funct=
ion 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1356) exceeds limit (1024) in func=
tion 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerf=
ormanceCalculation' [-Werror,-Wframe-larger-than]
    1    crypto/wp512.c:782:13: error: stack frame size (1176) exceeds limi=
t (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    arm-linux-gnueabihf-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.=
rodata+0x3c): undefined reference to `drm_gem_cma_dumb_create'
    1    arm-linux-gnueabihf-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.=
rodata+0x34): undefined reference to `drm_gem_cma_prime_import_sg_table'
    1    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least v=
ersion 4.6 of GCC [-Werror,-W#warnings]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:1=
87: undefined reference to `drm_fb_cma_get_gem_obj'

Warnings summary:

    61   cc1: some warnings being treated as errors
    61   arch/mips/include/asm/futex.h:132:1: warning: ISO C90 forbids mixe=
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
    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    20   include/linux/syscalls.h:255:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    20   include/linux/syscalls.h:245:2: warning: ISO C90 forbids mixed dec=
larations and code [-Wdeclaration-after-statement]
    20   include/linux/syscalls.h:242:13: warning: ISO C90 forbids mixed de=
clarations and code [-Wdeclaration-after-statement]
    12   fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=
=E2=80=99 [-Wunused-variable]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    9    1 warning generated.
    6    net/wireless/reg.c:1137:23: warning: implicit conversion from enum=
eration type 'enum nl80211_user_reg_hint_type' to different enumeration typ=
e 'enum nl80211_reg_initiator' [-Wenum-conversion]
    4    kernel/futex/syscalls.c:50:10: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    4    kernel/futex/syscalls.c:357:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    4    kernel/futex/syscalls.c:29:41: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    4    kernel/futex/syscalls.c:248:10: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    4    kernel/futex/syscalls.c:165:16: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    4    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_set_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    4    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_get_ro=
bust_list=E2=80=99 defined but not used [-Wunused-function]
    4    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex=
=E2=80=99 defined but not used [-Wunused-function]
    4    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
waitv=E2=80=99 defined but not used [-Wunused-function]
    4    include/linux/syscalls.h:247:18: warning: =E2=80=98__se_sys_futex_=
time32=E2=80=99 defined but not used [-Wunused-function]
    4    fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to s=
ilence this warning
    3    fs/inode.c:73:29: warning: =E2=80=98inodes_stat=E2=80=99 defined b=
ut not used [-Wunused-variable]
    3    fs/dcache.c:128:29: warning: =E2=80=98dentry_stat=E2=80=99 defined=
 but not used [-Wunused-variable]
    3    fs/9p/vfs_addr.c:140:16: warning: unused variable 'inode' [-Wunuse=
d-variable]
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    include/linux/compat.h:87:2: warning: ISO C90 forbids mixed declar=
ations and code [-Wdeclaration-after-statement]
    2    include/linux/compat.h:78:2: warning: ISO C90 forbids mixed declar=
ations and code [-Wdeclaration-after-statement]
    2    include/linux/compat.h:75:13: warning: ISO C90 forbids mixed decla=
rations and code [-Wdeclaration-after-statement]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0xdc: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_setup()+0xa2: call to cpuid_eax()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_st=
ack_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0xdd: call to mce_=
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
    1    kernel/futex/syscalls.c:318:1: warning: =E2=80=98alias=E2=80=99 at=
tribute ignored [-Wattributes]
    1    kernel/futex/syscalls.c:307:10: warning: =E2=80=98alias=E2=80=99 a=
ttribute ignored [-Wattributes]
    1    include/linux/compat.h:80:18: warning: =E2=80=98__se_compat_sys_se=
t_robust_list=E2=80=99 defined but not used [-Wunused-function]
    1    include/linux/compat.h:80:18: warning: =E2=80=98__se_compat_sys_ge=
t_robust_list=E2=80=99 defined but not used [-Wunused-function]
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x1095: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    1    fs/inode.c:73:29: warning: 'inodes_stat' defined but not used [-Wu=
nused-variable]
    1    fs/dcache.c:128:29: warning: 'dentry_stat' defined but not used [-=
Wunused-variable]
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    #warning This code requires at least version 4.6 of GCC

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x712b3): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149d57): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149d0f): Section mismatch in r=
eference from the function __first_node() to the variable .init.data:numa_n=
odes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149cd4): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x149cc8): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x149c88): Section mismatch in r=
eference from the function __nodes_weight() to the variable .init.data:numa=
_nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149c22): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x149c0e): Section mismatch in r=
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
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 10 errors, 1 warning, 0 secti=
on mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    drivers/staging/greybus/audio_topology.c:977:12: error: stack frame siz=
e (1804) exceeds limit (1024) in function 'gbaudio_tplg_create_widget' [-We=
rror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1116) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1196) exceeds limit (1024) in function =
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalc=
ulation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1276) exceeds limit (1024) in function '=
dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1276) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1612) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]

Warnings:
    fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silenc=
e this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 15 warnings, 0 se=
ction mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0xdc: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_p=
age() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_setup()+0xa2: call to cpuid_eax() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0xdd: call to mce_gathe=
r_info() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
1095: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silenc=
e this warning

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x149c0e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x149c22): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x149c88): Section mismatch in refere=
nce from the function __nodes_weight() to the variable .init.data:numa_node=
s_parsed
    WARNING: modpost: vmlinux.o(.text+0x149cc8): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x149cd4): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x149d0f): Section mismatch in refere=
nce from the function __first_node() to the variable .init.data:numa_nodes_=
parsed
    WARNING: modpost: vmlinux.o(.text+0x149d57): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silenc=
e this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 5 errors, 16 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least versio=
n 4.6 of GCC [-Werror,-W#warnings]
    crypto/wp512.c:782:13: error: stack frame size (1176) exceeds limit (10=
24) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    net/wireless/reg.c:1137:23: error: implicit conversion from enumeration=
 type 'enum nl80211_user_reg_hint_type' to different enumeration type 'enum=
 nl80211_reg_initiator' [-Werror,-Wenum-conversion]
    fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1032) exceeds limit (1024) in function '__igt_reserve' [-Werror,-Wframe-l=
arger-than]

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
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    #warning This code requires at least version 4.6 of GCC
    fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silenc=
e this warning

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
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 FAIL, 3 errors, 9 warnings, 0=
 section mismatches

Errors:
    ld.lld: error: undefined symbol: drm_gem_cma_prime_import_sg_table
    ld.lld: error: undefined symbol: drm_gem_cma_dumb_create
    ld.lld: error: undefined symbol: drm_fb_cma_get_gem_obj

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

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    arm-linux-gnueabihf-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodat=
a+0x34): undefined reference to `drm_gem_cma_prime_import_sg_table'
    arm-linux-gnueabihf-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodat=
a+0x3c): undefined reference to `drm_gem_cma_dumb_create'
    /tmp/kci/linux/build/../drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c:187: u=
ndefined reference to `drm_fb_cma_get_gem_obj'

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
    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit_addr=
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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    net/wireless/reg.c:1137:23: warning: implicit conversion from enumerati=
on type 'enum nl80211_user_reg_hint_type' to different enumeration type 'en=
um nl80211_reg_initiator' [-Wenum-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

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
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 FAIL, 101 errors, 53 warnings,=
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
    include/linux/compat.h:78:21: error: invalid storage class for function=
 =E2=80=98__do_compat_sys_set_robust_list=E2=80=99
    include/linux/compat.h:80:18: error: static declaration of =E2=80=98__s=
e_compat_sys_set_robust_list=E2=80=99 follows non-static declaration
    include/linux/compat.h:82:14: error: implicit declaration of function =
=E2=80=98__do_compat_sys_set_robust_list=E2=80=99; did you mean =E2=80=98__=
se_compat_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declar=
ation]
    include/linux/compat.h:87:21: error: invalid storage class for function=
 =E2=80=98__do_compat_sys_set_robust_list=E2=80=99
    include/linux/compat.h:78:21: error: invalid storage class for function=
 =E2=80=98__do_compat_sys_get_robust_list=E2=80=99
    include/linux/compat.h:80:18: error: static declaration of =E2=80=98__s=
e_compat_sys_get_robust_list=E2=80=99 follows non-static declaration
    include/linux/compat.h:82:14: error: implicit declaration of function =
=E2=80=98__do_compat_sys_get_robust_list=E2=80=99; did you mean =E2=80=98__=
do_compat_sys_set_robust_list=E2=80=99? [-Werror=3Dimplicit-function-declar=
ation]
    include/linux/compat.h:87:21: error: invalid storage class for function=
 =E2=80=98__do_compat_sys_get_robust_list=E2=80=99
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
    kernel/futex/syscalls.c:307:10: warning: =E2=80=98alias=E2=80=99 attrib=
ute ignored [-Wattributes]
    include/linux/compat.h:75:13: warning: ISO C90 forbids mixed declaratio=
ns and code [-Wdeclaration-after-statement]
    include/linux/compat.h:78:2: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
    include/linux/compat.h:87:2: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
    kernel/futex/syscalls.c:318:1: warning: =E2=80=98alias=E2=80=99 attribu=
te ignored [-Wattributes]
    include/linux/compat.h:75:13: warning: ISO C90 forbids mixed declaratio=
ns and code [-Wdeclaration-after-statement]
    include/linux/compat.h:78:2: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
    include/linux/compat.h:87:2: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
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
    include/linux/compat.h:80:18: warning: =E2=80=98__se_compat_sys_get_rob=
ust_list=E2=80=99 defined but not used [-Wunused-function]
    include/linux/compat.h:80:18: warning: =E2=80=98__se_compat_sys_set_rob=
ust_list=E2=80=99 defined but not used [-Wunused-function]
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
gcw0_defconfig (mips, gcc-10) =E2=80=94 FAIL, 52 errors, 16 warnings, 0 sec=
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
ip32_defconfig (mips, gcc-10) =E2=80=94 FAIL, 55 errors, 16 warnings, 0 sec=
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
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warn=
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
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings, 0 =
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
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 90 errors, 43 warnings, 0=
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
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/dcache.c:128:29: warning: =E2=80=98dentry_stat=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/inode.c:73:29: warning: =E2=80=98inodes_stat=E2=80=99 defined but no=
t used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/dcache.c:128:29: warning: =E2=80=98dentry_stat=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/inode.c:73:29: warning: =E2=80=98inodes_stat=E2=80=99 defined but no=
t used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/dcache.c:128:29: warning: =E2=80=98dentry_stat=E2=80=99 defined but =
not used [-Wunused-variable]
    fs/inode.c:73:29: warning: =E2=80=98inodes_stat=E2=80=99 defined but no=
t used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    fs/dcache.c:128:29: warning: 'dentry_stat' defined but not used [-Wunus=
ed-variable]
    fs/inode.c:73:29: warning: 'inodes_stat' defined but not used [-Wunused=
-variable]

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
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    fs/9p/vfs_addr.c:140:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]

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
