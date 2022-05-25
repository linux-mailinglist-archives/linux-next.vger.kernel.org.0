Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D8853389C
	for <lists+linux-next@lfdr.de>; Wed, 25 May 2022 10:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiEYIhd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 May 2022 04:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiEYIhc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 May 2022 04:37:32 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A2F1ADBD
        for <linux-next@vger.kernel.org>; Wed, 25 May 2022 01:37:30 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id fw21-20020a17090b129500b001df9f62edd6so3636608pjb.0
        for <linux-next@vger.kernel.org>; Wed, 25 May 2022 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gWDOGXPPqAtRmRVUN24CmZl3zbD8OyVyUEJ1L5O8+Wc=;
        b=m9B30uvHMbfy72Dy2O6V79PUAEkD3xVSu7NjBwhWA04NhRNDFXc9AFvoYc5SenCDK9
         qv0NTI5DwsaGVM8aRb7FkZlifDeOLm//R3CFr+QsFot3Fcfp1/PLNPxfgN+UPjtZ/1Le
         hNml7eRdcvC7kBu6WQRxPCCr9nhA89dA+bRn+EIKf+JvUqE2q137wIYKc8GJeloj56QX
         b9AgtOYPjI/3PC7TrwRJDmD7RBSTQzKBPFyuhZTBuA9CnemZbEBzMkfB7XCKtuVrRnN2
         zOB5LqcoN0ceUtx9zcd23bWWoEjozi/M24dbe9ppLhyiqY2zYm1B0RXAojzwg5CNlIw9
         d9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gWDOGXPPqAtRmRVUN24CmZl3zbD8OyVyUEJ1L5O8+Wc=;
        b=Y7p6s902nTMoE0T3w3S46LCtn2XaaT6gOOjGGCYRpFHqC3LA74equxLUOU1uxWcoA6
         rpYBooHCW9c65WqgBpttFlcNuWVafBrktW8PXOov3KO5i4XqYuq55DP9ZM9jzyCNOfWQ
         z1p09BqTRyd+UA+6a/UG9V4z981np4jdpRPyA7v60bxfxIcnXAl+ug8akOnCDoQZKLWh
         iL1V1M+iG1Fs4/I/4/a6wQuXetUa9o5cB3ENSPltbzbGY2gZhyPLENtMelZ0yEzlyJsW
         Br7s8xvhzwzqDZe4WM376LdgQh0NTiTmQ4nR6Z8h64v7j7qjtg16qm7Kzx2siAkMI6r+
         kBZg==
X-Gm-Message-State: AOAM532dcFgpCXzakJSIbo9mFGQQWP1psfTqsiRNPs9GN+LZmmmAx7Uc
        RDxfVBe+ycgzQhI1N/EMJleSV+k2zbsBrFpTbyE=
X-Google-Smtp-Source: ABdhPJwqG1hCTQfDWHxFxDahZpclvenN5kEpESG6lbEUSyeIGJw5wirfjdffIOZEer58H7DmBIa3Og==
X-Received: by 2002:a17:90b:3142:b0:1df:77f2:e169 with SMTP id ip2-20020a17090b314200b001df77f2e169mr8995007pjb.245.1653467850098;
        Wed, 25 May 2022 01:37:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902bb8800b0015e8d4eb1dfsm8641375pls.41.2022.05.25.01.37.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 01:37:29 -0700 (PDT)
Message-ID: <628deac9.1c69fb81.2b645.4d74@mx.google.com>
Date:   Wed, 25 May 2022 01:37:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220525
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 13 builds: 1 failed, 12 passed, 1 error,
 13 warnings (next-20220525)
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

next/master build: 13 builds: 1 failed, 12 passed, 1 error, 13 warnings (ne=
xt-20220525)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220525/

Tree: next
Branch: master
Git Describe: next-20220525
Git Commit: 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning

Errors summary:

    1    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting=
_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]

Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the var=
iable 'setting_reg2' to silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    drivers/misc/cardreader/rts5261.c:406:13: error: variable 'setting_reg2=
' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometim=
es-uninitialized]

Warnings:
    drivers/misc/cardreader/rts5261.c:364:32: note: initialize the variable=
 'setting_reg2' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
