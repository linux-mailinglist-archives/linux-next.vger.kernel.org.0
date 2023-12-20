Return-Path: <linux-next+bounces-475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A58195CD
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 01:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11CD1C206FD
	for <lists+linux-next@lfdr.de>; Wed, 20 Dec 2023 00:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6C223B8;
	Wed, 20 Dec 2023 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="vuKEytuy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAFC23AF
	for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 00:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-203fdc82937so461556fac.0
        for <linux-next@vger.kernel.org>; Tue, 19 Dec 2023 16:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703032961; x=1703637761; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cIw0nnk/AxQgWFDfklYu40xaoPUg3IWDRouLyXoRfvs=;
        b=vuKEytuyTMncfd70+v05VwqjCkhqLx//KJh0ai9aiYv9GV8o8CHD02Gm3JQlk2rXoc
         KdAJV+IMmQqnrUsJkFJe5U5bmLQQNwIq+eN7C2OIAxwkcHkXh8NNt3KWaFB26XudTYUr
         MQunahDOx5CbHUUzDy32Pt+uwfrXXhdpVY5NlBENd3dufZTSyLIwmMzn+1mt3ntXVA1m
         4EcaT1Y77hHqBTGE9zawMO62xENYrlVlyIH7dIK76g3XfErICXdBd/+m6WZXkfwsH9Lw
         duqSNRciIo9wPHK5/qZILH0xxwFrhJDYiNyb4XkDikW8PZkZn3xv5ivjTQ5DhylcxKup
         JLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703032961; x=1703637761;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIw0nnk/AxQgWFDfklYu40xaoPUg3IWDRouLyXoRfvs=;
        b=aRuXyF3xAXwt+UMb/lUQV/4q5R5gHUyecXMYlm/oooLaB3eY5vB9hryYAc5j4zgGfD
         DnSZc6n4djR6lasMfeWwuck9OppsGPqvBMQc4usly1m7uKFFkDu69JeyKijr45MnyptV
         iv5LP3N6usGn1JiTH3xHlenoI1KO4IJmD/XOjdSUUzXM+H/UH8vOyhEhKFb43Hfs5+1L
         QYCs5jPGTOrSqdy1LKU20SD6yWvBHfTNlzYL5gV4E2o5p07dEjwYx8xihoRO9iOiyDiS
         /A+Ssq0H4QsKyYEfq08BydPH91APoZIKuevWwqNRCD/q7+35leOnV6IyeuGD/HPq1iRP
         HHNA==
X-Gm-Message-State: AOJu0YwyAek0H33Qv7EX+wKmVewQISHAGi18u5JymexAFz+0QqLGk46G
	Oe4P4mRjrWa3/6HxBV/Mhk4KtpWrndE45wmtkro=
X-Google-Smtp-Source: AGHT+IF+At/NgEvSffwgRSTuGMal7VrM9Lw4W8A9vu7nxzGP9F3eN8PqQDlAHu7i4ESBMtQOxqCkHg==
X-Received: by 2002:a05:6358:784:b0:16e:12c:16b8 with SMTP id n4-20020a056358078400b0016e012c16b8mr19636566rwj.7.1703032960771;
        Tue, 19 Dec 2023 16:42:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id gw24-20020a17090b0a5800b00286ed94466dsm2238465pjb.32.2023.12.19.16.42.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 16:42:39 -0800 (PST)
Message-ID: <6582387f.170a0220.315b2.71b6@mx.google.com>
Date: Tue, 19 Dec 2023 16:42:39 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-238-g46bcd2aac1f1f
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc6-238-g46bcd2aac1f1f)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
6-238-g46bcd2aac1f1f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc6-238-g46bcd2aac1f1f/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc6-238-g46bcd2aac1f1f
Git Commit: 46bcd2aac1f1fabb3d1b44562d5d898d2d99350f
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

