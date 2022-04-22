Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D0B50B42D
	for <lists+linux-next@lfdr.de>; Fri, 22 Apr 2022 11:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357063AbiDVJjG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Apr 2022 05:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445907AbiDVJjE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2022 05:39:04 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C46D1CFCD
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 02:36:11 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id l127so7481305pfl.6
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2022 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6yy0qRwtEmmS9JnCFg1N5H+x2LYK24zklTWONxIg2m0=;
        b=6xMbD81gR1cwr5oVrwxZvNWwOuOGsFcsUwVeL4zihVhv6NOwMmatDsvpNAA2c5YGcT
         EVIOTiu77C2Qjhc+n5Q+079MvhCmlhtJ+KT7wAh9b/N5ELfXfX1AZUckj4BgeflRDc5u
         oG5GEDklIa3hl9wrXPWV+RpbFl2bJz5ug2Y3LfzpA3tulC5W3AxOQ58cpOBKzNvGUrQJ
         Mq7PJ+MAjPUvx3SUJm800pAQ+/jKkw0s1jZ0x85x5ccu3Yl15Uv8e3+hpGj3RTLcsSv5
         ME9yUjGW5eVYmzOESQe4mBnWS71k0c+4uQyl+Asxkwddg0i7WEL/cquJ5CJV5NAr5/2P
         dR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6yy0qRwtEmmS9JnCFg1N5H+x2LYK24zklTWONxIg2m0=;
        b=aL7BXCUM+qfhhprt3xxJewtnu3RxtYSQekaTS/0RjJy9bLVzP+r8ze1wtoIHhXN+7K
         xPOhr6dVwr/NFeQKOJqIGqZupthauMJm9+viigmXQ18uO2G5Mr2DDA/Plbgz25XC8Ei+
         d+209v/3EcIEqer3ddcxyYuLff7Ysp+4g5ctSJcm8oK8yeVMVsmo+e2i3JoQXnpxxN/T
         gg983WXI6zIdaHM/VyUO9RXEp/f+ktOfHzPazs0s5VSU1b+nJREgQOo8wn/B0jMK1JjO
         dh/e3mstiygBO5EKYeIDI+413sNUQhXOTBfEB/1h7HTBAzmn+hO8PyuZsS/UxRQDMYtm
         DcWg==
X-Gm-Message-State: AOAM533F+eb2mhINjKObxnjBQtqrzvw/frrj3xyCRQu8s86juXy5M9Dp
        49HrTO1XvDtcoCzjSrQY6IcHfSqxXms+iDqQa9c=
X-Google-Smtp-Source: ABdhPJw6RXlpauxjOVDczQitFZ8FztvPfPmEeMtWTmZIsExffJnxM9blZjm02Ldxbb/gNx13ze/IbA==
X-Received: by 2002:a62:ab10:0:b0:50a:c9dd:c142 with SMTP id p16-20020a62ab10000000b0050ac9ddc142mr4060024pff.19.1650620170688;
        Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090a890a00b001cb14240c4csm4295674pjn.1.2022.04.22.02.36.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Message-ID: <6262770a.1c69fb81.bc24e.baae@mx.google.com>
Date:   Fri, 22 Apr 2022 02:36:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220422
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20220422)
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

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202204=
22)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220422/

Tree: next
Branch: master
Git Describe: next-20220422
Git Commit: e7d6987e09a328d4a949701db40ef63fbb970670
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
