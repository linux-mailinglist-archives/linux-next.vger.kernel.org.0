Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DB357B83E
	for <lists+linux-next@lfdr.de>; Wed, 20 Jul 2022 16:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236952AbiGTOMI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jul 2022 10:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiGTOMH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2022 10:12:07 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8965F4D148
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 07:12:06 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id b133so12811404pfb.6
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QpZZx7ydIJqtbmjO1/Eh9nIb8LaVqKd2orn8z+o2Ufk=;
        b=7j2uHOO5NVi+/+OzLdc6B8+JFhNJt9T7r23DxtIAStGP1AWTqQ6EFEBX1XpdRb3Syi
         As8TUooPuPr06lHRT5ew4YBCtTZd/S5TgFP642F11hYYcuFXsVSG9DUaxYR5pwfZ0f5m
         dtHcCE3LcyjyJTCYEFgVQA+8w8UnVAGULvSB/v3dZmo3szDWWDLerr/nYtKplIArA22H
         Bx64/PtjXsqG2FKwvTmcICR8JMmJ1lfc0Wo7Z4v7hBA4jlx38RyfPvDWwJxI8A5NDtZ6
         jE2WroEdAL9m78nYoA9KE1F/y2YKRrMslSOr8TQa0HxIJmv9l3umAuoWsc5otTlnjlue
         FsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QpZZx7ydIJqtbmjO1/Eh9nIb8LaVqKd2orn8z+o2Ufk=;
        b=kzZotV9CFrMBLwcxpECqqa5jErR2+he3OfOisW/mLW0HLYNLyUsg01swmAvX5y+jI1
         wMP+8npz9xP3FYHs74gnySBUP5nG4K8uuQ8leH8FcH9eBMfm40XEsrGlqf0XwdbjSTXe
         Wfxig+UmtvR0Tb5daB3s5Zh6StYeFwpuLWQ0ilQ8GOt0oW92GDrCjzZlxryNDorhCzAW
         XwCG5E2LLy8l4MOqvi09zxeOgqk4QdUKhTdB4kkQPsEUbqS4L70wi7FlDm6q5lApJOKT
         ntt8JkpksW6mf/MRX1bQG9jqK/HsbzeklRlG8Hv4RpYkT0uZQkN909g5vvM08tHWmSfv
         wPeQ==
X-Gm-Message-State: AJIora8QSo8s/GMOkkVWTopdPp5QU37yJtfVreM7Y9O0n41OhlxQLWXL
        DUkXCfrWqAY1BKPubPqFUCRMCoKURopcUpsIJb0=
X-Google-Smtp-Source: AGRyM1sNgKmEmJR4JVTWr0BHLTOy4HTDcj2IVYp7mzmJ85sifwdyOQ2fcFEkWX/SnlAjG0NG1KooPg==
X-Received: by 2002:a63:551:0:b0:419:9286:56 with SMTP id 78-20020a630551000000b0041992860056mr32348993pgf.267.1658326325683;
        Wed, 20 Jul 2022 07:12:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a678400b001ef7fd7954esm1725489pjj.20.2022.07.20.07.12.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:12:05 -0700 (PDT)
Message-ID: <62d80d35.1c69fb81.79ffe.27b3@mx.google.com>
Date:   Wed, 20 Jul 2022 07:12:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220720
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 10 warnings (next-20220720)
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

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 10 warnings (n=
ext-20220720)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220720/

Tree: next
Branch: master
Git Describe: next-20220720
Git Commit: 4ee7eaa411ee24d07fa83d97ca03fa6725c40d04
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:

Errors summary:

    2    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
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
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1104) exceeds limit =
(1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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
