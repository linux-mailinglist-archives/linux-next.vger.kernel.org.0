Return-Path: <linux-next+bounces-56-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D37F6ABD
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 03:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB86B1C20962
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 02:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A43A635;
	Fri, 24 Nov 2023 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SDUtZVqz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA16CD46
	for <linux-next@vger.kernel.org>; Thu, 23 Nov 2023 18:40:14 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2839b922c18so1128965a91.1
        for <linux-next@vger.kernel.org>; Thu, 23 Nov 2023 18:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700793614; x=1701398414; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZxbnNvSwcGgxQ00Uxy0y7IbEcuGviJMJpA7gzSlH8k=;
        b=SDUtZVqzxHlvfHhg3uCGtRD3CRPfbybjRhKxzUeMo+Kiyy95Q7v03nHyZoiestXXNr
         FrRE3O77S+DKk5KG7wLsdknA/BfCeXJOMkrEIoTx3j7Tr+Mqu8o9xm7NK01d6ga8c42T
         feWYTYW2OHgHaSqMfT7s84gMOXN6pAvxTEDNH0aCT3ztK9f9ESokHBQXKPaWhLoeMRGR
         soGEgrLszLDmdWQONcrWSI+tdfNLCBk++5LpqWirzOTYCytcggIUsM2hLCUNWehuy9Eg
         pvXXn5uHNqAR3KCT3vMjWx1xRvF8VOIRrN/rR63MUo/YkibnryU3uVsQznDqcia9ApiR
         6jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700793614; x=1701398414;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZxbnNvSwcGgxQ00Uxy0y7IbEcuGviJMJpA7gzSlH8k=;
        b=mQ8Rmrk134Gat8NVcooMqrWH5DiEByNbg+mB5mMsbj1xWgiABQzr6ZwjClU7TSD3+U
         RZBZd+rwnOAMI/A9s2l5yvO6CBgw7ZIV2c/ONmO+pTekbRfSv4pRpCfyvPGtZJHObthE
         ZXOJ40zhkYNTaW4vPB40i2tW9MfWvVl9aAzl9+3h2DbC0XlWKp8CLbJSb6+rBHLMYGbs
         w13dK5U6EVhdq1ETNFK5X2Q+uB2D1UZoZFC6dM/OwsHynjXkXw2KOyOPeF+Wb4Zw4YpJ
         Y+7F9fbGoj+atpks8NuiwN5kgheUapI/3GRD5XPiN3pvd1q83wGwJyiNF91tIdwngyGg
         COGg==
X-Gm-Message-State: AOJu0Yy99gYRnt+Yh1jOAfK2nSrwUsgHOOrdcynzafqgTltkgGdFtRJ/
	cljJx5r36JPFhFofQkw8VMQaqYZJIR1l5124aVU=
X-Google-Smtp-Source: AGHT+IFk/Vakv/yFrJHGrKj5LWAr9js8RPI0OrPWiXbGZKCldYZyE21sQjdm/gHMHhQ3618KUGX+1A==
X-Received: by 2002:a17:90b:4a4b:b0:27d:4282:e3d2 with SMTP id lb11-20020a17090b4a4b00b0027d4282e3d2mr1280445pjb.30.1700793613687;
        Thu, 23 Nov 2023 18:40:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q102-20020a17090a17ef00b002851c9f7a77sm2419054pja.38.2023.11.23.18.40.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 18:40:13 -0800 (PST)
Message-ID: <65600d0d.170a0220.41fac.74f4@mx.google.com>
Date: Thu, 23 Nov 2023 18:40:13 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc2-287-gd58dc32d55f5
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc2-287-gd58dc32d55f5)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
2-287-gd58dc32d55f5)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc2-287-gd58dc32d55f5/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc2-287-gd58dc32d55f5
Git Commit: d58dc32d55f5a6d37ca0b50891859143776e650b
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

