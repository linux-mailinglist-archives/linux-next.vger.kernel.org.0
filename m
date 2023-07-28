Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E877663DC
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 08:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjG1GDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Jul 2023 02:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjG1GDC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Jul 2023 02:03:02 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4509A170D
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 23:03:01 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-26824c32cfbso1100407a91.1
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 23:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690524180; x=1691128980;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjNoahfPGA09V8/VpaXFgRl+BgG2KNqn/kH30Y+xkwM=;
        b=WnZ0PQDb67kkdgCzu0aYMIu0JVVlpcmd7lZNMSsgXBLfEen/hB7LkEHtlSn7AKcLbB
         jKSTSod0zuj2HRbBkO8hmmdfHVt2MgIqsCfGOVCOjBFkiWJB3F3GjDWOuD1G2GeSeG8O
         UY+ArQaG7JXCOmNaRyUmzDc8egnJH9ib3H+26M8y38jP0xWYwVzwLqxBZYkY3qRnPT6K
         SQ3Lk/5vLizpKOVd8SrNiFLrmj+ofTtSvbG+3XtpOrRMQrR9QYBoa3Hl4pXhjqBceCDg
         AVN4ut4PvfRRAMx3h32YJuEvysUpGQEd0Zqr7hatbYMoQIK/VjXF1Umqh30zw8dBsdl7
         ueEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690524180; x=1691128980;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjNoahfPGA09V8/VpaXFgRl+BgG2KNqn/kH30Y+xkwM=;
        b=fDFNexCfnWg71IP0Rwe3WsSB+a1R7B9IyFGxr282Yp2dBsrBU+Ow+0x1pV7OxjMJWZ
         hcsaWgsnDu3rE911RXsUcCFuy+6fdA/1tX3tV9vSnpWG7/j7M/Eowa4rdu/7Z8887nxS
         yP0MFufLQtfickyMM99yXoNrSq1WND34qm9ybN6iam2Cm6uT9dT7d+EhAyP2sAlxO1sz
         8WNJOQnSEVIvkkPxE1ZiOYwhIGgn8OhjHUlw5+Pm3wu3XwGbHKByd4z9yfQuzrB2rrY2
         MWDZvzguGPtGKD7qk9UD7+9+QprBtpC16t93se/YTkQ+nkI9KIBU7PpIg26QvhngcteM
         bO0g==
X-Gm-Message-State: ABy/qLZG6/6f12sUtyW5g0vsK3tfHDZ7wXX2bwyboVVqWimlLtKJIZId
        yoc8Nx5itOeepsWlSZ5smB3YCwvg75d8o5cCfGdupw==
X-Google-Smtp-Source: APBJJlG6n6o9yy+spcdjU+MjxQ+xv3dvUzrYp/FPVy5buxC1yoAhFMV138evvPGDvczKsTjKwmBIqA==
X-Received: by 2002:a17:90a:318c:b0:267:f1d7:ed68 with SMTP id j12-20020a17090a318c00b00267f1d7ed68mr1161470pjb.14.1690524180092;
        Thu, 27 Jul 2023 23:03:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o24-20020a17090ad25800b0025645ce761dsm3567624pjw.35.2023.07.27.23.02.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 23:02:59 -0700 (PDT)
Message-ID: <64c35a13.170a0220.3b7f5.6d9f@mx.google.com>
Date:   Thu, 27 Jul 2023 23:02:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc3-393-g6d8e2e5dcd42c
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc3-393-g6d8e2e5dcd42c)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
3-393-g6d8e2e5dcd42c)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc3-393-g6d8e2e5dcd42c/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc3-393-g6d8e2e5dcd42c
Git Commit: 6d8e2e5dcd42c9100bb6226471fa78741c4f3444
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
