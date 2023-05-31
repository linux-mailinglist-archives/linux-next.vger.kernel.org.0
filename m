Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1793E7176C6
	for <lists+linux-next@lfdr.de>; Wed, 31 May 2023 08:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjEaGWR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 May 2023 02:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjEaGWQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2023 02:22:16 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7B78E
        for <linux-next@vger.kernel.org>; Tue, 30 May 2023 23:22:15 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b01d912924so43534715ad.1
        for <linux-next@vger.kernel.org>; Tue, 30 May 2023 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685514134; x=1688106134;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gPCHJw6uiidg13w8mLV6+BRcnhzZLwl+A5RxGxHlMaI=;
        b=rW5eQRnGn+eebnZQ1mmqDWGU2E9S7nKJMSYZDjhCWVFFpYypgQbB/Xfxr45HnM+uC7
         QaCqhuiOd8FbJAqex2R3/D5qO/rtwD7z9L04IyjckIULIvxlT6yiVdwDWLkIua+RaTBW
         EsXS3RF1ZRoT41IM+HDKpuj56dNLKe/1aXkNo76IVYGlvNEFz/KnmwDXFyQKEMbr4WnN
         Toi1lOm3dYQ5wwpwlO+cA9ilYi9DVQ/II813hF5jUfmqxhOZvryU6FG9dGNvy4W8dDTi
         7ZX3YcbglbVHrHX+3BPgj/E81FoCSn9FZUo8L9LnFrS3VGCodx6Cf4uWwt2onmEFHrO3
         s7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685514134; x=1688106134;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPCHJw6uiidg13w8mLV6+BRcnhzZLwl+A5RxGxHlMaI=;
        b=ZEEvw6EQAnC0FLtOSO2Ny3u/KdfzBNPZ5zRQ/dO8QMiqkdyXc0sN6tvAZ1tLizH4/5
         LighG2D/YnOZ1KXShnIdJnLR5ufodIQ071artJiurJUu9XznFtrZ9kW2NTIGoaLSKt/b
         lafVk/JQL/HufYjhDuI5Lp0UEU0BgyvoKe/ROOMGk/FdXn6e76Jz5e0qJtwv/ajPi58I
         YVOBHlEoNdl/xH2VJegc6PCvb8pRhbVHuRyTJsxo3/zPCXwyac/Caj8lDdllcT09bSJQ
         qInzNQ4epyeiH9Zi+Q2B+yHKWbYwpt+zf1zgIbCKJsq15j48iuwA4AJue2N7Gza8ddFs
         EMjw==
X-Gm-Message-State: AC+VfDxXMJSXClmL+SRfwqklk/JgCxEVewgtgEUHnLyMvXvkjyDl0ck4
        c/bFvpjj5Dh1hpSvbP1qNhqtQzRFMcK9WQM2RT3fiw==
X-Google-Smtp-Source: ACHHUZ5A3VnnFStqOS7Fu6lWQGG2erMdhph6R3obn8JCxyu+Pvyxd9MtJvHmcpab190EB7eoMeezIA==
X-Received: by 2002:a17:902:6bc3:b0:1b1:7362:4355 with SMTP id m3-20020a1709026bc300b001b173624355mr1125871plt.23.1685514134540;
        Tue, 30 May 2023 23:22:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001ac896ff667sm410119pla.204.2023.05.30.23.22.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 23:22:13 -0700 (PDT)
Message-ID: <6476e795.170a0220.dad0a.0a8d@mx.google.com>
Date:   Tue, 30 May 2023 23:22:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230531
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 0 failed, 13 passed,
 2 warnings (next-20230531)
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

next/master build: 13 builds: 0 failed, 13 passed, 2 warnings (next-2023053=
1)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230531/

Tree: next
Branch: master
Git Describe: next-20230531
Git Commit: d4cee89031c80066ec461bb77b5e13a4f37d5fd2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 2 warnings

arm:

x86_64:


Warnings summary:

    1    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    1 warning generated.

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
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
