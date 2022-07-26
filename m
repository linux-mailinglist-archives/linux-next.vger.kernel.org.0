Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB605814D1
	for <lists+linux-next@lfdr.de>; Tue, 26 Jul 2022 16:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbiGZOKg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jul 2022 10:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiGZOKf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2022 10:10:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF8310A3
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 07:10:34 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so66217pjk.1
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=E3WkBAbIZNQDN6qnICcRcF6GSR6VvBoqLAOZE61ZrSA=;
        b=pr7s5jUf1zfSEp86wpCDmE36mInoXdkbJ29+f5UrnX18Ydpy2qIqU6mfl5uYfVEqPl
         wetQ2A2xypDjSeAxd0TmaAqbwLnp9/c8KwQ15rN+tIAsLB4pkQ9T3mzPRLkZpWIFmFHT
         Rsg6pp8ROkyDwwEL4bfLpR5xuPsr3Q3d5cNISQwP3cywYZh71CUxvLzkGaRE3GXZgl0d
         tCOaO1x3h7tdn7kD0omTiIrZ/r/vVzXpegLvKbM6xEQlZVGcak2t3hiKMg0Ir+I7HXKk
         ndJZ6ZDDJn6Yzb9nMfWFbz7Uu2p2QSlUBjVAZvs2ZZLPtdRaewue3XDhe/Zu4rwWih6y
         HgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=E3WkBAbIZNQDN6qnICcRcF6GSR6VvBoqLAOZE61ZrSA=;
        b=ooYo8XVJR4Wz+lTP1RGEMuoFLppqjVOWLBEuDBpz+2usOeDKFnyG3k7Ben46Uvmj9+
         DkELgGHfGzZk+F8qbLj0KXGEVuW3QTw0a7i9BOtbf7n/cfS5ldd8kEWAsEnJ4UXzsjnx
         Zl+a8CxZJwgOr6pAeIfRAWMTjaoTlBzLfdAiFZO2W3qODtMfwP8CRfSwwgueJYImrO69
         FrTFC6yN26EPxq4htXzkcvPt0TKDp4Ber0YxM3LXerWnIhtB3A6Y9iAHw5cjYPiwhGfT
         cTMnHI5EIUy0fZiRezLtL1fWyZxGvFwg6vb1uETaZXCLAypE1EYVQGl2wBuupOBky939
         Pilg==
X-Gm-Message-State: AJIora9j47WOO+vmnCb6QanvXoJtxnxaQ4YSKgbMroT8aqMTW/INj561
        rl+drQf10BhIYQLz+9xKTWgO5yWtF2q8yzON
X-Google-Smtp-Source: AGRyM1vc43v93bTxq7RL4RjHCS5tisAVYcP23s9woebzDoIz3mFm4KDByT6agO7vgUpDzkOKHTA0YA==
X-Received: by 2002:a17:902:da92:b0:16c:4f7b:8703 with SMTP id j18-20020a170902da9200b0016c4f7b8703mr16983449plx.75.1658844633497;
        Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b001f24dc56b72sm8964216pju.23.2022.07.26.07.10.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
Message-ID: <62dff5d9.1c69fb81.cb494.ccff@mx.google.com>
Date:   Tue, 26 Jul 2022 07:10:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220726
Subject: next/master build: 14 builds: 1 failed, 13 passed, 1 error,
 13 warnings (next-20220726)
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

next/master build: 14 builds: 1 failed, 13 passed, 1 error, 13 warnings (ne=
xt-20220726)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220726/

Tree: next
Branch: master
Git Describe: next-20220726
Git Commit: 058affafc65a74cf54499fb578b66ad0b18f939b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    1    sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr=
_stat1' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the varia=
ble 'ext_intr_stat1' to silence this warning

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
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat=
1' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable '=
ext_intr_stat1' to silence this warning

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
