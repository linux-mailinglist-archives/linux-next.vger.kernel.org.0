Return-Path: <linux-next+bounces-500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6D81AE3D
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 06:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5518F1F21BFC
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 05:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C4E8F52;
	Thu, 21 Dec 2023 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZU90DYZ1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F78F47
	for <linux-next@vger.kernel.org>; Thu, 21 Dec 2023 05:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c21e185df5so337726a12.1
        for <linux-next@vger.kernel.org>; Wed, 20 Dec 2023 21:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1703134908; x=1703739708; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7RdlLb5DHVC72rvFYa+TfQCTB4eqkjhVE4xVudkiYHg=;
        b=ZU90DYZ1+ttGx9BwIwxMQOGJCr5z9Nd3PcLJLV5ZAgtIN0yvj26XvwiXs6BAKiYAlW
         mjo+/jqJkJipxSK5D2iuzFOvq1SG7xV2I7RChjFKx9lPhvmmUF6DB5Bov39gmHARkYv3
         GfVbXI5B4DM3qaswfkRJf4YizsQiTfobZLHrwOw1EM3utV1j5w5bktEubnT/1Bwwqpbv
         gSQztrVde1Vx2AufV7CBSoLx4aaUEy8s3YZaZjS5/gJUjGyofD//xaAehG6CGXI+Qd3w
         5Tb4s5X/hY+PgX7mjnHbnON8zd6qYZRJhwfTzZQz223M8JXDdRkuxB/D99an7o0mKPbH
         TZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703134908; x=1703739708;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RdlLb5DHVC72rvFYa+TfQCTB4eqkjhVE4xVudkiYHg=;
        b=sNuue5CENdvSOuwMInksIBJz5Mh/CvctwubHhG0OKoGgBBmnMUFgNxFmToQeni23S8
         lHQw96B/CjcWaEtHkv+/0CQAVeUGMcOLzJQrk3n2Hl2H3iOgL51eTcTk+9lOljFDQtKI
         26A8aocCn1x4znt1dxpW2AEr8aFwuejkjhOteVYvT2P7XYX/CCLthl+K3J/3qhm/2dks
         ts1KNzVoSL1tDgtUo8V+pbm8xJmW1imsdYL4ZB10Xm4SdV1FNvuDc4jpR92jT5bd9+/E
         nm0+3MxLxaiOistHMrRsCMcNSrNCxL4rvkzRA9MOa7fY3LYxE05+TMgOSaVUwnGifidf
         uQCw==
X-Gm-Message-State: AOJu0YyLoonXmqyOPOkK5yt4Ubq44BAHaQDduScW1QzqJkbLtFdK7aSU
	+PNJpulGP82cgbRa9aYMErSwQomMRKuf4pm/yVI=
X-Google-Smtp-Source: AGHT+IFu2tTgA214Pi4YY9tM+a+hGMKNYbEzLxFfwhCKmHXI7Vr90+Rt2efV7kht1mWID4O6yHBWaQ==
X-Received: by 2002:a05:6a21:998f:b0:18f:c339:3fc4 with SMTP id ve15-20020a056a21998f00b0018fc3393fc4mr900410pzb.83.1703134907955;
        Wed, 20 Dec 2023 21:01:47 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p8-20020a63e648000000b00578b40a4903sm600443pgj.22.2023.12.20.21.01.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 21:01:47 -0800 (PST)
Message-ID: <6583c6bb.630a0220.b783a.26b4@mx.google.com>
Date: Wed, 20 Dec 2023 21:01:47 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc6-268-gc6eb02b33bd24
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc6-268-gc6eb02b33bd24)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
6-268-gc6eb02b33bd24)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc6-268-gc6eb02b33bd24/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc6-268-gc6eb02b33bd24
Git Commit: c6eb02b33bd24f8f4a60947b539db4871ef914cd
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

