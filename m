Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F4D6FBFDC
	for <lists+linux-next@lfdr.de>; Tue,  9 May 2023 09:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbjEIHDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 May 2023 03:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbjEIHCj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 May 2023 03:02:39 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027A646BD
        for <linux-next@vger.kernel.org>; Tue,  9 May 2023 00:02:39 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-643aad3bc41so4322499b3a.0
        for <linux-next@vger.kernel.org>; Tue, 09 May 2023 00:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683615758; x=1686207758;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fASwKKhjJ1UD/MqD3p1uFJR8yRJBTUOne8HRKyITWJA=;
        b=ntAms82zteNeXBC8WaA8E5xCd2KobMDwXCOIdzp1cQZfodeVYvqn99mg9g86jjl7pL
         4HljzcfS6VynVIxz/CGcQ5UO2g4ZPz7Ry1wEN8tnPuYWFZuqqxgIb6tivwXMMkkX8Obb
         0WlUPNlCezhwuSn/ubg4XH5lyfMu8KAUkKcGa49FmioptcIlAGcl7CypTohPRQdY9djz
         XeQrg80v8YUzQSLrKXb+Rb0dfTXXF31DHfBucXnpm4v8YT4tlL07o0rBWrfjbEEhzmST
         PyniHcrEqlMhPPcIhPgxfLDq9YkmrI3KHtBgPnH1ZcdNmxN21h02qkInHh5FwQ674J86
         nIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615758; x=1686207758;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fASwKKhjJ1UD/MqD3p1uFJR8yRJBTUOne8HRKyITWJA=;
        b=E9btq6vm6+TiZxwJhnbhmcgQ8Z5Aa4kFHF64yBy+3BHVpH+2QFZRQULXKtYEjkIGKQ
         X8axgcrAZLtkbaAUUxEQaEhbi777Esr7ornGcwSmO2gRgqzIdDAQs+WKmt/xgtwT8YZS
         QPGkAFt0+jyvuRdRncl5FMostup37017PYCjbVvb5Ibt4XqIV2A9y7/14DXRnCP9bI1f
         pDvWOcyypSn7OLbRCcbTtVrWCDWpl4FDYeSGTODcbKRtwrlevjXoeQxbSFTibRIPWQ+D
         SjaM41M4McYi+Qs5mH7/Vv7l4N6iDfihaA+qMxZKxRPxQ0HDV71VizHkUZUN3Osc1xO1
         r5SQ==
X-Gm-Message-State: AC+VfDwvb17g8Im3B2/5Ymw8OoswpqOLz1RwLlfnQOk2xwQa0MJVYkiT
        Jk+KSr/zqMxD8+ZnuiuxduAUraTXxWLm+pj4kqf13g==
X-Google-Smtp-Source: ACHHUZ4UdjQ59AufUmzIJBLtWvcrQ8vIZDxPYOnianUBRmTAi7CdMw3n08fJec/4Y0a3F6a6GGPQig==
X-Received: by 2002:a05:6a00:23d1:b0:646:ec88:9979 with SMTP id g17-20020a056a0023d100b00646ec889979mr2056136pfc.23.1683615758029;
        Tue, 09 May 2023 00:02:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g4-20020a62e304000000b00627ed4e23e0sm1052874pfh.101.2023.05.09.00.02.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:02:37 -0700 (PDT)
Message-ID: <6459f00d.620a0220.41fb8.2ea8@mx.google.com>
Date:   Tue, 09 May 2023 00:02:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230509
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20230509)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202305=
09)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230509/

Tree: next
Branch: master
Git Describe: next-20230509
Git Commit: 47cba14ce6fc4f314bd814d07269d0c8de1e4ae6
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

    4    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#war=
nings]
    4    1 warning generated.
    4    #warning syscall cachestat not implemented

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
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

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
