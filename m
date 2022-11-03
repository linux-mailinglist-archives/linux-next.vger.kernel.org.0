Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6CB6176A7
	for <lists+linux-next@lfdr.de>; Thu,  3 Nov 2022 07:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiKCGRc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Nov 2022 02:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiKCGRb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Nov 2022 02:17:31 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EA618E02
        for <linux-next@vger.kernel.org>; Wed,  2 Nov 2022 23:17:30 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id v28so737108pfi.12
        for <linux-next@vger.kernel.org>; Wed, 02 Nov 2022 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2SzhgN8GaqT8zn/DoN1Xiz3L9dooAHfhRVKtCoMKf/Y=;
        b=Wt0VIKofnCvUA3Skcrwnc4w3gtC3+IqWvJ65PqVHNfI5brf91ymqHdHT3DdrA4SFtb
         Pd/Y/65xGCJvRr8p7grCXiI9aVrCp/SwfNETJ3/0tXy+n+lY+EM5XCXFq5BzgLoCNdcF
         ogcJAMMlgn9WSLOnEQ444G8zDbIAleMQYN542QZ8MDc9GgpzHrwzdv/WzVaKel/D4o0R
         w9qZToEt0KUVnvG9AjfgwSgKlQ9vg174aRo7+aHePqcDA0rMQA9v3Gd1CmWaT2LWZNoQ
         /F+raupCXGAUDc1MyJIVrCI8F+Bu3Kl+UFstEf325SOOdP6ncjrZEjQOKKCGNbe/7NF0
         /qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SzhgN8GaqT8zn/DoN1Xiz3L9dooAHfhRVKtCoMKf/Y=;
        b=JIQ4m7y2YMApL/KK8KvCButeMaqqhg6EnVN0HJ1MNh4rH5irJuFGZLGPJaxaULModW
         OMIzB0gKvTUBuKRmamNfesJcnIjzoWcO1uEj2gaGpU+ypDprnYe7BxRe+Yep/Xm/4hla
         Ef3k3rwLjgYV/6y3GRoJz3rJNZwub4da/HB654D7epI1CZL1LY+jEmEzz7ZSzVRvCcK6
         IBLTBsT9H0C+zWBHDL/0s7v9V7pXNfW+Xu5GY3HQliAQOBnJiVFx6ACIc2MfJHBHJhWc
         i2TwZH5pB1KO3RzTFyk2D38e8Csewb47MeSVPkABdQlWkv9+GAL2VhvAHpM+CnqBm2cK
         t+tg==
X-Gm-Message-State: ACrzQf3NX3gDhiOnUeUDVCSObGZvZKX4Kitzy44/mJMAvRrgxEGpws0J
        7if5qHLkjwe2pA5LTipps+Qdloa70+iTYsty
X-Google-Smtp-Source: AMsMyM7AR/mH4XEYEQ2ApuvBUpwbMp0nrY4Pb+AWaOvgLsaC9ET1vdWJMb5bo3iyAfSEYYhV2W9FWA==
X-Received: by 2002:a63:e511:0:b0:46f:98cf:13d3 with SMTP id r17-20020a63e511000000b0046f98cf13d3mr21010192pgh.363.1667456249643;
        Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u15-20020a170903124f00b00186c5e8a8d7sm9433693plh.171.2022.11.02.23.17.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Message-ID: <63635cf9.170a0220.36947.1e8c@mx.google.com>
Date:   Wed, 02 Nov 2022 23:17:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221103
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 11 builds: 0 failed, 11 passed,
 12 warnings (next-20221103)
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

next/master build: 11 builds: 0 failed, 11 passed, 12 warnings (next-202211=
03)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221103/

Tree: next
Branch: master
Git Describe: next-20221103
Git Commit: 81214a573d19ae2fa5b528286ba23cd1cb17feec
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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
