Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5365A9234
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 10:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbiIAIj1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Sep 2022 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbiIAIj0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2022 04:39:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD1112CB04
        for <linux-next@vger.kernel.org>; Thu,  1 Sep 2022 01:39:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id f24so13698524plr.1
        for <linux-next@vger.kernel.org>; Thu, 01 Sep 2022 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=44MSXcB8HZUYziztiBq9LTrzP9UCedLpEB38QreC7cs=;
        b=J0L0glpECV7+LrRMcIHuBIJGx0JlmyO88rb258mwIJHWJS9ymgQoNqN40MaZsaH+OJ
         ZHmrecUoXrr/GHo38fBYDpYdefioNdUnfSGOLmU+JZDAAxTPT40RoQeTLrnONEQQw9CH
         pFXQLhqL7jRDwEMp9F3BsUYoK1bhmZqibdDLvpvxUJ4uB8Cw95sOq3EPOkyXl+45Y1M4
         UEYDXHvfVTV0aofMZeSPCIcQTIBW4lWfBeshfAjOYceaPiIbvy9dUlaVvmRokno8d4FP
         X+gHv9/odUak77jhhgPvXHfL8BCRv+tXQpXtA6lcY9QjLNi8FBijoEi//sK2vaCqgE5y
         32Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=44MSXcB8HZUYziztiBq9LTrzP9UCedLpEB38QreC7cs=;
        b=bSJlF4yTZ3bUaoZpqhuMnF+bOi9Rc+jyovB+c1rpTaWrh/pC8+ZLMclHvgj6E3J9P3
         IfoJmip4OPVwrZWQH8kCOHAGd49dvtqCKC6SToBSeRKew2WbgCSHl59lEmHsFaYXtdoN
         6ZjN/EHR+b9ykk1myExGysfvN8LlI6ng57SG04ihaUwOxyZot4NBLWqWny82Gog5BXYR
         q0CPl5CHCe0lS0Wj+oXNx7+mv+O34HZZgDMVijGPnkO7iDQF9Z88FEbqQUGRPCuK2bSH
         MKzIsIYVHwpJIIt/uiIRcICTDol1P+uTGsmmcYLBWWtaHBvV1LYI6CSniJtsi/7fJ1NH
         CmuQ==
X-Gm-Message-State: ACgBeo1zRcx6GJWRpHMWc9/NJ5maii3i6Z595tLiD9DOgv92/1fOen9b
        N6JP71ul7IuxhzbwYd35UcUyMBomX0hIRrXgDTY=
X-Google-Smtp-Source: AA6agR6NSgOL55YbnXFheamLbDON+/jsrwF+skSYgFv+wIbwWV85Wxjgi2IpABs2iwU+oKnuD0TbmQ==
X-Received: by 2002:a17:902:ebd2:b0:174:3e94:d01 with SMTP id p18-20020a170902ebd200b001743e940d01mr28755443plg.112.1662021564516;
        Thu, 01 Sep 2022 01:39:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001744171a60esm11507226plg.194.2022.09.01.01.39.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:39:23 -0700 (PDT)
Message-ID: <63106fbb.170a0220.248b3.498e@mx.google.com>
Date:   Thu, 01 Sep 2022 01:39:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220901
Subject: next/master build: 14 builds: 2 failed, 12 passed, 2 errors,
 12 warnings (next-20220901)
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

next/master build: 14 builds: 2 failed, 12 passed, 2 errors, 12 warnings (n=
ext-20220901)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220901/

Tree: next
Branch: master
Git Describe: next-20220901
Git Commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    2    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl'=
 [-Werror,-Wunused-variable]

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
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

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
