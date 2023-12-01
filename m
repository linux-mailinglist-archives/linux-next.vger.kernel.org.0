Return-Path: <linux-next+bounces-175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69B8001DA
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 04:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD001C20A30
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 03:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A817917E1;
	Fri,  1 Dec 2023 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EleiCCi8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA8D1715
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 19:03:51 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cfc3f50504so818165ad.3
        for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 19:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701399830; x=1702004630; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=45Yr2NmPP/UL5d2s7x/UTEP2J+rlOSHYVrdNwfglEI4=;
        b=EleiCCi8qKk4Mrio0zeEIxB0TcH2tw25uSZVxvCNBe5Pz11riN9789mHv7vFJkEEKa
         ATbnh4ysz8GwUrI9w+OQe4W+s5D5hNYr5UapQeTUi9iSb51KBm156B2Ar4YNsqyl6jX0
         ej7P/3xgliV/bnl82woPXn6uwnpuEJuaqeRuJebybchKFYY3YfdpqLZJKrBMRgzybhyg
         OK3QAsS5fh/zwtHH2I7ltJjApilbXbFi6XP0Obzc7chgnATNavYd7Av0oTWWbdhXCKof
         ATYkCpiCD64bFog4lR9yltLwpequvYaxoHiORSL0AD+kgel8oAI59O3mAd4H9KnVlIZ0
         s6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701399830; x=1702004630;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45Yr2NmPP/UL5d2s7x/UTEP2J+rlOSHYVrdNwfglEI4=;
        b=uTUnK32B9K2gwxqKoWlIKFc3r3GZuE7DHGtTd2sRveKTXXypzRypDyQ6VBaaADDWpF
         Jn4vDgCW6+x/WLxcs4iOq93Vl6o/eRWWcEfwsAw0PaV2UxaUS/nFeU328yfzNvzBbq+d
         yCBWxC6ffl+OftUbsv08pfQ1Bb+MwxnQbFlP/yvr2DyJ7RZu47tSWXcbig/I0PzEYXog
         grreamHrs1NC3lt5X40A61xs+pD36gY0CkMB0zLCo3p+ic1ub4oSkObriXmoaOX6H0UM
         eZ/gzt0JpevbI/S1A15b6tRxwSqNN9D3TpNmn/UwgcMx61dDhSxUGMvEsrkzsgm9+gXq
         DX7g==
X-Gm-Message-State: AOJu0YycrNalk7g45jMiVnRWL1fiDpSYcg6xSYlH5iZNhHN5ReptgMuu
	+ymNxDd1zOwzK6AqxAxl7ZyCx3b5i6RM4cQ/2N6fcQ==
X-Google-Smtp-Source: AGHT+IErTBjI/rT6TX1FyZfkR+yzaCQPYPX7WXSnxOVqCQSOhgyFyHYylCCknRVTRDzRAfr7ifku2w==
X-Received: by 2002:a17:902:ce8e:b0:1cf:bd98:2741 with SMTP id f14-20020a170902ce8e00b001cfbd982741mr18227874plg.63.1701399830579;
        Thu, 30 Nov 2023 19:03:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2139099pll.116.2023.11.30.19.03.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 19:03:49 -0800 (PST)
Message-ID: <65694d15.170a0220.90f90.7262@mx.google.com>
Date: Thu, 30 Nov 2023 19:03:49 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-326-gebf39ec4a6f74
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc3-326-gebf39ec4a6f74)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
3-326-gebf39ec4a6f74)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc3-326-gebf39ec4a6f74/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc3-326-gebf39ec4a6f74
Git Commit: ebf39ec4a6f7492899507840c2b78a4be29b7205
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

