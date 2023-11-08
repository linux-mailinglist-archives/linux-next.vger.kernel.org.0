Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F657E50CE
	for <lists+linux-next@lfdr.de>; Wed,  8 Nov 2023 08:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjKHHKL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Nov 2023 02:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjKHHKK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Nov 2023 02:10:10 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698C51BE
        for <linux-next@vger.kernel.org>; Tue,  7 Nov 2023 23:10:08 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ccbb7f79cdso25694915ad.3
        for <linux-next@vger.kernel.org>; Tue, 07 Nov 2023 23:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699427407; x=1700032207; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nF8x8pkj0OsdQI70YGQEyLjZydqN+AJsMGj6xLRX+wE=;
        b=AD/4JU1Z3vjpipd84UALkXNmEDX9JP3BR4KDiTif6nkiHokTeFYOX1spiu61KAba4C
         9S/KjVaTlIN1fyPJKcv+jTnofghfkXAQD+SljdVx0HvCrQsoR0vTam5CwRGiexUxrK+e
         vCCnfr8H1pCGtwb0WpyPr92l+sLkrQDYwFqhZLc6LJT28Y4ks76p+HhwHuZIqnFADXf8
         yKzCMs5zYhz6t1qRIhwv0+LAUMppo3/E5pFdq0AQmQ2mQMBeKbJFFHFbSp1DNUoe6Lri
         vg4r2ONCwDLZLIvcEBVxsFY2XD0uhuq0Lw2utcmia/nP+2i4sUp9ALtnUZAN4m4uAQg7
         GBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699427407; x=1700032207;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF8x8pkj0OsdQI70YGQEyLjZydqN+AJsMGj6xLRX+wE=;
        b=PK5K1qZ8TyQyHc5dS9HhgdYaww7sUwQMwxd386EwBINSTfAmNsZGXgrGuXYm6NsmnN
         cxaHWLsEu464KgE6kazf8ZDjW51yzcKRaS/U9vu8ui39Z2B4Kc0b2PJLhVHPyn6aPWsC
         7xmJfYhxXfw0X+EYCm2qgVHT4FgUVgfA0E0wGY/xmNVUvWH4vktP44iRxW9e57JAL7QP
         RCd19QwCDxDMoD833iLAlsUzr5cbr5/gWnrKMPGRYt0+iej4qOzrCpo7Xhdxb9Qv+Jqu
         vsdmPY+PPgcBQpUbZPVlWfOkujSldHCl8qViFHo4gywM+3f8AvgY6VsMx205ZP9ZA7qS
         C+rg==
X-Gm-Message-State: AOJu0Ywmf1PizAIJSrkqO0hoJZ6xuPTg4xcNKB7gQ15WZQKGQhR7ckN6
        0xp1Sd9KCA986+3pCbTqS+btJJEozPnE+vj3QoIbwg==
X-Google-Smtp-Source: AGHT+IEWjrvaNNbYjZsXLiD2Z5PNe0tOP8EAQ6cN4UAkD8GiPHnKrToIy9hSP8K2sA59aUyMSJzVdg==
X-Received: by 2002:a17:903:32d1:b0:1cc:45d0:46fc with SMTP id i17-20020a17090332d100b001cc45d046fcmr1483481plr.54.1699427407194;
        Tue, 07 Nov 2023 23:10:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001c5076ae6absm977127plb.126.2023.11.07.23.10.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 23:10:06 -0800 (PST)
Message-ID: <654b344e.170a0220.eebe3.350c@mx.google.com>
Date:   Tue, 07 Nov 2023 23:10:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-15397-gb3a6b43ef3d9e
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 7 builds: 0 failed, 7 passed,
 4 warnings (v6.6-15397-gb3a6b43ef3d9e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 7 builds: 0 failed, 7 passed, 4 warnings (v6.6-15=
397-gb3a6b43ef3d9e)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-15397-gb3a6b43ef3d9e/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-15397-gb3a6b43ef3d9e
Git Commit: b3a6b43ef3d9e379f4ee929274f2eed1a9942bbb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

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
