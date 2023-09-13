Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC69579DFB0
	for <lists+linux-next@lfdr.de>; Wed, 13 Sep 2023 08:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbjIMGHw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Sep 2023 02:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbjIMGHw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Sep 2023 02:07:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD43172A
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 23:07:47 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c1e780aa95so44570665ad.3
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 23:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694585266; x=1695190066; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ig1SJ2MdACwYrheZnic7AwHBXdPolVUN5zr4osEloaU=;
        b=SRbW6EPhQbl+gFCXKI/ZT1nGYfiV7vVDEM/H1gfPw53BH/NA1L7/YkXpzlfrTr9NgX
         X2B8YmJxZxiqKnGyZfk9NssGoiNwlw0Cd+ZJCrFSoB6+33xignWfcKyUZ5pyKZ3xNZl4
         TdpRflKtPaWEftDYS2Yy3+G1IyVreq8PHhlaTvncp3SXg3M+J4McQ3y2dh8uG7bVN9WZ
         7WspGQ+qW81ossOnaCNrC0TrZmwaCuU8nRnvBBPwgLLhCS1UWPMyo/MuYzUS0Cf7mbPg
         OVavxSKRBzk/HxCXN27wVMWC+dI5gKaMJuGboNSGEkDpYRMzmzIfuYMhs+aOT4sMolMz
         0C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694585266; x=1695190066;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig1SJ2MdACwYrheZnic7AwHBXdPolVUN5zr4osEloaU=;
        b=ohZ50BPf5fBy9gOcC28VCuHXB5KwJyZXkmvyI4O/XS/bUbxrVxuzIgs8J4JC0M3T/M
         4mbO2Lvx7RdSOOoJ3LezKcHPdPFNnSBIuUVFSD1YchzwPpqOPCIPV3uKsdysOTomwUoN
         D1CcPy4kGDrlEohk7bgtW/CHkcAbe7UjOhESjqK3mIAxDU0G5MeleGBQ7ZwBLY56uzl9
         HEAPQTrPTZYf2GG2+BilnUi2Gn6TOA5I6TStbdAf/5u6jNbM+xS9AY6mVSREBErl534M
         5bGX42IG6xpiATlXbOijjfFAnvYFBZ1Pd34U8q1eOmjwW1oeyWz9rYrr8cCAB60mquZe
         n7aQ==
X-Gm-Message-State: AOJu0YyQ8ymSE63y+WOx4/dZPgWNPm4tKvZtmeaklHNTiIlRWlzFKGZ9
        5/EaqgbpLRHRnz3FbuEQFojPbhkVDetUHAKkh9Q=
X-Google-Smtp-Source: AGHT+IGUMG0soFW3AcCzjEvkLDGJ6zMAnbPnVD/dz2ZX1aG0FbX3qqnMbYW9WoeD/LORfgfF7uLyeA==
X-Received: by 2002:a17:902:c20d:b0:1bb:1523:b311 with SMTP id 13-20020a170902c20d00b001bb1523b311mr1828089pll.41.1694585266174;
        Tue, 12 Sep 2023 23:07:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090282c900b001b8b45b177esm9423627plz.274.2023.09.12.23.07.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 23:07:45 -0700 (PDT)
Message-ID: <650151b1.170a0220.ebd62.b8ec@mx.google.com>
Date:   Tue, 12 Sep 2023 23:07:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-220-g17eb7af5bc73
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1-220-g17eb7af5bc73)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
1-220-g17eb7af5bc73)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc1-220-g17eb7af5bc73/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc1-220-g17eb7af5bc73
Git Commit: 17eb7af5bc736455ed1f204a72d9eef7655fae2d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
