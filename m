Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B63787C93
	for <lists+linux-next@lfdr.de>; Fri, 25 Aug 2023 02:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjHYAg1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Aug 2023 20:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234399AbjHYAgC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Aug 2023 20:36:02 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866CE1BDF
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 17:36:00 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-68a3e943762so395847b3a.1
        for <linux-next@vger.kernel.org>; Thu, 24 Aug 2023 17:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692923759; x=1693528559;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ytGe9wh6AqmAeqYVfVETHOcnL1e52eEzYFR18kd2Jk=;
        b=GdujBrwbADYq1IAQF+eFocdix0pYYfMnJKSdZjvsuXU4EpOMeRlJ/E1kL70GZepYtA
         A2E8gwoA4SuZohSiVEOirpWZLcrC6EApb6U1kRPUXQ2jvWr1KKzYFkw8179MefSJYEO3
         buB4N5JbER/Tk8bRNlsyrN8UU5ofq9e/c79ssUie8fADFQWT0jpOW+4QIrC/T6EGjrXf
         Vhs5c85GNNKgKcQHkxjwEU+d/9H1EKWA2horFaTZZteV/iKxHZlv0IUB2LDO333WdBL6
         g/rLcVB/NIING96QSZVG5bSItIP3h1AevMxYjjEOBlGi9ulMvUc0GzBR08Iah65JGYFg
         JIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692923759; x=1693528559;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ytGe9wh6AqmAeqYVfVETHOcnL1e52eEzYFR18kd2Jk=;
        b=GlWzdoMuA21tnt5XH7FsO3xi/PqXkGDFb7gkI6C+8QI60JVrEF4y7ixzYWDPyR8DNr
         NqPq2ubBQHacIyjkVR+mKXrIM6rLTmPAsO90kFEiWu3dg4LSi5uJZEHreNtbrXxZ5R4T
         QDp31+LSxOz3uSIZw/TMuUUCF7pqp91ge+FiwyPkeH0Ki1W6ScFL2QgGxSrfNckbtfaF
         4eElmrJKQCHO+hhmeFfrHRz4gfSQzSfEQssxQ+H5ozY9qb7Q6qXwHxOHYpcpr1xVapV2
         pJa6X9L8GgPiQTOoZnIqziTBHIEQpTafRR8ycb2CxUL391p7Mjv7VGkpiYmKXrTovywL
         TDdg==
X-Gm-Message-State: AOJu0YxoaXDqMb/KcDDDgHz3/NblsGq0vyIY5EGWDkHOGTnW++tENP7+
        QKvwiHifMRKgO5b7KN9Vf9+GOlaS4Q5JVi1cKso=
X-Google-Smtp-Source: AGHT+IGsohV1Yyd0I4sTy9PLQt07bCxaWsY86MsDlpQgTcWeX5C8b3VCggGWWyr+gMnjXPDxMN2Pjg==
X-Received: by 2002:a05:6a20:3ca7:b0:149:7a49:f7be with SMTP id b39-20020a056a203ca700b001497a49f7bemr12467958pzj.4.1692923759390;
        Thu, 24 Aug 2023 17:35:59 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id je1-20020a170903264100b001bb99e188fcsm280827plb.194.2023.08.24.17.35.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 17:35:58 -0700 (PDT)
Message-ID: <64e7f76e.170a0220.bf104.0c09@mx.google.com>
Date:   Thu, 24 Aug 2023 17:35:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc7-207-g77d7dd335c8aa
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc7-207-g77d7dd335c8aa)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
7-207-g77d7dd335c8aa)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc7-207-g77d7dd335c8aa/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc7-207-g77d7dd335c8aa
Git Commit: 77d7dd335c8aace21e366c2d267c864cfbcb59c0
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
