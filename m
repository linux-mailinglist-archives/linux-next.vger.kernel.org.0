Return-Path: <linux-next+bounces-350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6F80E3BB
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 06:20:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29BDDB21773
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 05:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C738168A3;
	Tue, 12 Dec 2023 05:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="aV/ryQJM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96108CE
	for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 21:20:22 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d2d0661a8dso53139467b3.2
        for <linux-next@vger.kernel.org>; Mon, 11 Dec 2023 21:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702358421; x=1702963221; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2hmMOlIhx0TfJqI6iilCgulYh1Ad2Yn4GoWrBcYOc/I=;
        b=aV/ryQJMnLX8fYFSFPZZbl3T0PRN2BWar4CFCkjSXoSA44d8L5S2rOCpRLJmDZIn/q
         8g/Qr3u+O5Nt1T1mWFGtfie7qgzNfQkT4vFwWYclMpIqRkNqLJIXnDEqLWxVN7+1Jirn
         XTqwexDC1k7wTszzjCTVg7eK6qpyhEApEnRAnkekXYJ2HAPN7HM5s+pCFXJNrWwjHXkI
         YCyssQ/23lffbdYaY0XGl3lXOUoIkUBMJpuq057ifoxyNLb1LrBO4s0dSWMcYjlIg4Vg
         oeRWQu6HZa8ko+na/B04Zs8eJuMXedqf1ZqAd7d22fapO1HmD7v3fN2FOiE4xX0XZccu
         Fq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702358421; x=1702963221;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hmMOlIhx0TfJqI6iilCgulYh1Ad2Yn4GoWrBcYOc/I=;
        b=CLgxVM/PsguZEwvW+38DqNyuEhCD9VioRNkyB+ADBsskejcp6TMlleNSs7Ga4jH8rR
         rVl4GYepNXS8IniPhUeqxbxKh0tB+3hyuO9Z0ClN+NafrW3OnUFhnk1h+NvW+u21zDZS
         x37UBp0Pvo1wSM+qXbycUH6byA9xjucidGyQMo6YsYnmih+MqeI/fM2akxhuyW27ageG
         XH85vSygNdD6WpNcDvUxvFuR5csifz7RRyogzKYdL9E9Jwf0GG1IlFSKnJ5eAoVKY/GV
         hOhZ35T97DAbG2HXm8r5yVWM0TwAAwqCgjKKiE4uNPrslTvoiS66+Y8Imw8Lkz5QavFT
         1lQQ==
X-Gm-Message-State: AOJu0YwUDWjpKDI3k/flVKR/0I73zoO2zfZnXVt3xxoGlgndiCifayYf
	tlx29pZhdOhKOpvC0/uK2aLpWKQYv96LM7PSmqpQ3A==
X-Google-Smtp-Source: AGHT+IGWFrN0ZF5Fm7huXV+nQTTybdLtdfTGLyPXR1tEDfvUpbbv79J7U36psi1JXXXelF5dyMoRqA==
X-Received: by 2002:a81:b650:0:b0:5df:4993:20d6 with SMTP id h16-20020a81b650000000b005df499320d6mr4325926ywk.26.1702358421367;
        Mon, 11 Dec 2023 21:20:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902c18b00b001bc6e6069a6sm7633085pld.122.2023.12.11.21.20.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:20:20 -0800 (PST)
Message-ID: <6577ed94.170a0220.dce07.6a8c@mx.google.com>
Date: Mon, 11 Dec 2023 21:20:20 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-185-g633201d380c5e
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc5-185-g633201d380c5e)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
5-185-g633201d380c5e)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc5-185-g633201d380c5e/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc5-185-g633201d380c5e
Git Commit: 633201d380c5e2ae4efca694cc0b1a6ed50e4d81
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

