Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BC978655B
	for <lists+linux-next@lfdr.de>; Thu, 24 Aug 2023 04:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239467AbjHXCaQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Aug 2023 22:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239506AbjHXCaE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 22:30:04 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C06010DD
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 19:29:59 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a7e68f4214so4499468b6e.1
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 19:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692844198; x=1693448998;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A90+DazeS1O4XnoIItySCB4ugr5hbZgl0EYBnKwMR0k=;
        b=cHQX11JauWH2SR5p3A8vYpOaO7Yb7VY1WTaZKLu/07gKzi2oqaBHg4I842w7al0/5A
         v/npUgmuV2PdustG7fHvFV/+uWm7W1IB7NrVEV3386/r+b3R2ShbmdBjT6iZNgyjad35
         YuTdmqbR6rPYs0aVf2b/wpQkLoGFrvJ9utkn98Bt5i//LXZfZgmHOUmYOtkSdRKZ4v1C
         Nm09gS6eH4V/UfDFJMBWM7YOLyPerG/5iVSPogCyAw1BpbuXXTBsaC4PJfcImygEa8aE
         L+5k/rE5PDz9CFB+63E08F+DM6xMLYccz2NkOUd6Kimuc5TNboEJibUZnp+5VY/jbTll
         rosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692844198; x=1693448998;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A90+DazeS1O4XnoIItySCB4ugr5hbZgl0EYBnKwMR0k=;
        b=c8MF/I8OHQyRGlSMlRNilbqcCzB6FEDgLFmRmiFTMcwBRQhw49dNFHL2QgNEP9OVwg
         gN1+PsMnWVlOk1cWb6vVehLtj9+1o7Rz9LJSJ4ZHhtjV6my+wUkjk3hYwBr7HTlBrl4l
         P9yvZqNDuSYtSEa62qSRfLHvE5K++aDn1nYKOIau67sGO+QY2ReJ+WFSxwBcODrpp9ZL
         PA4Jc/14QZI1BcBHNJm9mC4cWovqdtaayvn1wnPt7jDPOKDL5KAoXBpQcb4vsnn9iLle
         1ws2Jh8niq0x6y+erhk7Z3gkuVTCAWCaST5yuHlJRduZarrklxQFjhhNFJmE+A26pAGn
         AC6A==
X-Gm-Message-State: AOJu0YwL++EbSvbT2vjjkf4FzOVwA+5HjoS4ULt68HQx/AixFKdsMHWI
        WKjwq5Qqqwd307N1CgWYEXRSIIDBGqapmafslcE=
X-Google-Smtp-Source: AGHT+IGNV0NBqvV4k1AdAqY8avZ54hB/D4Cy84jZi50piUTibbdB0hMbyTj3D6hrlAP7eEvm+rPy7g==
X-Received: by 2002:a05:6808:f89:b0:3a3:baf8:5b8a with SMTP id o9-20020a0568080f8900b003a3baf85b8amr20410312oiw.13.1692844198057;
        Wed, 23 Aug 2023 19:29:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a19-20020a637f13000000b00565f9694561sm10375154pgd.21.2023.08.23.19.29.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 19:29:57 -0700 (PDT)
Message-ID: <64e6c0a5.630a0220.1c6d7.411e@mx.google.com>
Date:   Wed, 23 Aug 2023 19:29:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc7-184-g896c392cd4bf1
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc7-184-g896c392cd4bf1)
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
7-184-g896c392cd4bf1)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc7-184-g896c392cd4bf1/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc7-184-g896c392cd4bf1
Git Commit: 896c392cd4bf1827d8c56a0ee5c9e7fef76f7e19
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
