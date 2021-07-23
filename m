Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E783D3BF8
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 16:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbhGWOF7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 10:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235310AbhGWOF7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2021 10:05:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68B4C061575
        for <linux-next@vger.kernel.org>; Fri, 23 Jul 2021 07:46:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id mt6so2573275pjb.1
        for <linux-next@vger.kernel.org>; Fri, 23 Jul 2021 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+/p0jgRdhW2KBLrcL/v/aGDTrL9Ve1yY1hhOjXps4zk=;
        b=ismWNXrUJY2S1HzsMwBtNEaLSa+cg4glQ2aCRVxBrB5lnpj4v6if7BnF7rvxtaOttY
         nD/QPmP6EJINy+VIMpWOLAX18TGF82mjA0ztwFhTEHo1r8UzF6ypacM4d2J8dDROy1uN
         nclmQ9lhwsTHe14iRiT1PVJaqsW51aUdLm4xpWFPdopimdCiJwCUDtRE70MH6wnkqoPX
         jAlY7fbjZsRxPC3/o9q4iQe5iU5fTAZKCKW5IbjDk2k/Pw8LwQGKGAsiUiM0qvvXmUH8
         o/hcSVM6KHgfa/6jS8eOlDuZyKxhvjkxApvCjASLz1XHk44diR6wHJ7Eo2cFULhT4A11
         Hc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+/p0jgRdhW2KBLrcL/v/aGDTrL9Ve1yY1hhOjXps4zk=;
        b=KcYkDzkoqjs3oBaGxOQ9cJbRhwHUldiaRWuNbYJ8jCKFLe1WTmCFLNpJrMFBrabhth
         Md4rq8b2R5D7mUcqn9x84JJld0scniJwnIELfcIuDcLZ7CaEkeqc/8dkWjE4JMFIYh+N
         jLctvWL2vo0PkDHBwBRdk2afdfJzxLOxOJOKnd1gH1XS8J81+05lWa0t4f7mEzq+YO2a
         XTLguraX9WF110l5kpMCeV1drt3Mfpys+y7Ui4aJpUBuJmTTzyzR0BvWLxuXeLfYKzEw
         nKt8Ttw1v5xa0K90ShPHoRa8dZgovGjIMv8nrnLX56uA0YqjWo8kGiQVfCnr7yQHtLmR
         5HQg==
X-Gm-Message-State: AOAM531e1O7VsI1StnQyqz2iVU8AGpXURvdNSim59XoQHI654cW+CH7I
        ORKkriLMyu3I6JChWr70sAG58z99ss0wV9Ka
X-Google-Smtp-Source: ABdhPJyqEgLbd1pQqXE+HpzCHU2X5Yxy7u3GUoupjnyYVFgVKF4J8GPpkeXZxfxx2vJCYm6pWSmV6w==
X-Received: by 2002:a05:6a00:1307:b029:308:1e2b:a24b with SMTP id j7-20020a056a001307b02903081e2ba24bmr4964982pfu.57.1627051590577;
        Fri, 23 Jul 2021 07:46:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s24sm31627221pfg.186.2021.07.23.07.46.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:46:30 -0700 (PDT)
Message-ID: <60fad646.1c69fb81.b907b.effd@mx.google.com>
Date:   Fri, 23 Jul 2021 07:46:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210723
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 216 builds: 63 failed, 153 passed, 151 errors,
 53 warnings (next-20210723)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 63 failed, 153 passed, 151 errors, 53 warnin=
gs (next-20210723)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210723/

Tree: next
Branch: master
Git Describe: next-20210723
Git Commit: 90d856e71443a2fcacca8e7539bac44d9cb3f7ab
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig: (gcc-8) FAIL
    32r2el_defconfig+kselftest: (gcc-8) FAIL
    allnoconfig: (gcc-8) FAIL
    ar7_defconfig: (gcc-8) FAIL
    ath25_defconfig: (gcc-8) FAIL
    ath79_defconfig: (gcc-8) FAIL
    bcm47xx_defconfig: (gcc-8) FAIL
    bcm63xx_defconfig: (gcc-8) FAIL
    bigsur_defconfig: (gcc-8) FAIL
    bmips_be_defconfig: (gcc-8) FAIL
    bmips_stb_defconfig: (gcc-8) FAIL
    capcella_defconfig: (gcc-8) FAIL
    cavium_octeon_defconfig: (gcc-8) FAIL
    ci20_defconfig: (gcc-8) FAIL
    cobalt_defconfig: (gcc-8) FAIL
    cu1000-neo_defconfig: (gcc-8) FAIL
    cu1830-neo_defconfig: (gcc-8) FAIL
    db1xxx_defconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    decstation_defconfig: (gcc-8) FAIL
    decstation_r4k_defconfig: (gcc-8) FAIL
    e55_defconfig: (gcc-8) FAIL
    fuloong2e_defconfig: (gcc-8) FAIL
    gcw0_defconfig: (gcc-8) FAIL
    gpr_defconfig: (gcc-8) FAIL
    ip22_defconfig: (gcc-8) FAIL
    ip32_defconfig: (gcc-8) FAIL
    jazz_defconfig: (gcc-8) FAIL
    jmr3927_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    loongson1b_defconfig: (gcc-8) FAIL
    loongson1c_defconfig: (gcc-8) FAIL
    loongson2k_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL
    malta_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL
    malta_qemu_32r6_defconfig: (gcc-8) FAIL
    maltaaprp_defconfig: (gcc-8) FAIL
    maltasmvp_defconfig: (gcc-8) FAIL
    maltasmvp_eva_defconfig: (gcc-8) FAIL
    maltaup_defconfig: (gcc-8) FAIL
    maltaup_xpa_defconfig: (gcc-8) FAIL
    mpc30x_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    nlm_xlp_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    omega2p_defconfig: (gcc-8) FAIL
    pic32mzda_defconfig: (gcc-8) FAIL
    pistachio_defconfig: (gcc-8) FAIL
    qi_lb60_defconfig: (gcc-8) FAIL
    rb532_defconfig: (gcc-8) FAIL
    rbtx49xx_defconfig: (gcc-8) FAIL
    rm200_defconfig: (gcc-8) FAIL
    rs90_defconfig: (gcc-8) FAIL
    rt305x_defconfig: (gcc-8) FAIL
    sb1250_swarm_defconfig: (gcc-8) FAIL
    tb0219_defconfig: (gcc-8) FAIL
    tb0226_defconfig: (gcc-8) FAIL
    tb0287_defconfig: (gcc-8) FAIL
    vocore2_defconfig: (gcc-8) FAIL
    workpad_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 2 errors, 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-10): 5 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 5 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 warning
    defconfig+crypto (gcc-8): 1 warning
    defconfig+ima (gcc-8): 1 warning
    defconfig+kselftest (gcc-8): 1 warning

arm:
    aspeed_g5_defconfig (clang-10): 2 warnings
    aspeed_g5_defconfig (clang-12): 2 warnings
    multi_v7_defconfig (clang-10): 2 warnings
    multi_v7_defconfig (clang-12): 2 warnings

i386:
    i386_defconfig (clang-10): 2 warnings
    i386_defconfig (clang-12): 2 warnings

mips:
    32r2el_defconfig (gcc-8): 2 errors
    32r2el_defconfig+kselftest (gcc-8): 2 errors
    allnoconfig (gcc-8): 2 errors
    ar7_defconfig (gcc-8): 2 errors
    ath25_defconfig (gcc-8): 2 errors
    ath79_defconfig (gcc-8): 2 errors
    bcm47xx_defconfig (gcc-8): 2 errors
    bcm63xx_defconfig (gcc-8): 3 errors
    bigsur_defconfig (gcc-8): 3 errors
    bmips_be_defconfig (gcc-8): 3 errors
    bmips_stb_defconfig (gcc-8): 3 errors
    capcella_defconfig (gcc-8): 3 errors
    cavium_octeon_defconfig (gcc-8): 2 errors
    ci20_defconfig (gcc-8): 2 errors
    cobalt_defconfig (gcc-8): 3 errors
    cu1000-neo_defconfig (gcc-8): 2 errors
    cu1830-neo_defconfig (gcc-8): 2 errors
    db1xxx_defconfig (gcc-8): 2 errors
    decstation_64_defconfig (gcc-8): 3 errors
    decstation_defconfig (gcc-8): 3 errors
    decstation_r4k_defconfig (gcc-8): 3 errors
    e55_defconfig (gcc-8): 3 errors
    fuloong2e_defconfig (gcc-8): 3 errors
    gcw0_defconfig (gcc-8): 2 errors
    gpr_defconfig (gcc-8): 2 errors
    ip22_defconfig (gcc-8): 3 errors
    ip32_defconfig (gcc-8): 3 errors
    jazz_defconfig (gcc-8): 3 errors
    jmr3927_defconfig (gcc-8): 3 errors
    lemote2f_defconfig (gcc-8): 3 errors
    loongson1b_defconfig (gcc-8): 2 errors
    loongson1c_defconfig (gcc-8): 2 errors
    loongson2k_defconfig (gcc-8): 2 errors
    loongson3_defconfig (gcc-8): 2 errors
    malta_defconfig (gcc-8): 2 errors
    malta_kvm_defconfig (gcc-8): 2 errors
    malta_qemu_32r6_defconfig (gcc-8): 2 errors
    maltaaprp_defconfig (gcc-8): 2 errors
    maltasmvp_defconfig (gcc-8): 2 errors
    maltasmvp_eva_defconfig (gcc-8): 2 errors
    maltaup_defconfig (gcc-8): 2 errors
    maltaup_xpa_defconfig (gcc-8): 2 errors
    mpc30x_defconfig (gcc-8): 3 errors
    mtx1_defconfig (gcc-8): 2 errors
    nlm_xlp_defconfig (gcc-8): 2 errors
    nlm_xlr_defconfig (gcc-8): 3 errors
    omega2p_defconfig (gcc-8): 2 errors
    pic32mzda_defconfig (gcc-8): 2 errors
    pistachio_defconfig (gcc-8): 2 errors
    qi_lb60_defconfig (gcc-8): 2 errors
    rb532_defconfig (gcc-8): 2 errors
    rbtx49xx_defconfig (gcc-8): 3 errors
    rm200_defconfig (gcc-8): 3 errors
    rs90_defconfig (gcc-8): 2 errors
    rt305x_defconfig (gcc-8): 2 errors
    sb1250_swarm_defconfig (gcc-8): 3 errors
    tb0219_defconfig (gcc-8): 3 errors
    tb0226_defconfig (gcc-8): 3 errors
    tb0287_defconfig (gcc-8): 3 errors
    vocore2_defconfig (gcc-8): 2 errors
    workpad_defconfig (gcc-8): 3 errors
    xway_defconfig (gcc-8): 2 errors, 2 warnings

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-12): 2 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    x86_64_defconfig (clang-10): 4 warnings
    x86_64_defconfig (clang-12): 2 warnings

Errors summary:

    26   (.text+0x19b0): undefined reference to `printk'
    24   (.text+0x1d30): undefined reference to `printk'
    24   (.text+0x1870): undefined reference to `printk'
    21   (.text+0x1c40): undefined reference to `printk'
    21   (.text+0x18e0): undefined reference to `printk'
    18   (.text+0x1d0c): undefined reference to `printk'
    18   (.text+0x198c): undefined reference to `printk'
    14   (.text+0x1c8c): undefined reference to `printk'
    14   (.text+0x190c): undefined reference to `printk'
    8    (.text+0x1c3c): undefined reference to `printk'
    8    (.text+0x18dc): undefined reference to `printk'
    6    (.text+0x1ca8): undefined reference to `printk'
    6    (.text+0x1a14): undefined reference to `printk'
    6    (.text+0x1928): undefined reference to `printk'
    6    (.text+0x17e8): undefined reference to `printk'
    4    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:587: undefined re=
ference to `printk'
    4    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:584: undefined re=
ference to `printk'
    4    (.text+0x1df8): undefined reference to `printk'
    4    (.text+0x1d88): undefined reference to `printk'
    4    (.text+0x1a78): undefined reference to `printk'
    4    (.text+0x1938): undefined reference to `printk'
    4    (.text+0x18c8): undefined reference to `printk'
    2    (.text+0x2284): undefined reference to `printk'
    2    (.text+0x1eb0): undefined reference to `printk'
    2    (.text+0x1e64): undefined reference to `printk'
    2    (.text+0x1d94): undefined reference to `printk'
    2    (.text+0x1d54): undefined reference to `printk'
    2    (.text+0x1d28): undefined reference to `printk'
    2    (.text+0x1d10): undefined reference to `printk'
    2    (.text+0x1d08): undefined reference to `printk'
    2    (.text+0x1d04): undefined reference to `printk'
    2    (.text+0x1cac): undefined reference to `printk'
    2    (.text+0x1c84): undefined reference to `printk'
    2    (.text+0x1ad4): undefined reference to `printk'
    2    (.text+0x19d4): undefined reference to `printk'
    2    (.text+0x19a8): undefined reference to `printk'
    2    (.text+0x1990): undefined reference to `printk'
    2    (.text+0x1988): undefined reference to `printk'
    2    (.text+0x192c): undefined reference to `printk'
    2    (.text+0x1924): undefined reference to `printk'
    2    (.text+0x1894): undefined reference to `printk'
    2    (.text+0x1868): undefined reference to `printk'
    2    (.text+0x1850): undefined reference to `printk'
    2    (.text+0x1804): undefined reference to `printk'
    2    (.text+0x17ec): undefined reference to `printk'
    2    (.text+0x1690): undefined reference to `printk'
    1    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=
=98__compiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field
    1    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=
=98__compiletime_assert_1859=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field

Warnings summary:

    28   1 warning generated.
    23   kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration sp=
ecifier [-Wduplicate-decl-specifier]
    12   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: u=
nused variable =E2=80=98priv=E2=80=99 [-Wunused-variable]
    5    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: u=
nused variable 'priv' [-Wunused-variable]
    4    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    4    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    4    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    2    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    2    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-=
1+0
    2    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    2    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    2    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-rc2-next-20210723/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-rc2-nex=
t-20210723/kernel/drivers/media/tuners/tuner-types.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    kernel/trace/trace_osnoise.c:1461:8: warning: =E2=80=98main=E2=80=
=99 is usually a function [-Wmain]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnin=
gs, 0 section mismatches

Errors:
    (.text+0x1ad4): undefined reference to `printk'
    (.text+0x1eb0): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=98__c=
ompiletime_assert_1859=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field
    ./../include/linux/compiler_types.h:328:38: error: call to =E2=80=98__c=
ompiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field

Warnings:
    kernel/trace/trace_osnoise.c:1461:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section m=
ismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
ar7_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

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
ath25_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

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
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x17ec): undefined reference to `printk'
    (.text+0x192c): undefined reference to `printk'
    (.text+0x1cac): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x18c8): undefined reference to `printk'
    (.text+0x1a14): undefined reference to `printk'
    (.text+0x1d88): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    (.text+0x1938): undefined reference to `printk'
    (.text+0x1a78): undefined reference to `printk'
    (.text+0x1df8): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x1938): undefined reference to `printk'
    (.text+0x1a78): undefined reference to `printk'
    (.text+0x1df8): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings,=
 0 section mismatches

Errors:
    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:584: undefined referen=
ce to `printk'
    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:587: undefined referen=
ce to `printk'

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x17e8): undefined reference to `printk'
    (.text+0x1928): undefined reference to `printk'
    (.text+0x1ca8): undefined reference to `printk'

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
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x18dc): undefined reference to `printk'
    (.text+0x1c3c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings,=
 0 section mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x1894): undefined reference to `printk'
    (.text+0x19d4): undefined reference to `printk'
    (.text+0x1d54): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings=
, 0 section mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable 'priv' [-Wunused-variable]
    1 warning generated.
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-rc2-next-202=
10723/kernel/drivers/media/tuners/tuner-types.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable 'priv' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 5 warnings, 0 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable 'priv' [-Wunused-variable]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-rc2-next-20210723/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c:252:28: warning: unused=
 variable =E2=80=98priv=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 section=
 mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

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
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x1804): undefined reference to `printk'
    (.text+0x1924): undefined reference to `printk'
    (.text+0x1c84): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    (.text+0x18dc): undefined reference to `printk'
    (.text+0x1c3c): undefined reference to `printk'

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
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]

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
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x17e8): undefined reference to `printk'
    (.text+0x1928): undefined reference to `printk'
    (.text+0x1ca8): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x17e8): undefined reference to `printk'
    (.text+0x1928): undefined reference to `printk'
    (.text+0x1ca8): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x1850): undefined reference to `printk'
    (.text+0x1990): undefined reference to `printk'
    (.text+0x1d10): undefined reference to `printk'

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
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    (.text+0x1d04): undefined reference to `printk'
    (.text+0x1e64): undefined reference to `printk'
    (.text+0x2284): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.text+0x18dc): undefined reference to `printk'
    (.text+0x1c3c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x1988): undefined reference to `printk'
    (.text+0x1d08): undefined reference to `printk'

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
malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warning=
s, 0 section mismatches

Errors:
    (.text+0x1690): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings,=
 0 section mismatches

Errors:
    (.text+0x1a14): undefined reference to `printk'
    (.text+0x1d94): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0=
 section mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

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
mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x18dc): undefined reference to `printk'
    (.text+0x1c3c): undefined reference to `printk'

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
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

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
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:584: undefined referen=
ce to `printk'
    /tmp/kci/linux/build/../arch/mips/kernel/genex.S:587: undefined referen=
ce to `printk'

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x1868): undefined reference to `printk'
    (.text+0x19a8): undefined reference to `printk'
    (.text+0x1d28): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 se=
ction mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x190c): undefined reference to `printk'
    (.text+0x1c8c): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

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
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, =
0 section mismatches

Errors:
    (.text+0x18c8): undefined reference to `printk'
    (.text+0x1a14): undefined reference to `printk'
    (.text+0x1d88): undefined reference to `printk'

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
tb0219_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

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
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
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
vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x18e0): undefined reference to `printk'
    (.text+0x1c40): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    (.text+0x1870): undefined reference to `printk'
    (.text+0x19b0): undefined reference to `printk'
    (.text+0x1d30): undefined reference to `printk'

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_re=
locate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/smpboot.c:50:20: warning: duplicate 'inline' declaration specifi=
er [-Wduplicate-decl-specifier]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    (.text+0x198c): undefined reference to `printk'
    (.text+0x1d0c): undefined reference to `printk'

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
