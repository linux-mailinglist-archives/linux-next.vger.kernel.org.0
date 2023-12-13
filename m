Return-Path: <linux-next+bounces-374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70731810868
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 03:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCD91C20DAD
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 02:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83573186C;
	Wed, 13 Dec 2023 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a0N1TnlM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FF8A6
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 18:51:59 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-35da85e543eso23579605ab.0
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 18:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702435918; x=1703040718; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g7JU20IAZWFR60Z33rTtv22US4GD658iON9bFuDwce4=;
        b=a0N1TnlMs81lccEYbm7eChrHNMoDmOAgu77VE4moFnN76v4ZxIRrHTLhNN6GDGTxh2
         cAhtVrdVxGsr6Dsm6wZmBxodEPagrxPOmYjFlxiWCF+BEN4ZPQJxh5GUolxdWjrg2m88
         vaPbKrsCYqRJgwv5bAJn2+gE5NcIof8hUaIcnfPv+3as4zJGBZ45iTEkhuIWYfOTIc1x
         qvwtNtjLP3JZcjCIbw4xxQd2ok/2Ku12raQYEp8vKI5iCVifOeBjoGPaeHojjPq1alLE
         ru2Po6n8x6ZIuSX+k+XuHCoMmssD9uls+MiF18nbrV8O2BpU4tbCvt0kpzddLuQS8Sr6
         eR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702435918; x=1703040718;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7JU20IAZWFR60Z33rTtv22US4GD658iON9bFuDwce4=;
        b=eFrraeqydqLa0j9CCq3ZSzFC89P9nT9/yM+K56egvczkEEUbTmf7ShVQxfPHqAK9uG
         oMC2zgc/tGA8kReLpAG3UXOF5ZpZRs9NirEh0QPzq0/TIhrZl5cu1i/0soa2wMnQiJ2e
         g7Gmc+BMumVphcW62Of7cpTcRIx5pB/+f4Cd5orpLIOWRJoD4fVX7t47HJAaTrX//g6c
         KXAF1HS8dqwADpOSVS1XWMiE68prOjEIt4/+URrtEhCwx+Aj66zAgIvYfHtQcxzKDq0X
         hBojezku0VUma/R791/8UnBg8Qsh7dJGxByp7s6s1zGkFEYHsXAJydgzcTv4dgJDAQe/
         cvsA==
X-Gm-Message-State: AOJu0Yy9O/W69bQQYn9fJZMmHGn1zsQ7Xkz3sz7F9uzkJPWdbH8rwWRE
	XZhZd6Ro7jdpXvGxR462ZBWy2rr8ipu6g00D6fk9DA==
X-Google-Smtp-Source: AGHT+IFaESIBqgRfQG8oHA89oOXoYdFhpZqKhLnVzRYosA7prFLSPkerqMOcrl7k++HJ2bxQKKwZnA==
X-Received: by 2002:a92:ca4a:0:b0:35d:5405:e63 with SMTP id q10-20020a92ca4a000000b0035d54050e63mr8369508ilo.31.1702435918137;
        Tue, 12 Dec 2023 18:51:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b31-20020a631b5f000000b005bdf59618f9sm8704607pgm.69.2023.12.12.18.51.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 18:51:57 -0800 (PST)
Message-ID: <65791c4d.630a0220.11668.ae0b@mx.google.com>
Date: Tue, 12 Dec 2023 18:51:57 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-246-g91523d2e24e55
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc5-246-g91523d2e24e55)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
5-246-g91523d2e24e55)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc5-246-g91523d2e24e55/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc5-246-g91523d2e24e55
Git Commit: 91523d2e24e55ae76d35f6920af9711f1091772f
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

