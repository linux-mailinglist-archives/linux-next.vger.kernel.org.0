Return-Path: <linux-next+bounces-118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BDB7FD3A4
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 11:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAD9282AF3
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F63018E1D;
	Wed, 29 Nov 2023 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="gApYvNgx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C38BE1
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 02:12:02 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cb4d366248so5571485b3a.0
        for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701252721; x=1701857521; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DIHbJLg+hLV80en7o4KDChDloQVe0LWX8OBKY7pewPg=;
        b=gApYvNgxQnikVfPn0jKp7z4HLbIvKGI4BUoamNP0tjHtqgXf5vlus9EhVojzGUQU7X
         MzHzbwigfk80cvNf4+1w3HQeIBo1W17hthunR6xGVcqcNhE03OIhDEf05y1PQqbjSNj0
         QTBzvQIGCA5Pa3COGGgA12rOQ62OwARX3rqiQDTSAnsydHAkRjNB/sfLjAFC1yTyuN17
         MHANOnVnnKpFcq36EHQNkuDXP+STOwTL/PzSOxMamZuDogm0RiAlittCfV1Y27raENIs
         jeIpiuq5AYpLz0Y5O58lpGermAeUoTt3FSvjkFnJdA9LORiJac8ZM8ec9mveZ/Rwjo+V
         fyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701252721; x=1701857521;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIHbJLg+hLV80en7o4KDChDloQVe0LWX8OBKY7pewPg=;
        b=w06U1m+3rvgpSnXbX/9spqZpPmISFx2KSCsCLIkA8HR8TBwy4X0vb9wxp0YuGfmo3/
         0Cy78rZphiSeJAE7zGdyxlNYtau6zRQzDByv22AlIQvJcMAmOG7wDD5xD211rnLQ4SFu
         B2RHVa2HDwget40fnlv7ynCiLjkdiSYt0SBc44RfsrnvZMCcZRY48nNpRKSfHbx66mBB
         khSLcS4MELtiI9zKnDeyfO+oCcngltPt0J7jCVA6/DZXHURPA3NIT06iUsGM3cRCt3Nx
         r6fyojvWbh/lU2SuprXP2eOBuqZZH10plRBh6VtgV0lnnbZuP3o+gDKVE30bIidOkVoZ
         1TqQ==
X-Gm-Message-State: AOJu0Yw8xPpqhH3EoOmuHl+lrT3ZkSmios/uXWaB/Af4JLP2hlABhz4v
	2acSqA+LUgAYMw9SSFQ3leLH24b0KASNeN6n/Uw=
X-Google-Smtp-Source: AGHT+IEfv2nBy0moaBc0X88pBM3/Wq35QntoTVxAQGXEahiKANWu4YTPlgu74pQ4hkE8BpsOk8+i0g==
X-Received: by 2002:a05:6a21:a5a8:b0:18c:3fe8:d8cc with SMTP id gd40-20020a056a21a5a800b0018c3fe8d8ccmr17195920pzc.28.1701252721265;
        Wed, 29 Nov 2023 02:12:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090aca8a00b002851c9f7a77sm973432pjt.38.2023.11.29.02.12.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 02:12:00 -0800 (PST)
Message-ID: <65670e70.170a0220.c0136.1fba@mx.google.com>
Date: Wed, 29 Nov 2023 02:12:00 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-265-g1618cb8f57417
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc3-265-g1618cb8f57417)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
3-265-g1618cb8f57417)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc3-265-g1618cb8f57417/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc3-265-g1618cb8f57417
Git Commit: 1618cb8f574175a196b0e8926c62efc45760e856
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

