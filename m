Return-Path: <linux-next+bounces-70-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE997F966E
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 00:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA60280D50
	for <lists+linux-next@lfdr.de>; Sun, 26 Nov 2023 23:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7506712E69;
	Sun, 26 Nov 2023 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="uREkdsBG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E951110
	for <linux-next@vger.kernel.org>; Sun, 26 Nov 2023 15:26:04 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b83398cfc7so2335656b6e.3
        for <linux-next@vger.kernel.org>; Sun, 26 Nov 2023 15:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701041163; x=1701645963; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FUNpuC/xKPDoX7iL6g/kivGkIY0Q6EmL8whdCQ5d7hE=;
        b=uREkdsBGWv+lymf0IAqX+RVEflKBLcIiM/El1shqbqvnf5FX+xiC9qoRzrIsQI+ljg
         CazpzezipaNWyr2aM48N0i9th3PDUrXxjeHpD2M9Ys/fqvAEOTFAQJV9AyszlOen/to6
         VXxTzgb1W1J+1cbKYua3UsP73VKW6v0Q67nb8iu8BvDyF81tLDC0p6UXfexBOrVor3Nd
         NQkCoZsnTOLzmRk3m1hQQXeJy6pviiUV7wtQPtJtXs/sLTsDtseMae66dZo4lMYdE4MD
         edYqUKC3FO3Kuw7/W4A7ozdFLqqUTsj+g8FxPdIyWMifavWDRD9BQTfl65ks0kjybAX1
         VXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041163; x=1701645963;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUNpuC/xKPDoX7iL6g/kivGkIY0Q6EmL8whdCQ5d7hE=;
        b=F0bad0xfeh8uQ8DS8zGy3ubM/YRK+gpZDtrZ/KYk+Mm5ycfwVwCqFXYprFww7vcz79
         yJsS1olOSSy51z2jsbb8SeJonTahAakiGm2qEAaEpNmpanQsU8l7Y8O00xOY11J5qvcI
         LBW4d1y0Hy1z0OERzNUESDiVQPsTbPcpzygBKx6WraYdPmBqRflhrBnyXKIQP0nguDdc
         plSoL/hNWi5ho8TZBW4XoOr0tcyPfYeiWMKkN2r7lj4jKQQmwIFkvADn4Uyg6hejpmmi
         R0oK1zxWaZaWRvAQWHxTnS+V5yrG0slqmereocRCDHV3EUiFF0tvGNNOKnC89XzicFOx
         UJ/Q==
X-Gm-Message-State: AOJu0YwckvgNquIRPDALhuL8+2e9P8ff6sBCHLdb7OvUUe1Ef6KhgoPs
	wTvE658uVrN+tLyQnH96uEuzJ9sVAiFbboYR/8U=
X-Google-Smtp-Source: AGHT+IHtbmj3kbYZaJOtc4TlbfEqHq1mIybh2qmlVlypHzEAseIWnPi9FzaYrO76P/5ZpNZMnjX4Lw==
X-Received: by 2002:a05:6808:1211:b0:3ab:8295:f2f1 with SMTP id a17-20020a056808121100b003ab8295f2f1mr14404283oil.45.1701041163142;
        Sun, 26 Nov 2023 15:26:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o18-20020a63e352000000b005b1bf3a200fsm6743062pgj.1.2023.11.26.15.26.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:26:02 -0800 (PST)
Message-ID: <6563d40a.630a0220.3cc22.f3dc@mx.google.com>
Date: Sun, 26 Nov 2023 15:26:02 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc2-454-gc7607b4f01b34
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc2-454-gc7607b4f01b34)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
2-454-gc7607b4f01b34)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc2-454-gc7607b4f01b34/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc2-454-gc7607b4f01b34
Git Commit: c7607b4f01b34588b85ee3e48a1db6ff450caa11
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

