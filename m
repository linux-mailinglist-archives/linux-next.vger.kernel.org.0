Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4147EBA63
	for <lists+linux-next@lfdr.de>; Wed, 15 Nov 2023 01:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbjKOADR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Nov 2023 19:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjKOADQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2023 19:03:16 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E877CF
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 16:03:13 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso55824605ad.3
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 16:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700006592; x=1700611392; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SCSOKejx0rSL8Lv1QFVmJnJCjVv8gF7cwsb290Ms2p4=;
        b=Nvz1jDZ9Druv1q8lFxj2G1S50EBnCj05u9Xl0rWi6+MuDNxEeRsOXdYULZbVgdNzCQ
         5i5u113vOkzbMwVRlrPUJubbGCG40agH+qjqdZkqDh/KbkMP0XJECS82zEe8GdVzuVNc
         dQnMIwz3l4xCOptyK3b+xzmAs8wjSBuS9h0tgrqlnZmwhAW1ae6OWgjH7Wxtg5GhjEUw
         79fsmqEmrOttMxi4ZJ7aG8WWKdsUM3qfwS+/Kz/+IfSiS4eiRoyBYyj6hdKomUsutL19
         Zfb6PSUeKf9YW6xYk1flI2E7DFev0uZGmHf6D63pRGUuda2xQ8Z2201sRjula7D/mhKQ
         0IQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006592; x=1700611392;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCSOKejx0rSL8Lv1QFVmJnJCjVv8gF7cwsb290Ms2p4=;
        b=TN0b9702qHEcCytqIp+CmsT9RM9jR8AZrLhrxDQEeRM14r7gBsPfZZOy6/9JZtN5io
         DHgU6FC9uBPgpm06KHmoa9HHAsxw2B+ha7FMkWQEQHWt1O3EKXeqH7kJRnHlDSNTHNge
         tV36XgJ4/TG5cr9j9+1DjtJ1WKxbpj86MJuVWM3riJ1x5dn4LVZj3VCYhCnSLmh1FYdg
         USu3Or7uRF2rzeTpGHwDeRAafuTk39IDXFY9aG+KMc07uh/ji+xfTNUOSKTQsUhpo2/v
         W+XYCnoHrPeq3jRyu7vcw2BmKQZDCWdNPBKchTPXQl6XYgXPpBHJWDYlYp7TG6uMetFw
         bERA==
X-Gm-Message-State: AOJu0YxRoKPxtI/u0fy9z8+5Dz62XVp2vdNBNbJBqheqlN+BNHhq2tqv
        2xsIYO9yiUOGRjFQ0PqiWohjJrYlrva8Pc8oExMk1A==
X-Google-Smtp-Source: AGHT+IHz8J2g1d1VOKi1a2xLTp5nl9mq0Cl0uAb4x8EfsjDFhDkXsU9jciBzHraATFDaPSBiLiQDIw==
X-Received: by 2002:a17:902:dac6:b0:1cc:5833:cf4f with SMTP id q6-20020a170902dac600b001cc5833cf4fmr4442208plx.55.1700006592422;
        Tue, 14 Nov 2023 16:03:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001bf52834696sm6168181plh.207.2023.11.14.16.03.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 16:03:11 -0800 (PST)
Message-ID: <65540abf.170a0220.18459.062a@mx.google.com>
Date:   Tue, 14 Nov 2023 16:03:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-127-gaea4a488542f
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc1-127-gaea4a488542f)
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
1-127-gaea4a488542f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc1-127-gaea4a488542f/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc1-127-gaea4a488542f
Git Commit: aea4a488542fb2f54a04350919955bc91a79bd8b
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
