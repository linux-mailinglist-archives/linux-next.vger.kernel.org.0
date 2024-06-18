Return-Path: <linux-next+bounces-2575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B491990C137
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 03:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A17C2824C1
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 01:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF34B6AC0;
	Tue, 18 Jun 2024 01:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="P6YFjIc6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55DD4C84
	for <linux-next@vger.kernel.org>; Tue, 18 Jun 2024 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718673789; cv=none; b=Aszx+my03Ak8TaYQ5hdwJN7VM6vujJqlD1COyiFL8O7srgo53rTVloUs5Ns0UxYjzvoRqG9xN8lhvDytHIugIiAmnPBbRBQrQW5YjRtdGQhnJEkFoji0FV8vIxleoKYGYjX8ae02XjPK0qEMlBUF9xfNb6qv+R4yMvpCunIh14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718673789; c=relaxed/simple;
	bh=xTykZdV8E9u5QKlUFpY3oal+KnSxPhyv+tQ2r6NEL5M=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=qDwQN4N/OfqE6jgf7JO6ejOxVbSA1OQW7Zxshiku9z1hI2+0TYM6H7MPmNDum4uIPCJn7RVMcRzHc7JNR0hGt4BQOyVKtsDdnQjK4kBgCUPZhgMyw35ZYzN3DbsILNs3BigorzHCcsOVpc5tDYDtAovYm5UDzpEkoTxY5KLHmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=P6YFjIc6; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-6fd622e5d2dso618630a34.3
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2024 18:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1718673786; x=1719278586; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5chlzbS5TLwuXHvimVjdZQ46JsdF8VKDEAHmJBFFi24=;
        b=P6YFjIc6xZjWYWVDTsWRrT50h/kGwwiXs7EmMTKoteX8Bj+iYGupApiuF0hQMjB26n
         mvp9A/sJHv3VMuJ2Vkhf5k3/8C5/yrTY3uJLkrW+3yINdp08HkZgzDXKxxddpPWndttf
         8OHullGqp4R345k7318CLIYWuRK/zXUR+g/A6p4lvuBL0FoMNDEQN+7YNnSknXLslIym
         RCnvFXBIkFwZwIxk6TCDf2eduklnGXB1fotuWZWcSpNlFHTAs74txvEkYjwxwaLviURc
         vhgt7UNLxc7TOU9ixBB5FcnBve8WiqDiY7wghMhUUCvHWVkslpR1HrpRSX+gl989a/Wc
         ZXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718673786; x=1719278586;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5chlzbS5TLwuXHvimVjdZQ46JsdF8VKDEAHmJBFFi24=;
        b=eYrrWT5r0VQpOPwlWpCf+8OzaFDvEk7aWBOEg3G9b7UmBMXQfv3yj+WfZ4Kl7zUk1H
         51I1hFnoZIgWj9TeatZtpdUzkJW4LRYFYwQsDkk4AKkOCqNi0jBeAxTwalGGooCm9y+6
         JMtQmHl1HA9M8nJL3Lk/wKEemiJu/Omnd3zBcQU3gBhHL4nhBni3L2/nHj/iTiu4GEEg
         hZldM/EkWx3sKRaM3UfH+mF6Dosdorw0cIvqy9oLewvbT41yWSLBNYx3MTeu7TtFs32Q
         RAZ7M/vuM3rsNKKSPQjtsu0yYMDN2XtSvGMhqP6QQXUEwsrFdMawVnkmaSRs/Vi4qqo5
         /12w==
X-Gm-Message-State: AOJu0YzanAaSCC2Z86MKcF3BiN9sFogE5PK70A6Z+nNv3oFUn2OfqBML
	pb6Ol992h0SgmJt+oE0QHjZWDus9BvPpjiZVJslNkZP4tO2TJ0G4eZCWS+U352PullF+V7oGo7Q
	hHWWyxJIr
X-Google-Smtp-Source: AGHT+IFsBjdR3cn7wYXoy4/AT8Qi5ff1lGg4vpJI5t0N+tzGSVrM3R9njcu8jF2YGmBG4OB9pUNbOA==
X-Received: by 2002:a05:6870:1646:b0:24c:59f7:e840 with SMTP id 586e51a60fabf-258428f79d2mr12717165fac.17.1718673786123;
        Mon, 17 Jun 2024 18:23:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922650sm8200085b3a.14.2024.06.17.18.23.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 18:23:05 -0700 (PDT)
Message-ID: <6670e179.050a0220.1285d.6b0d@mx.google.com>
Date: Mon, 17 Jun 2024 18:23:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.3-10703-gb3f869e79cdf0
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 15 warnings (v6.3-10703-gb3f869e79cdf0)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 15 warnings (v6.3-1=
0703-gb3f869e79cdf0)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.3-10703-gb3f869e79cdf0/

Tree: next
Branch: pending-fixes
Git Describe: v6.3-10703-gb3f869e79cdf0
Git Commit: b3f869e79cdf0e15e03b2e77ca14e825c18d933e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:
    multi_v7_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 2 warnings

riscv:
    defconfig (gcc-10): 2 warnings

sparc:
    sparc64_defconfig (gcc-10): 6 warnings

x86_64:
    x86_64_defconfig (gcc-10): 3 warnings


Warnings summary:

    4    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    4    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redunda=
nt UACCESS disable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>

