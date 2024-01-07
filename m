Return-Path: <linux-next+bounces-655-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536458266BA
	for <lists+linux-next@lfdr.de>; Mon,  8 Jan 2024 00:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639241C203B3
	for <lists+linux-next@lfdr.de>; Sun,  7 Jan 2024 23:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A57125A6;
	Sun,  7 Jan 2024 23:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Blo9gJRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63093125A5
	for <linux-next@vger.kernel.org>; Sun,  7 Jan 2024 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28c9d424cceso785297a91.0
        for <linux-next@vger.kernel.org>; Sun, 07 Jan 2024 15:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704668736; x=1705273536; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6WzcdxLWhWEoGbNLvEli3hlfbr8hwBbLWn9r9pd92E0=;
        b=Blo9gJRDX+AycOL4mj761LilhqtxGemNghPf9FuHAE857yXB6Qe4DVH9XWqE8V9nlr
         YKs4v7fPDf7ujtxIOqTosRXfsrHPFUTnfZgQmck4uevhBS+sGOVGf6RmfPtGWZZY7NVU
         wZmCZclDn88hW7pzMJLMnZky1X8gpOhavWMF71Nni8JTQolqsmqjSm9m1Lz98kuXwlMM
         /QhGF1of9B8VlxfLKS94w/lNS/3gMnaI8MW0w3oclVf/MBbpelI6G5yN9+HJGVAxwbdt
         dznEGAD+Jfmk3isrnm3RNqT+tc2QpB2v62ewjYS48caDHpHTALogBB2u9tQ7KrGuyoyW
         9nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704668736; x=1705273536;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WzcdxLWhWEoGbNLvEli3hlfbr8hwBbLWn9r9pd92E0=;
        b=sdP+dKz4ya0tl7Ben0ZLUK3Vi42BQYbtW6NXbSfMwSUKytAjohLtlCY5xb/ThgxZZj
         M3hXzn0YrlrxfqO9F5qgnjzl+y5Noh8V+M5QJIWtXRB0LYzscFzrEKI9n/fWfz08pzYk
         GFgQE0w/YDave4/QSwg+/I0YU30LZ8A44t1jc5gFb/9lKMpfdYf+23fLUIEvm1nU8b58
         5VAyqqR+3Uk2xLpYi+2G/dbFbX6Mlta7OLaLq2B7uTtmI/cDTXO0eT5AIeyVWyTeq/Xz
         r/akzQXiZ/QTBsySKVEM4c/sPPykyDh7jIg53JFqGEXLd5yttqv4aR5ZEXFsdwRT3YZN
         JHig==
X-Gm-Message-State: AOJu0Yw5wmZb0A+Rx/bh37lKZsrpQtKEsOXDYGPgu320tgeKIIdCnUNg
	QElBCd1stz7828dz37Cr+oz/QRIsAyPwTxp65ms+x9RAKno=
X-Google-Smtp-Source: AGHT+IH/emyHMVw3dKuvgzaAkmhEm0PB/UWkW6/PAaWCUCSBvk29533SXxRaPv0XIN1QAu9Nm5cadw==
X-Received: by 2002:a17:90a:be16:b0:28d:3712:4cf3 with SMTP id a22-20020a17090abe1600b0028d37124cf3mr2527424pjs.2.1704668736069;
        Sun, 07 Jan 2024 15:05:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pq6-20020a17090b3d8600b0028c952fd855sm5002914pjb.52.2024.01.07.15.05.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 15:05:35 -0800 (PST)
Message-ID: <659b2e3f.170a0220.cb1fa.a406@mx.google.com>
Date: Sun, 07 Jan 2024 15:05:35 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-37-g1e1ee397f195
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-37-g1e1ee397f195)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-37=
-g1e1ee397f195)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-37-g1e1ee397f195/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-37-g1e1ee397f195
Git Commit: 1e1ee397f195d619ac9975001a5d9f71f0dbcbfe
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

