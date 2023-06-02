Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF40A72028A
	for <lists+linux-next@lfdr.de>; Fri,  2 Jun 2023 15:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbjFBNEz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Jun 2023 09:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbjFBNEx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2023 09:04:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1494D1AB
        for <linux-next@vger.kernel.org>; Fri,  2 Jun 2023 06:04:53 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2553663f71eso909007a91.3
        for <linux-next@vger.kernel.org>; Fri, 02 Jun 2023 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1685711092; x=1688303092;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YrZOkmIe7NtY37zIRS4OLCoF6q/xS3nMCKjuHH4Jdu4=;
        b=FkIH8xYxmeerlTuTmTTIOTJr2+5hapnIMNwnm0/dZMf+b+wzpqBddRVUnhe7JhPKNT
         ZWO7k+dHKtV7CrkTwtYxdgVWlo6mj5+Dh89j21liEI01baUtz0lNeUBtjBojfCyhwBw6
         CoGT4nn6JyWqXV7YoF+F8ySr5i66jAG0iHhc646yugpwkk8TGyPOvK1FqexIQQC6V9nR
         rFm6+funY5PmjILsnOlIBdi0y21DvW5hbZLCkLvrfd6sPIPA4QGFAclzf4CBcIqKLkmK
         o/kmctPm0yQ3WaYg5ctOd7fobR2wF6oMtfZUU3hLnG1ipmIHxGZbHQ55Yy6b6qD0FIqX
         tOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711092; x=1688303092;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrZOkmIe7NtY37zIRS4OLCoF6q/xS3nMCKjuHH4Jdu4=;
        b=bL1pgGRqZ3Ft4ujcQqys+DJdqbZn+Dq1K/0GOQJQhZhx9INxwRZysqGbqBnnUyhT+e
         agqwuCOb4hD0O1fhCz9uZaO80S8qotWHbEsIfdk68BvuH2eDEs9914jOdpdmSFyS4vcv
         W6teeWWz6tsdVWrrLHWI4s7cI3GnxHBu08pdC3UpsnO5eFPpEL8S0Rj9Z4SGyPNBO237
         +8MrdFpMjBkC3GkwNQbJsjVpFBGFqblAano5eJ+pgBm+RwCy16/MIjJsH6k8r5RfLbP6
         SVEEiNDXrQ+lrbNhRe5jFN3Do2f4BnHRb4Al11abJ00yvFgp3vl3FUXSu9vZYD43m8Y2
         vmWg==
X-Gm-Message-State: AC+VfDz+AVWnV9l9iGuB3wT3QW1xYZ2Zlol+CsxcwZAktNy4riQYhyDD
        L9N25bEe3G426vvZZCL1amSDHPrfmlVPglAbbFVtng==
X-Google-Smtp-Source: ACHHUZ5V8UvpGLNmjZ4kxw3RDwI2o52nrQihKqCpgGGcENEwE0pS9O0Byv8+8mJaYEa+aXVvQUCrtg==
X-Received: by 2002:a17:90a:4404:b0:255:4635:830c with SMTP id s4-20020a17090a440400b002554635830cmr1115376pjg.40.1685711091989;
        Fri, 02 Jun 2023 06:04:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090a598300b0024df7d7c35esm1176070pji.43.2023.06.02.06.04.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:04:50 -0700 (PDT)
Message-ID: <6479e8f2.170a0220.9b58a.1e66@mx.google.com>
Date:   Fri, 02 Jun 2023 06:04:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230602
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 11 builds: 0 failed, 11 passed,
 5 warnings (next-20230602)
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

next/master build: 11 builds: 0 failed, 11 passed, 5 warnings (next-2023060=
2)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230602/

Tree: next
Branch: master
Git Describe: next-20230602
Git Commit: bc708bbd8260ee4eb3428b0109f5f3be661fae46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Warnings Detected:

arm64:
    defconfig+arm64-chromebook (clang-13): 5 warnings

arm:

x86_64:


Warnings summary:

    2    1 warning generated.
    1    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' s=
et but not used [-Wunused-but-set-variable]
    1    drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'm=
c_bus_dev' is uninitialized when used here [-Wuninitialized]
    1    drivers/bus/fsl-mc/fsl-mc-allocator.c:100:34: note: initialize the=
 variable 'mc_bus_dev' to silence this warning

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
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 5 wa=
rnings, 0 section mismatches

Warnings:
    drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus=
_dev' is uninitialized when used here [-Wuninitialized]
    drivers/bus/fsl-mc/fsl-mc-allocator.c:100:34: note: initialize the vari=
able 'mc_bus_dev' to silence this warning
    1 warning generated.
    fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' set bu=
t not used [-Wunused-but-set-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
