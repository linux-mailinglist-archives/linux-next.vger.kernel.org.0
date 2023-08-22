Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA47783ACD
	for <lists+linux-next@lfdr.de>; Tue, 22 Aug 2023 09:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjHVHWO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Aug 2023 03:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbjHVHWM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Aug 2023 03:22:12 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880F81A4
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 00:22:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc0d39b52cso26366565ad.2
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692688928; x=1693293728;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FOvmfE+LtNcQN5TQbSvEjZ30LDmhBQ6rOGaxfMgttCA=;
        b=woy6PZW8+H/daVmzR5lG7bfhXxaDycdox1T9xtrwf6Zad4//gQBBuaXIq5wivtH2GD
         FTDp7z+76BbOg/XCiMsyDAFoim2ScxV7aq6x/4MghezLx+7HDi2h7eaq4F2rEGNhEXxZ
         Xr5fxQnoaOgxIz+vKR4pVTbL0bXRo8oOaLfl+MncO9T7MpaD7h1NPWfYoWAnvSLLxh/L
         qJ019vdoeQGtnBrGQNJ3AqMS8dv0PSOpJaspCx9cCk1AnKEJob0htV6KUK1Uugi+gUj1
         ux6vTopHGGdO3YYisD7HcCJDcxYzgwWO1hczvCHmoZyebCGwNcdls3yP1AUw4AFFsd3i
         7iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692688928; x=1693293728;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOvmfE+LtNcQN5TQbSvEjZ30LDmhBQ6rOGaxfMgttCA=;
        b=cVIEFUu87Ms21vEV1MPfHOZd8m5Wg/GctgqBwI9WYJaVx3sAk3LUg+G+/ercWMel5x
         RUTJSEmPosmsY2XtEdgCBYPcNwZemmfJ1P8BNVeHO1r0XRv7szBHD2Hq2lwrBtSO6j+3
         R399Qa15DtQxb10G+800UqHKHtbDT62DjdYaCFr+vAe6IUfqcvHlw3yEo6gGYI6JmzhH
         PoJ9iS88rps3g19aBqyncra5Nl8TbYn+i0pfZZS24j8uaUaWNxcUOv5EQSVGCM5UUEEA
         4IMRlXnFb165nJfUQ0YEf+Edc5tDSZjcXBV9OnFYoaQ6bBhjJ3iXXBFfvS8dutthGfGP
         lINQ==
X-Gm-Message-State: AOJu0YwKU6Sgg9tZ3C3RVDYg1vE+CvmlhBPBVDgITyVhjswmXep00txo
        ZQRRjBr0wVSek3iYD7oIK//fzi0kCNeWbCyJEUYuWA==
X-Google-Smtp-Source: AGHT+IGjgt/HTLQWsDUdPr+NUkR4UncZnfeZamquWvIpM0kKMa7Zg+g0YDTUmbeKTCUpur5II5Q0FQ==
X-Received: by 2002:a17:902:b403:b0:1bd:bfc0:4627 with SMTP id x3-20020a170902b40300b001bdbfc04627mr5901355plr.40.1692688928634;
        Tue, 22 Aug 2023 00:22:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id bg5-20020a1709028e8500b001b8baa83639sm8316002plb.200.2023.08.22.00.22.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 00:22:08 -0700 (PDT)
Message-ID: <64e46220.170a0220.7b7ff.f119@mx.google.com>
Date:   Tue, 22 Aug 2023 00:22:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc7-128-g0b86d65557b6f
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc7-128-g0b86d65557b6f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
7-128-g0b86d65557b6f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc7-128-g0b86d65557b6f/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc7-128-g0b86d65557b6f
Git Commit: 0b86d65557b6f9fb73ce357f14e0f22e9f47a072
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
