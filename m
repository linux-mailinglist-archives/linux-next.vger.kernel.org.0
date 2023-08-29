Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E0578BC6C
	for <lists+linux-next@lfdr.de>; Tue, 29 Aug 2023 03:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbjH2Bpb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Aug 2023 21:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbjH2Bp2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Aug 2023 21:45:28 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83432184
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 18:45:26 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf55a81eeaso18996825ad.0
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2023 18:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693273525; x=1693878325;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bV00sftCwE1ijo6Uaun3IrwmwozLDi/2rOPHpMMnrTE=;
        b=MN4lSEVntbzAy5h7+NqjlTHzUt7H25vHqJbKticxPhRokh4+tu2PO5e+3hNqqlbdHP
         s2LlpHpN+hcK0+IB4uq/BUBBHWLGVND1SXLzLUaZVsgpTUTmdphsrtzAvXfKmiNRL7nT
         9sCOgyt41O3bB/DEqYeJnS8xW8m7TEbMhXgKE6DD0GXupwCYCw+lCGmLwsaKjzVILavw
         3KXgV1ZFnQxbQj8+8VDnsbEVgAzdGtdFQRnXtAie8GOmqN07LE56tH7iBg+odPsanUYV
         ruPTeRrByOYg6Pye+kmv+GFVj2NEgF6czDgBYaO0DSNumDo/SN7+V4Pjlw+WcxFl0zB/
         hbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693273525; x=1693878325;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV00sftCwE1ijo6Uaun3IrwmwozLDi/2rOPHpMMnrTE=;
        b=ClIZKMtYq2+QhajJ2d8CJfbnw4+XbzC1CRd+l9aNTcxu39J8FIoInZ1BtTQVOrFIY5
         Kui48YJGUyTWWFY6RjSKyqzSwOj00rLGKCvwK222mf45kL6odV4d8fBemMupx3NSzpL3
         5ya1yz1JF1HtfYn+g4dDG8+UorLbHAl1LrA0icGZ/mBoM0PaMkSw8iOhuj0OO72A1+BE
         VLG5fnzP+PQJ5hl0zE7Vdx5MC+uhdJbt+qMRwnslM9W08IjUlV/ocwvraWCrHFZtx4b2
         0VOFALu7i6AUI/Y7ruJj6nSkZ36rs+BuXteLQAPMLoTXxTkD0+om+YklzcXJKiC4/ihF
         AGCw==
X-Gm-Message-State: AOJu0YyU7EmaSVj6Lu7dOW+r5NE57jOcqjVk/jKR5zLcUEVD5j+4QFmK
        uV/nWQSeXh7NcA9SfKawCmYI3V8he4Q4Du5Q3h0=
X-Google-Smtp-Source: AGHT+IGVajTI5WMPM289hpzDD+nPICsnndZdg5L23kyYHGvev1UMRuW+vDen24JoQV+ugZNfo1/ghQ==
X-Received: by 2002:a17:902:da92:b0:1c1:fe97:bf34 with SMTP id j18-20020a170902da9200b001c1fe97bf34mr553636plx.24.1693273525560;
        Mon, 28 Aug 2023 18:45:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902eb4c00b001bc35b14c99sm8044583pli.212.2023.08.28.18.45.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 18:45:24 -0700 (PDT)
Message-ID: <64ed4db4.170a0220.c1c85.d028@mx.google.com>
Date:   Mon, 28 Aug 2023 18:45:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-1588-g1cf6f50b5d09
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-1588-g1cf6f50b5d09)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-15=
88-g1cf6f50b5d09)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-1588-g1cf6f50b5d09/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-1588-g1cf6f50b5d09
Git Commit: 1cf6f50b5d09a22a4984f9bd5743c857079778f5
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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
