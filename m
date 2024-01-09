Return-Path: <linux-next+bounces-683-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310FA827CEB
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 03:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79C70285664
	for <lists+linux-next@lfdr.de>; Tue,  9 Jan 2024 02:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB432573;
	Tue,  9 Jan 2024 02:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="UXwpeIvM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012A187E
	for <linux-next@vger.kernel.org>; Tue,  9 Jan 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d3ec3db764so6829665ad.2
        for <linux-next@vger.kernel.org>; Mon, 08 Jan 2024 18:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704767554; x=1705372354; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEkNMWhtPOifz85q6viqmcAU1LNlutH93fwe8bX67B8=;
        b=UXwpeIvMrb7CeMCyWp9zJ40i2HbU0dOc82Jh7kKawm+z8PDuimWJMcc7Yqd54uI4bc
         2TaJGssb05VnwirW5MBoIid+1ynVDhYbXccJ4yHjGdYCnFgol3eqduLMS8Eq6YMOnOZL
         9tCydqbhfa5l/kKhoVnl38CtpUt5ur0LORVciaLqet0kDfTiup1R4GIusIGmnuf4vfmq
         7y02GJLyo++2iav7J4yTdpCyNiM6Kccwgahpz+Itc+bPi7hQlsVCgKHAvGjuobCVVBLk
         kFQDkPgmwZwD+06F7mJ0XYowPedmtHNvxsRBfxsvgxJBucT3UaCc9cyAI0B39C61sH7n
         f8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704767554; x=1705372354;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEkNMWhtPOifz85q6viqmcAU1LNlutH93fwe8bX67B8=;
        b=WhnQv1G9dpjnUF36I1DL/NWAhze2gIwYiTV0B7GZSHMHnZHj4J/5bTmNZY+IkdqUSv
         EWBXVqWPg9NcoetcnT+ixkucmWG9VckaZAvKsBEZhmnrJAJzxv8EgkTjPw53B8A/1Vfa
         13VFW+GAbqE7Lkwvdb1tppy8e2xqTYvN42oXNg3KgpAWs+q+EN2F1nx8qxoeDQqjE+CD
         njwejmG1kUkE6JjIIK3klztbbUWiCP9A8IpA40NlqD7DXZxWye2P4YNxnDYVs/KTfHxi
         Fe2TKuoEIbQmsKYUCfWDHJ9bZhfb7gML+7mmKIgo/yajjZwqQX8j66aFXrzt/0QYM+Gn
         TSnw==
X-Gm-Message-State: AOJu0YzzgJuEDuUZRH4bwo1lhMfEu/nDuckWa4kDo/qSiRpC/NIV6fBx
	jUlG8HF9AMlk1IOsKVHVmVG6+xAOG6PJbEzEn0ZcFYWmGio=
X-Google-Smtp-Source: AGHT+IHOXSW+pnu74hEfH2h2CskOdMGIpgQSDuNovYXkemrSjuNU7XOL89NvrCrg+bDf4dntDwV4EQ==
X-Received: by 2002:a17:902:7485:b0:1d0:6ffe:1e7f with SMTP id h5-20020a170902748500b001d06ffe1e7fmr2213458pll.98.1704767554265;
        Mon, 08 Jan 2024 18:32:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b001d4872d9429sm562305plb.156.2024.01.08.18.32.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 18:32:33 -0800 (PST)
Message-ID: <659cb041.170a0220.2d09a.3e4c@mx.google.com>
Date: Mon, 08 Jan 2024 18:32:33 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-530-g1593fdc6832f
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 1 failed, 7 passed, 2 errors,
 6 warnings (v6.7-530-g1593fdc6832f)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 1 failed, 7 passed, 2 errors, 6 warning=
s (v6.7-530-g1593fdc6832f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-530-g1593fdc6832f/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-530-g1593fdc6832f
Git Commit: 1593fdc6832f58f66843e2abb40b21ccd65f12ad
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failure Detected:

arm64:
    defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    defconfig (gcc-10): 2 errors, 2 warnings

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:

Errors summary:

    1    arch/arm64/include/asm/unistd32.h:924:24: error: array index in in=
itializer exceeds array bounds
    1    arch/arm64/include/asm/unistd32.h:922:24: error: array index in in=
itializer exceeds array bounds

Warnings summary:

    2    arch/arm64/kernel/sys32.c:130:35: warning: excess elements in arra=
y initializer
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
defconfig (arm64, gcc-10) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section m=
ismatches

Errors:
    arch/arm64/include/asm/unistd32.h:922:24: error: array index in initial=
izer exceeds array bounds
    arch/arm64/include/asm/unistd32.h:924:24: error: array index in initial=
izer exceeds array bounds

Warnings:
    arch/arm64/kernel/sys32.c:130:35: warning: excess elements in array ini=
tializer
    arch/arm64/kernel/sys32.c:130:35: warning: excess elements in array ini=
tializer

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

