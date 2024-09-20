Return-Path: <linux-next+bounces-3928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C197CF6C
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 02:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 137B8B21565
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 00:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C4DEBE;
	Fri, 20 Sep 2024 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Alg5wcHa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082710F1
	for <linux-next@vger.kernel.org>; Fri, 20 Sep 2024 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790452; cv=none; b=VTEo1aOJ7pjiBwPGjtY3evQAAdiN3U19lj8ZpXQNk5YOKUMBQMbdqDwtgcymjtFes0Xc6HTQU5aAD19Gj4DJkGPJh1xpscwgHMgPZLLLs1WrQdSbIA7FpQ+bH4nLOQvCibzgz6DqTl7fUiDFzsiUwB/NnySvovJ9tVoIEHxWGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790452; c=relaxed/simple;
	bh=Oje1TP8T0rHIZX+tjbZGnFQil7wGkIASKJvVVndpIhQ=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=U5Bcg36xifkMD8pUssv8E8lngP8E62SgiyH9nTrmfjMkJiPosAfxbDodNk5fgLDUr7O9g9DomTcNMsHaLqkjNq7DAKfNAcKDnQDtL1DwUGCzgkLgwywh8lcDe6XKfV3V6e0AyHBOdpCUo48HEpoWphwleWpIVLZZuY0QBgDAuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Alg5wcHa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7198a7a1c01so1237116b3a.1
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2024 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1726790449; x=1727395249; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MsezkQlZolH4LIlnyX8hHbpSuL4R25wsKdjY2uNSWEk=;
        b=Alg5wcHanwqwSNEbTf8rok9I66KXrEZFhUYwonur2Sb+RkUqHkeLFvmGk8nwRGqM9o
         okYwzFunylup7tGLAILDvED5Qqae2Ry17DqD8rCNzYSW+wYDaR8YU0hM3fA7tygrM/Ru
         KXbM3SPuZAMuKA7QzHHVN15r5TMy9TzcCYkFE189xxF5V/paIhdZ1/Z3fcUo5+liKKE+
         Sk99Gn6a/4RxuNi0fdufEjfdgsC/nIJNGyuTyVU/CyVWnHoyg2JGAZ0ryIzfKucpyW4/
         qPZ4j3OE4XjwatUiHctAuMwHrecAP+y+cDawpI7kJoL7ImH33sAlfUimtqW1pqjZgL5t
         BciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726790449; x=1727395249;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsezkQlZolH4LIlnyX8hHbpSuL4R25wsKdjY2uNSWEk=;
        b=amxORXCWGzNFlI2+oPd/C/cRS0zFc+aUu6mRClVFnDkX5Bq9v/ESCSjfz5x3CgVKZQ
         9/OpbCbXl7NHN6k6kpB+z3rQ+k+FIBaeTsXXMrevWrXEBSmXgclVSbM0mgEv6vXfRARF
         qhWY6v3q16dQc1tQgni1u8lzILkCBQRXh2j5Y3OhXA29lCKb3hTzRHCmnou10ERfLR/z
         BmGVtllnTE1cOz6EJ5mf8OMRkgAKu8yofbbN0E245uYG5BVvhi/Xntn6485rmRh7gcrZ
         g81ri7Ux4QkVjLAXhamGyhPXjSCwpOrnBPwm0nVQkYg7ZfhMbcjN/4Z1NEhS0amu2sDm
         Xn7Q==
X-Gm-Message-State: AOJu0YygyYFkOo0iotBbzrJgFqjD3uk+h+CwLOrKwcbT2qOcw2st1Q6+
	WJTFA9tmS3CLU2nXDejlV4d9xQQw/Cq8gTnm8WJg6HmQWC98K42oBjxZLjvPU0eeRyBluCSI5ix
	2
X-Google-Smtp-Source: AGHT+IEC3Z8ZP66O34BN9pCFmQZUgzVn4iHUolwZE7z2lAdJf11CW+71hsKTOc33CqDnkoTonOepqQ==
X-Received: by 2002:a05:6a21:1690:b0:1cf:6625:f08 with SMTP id adf61e73a8af0-1d30a9d8559mr1786287637.45.1726790449093;
        Thu, 19 Sep 2024 17:00:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b007sm8815514b3a.110.2024.09.19.17.00.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 17:00:48 -0700 (PDT)
Message-ID: <66ecbb30.050a0220.33c5f1.519e@mx.google.com>
Date: Thu, 19 Sep 2024 17:00:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.11-7403-gbaafd75d7bf25
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 26 warnings (v6.11-7403-gbaafd75d7bf25)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 26 warnings (v6.11-=
7403-gbaafd75d7bf25)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.11-7403-gbaafd75d7bf25/

Tree: next
Branch: pending-fixes
Git Describe: v6.11-7403-gbaafd75d7bf25
Git Commit: baafd75d7bf25bfafa22ce8a23d5e00f474110be
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:
    haps_hs_smp_defconfig (gcc-12): 2 warnings

arm64:
    defconfig (gcc-12): 1 warning

arm:
    multi_v7_defconfig (gcc-12): 1 warning

i386:

mips:
    32r2el_defconfig (gcc-12): 3 warnings

riscv:
    defconfig (gcc-12): 1 warning

sparc:
    sparc64_defconfig (gcc-12): 18 warnings

x86_64:


Warnings summary:

    3    kernel/events/core.c:14012:13: warning: the comparison will always=
 evaluate as =E2=80=98true=E2=80=99 for the address of =E2=80=98thread_sibl=
ing=E2=80=99 will never be NULL [-Waddress]
    2    kernel/fork.c:3068:2: warning: #warning clone3() entry point is mi=
ssing, please fix [-Wcpp]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    3068 | #warning clone3() entry point is missing, please fix
    1    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o:=
 missing .note.GNU-stack section implies executable stack
    1    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missin=
g .note.GNU-stack section implies executable stack
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
32r2el_defconfig (mips, gcc-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/events/core.c:14012:13: warning: the comparison will always eval=
uate as =E2=80=98true=E2=80=99 for the address of =E2=80=98thread_sibling=
=E2=80=99 will never be NULL [-Waddress]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/events/core.c:14012:13: warning: the comparison will always eval=
uate as =E2=80=98true=E2=80=99 for the address of =E2=80=98thread_sibling=
=E2=80=99 will never be NULL [-Waddress]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provid=
er): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt prov=
ider
    arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prer=
equisite 'interrupt_provider'

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/events/core.c:14012:13: warning: the comparison will always eval=
uate as =E2=80=98true=E2=80=99 for the address of =E2=80=98thread_sibling=
=E2=80=99 will never be NULL [-Waddress]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 18 warnings, 0 =
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
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso-note.o: missing .no=
te.GNU-stack section implies executable stack
    sparc64-linux-gnu-ld: warning: arch/sparc/vdso/vdso32/vdso-note.o: miss=
ing .note.GNU-stack section implies executable stack
    kernel/fork.c:3068:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3068 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3068:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3068 | #warning clone3() entry point is missing, please fix
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>

