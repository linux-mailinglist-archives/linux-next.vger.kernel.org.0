Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C6A60EF89
	for <lists+linux-next@lfdr.de>; Thu, 27 Oct 2022 07:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiJ0FhP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Oct 2022 01:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiJ0FhO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2022 01:37:14 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF0A15A951
        for <linux-next@vger.kernel.org>; Wed, 26 Oct 2022 22:37:13 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b11so541289pjp.2
        for <linux-next@vger.kernel.org>; Wed, 26 Oct 2022 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T9j9zRRQese9k9PrODRTpUi8dr/KIkGm0dSEsv/YkrI=;
        b=Qci7efvygh/HU3w8Vn8frKfk3ol+7mQNFajVM7npNTLrQH9VcH/tsoZ4p/+oEJ1B1F
         ZUHtq5W+hWTerh9nY4ph/fpZj7Oj6Ij3u0zb9SU51MzKNcib9H5EzF9CXUvnd3yzkAEk
         QgBLivjtihF7F3UQycscJJ0KpCRkljlqbE7VkG7ftg40wnxVl7ecH5TWFd6kwMzJSIvg
         EM7wpV8VtSoFgxfI8nDba3CFacJ3SDU/NetJyviKIImlgJZnrOeqmq2wrEOx1etAN9uB
         nRR8BjPAxvOajFqspfxfKItCmFdyyry1R7CSzt/L1EBPu/RAlULbygi5YPbMoLUFtdfF
         I9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9j9zRRQese9k9PrODRTpUi8dr/KIkGm0dSEsv/YkrI=;
        b=ayvT6CmDfA9KYhtZblQlO4iQo5vCbXuE/a69RJczMafawMNu4PoHVIBlDyU2twFw3V
         W/t2XbK2Q0m83qm60OTYxJ7d2GiVAp1kuXJSLAh3mAx8InFhxtu68ulvVMxskXitHdZx
         YTt5BDe/LbmHG50REqO8OVqWi1RN4IrBbfdzUQqoNEiCSfKMJ/RUcp6KNpmEVhglyxmx
         MYZ239yaVM8HkelHAFoLIMzGb/fjB8WTGU94MfwuJPpKX+uGO6pKe4kQPuptkU+UPl1h
         kqHoxBORPZG1OhRekLL0nI7EosYXcg62+vAyYaxM01JDBC4ee2zP+Zdf7U7HKHjN/ldW
         7l7g==
X-Gm-Message-State: ACrzQf1K/go/oPpBJwPGkqiWWHQWP8dBa3XJrpWgoF0LpedEFPHAaBCi
        vriC9/589UuPWE6IWXRLF5yamYPx2q7ld9Oz
X-Google-Smtp-Source: AMsMyM5Ll8ittJQ3z+eJjWu+lHUXeNxiHNRxzZecoy4jChhYBnc+eGgKPIM/FhEFXEujl+BLRUlJYg==
X-Received: by 2002:a17:90a:8c97:b0:20d:a1a2:bfda with SMTP id b23-20020a17090a8c9700b0020da1a2bfdamr8297300pjo.234.1666849032440;
        Wed, 26 Oct 2022 22:37:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 65-20020a620544000000b0056203db46ffsm331682pff.172.2022.10.26.22.37.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 22:37:11 -0700 (PDT)
Message-ID: <635a1907.620a0220.254f2.0b71@mx.google.com>
Date:   Wed, 26 Oct 2022 22:37:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221027
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed,
 12 warnings (next-20221027)
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

next/master build: 14 builds: 0 failed, 14 passed, 12 warnings (next-202210=
27)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221027/

Tree: next
Branch: master
Git Describe: next-20221027
Git Commit: ecc4eeb2208ab537a3f3744984cd7f30ac971db8
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
