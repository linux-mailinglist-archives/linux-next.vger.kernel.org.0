Return-Path: <linux-next+bounces-203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47C8029B2
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 02:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D762B207D9
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 01:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751E27EE;
	Mon,  4 Dec 2023 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="b53QcvnD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92107CB
	for <linux-next@vger.kernel.org>; Sun,  3 Dec 2023 17:09:08 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cf7a8ab047so10411835ad.1
        for <linux-next@vger.kernel.org>; Sun, 03 Dec 2023 17:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701652147; x=1702256947; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BVHeZBjylJK6u7JNy3bVL/ASRv9jGpR6MoE+H+ocPXo=;
        b=b53QcvnD/tsZFKbHL6krIkaU9tEhCjOSZbj0qsYXD2pn4A8YhkCRs5MYt2CDScD4WX
         +dBwrv+UV7EuiONi7Soe3pM/B60p6owdvNUPM1rw3556rPq+HkzcUAfKl++rwBIGC2XY
         2XM3Pl1xvx+9+GoYV2eF3oWQo+4ah6dwpBfMdAhHpfZvRWV7nWjxoau1jIlGSiF0ZUpH
         +6t/twXfmuJjjWySnBk8aTlZss+QNZoJOH5ifcMz8Z1CTf0zdzQHBmkVlLLM2WJ2qust
         DdxEOF1QDuihtcsCcxB5Yxp+rY01sdedmDOvOUs+N3W25XcP+yIPsAOPCDVI/Qcvgrjh
         Eeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701652147; x=1702256947;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVHeZBjylJK6u7JNy3bVL/ASRv9jGpR6MoE+H+ocPXo=;
        b=uoZ1m67Rzgx/ae5kLJGggp64jcvhhLSR8t+Rg+V1zyUy7LpLWENVvQKZt2lqijyL35
         t2E2h4eIqhHBIJgT5QpDD4y5xdVQlq0+VAvjYe0ansi9zzUqq2wzs3RJFA6y/pnKcgTh
         n65/gZ2xqUbyLUcFulQ9vPHDv0sGMqBg/A5UIX5n7vVxVzR65xwV9lzCxdmB0oYLonS6
         8AYh/LLxWcxBNTj4V/vlG8u+EitAGCh64kQWQnHqGadfthMivV6fB+e1+WApm0MXPAzo
         8B5QJPp1g3PIRk8ZwOjOtsT/m9+QeuLgUGfcSfhFshnu2e0ZOPmcgk+BxPQRRstm3NXU
         cGIA==
X-Gm-Message-State: AOJu0YyDvCbz7jxyUUGgKuwuCZ3GpUFrH8tU2b0xRDGhJc736xIUg+Wv
	93pZ1vQ4qq+XMpAYRccJmfu01BxhuIlHViFrWM7LLQ==
X-Google-Smtp-Source: AGHT+IEVWXHM1HF4/2Yk2DDV0lzZSmymSoHki0/UtjOPjtZb0AyA7Xe53m6o3FusJFGV44/2KDSJKw==
X-Received: by 2002:a17:902:76c8:b0:1d0:6ffd:837d with SMTP id j8-20020a17090276c800b001d06ffd837dmr714652plt.136.1701652147480;
        Sun, 03 Dec 2023 17:09:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p24-20020a170902b09800b001b86dd825e7sm7199069plr.108.2023.12.03.17.09.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 17:09:07 -0800 (PST)
Message-ID: <656d26b3.170a0220.3bdc6.3e21@mx.google.com>
Date: Sun, 03 Dec 2023 17:09:07 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-181-ge070da1246e73
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-181-ge070da1246e73)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-181-ge070da1246e73)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-181-ge070da1246e73/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-181-ge070da1246e73
Git Commit: e070da1246e73617b8d1f079186bb4d7e0fde604
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

