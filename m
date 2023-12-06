Return-Path: <linux-next+bounces-251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795C806819
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 08:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1E681F2163D
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 07:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DEF14290;
	Wed,  6 Dec 2023 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="zsBLafMJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6D99E
	for <linux-next@vger.kernel.org>; Tue,  5 Dec 2023 23:18:41 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfb30ce241so46611125ad.0
        for <linux-next@vger.kernel.org>; Tue, 05 Dec 2023 23:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701847121; x=1702451921; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+JRJIqXFpIzcQS/9VkW7TzWALH1DpMmOhci/EdNKmmo=;
        b=zsBLafMJYB8HdTEuPeO7M4EBQui/PuuMWgGzgu7SK9pzhtGpCc9aiFGooqm3zs5lgo
         R5pVWcGcDma+NGEjstKdyxcrZMTaEQTmQobbjVRQIwysT/DsKyhCChTt/b0p3BI+E99N
         oDNqIhvQo5KjJzyiJBG/7wfrpReoCQEaXhear1qCiD7w7rVttfjgpXpX4Oag7IdMrKhf
         hrU4YWb27Z+lU0AxIu7aSjku3NlybSGc+cIJ8PrwwWSEe8cYPdHkIXuUnFjqraRww2eW
         dAG10k2aiqYrVmqy+Iqb0rP6PUamA0LuXnVWivtXIM5xagvAMR84mZ75Adp2AmCSTDS0
         kGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701847121; x=1702451921;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JRJIqXFpIzcQS/9VkW7TzWALH1DpMmOhci/EdNKmmo=;
        b=eNlROZkVjCj5Zd0JnSdQeBoI2Q+cVthzdYGPWlRy9KBKaiMAnL+omMz+KrqQ+m4bOG
         Iu4AiyVaEtzDIm/2Nw3KyKJi/3ohTl9Qu7CFxpE2o+4F7caslErJI2YEe2gGQr1FfB6c
         Ut8DD2oX2HTVbrWHbG4I+qzkp2yUi4VEMBo1VqMYJ1pSfbq7kqT7vdLyROhZtv9AAWIP
         iSPnP82StdOZCWw/ETmlOgNTqwiDI+LMG6rbgS9ZAN4s+fflvJY+ydka16GIdPunD90i
         J3cwj43pyBHERfQfl21Q21r1TvDRf3Pa1uV0NiMu3ZqQaVvehZjAmo7ykh62KQ/9HOKd
         /z4Q==
X-Gm-Message-State: AOJu0YwUVEP+gSUPR2xfPwWx9tOLqyYhsh4aJzdJlRys6kIUVNtQbP9r
	R+kp7tnQlH1uFKXf7nxhjGIIt4h2GBDFntH+85IF+A==
X-Google-Smtp-Source: AGHT+IFZ3tSS2YlSVjB+U8lx8DgBL5qCtkvtIoh+HVzk/jEh2czkd0PDYIWxggy1rpSBsWN8m9E/YQ==
X-Received: by 2002:a17:902:8491:b0:1d0:6ffe:a1f with SMTP id c17-20020a170902849100b001d06ffe0a1fmr427195plo.125.1701847120763;
        Tue, 05 Dec 2023 23:18:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902904500b001cfb971edfasm11285646plz.205.2023.12.05.23.18.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 23:18:40 -0800 (PST)
Message-ID: <65702050.170a0220.561ed.0cf5@mx.google.com>
Date: Tue, 05 Dec 2023 23:18:40 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-256-g4f4df7fc4acb4
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-256-g4f4df7fc4acb4)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-256-g4f4df7fc4acb4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-256-g4f4df7fc4acb4/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-256-g4f4df7fc4acb4
Git Commit: 4f4df7fc4acb43dc054b108db381a164a7e56911
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

