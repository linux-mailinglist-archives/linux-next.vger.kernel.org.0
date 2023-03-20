Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5B86C0A43
	for <lists+linux-next@lfdr.de>; Mon, 20 Mar 2023 06:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjCTFym (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Mar 2023 01:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjCTFyl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Mar 2023 01:54:41 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DAD2272C
        for <linux-next@vger.kernel.org>; Sun, 19 Mar 2023 22:54:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso11198946pjb.3
        for <linux-next@vger.kernel.org>; Sun, 19 Mar 2023 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679291674;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5q3CVe+3dCNs9n/RaLSgedGYgvnz1GYadUZinT7ArU=;
        b=tEEI5oliNTGcQHRbQnE5WvasjKWQRTVuxno06bXmo6QYUpqn3exap84YKWCfJ6oUuw
         +l00ZiAQWulmvfCpms4xYNqvNkOlG0eTx+m9ackvwTMm6vKU+6k3qBsK3J32S9HNqiIn
         LoK6PAyQhpoZmz59pQjVM3tiR5dDaVsjQZy3rGWFQuxnYmVgQGbi2obiaitNbLm7H3Zx
         lzOnv4wJR2v+UFlnOsew/ngxtCpM2R8+d4OJIAD7WYvwb4xAIU0rWmn1Ufs9ubgnRprR
         THZBCBcE9N9wb/YgQratCGAOEz5fkeZtz4ePBBzgUoJTwP0nL2AYAReXXokc3n6Q4T47
         +MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679291674;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5q3CVe+3dCNs9n/RaLSgedGYgvnz1GYadUZinT7ArU=;
        b=LNpuEsY1aF32zpeQIxbdAkyUt2Bm/EqpeV6qT4Oie9q3p+sBOBQB0g5TvIt+K+xikg
         OHrgcgOGaxjBFMDMbAhUxLkSiCR41RCY/SEIoWNaFLd6F3zWGKEKuWYWj2zqb82kNB/N
         gVaE7KKJjTHWHMiRYjffpGNjHIOH9jiWNKLcEEXsGQs5N/Xo/XlqMoL5Wxxz87f3oifv
         0MHUP4ZNWVKgM6lVk7Hl9Uzquy4wl0o3cesgr/HcxLpHJTNX+0524zP4x5SJsZQj0Iij
         q2yj/lTw9JEsTKj1Sr1LVw7ykNTzB+pWadnVxGb8oTg9NzB3/RFXom8mBykX1BL3P9Of
         m/MQ==
X-Gm-Message-State: AO0yUKXg77xTfomSXmuo2p09MppnfxIMgAnxU9u/T7ttY/t59sQN9rM/
        H50VjNHIu/C9Btoc+E3i22tG87Fc7skTf1cQ+QRmEA==
X-Google-Smtp-Source: AK7set9nH6Ea7zwIDglixXwttJg7CDnFOgOEnb7DZ5d+yo5AgVPJc4JyHUoXJ/gBZT/PqyF8D8TpPQ==
X-Received: by 2002:a17:902:d4ca:b0:1a1:cc60:73ec with SMTP id o10-20020a170902d4ca00b001a1cc6073ecmr3959220plg.38.1679291673679;
        Sun, 19 Mar 2023 22:54:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902900300b001a060007fcbsm5673532plp.213.2023.03.19.22.54.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:54:33 -0700 (PDT)
Message-ID: <6417f519.170a0220.28eaa.98cc@mx.google.com>
Date:   Sun, 19 Mar 2023 22:54:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230320
X-Kernelci-Report-Type: build
Subject: next/master build: 194 builds: 11 failed, 183 passed, 114 errors,
 25 warnings (next-20230320)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 194 builds: 11 failed, 183 passed, 114 errors, 25 warnin=
gs (next-20230320)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230320/

Tree: next
Branch: master
Git Describe: next-20230320
Git Commit: 73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    aspeed_g5_defconfig: (clang-17) FAIL
    aspeed_g4_defconfig: (gcc-10) FAIL
    aspeed_g5_defconfig: (gcc-10) FAIL
    imxrt_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-17): 1 error, 1 warning

arm:
    allmodconfig (clang-17): 1 error, 1 warning
    aspeed_g4_defconfig (gcc-10): 28 errors, 1 warning
    aspeed_g5_defconfig (gcc-10): 28 errors, 1 warning
    aspeed_g5_defconfig (clang-17): 20 errors, 2 warnings
    imxrt_defconfig (gcc-10): 28 errors, 1 warning
    mps2_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 1 error, 1 warning

mips:
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    x86_64_defconfig+kselftest (rustc-1.62): 3 warnings

Errors summary:

    63   include/linux/rculist.h:393:27: error: invalid use of undefined ty=
pe =E2=80=98struct module=E2=80=99
    16   kernel/bpf/../module/internal.h:205:2: error: incomplete definitio=
n of type 'struct module'
    6    include/linux/stddef.h:16:32: error: invalid use of undefined type=
 =E2=80=98struct module=E2=80=99
    6    include/linux/container_of.h:20:47: error: invalid use of undefine=
d type =E2=80=98struct module=E2=80=99
    6    ./../include/linux/compiler_types.h:338:27: error: expression in s=
tatic assertion is not an integer
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    include/linux/rculist.h:392:7: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    3    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variab=
le 'possible_crtcs' is used uninitialized whenever 'if' condition is false =
[-Werror,-Wsometimes-uninitialized]
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    kernel/bpf/../module/internal.h:205:2: error: operand of type 'voi=
d' where arithmetic or pointer type is required
    1    kernel/bpf/../module/internal.h:205:2: error: offsetof of incomple=
te type 'typeof (*mod)' (aka 'struct module')
    1    kernel/bpf/../module/internal.h:205:2: error: assigning to 'struct=
 module *' from incompatible type 'void'
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    3    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_=
mem_type=E2=80=99 declared inside parameter list will not be visible outsid=
e of this definition or declaration
    3    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initia=
lize the variable 'possible_crtcs' to silence this warning
    2    WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: .text+0x140866
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: .text+0x1409db
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    kernel/bpf/../module/internal.h:94:58: warning: declaration of 'en=
um mod_mem_type' will not be visible outside of this function [-Wvisibility]
    1    1 warning and 20 errors generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error: variable 'p=
ossible_crtcs' is used uninitialized whenever 'if' condition is false [-Wer=
ror,-Wsometimes-uninitialized]

Warnings:
    drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2304:21: note: initialize =
the variable 'possible_crtcs' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 s=
ection mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 s=
ection mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 FAIL, 20 errors, 2 warnings, =
0 section mismatches

Errors:
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: offsetof of incomplete ty=
pe 'typeof (*mod)' (aka 'struct module')
    kernel/bpf/../module/internal.h:205:2: error: assigning to 'struct modu=
le *' from incompatible type 'void'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: operand of type 'void' wh=
ere arithmetic or pointer type is required
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    kernel/bpf/../module/internal.h:205:2: error: incomplete definition of =
type 'struct module'
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: declaration of 'enum mo=
d_mem_type' will not be visible outside of this function [-Wvisibility]
    1 warning and 20 errors generated.

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
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

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
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 FAIL, 28 errors, 1 warning, 0 secti=
on mismatches

Errors:
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:392:7: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/container_of.h:20:47: error: invalid use of undefined typ=
e =E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    include/linux/rculist.h:393:27: error: invalid use of undefined type =
=E2=80=98struct module=E2=80=99
    ./../include/linux/compiler_types.h:338:27: error: expression in static=
 assertion is not an integer
    include/linux/stddef.h:16:32: error: invalid use of undefined type =E2=
=80=98struct module=E2=80=99

Warnings:
    kernel/bpf/../module/internal.h:94:58: warning: =E2=80=98enum mod_mem_t=
ype=E2=80=99 declared inside parameter list will not be visible outside of =
this definition or declaration

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

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
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5
    WARNING: unmet direct dependencies detected for RPCSEC_GSS_KRB5

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: .text+0x1409db
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !END=
BR: .text+0x140866
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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

---
For more info write to <info@kernelci.org>
