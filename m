Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450EC43352A
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 13:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhJSL4x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 07:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbhJSL4t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 07:56:49 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993CEC061745
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 04:54:36 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id np13so14503536pjb.4
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 04:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yxEsefQcbJXZH2vHGUadJYDxVoZ8n+/9tukpyGINA8g=;
        b=kw6YL5muWgi8ljHmFGc3Oz4AoDLT1/ZYECnqORrLkVM9KW+fGJp0Z2ySpG/k7N/A7e
         7Llk9lWp0qoRZ9a6aVP4WJ1bswPuRIzknZ6cUjZQduYdpZpZlV6YY0XwkD53v+HFr6uo
         FrIHfxwDM1WmsAibIctMJe0pwvBKumY2xmO4v6xT+aF0NMGFakRtOnvYixvhbUyDzbGR
         UyF2x+syYRB802bDTzBhF55UW9JjTdri84c0b6zQp23rYlhQ8M8m+VbzPqJPXptWrLlW
         C1xY4uqEuT49mx/cTdDAraWil9fLEAvTYBWMErI89mtvBWRNigjlMi+8qVejhyBIYcV+
         0/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yxEsefQcbJXZH2vHGUadJYDxVoZ8n+/9tukpyGINA8g=;
        b=NnmkL0N1pEiG+qksEc7UU8JQmIPd7zJJwTd0ZeP/fjnhx6FOo7CUPGUnlz1eTw68jX
         wFIUJyliIaSwTC9DFzdh6JrdnZk6QpDmPOddC5891k7lWwotJeLbsKZAZAbr0XEiLLOP
         GpizcIRd60qbz2PxjN7wJUPOPcG8wspWx2357175RCSarp0gHgYphnTGmLbkYTBVjzQM
         90ykmf7cTBWxf64TwIqjeqiIat7xlwGlIMWDJq8SUdaxOAfO2gVIK+g4/pjvg+8a0vKf
         56ekTBw/F2dcW+R3PbLNGCk0Xr/t/w51FeLdhnY1qfbIMoZAHOP73NntsbEGEiQr6iux
         8fxg==
X-Gm-Message-State: AOAM531Hw8DUXmjVv5LhqEH2AlEvYNP24W1Cd429ndmiDEar7rjfE+Sm
        p+OjfozL5E1fWdSM8RBuMoPqFNK3re8g0rmQ
X-Google-Smtp-Source: ABdhPJwvYIaHdsm1l9prAWznEQWjBILq9xZLaQbE/NLQlBeML9FMiSdzFoXtXniVTNVGVp45TjDRww==
X-Received: by 2002:a17:90a:b948:: with SMTP id f8mr5960737pjw.129.1634644474229;
        Tue, 19 Oct 2021 04:54:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v22sm16490389pff.93.2021.10.19.04.54.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 04:54:33 -0700 (PDT)
Message-ID: <616eb1f9.1c69fb81.59994.d8e7@mx.google.com>
Date:   Tue, 19 Oct 2021 04:54:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211019
X-Kernelci-Report-Type: build
Subject: next/master build: 218 builds: 31 failed, 187 passed, 303 errors,
 228 warnings (next-20211019)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 31 failed, 187 passed, 303 errors, 228 warni=
ngs (next-20211019)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211019/

Tree: next
Branch: master
Git Describe: next-20211019
Git Commit: 5b27c149257d83558d9a7fae927be822673be230
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-10) FAIL
    allmodconfig: (clang-13) FAIL

arm:
    allnoconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    multi_v7_defconfig: (clang-10) FAIL
    allmodconfig: (gcc-10) FAIL
    am200epdkit_defconfig: (gcc-10) FAIL
    badge4_defconfig: (gcc-10) FAIL
    cerfcube_defconfig: (gcc-10) FAIL
    corgi_defconfig: (gcc-10) FAIL
    imote2_defconfig: (gcc-10) FAIL
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

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-13): 2 errors, 1 warning
    allmodconfig (clang-10): 131 errors, 1 warning
    allmodconfig (gcc-10): 12 errors, 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 129 errors, 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 4 warnings

arm:
    allmodconfig (gcc-10): 6 errors, 1 warning
    allnoconfig (clang-10): 1 error
    am200epdkit_defconfig (gcc-10): 1 error
    aspeed_g5_defconfig (clang-10): 2 errors
    aspeed_g5_defconfig (clang-13): 14 warnings
    magician_defconfig (gcc-10): 1 error
    multi_v7_defconfig (clang-10): 2 errors, 2 warnings
    multi_v7_defconfig (clang-13): 16 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 4 errors
    rpc_defconfig (gcc-10): 4 errors
    socfpga_defconfig (gcc-10): 2 errors, 5 warnings

i386:
    allmodconfig (clang-10): 1 error

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
    allmodconfig (clang-13): 1 error, 19 warnings
    allmodconfig (clang-10): 1 error, 2 warnings
    allnoconfig (clang-10): 3 warnings
    x86_64_defconfig (clang-10): 1 error

Errors summary:

    2    drivers/mfd/altera-a10sr.c:159:1: error: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-W=
error=3Dimplicit-int]
    2    drivers/mfd/altera-a10sr.c:153:1: error: type defaults to =E2=80=
=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-W=
error=3Dimplicit-int]
    2    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' =
is used uninitialized whenever switch default is taken [-Werror,-Wsometimes=
-uninitialized]
    2    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' =
is used uninitialized whenever switch default is taken [-Werror,-Wsometimes=
-uninitialized]
    2    arm-linux-gnueabihf-gcc: error: unrecognized -march target: armv3m
    2    arm-linux-gnueabihf-gcc: error: missing argument to =E2=80=98-marc=
h=3D=E2=80=99
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:98:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:96:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:94:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:92:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:90:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:88:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:86:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:84:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:82:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:80:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:7:11: error: unknown relocatio=
n name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:78:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:76:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:74:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:72:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:70:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:68:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:66:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:64:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:62:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:60:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:5:11: error: unknown relocatio=
n name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:58:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:56:13: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:54:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:52:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:50:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:48:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:46:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:44:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:42:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:40:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:38:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:36:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:34:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:32:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:30:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:28:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:26:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:263:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:261:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:258:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:256:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:254:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:252:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:250:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:24:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:248:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:246:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:244:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:242:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:240:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:238:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:236:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:234:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:232:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:230:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:22:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:228:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:226:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:224:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:222:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:220:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:218:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:216:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:214:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:212:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:210:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:20:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:208:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:206:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:204:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:202:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:200:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:198:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:196:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:194:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:192:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:190:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:18:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:188:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:186:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:184:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:182:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:180:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:178:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:176:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:174:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:172:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:170:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:16:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:168:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:166:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:164:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:162:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:160:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:158:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:156:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:154:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:152:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:150:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:14:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:148:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:146:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:144:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:142:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:140:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:138:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:136:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:134:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:132:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:130:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:12:12: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:128:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:126:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:124:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:122:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:120:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:118:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:116:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:114:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:112:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:110:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:10:11: error: unknown relocati=
on name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:108:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:106:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:104:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:102:13: error: unknown relocat=
ion name
    2    arch/arm64/kvm/hyp/nvhe/hyp-reloc.S:100:13: error: unknown relocat=
ion name
    2    arch/arm/kernel/entry-armv.S:504:4: error: invalid instruction, an=
y one of the following would fix this:
    2    arch/arm/kernel/entry-armv.S:500:4: error: invalid instruction, an=
y one of the following would fix this:
    2    api.c:(.text+0x59c): undefined reference to `crypto_alg_tested'
    2    <instantiation>:2:2: error: unknown use of instruction mnemonic wi=
thout a size suffix
    1    stm32-dma.c:(.text+0x10b0): undefined reference to `__aeabi_uldivm=
od'
    1    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size =
of 1332 bytes in function 'hist_trigger_print_key' [-Werror,-Wframe-larger-=
than=3D]
    1    drivers/regulator/lp872x.c:689:57: error: implicit conversion from=
 enumeration type 'enum lp872x_dvs_state' to different enumeration type 'en=
um gpiod_flags' [-Werror,-Wenum-conversion]
    1    drivers/net/ethernet/lantiq_etop.c:673:8: error: implicit declarat=
ion of function =E2=80=98device_property_read_u32=E2=80=99 [-Werror=3Dimpli=
cit-function-declaration]
    1    drivers/net/ethernet/lantiq_etop.c:265:55: error: =E2=80=98rx_burs=
t_len=E2=80=99 undeclared (first use in this function)
    1    drivers/mfd/altera-a10sr.c:159:1: error: parameter names (without =
types) in function declaration [-Werror]
    1    drivers/mfd/altera-a10sr.c:159:1: error: data definition has no ty=
pe or storage class [-Werror]
    1    drivers/mfd/altera-a10sr.c:153:1: error: parameter names (without =
types) in function declaration [-Werror]
    1    drivers/mfd/altera-a10sr.c:153:1: error: data definition has no ty=
pe or storage class [-Werror]
    1    clang: error: unsupported argument '-mimplicit-it=3Dalways' to opt=
ion 'Wa,'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1178): undefined refe=
rence to `__aeabi_uldivmod'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1154): undefined refe=
rence to `__aeabi_uldivmod'
    1    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x10d0): undefined refe=
rence to `__aeabi_uldivmod'

Warnings summary:

    144  <stdin>:1559:2: warning: #warning syscall futex_waitv not implemen=
ted [-Wcpp]
    11   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    6    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the v=
ariable 'val' to silence this warning
    5    2 warnings generated.
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
    1    vmlinux.o: warning: objtool: xen_irq_enable()+0x5: call to preempt=
_count_add() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: xen_irq_disable()+0x5: call to preemp=
t_count_add() leaves .noinstr.text section
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
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x1095: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    1    drivers/regulator/lp872x.c:689:57: warning: implicit conversion fr=
om enumeration type 'enum lp872x_dvs_state' to different enumeration type '=
enum gpiod_flags' [-Wenum-conversion]
    1    drivers/net/ethernet/lantiq_etop.c:284:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:276:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99 declared with attribute =E2=80=98wa=
rn_unused_result=E2=80=99 [-Wunused-result]
    1    drivers/mfd/altera-a10sr.c:159:1: warning: parameter names (withou=
t types) in function declaration
    1    drivers/mfd/altera-a10sr.c:159:1: warning: data definition has no =
type or storage class
    1    drivers/mfd/altera-a10sr.c:153:1: warning: parameter names (withou=
t types) in function declaration
    1    drivers/mfd/altera-a10sr.c:153:1: warning: data definition has no =
type or storage class
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
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

    1    WARNING: modpost: vmlinux.o(.text+0x70373): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x147e17): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x147dcf): Section mismatch in r=
eference from the function __first_node() to the variable .init.data:numa_n=
odes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x147d94): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x147d88): Section mismatch in r=
eference from the function early_get_smp_config() to the variable .init.dat=
a:x86_init
    1    WARNING: modpost: vmlinux.o(.text+0x147d48): Section mismatch in r=
eference from the function __nodes_weight() to the variable .init.data:numa=
_nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x147ce2): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x147cce): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

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
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 19 warnings, 0 sec=
tion mismatches

Errors:
    drivers/regulator/lp872x.c:689:57: error: implicit conversion from enum=
eration type 'enum lp872x_dvs_state' to different enumeration type 'enum gp=
iod_flags' [-Werror,-Wenum-conversion]

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
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: xen_irq_disable()+0x5: call to preempt_cou=
nt_add() leaves .noinstr.text section
    vmlinux.o: warning: objtool: xen_irq_enable()+0x5: call to preempt_coun=
t_add() leaves .noinstr.text section
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

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x147cce): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x147ce2): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x147d48): Section mismatch in refere=
nce from the function __nodes_weight() to the variable .init.data:numa_node=
s_parsed
    WARNING: modpost: vmlinux.o(.text+0x147d88): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x147d94): Section mismatch in refere=
nce from the function early_get_smp_config() to the variable .init.data:x86=
_init
    WARNING: modpost: vmlinux.o(.text+0x147dcf): Section mismatch in refere=
nce from the function __first_node() to the variable .init.data:numa_nodes_=
parsed
    WARNING: modpost: vmlinux.o(.text+0x147e17): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]
    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]

Warnings:
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
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

Warnings:
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/trace/trace_events_hist.c:4723:13: error: stack frame size of 13=
32 bytes in function 'hist_trigger_print_key' [-Werror,-Wframe-larger-than=
=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 131 errors, 1 warning, 0 sec=
tion mismatches

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
    drivers/clocksource/arm_arch_timer.c:183:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]
    drivers/clocksource/arm_arch_timer.c:174:3: error: variable 'val' is us=
ed uninitialized whenever switch default is taken [-Werror,-Wsometimes-unin=
itialized]

Warnings:
    drivers/clocksource/arm_arch_timer.c:166:9: note: initialize the variab=
le 'val' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 12 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/arm64/include/asm/bitops.h:11:2: error: #error only <linux/bitops.=
h> can be included directly
    include/asm-generic/bitops/arch_hweight.h:9:9: error: implicit declarat=
ion of function =E2=80=98__sw_hweight32=E2=80=99; did you mean =E2=80=98__a=
rch_hweight32=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/asm-generic/bitops/arch_hweight.h:14:9: error: implicit declara=
tion of function =E2=80=98__sw_hweight16=E2=80=99; did you mean =E2=80=98__=
arch_hweight16=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/asm-generic/bitops/arch_hweight.h:19:9: error: implicit declara=
tion of function =E2=80=98__sw_hweight8=E2=80=99; did you mean =E2=80=98__a=
rch_hweight8=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/asm-generic/bitops/arch_hweight.h:24:9: error: implicit declara=
tion of function =E2=80=98__sw_hweight64=E2=80=99; did you mean =E2=80=98__=
arch_hweight64=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    include/asm-generic/bitops/atomic.h:17:7: error: implicit declaration o=
f function =E2=80=98BIT_WORD=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
    include/asm-generic/bitops/atomic.h:18:22: error: implicit declaration =
of function =E2=80=98BIT_MASK=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
    include/asm-generic/bitops/lock.h:87:18: error: implicit declaration of=
 function =E2=80=98BIT=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    include/linux/bitops.h:24:21: error: conflicting types for =E2=80=98__s=
w_hweight8=E2=80=99
    include/linux/bitops.h:25:21: error: conflicting types for =E2=80=98__s=
w_hweight16=E2=80=99
    include/linux/bitops.h:26:21: error: conflicting types for =E2=80=98__s=
w_hweight32=E2=80=99
    include/linux/bitops.h:27:22: error: conflicting types for =E2=80=98__s=
w_hweight64=E2=80=99

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    clang: error: unsupported argument '-mimplicit-it=3Dalways' to option '=
Wa,'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
    arch/arm/kernel/entry-armv.S:500:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:504:4: error: invalid instruction, any one=
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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
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
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
multi_v5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig (arm, clang-10) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 =
section mismatches

Errors:
    arch/arm/kernel/entry-armv.S:500:4: error: invalid instruction, any one=
 of the following would fix this:
    arch/arm/kernel/entry-armv.S:504:4: error: invalid instruction, any one=
 of the following would fix this:

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 FAIL, 4 errors, 0 warnings, 0 section mismatches

Errors:
    stm32-dma.c:(.text+0x10b0): undefined reference to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x10d0): undefined reference=
 to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1154): undefined reference=
 to `__aeabi_uldivmod'
    arm-linux-gnueabihf-ld: stm32-dma.c:(.text+0x1178): undefined reference=
 to `__aeabi_uldivmod'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
    WARNING: modpost: vmlinux.o(.text+0x70373): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    <instantiation>:2:2: error: unknown use of instruction mnemonic without=
 a size suffix

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
