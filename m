Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0450F7642C5
	for <lists+linux-next@lfdr.de>; Thu, 27 Jul 2023 02:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjG0ABo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Jul 2023 20:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbjG0ABl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jul 2023 20:01:41 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B311DE75
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 17:01:39 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bba2318546so3062245ad.1
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2023 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690416099; x=1691020899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ir4EfNqojv03LAH0q2c/GhIqyDD9KATreVu17y/XPDs=;
        b=mrNrw6engoUehCr+9krYP+Cqn20Z7aX1JMNz79x4eA88a2rdDxNxXHukq43/VQzeCM
         M5Zxig9lZQAA9CdIVXEP3R6r2B4XG8szhmYybXYgy/Kb/8yJbjtD/oRDQihX9NgfK60Q
         b65aAMqm8FAiZUN6jNulIztwFWvYJexUKntlOuaGYP1nWg7FYOQ/iwQW+X7dc2KYxo66
         Ybs38cdrAnOhweXWz7LY7uC4QGfwgbWUr/lCuVe86d8ORF5HqIgT0MQ6KKL8LkZUgRik
         YADBa+UpAGxKOeD76DfcBsL/r5lBufY5yNZt61xhHtYho0r+/pIAovG67DZDRDXeWp4D
         /qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690416099; x=1691020899;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir4EfNqojv03LAH0q2c/GhIqyDD9KATreVu17y/XPDs=;
        b=Sn/D9Scm4OE3drJccwG7tM4f0NMWgRHnhkapHqA5hPi2oTCKpzdCyuEC71vu2zIZQZ
         LjhoJjnjLXpMdiUsbbGAod0dA+YBZcn/um28Duuf1Llu6SYAA1+kXL4ohGgl0zSdIICG
         9udjW3C4T7rog4lEXhMbgGN5btmCm/95lZWk9abeMgk4/aUBMAd/cD3AxJ0M9HHelhQY
         Y+Y0dQ3hJu2v9123fbKSj3GuBDA/uwYEQrB6CwvmhNj0E4wIsVPKlDI0AEznoTPaadFp
         GhGmobqcjn7OYM+qcO4ICRGjsVRVEjFofuaMyjUSbMKCPjvp9d5eR1sBNfdZsPR52Hcw
         Yw1A==
X-Gm-Message-State: ABy/qLZcY6TD1idguzNz5Vf2qY05sSPpVr1+NT9i9PHh5e8BQTiHZjgc
        pPgYp/E0PrlGVZY7SJUVi6EWJdUQaXJEdqSkn5toZg==
X-Google-Smtp-Source: APBJJlGP+is+vesbxs//dgtkPzso3WZNfAMJf/ca45Ncl6dP5YxCs5PdIMu6DeVGZe1mAll5f8eU0g==
X-Received: by 2002:a17:902:f681:b0:1b6:b805:5ae3 with SMTP id l1-20020a170902f68100b001b6b8055ae3mr4181615plg.3.1690416098710;
        Wed, 26 Jul 2023 17:01:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jm16-20020a17090304d000b001b3ce619e2esm118645plb.179.2023.07.26.17.01.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 17:01:38 -0700 (PDT)
Message-ID: <64c1b3e2.170a0220.ecad5.044b@mx.google.com>
Date:   Wed, 26 Jul 2023 17:01:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc3-350-gb917f578dc45d
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc3-350-gb917f578dc45d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
3-350-gb917f578dc45d)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc3-350-gb917f578dc45d/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc3-350-gb917f578dc45d
Git Commit: b917f578dc45de7c9e1e7265353aac5537513acf
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
