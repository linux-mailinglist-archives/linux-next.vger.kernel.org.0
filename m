Return-Path: <linux-next+bounces-40-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1E7F569B
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 03:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4538B20C36
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 02:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E61E5229;
	Thu, 23 Nov 2023 02:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="a/4P95FE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98364101
	for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 18:53:36 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28039ee1587so352294a91.2
        for <linux-next@vger.kernel.org>; Wed, 22 Nov 2023 18:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700708015; x=1701312815; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNmK2XW6jd/6em8kN2ASAa8lPqidXbgQp9JMDey1ScE=;
        b=a/4P95FENpAIp7gtQIb2qAfG/8g7q7p1kGQabjnwk2u/M3GEQ81PDvXXfDzMCNWMs5
         QhfUNdyrglAqubHD2ZVOBCex2Ql/xkPdHm9TvZvGN2UiupK1kDErrXbBRtR9IwjVWBcT
         wVCYtHjug9nVpOcnfoRkTphkaclmTGpH0VL+dOkU4NfXjg15ZvvgWhbyrxRsulcFBnCY
         cjPTS9R55PeeP0uO8X4AjX/FdIqSiqfPXwTZnTtZqWUT3d2T21nTN89CjcCBF4hHb9xx
         xoBrykXdnFta1tUjMWZRtEiRCbTugDTtkwHVVJA4p0fNelvbTFU2wYsPadGBlD6xAO4M
         ddww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700708015; x=1701312815;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNmK2XW6jd/6em8kN2ASAa8lPqidXbgQp9JMDey1ScE=;
        b=TIRo+BodWDsVTU0MyGFEKmRIvh0AoHxtqPaVwTOJSYLVdqWIoUaT3CfeIIGVAIO4su
         4lkO/nai3m/wYXMOd7GtStBy2r2HQbduDYDLVUnVm5dj1zyL6aHzB/qCC9T2zCPdl+I8
         RWg0ATn5jK47iofQQazfmdFaCfM4Ul44sqMXQDJST3sV8PGF3gPKhP62cO27ea6BTf7u
         nOEBiauwtR2zMxi5RWZt45nNWcexfCKD3D/auqaXb6s2qvlv2kYc+VSDfmsB0kS9FKr1
         ZjAk53NqBrTCTls1C6XDKh2wOD6TI/PWjWObjjbHCVelsx0PL0jSAKsRERYCOl07teqF
         EVjg==
X-Gm-Message-State: AOJu0YwbBgcaYxyVoVc7b7I4uori5VBne8It/k2/V1fAeLaxhCPaI6YK
	htvP4AY6avTXnRMw5/zkNQuRvhj5pdP/pN70KV0=
X-Google-Smtp-Source: AGHT+IFadkL0ThHV1DZzD587OXXKxaJJo9Lz+tTN7f0Un/ul8NwvLwREwceGKyQRfBO3jUAir6DnJg==
X-Received: by 2002:a17:90b:1a84:b0:285:565d:1cf9 with SMTP id ng4-20020a17090b1a8400b00285565d1cf9mr1691537pjb.27.1700708015410;
        Wed, 22 Nov 2023 18:53:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l22-20020a17090b079600b0028010142010sm464638pjz.21.2023.11.22.18.53.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 18:53:34 -0800 (PST)
Message-ID: <655ebeae.170a0220.2d66f.2090@mx.google.com>
Date: Wed, 22 Nov 2023 18:53:34 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc2-250-gec797c020fad
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc2-250-gec797c020fad)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
2-250-gec797c020fad)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc2-250-gec797c020fad/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc2-250-gec797c020fad
Git Commit: ec797c020faded71434e2416188429f220cd7e70
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

