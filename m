Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8984D77EF34
	for <lists+linux-next@lfdr.de>; Thu, 17 Aug 2023 04:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347699AbjHQCwR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Aug 2023 22:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347707AbjHQCvz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2023 22:51:55 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31AA114
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 19:51:54 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68730bafa6bso320965b3a.1
        for <linux-next@vger.kernel.org>; Wed, 16 Aug 2023 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692240714; x=1692845514;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mqNp8L43P/ltpKX3ypod5PkE1YB0EbvlOqda7JXEdiA=;
        b=kcrY9oh/rqG7GLfimq7R3nhi2Z+QVN0gsKeX+2fBxNcqbiOBU1cJaXi5XWax2LUjZ1
         wOxmIeO+pSpqfI0xvyoh3ifbT1NBje9HIna7rFCLOnasor358FT36Q4YKFlfAVUSpgls
         J60h2sJASPxxI3Nu6ut8vGr4YpcqmJe6htvV26ZHtBwpGJl9N311CNgrgjqP7cr2emtR
         YfLXckGX+z1DMrm6s7lEGO4U12L1w3RQYEW1JaSN3Vsgl7ntKHIohVhJWl4ZYStclz7H
         UfPfh37M4gwM3k3PPJW+HdW88P2sWM/7MMklSZ/CXtxcbk/mETQyfHIdy/+Gbl7hRqqZ
         LaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240714; x=1692845514;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqNp8L43P/ltpKX3ypod5PkE1YB0EbvlOqda7JXEdiA=;
        b=cPg/J+u/St2U0bspWVckQPr3HtFIAJv2cfw8B9x3HYMdP1ZZlN0QTwbI3j62kdOrrz
         gI29C1LycuEyPeKiL5kBM0u3Z3z6ZYFJMYAklyZjlkox4NxqoTVU9x0cfrnhxXiw7Hf7
         F3GsdFn/HVBwS8GhDre4oi9pSmEGEPx0nuO5WCaLTfekQhs/rhNJvPBk5WQl0aCF0S+G
         ql0oJ881FUbLZclK3BdxYZGnV+OgC5cZvJU5pvM0bZOklI5JQiVCbLi7zHHcQGKTqOIL
         89pyJIlwyi4FcHhWh2dBLpzEyshWt2RdiJM4zytBA0cg7stt5WOKwv0uAoP7HtrWY7E5
         +Bfg==
X-Gm-Message-State: AOJu0Ywx63BAWu5ZaeaVUqHXQoVTNSu1RgdnsDsBts9hfspofJ7oHEwj
        wD3OW5BbKlovRc+klYKExFrmtuFo6iM84Y1sZ+HZwA==
X-Google-Smtp-Source: AGHT+IHJ0bT1Yp8oJkYfn6r7nF9OI1SitXhCNY6jmLbVd6um2PClApnfqlLZlnrTs1wzX3sLJl3GJw==
X-Received: by 2002:a05:6a20:7da0:b0:12c:3973:800d with SMTP id v32-20020a056a207da000b0012c3973800dmr1810762pzj.6.1692240713884;
        Wed, 16 Aug 2023 19:51:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d5-20020a637345000000b00528da88275bsm12773576pgn.47.2023.08.16.19.51.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:51:53 -0700 (PDT)
Message-ID: <64dd8b49.630a0220.d8758.701d@mx.google.com>
Date:   Wed, 16 Aug 2023 19:51:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc6-205-g42fecbf39285
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc6-205-g42fecbf39285)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
6-205-g42fecbf39285)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc6-205-g42fecbf39285/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc6-205-g42fecbf39285
Git Commit: 42fecbf392850e73b8f9f2a11722052f81d82afe
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
