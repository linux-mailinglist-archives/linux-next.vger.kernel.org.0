Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D6D576C0C
	for <lists+linux-next@lfdr.de>; Sat, 16 Jul 2022 07:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiGPFdz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 16 Jul 2022 01:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGPFdy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 16 Jul 2022 01:33:54 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB508AE49
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id v7so6340059pfb.0
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WoeyufOymv3rDh4ZpxmLjUwGCbuTEOO2c7PjryyNoG0=;
        b=XvxKrj5ahTyUlG2AXoqEpeacf1YEv4dxQorf9lIA2AZwmTr/WqVi8TyREbzChzp/xL
         TBQe9jWaFbbcSWGkS0NfaHQ8/DWlKD6mQAYEEvQIEgBBtakf11p7hOZRKFmJKK5O1M48
         x6BwH2NCM8ah9znoLA4C74tuoAky+LTee9DRGry8pAc38vw6xGm6JAZm69GqddLORTew
         FNDrKZhGIoNVkp+FJLeZ9sa6ykcw1E+qsdE+QQeiPdwTFm3PzbM3VE4bIgRgjUeRnOpd
         7Bnbmev6bWie2S9ijgVuKmAdkExAFlytt9AesyQVERBK4eliissSPOH/xlMfhGgoOIYv
         lIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WoeyufOymv3rDh4ZpxmLjUwGCbuTEOO2c7PjryyNoG0=;
        b=y7nqOONOy3BDABKSd1xzfv7pmyR6RcX3COp73ZB6C/upWQIblzbmFZTAVoys2hZWny
         L5r1Lf5qJUndPJKY+u/XLMVFD8ZVtJazVB060NMvkDV2/BGtYCpT1OczbKBpWEr7q0re
         gFtubQBeocA9/vwrAW/qEunznH0IpSK7ITID4T8JHqptrTCkjz1WMlTDQToP2IciTs5y
         ux0GBxAcLk+KLRjSHACZaluywoXVXjkcwnmcNiw3cpcb7z8Hzh1VNNNokBSrr+g6pUqV
         yIpmu0bWaJsEta+j1bR7kIY0x/YCBp9MwMtD6kJV+OHUXgh1TZgjokHpDZ0Ncyo6wdW3
         U03w==
X-Gm-Message-State: AJIora9PYpMVFtoXY7wVEd0m1ZY0MhUqAV/HvRP9oWZrbX0qu+VhP/wi
        n+koHQQTSCDGyuOJqhZscJZV7klKSJN7EMy1
X-Google-Smtp-Source: AGRyM1s3PYon87V6ZIQRe8edUrsZeZ3eT3aeOsHW9J2UdrXJpupQUKzwrZmeDkHDLshL46ulpAu2/g==
X-Received: by 2002:a63:688a:0:b0:412:6728:4bf3 with SMTP id d132-20020a63688a000000b0041267284bf3mr15632697pgc.339.1657949631209;
        Fri, 15 Jul 2022 22:33:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16-20020aa79490000000b0052512fdaa43sm4819982pfk.163.2022.07.15.22.33.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 22:33:50 -0700 (PDT)
Message-ID: <62d24dbe.1c69fb81.35425.7f89@mx.google.com>
Date:   Fri, 15 Jul 2022 22:33:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220715
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 10 warnings (next-20220715)
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
ext-20220715)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220715/

Tree: next
Branch: master
Git Describe: next-20220715
Git Commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
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

    2    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds l=
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
    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds limit =
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
    lib/maple_tree.c:4292:20: error: stack frame size (1096) exceeds limit =
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
