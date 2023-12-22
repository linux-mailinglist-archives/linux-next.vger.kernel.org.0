Return-Path: <linux-next+bounces-537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B781C340
	for <lists+linux-next@lfdr.de>; Fri, 22 Dec 2023 04:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96FC1F23E1B
	for <lists+linux-next@lfdr.de>; Fri, 22 Dec 2023 03:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D85EDF;
	Fri, 22 Dec 2023 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Wd5dhfwc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC4ECE
	for <linux-next@vger.kernel.org>; Fri, 22 Dec 2023 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d3e8a51e6bso11877595ad.3
        for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 19:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703214091; x=1703818891; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GO0cSoQ0T6de0JpdymYKH+UrEpWxVIZ9Ht73af4Cm5A=;
        b=Wd5dhfwcKWp/mMXJhoW4K/sq0Ka2nqy/HVFa4R4hzVUCWsqfBlfiHm6t457vfXzNWj
         vOIVRiyAWmRuFFza5D4OwUQ7eiFPJqJwPx2JYgX3oH9l9Bels/MexJjXtVc2DlljnQ+G
         fWjme92e1I5NF9s7KXfQBXGYwJTSV+YzqeV2PGwvFFzrlPkvVRJUYIKeTGhy0SRKRwIT
         Rk81Klf/qDtSD+J8VJ4WOR7MF57w2SZ2qjHuahR+f8GaKZWrZN6gXLfVXLblcz2nCVQs
         P7EM68u++eGU92WlLUS6K7iz+/pfZITryZozpU9/yWUEK7vi5vUV1zpsIgVoA2GM9QKd
         7JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703214091; x=1703818891;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO0cSoQ0T6de0JpdymYKH+UrEpWxVIZ9Ht73af4Cm5A=;
        b=PvLvV9e/bX6V39dHwd/laqHCjd35VGPnxWfrgcmBp68oy2UZnQM3tKLP2zexkt1tab
         7dL432pFktZM3qcTLA3U8GQT2fckNJIgS/6p0prlMgY3J+IVx2NTcpe/nkZHTKD7Psbg
         NbKxLVzM8PAd2UfP3N0Co3cqg1OQOtdiYgXFOKrS5tUc4GsrWd082KGHsy9NZ+WXIVq3
         gLIe8EyAVscqZMIoOv2XEYPSwdUDTLXN2LwSbTeYNeI75+yrdD0Ge6zf51wFReQFXQ7g
         GMZX8FuldiuVMnOjoTrI4y+zvWEP5C7gT9SqvPU7D1TuLtC937BfzYu4nvpokOX1bOjd
         6LnA==
X-Gm-Message-State: AOJu0YxSamh8v06RS51QA1rrovULxjbbNmj8mx1HnUUJOFR1M257PPQm
	egGX6Ah3twOuaBtqxBQGWuIEyDeWakjwKa1LfPbaLeO12pA=
X-Google-Smtp-Source: AGHT+IF5biHZ4l9AnHXtCdNkQ1qYl7sRr8NyGROjF9VjJJ3PZ8PO0Z7i1dPQsmii9AZZTXnND1b4dg==
X-Received: by 2002:a17:903:22c1:b0:1d3:ea2c:95e8 with SMTP id y1-20020a17090322c100b001d3ea2c95e8mr701303plg.129.1703214091182;
        Thu, 21 Dec 2023 19:01:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902e54700b001d0cd351baesm2326382plf.13.2023.12.21.19.01.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 19:01:30 -0800 (PST)
Message-ID: <6584fc0a.170a0220.e18b2.826d@mx.google.com>
Date: Thu, 21 Dec 2023 19:01:30 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-316-g9711fa59aad96
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc6-316-g9711fa59aad96)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
6-316-g9711fa59aad96)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc6-316-g9711fa59aad96/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc6-316-g9711fa59aad96
Git Commit: 9711fa59aad96ae77753ce166c61743206656d83
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

