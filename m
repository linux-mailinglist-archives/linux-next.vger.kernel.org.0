Return-Path: <linux-next+bounces-3179-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED8943C0E
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80B7E28135E
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 00:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE381A4B3D;
	Thu,  1 Aug 2024 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="nyTSVkGw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2061A3BC3
	for <linux-next@vger.kernel.org>; Thu,  1 Aug 2024 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471371; cv=none; b=CCr2BYDow7NXQxnw5YoGlorgxAEaExCrBRhV3z6mH3IAqtIW80L5XoUVPgUQJRqyPDYo2JSKMxKLNnfH1RkynSgAE/perjM/sca4taB8F2h3fN0H4l84TwH5pj1eFh6qxvO3GZzmgRLc/3B6FxvaY5m1T6ZyvrCL+HyKTqYPgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471371; c=relaxed/simple;
	bh=IpYCX6uaQv6BdWrNG5IPk59NUTgdW4I83g1/vumoPe8=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=Zig2srZs/vajMSGig7CMfD2BGae5Rb/NTjQ3h6LfX/XMjREJ1r8I/EFZ/Hzkaj1ZGfbXoK7pUQHTJGxlQvZOqaahdp6DGM/uHw/aZRgV8UZjbJbZL15+FaRM9Z9fdI81NArGBVo2y5j52jh9TIfFFJHNBjdcoKhFeG7pcw4Ai90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=nyTSVkGw; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2611da054fbso4077630fac.1
        for <linux-next@vger.kernel.org>; Wed, 31 Jul 2024 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722471368; x=1723076168; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJsmAW8gjufuHO4u2VrHNAyL/OA08WG7NgpVnL2q7dA=;
        b=nyTSVkGw/m2/OoKw8q+RjZzqO1W2gPftGyhGG08v25VTwdhK9kw0+yAwmyzmxLn5q+
         Hkgi4gvwiFUP3rOtLryt6uUVqPtiqKzuDYCpTs6T+4vJ7mGCBUIfolYORu5hnDU8UyZK
         3/+QQkAZGAHKgasUwQ2b2Y0QwZDf1ZnRCF+7p+JzNlM49Di1GLU+6Y+m3EQLDWGFhiuu
         odRe76bdXdEeOh3UmOYBHOyFB1iQG3cx33kpiSeGRNTUGC2NWyIeaOfPb58mjjVAloQW
         0RIPovg2nWISm8CkrlA6B8CaBkA+L5YxiVYXz06YiUGTdV0+86gJ1TvZ9Ky3N21tcoBZ
         9zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722471368; x=1723076168;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJsmAW8gjufuHO4u2VrHNAyL/OA08WG7NgpVnL2q7dA=;
        b=JKvtC3/FcrghtVof11OX9wrWKwdu3WvqVvqm0cyHgvsYmeNFmY4ktlJK+yNjEBZtlV
         /uzRdozSrPUpyXZYeEygNDL4JR3jgV0wYxmEA+zDknUVAjbNUO3e7UJ1yYFxRHryxQNO
         UmPY2jv1CNkFQiLFDIJFhUMfkq+/1NlNA3fD7OotVyXcQUyxowZe93FMbwrwpMV4AsN6
         myLAcjjISx46YsmJ5XcHvX/gja0bY3JOYNKettgz5LITfNglsJKHNY6R8xB743+634MC
         y1136StfysuPGEFhRM4Y8snBHJX4DhGJKrl2eTiwYYt6cNLuEbfzRvvNoEx44SWyyfbK
         zgaw==
X-Gm-Message-State: AOJu0YwF9cjOSef4NTTb0jOxeqmWfRBSmaOSwLo8iToSWlN+2vR95DyT
	ZcXQzF5gVbCEjQdZZ1Eva0vAsuTrI1SGSOrGUo4u7jSMEtDearJmy7HhR5dCbaCS7XGWPuDuS+d
	G
X-Google-Smtp-Source: AGHT+IEl6uNYWmu6/RIhBALtj/W3LOw25VvfwekmecXE1uXRLUDOnPrlfK1kuwnpjcx+Mq7WKx+DhA==
X-Received: by 2002:a05:6870:9128:b0:261:1c5e:29d3 with SMTP id 586e51a60fabf-2687a3b7c74mr946869fac.12.1722471367978;
        Wed, 31 Jul 2024 17:16:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec374bsm10946652a12.67.2024.07.31.17.16.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 17:16:07 -0700 (PDT)
Message-ID: <66aad3c7.630a0220.f74f7.daca@mx.google.com>
Date: Wed, 31 Jul 2024 17:16:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.11-rc1-314-g22645e656434
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 23 warnings (v6.11-rc1-314-g22645e656434)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 23 warnings (v6.11-=
rc1-314-g22645e656434)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.11-rc1-314-g22645e656434/

Tree: next
Branch: pending-fixes
Git Describe: v6.11-rc1-314-g22645e656434
Git Commit: 22645e656434a5f47e33fca73b4a51513e3252ea
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:
    haps_hs_smp_defconfig (gcc-12): 2 warnings

arm64:

arm:

i386:

mips:
    32r2el_defconfig (gcc-12): 3 warnings

riscv:

sparc:
    sparc64_defconfig (gcc-12): 18 warnings

x86_64:


Warnings summary:

    2    kernel/fork.c:3072:2: warning: #warning clone3() entry point is mi=
ssing, please fix [-Wcpp]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    3072 | #warning clone3() entry point is missing, please fix
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
defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    kernel/fork.c:3072:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3072 | #warning clone3() entry point is missing, please fix
    kernel/fork.c:3072:2: warning: #warning clone3() entry point is missing=
, please fix [-Wcpp]
    3072 | #warning clone3() entry point is missing, please fix
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

