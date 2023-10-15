Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69CEC7C9C80
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 01:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjJOXAQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Oct 2023 19:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJOXAP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Oct 2023 19:00:15 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030B5A2
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 16:00:13 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b497c8575aso2174509b3a.1
        for <linux-next@vger.kernel.org>; Sun, 15 Oct 2023 16:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697410812; x=1698015612; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u7zGsTSY0ii1ZCTm6WembLwpATcD2dBZ4NDn+LmVop0=;
        b=t9aoeVXIgo7r7wjBKaGnJht5nFfpFJRzhQiIiKL1UTjDkZsQRDutoGrVWmu1Tz8sq4
         Sz6yc2web3IaGnUiAOIRapla3RZ1zQYkYDnIdvkknwf795FvYwsxzjvR5VlOj88MDNRL
         17lJp0KMgqDZqg7ukurOD3pGXkr3b4lCcX2vXvCVi/4ysO5E9eSHIJTiN7VUYJYXog9G
         PB4Wnpx8BPtV3hGvFpo4a8vYyqTNvMGBFpGbd8LVP6AplR/NmCMV31Kgjgj1hNfTzqns
         Oo4dsmVgwzGx2CtbWk9whwTuEkoe4qVF0Wt1zCGEQ/uYpNwRjFVBC+9wl1wtrU6ybLXX
         AX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697410812; x=1698015612;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7zGsTSY0ii1ZCTm6WembLwpATcD2dBZ4NDn+LmVop0=;
        b=qy8wxcNtk/q1Of+2mmSCptZBhud5IF2hvoSvRE6yGgRIfXDAg6PSg4dlJCcSOTbLeD
         KLR92mvafeKL37NcyO6zY9lKGA/3off04bKJEfTBAeLCCRYyKP46agc7iJIP6/MILPQm
         6LqsfE0iLn4EIT8Gl6CpUGzaA/kNhmc2jy8eeKrKqYExJMdq8MhFXMJ6wXaZCDbVh5hb
         YVvsKtG8n0x3gn5iHDQfrXvuhe7BCpQvQXfw69mNoXGm503DHHKSCUysGur3Fx80HMHe
         8Qbi40lOgoB1a2WYDb5SlSul1/JXvdJaC456WO7PefG+kYh601lFjAcg8fr5ea4ZeiMs
         AAMg==
X-Gm-Message-State: AOJu0Yx3dPQU3DNx9kAAH2HOw+GiezYiNUthhIhovoE+/HdsiJoVZ3oQ
        3Z4flDFGAF2LanLkIcCPtQRxfaPuu/ilheK3sjT3+Q==
X-Google-Smtp-Source: AGHT+IHw1kKSMbuQNRMuIvG7c83Q0GNP0Kuh9DNRSSGAV8L8jz4vBT/FclcpkAtM6OuvmK2/c0HKFQ==
X-Received: by 2002:a05:6a00:21c9:b0:68f:c7c5:a73a with SMTP id t9-20020a056a0021c900b0068fc7c5a73amr36380717pfj.16.1697410811013;
        Sun, 15 Oct 2023 16:00:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i130-20020a639d88000000b00578b8fab907sm2527483pgd.73.2023.10.15.16.00.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 16:00:10 -0700 (PDT)
Message-ID: <652c6efa.630a0220.592d3.61b9@mx.google.com>
Date:   Sun, 15 Oct 2023 16:00:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-220-ged04e49eed957
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc6-220-ged04e49eed957)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
6-220-ged04e49eed957)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc6-220-ged04e49eed957/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc6-220-ged04e49eed957
Git Commit: ed04e49eed95720c0264e0cb136569b13d87f62a
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
