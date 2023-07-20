Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA9E75A445
	for <lists+linux-next@lfdr.de>; Thu, 20 Jul 2023 04:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjGTCLw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Jul 2023 22:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGTCLw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Jul 2023 22:11:52 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FEF1FFE
        for <linux-next@vger.kernel.org>; Wed, 19 Jul 2023 19:11:50 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso160350b3a.2
        for <linux-next@vger.kernel.org>; Wed, 19 Jul 2023 19:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689819110; x=1690423910;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NDBRWB18MzLIXySYfMWkzfjrSO6sPePPwt0ugaUKkU0=;
        b=ee99J75bIcZ+KE6fS0aGvEsMfXoj29qlhb33IXj3BOh2K6tscLnopqR78KORrWVv1O
         eHhFookhzVYtxxc8utZWQ1gN0iwru1IuougVO5hHBYdPG3CtNsgJeyxilEcpjrQuqDoe
         FUgavI1Lw44FFSh0y3cZiHFig80PTS0BgL3WVbv5ksZrzWOAdB08Kzm+o8uHRdQhDyqH
         OhhnEf5mT1m9IQK/2gh8Sqcp7mPYzpULP4iuBm8/j1e0v/CWRgV96lkkhJqukKO0Mn06
         ILkqKiDqgIfE3nMg8tJeOV7yKCZGGkWkHPGW5yl/e/Cdd7aPnhZUkDH2Y8ag3HU2iJiU
         bRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689819110; x=1690423910;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDBRWB18MzLIXySYfMWkzfjrSO6sPePPwt0ugaUKkU0=;
        b=H5DXFWAPRD/1+Gw5ME4qUxPuKUbrnsExV8rQ/EyNK4USrK+Pzcc8c5koRINO5azmbs
         1RAVsMslkUR4vlVNLusv2Z1xVx2NhoyOs76aqAQh9JeeDHmdhKpBPCf3Avey6x/cVwQ5
         uBNT5898AMjEUlTHGo8k4DAP0wGy01uDF7icrrbzkAA+2LER160Eb948gK95tb+1WI0C
         SWYKOqL+L/WQet6gr67w+zwqd7kgZwIWniuIzgd+mWCDYRqYoIB35dW4XlaHhEmhy6aE
         3F3nWiORF8TgSu7VTFCzliJJHrKm7Noy+KNl3Z8mUvXmkNZpxk4AkLES0xIh6CBkEdI7
         d8pA==
X-Gm-Message-State: ABy/qLZ4xrk8NWGzRWtUl8smHinsi5EskcrUiRgawVw6NZv4EjB6a/13
        MyJTM0WJCRwAY2jrhpihxfljIVEMRIrbOEJpLGBnjQ==
X-Google-Smtp-Source: APBJJlGH5pOFDZrlpAM/3IWVxS897kC2Ly4VGVjrUiePekSlVqWFtX5oG+PiIuC+0JdGownYSmSH6A==
X-Received: by 2002:a05:6a20:938e:b0:127:796d:b70d with SMTP id x14-20020a056a20938e00b00127796db70dmr20558375pzh.61.1689819109764;
        Wed, 19 Jul 2023 19:11:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l1-20020a170902ec0100b001b694140d96sm4696132pld.170.2023.07.19.19.11.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 19:11:48 -0700 (PDT)
Message-ID: <64b897e4.170a0220.96fc0.b88a@mx.google.com>
Date:   Wed, 19 Jul 2023 19:11:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-353-g4b0f0b4c6081
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 6 builds: 0 failed, 6 passed,
 4 warnings (v6.5-rc2-353-g4b0f0b4c6081)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 6 builds: 0 failed, 6 passed, 4 warnings (v6.5-rc=
2-353-g4b0f0b4c6081)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc2-353-g4b0f0b4c6081/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc2-353-g4b0f0b4c6081
Git Commit: 4b0f0b4c608145d083dc9c63794d376e41db0b47
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 6 unique architectures

Warnings Detected:

arc:

arm:

i386:

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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
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
