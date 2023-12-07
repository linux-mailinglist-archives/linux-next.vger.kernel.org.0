Return-Path: <linux-next+bounces-257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40503807D70
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 01:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE012819F6
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 00:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEABEA4;
	Thu,  7 Dec 2023 00:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="MJdCAfg2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A6FFA
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 16:56:24 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c66988c2eeso298656a12.1
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2023 16:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701910583; x=1702515383; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx7RPA2H1AaYb27YD/qL+/ijqbduptmV2C1cnE9bl+o=;
        b=MJdCAfg2PEcHqJ9I/us3tIcM3UqU/rncY25oS5LqipsAzJFtUe1KEP1hLHUpRTfcOf
         pg5uf7IOYotxZUoGvFZ6LHBg4gE2s19osEPbm0AsJBeuqnH9dt6CnqnHRDnC/hQ1oqIu
         XVeImEp/ce2WCPpsRYPrpc6cKs1+TQPU7Dnz4bU3WqPPeHWCx6eqj0Vs5MerE6NXVhuw
         S2wXZDZVOqWoH5qO9Qa/xVOMXJP2MCxSIzOeHo9FpcdTeCSWCYvj/xiyz7mOMl+WEIjm
         Bfg4XisTNDVxS0zYPZxVqJDNMXq2P7v7kEVVOZnbyeCSro+F2Y+5AVin2iJred8/ccBG
         TfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910583; x=1702515383;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vx7RPA2H1AaYb27YD/qL+/ijqbduptmV2C1cnE9bl+o=;
        b=qHM4oylEPjTxC0pbqMNYKMgiIhf0Qwca2G5+skSeFU175qsY/DmHwg6guAyTAf2Lhj
         R36A23OjcoFWVgI73D8S+7GvME8EklIYpKMevVSVjBUWUUYhVGz6g7/5/ixUXMhDHtrr
         bKxnbCx3SXieR/p5MP+6y7+s9c+lxlBFD4dC8hPOm5fk4aGslb2TCpkEYR0JbOtDak8l
         rRAoPhvJi5BRCb3mHrypcHtY2staQFIAN+cFe++Cac2AfksqkYIbm3TbPAQH0FhuMMVQ
         12yajHTqnVZorbXkgvqcr7UbwSBAtm0lWiMMe8qYPbXBFtt4o3yPhImtkI8/bmFbMA+4
         4DgQ==
X-Gm-Message-State: AOJu0YzgSWB+1zZeZzI4ASfR0zr14tkCEXbMwBhbzmtRqiNjLJzDC1bR
	YGH7Vkju8Pa0xtm4/CWD9NF0lcW6tE73U9NI/PQJYw==
X-Google-Smtp-Source: AGHT+IGyExWEay2fytTYJQW4ZEfgpuur3nNpBtvETjo4GKUEERdb7f/Lav5vJGQKuikoyMJhp1Rltw==
X-Received: by 2002:a05:6a20:9387:b0:18c:5178:9649 with SMTP id x7-20020a056a20938700b0018c51789649mr2418563pzh.14.1701910583405;
        Wed, 06 Dec 2023 16:56:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006ce841d502fsm128114pfb.86.2023.12.06.16.56.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 16:56:22 -0800 (PST)
Message-ID: <65711836.050a0220.69902.09a9@mx.google.com>
Date: Wed, 06 Dec 2023 16:56:22 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc4-354-g2e06d594f8593
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc4-354-g2e06d594f8593)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
4-354-g2e06d594f8593)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc4-354-g2e06d594f8593/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc4-354-g2e06d594f8593
Git Commit: 2e06d594f8593e3baa6f3d7619bf4dcb6404a6f8
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

