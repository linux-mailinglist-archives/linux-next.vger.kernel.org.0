Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E279F969
	for <lists+linux-next@lfdr.de>; Thu, 14 Sep 2023 06:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbjINEIw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Sep 2023 00:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbjINEIv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Sep 2023 00:08:51 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1A91AB
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 21:08:47 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-573c62b3cd2so363072a12.3
        for <linux-next@vger.kernel.org>; Wed, 13 Sep 2023 21:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694664526; x=1695269326; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9b3Ig65rHMzki5xoHWW1c3OQzrBcCge1EtLjAfbbZQc=;
        b=YmrqMlwIjsKHBI66+L1WYqSh54p5WdOw4g7WFMcPra16HJbtHtlViNwWOiq93MqNZ6
         iLzz6TMHIWfrVfTm5QINcbrRlQiuAzkA/H6KwLGceVs2rw/sv+2XLqT0jJ+ftClKjJLL
         JqTMNr5iLCybLk74VT/ey6LXvkRzkirpLH4bVpS9n4QeNqEphmGWUHOhg4SIAUz2dx1k
         1F/Nl2bHvNP/PElZqyWm0Feq/d3aHPK09CuWX0mUYnhXm1La2pmf7M2GcRqqtdrwWhnf
         +VdacbgBIPI0gqtcBF0iYYCiWeLcv4FFSksPEPNyKWepL+Pjds08np4OJWh+OVY/Wj53
         eWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694664526; x=1695269326;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9b3Ig65rHMzki5xoHWW1c3OQzrBcCge1EtLjAfbbZQc=;
        b=K8jB56IMflfGWQMbXaKaaQcZZjCiO8DmRtKwYYG2s1XUqOzzWDMs3XD0BdOvxZAy7Q
         uoTBjwSVlJpcVQoi45IDICofVWvfsDtWzXpLlaqYBHxJsBsrh9S3jdYx5gaKr8k60ron
         ulWxxgXbNde6H2Nw+0uXDjLJawlReKhJoYsiKpRQsOz7Y1b8PszDq2BxDOmBjQwwLjEg
         +ULCLbahKzqNX1kuDrBBZ6sg2hFIaURfqlfOD3ucqqQPJi6lEJ/HX5Dut9RxJWsX+uDq
         O4Hziq3Bj7uwpTfyoGy7bID2eN1wGbbvWjp3oz8gd6HmPLVOGBAlEFfiprrLDDN4WHQb
         MmPQ==
X-Gm-Message-State: AOJu0YxwoES2IpJpHgIw9PZeeZ0i6UBv519uKgrlW9Vm41tYxeqGqcXy
        BpnEO7ztJDayUIfeKQOORTGuWI0essWmXQcl65k=
X-Google-Smtp-Source: AGHT+IFDq70OxA0j6PMr8PFjmJXX7ODBrZXoSrRqj35UfqT8fapH9EFuIk943o6S4sqpAjEnoEGnWg==
X-Received: by 2002:a05:6a20:3242:b0:14d:abc:73dc with SMTP id hm2-20020a056a20324200b0014d0abc73dcmr2591684pzc.32.1694664526270;
        Wed, 13 Sep 2023 21:08:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ab8a00b001bdcafcf8d3sm410884plr.69.2023.09.13.21.08.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 21:08:45 -0700 (PDT)
Message-ID: <6502874d.170a0220.e0e67.2d63@mx.google.com>
Date:   Wed, 13 Sep 2023 21:08:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-377-gbcfe98207530
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1-377-gbcfe98207530)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
1-377-gbcfe98207530)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc1-377-gbcfe98207530/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc1-377-gbcfe98207530
Git Commit: bcfe98207530e1ea0004f4e5dbd6e7e4d9eb2471
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
