Return-Path: <linux-next+bounces-101-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F57FBCE7
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 15:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C98841C20ABE
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B14259B73;
	Tue, 28 Nov 2023 14:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lub/O4fK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9843BD64
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 06:40:29 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b83398cfc7so3392901b6e.3
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 06:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701182428; x=1701787228; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xpi7lkcSLBngeLBFaRES7zfZc9PiXb+QkPJoAc+uRFY=;
        b=lub/O4fK0MKYAGmh7EnuZxhMXe9xvU/qqM2r3m9n5HDO1qL9czIAPsYP7qOZ+teUBt
         Sj9TEvDP5HGfjMBS8W1G2GT5QHV9MjmibGoDDRTgVHJnrs0k5M24Xd0z3y8F/3O9m/Wb
         bbBixIUwsfJgDJ9nfcE/1PcV01yD9YAUE9ARrAIF4UwavkqAjMquWFM0PIUvN37hq+OD
         IYnP/5jGtRysBbg6Xkr2xR8ZJQQqiJ1B9TOmweJym8sd48mAkXWaKkLAbGex+0NC0v9a
         ++fS0WEeCSJKfSllc8jAcKMno7+nvRgxhYFKsmgAR5e+Hr2/sJk2CKty79hBzbFpyqqu
         uenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182428; x=1701787228;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpi7lkcSLBngeLBFaRES7zfZc9PiXb+QkPJoAc+uRFY=;
        b=cKqX7hYwJlELko0wOQIzM1zGf3fUhxji/7WurIsnaZhuTvKIc+cTeFaA/W37oQrWUn
         Ddp9d5oKxEEMad5FTY8xfIzxOEIPEetC5HU0BUFC81tGPatInppTANrZMIFueo61UFw2
         qVf4CIhPp9TlJPzZkgsluTuJq8GOq/bZlfvIbJNKpqcwGAF/4+rTdMDJ76mOr/AeactI
         LAzUWzztT/DRrbw6SM96d2vacy2p4zoTWS7KwEtDLNlvrPvANP3VQujkpjilRma7POXF
         /W+4RPGPDI14f0LQ4BuueP8Re6DGobJH82z3kLxpKZtVrIVshn93K+W1bV9lm1Nx+xdS
         aXNw==
X-Gm-Message-State: AOJu0YzkpkPwwkZEEGf9+slye2Kqmxq9WNl3WIExup+d82zXh3RDemv7
	wuscM+l5zjQ7XW4AeEvpFWpDN3vEFhQbMjOR5IE=
X-Google-Smtp-Source: AGHT+IHDiN4hiaiySbfriCRaU+tnjWAz1cP4+EddINF3ijGlJSuBv3xkhDwKdKPBdR0aU0Be717Log==
X-Received: by 2002:a05:6808:f12:b0:3b2:dab7:e6e4 with SMTP id m18-20020a0568080f1200b003b2dab7e6e4mr18855763oiw.6.1701182428056;
        Tue, 28 Nov 2023 06:40:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ch9-20020a056a0208c900b005742092c211sm8256023pgb.64.2023.11.28.06.40.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:40:27 -0800 (PST)
Message-ID: <6565fbdb.050a0220.4e6a8.2960@mx.google.com>
Date: Tue, 28 Nov 2023 06:40:27 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-220-gaeca85031d1b
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc3-220-gaeca85031d1b)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
3-220-gaeca85031d1b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc3-220-gaeca85031d1b/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc3-220-gaeca85031d1b
Git Commit: aeca85031d1b22c716e2de91b791f0cb13bd92a6
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

