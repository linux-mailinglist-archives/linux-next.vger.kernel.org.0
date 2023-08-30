Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D55C78D194
	for <lists+linux-next@lfdr.de>; Wed, 30 Aug 2023 03:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbjH3BMP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Aug 2023 21:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241488AbjH3BLp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Aug 2023 21:11:45 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B299295
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 18:11:41 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a81154c570so2963703b6e.1
        for <linux-next@vger.kernel.org>; Tue, 29 Aug 2023 18:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693357900; x=1693962700; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V6wvdA2B5VFJh/53F5awtc9bwPwaf4TvENpVpNEtbm8=;
        b=htkdxQwwjs9Wfbju+zqh/Tk5AJYMl07aI8Z7Zc3yVjuMZ2NnpDCmlAzpr+tovU1lr7
         p5z9t88RNF7roY5MXMMoeHctukAod5inXEnp6cs/UYYZyhFzaa48ekUnxF3PNkryxu19
         T1AqubTv3UE3ZVKiRPxMDFuQLmqsEy+GLuggJ6dsLme44xp/5c8DbpWl+u3qsDe8FTuQ
         UBJrApVYTomkBPllEi2FCHMj+jbmvKLESLtlD2jBpgXABoG41QvlHOGOnyP02yEvrCdu
         W/xy7Ab3qDZ4iu7zO1IR0PkOvBIlBwq7ZrZfZho5U1tM8K0WTdSvdTvYk1DvEoHqPIFk
         am0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693357900; x=1693962700;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6wvdA2B5VFJh/53F5awtc9bwPwaf4TvENpVpNEtbm8=;
        b=RfX6+ySnRJRsIGbWaAQdBIkka/pPCAX1qHSjgrL9kd8Bn/Ayk9kBQWaNK53c2QFNuq
         9cjtDHVcBAowkP1LotaytuQgEx71NFV/O9k6AtgUMGwfceRQuVbW9P7JkmV99iIwLjCZ
         IV/JoUEkinWpzBE3e+PId/Qaeo30S7/GrYFq5H3K5yu9iJZNL1TztsHXtKqMcVR8nVCV
         yJQodpLgCCG/rk5D+n9OK1Fg6kxMkFN+HY+p3n2/iF+4o9mPOkkU+x7UfGq935rdfqze
         B3SBzHqbp2gXDaVukiddjeE8e/aJnNU6/sBvDhSTJSi90cmTQhma+MvaGVo6H9DSomuJ
         kv9w==
X-Gm-Message-State: AOJu0YxSA77DyJeaBFurThmBAmKxIc7mqSGZD9fNBRPQcwAsliwKc0Zi
        pxrVprYyG1jNrXVcYAlaoytfFWHQXbNl/Y9YkDI=
X-Google-Smtp-Source: AGHT+IFzKHOxblr7UO2NMHh/G44v3CL0+rRI3EKMPTvI88iXE9F8cMXmTF711Pvg+FLpD09KdFQTQw==
X-Received: by 2002:a05:6808:bce:b0:3a7:7bea:d3cc with SMTP id o14-20020a0568080bce00b003a77bead3ccmr1079268oik.0.1693357900689;
        Tue, 29 Aug 2023 18:11:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id e6-20020aa78c46000000b0068a0b5df6b2sm9048999pfd.196.2023.08.29.18.11.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 18:11:39 -0700 (PDT)
Message-ID: <64ee974b.a70a0220.12f37.fa7f@mx.google.com>
Date:   Tue, 29 Aug 2023 18:11:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-5353-gb22935905f9c
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-5353-gb22935905f9c)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-53=
53-gb22935905f9c)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-5353-gb22935905f9c/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-5353-gb22935905f9c
Git Commit: b22935905f9c5830bfd1c66ad3638ffdf6f80da7
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
