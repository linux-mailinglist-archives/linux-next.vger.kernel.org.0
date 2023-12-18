Return-Path: <linux-next+bounces-437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4A816A02
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 10:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D023A1C227AE
	for <lists+linux-next@lfdr.de>; Mon, 18 Dec 2023 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3D2125A3;
	Mon, 18 Dec 2023 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="EdNm0eyB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7A11C9B
	for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ba4850f65dso1475019b6e.2
        for <linux-next@vger.kernel.org>; Mon, 18 Dec 2023 01:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702892402; x=1703497202; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AKXsow4l8ToPr/9VMvEIRSahQmiuSBL7eLvg0kldo4Y=;
        b=EdNm0eyBp/2mIdARuxGv2n7nleAEphtPxNnN41i4U0IQe307gOLUv80Qm7hHR5WBCp
         FDrnoKrlO6pNGkmIMcejoV6F4wIQbvTFO+NNag73mBHQjHCeL4olT1Znx/JC1qNIuZvw
         hU637sosQfR0yvnO+lIh2crVi9+ZbIdBXJtSKfj1o49MtVQN+xMKn5jvDgyGqgnCNMNN
         gH0SLFeYLKIwdNoQfSjQlH7IVA0+8DMSuu7QihqDC3IVvkJ7Idc/+6fvtpBGD5eTu6NG
         4+DrNh0VyQY0+s0bIx58Twn/JdDHr3v43x2BNc7cu/2FgJQXd2QrykmhyagSQXylLb1O
         AdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702892402; x=1703497202;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKXsow4l8ToPr/9VMvEIRSahQmiuSBL7eLvg0kldo4Y=;
        b=pqzNXSsDK2vxUHIf7Qy2EiasusCwdTHJTkYBfIjm4iKyYz/+/J5W1TIqm4tQgWTWeL
         ywU/ciQqI3zSwMBIXFgTXX3rPcz+4E17ZvnJTkZ77sAmjzMz4IzBtiD7Eh9SLoUIXIbs
         1uQmz6Wkuhm4BD7D72WxgsNsyCNhwqDzYA5pONrn//fpGdu9OfhYQCZ23wB2T5wygKGb
         /+63hTXNVLK2WDzKZ504Qa7AmnciqsG2OQJwQ7/H9bQFi+3Q0i4ZMYgvtQihqr+1WEzc
         l92ZPVwsZkPu31vpp0OPicXtV2FA0TziUwqnEgZyL4YDAL6BTHAAtGVAnKiL1RxIhllj
         3c3A==
X-Gm-Message-State: AOJu0YznOBsmLHDF7xc0qTpRVz2XXLJUSNYnU+7xz+jWBJAo9yu4unvs
	N4mbkyW9iWSLEuYdk5l8Qn1RlVg8s5AdEXdzeVQ=
X-Google-Smtp-Source: AGHT+IHCiJClWBEJOBqnFWzz3slsPhbkY3o43ksP2CX1XDPXIEVavIujMjwTAj89DPfT62PdXSVhyA==
X-Received: by 2002:a05:6358:60c1:b0:16c:4fe:7bfc with SMTP id i1-20020a05635860c100b0016c04fe7bfcmr17691783rwi.22.1702892401966;
        Mon, 18 Dec 2023 01:40:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ei22-20020a056a0080d600b006ce75e0ef83sm692559pfb.179.2023.12.18.01.40.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 01:40:01 -0800 (PST)
Message-ID: <65801371.050a0220.dfecf.10ca@mx.google.com>
Date: Mon, 18 Dec 2023 01:40:01 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc5-456-g002453f88f609
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc5-456-g002453f88f609)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
5-456-g002453f88f609)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc5-456-g002453f88f609/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc5-456-g002453f88f609
Git Commit: 002453f88f6094816d34378e953d87b8a8a54518
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

