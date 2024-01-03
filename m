Return-Path: <linux-next+bounces-586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B062C822636
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 02:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17651B21CB0
	for <lists+linux-next@lfdr.de>; Wed,  3 Jan 2024 01:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E9DEC5;
	Wed,  3 Jan 2024 01:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MJlrPr7+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313DEBD
	for <linux-next@vger.kernel.org>; Wed,  3 Jan 2024 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3605cc5919eso925915ab.1
        for <linux-next@vger.kernel.org>; Tue, 02 Jan 2024 17:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1704243809; x=1704848609; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+gEpu32YH+QW6z6BbC9twpsyrxWMKXizRTZ/xrOk2g=;
        b=MJlrPr7+e/tsthbSahQCB6ek9Hnd8Q6v/e3XQ/P/zKUBfh0+2tWnO49JeAmKpo1loJ
         qJSwmqJsd3r/D2+1+dwQrzTreFLMwhcxum7SJe/zYQ/nKomthRUG5F037YswwJ1nic7l
         EaWiQECnuR1ip22k9JNffRG19PXrCrOVdiL9SnCFUzHDtsy6DD9rqX2osg7FFpxitcKl
         6e8jUgP9gAv9gxplRtzRlnaUgj7f8R9NnKB4f4G4tH3ZmOk+YntrjNzt0rsmbPkq9tuN
         4keJ69o36U2i7pAnLIysdNuxG7caiOEdwvkMFeh/ey5zZV3DibmAa0dyjZUXR2Oq6+op
         qVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704243809; x=1704848609;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+gEpu32YH+QW6z6BbC9twpsyrxWMKXizRTZ/xrOk2g=;
        b=PJKm2NjztCav/nHVDguKHvvWyEEWdfWLCFECMJSPccBQjc7oHobBaIoyQwmlp4MMIu
         wiu6eqIaT8mOMCqAiBTkb08CJYsk6Rf1jUS2yx9eKhwUc9OmG61NeOpmav3ojwzGHCix
         52i8IV4nFDUNFf31JyVAP6Q8TnjlvI45ijFHoJucG8jzN7Ez5xDzpAg0DSTEV4UNlZME
         OLveOrF1+CDOWVIdbDvwIlh2PzF26+6QwBH36Tp2UDf4e73ATF4CA8/wbTGXUhmf4tBF
         WEbO0uyiGvo/HaWZUku1U7zg26AQ4OaXc4HwFzdFlGxbOh8/P8kDZysq1Wn7Z69Wf1r9
         5kdQ==
X-Gm-Message-State: AOJu0YzKgLY5sbXqRLzVvezW3OWhbbv821j9IEJKXabVg25cJfuzLScd
	XREfir221Hg7vYme79RCxpHNRRQ12Wuc1PVI3dNJz3D5h/4=
X-Google-Smtp-Source: AGHT+IEHmCeePXIhCO+eEzZS7O5B0g8FE/o3v3S67wVr4UEhKmMDUMG1cV4/aj1B87SYuFsfQIJiIQ==
X-Received: by 2002:a05:6e02:3202:b0:35f:eb58:7c51 with SMTP id cd2-20020a056e02320200b0035feb587c51mr24329731ilb.75.1704243808997;
        Tue, 02 Jan 2024 17:03:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m22-20020a17090a159600b0028b3539cd97sm285254pja.20.2024.01.02.17.03.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 17:03:28 -0800 (PST)
Message-ID: <6594b260.170a0220.de327.0e56@mx.google.com>
Date: Tue, 02 Jan 2024 17:03:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.7-rc8-93-g29f356fda1035
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc8-93-g29f356fda1035)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
8-93-g29f356fda1035)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc8-93-g29f356fda1035/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc8-93-g29f356fda1035
Git Commit: 29f356fda10353cf707f9856793c3de2c954572f
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

