Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9487D79A115
	for <lists+linux-next@lfdr.de>; Mon, 11 Sep 2023 03:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbjIKByd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Sep 2023 21:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjIKByd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Sep 2023 21:54:33 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F47126
        for <linux-next@vger.kernel.org>; Sun, 10 Sep 2023 18:54:27 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf5c314a57so26113235ad.1
        for <linux-next@vger.kernel.org>; Sun, 10 Sep 2023 18:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694397267; x=1695002067; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SMkNSY3Da9Tk6gbRwiOwQN2h1Sz3YwNWmRmzsPcv6Hg=;
        b=qq+5mNXEWuwJpppzqgsfjzuCrN7MOBfcmgIxQVDXOZULmH89Z6ZNa4EsNUM7ZvX7v1
         7WFrSvXVtBEtM5Tt2ckHaAvSGXYqph8+kzj47Bw8IEhQhkgGlJ9mj38dpRGUe3J7AUyj
         LUzgJckLr8L9/eDRlbtcBD57YIWFhqXUP2WnWbl710ksR8LaD8BLg+JiL1htwS4cBLHw
         PwMqVNZtoKf9nlWyhq3eV3fumiSWZ5gQ6VB7zC599+H+tmLWrf6lutCg9+YIB/feMZs+
         HxbZ/bHm566FbkGOePSWSkhO8NhPfhgzpYVUth1cc+kahiRl8NUbzwjeR1B/s7dwjJT0
         ekZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694397267; x=1695002067;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMkNSY3Da9Tk6gbRwiOwQN2h1Sz3YwNWmRmzsPcv6Hg=;
        b=ka6TQ5tzJZpGdAKAPYZDYqH7AWg7Mzpkjy0ZQd2LMPXNRxlbwooRwpGgZN8buQZl1p
         9WfENYOlzXzYNZghugIVxrYSvVlG9RTbkNC9stU8PQ2ghjVYj1HVNlBsM6QKCyHNUgww
         aJztL/H0Pb4A4EmN7PA09XG7rmV/hk0Vu1GguHNGA5WXDY4aKGMviYInvD68vSbIT49P
         U5DsDVT+gc6jHnixqWDajJB8oIoGPqGQbwjkEXIchx4PqVqNB3+4mHJG1qBe0iH/BPLo
         blo56Rx16qv+TPwecBoGy+qsXHR71CMjV365f4p0/DBI/BTUtRaF4D1COzMeCXVnwq2N
         YdGA==
X-Gm-Message-State: AOJu0YykWS6XVp3vxPtnK4AWAuy0rU6Fkv3Q3DddSUzM5aSiu+1CZZ8N
        /OvxA+NOAvUMLS0dcsK5XFTedDlJiDB4fk8TpeY=
X-Google-Smtp-Source: AGHT+IFiHeLM/CW5e/IrL/HiP+OMpBHBwhH709ZaOg1xxNpWevZs7anvU475tnay8NQyTB3mBLDKcw==
X-Received: by 2002:a17:902:ab1c:b0:1bb:59a0:3d34 with SMTP id ik28-20020a170902ab1c00b001bb59a03d34mr7054578plb.30.1694397266888;
        Sun, 10 Sep 2023 18:54:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x12-20020a1709028ecc00b001b8a897cd26sm5145430plo.195.2023.09.10.18.54.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 18:54:26 -0700 (PDT)
Message-ID: <64fe7352.170a0220.21385.c777@mx.google.com>
Date:   Sun, 10 Sep 2023 18:54:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.6-rc1-76-g5bf0551cf04a
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1-76-g5bf0551cf04a)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
1-76-g5bf0551cf04a)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc1-76-g5bf0551cf04a/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc1-76-g5bf0551cf04a
Git Commit: 5bf0551cf04ace2bb811bd2419500f202c475c33
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
