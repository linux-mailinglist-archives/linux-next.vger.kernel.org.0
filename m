Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB597EA7FD
	for <lists+linux-next@lfdr.de>; Tue, 14 Nov 2023 01:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjKNA7H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Nov 2023 19:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKNA7H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Nov 2023 19:59:07 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B65D50
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 16:59:04 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so46067255ad.0
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 16:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699923543; x=1700528343; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8WzSeGKYEvao36XqgvbtxWSpesGG6qZW9+jCQiOIy5Q=;
        b=T0p//5P2/ZxvfH/n8J0+30TCBhtxMw4tu+JbiWpaa4IWlmZgidMwwyBj9F8BDE4xRI
         zWVFHzUdx6mncO2ypCodQirrCb6XwXIlh9bAxm7hWm7xm//903z7sOv/i9ZFS+TuPGhA
         LL2aB9UJpMjRoxWY+qK342NDYJ+z8wo5/43xuoylWkBDyUIwdLjNuObl6dJY46wUz/tz
         bBTHXOZaDfhnf6Mlm3YpxFY1VRDu7J8IeHn8uZDcLx2VHAqTLb51NeEC3LzKZsB/ZONC
         EimzphhE9QhuXOV8/C3Wsofy96dhobuROHHSWbCqUkdJckSvDPTiWT0YhF2XdMAFotAs
         jO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699923543; x=1700528343;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WzSeGKYEvao36XqgvbtxWSpesGG6qZW9+jCQiOIy5Q=;
        b=iNsby0Fqi4xYodYInHFBcca9sOHcx9dQuF+2HHU4pCC8eZv8ebSkRlB1ypoSzyeR+9
         dGQNg0AFsLXCV9pd3NMYVMvA6aIDfYXGU2B+0lOGCJb474ueNuDzjah+Bf2vyVa79uE5
         vjt/wX2f0QzZmzvGSB4pcJlWgHSSfniKaAsMXbYssLrajWtfp70d3waobF7AconGcy++
         HTdsmN6oQ3oWH2sEndsx9dQyGCGolUtSPgQs4iHGEKA6lm8RD+UYw+gjCYPLiM7XjDru
         AlXezVDMQkk6kbIxrvblTJ8CplvjNKfrMQREornZ7v5CdNLxf77m4kr7M2/pbZbSihOV
         9g2g==
X-Gm-Message-State: AOJu0YxLd5va3KH9r0UX/vn11Sl2xIjEg1h06hjFateOXSue+8D0qcdS
        2OVW63aSZ6lacvtQQ8zpe/MHJkvB+KoerTTuOup/rQ==
X-Google-Smtp-Source: AGHT+IF0CENZizvSTmdQtHrDOrVI4GaxyTQMp/2DnYEX87iqeOH2u8FaQxW4OH6F/YUktajrVkIkCw==
X-Received: by 2002:a17:902:d30c:b0:1cc:43d3:a323 with SMTP id b12-20020a170902d30c00b001cc43d3a323mr863275plc.25.1699923543104;
        Mon, 13 Nov 2023 16:59:03 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix2-20020a170902f80200b001b9dab0397bsm4619985plb.29.2023.11.13.16.59.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 16:59:02 -0800 (PST)
Message-ID: <6552c656.170a0220.c6894.ab60@mx.google.com>
Date:   Mon, 13 Nov 2023 16:59:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-105-g3e62c2378662
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc1-105-g3e62c2378662)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
1-105-g3e62c2378662)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc1-105-g3e62c2378662/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc1-105-g3e62c2378662
Git Commit: 3e62c237866283141aed0ba96610eebbbf2c2833
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
