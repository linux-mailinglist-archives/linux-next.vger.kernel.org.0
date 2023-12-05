Return-Path: <linux-next+bounces-232-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39508055C0
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 14:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70A4B281A33
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 13:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834095CD0F;
	Tue,  5 Dec 2023 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IyBfWfWV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0151A5
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 05:22:58 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2264357a12.0
        for <linux-next@vger.kernel.org>; Tue, 05 Dec 2023 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701782577; x=1702387377; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BziWvMEFrEnjkgnsEckTumwwiM8f7uR3umdinDz6JBk=;
        b=IyBfWfWVCw9TQfoYgFSBMd3h+LVEpsGICSLirJ6jnsAlVQpRV6EndCOsa0/RIyFJ+n
         5vJHXZOo/RVAKAID7jhrVJjy4zxCvBeax0F27uB2FJHXWv5NFfEkCeXfkzgx1maJ8V74
         snVpjUbAYfIJEHqTx6O1hr2zX2iIkTnCBya0pgP9EwrTBKxacd0KT3Wq6qam/AURyoiM
         A9mz+1km8TmI+vWozftpIJw+/0fluow9901wZPX0XM9NgHdKvpBaObloiu6I53pVL3Lz
         E6XjyqAuzY0j3nmcTS7omD97p9nvApu+W3okKkuUz4gNi9ohHAG0C//aJNQUDBhJRYad
         7tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701782577; x=1702387377;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BziWvMEFrEnjkgnsEckTumwwiM8f7uR3umdinDz6JBk=;
        b=YWQgFN4DWrGQzUbV6z37/qjDE3erB27vNO2ZoVvJGs1i+aXcz0+gWWwVT45XQ8HAsm
         etgq7azks5twoDNvKIDGP5VjWxxkuChDhK7Pa0gxnx5vRVpIILbfemotmjltHJLTDQlZ
         f1mL6N1nNte4sUTu++/w/ZieL+sTzGVVXeseWUfPaaqaVtYf44MHrPg/MeYiXew65CYh
         7O/BoHqLNYt2Tg/NtYIASvh9B5EYgmle6F44tQIyTPGEML1abWSjHdO3Emjx4siVJV7Q
         f4T7e0JbFP7oBYUmLqg6a7Rs1sCP7FaTHwZNVSJHNhnqVDvfIglB2fyOyrK/7N4hRJOQ
         yAEA==
X-Gm-Message-State: AOJu0YyvWBZatmlH+YHNClMiibk/WGfl0Mcrf9v4AQ+cN9tEGH0oCvDs
	XUVUPViH1nq0im7dtSol6kJ0ONg3mMdjbS5aQ0ZhWA==
X-Google-Smtp-Source: AGHT+IHV9yxeyq96VzwBzqu9/C4DeeyG5EK0NfMMths1tsKRMv3HDbbWJdSg6KtXACEwxX5yrAGmzQ==
X-Received: by 2002:a17:90a:c908:b0:286:6cc1:867b with SMTP id v8-20020a17090ac90800b002866cc1867bmr892552pjt.96.1701782577539;
        Tue, 05 Dec 2023 05:22:57 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id lr4-20020a17090b4b8400b002839679c23dsm4755349pjb.13.2023.12.05.05.22.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:22:57 -0800 (PST)
Message-ID: <656f2431.170a0220.f185.bc97@mx.google.com>
Date: Tue, 05 Dec 2023 05:22:57 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-219-gcc1b39317a57
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-219-gcc1b39317a57)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-219-gcc1b39317a57)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-219-gcc1b39317a57/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-219-gcc1b39317a57
Git Commit: cc1b39317a57120651840e79b535594ee09f5768
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

