Return-Path: <linux-next+bounces-3158-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9C940947
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 09:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF262282E0D
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 07:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A9E19066F;
	Tue, 30 Jul 2024 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="cwbniyp6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB37190666
	for <linux-next@vger.kernel.org>; Tue, 30 Jul 2024 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323674; cv=none; b=uq7F37Ok+ZdoGF/1qvSrtvAYIxzyrTUlW9KprShQUQKzXALrMYjW7+hiYgLK6iyUxELC4TnPqW7cp0YpydXzg5YvWUcQAnS8dA1q59rTRTm8E1YLwNftoR6fPCWSYFvgKuWCyM82qXXgZVepzPhaF9XpVl5JF486f3ktrldI3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323674; c=relaxed/simple;
	bh=sRn8mTrX2CqwaZUhUJrIwU4/RJek49Focd9GLJletAk=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=J2ycoIf5Nc7IwuqRjzmkg/MlzfUUuSMIbVnE4VvRyqqaACaGPP/9wlzFwVjcC+2W+wh2wqWsxUFNHHkX9c4UAKUWuplobnWm9L09RKU58nz8PD+dQhcCf2BBfvlw2memis3N1zddvdPWfnc49xnWkcZ/ZSFDukNHSb1/VnhoU3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=cwbniyp6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso3656117b3a.0
        for <linux-next@vger.kernel.org>; Tue, 30 Jul 2024 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722323671; x=1722928471; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=my6eSsImCzZ1mqIBgWSjmvccpyVRDoYWelkEeNKHfDI=;
        b=cwbniyp6RREt5zNpYsG3rrVFkLPAVrbSVl0F2xEnUBVzn6jILBcYdPgU2dotosuFgN
         8mlRgQ2MJ7E1kgDA8DYS4XNB0+EcHKgRr9NwDf1H16f21r6sceMZWDHFAgDf1n7yRjLQ
         HF2tBDccvOvuBWIuUj/y8AiPf9hZ5oZNKeKvShYOMAkiqFoKHpZuitJWoCuBAeq+4nPH
         vuF4S0VYLexv0DJMiHwi5+p80qbSXiIiec22VbV4vbO0DGpUDxDgyTii29gsqQ7Oo5Z7
         piLGKbSDGNRVCzqle3l7mQ+tVzxtfc3QRe2QGU6ZnNBecDoX3ae+SACOHgqrc7t/Pu8F
         Drew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722323671; x=1722928471;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6eSsImCzZ1mqIBgWSjmvccpyVRDoYWelkEeNKHfDI=;
        b=VnJSQzoOYs0l8ctjONY98EpxI6aw/CwWHKyBXHKCVfSFGlLz4J00Lcm50X+mvTyVn1
         hNcrXYMM1MAerPaHa/UO1L8oXDcqSE+2Kd8AwXVSyP7lvE47X0ws58YibvnvXQeZeS6P
         grj2WyP4vA1pOqKkCpvGmD0zWGNws/DZ8r7Lq4334ir0eP7PWVzogD9W6hkkkLWrDZSi
         u9nH3YarkodbZCUyqbKuhqdF7yCiNgl4kQKj78I0PGoTZfmKrAHcwqQqRZu1LWJAb7sA
         WZ5VDY9Cto0uMTPvoQ4hL09ZAWmXdDeSCw6AZ5HHCkgzonb/bLBYgnFX6AlzOQD+CcLG
         RDtA==
X-Gm-Message-State: AOJu0YwlEdXG0nHu2fD5MRTst9m9HZy3G/7wlM61g+rWkEXHonEOm8tp
	KWUsnc/AM5nSSNVoZU28seaVX9vuZ/rTk9SedFsVGBZpmzK1w8ZRb8NOWVJFf7MOLI695WnAbeT
	i
X-Google-Smtp-Source: AGHT+IFtbz2QC8Uy9xLfJPp/hD6d3N6Jft+imW4WCzPdqlzS0DNepHowwM27j9iLobL9RAZcFtgdeQ==
X-Received: by 2002:a05:6a21:33a4:b0:1be:c2af:5626 with SMTP id adf61e73a8af0-1c4a1183d59mr13468505637.4.1722323670805;
        Tue, 30 Jul 2024 00:14:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead81270bsm7826170b3a.107.2024.07.30.00.14.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:14:30 -0700 (PDT)
Message-ID: <66a892d6.050a0220.eae4a.3394@mx.google.com>
Date: Tue, 30 Jul 2024 00:14:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.11-rc1-181-g985785dd5ee1
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 2 failed, 6 passed, 4 errors,
 31 warnings (v6.11-rc1-181-g985785dd5ee1)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 2 failed, 6 passed, 4 errors, 31 warnin=
gs (v6.11-rc1-181-g985785dd5ee1)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.11-rc1-181-g985785dd5ee1/

Tree: next
Branch: pending-fixes
Git Describe: v6.11-rc1-181-g985785dd5ee1
Git Commit: 985785dd5ee12a4124524909ee367a193977f113
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

i386:
    i386_defconfig: (gcc-12) FAIL

x86_64:
    x86_64_defconfig: (gcc-12) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig (gcc-12): 2 warnings

arm64:
    defconfig (gcc-12): 2 warnings

arm:

i386:
    i386_defconfig (gcc-12): 2 errors, 1 warning

mips:
    32r2el_defconfig (gcc-12): 3 warnings

riscv:
    defconfig (gcc-12): 2 warnings

sparc:
    sparc64_defconfig (gcc-12): 20 warnings

x86_64:
    x86_64_defconfig (gcc-12): 2 errors, 1 warning

Errors summary:

    2    kernel/profile.c:52:28: error: =E2=80=98cpu_profile_flip=E2=80=99 =
defined but not used [-Werror=3Dunused-variable]
    2    kernel/profile.c:51:48: error: =E2=80=98cpu_profile_hits=E2=80=99 =
defined but not used [-Werror=3Dunused-variable]

Warnings summary:

    3    kernel/profile.c:52:28: warning: =E2=80=98cpu_profile_flip=E2=80=
=99 defined but not used [-Wunused-variable]
    3    kernel/profile.c:51:48: warning: =E2=80=98cpu_profile_hits=E2=80=
=99 defined but not used [-Wunused-variable]
    2    kernel/fork.c:3072:2: warning: #warning clone3() entry point is mi=
ssing, please fix [-Wcpp]
    2    cc1: all warnings being treated as errors
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
defconfig (riscv, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    kernel/profile.c:52:28: warning: =E2=80=98cpu_profile_flip=E2=80=99 def=
ined but not used [-Wunused-variable]
    kernel/profile.c:51:48: warning: =E2=80=98cpu_profile_hits=E2=80=99 def=
ined but not used [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    kernel/profile.c:52:28: warning: =E2=80=98cpu_profile_flip=E2=80=99 def=
ined but not used [-Wunused-variable]
    kernel/profile.c:51:48: warning: =E2=80=98cpu_profile_hits=E2=80=99 def=
ined but not used [-Wunused-variable]

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
i386_defconfig (i386, gcc-12) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    kernel/profile.c:52:28: error: =E2=80=98cpu_profile_flip=E2=80=99 defin=
ed but not used [-Werror=3Dunused-variable]
    kernel/profile.c:51:48: error: =E2=80=98cpu_profile_hits=E2=80=99 defin=
ed but not used [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 20 warnings, 0 =
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
    kernel/profile.c:52:28: warning: =E2=80=98cpu_profile_flip=E2=80=99 def=
ined but not used [-Wunused-variable]
    kernel/profile.c:51:48: warning: =E2=80=98cpu_profile_hits=E2=80=99 def=
ined but not used [-Wunused-variable]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-12) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    kernel/profile.c:52:28: error: =E2=80=98cpu_profile_flip=E2=80=99 defin=
ed but not used [-Werror=3Dunused-variable]
    kernel/profile.c:51:48: error: =E2=80=98cpu_profile_hits=E2=80=99 defin=
ed but not used [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---
For more info write to <info@kernelci.org>

