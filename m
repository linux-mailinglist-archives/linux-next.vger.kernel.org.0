Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 953B46CD13D
	for <lists+linux-next@lfdr.de>; Wed, 29 Mar 2023 06:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjC2EpF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Mar 2023 00:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjC2EpD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Mar 2023 00:45:03 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029E8269E
        for <linux-next@vger.kernel.org>; Tue, 28 Mar 2023 21:45:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so17355125pjb.4
        for <linux-next@vger.kernel.org>; Tue, 28 Mar 2023 21:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680065102;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OK/6bmZKKYAHSWCi93JOnnJSg+DOE34vh+RTj5Xe2vc=;
        b=329c0tgY4y8V6EoXPApPR/xEpyKXzvAWRw9di4z9Z3LHqHCSdbYhfMue2LJq70VWrd
         dP7fqmmsHWlMAY3F5hGSOWF9Xa+9suQlrIpJ3etkvWf17ZRgFEEfloTJqNKXW3UHuhai
         m1tJMtV+wOif0QcG0EEV1AlyRS5Cp6FAwmb4gp3q/tmXaAe9FkirWkhPcIxGoG5NLmdx
         Eh55caHoeW3pAFUOclwxaaWcqqGwlaZG5WO6rsY0neSGU4zBjfsos9nToBUAkLfz3hI3
         LK8ugddpGQDd5A4t0qSaZ8+Hf36/X1V/B5T2p/bdUaOqYlGbEjPvKjRCe4pX/Sso1Yba
         rrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065102;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OK/6bmZKKYAHSWCi93JOnnJSg+DOE34vh+RTj5Xe2vc=;
        b=WBUaQFmu68+MAlCa35mIyL/HzdwNw26yLIz+dzxSIehd6pxVXr+3WZkBQINIomrOGR
         9PrOy34ju6YtnftGXmhgWxvhkNqejUWBlyNsjUZ82EFCybJsaYGrfZfXJzEt8AFh0xF2
         G6mYC/hezCLnwDVwB5Sr7tQBazLwXcCu+tdHokzmEW/1c/CkwNlSPcSl0QPVbCAlviyA
         jR6x5pzm8pDf1i1hwSil6d/yxcq/YIsaeftFegamUxD7jMAZoOGb7XCWI/JPl4y29eDM
         Kvuxr63eENR1vQWvlUQpqh/0OHvbu+Byug/FT8RMLBX49eUq5fcxqtCno5wz6hlAZ5gb
         zfvA==
X-Gm-Message-State: AO0yUKV5rZt++b5mIrgN4Eqls9hm/pRof2yaGSsXEPaYVOTnKeN/77kR
        jNhERvVwBXKwDtGfcZ3sU6d3krk+cDgwdUQ5c7AT2g==
X-Google-Smtp-Source: AK7set/Wfcai310Dor2xUwORmzO9WqsDJRc5wcC3/CrhyErnX2eDTSAgcmKI7QqNhclIr9IU/79G9w==
X-Received: by 2002:a05:6a20:8b14:b0:da:fa65:cd89 with SMTP id l20-20020a056a208b1400b000dafa65cd89mr17577312pzh.9.1680065102159;
        Tue, 28 Mar 2023 21:45:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 30-20020a630c5e000000b00502fd141ffbsm20709839pgm.49.2023.03.28.21.45.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:45:01 -0700 (PDT)
Message-ID: <6423c24d.630a0220.4d51d.5353@mx.google.com>
Date:   Tue, 28 Mar 2023 21:45:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230329
Subject: next/master build: 12 builds: 0 failed, 12 passed (next-20230329)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 12 builds: 0 failed, 12 passed (next-20230329)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230329/

Tree: next
Branch: master
Git Describe: next-20230329
Git Commit: 198925fae644b0099b66fac1d972721e6e563b17
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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
