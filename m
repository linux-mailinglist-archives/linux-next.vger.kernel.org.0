Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF28435F7A
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 12:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhJUKqs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 06:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhJUKqs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 06:46:48 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B883C061749
        for <linux-next@vger.kernel.org>; Thu, 21 Oct 2021 03:44:32 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 187so242274pfc.10
        for <linux-next@vger.kernel.org>; Thu, 21 Oct 2021 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AVvQYgZJUfQXKW+rG3PSsSl1JBAcvNWWlSSiWkg5oXU=;
        b=4oPCE9RXLu5BNAaQqhzZSLxduINsz3SluOyjP7m05Eh+jLKgYf2kAoBQs/vPWdaHS8
         cJ0B6x0w45NtAT0YY4K4iG9i0dBd6magG08CQkCSFQXX3fK0iw1W5Z4svsS6AqdqvQh3
         WAa7j3tVZWIgMl6ZthknWd5lnenEqY0fum6hZdbauvzFumnzbD5I0f90pmcZC4oe8TjY
         Q1haLBccBsng/4aRb7eHCRXHnWO0l4gZ3CKf9denRwkAYfvtOZfSkvgxR9RvaQCvpDZe
         QqfIc/q7cZBbz2bnfj94YdZLS349OJhX/7q6ebThhIrxlIN3BQR3l1pHE4i0hasCmtb+
         M2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AVvQYgZJUfQXKW+rG3PSsSl1JBAcvNWWlSSiWkg5oXU=;
        b=u++hWbGqJlsV8bbrEfRzmINaJ+gTnp5wfykQ341B+sTdvuEsXrikBbhTSBcL0UmvQz
         PzJ5fpja7qGrk2Zo8LahE/PDJhXHeCddZ9t+t1DCqB+aOvGBvVMpF3PqDR8i5BqKTyCE
         Em6qc2XHGpMP7AJdoTU6KdN9auitPSe7sDQzwN4t26R5YqtqQwFN42IQ5Glhgm+Ewdk/
         71bDJvvZ2+XhBPny+XiZDW+stm7q5sak/QZitEwSOV3e04fB5zMyEhx6LJAVLjMZI/IH
         yA2vsJXRsVLQW8U2KeDKUAJYFklvzcpmIAF8OPZ8HUCjUuJ1nrsxeGrhF3HA9us0yRmg
         aDIQ==
X-Gm-Message-State: AOAM532tZTS8AjrFqYVS8UHdbIn3JqdqXxtVonk0ACPKoPHZW8c8hq8r
        zM1/9TeomhTdFrgGo6YSPUOQyiB0OsbZKoKvr9c=
X-Google-Smtp-Source: ABdhPJxtZJzUT5VeOsSE8u9O1tSkWqeG6p5/JiFBaZT5EAgfEMG7A2XM16G+0xVXXqTK8d0tuJwGGg==
X-Received: by 2002:a05:6a00:2353:b0:44d:e2fd:2293 with SMTP id j19-20020a056a00235300b0044de2fd2293mr4657241pfj.68.1634813069614;
        Thu, 21 Oct 2021 03:44:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h1sm6099290pfh.183.2021.10.21.03.44.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 03:44:29 -0700 (PDT)
Message-ID: <6171448d.1c69fb81.403de.02b0@mx.google.com>
Date:   Thu, 21 Oct 2021 03:44:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211021
X-Kernelci-Report-Type: build
Subject: next/master build: 230 builds: 37 failed, 193 passed, 479 errors,
 276 warnings (next-20211021)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 230 builds: 37 failed, 193 passed, 479 errors, 276 warni=
ngs (next-20211021)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211021/

Tree: next
Branch: master
Git Describe: next-20211021
Git Commit: 3196a52aff93186897f15f1a6c03220ce6523d82
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    defconfig: (clang-10) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allnoconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    multi_v7_defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    am200epdkit_defconfig: (gcc-10) FAIL
    badge4_defconfig: (gcc-10) FAIL
    cerfcube_defconfig: (gcc-10) FAIL
    corgi_defconfig: (gcc-10) FAIL
    imote2_defconfig: (gcc-10) FAIL
    keystone_defconfig: (gcc-10) FAIL
    lart_defconfig: (gcc-10) FAIL
    magician_defconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy: (gcc-10) FAIL
    pcm027_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    simpad_defconfig: (gcc-10) FAIL
    socfpga_defconfig: (gcc-10) FAIL
    viper_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    lemote2f_defconfig: (gcc-10) FAIL
    mtx1_defconfig: (gcc-10) FAIL
    rt305x_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    x86_64_defconfig: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-10): 133 errors, 2 warnings
    allmodconfig (clang-13): 4 errors, 2 warnings
    defconfig (clang-10): 129 errors, 4 warnings
    defconfig (clang-13): 8 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 129 errors, 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 8 warnings

arm:
    allmodconfig (clang-13): 7 errors, 14 warnings
    allmodconfig (clang-10): 33 errors, 16 warnings
    allmodconfig (gcc-10): 6 errors, 1 warning
    allnoconfig (clang-10): 1 error
    am200epdkit_defconfig (gcc-10): 1 error
    aspeed_g5_defconfig (clang-10): 2 errors
    aspeed_g5_defconfig (clang-13): 14 warnings
    keystone_defconfig (gcc-10): 2 errors, 1 warning
    magician_defconfig (gcc-10): 1 error
    multi_v7_defconfig (clang-10): 5 errors, 8 warnings
    multi_v7_defconfig (clang-13): 16 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 4 errors
    rpc_defconfig (gcc-10): 4 errors
    socfpga_defconfig (gcc-10): 2 errors, 5 warnings

i386:
    allmodconfig (clang-13): 3 errors, 1 warning
    allmodconfig (clang-10): 3 errors, 1 warning

mips:
    32r2el_defconfig (gcc-10): 3 warnings
    32r2el_defconfig+kselftest (gcc-10): 4 warnings
    ar7_defconfig (gcc-10): 2 warnings
    ath25_defconfig (gcc-10): 2 warnings
    ath79_defconfig (gcc-10): 2 warnings
    bcm47xx_defconfig (gcc-10): 2 warnings
    bcm63xx_defconfig (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 6 warnings
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 1 warning
    capcella_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 6 warnings
    ci20_defconfig (gcc-10): 3 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 6 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    e55_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 6 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    gpr_defconfig (gcc-10): 2 warnings
    ip22_defconfig (gcc-10): 2 warnings
    ip32_defconfig (gcc-10): 6 warnings
    jazz_defconfig (gcc-10): 2 warnings
    jmr3927_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 6 warnings
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 6 warnings
    loongson3_defconfig (gcc-10): 6 warnings
    malta_defconfig (gcc-10): 2 warnings
    malta_kvm_defconfig (gcc-10): 2 warnings
    malta_qemu_32r6_defconfig (gcc-10): 2 warnings
    maltaaprp_defconfig (gcc-10): 2 warnings
    maltasmvp_defconfig (gcc-10): 2 warnings
    maltasmvp_eva_defconfig (gcc-10): 2 warnings
    maltaup_defconfig (gcc-10): 2 warnings
    maltaup_xpa_defconfig (gcc-10): 2 warnings
    mpc30x_defconfig (gcc-10): 2 warnings
    mtx1_defconfig (gcc-10): 2 warnings
    nlm_xlp_defconfig (gcc-10): 6 warnings
    nlm_xlr_defconfig (gcc-10): 2 warnings
    omega2p_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rb532_defconfig (gcc-10): 2 warnings
    rbtx49xx_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 3 warnings
    rs90_defconfig (gcc-10): 1 warning
    rt305x_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 4 warnings
    tb0219_defconfig (gcc-10): 2 warnings
    tb0226_defconfig (gcc-10): 2 warnings
    tb0287_defconfig (gcc-10): 2 warnings
    vocore2_defconfig (gcc-10): 1 warning
    workpad_defconfig (gcc-10): 2 warnings
    xway_defconfig (gcc-10): 2 errors, 4 warnings

riscv:

x86_64:
    allmodconfig (clang-13): 2 errors, 4 warnings
    allmodconfig (clang-10): 3 errors, 3 warnings
    allmodconfig (gcc-10): 2 errors
    allnoconfig (clang-10): 3 warnings
    x86_64_defconfig (clang-10): 1 error

Errors summary:

    6    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used un=
initialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitiali=
zed]
    6    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used un=
initialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitiali=
zed]
    3    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' =
is used uninitialized whenever switch default is taken [-Werror,-Wsometimes=
-uninitialized]
    3    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' =
is used uninitialized whenever switch default is taken [-Werror,-Wsometimes=
-uninitialized]
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocatio=
n name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocatio=
n name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocati=
on name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocat=
ion name
    3    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocat=
ion name
    3    arch/arm/kernel/entry-armv.S:506:4: error: invalid instruction, an=
y one of the following would fix this:
    3    arch/arm/kernel/entry-armv.S:502:4: error: invalid instruction, an=
y one of the following would fix this:
    2    drivers/mfd/altera-a10sr.c:159:1: error: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-W=
error=3Dimplicit-int]
    2    drivers/mfd/altera-a10sr.c:153:1: error: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-W=
error=3Dimplicit-int]
    2    arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
    2    arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-marc=
h=3D=E2=80=99
    2    api.c:(.text+0x59c): undefined reference to `crypto_alg_tested'
    2    <instantiation>:2:2: error: unknown use of instruction mnemonic wi=
thout a size suffix
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    stm32-dma.c:(.text+0x10a8): undefined reference to `__aeabi_uldivm=
od'
    1    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size =
of 1332 bytes in function 'hist_trigger_print_key' [-Werror,-Wframe-larger-=
than=3D]
    1    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size =
(1400) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werror,-=
Wframe-larger-than]
    1    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size =
(1336) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werror,-=
Wframe-larger-than]
    1    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declarat=
ion of function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    1    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burs=
t_len=E2=80=99 undeclared (first use in this function)
    1    drivers/mmc/host/sdhci-omap.c:1478:7: error: =E2=80=98sdhci_omap_r=
untime_resume=E2=80=99 undeclared here (not in a function); did you mean =
=E2=80=98sdhci_omap_context_save=E2=80=99?
    1    drivers/mmc/host/sdhci-omap.c:1477:21: error: =E2=80=98sdhci_omap_=
runtime_suspend=E2=80=99 undeclared here (not in a function); did you mean =
=E2=80=98sdhci_pltfm_suspend=E2=80=99?
    1    drivers/mfd/altera-a10sr.c:159:21: error: a parameter list without=
 types is only allowed in a function definition
    1    drivers/mfd/altera-a10sr.c:159:1: error: parameter names (without =
types) in function declaration [-Werror]
    1    drivers/mfd/altera-a10sr.c:159:1: error: declaration specifier mis=
sing, defaulting to 'int' [-Werror]
    1    drivers/mfd/altera-a10sr.c:159:1: error: data definition has no ty=
pe or storage class [-Werror]
    1    drivers/mfd/altera-a10sr.c:153:21: error: a parameter list without=
 types is only allowed in a function definition
    1    drivers/mfd/altera-a10sr.c:153:1: error: parameter names (without =
types) in function declaration [-Werror]
    1    drivers/mfd/altera-a10sr.c:153:1: error: declaration specifier mis=
sing, defaulting to 'int' [-Werror]
    1    drivers/mfd/altera-a10sr.c:153:1: error: data definition has no ty=
pe or storage class [-Werror]
    1    clang: error: unsupported argument '-mimplicit-it=3Dalways' to opt=
ion 'Wa,'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1170): undefined refe=
rence to `__aeabi_uldivmod'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x114c): undefined refe=
rence to `__aeabi_uldivmod'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x10c8): undefined refe=
rence to `__aeabi_uldivmod'
    1    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemb=
le to exactly 4 bytes
    1    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
    1    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression
    1    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-bar=
riers
    1    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    1    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:125:2: error: instruction requires: data-ba=
rriers
    1    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
    1    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
    1    arch/arm/mach-mvebu/coherency_ll.S:155:2: error: instruction requi=
res: data-barriers
    1    arch/arm/mach-mvebu/coherency_ll.S:128:2: error: instruction requi=
res: data-barriers
    1    arch/arm/mach-imx/suspend-imx6.S:315:2: error: instruction require=
s: data-barriers

Warnings summary:

    152  <stdin>:1559:2: warning: #warning syscall futex_waitv not implemen=
ted [-Wcpp]
    29   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    14   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   mm/memory-failure.c:871:17: note: initialize the variable 'extra_p=
ins' to silence this warning
    10   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    9    2 warnings generated.
    7    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the v=
ariable 'val' to silence this warning
    4    mm/memory-failure.c:892:6: warning: variable 'extra_pins' is used =
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4    mm/memory-failure.c:879:6: warning: variable 'extra_pins' is used =
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4    drivers/clocksource/arm_arch_timer.c:183:3: warning: variable 'val=
' is used uninitialized whenever switch default is taken [-Wsometimes-unini=
tialized]
    4    drivers/clocksource/arm_arch_timer.c:174:3: warning: variable 'val=
' is used uninitialized whenever switch default is taken [-Wsometimes-unini=
tialized]
    2    cc1: some warnings being treated as errors
    2    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    2    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    drivers/regulator/lp872x.c:689:57: warning: implicit conversion fr=
om enumeration type 'enum lp872x_dvs_state' to different enumeration type '=
enum gpiod_flags' [-Wenum-conversion]
    1    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/mmc/host/sdhci-omap.c:1213:13: warning: =E2=80=98sdhci_oma=
p_context_save=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined=
 [-Wunused-function]
    1    drivers/mfd/altera-a10sr.c:159:1: warning: parameter names (withou=
t types) in function declaration
    1    drivers/mfd/altera-a10sr.c:159:1: warning: data definition has no =
type or storage class
    1    drivers/mfd/altera-a10sr.c:153:1: warning: parameter names (withou=
t types) in function declaration
    1    drivers/mfd/altera-a10sr.c:153:1: warning: data definition has no =
type or storage class
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    clangclang: warning: argument unused during compilation: '-march=
=3Darmv6k' [-Wunused-command-line-argument]
    1    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6k' [-Wunused-command-line-argument]
    1    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv6' [-Wunused-command-line-argument]
    1    cc1: all warnings being treated as errors
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]
    1    : warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    1    1 warning generated.
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x70353): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 sec=
tion mismatches

Errors:
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 7 errors, 14 warnings, 0 secti=
on mismatches

Errors:
    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size (1400=
) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werror,-Wfram=
e-larger-than]
    drivers/mfd/altera-a10sr.c:153:1: error: declaration specifier missing,=
 defaulting to 'int' [-Werror]
    drivers/mfd/altera-a10sr.c:153:21: error: a parameter list without type=
s is only allowed in a function definition
    drivers/mfd/altera-a10sr.c:159:1: error: declaration specifier missing,=
 defaulting to 'int' [-Werror]
    drivers/mfd/altera-a10sr.c:159:21: error: a parameter list without type=
s is only allowed in a function definition
    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]
    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]

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
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 33 errors, 16 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/kernel/entry-armv.S:502:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:506:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/mach-mvebu/coherency_ll.S:128:2: error: instruction requires: =
data-barriers
    arch/arm/mach-mvebu/coherency_ll.S:155:2: error: instruction requires: =
data-barriers
    arch/arm/mm/cache-v7.S:42:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:45:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:56:4: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:68:4: error: invalid instruction
    arch/arm/mm/cache-v7.S:69:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:97:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:106:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:107:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:125:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:142:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:149:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:152:2: error: instruction requires: armv6t2
    arch/arm/mm/cache-v7.S:172:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:178:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:179:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:286:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:294:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:311:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:312:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:321:2: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:344:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:352:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:372:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:387:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:401:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:409:2: error: invalid instruction
    arch/arm/mm/cache-v7.S:423:8: error: instruction requires: data-barriers
    arch/arm/mm/cache-v7.S:431:2: error: invalid instruction
    arch/arm/mach-imx/suspend-imx6.S:315:2: error: instruction requires: da=
ta-barriers

Warnings:
    clangclang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
k' [-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv6=
' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size (1336=
) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werror,-Wfram=
e-larger-than]

Warnings:
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size of 13=
32 bytes in function 'hist_trigger_print_key' [-Werror,-Wframe-larger-than=
=3D]

Warnings:
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 sec=
tion mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

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
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 133 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]
    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]

Warnings:
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section m=
ismatches

Errors:
    drivers/mfd/altera-a10sr.c:153:1: error: data definition has no type or=
 storage class [-Werror]
    drivers/mfd/altera-a10sr.c:153:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=
=3Dimplicit-int]
    drivers/mfd/altera-a10sr.c:153:1: error: parameter names (without types=
) in function declaration [-Werror]
    drivers/mfd/altera-a10sr.c:159:1: error: data definition has no type or=
 storage class [-Werror]
    drivers/mfd/altera-a10sr.c:159:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=
=3Dimplicit-int]
    drivers/mfd/altera-a10sr.c:159:1: error: parameter names (without types=
) in function declaration [-Werror]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 4 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    mm/memory-failure.c:892:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: error: variable 'extra_pins' is used uniniti=
alized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]
    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]

Warnings:
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    clang: error: unsupported argument '-mimplicit-it=3Dalways' to option '=
Wa,'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't=
 find starting instruction
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    api.c:(.text+0x59c): undefined reference to `crypto_alg_tested'

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0=
 section mismatches

Errors:
    arch/arm/kernel/entry-armv.S:502:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:506:4: error: invalid instruction, any one=
 of the following would fix this:

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 14 warnings, =
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
    drivers/clocksource/arm_arch_timer.c:183:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:174:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning
    2 warnings generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
badge4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    arch/mips/boot/dts/ingenic/jz4780.dtsi:473.33-475.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
corgi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 FAIL, 129 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame

Warnings:
    mm/memory-failure.c:892:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    2 warnings generated.

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
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

Warnings:
    mm/memory-failure.c:892:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    2 warnings generated.
    drivers/clocksource/arm_arch_timer.c:183:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:174:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning
    2 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 FAIL, 129 =
errors, 4 warnings, 0 section mismatches

Errors:
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocation name
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocation na=
me
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocation n=
ame
    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocation n=
ame

Warnings:
    mm/memory-failure.c:892:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    2 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 8 warnings, 0 section mismatches

Warnings:
    mm/memory-failure.c:892:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:879:6: warning: variable 'extra_pins' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/memory-failure.c:871:17: note: initialize the variable 'extra_pins' =
to silence this warning
    2 warnings generated.
    drivers/clocksource/arm_arch_timer.c:183:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:174:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning
    2 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    drivers/mmc/host/sdhci-omap.c:1477:21: error: =E2=80=98sdhci_omap_runti=
me_suspend=E2=80=99 undeclared here (not in a function); did you mean =E2=
=80=98sdhci_pltfm_suspend=E2=80=99?
    drivers/mmc/host/sdhci-omap.c:1478:7: error: =E2=80=98sdhci_omap_runtim=
e_resume=E2=80=99 undeclared here (not in a function); did you mean =E2=80=
=98sdhci_omap_context_save=E2=80=99?

Warnings:
    drivers/mmc/host/sdhci-omap.c:1213:13: warning: =E2=80=98sdhci_omap_con=
text_save=E2=80=99 declared =E2=80=98static=E2=80=99 but never defined [-Wu=
nused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
magician_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    api.c:(.text+0x59c): undefined reference to `crypto_alg_tested'

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 FAIL, 5 errors, 8 warnings, 0 =
section mismatches

Errors:
    arch/arm/kernel/entry-armv.S:502:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:506:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/mm/proc-v7.S:169:111: error: expected absolute expression
    arch/arm/mm/proc-v7.S:169:147: error: expected absolute expression
    arch/arm/mm/proc-v7.S:169:164: error: ALT_UP() content must assemble to=
 exactly 4 bytes

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 16 warnings, 0=
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
    drivers/regulator/lp872x.c:689:57: warning: implicit conversion from en=
umeration type 'enum lp872x_dvs_state' to different enumeration type 'enum =
gpiod_flags' [-Wenum-conversion]
    1 warning generated.
    drivers/clocksource/arm_arch_timer.c:183:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:174:3: warning: variable 'val' is =
used uninitialized whenever switch default is taken [-Wsometimes-uninitiali=
zed]
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning
    2 warnings generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
    stm32-dma.c:(.text+0x10a8): undefined reference to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x10c8): undefined reference=
 to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x114c): undefined reference=
 to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1170): undefined reference=
 to `__aeabi_uldivmod'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
nlm_xlp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
pcm027_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
    arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-march=3D=
=E2=80=99
    arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
    arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-march=3D=
=E2=80=99

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
simpad_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    drivers/mfd/altera-a10sr.c:153:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=
=3Dimplicit-int]
    drivers/mfd/altera-a10sr.c:159:1: error: type defaults to =E2=80=98int=
=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=
=3Dimplicit-int]

Warnings:
    drivers/mfd/altera-a10sr.c:153:1: warning: data definition has no type =
or storage class
    drivers/mfd/altera-a10sr.c:153:1: warning: parameter names (without typ=
es) in function declaration
    drivers/mfd/altera-a10sr.c:159:1: warning: data definition has no type =
or storage class
    drivers/mfd/altera-a10sr.c:159:1: warning: parameter names (without typ=
es) in function declaration
    cc1: some warnings being treated as errors

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
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

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
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x70353): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

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
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burst_len=
=E2=80=99 undeclared (first use in this function)
    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declaration o=
f function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]

Warnings:
    <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [=
-Wcpp]
    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99 [-Wunused-result]
    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98warn_un=
used_result=E2=80=99 [-Wunused-result]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
