Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E956C5DD2
	for <lists+linux-next@lfdr.de>; Thu, 23 Mar 2023 05:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjCWENC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Mar 2023 00:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjCWENB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2023 00:13:01 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658E835BE
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 21:12:59 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso2710140pjf.0
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 21:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679544778;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E6kdgdsJazUM5sci8JahR0dUzXBqTqFNtmta29tfieM=;
        b=yWXaa8uW1tGPjiQ9r72u3+G37zIv0sx6UBdDw2hCHiGwM1zhTiWT/lTd9+k6wueBwc
         XGE48/RmLstAJa8o9FX7Bd3Ukk4x0RnS1sYjQDF0UMKFpzSR1dp35ghUZ4RWK8ium6rL
         6eBYeRbl+AcGsOHtFN0YnaWRMUY0V38xmkRepVq6JzUNDRvQkNK1DjvhJ8D4TvACgZUR
         8+ujljcsD34LTVE7w9g5SoaaHPxu0NsafVUIwMan/uKOeM0hGqvi7sY0zQ4ODXWjE4B6
         /90UtLv/OrKD2KiDwantEYOwGyYivSsHL+RqS8g0xphpATbzVoxuiK6v3QXL7cXUFVUc
         NmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679544778;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6kdgdsJazUM5sci8JahR0dUzXBqTqFNtmta29tfieM=;
        b=P2jdIHuFU1NLV3tuj7AJWL+56+u5TnzQQtURSJ3/QZuo6WH0x3vLleuWfCqUJf06Q5
         xeL79RyfmTNO0p0e/cylcZzfxZWBQQTvsxgh5b9qNDMhNMQOvRbV7OdFJ6fNQP70i5GP
         4fxXufshuvMS4bbKBVIsYwawh7in5Xn/jjV1o4m6bI0ksjKGoh1BpUeMh+R1PAWJFyIa
         NgNBk4DdIXbSQfuBdG27Ok2d6Ujy/VFikLYTymA5VqGhn97lueXZ640q/Am+GHxqEcL0
         N+nO3FXiBtAwurvrNtyg4/q1ctFbOahsX3IkwLEevrjAW88AkDJnC69HSS/ETccByutE
         t7FA==
X-Gm-Message-State: AAQBX9cwWftDQdxaqF0em846nSDrZrOZJud9ICBqBBgVrNLGfK/N99x/
        jJsdH0xOaGnFo4coiFLTKXVAe3b/Ao3BTc8SRDBiTw==
X-Google-Smtp-Source: AKy350b28poxgbVAYM7es2L+UZ70VsshNX9/rEEB3+Q81cI7N8WyqMIteyqBFdP3bZPbU2F3VHXO/A==
X-Received: by 2002:a17:903:228f:b0:1a1:9787:507d with SMTP id b15-20020a170903228f00b001a19787507dmr4837785plh.3.1679544778297;
        Wed, 22 Mar 2023 21:12:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001993a1fce7bsm11315165pli.196.2023.03.22.21.12.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 21:12:57 -0700 (PDT)
Message-ID: <641bd1c9.170a0220.e516c.4a5a@mx.google.com>
Date:   Wed, 22 Mar 2023 21:12:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230323
Subject: next/master build: 18 builds: 13 failed, 5 passed, 14 errors,
 23 warnings (next-20230323)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 18 builds: 13 failed, 5 passed, 14 errors, 23 warnings (=
next-20230323)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230323/

Tree: next
Branch: master
Git Describe: next-20230323
Git Commit: 7c4a254d78f89546d0e74a40617ef24c6151c8d1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL
    x86_64_defconfig+x86-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 7 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 1 warning
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 1 warning

mips:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc64_defconfig+kselftest (gcc-10): 1 error, 2 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error, 1 warning
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    13   mm/mmap.c:939:11: error: variable 'next' is used uninitialized whe=
never 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings summary:

    14   mm/mmap.c:912:36: note: initialize the variable 'next' to silence =
this warning
    1    mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitial=
ized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitial=
ized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to s=
ilence this warning
    1    mm/mmap.c:939:11: warning: variable 'next' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    1    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    2 warnings generated.
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section misma=
tches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 7 wa=
rnings, 0 section mismatches

Warnings:
    mm/mmap.c:939:11: warning: variable 'next' is used uninitialized whenev=
er 'if' condition is false [-Wsometimes-uninitialized]
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning
    1 warning generated.
    mm/vmalloc.c:3543:6: warning: variable 'remains' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/vmalloc.c:3539:6: warning: variable 'remains' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
    mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to silenc=
e this warning
    2 warnings generated.

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 FAIL, 1 error, 2 warn=
ings, 0 section mismatches

Errors:
    arch/sparc/include/asm/percpu_64.h:19:25: error: =E2=80=98__local_per_c=
pu_offset=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98per_cpu_offset=E2=80=99?

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/include/asm/current.h:18:30: warning: call-clobbered registe=
r used for global register variable

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    mm/mmap.c:939:11: error: variable 'next' is used uninitialized whenever=
 'if' condition is false [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/mmap.c:912:36: note: initialize the variable 'next' to silence this =
warning

---
For more info write to <info@kernelci.org>
