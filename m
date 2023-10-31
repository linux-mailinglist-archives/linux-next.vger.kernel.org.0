Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3679D7DC583
	for <lists+linux-next@lfdr.de>; Tue, 31 Oct 2023 05:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbjJaEqY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Oct 2023 00:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbjJaEqW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Oct 2023 00:46:22 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E44D8
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 21:46:20 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc0d0a0355so34371915ad.3
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 21:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698727579; x=1699332379; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qsRpohwO/t9qwe3P07K4/rs6mxSqmH3ynpgNCXwLnyQ=;
        b=W7kOlKM2xgaS7Nvna2DYG/DDvGLWRmrm3egRL36OKQqDddUshYZYA87HpISY/NBtbw
         Tm9AKs6gvMaiLkB0vyV83c9KqFBU+cL6gf5ibG8mq9GVeBF+odpDstPATt7tCPfCZO3G
         dPo9wkNVFVtP+BU7DOaEKdu3kLRuliglx5Su7z70/Pod0e+MamLXiUxwUpTGDAW68NSc
         j2oiBUh6BWPUpLpYLfTMar80KuswE0eRacmFnGwgiSH/kwx2IB9UCWVAOy+O9WIT67RR
         j/bfhEeUssJXl41P9gv1KlqMVrEO7x9vkSa2oaj+gHvLbdPvLVI4+enY38q3S1L/B6Ye
         jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698727579; x=1699332379;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsRpohwO/t9qwe3P07K4/rs6mxSqmH3ynpgNCXwLnyQ=;
        b=WBH94IlTEJAyyzC+cUWAkOP9s8/tc81Qcw5PNU9QV2yD70rNqo5jL6F0x7O+IDJt/y
         OhJ3269sUZmhyvMZYjQ/Io6kyPfc6HCEJC4M/v2sWIfDBPfA0bJY9Cl21T9lwFHoYW6t
         6c4vPSJJrRYVFTdDASPYG2Nun0+mBzW7WjQ+zd7ibuJ/qhy7PuuXZ5yoONpvTZjOwNUa
         MtucrSAk250Vdygqi/L3R7XzyS396mFT0zzEkC0BicErGIbBOijBk1WZlAOo7caZlIy1
         6nQcKcdnIn1ugcGkCaoIa0f4gl6g7Oioy9FjbpnzEZ7MiiwMwKP4OY2wJQD6vl5sEnzV
         XZaQ==
X-Gm-Message-State: AOJu0YxpwForSTzYomE57wsFpFMMAEJtxuBTr+GqvLW/RWMdPUXVIxZe
        77jFq1KneoP/zg3iKvY8Nhs7GHxSY3n5TcxLpHEg3Q==
X-Google-Smtp-Source: AGHT+IHUqSbLRd3RVHz6ssJcrsjaC8su7pySyIMzAQQfYheNxYaBXU8jhrzDo/LjKRpNfpjLpzDL0Q==
X-Received: by 2002:a17:90a:5b05:b0:274:b12a:37ad with SMTP id o5-20020a17090a5b0500b00274b12a37admr9176247pji.37.1698727579323;
        Mon, 30 Oct 2023 21:46:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a199900b0027768125e24sm323139pji.39.2023.10.30.21.46.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 21:46:18 -0700 (PDT)
Message-ID: <6540869a.170a0220.d8208.1043@mx.google.com>
Date:   Mon, 30 Oct 2023 21:46:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-2995-g4088bd7f5d32
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 7 builds: 0 failed, 7 passed,
 4 warnings (v6.6-2995-g4088bd7f5d32)
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

next/pending-fixes build: 7 builds: 0 failed, 7 passed, 4 warnings (v6.6-29=
95-g4088bd7f5d32)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-2995-g4088bd7f5d32/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-2995-g4088bd7f5d32
Git Commit: 4088bd7f5d32a17f46f51f34f80284b19f79da13
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

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
