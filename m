Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32E3518327
	for <lists+linux-next@lfdr.de>; Tue,  3 May 2022 13:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiECLWU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 May 2022 07:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234455AbiECLWS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2022 07:22:18 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C12E2B182
        for <linux-next@vger.kernel.org>; Tue,  3 May 2022 04:18:45 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id h12so14648988plf.12
        for <linux-next@vger.kernel.org>; Tue, 03 May 2022 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JAOKaeHhmTIbsWFL3eyHKt1v5gMa/DzMXtgKOC6T444=;
        b=qMTNXcbA4rP3do96k4xR634I9A7Tkht8WPOY7yi2PY510VlbMg4cCUlOUymqU1ykT+
         AV6cGIoJ2K+8rLz+A5c1k4qGOxtFxhb289OU++pf9aQSKhHgGFIE+njk98mtrIFPFZF5
         RZkBM3JXsmV4DizlvZRvWHFv/+Y7x+NpRa0trZrOh6SdGdAxQsXauVq/VhyUplx43Wx7
         64t8UIrNX3slTAdqX74Q/XtIE1tWGooRIShte19j1wd3bPIIVd14ZrMv/xCZGmfKI37d
         /LrDV3+Y1my81i2f5F8Cu9lh72XCMpn3ZpzRYim88rHis71iL90/2K8tpujL4gtszFRy
         PIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JAOKaeHhmTIbsWFL3eyHKt1v5gMa/DzMXtgKOC6T444=;
        b=UsQer2vE3cDKyWspN/4LONu/Adss4q0VdLHfVOwJaB1JjBfOjRKAZ8Mv70J1sfGc8u
         ttoKjM9OAF80DFz5O/sXKNTs7fLgkdEOxrlOmgJbKdgAjlHZJzjcyd7sX73V6udfTZJw
         XRVauOyVhnka46i2fTcWvyA+JmQHD9qk1p/KLYmT1bSNzSVqBQNaUW6AyKsmd1uDOtM7
         V9QMOlt2N1tCB3A06wRdNqTGU3wW/4tvgsDkEhjstxzuitgYCe5uJsFu5PDgT2SAlTqn
         aIN+CaR1fP1r+fsirf8lJcLTJCwv7lNx3wA2xTyBvisEz0IgbNE0S4UKFSYsGTYNSb4E
         zTiw==
X-Gm-Message-State: AOAM531fMlq+eXw+g0LxXowjzFdvIp8Xz+C+R4cUfZlPM2lfeskePtMT
        VnPvMPG4FE9usSAK06sIWxK1WXiXnq1MNUVMuLQ=
X-Google-Smtp-Source: ABdhPJxdSnB8GJCaa1eZbhDi1rGjdSsOj/ZJW2PAAuKpfMIhlWvJtfzC5LeSY5n1DmM6v1xPw17Fog==
X-Received: by 2002:a17:902:f54a:b0:15e:a95a:c0a7 with SMTP id h10-20020a170902f54a00b0015ea95ac0a7mr7839850plf.134.1651576724421;
        Tue, 03 May 2022 04:18:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w10-20020a1709027b8a00b0015e8d4eb1dbsm6113535pll.37.2022.05.03.04.18.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 04:18:44 -0700 (PDT)
Message-ID: <62710f94.1c69fb81.5122a.f0a7@mx.google.com>
Date:   Tue, 03 May 2022 04:18:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220503
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 13 failed, 1 passed, 25 errors,
 38 warnings (next-20220503)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 14 builds: 13 failed, 1 passed, 25 errors, 38 warnings (=
next-20220503)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220503/

Tree: next
Branch: master
Git Describe: next-20220503
Git Commit: 44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

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
2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 2 errors, 2 warnings
    defconfig+arm64-chromebook (clang-13): 3 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 2 =
errors, 7 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 2 errors, 7 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 2 errors, 2 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 2 errors, 2 warnings
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    13   mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized w=
henever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    12   mm/shmem.c:2337:8: error: variable 'page' is uninitialized when us=
ed here [-Werror,-Wuninitialized]

Warnings summary:

    14   mm/shmem.c:1685:21: note: initialize the variable 'folio' to silen=
ce this warning
    12   mm/shmem.c:2318:19: note: initialize the variable 'page' to silenc=
e this warning
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatch=
es

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section misma=
tches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section misma=
tches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mis=
matches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning
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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section m=
ismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section mismatc=
hes

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning

---
For more info write to <info@kernelci.org>
