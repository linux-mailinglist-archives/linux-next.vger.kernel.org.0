Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888D776DC0E
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 02:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjHCAJY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 20:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbjHCAJL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 20:09:11 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704AC4213
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 17:08:48 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a5ad21a1f9so251891b6e.2
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2023 17:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691021322; x=1691626122;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HO0S4FU6udadqvFoX+TCaC4RTR6piZHLXd3uF4bzfeI=;
        b=xKPiNo15pVvKQ9GP4CbWHQpIzLRc2/xs4nTz0MzfRDqXFtGaWMOEKOv/pk/iLhcKHV
         IIJTskY16k35k5eFS8caEWMalfjE9N+GiuQ/nknWxzjcx0PlE51XjohFzxmzv9PrU4uR
         rviZVe3IhSIg2evUg3cDMxf+u4kTKrF9Lx8EaaYqxk9zM0jgn3ZecPCtXZUexfgek5ZF
         A5r38AuP5C1QjRzFen+DhmYQo1acIDh7DQkcn00NULP92uSrAJc7B6YidkQwDRi7sEuR
         vjsdPpSOcpPsyKbMZswySPs4DLk2QUP7UkE15dlcOSS5KdVn0kosDgc6arx1Mib4lXuz
         LNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691021322; x=1691626122;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HO0S4FU6udadqvFoX+TCaC4RTR6piZHLXd3uF4bzfeI=;
        b=dtlohDvSQCU2bwvxV3ObRvImaIccZo/DsgiJI4UK++vvt3TMC8I2FCeMbOmQ/tsuar
         RHDX/eL5c44oCZHk+PsCRDI/ThldP7Vl3XMCInCSfcsNEA3B5Dptx3I0tJ1OM3Z4ehyU
         u3WMg3ufoK5ai8NZFtEO3YG8bpPG755HQsxNXM33pue4+/pJrJSKGe8zEYZBXugfy5Fa
         +YpZSte3W6N6y2hUwqDSaLGWe0L40FDTREr6lwzkaWoRioPuSpup+CxdNfTktCyytBFr
         4MGhuOyF4qmLu1OPD7IyLll7f9CLZauEUkaJq+ArcIntwFBh/1cshEmNxb4cYgryFhji
         YHNA==
X-Gm-Message-State: ABy/qLYAxIMVBdOH3OlHrgRTBc9lBidmeyguiXfzkm9c9C1izZxPbOyv
        xPGTLeCaLGiWN52B1QdOiIiiOWAnjPzatkXeHGrntQ==
X-Google-Smtp-Source: APBJJlF61hvHVykFWngT7mVUiwAxFVDCvMQh3fUA4iYrDtdnd9VL462qGgCSGs+RIsGVME2wqquh1Q==
X-Received: by 2002:a05:6808:1a94:b0:3a7:2224:357b with SMTP id bm20-20020a0568081a9400b003a72224357bmr11379783oib.1.1691021321963;
        Wed, 02 Aug 2023 17:08:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ms20-20020a17090b235400b0026801e06ac1sm1555671pjb.30.2023.08.02.17.08.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 17:08:41 -0700 (PDT)
Message-ID: <64caf009.170a0220.51f0b.3816@mx.google.com>
Date:   Wed, 02 Aug 2023 17:08:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc4-305-g35245ef82c5b8
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc4-305-g35245ef82c5b8)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
4-305-g35245ef82c5b8)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc4-305-g35245ef82c5b8/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc4-305-g35245ef82c5b8
Git Commit: 35245ef82c5b8206d97d0296017df658fd8ea3d2
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
