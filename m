Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B0663FFC0
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 06:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiLBFOH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Dec 2022 00:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbiLBFOG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 00:14:06 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DFFD03B3
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 21:14:05 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id h28so3894687pfq.9
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 21:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GA0M4uDFJ5XV6gdGxZ8ruug1Dmnd2yqE6qE86rkgnA0=;
        b=VN0CF8qsfUtgiBbJim1yFjzPHK5xKfLQmddTX4jDC/9SUCUVDlM0s65h4J2xna8/Lc
         Hw5sS0xR0cmZHypakwnkZWziCd4auupOmLpb1DSjcURYEF3uT8TziINkysGeIxHc4cw+
         jhfm+jSZP3dSsXhqxyMhyR+9QHP1ciZK3j6my4/SjQl901RHaOTI+kULfG9v8qYzNKp9
         bPWE8U2DiEwtKu+GminsDv6BJIBnFoBtl9A2bjynYL7gJLCpQnuKRBflyk6GIq/AensQ
         ba9j9QdI4M1i+D8KcplHHPVppGgePBozfsRm0i8uoybb/75Qsi7y7ONKTnH7WPlCxFSE
         wN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA0M4uDFJ5XV6gdGxZ8ruug1Dmnd2yqE6qE86rkgnA0=;
        b=y0ce20+8np+Z/4GVOdIyW+08rF93UylsAJpGkeXR6zCcT3SXwO6td6u1POFvPRmQYA
         3i/reujhin+CULhpqfcjVOHQGG35+rzGrU5QfiGeGmias4j/U7RR7/3OP0ykpG4/A8K2
         B/wBBIuj2ts29ZQ8w517mySYjg8saj6mOyZNLHjy1emf1sReDxhBFnGEWY49ebZ4I2mt
         WRinVIC9thb0hVqCZxX9PJr4LJUhSIU3OqvT4SQ6otlZHjULimm3I3C1qE5wBpWCLFeh
         kDRvyyhO+2kKswStHkkVPjuyC6vB3Am+nZcK/1oR7FnDqC/zBUaGJaYYM4KY/QV5WBva
         QZ+w==
X-Gm-Message-State: ANoB5pmu3Wd06/Y1aDXRsi8HqNfP9M9gO04BBwXbBoFcQ7/1HXIV0CqO
        R35TfHHpJ28eBULCxAupBuwhWY9CrhafvniTUs4YFw==
X-Google-Smtp-Source: AA0mqf61lUUPrLo7zmORjozXjOX/IajkQCgOIGoiagV3SgazekSrmL6kCp9/KB2CBz0/5Q0LJeb8XQ==
X-Received: by 2002:a63:4649:0:b0:477:f449:1e88 with SMTP id v9-20020a634649000000b00477f4491e88mr28504461pgk.2.1669958044689;
        Thu, 01 Dec 2022 21:14:04 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902780700b001899007a721sm4509049pll.193.2022.12.01.21.14.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:14:04 -0800 (PST)
Message-ID: <6389899c.170a0220.09a2.9362@mx.google.com>
Date:   Thu, 01 Dec 2022 21:14:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221202
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed (next-20221202)
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

next/master build: 14 builds: 0 failed, 14 passed (next-20221202)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221202/

Tree: next
Branch: master
Git Describe: next-20221202
Git Commit: 5be860bfc73408bc1a8af9167955e480ecebba84
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

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
