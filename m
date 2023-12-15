Return-Path: <linux-next+bounces-401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B673813FCE
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 03:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E3B2812DC
	for <lists+linux-next@lfdr.de>; Fri, 15 Dec 2023 02:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A049F63B2;
	Fri, 15 Dec 2023 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="RNdCvoFl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0263A9
	for <linux-next@vger.kernel.org>; Fri, 15 Dec 2023 02:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-590bb31ccf5so177205eaf.3
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 18:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702607578; x=1703212378; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oYq9t5wMJdvS/+Umx3c/QOWUFn5EiDGFs/AG/Tm/0lU=;
        b=RNdCvoFlPKGdRUbgGq+lyyrSBIERK5PVeSFl+k4L8Twj+04Jz0C/U622tsGGq8JLWI
         01u49/66u+AdrR8v0Rfv+cbD1ZlF0PIApeJ1oBWt2xFrJsGTkWwkPCfICk4tPWhU0LfE
         V7bxHecO+FiDI4NCkPPOVEDVj+SLqNzZayou2rbGhBsKMavgSEA53kM3H/ISqiReIa/U
         tcwDTVj63RLVejn1ywuwFlHBcuDVF+/4QxCOpdVxsZzP1iWmWFGhHrIJAYlMZxHzwb2A
         nAvQeigqr/gTDUuna9keXmPck2blNTEDxe/1nHg9f1ary1KxXEX+1xCRkIRiStgXO0ha
         USHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702607578; x=1703212378;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYq9t5wMJdvS/+Umx3c/QOWUFn5EiDGFs/AG/Tm/0lU=;
        b=ewjPGe2UIf0gwr81ksdFCUYOnnBtBBeu74p9pUGjVqLDjC9tUIPaEKTimQx4Gjyzu1
         kMUGnbYe/wNG36+eLFWO8Lbt+eph8yj73xInA5K/7HjxurFYZlVfZ5ShlJqVejkZ6Erh
         nnbcKF9MqZ1Z9RbxHvFpvMuoUUo6kWbnfTCKN/XBLZjR2mPFUnYN753QvFpy3shH5t+A
         u7F4+7PMhz39wT0h4pCRjC5C6PbjhOPTLoKW+yjwh7hiLhK5I5PxD7h8lxdIuRy1aiDD
         tjZHLODIlBh5bdSvZ6sV2u05I9MH2rdG0WwCOoIRV5SUwAvBIKwIxDrzRSYiNhkMDv6E
         Xvog==
X-Gm-Message-State: AOJu0YxRGwi3U4xz2zpDDF5g1RyFuSxVqA4I9hCVEYPn75HAuBTM2ta+
	WTnkocWMj6j2BsiZwt1P9PwGI+SIXWrlmqpHRRM=
X-Google-Smtp-Source: AGHT+IEMeHk8R1phBd6OPY0xtHPUrIVi2tV/oO80U2N0jFZm0TatQNKeOXAHSNrd1QjtAiN50Vm6qA==
X-Received: by 2002:a05:6358:3106:b0:16e:43a1:687f with SMTP id c6-20020a056358310600b0016e43a1687fmr13563573rwe.4.1702607578384;
        Thu, 14 Dec 2023 18:32:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id pq18-20020a17090b3d9200b00286dfa09e7asm13844822pjb.24.2023.12.14.18.32.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 18:32:57 -0800 (PST)
Message-ID: <657bbad9.170a0220.e18a1.c2da@mx.google.com>
Date: Thu, 14 Dec 2023 18:32:57 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-313-g501631e4f287a
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc5-313-g501631e4f287a)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
5-313-g501631e4f287a)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc5-313-g501631e4f287a/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc5-313-g501631e4f287a
Git Commit: 501631e4f287a33cbadd40c7a8ae137a125b0ca1
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

