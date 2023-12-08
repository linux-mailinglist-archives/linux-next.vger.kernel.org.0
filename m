Return-Path: <linux-next+bounces-279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5377B809735
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 01:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA3E1282054
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7B87F4;
	Fri,  8 Dec 2023 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BP3Mxd5v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745FC1713
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 16:28:33 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cea2a38b48so1169491b3a.3
        for <linux-next@vger.kernel.org>; Thu, 07 Dec 2023 16:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701995312; x=1702600112; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YGnAw8yCHebSnT1B/75W5+kwC9oLITs0NAmyxRhO2ss=;
        b=BP3Mxd5vxcsaFJsnS6cSkVkw4lTp6BBFogcW6VxcKdn8SRZPFgd2xP13g8O5Hzoixj
         JtuoRAGWI3vp2fQhtftXzzAuOCjgYPqVuKFufysVw4DyGBfCFUlACDQ7M9OmWfYwjbDo
         e9VRfxbKxaq2D1Zu9HBeR95cQ/YUR954xE7c+S6UjpiTmgJuntG3ezednPs8IOPhPiYZ
         Y8h1gHZBU4mvI9Y1/2nwRLgLH7kQwcgGgx/nhnTd4qzHG0bqqtFhJfj73mCvS83vz3kX
         Fw25l8DE18XSpkmECcgyqX/FAMcEwtXaWzZMsdX/sskYNtbwWYnTFWMhBeoKVnEqEdS6
         3rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701995312; x=1702600112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGnAw8yCHebSnT1B/75W5+kwC9oLITs0NAmyxRhO2ss=;
        b=Itmpc2QWm4Vz3YbwKAqisIvyufrl1ehGeg/2hrw5qkIuxbh660Y8oe4gcSvlCuvvYt
         Nti3/bohnErsE1rWkvkY/2upjVkqP/TO+e/19ouPhnLgbR2ldsKMCiRvJGo8UPlDGA3I
         CZWL8q9YMxYjevDGxvyO+qSxl0g+3NG9K1CreCc0/6zIH8/xboXablwi5sV3+f6/rXss
         hvtus1VYabfTfNwM2uVRO1vsvNUYt6ZayeUGpOMN3inVrrndizhHYJBKBFHSq5ZpkBXy
         NpU0KGiHdZoni/Ibn7rytDuf6i1GSOazSxG3k9fhYoeWt/GRZGUbZjh2w3uBpKcWMXHG
         9LXw==
X-Gm-Message-State: AOJu0YwiZBqc7lmVImBmMn8CdQKAgzDWeFTAfiFd/e/b/G0bxmMN8IDk
	OjIr7ot6Hki4JhWl2h8Q+h6mzl6rp9prkScL3A6HYA==
X-Google-Smtp-Source: AGHT+IGbCQckGea+uAfB8WcqpkV1ryANMr54kJ2mDMcrs2+5Kcc3lrRWxVazBcH9sHuc0Pb6s8v25A==
X-Received: by 2002:aa7:9e1c:0:b0:6ce:2e39:97d5 with SMTP id y28-20020aa79e1c000000b006ce2e3997d5mr3126295pfq.38.1701995312538;
        Thu, 07 Dec 2023 16:28:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fb6-20020a056a002d8600b006ce95e37a40sm359849pfb.111.2023.12.07.16.28.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 16:28:31 -0800 (PST)
Message-ID: <6572632f.050a0220.2b396.1e5c@mx.google.com>
Date: Thu, 07 Dec 2023 16:28:31 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-412-ge142e0e4b174b
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-412-ge142e0e4b174b)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-412-ge142e0e4b174b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-412-ge142e0e4b174b/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-412-ge142e0e4b174b
Git Commit: e142e0e4b174b269d1fd400aa676c5f0483b608c
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

