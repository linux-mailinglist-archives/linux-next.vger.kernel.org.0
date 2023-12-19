Return-Path: <linux-next+bounces-453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BE818084
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 05:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ABF1C216BE
	for <lists+linux-next@lfdr.de>; Tue, 19 Dec 2023 04:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20821804A;
	Tue, 19 Dec 2023 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="OS+oYEuh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDD179B0
	for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 04:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6db963bd3acso648425a34.0
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 20:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702959973; x=1703564773; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZObwOIVErZs+8mQolzsfTPTNYgAol3069ySl5OE/hGU=;
        b=OS+oYEuhm5ILanv/I9PCaTgXt/jjfUbltAUSts/3IDolHPCk5fQfU9+HMIJphhbOY4
         jReTgIrCknPjgrBY9UqEZ4qyvybFWcXUIkKaze5vHsRkzQti9opxI84k+mI8T8X1TKP/
         dozDUn+GGd1zy790Su7Iv214/EAHL7fdOURU2DMIb/cF4oyHRr48lc4qmqD0pBWjWJZ6
         e6yhKBAfWL+VA7OGyXFMrWyx8MMadzbJPR8zZ5JHdSfVv7nVB+qowRFvi2xrbPmkmekd
         lpZ9fIFOZJ8POjzJ052FIHShz93EO+u9bokhl/1OQMwubH951HT2flp6dLhmcVz6YE6O
         9wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702959973; x=1703564773;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZObwOIVErZs+8mQolzsfTPTNYgAol3069ySl5OE/hGU=;
        b=OwzqSIursy7FjAnEoPkp4sgquDwV8roe/WcyK+iPEZl2xK0WMOh5DqATBoL/Inl7Vk
         mduFp8edQpgf1JpTVczk0QdqElJj/kHHWAnq266AHsMX5rF3dtirwcgHFXBv69HD6vow
         Sf3H2gs3QUfSvz9PpGMvT6D+4DxspxODGWIWo417WLmEg9ASciqKxo2zEs0L6GwHVhxe
         bcbuQs+uZKQ9ApcYROq+hztbOoGBnPPdshcn4YHsNU2vJH1aVk6WEHMwZG5zGxH/iWSw
         nfYllcEt7xliSUjOciuByhE0oKrCCX5ofSEuDp2gKcMT3iBVynwoSXHmnhiXdEtXMrbI
         CEjQ==
X-Gm-Message-State: AOJu0YwmDvEXPgC0dkQfkhwxYdtCbpr8gV2NjyRYICwcsezk5I2/MaTa
	xYo9aSf/ndl12ljau//GQ5O7FyK18nGKN8qVAT0=
X-Google-Smtp-Source: AGHT+IFDjV+BhGKz87rkqi1Q0XtTV1oa+ydt1+v536uvjyOXjDacOmT88kYeE0R+q/C9FzwtvjRY5A==
X-Received: by 2002:a9d:5e8a:0:b0:6da:5409:e199 with SMTP id f10-20020a9d5e8a000000b006da5409e199mr4092247otl.57.1702959973124;
        Mon, 18 Dec 2023 20:26:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h14-20020a056a00218e00b006d7dd95064fsm2445185pfi.220.2023.12.18.20.26.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 20:26:12 -0800 (PST)
Message-ID: <65811b64.050a0220.48235.719a@mx.google.com>
Date: Mon, 18 Dec 2023 20:26:12 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-203-g6c40edd32f70
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc6-203-g6c40edd32f70)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
6-203-g6c40edd32f70)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc6-203-g6c40edd32f70/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc6-203-g6c40edd32f70
Git Commit: 6c40edd32f7024a7cc59e69c5cbb6cd045ddd64a
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

