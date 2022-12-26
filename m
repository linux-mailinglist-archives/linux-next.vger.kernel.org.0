Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5509F656009
	for <lists+linux-next@lfdr.de>; Mon, 26 Dec 2022 06:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiLZFOt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Dec 2022 00:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiLZFOs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Dec 2022 00:14:48 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE022717
        for <linux-next@vger.kernel.org>; Sun, 25 Dec 2022 21:14:46 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id 17so9969025pll.0
        for <linux-next@vger.kernel.org>; Sun, 25 Dec 2022 21:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+5HuRbPSmDZGq/1bzlPowYPfRgIiv+CL5P1L5Vi5DQM=;
        b=0AiX+LAcq3WA6MJ/2e/jC5x7EHov2ED7I9Ohc6mFi2yL61UIsO8ah1fU109BeIK6KI
         GRgkjEhEBjt0I1BOZR0kjcMkIJFjmc1711aV4rXpl06BXgUYltb0+pZERsw4gQcHcH9r
         8YagAxgQqRRlFh2d2ogB50463b0fPqhtU9ndAkRZNQYLkw1i6J2d7a9YhkQBCkW17YBy
         Yp+bzCZlZTVv+qWTVvqSN5kqNYavIaEMvuEgQ14U8D6/ny96waWf3bsWF8QqdEREfLaq
         a9W69yuTP/nLY/7VgXfiAsOfMRlmyk81RPy36sPnc6sSUczYj4/Doh0+cr4Hw8X6pfKX
         NQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5HuRbPSmDZGq/1bzlPowYPfRgIiv+CL5P1L5Vi5DQM=;
        b=y7eXv7JeS3B98en05tGvABa1DjRCMGx7mvq8H4VZPkaGavIkE7khXFUvRMmA7qDQ3l
         cEaQ+YXxdtN9b/SvZEFlab6tzV96Se67fIXmuUEfN3i2mxcrsiGBYiOOO/q0vdeRe7ur
         Gi7+vDpb3pH6eZLY2gcMpKvtYyXpI1O8IXlbY5/wPGrGPs0rMLoSdo+cA3mybMDl9UbZ
         p0Vn2/229BNMh/BGXcaYwDOLjIvMM4m1STOtNV7ihcTfU+n2i37fpNcTwOvMZFY0gIOP
         VwU5UKCvHal2CKwaaXLQYzAxXx78LKnsEK92r04BnynuJtHt+jiNuEBLp2QlRP6lPj0W
         3iVg==
X-Gm-Message-State: AFqh2krK4odHhKOKqidhuQcf1CZr7ABNtJmuDJ03SLB9KPeiZ5VmHL7g
        WGYPQjB1LpdkDIMi2uho78RwUif4lLLRHpnalVg=
X-Google-Smtp-Source: AMrXdXtKQYjCxkh2/Cprow6Le5MIYcAnTawBL1Tldg5LO70YrH4eEqulbnSXOUcOUtAJW0Hy+dhdzw==
X-Received: by 2002:a17:90b:d98:b0:221:4cd7:3401 with SMTP id bg24-20020a17090b0d9800b002214cd73401mr20110200pjb.10.1672031685024;
        Sun, 25 Dec 2022 21:14:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a31c600b0020a81cf4a9asm7944727pjf.14.2022.12.25.21.14.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:14:44 -0800 (PST)
Message-ID: <63a92dc4.170a0220.e4b74.f07a@mx.google.com>
Date:   Sun, 25 Dec 2022 21:14:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20221226
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 13 failed, 1 passed, 13 errors,
 12 warnings (next-20221226)
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

next/master build: 14 builds: 13 failed, 1 passed, 13 errors, 12 warnings (=
next-20221226)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221226/

Tree: next
Branch: master
Git Describe: next-20221226
Git Commit: c76083fac3bae1a87ae3d005b5cb1cbc761e31d5
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
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL
    defconfig+arm64-chromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 1 error

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 1 warning
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 1 warning

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error, 1 warning
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error, 1 warning

Errors summary:

    12   fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitial=
ized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    1    error: unknown warning option '-Wmaybe-uninitialized'; did you mea=
n '-Wuninitialized'? [-Werror,-Wunknown-warning-option]

Warnings summary:

    12   fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to=
 silence this warning

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
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section misma=
tches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    fs/udf/inode.c:805:6: error: variable 'newblock' is used uninitialized =
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    fs/udf/inode.c:607:34: note: initialize the variable 'newblock' to sile=
nce this warning

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 war=
nings, 0 section mismatches

Errors:
    error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-W=
uninitialized'? [-Werror,-Wunknown-warning-option]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
