Return-Path: <linux-next+bounces-304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F58980BE8F
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 01:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B5A280A98
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 00:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8100415A2;
	Mon, 11 Dec 2023 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UcZj9WIe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DAFEB
	for <linux-next@vger.kernel.org>; Sun, 10 Dec 2023 16:50:25 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2868cf6cb82so2889347a91.3
        for <linux-next@vger.kernel.org>; Sun, 10 Dec 2023 16:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702255824; x=1702860624; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nc5DdYp9UsnPsN27qTjFmyB40bs89VF+sRM9kEkoRbU=;
        b=UcZj9WIeMQqg5mJ2pVd4gsCoK5TJV1rC1B/7D0gVgTKU3W1bSEKLLeZrvbsk7MN59d
         DNVVzfp0xLdhqDuWgSfDmLWRkXyp/Czh8NmS8p0cL7JQZmqXWhUjOAEauu9oFdinJ48L
         uMKZbbK1Cwkslk2Fj0hwuOGQNqhW6exaAfXlgwHmrtZktcFyttmRZL+weTmB124caMIr
         OEbhrnKJXZlLfY/Us3KZxHRmc/4uXg99+27K6NQXz/KPkfGI1CiSpmHk0xWqcjCoUsoo
         NEPr+5j4ngB3Ozc1ay92lqnmMEVRN82dqSNO0Mk5AET2TqStoAmeHpJOINXvOZEMZp1I
         dtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702255824; x=1702860624;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc5DdYp9UsnPsN27qTjFmyB40bs89VF+sRM9kEkoRbU=;
        b=ocuCfIq+VgUEf6eXfWtlGauqJ2q6L5BxwZvsGvtw2VT123i2Gpr49gWUDcNLr3aRbt
         e4S/e4oWU3Evi1QBfkPk+q+E+a2wQLEDgRtLLPtYih/tBYEpuaXT2r3frRhIQoz00vMN
         MlALHxX6Q9hlALnVvngJAo/2pudbKqhVNysVeXZcv5slt6MIGYB3fnQJqPf2IR7H5N7Z
         JRfJIsYVSFi/co//a4nkrGvHGoiHK5yBCfj9BoRGYiro0XlHUVb6oKDETMCNXZ8mZ8uq
         h90Yx2SH5QF9e1TdzTwjw9rVW5s7B8LCufRbYyfNxWwJ9vgiJKvtxdzQpbkv64v7VXSu
         X2bg==
X-Gm-Message-State: AOJu0Yw2feoK/+59JJM+aEgRGD6cCSQg/E1ADUcxd9j2kka8bSrrZmmp
	vhR3udMBFS75+cHsT1Q5Ripq3OzWWE3j/a7WFoAuTg==
X-Google-Smtp-Source: AGHT+IFPhw/uLpWWyvaMwzSCta7kQIBuQWWaEe4RoiuclSNWbRxjUCeStQTZFtGB3DQ9p9j6dfpB3Q==
X-Received: by 2002:a17:902:db06:b0:1d0:8383:7433 with SMTP id m6-20020a170902db0600b001d083837433mr1360547plx.36.1702255824602;
        Sun, 10 Dec 2023 16:50:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p20-20020a170902ead400b001d0b5a97cabsm5310248pld.124.2023.12.10.16.50.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 16:50:24 -0800 (PST)
Message-ID: <65765cd0.170a0220.2e2a3.ec7b@mx.google.com>
Date: Sun, 10 Dec 2023 16:50:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.7-rc4-604-g5336570f87c90
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-604-g5336570f87c90)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-604-g5336570f87c90)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-604-g5336570f87c90/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-604-g5336570f87c90
Git Commit: 5336570f87c901f966fbe40006777f1c8e94626e
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

