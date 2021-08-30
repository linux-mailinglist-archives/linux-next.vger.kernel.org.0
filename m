Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBD63FB6D7
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 15:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhH3NSZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 09:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhH3NSY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Aug 2021 09:18:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27232C061575
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 06:17:31 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso13831243pjh.5
        for <linux-next@vger.kernel.org>; Mon, 30 Aug 2021 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xMVZOe0ngCruqi1/S6N+86aGE1miFxF5fDRwSbR6YN4=;
        b=PHGYANoQDx2c5OlFFLVWOjk0Y71guKeOE/Gi1HKy64VpApiqGSmEX37QW5paEFgH4B
         4iBzaCSgKv/ZMEsyi98f+1/kq8WKPCaPuGyEtcB/teRkK+dkaNcdqw9S2NrVsqSrL9K7
         KP8vH4D+t8wSy0OvCjf3KfID5nkhUHPmmJ9mXscbwec5tCnXeyAH9lF89dx62T083v5v
         JFRQJrsprY591O1DX5KenDLPo/hUJPyiZCPDYAcbt1smI2LhkORbXjEANZyCnosri59s
         iBHUgshanYwPwp05qIXekfFlVmcnM/oHsNor0jW63LQiZIT0jZTltKJSeWBM9jYt1edD
         oRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xMVZOe0ngCruqi1/S6N+86aGE1miFxF5fDRwSbR6YN4=;
        b=lA/q0srlur2YxgTbSCLHo+3rdh1s6kMJwx+9A45KIH0ciAaTQKIsGaq+ZX/ASyufFV
         SyqTr2nU+1EhZqVRI8Uu7E7IJ2waxDTu8FnuARwzG5ofrPTqBgmqhF+ojEiOj63xFLlp
         8aYasmFVPnx1AsPbn1L1nYGzE5kvmjlWXGvhupvwcYJhBaAxJjuB1cO6bPo6asqnWHJA
         XNfkx8I0Z6WoL3wr9fZizKgFMmGZzSEfKKwaVNkbsWKiSADE9GZ6yIX67AEOmAwxNeyR
         8WO4/6FmtHfrJ4RWXnuDAV1KCRVMBgKvbJkIC2FQJUiSLFbGXCxv/fFszyDII7nvgzxZ
         mSPQ==
X-Gm-Message-State: AOAM5326AmwzgrcIQZyv9KfCY/C9+JynB79sLduEDuAgf1We/1tCENLI
        az4mJ4JrXEkWui6d2th0XmZ/XY6tFAx1mGcx
X-Google-Smtp-Source: ABdhPJwHrMLSvbAOiZklsJ0FH/JWCgXb93GZmuD5Ney9zWeeRFsTC4U2rWjRE96GYY9Gt0NYxlM1rg==
X-Received: by 2002:a17:90a:d596:: with SMTP id v22mr39962780pju.51.1630329447832;
        Mon, 30 Aug 2021 06:17:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l19sm14385486pjq.10.2021.08.30.06.17.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 06:17:27 -0700 (PDT)
Message-ID: <612cda67.1c69fb81.3ca50.46cf@mx.google.com>
Date:   Mon, 30 Aug 2021 06:17:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210830
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 212 builds: 6 failed, 206 passed, 493 errors,
 2363 warnings (next-20210830)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 212 builds: 6 failed, 206 passed, 493 errors, 2363 warni=
ngs (next-20210830)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210830/

Tree: next
Branch: master
Git Describe: next-20210830
Git Commit: 93717cde744f9d26aa1b4561f7d9ba2a230459eb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL

i386:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-12) FAIL

mips:
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-8): 4 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 42 errors, 44 warnings
    defconfig (clang-12): 814 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 808 warnings
    defconfig+kselftest (gcc-8): 46 errors, 39 warnings

arm:
    allmodconfig (gcc-8): 41 errors, 48 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 43 errors, 34 warnings
    aspeed_g5_defconfig (gcc-8): 43 errors, 34 warnings
    assabet_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 3 errors, 5 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (clang-12): 20 warnings
    multi_v7_defconfig (gcc-8): 3 errors, 5 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 errors, 5 warni=
ngs
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 3 errors=
, 5 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 errors, 5 warnings
    multi_v7_defconfig+kselftest (gcc-8): 46 errors, 39 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 3 errors, 7 warnings
    qcom_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 3 errors, 7 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings

i386:
    allmodconfig (clang-10): 1 error, 27 warnings
    allmodconfig (clang-12): 1 error, 27 warnings
    i386_defconfig+kselftest (gcc-8): 40 errors, 34 warnings

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig+kselftest (gcc-8): 40 errors, 35 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip32_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 2 warnings
    lemote2f_defconfig (gcc-8): 2 warnings
    loongson2k_defconfig (gcc-8): 4 warnings
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 4 warnings
    sb1250_swarm_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 2 warnings

riscv:
    defconfig+kselftest (gcc-8): 43 errors, 34 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    allnoconfig (clang-10): 3 warnings
    x86_64_defconfig+kselftest (gcc-8): 43 errors, 34 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-8): 43 errors, 34 warnin=
gs

Errors summary:

    187  cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-s=
ize-larger-than=E2=80=99 [-Werror]
    33   TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %=
12lld len: %d x: %12lld y: %12lld",
    22   include/linux/fortify-string.h:56:3: error: call to =E2=80=98__wri=
te_overflow=E2=80=99 declared with attribute error: detected write beyond s=
ize of object (1st parameter)
    22   include/linux/fortify-string.h:319:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    22   include/linux/fortify-string.h:125:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    18   include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of objec=
t =E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    18   include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of objec=
t =E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    11   include/linux/fortify-string.h:289:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:277:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:265:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:263:4: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:250:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:237:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:235:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:221:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:219:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:206:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:154:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    9    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement wit=
h no effect [-Werror=3Dunused-value]
    9    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    9    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    9    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of objec=
t =E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Da=
rray-bounds]
    9    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of objec=
t =E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Da=
rray-bounds]
    2    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!
    1    include/linux/thread_info.h:213:4: error: call to =E2=80=98__bad_c=
opy_to=E2=80=99 declared with attribute error: copy destination size is too=
 small
    1    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=
=98__compiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field
    1    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=
=98__compiletime_assert_1859=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field

Warnings summary:

    187  cc1: all warnings being treated as errors
    125  cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc=
-size-larger-than=E2=80=99
    98   block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 d=
efined but not used [-Wunused-function]
    12   1 warning generated.
    11   warning: unsafe strscpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strscpy.c
    11   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy.c
    11   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy-src.c
    11   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy.c
    11   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy-src.c
    11   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy.c
    11   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy-lit.c
    11   warning: unsafe memset() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memset.c
    11   warning: unsafe memscan() usage lacked '__read_overflow' warning i=
n ../lib/test_fortify/read_overflow-memscan.c
    11   warning: unsafe memmove() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-memmove.c
    11   warning: unsafe memmove() usage lacked '__read_overflow2' warning =
in ../lib/test_fortify/read_overflow2-memmove.c
    11   warning: unsafe memcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memcpy.c
    11   warning: unsafe memcpy() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcpy.c
    11   warning: unsafe memcmp() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcmp.c
    11   warning: unsafe memcmp() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memcmp.c
    11   warning: unsafe memchr_inv() usage lacked '__read_overflow' warnin=
g in ../lib/test_fortify/read_overflow-memchr_inv.c
    11   warning: unsafe memchr() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memchr.c
    11   drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=
=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    6    2 warnings generated.
    4    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: war=
ning: variable 'err' is used uninitialized whenever switch case is taken [-=
Wsometimes-uninitialized]
    4    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: war=
ning: variable 'err' is used uninitialized whenever 'if' condition is false=
 [-Wsometimes-uninitialized]
    4    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: not=
e: initialize the variable 'err' to silence this warning
    4    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: wa=
rning: variable 'err' is used uninitialized whenever 'if' condition is fals=
e [-Wsometimes-uninitialized]
    4    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: not=
e: initialize the variable 'err' to silence this warning
    4    3 warnings generated.
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/pwm/pwm-visconti.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/mdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/can/flexcan.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/crypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    2    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=
=99 is usually a function [-Wmain]
    2    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame siz=
e of 1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    2    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    2    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98429=
4967295=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-large=
r-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13:=
 warning: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-i2s=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-dmi=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-ahu=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-adm=
aif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra186-dsp=
k.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-=
pcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-=
i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rk3399-gr=
u-sound.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sm8250.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sdm845.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-qcom-common.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-platfor=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-apq8016=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8096.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6routing.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-t9015.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-gx-sou=
nd-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g12a-t=
oacodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-td=
m-interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-td=
m-formatter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-sp=
difout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-sp=
difin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-so=
und-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-pd=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-fr=
ddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-fi=
fo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-aiu.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/generic/snd-soc-simple-car=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wsa881x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8994.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8962.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-simple-mux.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5659.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5645.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-ana=
log.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-max98357a.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-va-ma=
cro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-gtm601.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7241.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7134.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-dmic.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-da7219.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-cros-ec-cod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-ak4613.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/hda/snd-hda-core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_taprio.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_mqprio.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_ingress.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_etf.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/act_mirred.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/act_gate.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/act_gact.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/rfkill/rfkill.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-smd.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/nfc/nci/nci.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_conntrack.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_LOG.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_CHECKSUM.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf_conntrack.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/mac80211/mac80211.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/llc/llc.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/sit.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_nat.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/ipv6.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/tunnel4.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_nat.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/ip_tunnel.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot_8021q.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/dsa/dsa_core.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/can/can.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/can/can-raw.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/bridge/bridge.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/bluetooth/hidp/hidp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/8021q/8021q.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/802/stp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/802/psnap.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/802/garp.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/libcrc32c.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libsm4.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libcurve25519-generic.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libchacha.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crc-ccitt.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/fs/overlayfs/overlay.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/sunxi_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/video/backlight/lp855x_bl.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/typec.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tipd/tps6598x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/serial/usbserial.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/serial/usb_wwan.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/serial/option.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/serial/ftdi_sio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/renesas_usbhs/renesas_us=
bhs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/host/xhci-pci-renesas.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/tegra-xudc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/renesas_usb3.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/libcomposite.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_se=
rial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_nc=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ma=
ss_storage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ec=
m_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ac=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_serial=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_ether.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/class/cdc-acm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/tegra/tegra-soctherm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/rockchip_thermal.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/qoriq_thermal.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/imx8mm_thermal.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/brcmstb_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2835_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spidev.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-sh-msiof.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-qcom-qspi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spifc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-imx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-bcm2835.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/socinfo.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/qmi_helpers.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/pdr_interface.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/mdt_loader.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/mediatek/mtk-devapc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/amlogic/meson-canvas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/slimbus/slimbus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/scsi/raid_class.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-snvs.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf85363.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf2127.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-m41t80.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-imx-sc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-ds1307.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rpmsg/qcom_glink_smem.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_sysmon.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_pas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_mss.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_common.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/regulator/vctrl-regulator.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-tegra.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sun4i.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sl28cpld.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-meson.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/power/supply/sbs-battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/power/supply/max17042_batter=
y.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/power/supply/bq25890_charger=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/power/reset/qcom-pon.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/allwinner/phy-sun6i-mipi=
-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/endpoint/functions/pci-e=
pf-test.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-rockchip=
-host.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/controller/dwc/pcie-tegr=
a194.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nvme/host/nvme.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcor=
e_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcor=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/marvell/mwifiex=
/mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/veth.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/zaurus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/sr9800.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/smsc75xx.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/rtl8150.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/r8152.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/pegasus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/net1080.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/mcs7830.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ncm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/tap.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/smsc.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/microchip.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/marvell.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/broadcom.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm7xxx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm54140.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm-phy-lib.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/ax88796b.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/mdio/mdio-mux-meson-g12a=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
stmmac-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-altr-socfpga.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/qualcomm/emac/q=
com-emac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx5/c=
ore/mlx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx4/m=
lx4_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/broadcom/bnx2x/=
bnx2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/atheros/atl1c/a=
tl1c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/dsa/ocelot/mscc_felix.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_canfd.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_can.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/mfd/wm8994.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/mfd/wcd934x.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/memory/renesas-rpc-if.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-mem2mem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-h264.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-fwnode.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-dv-timi=
ngs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/usb/uvc/uvcvideo.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/xc5000.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-xc2028.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-types.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda8290.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda18271.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-xbox-360=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-x96max.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-wetek-hu=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videostr=
ong-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-vega-s9x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twinhan1=
027.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tt-1500.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-total-me=
dia-in-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec=
-slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisa=
t-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisa=
t-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tbs-nec.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tanix-tx=
5max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-su3000.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-snapstre=
am-firefly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-rc6-mce.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pv951.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-purpletv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-proteus-=
2309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-powercol=
or-real-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-002t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-grey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pctv-sed=
na.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-odroid.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-npgtech.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-tvan=
ywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-k=
iii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-lme2510.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-p=
lus-tv-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-p=
c150u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-3=
15u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khamsin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khadas.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-pad=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-mce=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-tv-=
demo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-pop=
lar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-genius-t=
vgo-a11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-gadmei-r=
m008z.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flyvideo=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flydvb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-eztv.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dtt200u.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-liv=
e-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-liv=
e-dvb-t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dm1105-n=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digittra=
de.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digitaln=
ow-tinytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dib0700-=
nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-d680-dmb=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-cinergy.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-budget-c=
i-old.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold-c=
olumbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-azurewav=
e-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-a16d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-x10.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-tv-w=
onder-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-asus-pc3=
9.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-astromet=
a-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-alink-dt=
u-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-adstech-=
dvb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/vsp1/vsp1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/sunxi/sun6i-c=
si/sun6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-mfc/s5p-m=
fc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-jpeg/s5p-=
jpeg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_drif.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar=
-vin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-fcp.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/ve=
nus-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/exynos-gsc/ex=
ynos-gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/mc/mc.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/i2c/ov5645.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/i2c/ir-kbd-i2c.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/i2c/imx219.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/dvb-core/dvb-core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/md-mod.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/dm-zero.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/dm-region-hash.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/dm-mod.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/dm-mirror.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/md/dm-log.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/mailbox/bcm-flexrm-mailbox.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/leds/leds-pca9532.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/leds/leds-lm3692x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm835=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm815=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-msm89=
16.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-smd-rp=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-osm-l3=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx8mq-inte=
rconnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx-interco=
nnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/goodix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/edt-ft5x06=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/atmel_mxt_=
ts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/misc/pwm-vibra.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/misc/pm8xxx-vibrator.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/keyboard/snvs_pwrkey.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/keyboard/imx_sc_key.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/input/keyboard/adc-keys.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/pressure/mpl3115.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/pressure/cros_ec_baro.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/light/isl29018.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/light/cros_ec_light_prox=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sen=
sors_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sen=
sors_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sen=
sors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/common/cros_ec_sensors/c=
ros_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/buffer/industrialio-trig=
gered-buffer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/rockchip_saradc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/max9611.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-geni.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-bcm2835.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/sl28cpld-hwmon.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/raspberrypi-hwmon.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/pwm-fan.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/lm90.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/ina3221.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hwmon/ina2xx.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/host1x/host1x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/vc4/vc4.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-frontend=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-backend.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/scheduler/gpu-sched.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rockchip/rockchipdrm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panfrost/panfrost.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-truly-nt=
35597.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-sitronix=
-st7703.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-simple.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-raydium-=
rm67191.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-boe-tv10=
1wum-nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/nouveau/nouveau.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mediatek/mediatek-dr=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/sil164.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/kiri=
n-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/dw_d=
rm_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/exynos/exynosdrm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_vram_helper.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_ttm_helper.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/thc63lvd1024.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/sii902x.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/parade-ps8640=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt961=
1uxc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt891=
2b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/adv7511/adv75=
11.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-wcd934x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-sl28cpld.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-regmap.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-altera.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gnss/gnss.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-serial.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-mtk.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-region.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-bridge.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/dma/bcm-sba-raid.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/devfreq/governor_userspace.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/qcom-rng.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/zip/hisi_zi=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/trng/hisi-t=
rng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/sec2/hisi_s=
ec2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hpre/hisi_h=
pre.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hisi_qm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/ccree/ccree.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/error.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/dpaa2_caam.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/amlogic/amlogic-gxl-c=
rypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/allwinner/sun8i-ce/su=
n8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/raspberrypi-cpufreq.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/cpufreq_conservative=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/cppc_cpufreq.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/qcom/camcc-sdm845.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/meson/sclk-div.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/meson/clk-phase.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/clk-bd718x7.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_si.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_msghandler.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_devintf.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/xgene-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/optee-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/mtk-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/meson-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/iproc-rng200.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/hisi-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/exynos-trng.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/cavium-rng.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/bcm2835-rng.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/arm_smccc_trn=
g.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bus/tegra-aconnect.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btusb.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btrtl.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btqca.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/block/nbd.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-slimbus.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/xts.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/xor.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/sm4_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/sha3_generic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/sha256_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/md5.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ghash-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/gcm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ecdh_generic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ecc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ecb.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/dh_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/des_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/curve25519-generic.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ctr.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/crypto_engine.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/cmac.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/ccm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/blake2b_generic.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/algif_rng.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pla=
tform/chrome/cros_ec_chardev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    warning: aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/drivers/platform/chrome/cro=
s_ec_typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc=
-twinhan-dtv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/meson/snd-soc-meson-card-utils.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-gx-so=
und-card.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/generic/snd-soc-simple-card-utils.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/generic/snd-soc-audio-graph-card.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko: unsupported GNU_PROPER=
TY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/codecs/snd-soc-max98927.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/soc/codecs/snd-soc-lpass-wsa-macro.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/wireless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/netfilter/xt_nat.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/netfilter/xt_MASQUERADE.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/ipv6/netfilter/ip6_tables.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/ipv4/netfilter/iptable_filter.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/802/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/lib/zstd/zstd_compress.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/lib/crypto/libdes.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/fs/fuse/fuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/watchdog/meson_wdt.koaarch64-linux-gnu-strip: : unsup=
ported GNU_PROPERTY_TYPE (warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/watchdog/qcom-wdt.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc00000005
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/watchdog/meson_gxbb_wdt.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/usb/host/xhci-pci.koaarch64-linux-gnu-strip: warning:=
 /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dri=
vers/usb/serial/cp210x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/usb/gadget/function/usb_f_fs.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/spi/spi-rpc-if.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/spi/spi-dw-mmio.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/spi/spi-bcm2835aux.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/soc/qcom/apr.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/rtc/rtc-rx8581.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/reset/reset-raspberrypi.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/reset/reset-berlin.ko: unsupported GNU_PROPERTY_TYPE =
(  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/=
kernel/drivers/reset/reset-qcom-pdc.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/pwm/pwm-cros-ec.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/power/supply/bq25980_charger.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lpi.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/phy/rockchip/phy-rockchip-inno-hdmi.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/phy/renesas/phy-rcar-gen3-usb3.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_TYPE =
(5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830=
/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/nvme/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_pcie.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_snoc.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/usb/smsc95xx.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/usb/plusb.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/usb/lan78xx.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/macvlan.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/ethernet/qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_en.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/misc/pci_endpoint_test.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/misc/eeprom/at25.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/v4l2-core/videodev.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/tuners/xc4000.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/tuners/tuner-simple.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/tuners/mc44s803.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/meson-ir.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.ko  STRIP   /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/sunxi-cir.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-videomate-m1f.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000warning:
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-streamzap.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-pixelview-new.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-color.ko: unsupported GN=
U_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-msi-tvanywhere.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-msi-digivox-iii.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-medion-x10-digitainer.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-iodata-bctv7e.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-hauppauge.ko: unsupported GNU_PRO=
PERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-geekbox.ko: unsupported GNU_PROPE=
RTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-=
20210830/kernel/drivers/media/rc/keymaps/rc-gotview7135.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-dvico-portable.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-dib0700-rc5.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-cinergy-1400.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-asus-ps3-100.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/platform/qcom/venus/venus-dec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/common/videobuf2/videobuf2-common.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/iio/magnetometer/st_magn_spi.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/iio/light/vcnl4000.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/hid/hid-multitouch.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE (  =
INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ker=
nel/drivers/hid/i2c-hid/i2c-hid-acpi.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/mediatek/mediatek-drm-hdmi.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/drm_kms_helper.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/fpga/stratix10-soc.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/edac/layerscape_edac_mod.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/tegra210-adma.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/crypto/caam/caam_jr.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/clk/meson/axg-audio.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/char/hw_random/omap-rng.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/char/hw_random/cavium-rng-vf.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/bluetooth/btbcm.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/crypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/crypto/af_alg.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linu=
x-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-nex=
t-20210830/kernel/arch/arm64/lib/xor-neon.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    1    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: =
stack frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wfram=
e-larger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_de=
vices=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:138:4: warning: argu=
ment 1 value =E2=80=984294967295=E2=80=99 exceeds maximum object size 21474=
83647 [-Walloc-size-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/cpufreq/vexpress-spc-cpufreq.c:454:6: warning: unused vari=
able =E2=80=98cur_cluster=E2=80=99 [-Wunused-variable]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    1    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf_log_syslog=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-mtk-disp.ko=
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/driv=
ers/pwm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPE=
RTY_TYPE (55) type: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/media/rc/keymaps/rc-avertv-303.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-terratec-slim.kowarning: : unsupported GNU_PROPERTY_TYPE (=
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/driv=
ers/media/rc/keymaps/rc-tevii-nec.ko5: unsupported GNU_PROPERTY_TYPE () typ=
e: 0x5c0000000) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-nec-terratec-cinergy-xs.kowarning: : unsupported GNU_PROPE=
RTY_TYPE (/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/k=
ernel/drivers/media/rc/keymaps/rc-norwood.ko5: unsupported GNU_PROPERTY_TYP=
E () type: 0x5c0000000) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip:   STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/s=
ound/soc/meson/snd-soc-meson-axg-fifo.ko
    1    aarch64-linux-gnu-strip: warning: 5/tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: =
unsupported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra-audio-=
graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsu=
pported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/s=
nd-soc-tegra-audio-graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko =
 STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/sound/soc/qcom/snd-soc-lpass-platform.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsu=
pported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g12a-t=
ohdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-codec-=
glue.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-card-u=
tils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-to=
ddr.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-to=
ddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-td=
min.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmou=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-td=
min.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/generic/snd-soc-simple-car=
d-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: u=
nsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5) type: 0xc0000000w=
arning:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8960.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8904.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8904.ko: =
unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/imx-pcm-dma.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-tas571x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-simple-ampl=
ifier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5663.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5663.ko  =
STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ker=
nel/sound/soc/codecs/snd-soc-spdif-rx.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514-spi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rl6231.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2=
c.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/s=
oc/codecs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-dig=
ital.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-dig=
ital.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/s=
nd-soc-pcm3168a-i2c.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-max98927.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-wsa-m=
acro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-hdmi-codec.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko=
: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-va-m=
acro.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-tegra.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/wireless/cfg80211.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_cbs.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/sch_cbs.ko: unsupported GN=
U_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/cls_flower.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modu=
les_/lib/modules/5.14.0-next-20210830/kernel/net/sched/sch_etf.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/cls_flower.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/cls_basic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/sched/cls_basic.ko  INSTALL /tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/sche=
d/sch_cbs.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/qrtr/ns.ko  STRIP   /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-sm=
d.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/nfc/nfc.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/nfc/nfc.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_tcpudp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_tcpudp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_nat.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_addrtype.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_addrtype.ko: unsupp=
orted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/net/qrtr/ns.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_MASQUERADE.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/x_tables.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf_nat.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf_log_syslog.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_mangle.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_filter.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_filter.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000=
000warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830=
/kernel/net/ipv6/netfilter/ip6t_REJECT.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6_tables.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_mangle.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_filter.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ipt_REJECT.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ip_tables.ko: uns=
upported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5warning: ) type: 0x/t=
mp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/ip=
v4/netfilter/iptable_mangle.koc0000000: unsupported GNU_PROPERTY_TYPE (
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ip_tables.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/can/can-gw.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/can/can-bcm.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/net/can/can.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/bluetooth/bluetooth.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/802/p8022.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/net/802/mrp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/zstd/zstd_compress.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko: unsupported G=
NU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/fs/btrfs/btrfs.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libsha256.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libdes.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/lib/crypto/libarc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/fs/nfs/blocklayout/blocklayoutdriver=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/fs/fuse/cuse.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/fs/fuse/cuse.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/fs/btrfs/btrfs.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/sl28cpld_wdt.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/meson_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/qc=
om-wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/meson_gxbb_wdt.ko: =
unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/watch=
dog/sl28cpld_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/video/backlight/pwm_bl.koaar=
ch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5=
.14.0-next-20210830/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/tcpci.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/fusb302.ko: u=
nsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: 0x=
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/driv=
ers/usb/typec/tcpm/tcpci.koc0000000: unsupported GNU_PROPERTY_TYPE (5) type=
: 0x
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/fusb302.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/hd3ss3220.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/=
fusb302.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/hd3ss3220.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/serial/cp210x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/host/xhci-pci.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_rn=
dis.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ob=
ex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_fs=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ee=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-s=
trip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ee=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ec=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ec=
m.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_=
f_fs.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/tegra/tegra-bpmp-the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/qcom/qcom-spmi-temp-=
alarm.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning:=
 /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dri=
vers/thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/qcom/qcom-spmi-temp-=
alarm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/imx_sc_thermal.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2711_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/staging/media/hantro/hantro-=
vpu.ko  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021=
0830/kernel/drivers/thermal/qoriq_thermal.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-rpc-if.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spicc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spicc.ko  STRI=
P   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
drivers/spi/spi-qcom-qspi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-geni-qcom.ko: unsupp=
orted GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spifc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-dw.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-dw-mmio.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-bitbang.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-bcm2835aux.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-qcom.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-qcom.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/soundwire/soundwire-bus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-bus.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/soc/qcom/apr.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ctrl.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ctrl.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rx8581.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko  INSTALL /=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drive=
rs/scsi/ufs/ufs_qcom.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv3028.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv3028.ko: unsupport=
ed GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rk808.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rk808.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-hym8563.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: un=
supported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-m41t80.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/reset/reset-qcom-pdc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/reset/reset-meson-audio-arb.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/reset/reset-berlin.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_pil_info.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-rcar.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-mtk-disp.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-imx27.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-cros-ec.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-bcm2835.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/power/supply/bq25980_charger=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/platform/chrome/cros_ec_type=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/tegra/phy-tegra194-p2u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-rockchip-pc=
ie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-rockchip-in=
no-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/renesas/phy-rcar-gen3-us=
b3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko=
: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/=
mediatek/phy-mtk-mipi-dsi-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/mediatek/phy-mtk-mipi-ds=
i-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/phy/freescale/phy-fsl-imx8-m=
ipi-dphy.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_=
/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/mediatek/phy-mtk-hdmi-=
drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/perf/thunderx2_pmu.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-brcmstb.=
ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/p=
ci/controller/dwc/pci-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-brcmstb.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/pci/controller/dwc/pci-meson=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nvmem/nvmem_meson_efuse.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nvmem/nvmem-rmem.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nvme/host/nvme-core.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wl18xx/wl18x=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wl18xx/wl18x=
x.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/marvell/mwifiex=
/mwifiex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80=
211/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80=
211/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80=
211/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/nvme=
m/nvmem_meson_efuse.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/usbnet.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/smsc95xx.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/plusb.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/lan78xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/dm9601.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_subset.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ether.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ether.ko  STRIP =
  /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/net/usb/dm9601.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/ax88179_178a.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/asix.ko: unsupported=
 GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: 0x/tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/us=
b/ax88179_178a.koc0000000: unsupported GNU_PROPERTY_TYPE (5
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/asix.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/meson-gxl.koaarch64-=
linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0=
-next-20210830/kernel/drivers/net/phy/marvell10g.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/meson-gxl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/phy/marvell10g.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/pcs/pcs_xpcs.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000warning:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/macvtap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/macvlan.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ipa/ipa.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
stmmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ipa/ipa=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/qualcomm/rmnet/=
rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mscc/mscc_ocelo=
t_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx4/m=
lx4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/broadcom/genet/=
genet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/can/dev/can-dev.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/can/dev/can-dev.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_canfd=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/misc/uacce/uacce.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/misc/pci_endpoint_test.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at25.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/misc/pci_endpoint_test.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at24.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at24.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/mfd/exynos-lpass.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/videodev.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-async.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/xc4000.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-simple.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda9887.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda827x.ko: uns=
upported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/tu=
ners/mt20xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda827x.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/mt20xx.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/mc44s803.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/sunxi-cir.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/rc-core.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/meson-ir.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-zx-irdec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-xbox-dvd=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-winfast.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomat=
e-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomat=
e-s350.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomat=
e-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twinhan-=
dtv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-trekstor=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-total-me=
dia-in-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tivo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tivo.ko:=
 unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-trekstor.=
ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tevii-ne=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-s=
trip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec=
-slim.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tanix-tx=
3mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-streamza=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-reddo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-real-aud=
io-220-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-new.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-color.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pine64.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-norwood.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nec-terr=
atec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nebula.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nebula.k=
o: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-norwood=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-tvan=
ywhere.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-digi=
vox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-minix-ne=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x=
10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/medi=
a/rc/keymaps/rc-msi-digivox-ii.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x=
10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x=
10-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux=
-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x=
10-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x=
10-digitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-manli.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-manli.ko=
: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-=
kiii-pro.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-leadtek-=
y04g0051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kaiomy.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v=
1.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/media/rc/keymaps/rc-it913x-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-iodata-b=
ctv7e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-rsc=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-rsc=
.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-kworld-315u.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hauppaug=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-gotview7=
135.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-geekbox.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-fusionhd=
tv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-evga-ind=
tube.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/me=
dia/rc/keymaps/rc-gadmei-rm008z.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-em-terra=
tec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dvico-po=
rtable.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dvbsky.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dib0700-=
rc5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-delock-6=
1959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ct-90405=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ct-90405=
.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv=
-live-dvb-t.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-cinergy-=
1400.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-beelink-=
gs1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-cinergy-1400.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-beelink-=
gs1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avertv-3=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedi=
a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-asus-ps3=
-100.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-apac-vie=
wcomp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-anysee.k=
oaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-apac-viewcomp.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-anysee.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_fdp1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_fdp1.ko:=
 unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/media/platform/vsp1/vsp1.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar=
-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/m=
edia/platform/s5p-mfc/s5p-mfc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar=
-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/ve=
nus-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/ve=
nus-dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/camss/qc=
om-camss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/i2c/imx2=
19.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/video=
buf2-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/media/cec/core/cec.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm825=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm825=
0.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-s=
m8350.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/light/vcnl4000.ko: unsup=
ported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_i2c.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/buffer/kfifo_buf.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-vadc-common.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-gpio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/hid/hid-multitouch.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/ttm/ttm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi=
.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi=
.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: =
unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/dr=
m/sun4i/sun4i-tcon.ko5) type: 0x: unsupported GNU_PROPERTY_TYPE (c0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi=
.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko:=
 unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: =
0x/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/gpu/drm/rcar-du/rcar_lvds.koc0000000: unsupported GNU_PROPERTY_TYPE (5
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-mantix-m=
laf057we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-lvds.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-lvds.ko:=
 unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-mantix-m=
laf057we51.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/msm/msm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/msm/msm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/p=
anel-boe-tv101wum-nl6.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mediatek/mediatek-dr=
m-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/lima/lima.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip=
: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/=
kernel/drivers/gpu/drm/lima/lima.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/hibmc/hibm=
c-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_kms_helper.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-m=
ipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modu=
les_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_dp_aux_bus=
.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/simple-bridge=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/dr=
m/bridge/thc63lvd1024.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/simple-bridge=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt961=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt961=
1.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202108=
30/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/display-conne=
ctor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/analogix/anal=
ogix_dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/stratix10-soc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/of-fpga-region.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/of-fpga-region.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/fpga/stratix10-soc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/altera-freeze-bridge.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/extcon/extcon-ptn5150.ko  IN=
STALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kerne=
l/drivers/gnss/gnss.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/edac/layerscape_edac_mod.ko:=
 unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/t=
egra210-adma.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/dma/sun6i-dma.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/dma/sh/usb-dmac.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/devfreq/imx8m-ddrc.koaarch64=
-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210830/kernel/drivers/devfreq/imx-bus.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/devfreq/imx8m-ddrc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/devfreq/imx-bus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caamhash_desc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caamalg_desc.ko:=
 unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5/tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/cryp=
to/caam/caam_jr.ko) type: 0x: unsupported GNU_PROPERTY_TYPE (c00000005
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caam.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/cpufreq_powersave.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/meson/axg-audio.ko  STRI=
P   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
drivers/clk/qcom/lpass-gfm-sm8250.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/bcm/clk-raspberrypi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/clk/bcm/clk-raspberrypi.ko: =
unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/clk/meson/clk-phase.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/rng-core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/rng-core.ko  =
STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ker=
nel/drivers/char/ipmi/ipmi_devintf.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/omap-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/cavium-rng-vf=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/hci_uart.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build=
/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/b=
cm2835-rng.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/hci_uart.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btintel.ko: unsupp=
orted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/bluetooth/btusb.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btintel.ko: unsupp=
orted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/bluetooth/btrtl.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/bluetooth/btbcm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-sdw.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/xxhash_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/cbc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/cbc.ko: unsupported GNU_PROPE=
RTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-=
20210830/kernel/crypto/ecdh_generic.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/authenc.koaarch64-linux-gnu-s=
trip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210=
830/kernel/crypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/authenc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/crypto/af_alg.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/arch/arm64/lib/xor-neon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpa=
ss-apq8016.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-me=
son-gx-sound-card.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-w=
m8962.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-r=
t5663.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-l=
pass-wsa-macro.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_nat.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/libarc4.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-r=
ockchip-inno-hdmi.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/mdio/mdio-mux-=
meson-g12a.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/r=
c-msi-digivox-iii.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/common/video=
buf2/videobuf2-v4l2.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hi=
d.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/firmware/stratix10=
-rsu.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/tegra210-adma.=
ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/dpaa2_=
caam.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/imx-cpufre=
q-dt.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/net/ipv4/ip_tunnel.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda82=
90.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rca=
r-vin/rcar-vin.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/common/video=
buf2/videobuf2-dma-contig.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/so=
und/soc/meson/snd-soc-meson-codec-glue.ko/tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmo=
ut.ko: unsupported GNU_PROPERTY_TYPE (5: unsupported GNU_PROPERTY_TYPE () t=
ype: 0x5c0000000) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/so=
und/soc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/so=
und/soc/codecs/snd-soc-rl6231.ko/tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514-spi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000000=
05
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/staging/media/hantro/hantro-vpu.ko/tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2711_therma=
l.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) t=
ype: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/reset/reset-raspberrypi.ko/tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/drivers/reset/reset-qcom-pdc.ko: unsupported GN=
U_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc00=
00000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/regulator/tps65132-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/pwm/pwm-imx27.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-nex=
t-20210830/kernel/drivers/pwm/pwm-mediatek.ko: unsupported GNU_PROPERTY_TYP=
E (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/media/rc/keymaps/rc-reddo.ko/tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-real-audio-220-32=
-keys.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5=
) type: 0x5c0000000) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_PROPERTY_TYPE (/=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drive=
rs/media/rc/keymaps/rc-encore-enltv2.ko5: unsupported GNU_PROPERTY_TYPE () =
type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/gpu/drm/bridge/display-connector.ko/tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/analogix/analog=
ix_dp.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5=
5) type: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dr=
ivers/crypto/caam/caamhash_desc.ko/tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210830/kernel/drivers/crypto/caam/caam.ko: unsupported GNU_=
PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000=
000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/cr=
ypto/xxhash_generic.ko: unsupported GNU_PROPERTY_TYPE (/tmp/kci/linux/build=
/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/base/regmap/regm=
ap-sdw.ko5: unsupported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/r=
ockchip/snd-soc-rockchip-spdif.kowarning: : unsupported GNU_PROPERTY_TYPE (=
5/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sou=
nd/soc/rockchip/snd-soc-rockchip-rt5645.ko) type: 0x: unsupported GNU_PROPE=
RTY_TYPE (c00000005) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/r=
ockchip/snd-soc-rockchip-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/f=
sl/snd-soc-fsl-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/f=
sl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/c=
odecs/snd-soc-wm8960.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/pci/h=
da/snd-hda-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/netfilt=
er/nf_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/n=
etfilter/xt_MASQUERADE.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/ipv6/ne=
tfilter/ip6table_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/=
libsha256.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/=
libarc4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/vid=
eo/backlight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb=
/gadget/function/usb_f_rndis.kowarning: : unsupported GNU_PROPERTY_TYPE (/t=
mp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/driver=
s/usb/gadget/function/usb_f_obex.ko: unsupported GNU_PROPERTY_TYPE (55) typ=
e: 0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/spi=
/spi-dw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/rtc=
/rtc-hym8563.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/res=
et/reset-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/reg=
ulator/tps65132-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm=
/pwm-mediatek.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm=
/pwm-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy=
/rockchip/phy-rockchip-pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy=
/rockchip/phy-rockchip-inno-dsidphy.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy=
/mediatek/phy-mtk-hdmi-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/nvm=
em/nvmem-rmem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/usb/usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/usb/cdc_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/macvtap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/ipa/ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-st=
rip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202108=
30/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net=
/ethernet/broadcom/genet/genet.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/mis=
c/uacce/uacce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/v4l2-core/v4l2-async.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/tuners/tda9887.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-zx-irdec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-winfast.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-winfast-usbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-videomate-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-tanix-tx3mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-pine64.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-msi-digivox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-gotview7135.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-fusionhdtv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-em-terratec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/rc/keymaps/rc-delock-61959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/med=
ia/platform/qcom/venus/venus-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio=
/magnetometer/st_magn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio=
/common/cros_ec_sensors/cros_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu=
/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu=
/drm/drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu=
/drm/bridge/synopsys/dw-hdmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/fpg=
a/altera-freeze-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: aarch64-linux-gn=
u-strip: warning: warning: warning: /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-vadc-common.ko/tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio/=
adc/qcom-spmi-vadc.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next=
-20210830/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERT=
Y_TYPE (: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc000000055
    1    : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000warning: /tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/can/c=
an-gw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/=
_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/sy=
nopsys/dw-mipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/net/can/can-bcm.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/bluetooth/bluetoot=
h.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/drivers/net/mdio/mdio-bcm-unimac.ko: unsupported GNU_PROPERTY_TYPE (aa=
rch64-linux-gnu-strip: 5) type: 0xwarning: c0000000/tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro=
/stmmac/stmmac.ko: unsupported GNU_PROPERTY_TYPE (
    1    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/drivers/media/rc/keymaps/rc-minix-neo.ko: unsupported GNU_PROPERTY_TYP=
E (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kii-pro=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    ) type: 0xaarch64-linux-gnu-strip: warning: c0000000/tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/k=
eymaps/rc-kaiomy.ko: unsupported GNU_PROPERTY_TYPE (5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 40 errors, 35 warn=
ings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 41 errors, 48 warnings, 0 section=
 mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    include/linux/thread_info.h:213:4: error: call to =E2=80=98__bad_copy_t=
o=E2=80=99 declared with attribute error: copy destination size is too small

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:138:4: warning: argument =
1 value =E2=80=984294967295=E2=80=99 exceeds maximum object size 2147483647=
 [-Walloc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/cpufreq/vexpress-spc-cpufreq.c:454:6: warning: unused variable =
=E2=80=98cur_cluster=E2=80=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9842949672=
95=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-larger-tha=
n=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 27 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: stack=
 frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wframe-lar=
ger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-12) =E2=80=94 FAIL, 1 error, 27 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 42 errors, 44 warnings, 0 secti=
on mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=98__c=
ompiletime_assert_1859=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field
    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=98__c=
ompiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 43 errors, 34 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 43 errors, 34 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 814 warnings, 0 secti=
on mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/crypto/af_alg.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu=
-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202=
10830/kernel/arch/arm64/lib/xor-neon.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/algif_rng.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/crypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/authenc.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_T=
YPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210=
830/kernel/crypto/ecdh_generic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ccm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/blake2b_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/cmac.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/crypto_engine.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ctr.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/des_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/curve25519-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecb.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/dh_generic.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecdh_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ghash-generic.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/md5.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/gcm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/crypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sha256_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/xor.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sha3_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/xts.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sm4_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/xxhash_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-sdw.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-slimbus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/block/nbd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/bluetooth/btbcm.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btintel.ko: unsupported=
 GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/drivers/bluetooth/btrtl.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btqca.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btrtl.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/arm_smccc_trng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/bcm2835-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btusb.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/cavium-rng-vf.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bus/tegra-aconnect.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/hci_uart.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/cavium-rng.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/exynos-trng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/hisi-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/iproc-rng200.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/meson-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/mtk-rng.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/rng-core.ko  STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/d=
rivers/char/ipmi/ipmi_devintf.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/omap-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/optee-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/xgene-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_devintf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_msghandler.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/bcm/clk-raspberrypi.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_si.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/clk-bd718x7.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/meson/axg-audio.ko  STRIP   /=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drive=
rs/clk/qcom/lpass-gfm-sm8250.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/meson/clk-phase.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/cppc_cpufreq.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/meson/sclk-div.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/cpufreq_conservative.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/qcom/camcc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/cpufreq_powersave.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/raspberrypi-cpufreq.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/amlogic/amlogic-gxl-crypto=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/allwinner/sun8i-ce/sun8i-c=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/crypto/caam/caamhash_desc.ko/tmp/kci/linux/build/_modules_/lib/modules/5.1=
4.0-next-20210830/kernel/drivers/crypto/caam/caam.ko: unsupported GNU_PROPE=
RTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000000c0=
000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/crypto/caam/dpaa2_caam.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/error.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/dpaa2_caam.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/crypto/caam/caam_jr.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/ccree/ccree.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hisi_qm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hpre/hisi_hpre.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/sec2/hisi_sec2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/zip/hisi_zip.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/qcom-rng.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/trng/hisi-trng-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/devfreq/governor_userspace.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/devfreq/imx8m-ddrc.koaarch64-linu=
x-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-nex=
t-20210830/kernel/drivers/devfreq/imx-bus.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/dma/bcm-sba-raid.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/dma/sh/usb-dmac.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/dma/sun6i-dma.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/edac/layerscape_edac_mod.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/tegra210-adma.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/extcon/extcon-ptn5150.ko  INSTALL=
 /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/dri=
vers/gnss/gnss.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/fpga/alt=
era-freeze-bridge.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-bridge.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/fpga/stratix10-soc.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-region.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/of-fpga-region.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-mtk.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-serial.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-altera.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-regmap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-wcd934x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/adv7511/adv7511.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/analogix/analogix_=
dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/display-connector.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt8912b.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt9611.ko =
 INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/drivers/gpu/drm/bridge/nwl-dsi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt9611uxc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/parade-ps8640.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/sii902x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/simple-bridge.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-a=
hb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-c=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i=
2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-mipi-d=
si.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/thc63lvd1024.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_vram_helper.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_ttm_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_ds=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/drm_kms_helper.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/mediatek/mediatek-drm-hdmi.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/lima/lima.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mediatek/mediatek-drm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-boe-tv101wum-=
nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-lvds.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf05=
7we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-simple.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-raydium-rm671=
91.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-sitronix-st77=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-truly-nt35597=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: unsu=
pported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: 0x/tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/gpu/drm/rcar-du/rcar_lvds.koc0000000: unsupported GNU_PROPERTY_TYPE (5
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panfrost/panfrost.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-backend.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rockchip/rockchipdrm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko: =
unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko
    aarch64-linux-gnu-strip: warning: 5/tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: unsup=
ported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: unsup=
ported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun=
4i/sun4i-tcon.ko5) type: 0x: unsupported GNU_PROPERTY_TYPE (c0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/hid/hid-multitouch.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/host1x/host1x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/msm/msm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/ina3221.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/ina2xx.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/lm90.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/pwm-fan.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/raspberrypi-hwmon.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-bcm2835.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/max9611.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/rockchip_saradc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/qcom-vadc-common.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/buffer/industrialio-triggered=
-buffer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/buffer/kfifo_buf.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors_=
i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors_=
spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/light/cros_ec_light_prox.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/iio/light/vcnl4000.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/light/isl29018.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_spi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/pressure/cros_ec_baro.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/pressure/mpl3115.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/adc-keys.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/imx_sc_key.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/snvs_pwrkey.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/misc/pm8xxx-vibrator.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/misc/pwm-vibra.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/atmel_mxt_ts.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/edt-ft5x06.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/goodix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx-interconnect=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-osm-l3.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx8mq-interconn=
ect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-msm8916.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-smd-rpm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8150.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko:=
 unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8350=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/leds/leds-lm3692x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8350.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/leds/leds-pca9532.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-log.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-mirror.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-region-hash.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-zero.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/common/videobuf2/videobuf2-common.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/cec/core/cec.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/=
videobuf2-v4l2.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/md-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/imx219.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/ir-kbd-i2c.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/dvb-core/dvb-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/ov5645.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/mc/mc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/exynos-gsc/exynos-=
gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/pl=
atform/qcom/venus/venus-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/platform/qcom/venus/venus-dec.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-fcp.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_drif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar-csi2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar-vin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/venus-c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_fdp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/camss/qcom-ca=
mss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-jpeg/s5p-jpeg.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/sunxi/sun6i-csi/su=
n6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-adstech-dvb-t=
-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-alink-dtu-m.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-anysee.koaarc=
h64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-apac-viewcomp.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-asus-pc39.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-astrometa-t2h=
ybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-tv-wonder=
-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-x10.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-asus-ps3-100.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-a16=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/vsp1/vsp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-car=
dbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-dvb=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-m13=
5a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-m73=
3a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-rm-=
ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avertv-303.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-azurewave-ad-=
tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold-columb=
us.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-beelink-gs1.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-cinergy-1400.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-budget-ci-old=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-cinergy-1400.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ct-90405.ko: =
unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-live=
-dvb-t.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dib0700-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-delock-61959.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dib0700-rc5.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-d680-dmb.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digitalnow-ti=
nytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digittrade.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
-t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
t-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dtt200u.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-em-terratec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-dvico-portable.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-enltv-=
fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-enltv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_PROPERTY_TYPE (/tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/me=
dia/rc/keymaps/rc-encore-enltv2.ko5: unsupported GNU_PROPERTY_TYPE () type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-eztv.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flydvb.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flyvideo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-fusionhdtv-mc=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-gadmei-rm008z=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-geekbox.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-genius-tvgo-a=
11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-gotview7135.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-hauppauge.ko: unsupported GNU_PROPERTY=
_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210830/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-mce.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-pad.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-rsc.ko  =
INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ker=
nel/drivers/media/rc/keymaps/rc-kworld-315u.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-iodata-bctv7e=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v1.ko:=
 unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/medi=
a/rc/keymaps/rc-it913x-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    ) type: 0xaarch64-linux-gnu-strip: warning: c0000000/tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymap=
s/rc-kaiomy.ko: unsupported GNU_PROPERTY_TYPE (5
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khadas.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/nouveau/nouveau.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khamsin.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-315u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-pc150u=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-plus-t=
v-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0=
051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-lme2510.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-manli.ko: uns=
upported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-=
pro.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kii-pr=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-p=
ro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x10-or=
2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-=
strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-medion-x10-digitainer.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-minix-neo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-digivox-i=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-msi-digivox-iii.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-msi-tvanywhere.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nebula.ko: un=
supported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-norwood.ko
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-nec-terratec-cinergy-xs.kowarning: : unsupported GNU_PROPERTY_T=
YPE (/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel=
/drivers/media/rc/keymaps/rc-norwood.ko5: unsupported GNU_PROPERTY_TYPE () =
type: 0x5c0000000) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-odroid.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-npgtech.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pctv-sedna.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-pine64.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-pinnacle-color.ko: unsupported GNU_PRO=
PERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-pctv=
-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview-002=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview-mk1=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-pixelview-new.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-proteus-2309.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-powercolor-re=
al-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pv951.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-purpletv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-rc6-mce.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/media/rc/keymaps/rc-reddo.ko/tmp/kci/linux/build/_modules_/lib/modules/5.1=
4.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-real-audio-220-32-keys=
.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0x5c0000000) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-snapstream-fi=
refly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-streamzap.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tanix-tx3mini=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-su3000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tanix-tx5max.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisat-ts3=
5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tbs-nec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisat-usb=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-terratec-cinergy-xs.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-terratec-slim.kowarning: : unsupported GNU_PROPERTY_TYPE (/tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/m=
edia/rc/keymaps/rc-tevii-nec.ko5: unsupported GNU_PROPERTY_TYPE () type: 0x=
5c0000000) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tivo.ko: unsu=
pported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-trekstor.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twin=
han-dtv-cab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twinhan1027.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tt-1500.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-vega-s9x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-videomate-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-videomate-m1f.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000warning:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videostrong-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-wetek-hub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-winfast-usbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-winfast.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-x96max.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-xbox-360.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-zx-irdec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.ko  STRIP   /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/sunx=
i-cir.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/sunxi-cir.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/rc-core.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/meson-ir.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/mt20xx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda18271.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/mc44s803.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda8290.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda827x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/tu=
ners/tda9887.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/tuners/tuner-simple.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-types.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-xc2028.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/xc5000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/xc4000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-dv-timings.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-async.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-h264.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-fwnode.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-mem2mem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/memory/renesas-rpc-if.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/usb/uvc/uvcvideo.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mfd/exynos-lpass.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mfd/wcd934x.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/v4l2-core/videodev.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mfd/wm8994.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at24.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at25.ko: unsupported =
GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/drivers/misc/pci_endpoint_test.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/misc/pci_endpoint_test.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/misc/uacce/uacce.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/dev/can-dev.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/can/flexcan.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_can.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_canfd.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/dsa/ocelot/mscc_felix.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/broadcom/genet/genet=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/qualcomm/emac/qcom-e=
mac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_e=
n.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ethe=
rnet/qualcomm/rmnet/rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-altr-socfpga.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/macv=
tap.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/mdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/macvlan.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000warning:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/mdio/mdio-mux-meson-g12a.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/ax88796b.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm-phy-lib.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ipa/ipa.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm54140.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm7xxx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/broadcom.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/marvell.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/meson-gxl.koaarch64-linux=
-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next=
-20210830/kernel/drivers/net/phy/marvell10g.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/microchip.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/smsc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/tap.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/asix.ko: unsupported GNU_=
PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: 0x/tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/ax8=
8179_178a.koc0000000: unsupported GNU_PROPERTY_TYPE (5
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ether.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_subset.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ncm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/dm9601.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/lan78xx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/mcs7830.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/net1080.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/pegasus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/plusb.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/rtl8150.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/smsc75xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/sr9800.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/r8152.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/=
usbnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/usb/smsc95xx.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/veth.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/zaurus.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_pc=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx5/core/m=
lx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_sn=
oc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_co=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcore_sdi=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nvme/host/nvme.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/nvmem/nvm=
em_meson_efuse.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/nvmem/nv=
mem-rmem.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/nvme/host/nvme-core.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nvmem/nvmem_meson_efuse.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/dwc/pci-meson.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/dwc/pcie-tegra194.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-brcmstb.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-rockchip-host=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/endpoint/functions/pci-epf-te=
st.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/perf/thunderx2_pmu.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/allwinner/phy-sun6i-mipi-dphy=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/medi=
atek/phy-mtk-hdmi-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi-drv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/phy/renesas/phy-rcar-gen3-usb3.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/rock=
chip/phy-rockchip-inno-dsidphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/phy/rockchip/phy-rockchip-inno-hdmi.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-rockchip-pcie.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/platform=
/chrome/cros_ec_chardev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    warning: aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/platform/chrome/cros_ec_=
typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/reset/qcom-pon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/bq25890_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/max17042_battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/power/supply/bq25980_charger.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/sbs-battery.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-=
bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/pwm/pwm-cros-ec.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/pwm/pwm-imx27.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202=
10830/kernel/drivers/pwm/pwm-mediatek.ko: unsupported GNU_PROPERTY_TYPE (: =
unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-mtk-disp.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sl28cpld.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-rcar.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-tegra.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/regulato=
r/tps65132-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/pwm/pwm-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/regulator/vctrl-regulator.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_common.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_pil_info.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_sysmon.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/reset/reset-berlin.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/reset/reset-meson-audio-arb.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/reset/reset-qcom-pdc.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/reset/reset-raspberrypi.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rpmsg/qcom_glink_smem.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-ds1307.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsuppo=
rted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210830/kernel/drivers/rtc/rtc-m41t80.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-hym8563.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-imx-sc.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-m41t80.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf85363.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf2127.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rk808.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_=
/lib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/rtc/rtc-rx8581.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-snvs.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/scsi/raid_class.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ctrl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slimbus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/amlogic/meson-canvas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/mediatek/mtk-devapc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/mdt_loader.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/pdr_interface.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/apr.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/qmi_helpers.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/socinfo.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-qcom.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-bus.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-bcm2835.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-bcm2835aux.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-bitbang.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-dw-mmio.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/spi/spi-=
dw.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spicc.ko  STRIP   /=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drive=
rs/spi/spi-qcom-qspi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-imx.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spifc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/spi/spi-rpc-if.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-qcom-qspi.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-sh-msiof.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spidev.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/staging/media/hantro/hantro-vpu.ko/tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2711_thermal.ko:=
 unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: =
0x) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/brcmstb_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/imx_sc_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/imx8mm_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2835_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/qcom/qcom-spmi-temp-alarm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/qoriq_thermal.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/rockchip_thermal.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/tegra/tegra-soctherm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/class/cdc-acm.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_ether.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_serial.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_acm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ecm.ko:=
 unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_fs.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ecm_sub=
set.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_eem.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/usb/gadget/function/usb_f_fs.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_mass_st=
orage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ncm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb/gadg=
et/function/usb_f_rndis.kowarning: : unsupported GNU_PROPERTY_TYPE (/tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb=
/gadget/function/usb_f_obex.ko: unsupported GNU_PROPERTY_TYPE (55) type: 0x=
) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/libcomposite.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/renesas_usb3.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/tegra-xudc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/host/xhci-pci-renesas.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/host/xhci-pci.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/cp210x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/ftdi_sio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/renesas_usbhs/renesas_usbhs.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/option.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/usbserial.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/usb_wwan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/hd3ss3220.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/fusb3=
02.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/tcpci.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/fusb302.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tipd/tps6598x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/typec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/video/backlight/lp855x_bl.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/video/ba=
cklight/pwm_bl.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/watchdog/meson_gxbb_wdt.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/watchdog/meson_wdt.koaarch64-linux-gnu-strip: : unsupporte=
d GNU_PROPERTY_TYPE (warning: /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/drivers/watchdog/qcom-wdt.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/watchdog/sl28cpld_wdt.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/watchdog/sunxi_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/fuse/cuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/libarc4.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crc-ccitt.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libarc4.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/overlayfs/overlay.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libchacha.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libcurve25519-generic.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/libsh=
a256.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/lib/crypto/libdes.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libsm4.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/libcrc32c.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/garp.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/zstd/zstd_compress.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/psnap.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/p8022.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/btrfs/btrfs.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/stp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/8021q/8021q.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/bluetooth/hidp/hidp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can-bcm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/net/can/can.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can-gw.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can-raw.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/bluetooth/bluetooth.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/bridge/bridge.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/dsa_core.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_filter.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ip_tables.ko: unsuppor=
ted GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5warning: ) type: 0x/tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/ipv4/ne=
tfilter/iptable_mangle.koc0000000: unsupported GNU_PROPERTY_TYPE (
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/ip_tunnel.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot_8021q.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_nat.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/tunnel4.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_filter.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000wa=
rning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kern=
el/net/ipv6/netfilter/ip6t_REJECT.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/ipv6/netfilt=
er/ip6table_mangle.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/ipv6/netfilter/ip6_tables.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_nat.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/sit.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/llc/llc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/nf_log_syslog.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/nf_nat.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/x_tables.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/ipv6.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_CHECKSUM.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_LOG.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/nf_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_MASQUERADE.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_addrtype.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_tcpudp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/net/netfilter/xt_nat.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/nfc/nci/nci.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/netfilter/xt_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/nfc/nfc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/mac80211/mac80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/rfkill/rfkill.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_gact.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_gate.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/cls_basic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_etf.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_mirred.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/cls_flower.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_cbs.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_mqprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_ingress.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_taprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/hda/snd-hda-core.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-tegra.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/wireless/cfg80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-ak4613.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-cros-ec-codec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: uns=
upported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-va-macro.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-da7219.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-dmic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7241.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-gtm601.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7134.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-=
wsa-macro.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-va-macro.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/codecs/snd-soc-lpass-wsa-macro.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-max98357a.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-analog.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-max98927.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-digital.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-so=
c-pcm3168a-i2c.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/s=
oc/codecs/snd-soc-rl6231.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514-spi.ko: unsupported =
GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5645.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5659.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5663.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-simple-amplifier=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-simple-mux.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-tas571x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8960.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsup=
ported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/sound/soc/fsl/imx-pcm-dma.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8962.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8994.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: unsupp=
orted GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: 5) type: 0xc0000000warnin=
g:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/sn=
d-soc-fsl-spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip:   STRIP   /t=
mp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/=
soc/meson/snd-soc-meson-axg-fifo.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko: unsupported GNU_PROPERTY_TY=
PE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/generic/snd-soc-simple-card-utils.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/generic/snd-soc-simple-card.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-fifo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-frddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-pdm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-sound-c=
ard.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-spdifin=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-spdifou=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-for=
matter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-int=
erface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/s=
oc/meson/snd-soc-meson-codec-glue.ko/tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmout.ko=
: unsupported GNU_PROPERTY_TYPE (5: unsupported GNU_PROPERTY_TYPE () type: =
0x5c0000000) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-card-utils.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g12a-toacod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-toddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g12a-tohdmi=
tx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-gx-sound-ca=
rd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-t9015.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6routing.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8096.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-qcom-common.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sm8250.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rk3399-gru-sou=
nd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-i2s.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-pcm.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/rockch=
ip/snd-soc-rockchip-rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/rockchip/snd-soc-rockchip-spdif.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra-audio-graph=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-admaif.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra186-dspk.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-i2s.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-ahub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-dmic.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 808 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/arch/arm64/lib/xor-neon.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/af_alg.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/authenc.koaarch64-linux-gnu-strip:=
 warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/k=
ernel/crypto/authencesn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/algif_rng.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/blake2b_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ccm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/cmac.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/crypto_engine.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ctr.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/curve25519-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/des_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/dh_generic.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecb.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecdh_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/gcm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/ghash-generic.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/md5.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sha256_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sha3_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/sm4_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/crypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/xor.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/crypto/xts.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/crypto/=
xxhash_generic.ko: unsupported GNU_PROPERTY_TYPE (/tmp/kci/linux/build/_mod=
ules_/lib/modules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-sd=
w.ko5: unsupported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/base/regmap/regmap-slimbus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/block/nbd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btintel.ko: unsupported=
 GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/drivers/bluetooth/btusb.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btbcm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btqca.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btusb.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/btrtl.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bus/tegra-aconnect.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/bluetooth/hci_uart.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.14.0-next-20210830/kernel/drivers/char/hw_random/bcm283=
5-rng.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/arm_smccc_trng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/bcm2835-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/char/hw_random/cavium-rng-vf.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/cavium-rng.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/hisi-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/exynos-trng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/iproc-rng200.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/meson-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/mtk-rng.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/char/hw_random/omap-rng.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/rng-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/optee-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/hw_random/xgene-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_devintf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_msghandler.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/bcm/clk-raspberrypi.ko: unsup=
ported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/clk/meson/clk-phase.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/char/ipmi/ipmi_si.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/clk-bd718x7.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/meson/sclk-div.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/clk/meson/axg-audio.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/meson/clk-phase.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/qcom/camcc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/cppc_cpufreq.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/cpufreq/imx-cpufreq-dt.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/cpufreq_conservative.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/allwinner/sun8i-ce/sun8i-c=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/raspberrypi-cpufreq.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/amlogic/amlogic-gxl-crypto=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caamhash_desc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caam.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/caamalg_desc.ko: unsu=
pported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5/tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/crypto/ca=
am/caam_jr.ko) type: 0x: unsupported GNU_PROPERTY_TYPE (c00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/dpaa2_caam.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/caam/error.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/ccree/ccree.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hpre/hisi_hpre.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/hisi_qm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/sec2/hisi_sec2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/qcom-rng.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/trng/hisi-trng-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/crypto/hisilicon/zip/hisi_zip.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/devfreq/governor_userspace.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/devfreq/imx-bus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/devfreq/imx8m-ddrc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/dma/bcm-sba-raid.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/tegra210-adma.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/firmware/stratix10-rsu.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/edac/layerscape_edac_mod.ko: unsu=
pported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/dma/tegra2=
10-adma.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/firmware/stratix10-rsu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/altera-freeze-bridge.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-bridge.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/fpga-region.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/of-fpga-region.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/fpga/stratix10-soc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/fpga/stratix10-soc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-mtk.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss-serial.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gnss/gnss.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-altera.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-regmap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpio/gpio-wcd934x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/gpu/drm/bridge/display-connector.ko/tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/analogix/analogix_dp=
.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) ty=
pe: 0x) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/adv7511/adv7511.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt8912b.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt9611.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/lontium-lt9611uxc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/parade-ps8640.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/sii902x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/simple-bridge.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bri=
dge/thc63lvd1024.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-a=
hb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko
    5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modu=
les_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/synopsy=
s/dw-mipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/thc63lvd1024.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_ttm_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_kms_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/drm_vram_helper.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_ds=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/=
drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip: war=
ning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kerne=
l/drivers/gpu/drm/lima/lima.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mediatek/mediatek-drm-hdm=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mediatek/mediatek-drm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-=
boe-tv101wum-nl6.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-boe-tv101wum-=
nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-lvds.ko: unsu=
pported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf05=
7we51.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-raydium-rm671=
91.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-simple.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-sitronix-st77=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panel/panel-truly-nt35597=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/panfrost/panfrost.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.koaa=
rch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-backend.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/rockchip/rockchipdrm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/msm/msm.ko: unsupported G=
NU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.1=
4.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.koaa=
rch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/gpu/drm/=
tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported GNU_PROPERTY_TYPE (  INSTA=
LL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/d=
rivers/hid/i2c-hid/i2c-hid-acpi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/hid-multitouch.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/host1x/host1x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/ina2xx.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/lm90.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/pwm-fan.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/raspberrypi-hwmon.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/ina3221.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-bcm2835.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/max9611.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: aarch64-linux-gnu-str=
ip: warning: warning: warning: /tmp/kci/linux/build/_modules_/lib/modules/5=
.14.0-next-20210830/kernel/drivers/iio/adc/qcom-vadc-common.ko/tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio/adc/q=
com-spmi-vadc.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021=
0830/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERTY_TYP=
E (: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc000000055
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/adc/rockchip_saradc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/buffer/industrialio-triggered=
-buffer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio/comm=
on/cros_ec_sensors/cros_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/iio/buffer/kfifo_buf.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors_=
i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/common/st_sensors/st_sensors_=
spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/light/cros_ec_light_prox.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/light/isl29018.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/light/vcnl4000.ko: unsupporte=
d GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5=
.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_i2c.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/magnetometer/st_magn_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/iio/magn=
etometer/st_magn.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/iio/magnetometer/st_magn_spi.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/pressure/cros_ec_baro.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/iio/pressure/mpl3115.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/adc-keys.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/misc/pm8xxx-vibrator.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/imx_sc_key.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/misc/pwm-vibra.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/keyboard/snvs_pwrkey.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/atmel_mxt_ts.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/goodix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/input/touchscreen/edt-ft5x06.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx-interconnect=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/imx/imx8mq-interconn=
ect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-osm-l3.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/icc-smd-rpm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-msm8916.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8150.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/interconnect/qcom/qnoc-sm8350.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/leds/leds-lm3692x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/leds/leds-pca9532.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-log.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-zero.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-mirror.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-region-hash.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/dm-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/=
videobuf2-dma-contig.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/md/md-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-sg.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/i2c/imx219.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/common/videobuf2/videobuf2-=
vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/imx219.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/dvb-core/dvb-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/ir-kbd-i2c.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/i2c/ov5645.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/exynos-gsc/exynos-=
gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/mc/mc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/gpu/drm/nouveau/nouveau.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/venus-d=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/venus-c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin=
/rcar-vin.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/qcom/venus/venus-e=
nc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-fcp.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_drif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar-csi2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/=
platform/s5p-mfc/s5p-mfc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar-vin/rcar-vin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/rcar_fdp1.ko: unsu=
pported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210830/kernel/drivers/media/platform/vsp1/vsp1.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-jpeg/s5p-jpeg.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/sunxi/sun6i-csi/su=
n6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-adstech-dvb-t=
-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-alink-dtu-m.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-anysee.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-apac-viewcomp=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/platform/vsp1/vsp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-astrometa-t2h=
ybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-asus-ps3-100.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-asus-pc39.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-tv-wonder=
-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-a16=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ati-x10.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-dvb=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-car=
dbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-m13=
5a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-m73=
3a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-avermedia-rm-=
ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/media/rc/keymaps/rc-avertv-303.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-azurewave-ad-=
tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-beelink-gs1.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold-columb=
us.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-budget-ci-old=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-behold.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-cinergy-1400.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-ct-90405.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dib0700-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-d680-dmb.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-delock-61959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-dib0700-rc5.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digitalnow-ti=
nytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-digittrade.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
-t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
t-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dtt200u.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-dvico-portabl=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-em-terratec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-dvico-mce.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-enltv-=
fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-enltv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-encore-enltv2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-evga-indtube.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/li=
nux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/r=
c/keymaps/rc-gadmei-rm008z.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-gadmei-rm008z=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flyvideo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-fusionhdtv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-geekbox.ko: unsupported GNU_PROPERTY_T=
YPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210=
830/kernel/drivers/media/rc/keymaps/rc-gotview7135.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-flydvb.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-genius-tvgo-a=
11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-eztv.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-gotview7135.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hauppauge.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-mce.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-rsc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-imon-pad.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-iodata-bctv7e.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-it913x-v2.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kaiomy.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khadas.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-khamsin.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-pc150u=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-315u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-kworld-plus-t=
v-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-lme2510.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-manli.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x10-di=
gitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-p=
ro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/=
keymaps/rc-msi-digivox-ii.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-medion-x10-or=
2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi=
-digivox-iii.ko
    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
drivers/media/rc/keymaps/rc-minix-neo.ko: unsupported GNU_PROPERTY_TYPE (aa=
rch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-mecool-kii-pro.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-msi-digivox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nebula.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-nec-terratec-=
cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-norwood.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-npgtech.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-odroid.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pctv-sedna.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pine64.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-colo=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pinnacle-pctv=
-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview-002=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview-mk1=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview-new=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pixelview.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-powercolor-re=
al-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-proteus-2309.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-purpletv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-rc6-mce.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-pv951.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-real-audio-22=
0-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-reddo.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-snapstream-fi=
refly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-tanix-tx3mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-streamzap.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-su3000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tanix-tx5max.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tbs-nec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisat-ts3=
5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-technisat-usb=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tivo.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tevii-nec.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-total-media-in-hand-02.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-trekstor.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-tt-1500.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twinhan-dtv-c=
ab-ci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-twinhan1027.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomate-m1f=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-vega-s9x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomate-s35=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videomate-tv-=
pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-videostrong-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-wetek-hub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-wetek-play2.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/rc=
/keymaps/rc-winfast.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-xbox-360.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-x96max.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/keymaps/rc-zx-irdec.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/rc/meson-ir.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda8290.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/rc/rc-core.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/tuners/mc44s803.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda827x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/tuners/=
mt20xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda18271.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda8290.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-simple.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tda9887.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-types.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/tuner-xc2028.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/tuners/xc5000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/media/v4=
l2-core/v4l2-async.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/media/tuners/xc4000.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-h264.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-dv-timings.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-fwnode.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/usb/uvc/uvcvideo.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/v4l2-mem2mem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/memory/renesas-rpc-if.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/media/v4l2-core/videodev.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mfd/wcd934x.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/mfd/wm8994.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/misc/eeprom/at24.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/misc/eeprom/at25.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/misc/pci_endpoint_test.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/misc/uac=
ce/uacce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/can/flexcan.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/dev/can-dev.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_canfd.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_canfd.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/dsa/ocelot/mscc_felix.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/can/rcar/rcar_can.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ethe=
rnet/broadcom/genet/genet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_en.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/qualcomm/emac/qcom-e=
mac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/qualcomm/rmnet/rmnet=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-altr-socfpga.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mscc/mscc_ocelot_swi=
tch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-visconti.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build=
/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ipa/ipa.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/macvtap.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/macvlan.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/mdio/mdio-mux-meson=
-g12a.ko
    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
drivers/net/mdio/mdio-bcm-unimac.ko: unsupported GNU_PROPERTY_TYPE (aarch64=
-linux-gnu-strip: 5) type: 0xwarning: c0000000/tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ethernet/stmicro/stmm=
ac/stmmac.ko: unsupported GNU_PROPERTY_TYPE (
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/ipa/=
ipa.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: =
warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/ke=
rnel/drivers/net/pcs/pcs_xpcs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/mdio/mdio-mux-meson-g12a.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/mdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/ax88796b.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm-phy-lib.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm54140.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/bcm7xxx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/broadcom.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/marvell.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/meson-gxl.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/marvell10g.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/ethernet/mellanox/mlx5/core/m=
lx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/microchip.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/phy/smsc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/tap.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/asix.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/ax88179_178a.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ncm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/cdc_ether.ko  STRIP   /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/net/usb/dm9601.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/usb/=
cdc_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/usb/dm9601.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/usb/lan78xx.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/net1080.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/mcs7830.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/pegasus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/usb/plusb.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/rtl8150.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/smsc75xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/smsc95xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/sr9800.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/r8152.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/usbnet.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/usb/zaurus.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/wireless/ath/ath.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/veth.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_pc=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/net/wire=
less/broadcom/brcm80211/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/wireless/ath/ath10k/ath10k_snoc.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ath/ath10k/ath10k_co=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/net/wireless/marvell/mwifiex/mwifiex_pcie.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko:=
 unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcore_sdi=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nvme/host/nvme-core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nvme/host/nvme.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/nvmem/nvmem-rmem.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-brcmstb.ko: u=
nsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pci/co=
ntroller/dwc/pci-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/pcie-rockchip-host=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/controller/dwc/pcie-tegra194.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pci/endpoint/functions/pci-epf-te=
st.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/perf/thunderx2_pmu.ko: unsupported GNU_PROPERTY_TYPE (5  S=
TRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kern=
el/drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/allwinner/phy-sun6i-mipi-dphy=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/freescale/phy-fsl-imx8-mipi-d=
phy.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210830/kernel/drivers/phy/mediatek/phy-mtk-hdmi-drv.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko: uns=
upported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/media=
tek/phy-mtk-mipi-dsi-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/renesas/phy-rcar-gen3-usb3.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-rockch=
ip-inno-hdmi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/phy/rockchip/phy-rockchip-inno-hd=
mi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/platform=
/chrome/cros_ec_chardev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/phy/rock=
chip/phy-rockchip-pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lpi.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/reset/qcom-pon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/platform/chrome/cros_ec_typec.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/bq25890_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/bq25980_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/max17042_battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/power/supply/sbs-battery.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-cros-ec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-bcm2835.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-imx27.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-=
mediatek.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-mtk-disp.ko/tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/p=
wm/pwm-rcar.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_T=
YPE (55) type: 0x) type: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sl28cpld.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/pwm/pwm-tegra.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/pwm/pwm-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/regulator/tps65132-regulator.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/regulator/vctrl-regulator.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_common.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/remoteproc/qcom_sysmon.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/reset/re=
set-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/reset/reset-berlin.ko: unsupported GNU_PROPERTY_TYPE (  ST=
RIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kerne=
l/drivers/reset/reset-qcom-pdc.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/reset/reset-raspberrypi.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210830/kernel/drivers/reset/reset-qcom-pdc.ko: unsupported GNU_PRO=
PERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: 0xc0000000=
c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rpmsg/qcom_glink_smem.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-=
hym8563.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-ds1307.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-imx-sc.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-m41t80.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf2127.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pcf85363.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rk808.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GN=
U_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210830/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rv8803.ko  INSTALL /tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/sc=
si/ufs/ufs_qcom.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-snvs.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/rtc/rtc-rx8581.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/scsi/raid_class.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/amlogic/meson-canvas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slim-qcom-ctrl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/mediatek/mtk-devapc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/slimbus/slimbus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/mdt_loader.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/pdr_interface.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/soc/qcom/apr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/qmi_helpers.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soc/qcom/socinfo.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-bcm2835.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/soundwire/soundwire-qcom.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers=
/soundwire/soundwire-bus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/spi/spi-bcm2835aux.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/spi/spi-dw-mmio.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-dw.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-geni-qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5=
.14.0-next-20210830/kernel/drivers/spi/spi-meson-spifc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-imx.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spicc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-qcom-qspi.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-meson-spifc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-rpc-if.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spi-sh-msiof.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/spi/spidev.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2835_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/bcm2711_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/imx8mm_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/broadcom/brcmstb_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/qcom/qcom-spmi-temp-alarm=
.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/=
thermal/imx_sc_thermal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/staging/media/hantro/hantro-vpu.k=
o  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/=
kernel/drivers/thermal/qoriq_thermal.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/rockchip_thermal.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/qoriq_thermal.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/thermal/tegra/tegra-soctherm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/class/cdc-acm.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_serial.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/u_ether.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_acm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ecm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_eem.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ecm_sub=
set.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_fs.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_mass_st=
orage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_ncm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_obex.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_rndis.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/function/usb_f_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/libcomposite.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/tegra-xudc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/gadget/udc/renesas_usb3.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/host/xhci-pci-renesas.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/drivers/usb/host/xhci-pci.koaarch64-linux-gnu-strip: warning: /tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/=
usb/serial/cp210x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/ftdi_sio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/renesas_usbhs/renesas_usbhs.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/option.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/usbserial.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/hd3ss3220.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/serial/usb_wwan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/fusb302.ko: unsupp=
orted GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: 5) type: 0x/tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/u=
sb/typec/tcpm/tcpci.koc0000000: unsupported GNU_PROPERTY_TYPE (5) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/tipd/tps6598x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/usb/typec/typec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/video/backlight/lp855x_bl.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/video/backlight/pwm_bl.koaarch64-=
linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0=
-next-20210830/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/watchdog/meson_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build=
/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/qcom-wd=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/watchdog/meson_gxbb_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/drivers/watchdog/s=
l28cpld_wdt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/drivers/watchdog/sunxi_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/lib/crypto/libar=
c4.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libchacha.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crc-ccitt.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/overlayfs/overlay.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/fs/fuse/fuse.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libcurve25519-generic.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libdes.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/fs/fuse/cuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libsha256.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/crypto/libsm4.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/libcrc32c.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/lib/raid6/raid6_pq.ko: unsupported GNU_PR=
OPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/fs/btrfs/btrfs.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/garp.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/lib/zstd/zstd_compress.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/802/p8022.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/psnap.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/802/stp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/8021q/8021q.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/bluetooth/hidp/hidp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/net/ipv4/ip_tunnel.ko
    /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
net/can/can-bcm.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210830/kernel/net/bluetooth/bluetooth.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000warning: /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/can/can-gw=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can-raw.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/can/can.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/dsa_core.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/dsa/tag_ocelot_8021q.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/ip_tunnel.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/bridge/bridge.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ip_tables.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/ipv4/netfilter/iptable_filter.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_mangle.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/iptable_nat.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/tunnel4.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6_tables.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_mangle.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_filter.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/ip6table_nat.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/ipv6.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/llc/llc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/ipv6/sit.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/nf_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf=
_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/netfil=
ter/xt_MASQUERADE.ko
    aarch64-linux-gnu-strip: warning: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210830/kernel/net/netfilter/nf_log_syslog.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_CHECKSUM.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_LOG.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/netfilter/xt_MASQUERADE.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_nat.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_addrtype.ko: unsupported=
 GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210830/kernel/net/qrtr/ns.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/mac80211/mac80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/netfilter/xt_tcpudp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/ns.ko  STRIP   /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-smd.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/nfc/nci/nci.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/nfc/nfc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210830/kernel/net/qrtr/qrtr-tun.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/qrtr/qrtr.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/rfkill/rfkill.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_gact.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_gate.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/act_mirred.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/cls_basic.ko  INSTALL /tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/net/sched/sch=
_cbs.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/cls_flower.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210830/kernel/net/sched/sch_etf.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_cbs.ko: unsupported GNU_PRO=
PERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210830/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_etf.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_mqprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_ingress.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/net/sched/sch_taprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/hda/snd-hda-core.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/pci/hda/snd-hda-codec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/pci/hda/sn=
d-hda-tegra.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/net/wireless/cfg80211.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-ak4613.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-dmic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-da7219.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7134.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-cros-ec-codec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-es7241.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-gtm601.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-hdmi-codec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-va-macro.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-lpass-wsa-macro.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-max98357a.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/codecs/snd-soc-max98927.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-analog.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-msm8916-digital.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci=
/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/co=
decs/snd-soc-pcm3168a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rl6231.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514-spi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5645.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5659.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5663=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-rt5663.ko  STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/s=
ound/soc/codecs/snd-soc-spdif-rx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-simple-mux.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/s=
oc/codecs/snd-soc-tas571x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8962=
.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/codecs=
/snd-soc-wm8960.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8962.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wm8994.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/fsl/sn=
d-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/generic/snd-soc-simple-card-uti=
ls.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/generic/snd-soc-audio-graph-card.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/generic/snd-soc-simple-card.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-frddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-fifo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-pdm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-spdifin=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-sound-c=
ard.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-spdifou=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-for=
matter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-int=
erface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmin.k=
oaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-tdmout.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-axg-toddr.k=
o: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0xc0000=
000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021083=
0/kernel/sound/soc/meson/snd-soc-meson-card-utils.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-gx-sound-c=
ard.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-codec-glue.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g12a-toacod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-g=
x-sound-card.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-gx-sound-ca=
rd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/meson/snd-soc-meson-t9015.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsupport=
ed GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-ap=
q8016.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/qdsp6/q6routing.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-apq8096.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko  STRI=
P   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/=
sound/soc/qcom/snd-soc-lpass-platform.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-qcom-common.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/qcom/snd-soc-sm8250.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rk3399-gru-sou=
nd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-i2s.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/rockchip/snd-soc-rockchip-pcm.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/rockch=
ip/snd-soc-rockchip-spdif.kowarning: : unsupported GNU_PROPERTY_TYPE (5/tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/so=
c/rockchip/snd-soc-rockchip-rt5645.ko) type: 0x: unsupported GNU_PROPERTY_T=
YPE (c00000005) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupport=
ed GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-so=
c-tegra-audio-graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra186-dspk.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-admaif.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-ahub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-dmic.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210830/kernel/sound/soc/tegra/snd-soc-tegra210-i2s.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 43 errors, 34 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 46 errors, 39 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 wa=
rnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 40 errors, 34 warnin=
gs, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 20 warnings, 0=
 section mismatches

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 3=
 errors, 5 warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 3 errors, 5 warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 3 errors, 5 =
warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 46 errors, 39 war=
nings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 7 warnings, 0 section =
mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_devices=
=E2=80=99 defined but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9842949672=
95=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-larger-tha=
n=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

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
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 7 warnings, 0 sectio=
n mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 43 errors, 34 wa=
rnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 4=
3 errors, 34 warnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    block/mq-deadline.c:274:12: warning: =E2=80=98dd_queued=E2=80=99 define=
d but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---
For more info write to <info@kernelci.org>
