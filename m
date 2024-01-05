Return-Path: <linux-next+bounces-643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2E825090
	for <lists+linux-next@lfdr.de>; Fri,  5 Jan 2024 10:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 215161F217BA
	for <lists+linux-next@lfdr.de>; Fri,  5 Jan 2024 09:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4135422F00;
	Fri,  5 Jan 2024 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Fi2v0SdB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C504824204
	for <linux-next@vger.kernel.org>; Fri,  5 Jan 2024 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6da4a923b1bso915567b3a.2
        for <linux-next@vger.kernel.org>; Fri, 05 Jan 2024 01:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704445556; x=1705050356; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk1pAK8yZrndvSjm0E1DqI/mLdt5abaQ02LfK+PDvXA=;
        b=Fi2v0SdBTff2TbJgwzRHmSMxWiQAZiSIvBjzRUMpy0pLf56fdoM7GrMbRCmMKPvs0i
         hK+cudqfWueu/uCWBi/h60M2VOM/ZFKzwnHkjVZh9fQBmSQKtp+UQ0epDnazdcCXvctd
         N+9G8QtEMXnSCU0umz3vYSYD3YjBcRsGxVFD3uxgScD4C4naRmZ9OYAC4n57BiUXbKMp
         Ztr9AcR08IhTAtAQtG3ky8rsRDxXCbL8h1k86H3AZ0O1Vs7G9yBvrlisbOF45duSXbIz
         e7Lv9fI1BeKjZt4Pw59RD257GTZYguGH9DbFAvez0JwTMzlqQSV/nu4AupCyySus0p2J
         kjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704445556; x=1705050356;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk1pAK8yZrndvSjm0E1DqI/mLdt5abaQ02LfK+PDvXA=;
        b=wc0FIwcGndCcsLWdY5zd6RHntbf0w1LziICvHqzQTOoDiDASvfLoWoZzlBe+PrdSOi
         G7t8bhIatTa6QwjVyh0lQqq6sFpema1Vr+OzF8aw5NdzFD3aVkBRpJfUff3NfouWf3nj
         Bjxd24j9wwkkptcnEY8S0rV5cs6sCLSEGGzuh2E0+tILrm0hf5Q7R7PYxbOaCDhe0hz1
         OAHM6BH2GJSwWUXKRpkpgJ+sovebZzbr5knut1mm/aC9IQOilvRLu+Zvucpz2+2Q9Rrz
         JCxVchNpMFdcp2PUqjnLUrZauwBzVycKSQnl5Upqg7JidTIHuGhHIhTWT4FroschHgAx
         ATZA==
X-Gm-Message-State: AOJu0Ywy9Fi6AdjoDdGPYPRqs1Xj2RMMsNyKOUJ6GeHTmr/NIQrgrnEd
	andKrGSvnEJz3yFc61w+cpgrJQVogDQDn5urCLi4qIfZbX4=
X-Google-Smtp-Source: AGHT+IFO/waUMwY8APdxHus/MnyjAPRuTeEFI2CCMuuckFygS+U9GTdRK1lrO/slimzGN8jybtexoQ==
X-Received: by 2002:a05:6a00:a24:b0:6d9:a5ea:8521 with SMTP id p36-20020a056a000a2400b006d9a5ea8521mr1853300pfh.13.1704445556508;
        Fri, 05 Jan 2024 01:05:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a2-20020a630b42000000b005ca5619a764sm924232pgl.11.2024.01.05.01.05.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 01:05:55 -0800 (PST)
Message-ID: <6597c673.630a0220.be6e3.2010@mx.google.com>
Date: Fri, 05 Jan 2024 01:05:55 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc8-169-g2d1e9517c42c4
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 7 builds: 0 failed, 7 passed,
 4 warnings (v6.7-rc8-169-g2d1e9517c42c4)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 7 builds: 0 failed, 7 passed, 4 warnings (v6.7-rc=
8-169-g2d1e9517c42c4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc8-169-g2d1e9517c42c4/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc8-169-g2d1e9517c42c4
Git Commit: 2d1e9517c42c4cba4347e9fefb94e80e955eab5e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:

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

