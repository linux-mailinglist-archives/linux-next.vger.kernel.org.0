Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293FC6E1604
	for <lists+linux-next@lfdr.de>; Thu, 13 Apr 2023 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjDMUlX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Apr 2023 16:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDMUlW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2023 16:41:22 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E937ED6
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 13:41:21 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso208893b3a.0
        for <linux-next@vger.kernel.org>; Thu, 13 Apr 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681418481; x=1684010481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JpD/idY75JCUonc1mCHRsxaPMz+Dua0TbOwZfoFGyKc=;
        b=Hx8Nm0yfKRcdlKMFdpf775xgaaRBL/Y2OyU9uEjNagnj8tHchA5y3uBSiB3UgAC8/i
         LCPE2C4vJWqMLAit2L2CmAeoq+ZViHhraNDBXuaM/kEjbwBliy6J79iD/ReqD+P066Sq
         rv/yJKSAYKB7LP7pPCmwvxd5ATxw8snJrRaRmQRCimyI5VjjYKIyxxqgbcmdwCt6/Vz0
         mQ1MPPBKiw1Hn1rO+ZuhokupYBGZ4PsbcynmkAuCNim0AOkD+YuxVDa26ENIcZAKMDBq
         dd3SXBNp6qDs14osMKg3x2llZRI+YNgCN3oeaIMrorFmceazI6QCcgvPcQXDkFtC0M5C
         JdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681418481; x=1684010481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpD/idY75JCUonc1mCHRsxaPMz+Dua0TbOwZfoFGyKc=;
        b=efW3XxbkOxKvj+FYGCNsiQ3xP9Mph8Nz8PhksrgJsVRXmKE2TswaZHPcfFnGg4aZa7
         IAtfGtdyIRfh49NXd2mCfCAHHjlA704hK24Pw7ffYttAdRxrI+zDji0KxU3vawRfw+Ll
         QbpB4lL+c05IbdRfVMiGtxHBcMfOvp2IZhqpWtowqOo5oBX8/CBDiIAkLYdTuwKdhBYG
         SvpuCTGsXYIbdSvnLOi90Qis51ZjZO5uHzEsBsVpbmVKgCzZSvcMJY0dN6DANT6MzhTe
         YOuuOS0PHI59PITvlxT6DVQgiYUUN4oyepzahVxiqd3kAXfpCc+s3eZkdMFCb2q/7SRL
         SdXg==
X-Gm-Message-State: AAQBX9fxfKaTFdA7MdJsclsaeL1iqKZYjdOPsv4bT7XkW42Jv2ADJgj9
        E1MpRh2XlVu/EZmcDT1ATSSWNRUuqRstj6QSgGp5Sbe7
X-Google-Smtp-Source: AKy350bING9vrdkoO7aQ/KK5F4NRbJRhlUpUMos39c0afipNlf/i8uh7CLB+qsRwmZdhn/EIGTHskQ==
X-Received: by 2002:a05:6a00:1587:b0:635:cfa6:ee5d with SMTP id u7-20020a056a00158700b00635cfa6ee5dmr5758114pfk.7.1681418481036;
        Thu, 13 Apr 2023 13:41:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y26-20020aa7855a000000b005ded4825201sm1778861pfn.112.2023.04.13.13.41.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 13:41:20 -0700 (PDT)
Message-ID: <643868f0.a70a0220.c4b14.4049@mx.google.com>
Date:   Thu, 13 Apr 2023 13:41:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230413
X-Kernelci-Report-Type: build
Subject: next/master build: 13 builds: 3 failed, 10 passed, 3 errors,
 3 warnings (next-20230413)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 13 builds: 3 failed, 10 passed, 3 errors, 3 warnings (ne=
xt-20230413)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230413/

Tree: next
Branch: master
Git Describe: next-20230413
Git Commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning

arm:

x86_64:

Errors summary:

    3    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    3    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
