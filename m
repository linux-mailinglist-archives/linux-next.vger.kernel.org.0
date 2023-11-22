Return-Path: <linux-next+bounces-30-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92C7F4A2A
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 16:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFBE51C208DD
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 15:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3C14C3C0;
	Wed, 22 Nov 2023 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Pw+lV0Lw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCB9D41
	for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 07:22:01 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2839cf9ea95so3491387a91.1
        for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700666520; x=1701271320; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uTCbTggfdCMaFiEiDPjpnX2lZ9Bwxp/YJET1PHW91uM=;
        b=Pw+lV0Lwkwk0b+2Z97XLWIxMEjbgrf/FUGJqbcKsUO/5Mq37NstacjiTn7aB21uNIh
         kZsCS/fJawQquU5MU3HfgAtksTqNoypFoO61nxZnpMN+1pvHk+v6wNvb/WMX/cl5GUTb
         MnS+E31uI1OSdar/ta+v7x4NvOiObxiRfC+tPuGv7dTx+kXC63ZHmmr/SNADzGs9ut9G
         txX1Jss2VsGJHNgLuU1jPFkem5cYlPv8OimXOc3hTeV6Y6em97WJAM46rFL24z3tGBvK
         sQIq4qYuzWp5NBILrzksu+3rJah+3oWleK4ZuRsq2n8GalG1ZbQBrfYO0oY3NReKUbc3
         UqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666520; x=1701271320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTCbTggfdCMaFiEiDPjpnX2lZ9Bwxp/YJET1PHW91uM=;
        b=HjzTKv4DJQfTcqlq/BCA9Bymy7Rgme3BxN8qZxpkuGGXTifnZArdDYvvcPJ597ICDG
         GCC79FhCCGUZn3mJCI28XFk6rAjzNxVQoqwrH3ZLtQQfLNYH5udqeY9Ug29bDsbnH/TS
         JqpbHxovYZiXM9/kksvQbcfIBrwljNKB9ZWHGDJwnDLu7vcP8vwcW8QDdLSWpsh6nwjC
         iFyOsTNGsMi3gAzy0KyNoB0pp81wImjavIcuXYbJVnHimt3euyEPpwPwHfP6nrPqSZsa
         x351uQ7P9zOf8dXbjHEESa24jUaK9XS5KH1jWAuKKN0fnL9mt2TrHe66NQL8guGkSAMU
         pMHA==
X-Gm-Message-State: AOJu0Yypk2SWMQ2pTtnf56S6bEzAWb8k3t93Topuam6i2GXjfz+aExZP
	2w2mxZyN/qBS6CR2xAIx2pRsEnwKE08CRwuaVYo=
X-Google-Smtp-Source: AGHT+IHvj+FMznSg7DuuesC1Pzj/CRsaW4aBzyaNrPCglMPmHDoLxJB///Njx9mc4tsaFKFpdt+lVQ==
X-Received: by 2002:a17:90b:4d09:b0:280:14ac:a6dc with SMTP id mw9-20020a17090b4d0900b0028014aca6dcmr2986093pjb.25.1700666519981;
        Wed, 22 Nov 2023 07:21:59 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pb7-20020a17090b3c0700b002852528f62bsm1531983pjb.29.2023.11.22.07.21.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:21:59 -0800 (PST)
Message-ID: <655e1c97.170a0220.6fdf2.39c9@mx.google.com>
Date: Wed, 22 Nov 2023 07:21:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc2-192-gd636cd8a5dbf
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc2-192-gd636cd8a5dbf)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
2-192-gd636cd8a5dbf)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc2-192-gd636cd8a5dbf/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc2-192-gd636cd8a5dbf
Git Commit: d636cd8a5dbf63994ea232b77d0deb87606a7a1f
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

