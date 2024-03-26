Return-Path: <linux-next+bounces-1731-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F288BA30
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 07:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D3A2E52A4
	for <lists+linux-next@lfdr.de>; Tue, 26 Mar 2024 06:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5E12AADE;
	Tue, 26 Mar 2024 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="C/E+3Shz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458612AAC7
	for <linux-next@vger.kernel.org>; Tue, 26 Mar 2024 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711433190; cv=none; b=IcywRLW7KMYaXSg1BgHllAzmhrY+5vcHyRALiCyGk9+xeU7pJ6svSDjHZmEw7VR5huJP1tSiR23lsa7zFBKOHzfJl7FcYdCVrDhq3gjb4kuU+utwOd4NXqdzmTxl9sowGr6pnK57pa9cOaECSZ875Wp1rH1K7Y8Il/U6ghfCyf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711433190; c=relaxed/simple;
	bh=kzhMSFJ0cxM0EUCSvKEd9Q2fmTQ7zCXtwnPYNUcV1sM=;
	h=Message-ID:Date:Content-Type:MIME-Version:Subject:To:From; b=HNGkuiEs581wBqJjLXb2FldHb2dUpvQR/yL8hTydoHp0Z49Y8MsdPmnF2y9YL+G3Jf+elJX+0gJ45YUm6yv+EXb+5NSyoY58wZmpRkz1IbGvQ5W6QzaJttb2p0UMt/tPBdGGv+dHfFf/KplClud6NzN0gII/pi2ut06xm/pM1Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=C/E+3Shz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29dee60302fso4178894a91.1
        for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1711433187; x=1712037987; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ikcsZ05CjfL8wlf/F0X9f4vXJ4IzOQdKcLbhezZFhCY=;
        b=C/E+3ShzTY5IiOnO7GBO40GjsQIkbSdN2SXgQ16m4Hq7rioZdDIuZ9n5TgPz/2/Pes
         EKpFcWBK4Zn6jG7GXFsxCquPdL13uMZVSTtraFEPSTtJL7dWcqBYhdlKgNI6AqRibXyY
         U7+l8hNhbUSNpoTMYhi7iw7TKkpMdRt9KTNBKdoywF7ZzEVbaebYF+veNzThu9m//j1z
         fjO9rNTBLBXDVHIgHvSD71VLVq2otZ9P3RxutNVCgRhVzTLC9b6sEzoO9yBxf4b5Dn12
         ru2G5lbVrA8hXoqGJHxQkzNu4N4/KC3IzLQ7pfoiLPTzRHf143jGeTODTKVGz7hFLlLr
         FnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711433187; x=1712037987;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikcsZ05CjfL8wlf/F0X9f4vXJ4IzOQdKcLbhezZFhCY=;
        b=dhdgELKLcoIzp+l3FX9+nzGA/ZOufJZX//Z8imnnj/0K/VeyZdLTT27ZmIfdQ+IhuE
         jEPMS84DxjnnJobbjh+wcwPjBFQRACCYKLa3QEtdUG52vOQ+zsZaxX/72fvIzQXzv9+n
         yf1tiISXyLzWSlyjpkuazTaDfMqvRuBSPqM21oCMjAqJn8w53HKRWN+GZz4rUlYPifhB
         jlzI+Sal5sGgfAQFigUPBgvnOfL5GBm4tNq0ol0VDTUaC3glQOCVULCGOcXUfYfPGPzN
         fUfVksWWSkaTV722rOiqpV7BnUA3kQ+20YbSz+C6NEUZYx+dTlbO0aC8qg3pVmdJFTgl
         Dqvw==
X-Gm-Message-State: AOJu0YwMGRgbN7gxOH0XQihPV6w+OcJcGImvou6GKMZBkYqK30mQXnFN
	nOb42224VKWBxmba3Txa4MzpN/oE3lYSTkwl0cPhP/JZoTKXkNHWd5bRzize7aMiIdKoFKIZdXQ
	3sdo=
X-Google-Smtp-Source: AGHT+IH3b9Am8wRFr/92O1QVG0STDGRgE3xnS/qspQgVPh3ehcsQu4oSX6fD857WMRhB666jCeO7Aw==
X-Received: by 2002:a17:90a:9bc3:b0:29f:b7ea:1896 with SMTP id b3-20020a17090a9bc300b0029fb7ea1896mr803591pjw.6.1711433186856;
        Mon, 25 Mar 2024 23:06:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m9-20020a17090ade0900b0029bc9c34a39sm11151384pjv.50.2024.03.25.23.06.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 23:06:26 -0700 (PDT)
Message-ID: <660265e2.170a0220.67969.10f3@mx.google.com>
Date: Mon, 25 Mar 2024 23:06:26 -0700 (PDT)
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
X-Kernelci-Kernel: v6.9-rc1-138-g1dd178de4965
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 1 build: 0 failed, 1 passed,
 26 warnings (v6.9-rc1-138-g1dd178de4965)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 1 build: 0 failed, 1 passed, 26 warnings (v6.9-rc=
1-138-g1dd178de4965)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.9-rc1-138-g1dd178de4965/

Tree: next
Branch: pending-fixes
Git Describe: v6.9-rc1-138-g1dd178de4965
Git Commit: 1dd178de496596098b5a4002c791867d9d73c80a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 1 unique architecture

Warnings Detected:

sparc:
    sparc64_defconfig (gcc-10): 26 warnings


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =
=E2=80=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
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
    1    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for=
 =E2=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype=
 for =E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype=
 for =E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototyp=
e for =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-protot=
ypes]
    1    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototyp=
e for =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype=
 for =E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototyp=
e for =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototy=
pe for =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype f=
or =E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype =
for =E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    1    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype =
for =E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 26 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/sparc/kernel/traps_64.c:253:6: warning: no previous prototype for =
=E2=80=98is_no_fault_exception=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2035:6: warning: no previous prototype for=
 =E2=80=98do_mcd_err=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/traps_64.c:2153:6: warning: no previous prototype for=
 =E2=80=98sun4v_nonresum_error_user_handled=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for =E2=
=80=98vmemmap_free=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for=
 =E2=80=98alloc_irqstack_bootmem=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for =
=E2=80=98sched_clock=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for =E2=80=
=98init_vdso_image=E2=80=99 [-Wmissing-prototypes]
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
    arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for =
=E2=80=98find_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for =
=E2=80=98alloc_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for =
=E2=80=98del_tag_store=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype fo=
r =E2=80=98dma_4v_iotsb_bind=E2=80=99 [-Wmissing-prototypes]
    arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for =
=E2=80=98uprobe_trap=E2=80=99 [-Wmissing-prototypes]
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

