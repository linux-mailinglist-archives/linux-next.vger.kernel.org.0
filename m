Return-Path: <linux-next+bounces-2797-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F76923995
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 11:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE0928547A
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 09:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A110374FE;
	Tue,  2 Jul 2024 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="J9CJPtIc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1661E130A53
	for <linux-next@vger.kernel.org>; Tue,  2 Jul 2024 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719911716; cv=none; b=qy/JljYfLyx1wwfb6fvNoPyWR2bHjF0K2AWM0j8OZaiQ3wDJYjZH7Z4TVUEONepRRkpp8QmyWN61T2sXlLbNCU7P8MuvlePUrlM9DC9VsOXHfXLjZazht9MOxBvGoL8gAceH5kEZZtBrDjp7A35zjmkDZkpiQCs7x8tOM7gbgkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719911716; c=relaxed/simple;
	bh=07QsfmYEhQIc369qYiHqI1QVaf9WbLw9NvSPaPOcwIY=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=cF0rN1I0YOmX6KN0Sf9rPn/UrErOmrxSiGC1WkeK2/x6J4Hm5l73F02fss/Y8RTY5ViyervAmcA4RqrfmTlU4YczSFz9tnAXgXHBWNBZsewrAgYkvFFz/WKg0QWIdhqbRwc11QXwvlNKI9OfcJ7eW5ISUDHmAC5Yz9qq9Uci5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=J9CJPtIc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7515437ff16so506884a12.2
        for <linux-next@vger.kernel.org>; Tue, 02 Jul 2024 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1719911713; x=1720516513; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PTAG2bCH/81glk1Y5KuPtw8f6KzbKzW5VhrjB1tCpUU=;
        b=J9CJPtIc7/6V7FkbfS0V7WBn/ZnK06/CAlnY1cckQQnRSoRGPoReUC17S3EScD8tC7
         XQnTyr0+oM+QKlBmTgAKsth4D6sq2S3hFhxTCBcVXthNtXiXbQ9FP8V3Jz61uvN9RH1K
         bkWVUsgSQeTMMERL1XpgpV8GvNxi2/JwQlHZeRjvqJ/yrlTiALCqh/sM5cXxBd7zQyXH
         mwZFzt8zrzkf5mWcCAH738mYMH6ovPeQuxyV9MpUaKmQVYKpGo209bVZUhRT4NU1NlM/
         Jk/sQlMxluLiG6Z+ZnUliHEG7y+g2VRFnxyQbB4Gm+rj5HDS6XMQBv5sLy/qQ84HRWdK
         87OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719911713; x=1720516513;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTAG2bCH/81glk1Y5KuPtw8f6KzbKzW5VhrjB1tCpUU=;
        b=YNJaQDxxs6fUPt+e4haEvsjLYtioCH2k+2FIa5be8sqfNHih167P9no63Hhq/jmh/g
         vt4DKCcdfAX8H5fPtzhP/Ez9/t6ifDLx7tE6AIUPkgXOpO7NKjSY81yhTDtYgAQ89+pf
         75bzILyef37NrEISVQYI+lBYaeSZMHCXKkxiEOHGNZxdze1HGipzpH2ntyj1WuQV01Yk
         2rH5iC8h5PDy0zIoerWzx8c1VDlQw1jxY6vT1yi6oFtcsV7RCE+Nd3Qj7nNMtfs0QXok
         8gDZncoefK2XnRP2Ufpz3X70sXvI1Tg+8o01UiKaWg+q59ADJpstFVAdjZB9TN0ENfw4
         unTg==
X-Gm-Message-State: AOJu0YzlQKfHg8tIwO2XzOqkvVNKkloal5zTxrDp+8ktM9q2guW6BiFM
	k4yH/rtiQ+zr9XXauRf/BtaToXzpDLxvyoiaPFm50qgpFmCKogzABmMS3Jgwj5pbfnJni0Gpccr
	s
X-Google-Smtp-Source: AGHT+IGxJDd0xN8Oz2nFmmkdRyzQgKk/2MZUYHQ9mJ8WZhiusD1NB5+tS+mG/LhO+pdWK30REPTivQ==
X-Received: by 2002:a17:90a:db14:b0:2c8:fa16:204f with SMTP id 98e67ed59e1d1-2c93d710c91mr6352961a91.16.1719911682882;
        Tue, 02 Jul 2024 02:14:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce1683csm8332133a91.8.2024.07.02.02.14.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 02:14:42 -0700 (PDT)
Message-ID: <6683c502.170a0220.e08eb.b8d4@mx.google.com>
Date: Tue, 02 Jul 2024 02:14:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc6-174-gf516b72fa9cc1
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 19 warnings (v6.10-rc6-174-gf516b72fa9cc1)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 19 warnings (v6.10-=
rc6-174-gf516b72fa9cc1)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.10-rc6-174-gf516b72fa9cc1/

Tree: next
Branch: pending-fixes
Git Describe: v6.10-rc6-174-gf516b72fa9cc1
Git Commit: f516b72fa9cc1236aad49df8524fcd99c945b616
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:
    haps_hs_smp_defconfig (gcc-10): 2 warnings

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-10): 3 warnings

riscv:

sparc:
    sparc64_defconfig (gcc-10): 14 warnings

x86_64:


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-p=
rototypes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no prev=
ious prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototy=
pes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-=
prototypes]
    1    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no prev=
ious prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-protot=
ypes]
    1    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous proto=
type for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous proto=
type for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =
=E2=80=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype fo=
r =E2=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    1    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cel=
ls' found, but node is not an interrupt provider
    1    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt=
_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node=
 is not an interrupt provider
    1    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
    1    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_p=
rovider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt=
 provider
    1    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is n=
ot an interrupt provider
    arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_prov=
ider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' f=
ound, but node is not an interrupt provider
    arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

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
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

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
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 14 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype =
for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype =
for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous =
prototype for =E2=80=98__vdso_clock_gettime_stick=E2=80=99 [-Wmissing-proto=
types]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous =
prototype for =E2=80=98__vdso_gettimeofday_stick=E2=80=99 [-Wmissing-protot=
ypes]
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
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

