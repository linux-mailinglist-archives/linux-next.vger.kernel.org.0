Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23E454C4F9
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 11:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241256AbiFOJrN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 05:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbiFOJrM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 05:47:12 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246E4457BE
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 02:47:11 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso1602673pjg.1
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aPwIjxBJdE9LB3wLZM0T7IS7g3U9vzTEOHBfxps9ey8=;
        b=rk293wizSFdoCCJk97awebFN7lGNNleW3vnz7+hTwv6xRrU1UR49KRfY5jzTBmrARz
         yR6Gf/ApnS5RYk1GBkTBXVA7WM6+rPQtrdVhmN8dPomstwSrcKaFoOg2XDmvdY0yTR17
         lmTHs4r320OU+BO7OejLRJ7HTepk4HhNKIcSz9CJdyUzhT83n2LWdeOxp6M5TJb/eAvy
         6zsq+DxKffz7VGInqgseKQ5e/wLxB/u3dYJY02bcIL3kJiSs1AnftVyCpgVQ8Cq93bqU
         9Fd11SSbd89HTouMo9nk2PVvKoArBFFR77+u0htnshHxVWktsSWKnpI1Ek6Fu924TTNu
         m7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aPwIjxBJdE9LB3wLZM0T7IS7g3U9vzTEOHBfxps9ey8=;
        b=Z/OET94O92DbfbjuDNbjr57cJl89GI7uagjVImJJlq+KANFMRObNqwbWiVy8K/x9Hw
         LeXeyZ7qwAUrgJXlPXuE1k3GTLLMwo1t6JlSWbBs7VOAGEMimmHANglRWKUzjzhJQT3Q
         J8Qg+K7srT4LHY6XOlPBeVX6sVXRpYmHZQHHQTDI4ybo/dxKt99kFPL0ZFingdi1iUNo
         0f/Jd6JpT2jeVWhPfufpQUxtjIIkroS5YGBmtBgBi3Ftv8crpNHqmaLPgRMbVtoCTqmS
         qZNL1kQIxAW01Yp83pttiVAcQ40r2LhUUSQlLITVry6iTsI8Ly55O9QbxogHIuJmEdjE
         N1hA==
X-Gm-Message-State: AJIora/G4s0GCpuSsbi73lzhEgnMO+3o1N2SSV3U2D/nTE2ca9bRDlh+
        BcW5LIZUAwS6ONdPbpj10APvnBlQ2O/7f0w48pk=
X-Google-Smtp-Source: ABdhPJwb0wcpkSGWy049azHe9WtU/ozIqCv77H2Fx2hHMnJNjFp31w0at5xWf8I63n0TMpwIrNSuig==
X-Received: by 2002:a17:902:7483:b0:167:cfa7:ff3d with SMTP id h3-20020a170902748300b00167cfa7ff3dmr8572567pll.61.1655286430452;
        Wed, 15 Jun 2022 02:47:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902c74500b001638a171558sm8783405plq.202.2022.06.15.02.47.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 02:47:09 -0700 (PDT)
Message-ID: <62a9aa9d.1c69fb81.50396.b4ee@mx.google.com>
Date:   Wed, 15 Jun 2022 02:47:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220615
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 15 warnings (next-20220615)
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

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 15 warnings (n=
ext-20220615)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220615/

Tree: next
Branch: master
Git Describe: next-20220615
Git Commit: 6012273897fefb12566580efedee10bb06e5e6ed
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
    defconfig+arm64-chromebook (clang-13): 5 warnings

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:

Errors summary:

    2    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds l=
imit (1024) in function 'mas_wr_modify' [-Werror,-Wframe-larger-than]

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/mmc/host/sdhci-brcmstb.c:302:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:295:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:280:6: warning: variable 'base_cl=
k' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    1    drivers/mmc/host/sdhci-brcmstb.c:259:22: note: initialize the vari=
able 'base_clk' to silence this warning
    1    3 warnings generated.

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
    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds limit =
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
    lib/maple_tree.c:4202:20: error: stack frame size (1096) exceeds limit =
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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 5 wa=
rnings, 0 section mismatches

Warnings:
    drivers/mmc/host/sdhci-brcmstb.c:302:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:295:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:280:6: warning: variable 'base_clk' is=
 used uninitialized whenever 'if' condition is true [-Wsometimes-uninitiali=
zed]
    drivers/mmc/host/sdhci-brcmstb.c:259:22: note: initialize the variable =
'base_clk' to silence this warning
    3 warnings generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
