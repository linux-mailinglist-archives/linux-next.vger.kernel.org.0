Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707866109AD
	for <lists+linux-next@lfdr.de>; Fri, 28 Oct 2022 07:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJ1FTi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Oct 2022 01:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiJ1FTh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Oct 2022 01:19:37 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C662679
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 22:19:35 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso8911923pjc.0
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 22:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wp93rgIQd3mRpY4ucT9mEzzX0qmMzoKDPYoatjMvYKs=;
        b=QX5zAnZOilxMOaz3ksD7tX6YsVc94ASoOiX8KWM8Rag2AV7sVtQv/pRoueRE4Rc9UZ
         BVap9dwcTv/VbRe5N+ZUm09ZTVY0e51Iwiih+ukJTBUhomcMDoQFB+r7I1f3VzAq8TFY
         dYIme3fm/PX9j6a1USt6k+Gu3z5JOw+tajgRSOAZMau66JXQYLeEv3D2UwRMjPlPjz8d
         snpH6N5m11jhGzRYKn51f0KuYFrrmgZAjCZV6sF5/SvR3muSZvteoKicAgTwAS7u0Bjg
         LI2xUA7xOt8znDpXdA8WMoze+4jFe2MM6BONSnVgLUFPn6+mmaN+vmxiuEyLG2Sd4sS3
         GHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp93rgIQd3mRpY4ucT9mEzzX0qmMzoKDPYoatjMvYKs=;
        b=JHAJRJxpg5aaDEGUKaaPyy5YRC1mylL+sUx9xt5alFjrLgKCIbJIlDd4cn8rxM7jjJ
         pVDa76NKBD6MoilniGvA5EN/kQcgojhyiOZUqF46AkdUBDkORR1v/6+pIaaQsh7yDjq7
         VerBy3G9/DcESGuRb3i9MfdS8SH2Pv1Y6/5VR6k7lpKlFpjAdDwR+5WQVpJuT9gvOAA2
         8SS378Ra4d2nM/geMyLR2CgsMPQl6zejje+pIb0oCPREAvlpiUPBz2gdCHq1l/ufvxcm
         uomqDN76CcgS1PS6r8nROueqq2UPGPyfJRxahl8R7BglVEn+TzPajdiBsIjL2MCZho13
         0pMg==
X-Gm-Message-State: ACrzQf36o+Yq1Oqa8X9v0cr9Iy6OXQWawBMu5ycob1SoAdwTR5TTOZNh
        mJEBvjcnfOQwjubgKHVO5c5hQ8Hdlp8QXiIN
X-Google-Smtp-Source: AMsMyM7rJ0I7ZCMdEVu1sG1/c5k3AvBpK7MHxuZg64wuU696gKbiJXcSKsru0h7RhsdqN4iFz6WRSA==
X-Received: by 2002:a17:90a:c09:b0:20d:7820:2e60 with SMTP id 9-20020a17090a0c0900b0020d78202e60mr13561479pjs.180.1666934374886;
        Thu, 27 Oct 2022 22:19:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s5-20020a63d045000000b00460fbe0d75esm1905526pgi.31.2022.10.27.22.19.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 22:19:34 -0700 (PDT)
Message-ID: <635b6666.630a0220.4c26a.40f3@mx.google.com>
Date:   Thu, 27 Oct 2022 22:19:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221028
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed, 3 errors,
 12 warnings (next-20221028)
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

next/master build: 14 builds: 0 failed, 14 passed, 3 errors, 12 warnings (n=
ext-20221028)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221028/

Tree: next
Branch: master
Git Describe: next-20221028
Git Commit: fd8dab197cca2746e1fcd399a218eec5164726d4
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    pxa_defconfig (gcc-10): 3 errors

x86_64:


Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

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
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/mach-pxa/spitz.c:410:11: error: =E2=80=98EV_PWR=E2=80=99 undec=
lared here (not in a function)
    arch/arm/mach-pxa/spitz.c:411:11: error: =E2=80=98KEY_SUSPEND=E2=80=99 =
undeclared here (not in a function); did you mean =E2=80=98LED_SUSPENDED=E2=
=80=99?
    arch/arm/mach-pxa/spitz.c:418:11: error: =E2=80=98EV_SW=E2=80=99 undecl=
ared here (not in a function)

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
