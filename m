Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0407A1427
	for <lists+linux-next@lfdr.de>; Fri, 15 Sep 2023 05:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjIODLC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Sep 2023 23:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjIODLB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Sep 2023 23:11:01 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB9C26A4
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 20:10:57 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68fdcc37827so2041832b3a.0
        for <linux-next@vger.kernel.org>; Thu, 14 Sep 2023 20:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694747456; x=1695352256; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0xrS85ihwNDsKAGrtJsb2zU1TkceVfNRUEiqT1Rt4fM=;
        b=P++ABVne+RmGTt+OuJAHOtMSdKYWVctbWCL5hHPySU4IlFCxNUWGaVDnzD9RfNAx/X
         noZx0SgTmPPSL/GzENJivfkCF5jzDf1c/sNHOwW7F5Kb6p0pyc4/qBxBz3/9M4k+fYeM
         vYQ5RIPJGw6W7GkTWCAC/VnG4fubjmQFSLegRDgZV19jqw0qQgmRCIYfy0aJ7tItNDu7
         8LuoROz5Ynn3lqyFw55dFRjUT6iUq8+ATdNOdY8/GceF0LA9DwhFbpEc9yIgB0Z/D31K
         t3eu9RX8aA1YgQHV+rdptXfkNRIGUnrQwtgAnAemCRAtRFEC22QxKx6Gq41ymd9s/bEU
         HhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694747456; x=1695352256;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xrS85ihwNDsKAGrtJsb2zU1TkceVfNRUEiqT1Rt4fM=;
        b=AN0zVETTgCqoD4URMzSn2vCFn9hk/pPszQ8VY5YZN9g6kcFuNQ/LulPiTiyZ57ujxo
         9h6ZnzlCDMLlQ6A9tMfFPMTAtwwO93D3GLrKKoAYUS/UqrUzHenB825zoNjR8ZXJoFxf
         DXdBFXQMzO6B+OMytZrD/pJ38spRQdH+Np4ISEPvqIfkcPT2ZjhNzL/G/v8t7gQDy6+V
         v+8+ogYx3zpzkXVUoLHO1miXqei9ccoUbWQZE0qbWgCV5j9mcupmSRQBGeRzvyq2va1C
         tM1dMQjdQRkhVQstb1AZdNV7mhJjdn/tLnUGuWYgwdNi48UXYAcQShJDXt2sV0k15Jfg
         0XrQ==
X-Gm-Message-State: AOJu0YwN1kP1brxR1hla0gedyy6+rGFyhFiRg2xQG8TfleyrJaYbudhU
        Uhm2fyql4D6OKB16NFbhNnGAJ/XM6qbLLZFkzzGAkQ==
X-Google-Smtp-Source: AGHT+IEI2kN29Yq6AK70jy0VI6nlI1juZFiOrGQwF2oqRKOgcr8icP7yYHyFL6HT+khkSFFrLofC1Q==
X-Received: by 2002:a05:6a20:7f9e:b0:149:602e:9239 with SMTP id d30-20020a056a207f9e00b00149602e9239mr737442pzj.21.1694747456527;
        Thu, 14 Sep 2023 20:10:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 8-20020aa79148000000b006732786b5f1sm1963430pfi.213.2023.09.14.20.10.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 20:10:55 -0700 (PDT)
Message-ID: <6503cb3f.a70a0220.4e531.8c06@mx.google.com>
Date:   Thu, 14 Sep 2023 20:10:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-445-g66b45e71c969
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1-445-g66b45e71c969)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
1-445-g66b45e71c969)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc1-445-g66b45e71c969/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc1-445-g66b45e71c969
Git Commit: 66b45e71c969032c8c1564217e8596103b451145
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
