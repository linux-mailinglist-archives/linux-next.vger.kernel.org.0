Return-Path: <linux-next+bounces-3147-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB393EBCA
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 05:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5821F2152B
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 03:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED2178274;
	Mon, 29 Jul 2024 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="0tpMSHu8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A7B2B9D2
	for <linux-next@vger.kernel.org>; Mon, 29 Jul 2024 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722222639; cv=none; b=EEAPnKCRZCFAoDZq7UpoOpVh6OFSD4DE9Q1H4+/6sigmV1NChg8xWLJiuq2rZikdo18XElvKNg6FF/RUPBJOXUxiX6DkbCoCJRyxvrV+f+OGoAFYSNpcF5Cuv261JoqRMoQO7/O/oijydU5tUQRmAQnbnje6IWqmnL21ITkitag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722222639; c=relaxed/simple;
	bh=ql5piJ0A7w5GPpiG9y9MyPKw2WPIUV77XF/fZJM+um4=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=eAndjIAfdJefMOyg2m9JrvDp9diPz1puqJ51eDTNQoscKz3sWdN2DqUj+uHqpEjqbDS3CvF615rwVvmn355ri2yAuL5Yb7ph18iLgqd6o9LQd4DAqgepPg3QpID/myH7m6vYpIV0tZS6HoyNFZmcpmsQkU6VTXEPI9iSR615I/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=0tpMSHu8; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-66498fd4f91so14437767b3.3
        for <linux-next@vger.kernel.org>; Sun, 28 Jul 2024 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1722222636; x=1722827436; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8XMcWTyj0/8SNA1VhfWYuNATrB9ntRhwDSLlnvvv/mc=;
        b=0tpMSHu8n7vzmO1Xu1q/YJ35SQ23AtQ8mm780TXggeHTyhNCh8tgi8jrgDwpA8Y1AQ
         w8mExOkrlMvp1s/2IQbFtmaCXVOg3M+vqDfFKba/K9ImQKo5KstogSsbo7vt5ZslSwSO
         N7ZsmmS+Soaa/CrhRj6Hh99fOtgYaJt0/NFjOqq/HTrTuDlooZeTrr31zEFeLWXS6xr1
         QzFk4g8dj+QHn6OTqZnqnX4pLEbXHKAoKroB63adi53FehEeT4pbX5f+9wWBUc9PVQLu
         idwbRCLMhDFmd68YTEuy2MLABRYUOROK0QpBsfvg8j7JM+Snvzem6WVufuMdz6i7a/Mt
         4VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722222636; x=1722827436;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XMcWTyj0/8SNA1VhfWYuNATrB9ntRhwDSLlnvvv/mc=;
        b=IIl6yQvrU0vAR2v5CUAgbexWQkJoqIXlVVLymRVSZSOAQCkOWPGyeOrWNp3+BseJhb
         VanT6Mj664DomcLPGMrDUeH41cZ2POoW9Q2d+bYnstlrhK1ZyRQMABDjKmE9D+c6RGf+
         CgSlD80rmnR2usfPk+hBsak3004jFZal+ir2/cH4svzTp/aqcxiJpjLk7nv4BbKQfz5R
         M8YMa98f8dbkRlpxIoEz9imAWqb5eOTP4FSIIZhlXy69BurSqtoEa2ij3MxrgQl/dUyx
         wGtZ1svGBpfmVFHF4QrOBNTbzQIJYou3LuRlPdcrFTrwxaSqcUWUNANWzRCQmHzzim2Y
         E30g==
X-Gm-Message-State: AOJu0Yxnh27vYCsq7SDJlOCXjzb5TodrSwJUiIJZTMQITpJKTMo7sTgp
	n+W9sF2T1rjo00VNTDzuDWyncsj3UZ22vZYiKOhiyL2frTRlxN3QzAjuN724nbAZNezJC4mupnJ
	m
X-Google-Smtp-Source: AGHT+IHZ2jiG2TTNFJ/24536oboSgS3Mg5Hx2xia/kHFriOlP2A487URZZuWttBOYpvsYo+fB7TojA==
X-Received: by 2002:a81:a211:0:b0:64a:90fe:911e with SMTP id 00721157ae682-67a092a936amr72414997b3.31.1722222636008;
        Sun, 28 Jul 2024 20:10:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8834b1sm6117756b3a.178.2024.07.28.20.10.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 20:10:34 -0700 (PDT)
Message-ID: <66a7082a.050a0220.13770c.edce@mx.google.com>
Date: Sun, 28 Jul 2024 20:10:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.11-rc1-104-g06ea2053b2ca4
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 23 warnings (v6.11-rc1-104-g06ea2053b2ca4)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 23 warnings (v6.11-=
rc1-104-g06ea2053b2ca4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.11-rc1-104-g06ea2053b2ca4/

Tree: next
Branch: pending-fixes
Git Describe: v6.11-rc1-104-g06ea2053b2ca4
Git Commit: 06ea2053b2ca4f3d594cccfda6a0fdf21243f3c5
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

