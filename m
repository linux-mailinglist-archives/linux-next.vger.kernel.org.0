Return-Path: <linux-next+bounces-139-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECE7FE947
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 07:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEF7B20D83
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E9B14F8D;
	Thu, 30 Nov 2023 06:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fIwaSAsP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FAFA3
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 22:42:22 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso546955b3a.0
        for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 22:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1701326541; x=1701931341; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ScTMfbULEj/583FIqGPA1QydwmklPYE0iBm9DYMG6dM=;
        b=fIwaSAsPb1QkDoGQm/HfbpUXqu4r8M8QZmQruiDChXfP+XG92kKiUfOgPtjfC8UVt4
         wzjuT1CCC4HhjDGK/06W8U3MPdIMICi3jLKphTETSDVx3jVG5gWJgAG5xxs25Gr1EIvn
         JVxwTE/Y6whwWdjNKA/zec92mpWsHg5cn2VEX1IG8wfwsi6DZyDKEoa6pIXvJgCMI1Nl
         LhGLxjwo0WOrvXMzjWaCiWhRK2LX5EPS9HZZc1Lu7ndpcwNlJ/4oueJu4L+JCmVdTkYZ
         vFa9UTp2T4/ud8khmAkBstQSHAf92rGZVF0dqKYsxLVbbTKgxv6QD4EPrj1exX/N+rBt
         ULGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701326541; x=1701931341;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScTMfbULEj/583FIqGPA1QydwmklPYE0iBm9DYMG6dM=;
        b=YQRuvqReVJH+UECKmhkBNWqVl7w8hNC75Ywye2fWu3O3glZbPoZZL/ff17X57mlJaX
         Ic8CY3UV1dCowVZYUsegpldAmciGcK5Aqb8nk6cAg3Vqy/Iml3jyRU0bYiIcrx6Ge1O+
         /Ex3TOv11J7hUdUgrgcRlybXHHGYHQf9iGAnllz3JFPCQxqmfw+t+jF450ij6ECH2AvN
         znlUJXyuMGgwcIErNmAU08LaTXeFSPiAKKDgRL48AansQh8fPQHt5lfuOwY8DATzm67A
         7KDvslAFZUHDbzb3CuS4s/TsVproNm/E4ihkQLQw3bFg5D12QMB4I/9CI5jzaDWiXOXu
         vWwQ==
X-Gm-Message-State: AOJu0YyaprQ21TgLuO8dGYXX1JD0T+EYUbua4HP8NxOdiSWTwosXvJ3u
	wvguyli9duyjeR36RtiR12aWi6RYmSzSfNkE41qarg==
X-Google-Smtp-Source: AGHT+IEOxfTkMB1QhGx1osPGIanuILvJQXDYCJVbIbenfFQ5RpGgg+JCj9dXSVXpIBfMOm6IgxdN5Q==
X-Received: by 2002:a05:6a00:3697:b0:6cd:ecdf:b244 with SMTP id dw23-20020a056a00369700b006cdecdfb244mr283304pfb.5.1701326541138;
        Wed, 29 Nov 2023 22:42:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g26-20020aa79dda000000b006cb4379061esm444725pfq.205.2023.11.29.22.42.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 22:42:20 -0800 (PST)
Message-ID: <65682ecc.a70a0220.e1da3.1366@mx.google.com>
Date: Wed, 29 Nov 2023 22:42:20 -0800 (PST)
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
X-Kernelci-Kernel: v6.7-rc3-291-g1867b4f140ac1
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc3-291-g1867b4f140ac1)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
3-291-g1867b4f140ac1)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc3-291-g1867b4f140ac1/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc3-291-g1867b4f140ac1
Git Commit: 1867b4f140ac1336fdc9f7989171e230ab3cea6a
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

