Return-Path: <linux-next+bounces-2922-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6402592CB56
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 08:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C354B22B29
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 06:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB7924A08;
	Wed, 10 Jul 2024 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="fxCNp6Hb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36A59155
	for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594171; cv=none; b=nCWY+SUXwtBR/33mYvKYg8BmkcCPNRiOriskUZJyHaOrCASewuirwVkOBNnxixMUFg0ig4y/ST+qj4dmA35XPeSU90akSVeL2Z3KF3/Og0SgIJlB7uEMPm0Wo05eFliylNDauQ6svyi3TozyOOhms/+x/hYAn9d74ycA+bceimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594171; c=relaxed/simple;
	bh=KYIfu3gwB0gR3u6kQz46l0zqAm9D1L5FpKocX/XrC6Y=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=nFP6e+pqnf3dswUOrVHXXYATlXY6CNndKdvN3Li7W40UTUhCbOSNd8xpBiuJJr8mADSQO2iJbhsgPKNsdlpSgjVutFPdCUH/jylGxUxWNv2SaKuA0MjpIxgYuQMBSaPUksMBobO8mtDg4zYetr263S2foCie8Rj6Xz+dhZIxauk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=fxCNp6Hb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb1c918860so3271535ad.1
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2024 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1720594168; x=1721198968; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=evZv1EoLerIRncnFqFjyDJ20sXl5vGtyZbofN0y+DqE=;
        b=fxCNp6Hb5HsmfYLxu7LYXQ1DKoQ7pleHWRkbcsktXJlPcRlJVlMwXKLuUGU+bAKTNT
         0C60vh6+6tLZ+O+1tL2iSMiT260h59NxiokOmMjxZAwTqKhyDoD7V53j7HR0+HbirzHu
         4axasY+nB0W2bc9It4l0MWEkdPNRP9Pm7fNTG2SwS+jzEDjSn7cIqCErMpE/bhrl27Np
         XgyoiN+ftPpt/ByHE73q+cEEm4SO9AaGV3vWk6235P+W99kjJPPgoFma1RuMeTfgNDYx
         XZwE/BlJV6ZoMmA/ACCcwM6A5KPodyvJkCsgwJrL03q64KudOzvvRp3Q5hluulB83AjF
         OdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594168; x=1721198968;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evZv1EoLerIRncnFqFjyDJ20sXl5vGtyZbofN0y+DqE=;
        b=XlmvZcH1sbKZ/lPAndwffM4Xjmuj6oKNQhVIqHxzaNwzbT8mbAk9zAMIad1+jJ+J/+
         76517VYpuPEcOdGii+SOVGOISp4uA4zcXiHNUoZEt80E3a0sqGyy2dyptgaOdmImpfA2
         Nynrbtd3bvPVMsqRzQErHDZ5wIKYECuNAR4NR4PA39A6C10WP4R29iaQYXM4ykEOFWTP
         kxZ4kze0MD9ONtybQfxJXQn9+hii0UJU1m+BLgzmeVO+T5BQ/i+/I0eneilLoif/sg/o
         Ml9fQ+qH0yzXyQUGcLmjUDKiz+Otr91OGr+d6+sYP7kwXVzlCa54rZcFDT7JfWZ+jwrf
         /64A==
X-Gm-Message-State: AOJu0Yw93olh8WM5JvpDBNX6YGRWH6cnkYdPVfg1tpsIKKVGNI9JeT4g
	oLyqo7zlURocTuSMrRX7wSIjwnvsRSMfc6e7pN5lx22rixDmt0F2SS8KiCMV9s2FflghR98bnQU
	R
X-Google-Smtp-Source: AGHT+IEWCFVRQXJU68PG7S+OIsTFpjrmgw07IjyOwHHzgZM2TrcuSBiSbgr9ewFNhz3uZP+I0wXtjw==
X-Received: by 2002:a17:903:1205:b0:1fb:8e29:621f with SMTP id d9443c01a7336-1fbb7fea3d6mr60658795ad.16.1720594168354;
        Tue, 09 Jul 2024 23:49:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad5565sm26410985ad.307.2024.07.09.23.49.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:49:27 -0700 (PDT)
Message-ID: <668e2ef7.170a0220.27d52.b68b@mx.google.com>
Date: Tue, 09 Jul 2024 23:49:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.10-rc7-196-gcf99f48575419
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 2 builds: 0 failed, 2 passed,
 19 warnings (v6.10-rc7-196-gcf99f48575419)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 2 builds: 0 failed, 2 passed, 19 warnings (v6.10-=
rc7-196-gcf99f48575419)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.10-rc7-196-gcf99f48575419/

Tree: next
Branch: pending-fixes
Git Describe: v6.10-rc7-196-gcf99f48575419
Git Commit: cf99f485754191e2a2e7374e00c4c68f0d452f55
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 2 unique architectures

Warnings Detected:

mips:
    32r2el_defconfig (gcc-12): 3 warnings

sparc:
    sparc64_defconfig (gcc-12): 16 warnings


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
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
sparc64_defconfig (sparc, gcc-12) =E2=80=94 PASS, 0 errors, 16 warnings, 0 =
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
    arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for =E2=
=80=98prom_get_mmu_ihandle=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for =E2=80=
=98prom_cif_init=E2=80=99 [-Wmissing-prototypes]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---
For more info write to <info@kernelci.org>

