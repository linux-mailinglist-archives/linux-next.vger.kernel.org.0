Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62159773589
	for <lists+linux-next@lfdr.de>; Tue,  8 Aug 2023 02:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbjHHAua (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Aug 2023 20:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHHAu1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Aug 2023 20:50:27 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548D3E7
        for <linux-next@vger.kernel.org>; Mon,  7 Aug 2023 17:50:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc411e9d17so31654245ad.0
        for <linux-next@vger.kernel.org>; Mon, 07 Aug 2023 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691455825; x=1692060625;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRs+DqmXMvVNkKmyak40oKfqbGgT8XOO1M4Y4xewMtk=;
        b=265XoY+NlTPTczsFVnKvq+NbIC1FJl/SSchlNBAzLBZf5nAuYHmuFtIkq46srTNPEw
         sEbOm/Fkwi0xNdtV9kZrOIyfOBuXy4iW6QWCF0XAI72V53MVrIfTZMFV/BWGBiS1p+2M
         j8CpIk6XKX6oesgm4SHspfr7VBWNVxeQq6vcBxUiJjTuIURQ8K9SmN+K8e4S0qprv9wY
         /gsyL/ajfk/M460V2DUEN8UpbVE46hmFPonYjfBcbozPZNBchNE8ddhNYLiVFo+kIDNg
         G7NGSewYG1X2AADxw2lodUx1ZzeM0dNtY8trcNeBCDli/Bk9vYFBbixHo4kSe0tdknFn
         B1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691455825; x=1692060625;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRs+DqmXMvVNkKmyak40oKfqbGgT8XOO1M4Y4xewMtk=;
        b=lAStVCSIcl8LzZ+D4yMNfYf9FE/HaYOrSsJSjmWrO92Ud/Vqijv9Rlnx17vXf+Kva/
         CXOEB4CtBTV0K+GTg0QBs4MZFtIIDuyegjy2vr9iAYtXrj0eYsBxLo7DM8buTNmhsszm
         6zIIXalRft/b1vHyKwCe/aVgCmkp77Zx7yaqG/ZjCGaka9M4W7oE0KiLD2Yd2riDiZSp
         UDNOOzROIgf+Pbiono3ovOds6K6U17A/SmaPNWIfhmbwQLtuxfHNtgKIHDWVvSS1Ir90
         WRpha7zJ5Hzsy0u0Q49xlZwbKIaCXkXA50mzM+ewmq4/xPYS/FGN2pMa0M8o6TFASxEj
         dNuA==
X-Gm-Message-State: AOJu0YzN3/6gLFNcsUEYaZwvCc7ITc4LFii4qO0ZRQrw4sZeL0WU4Hvm
        Jk5t7Kn7tMYCF5CsGBWe0dnoFRDWqKEDWxjdXPYI/A==
X-Google-Smtp-Source: AGHT+IE/R3sRHKpEEBm9fLjwemuc6BE4Hwf6x0SXft5CP1I/aGFY9mncrKR66ohkEGpTthKvLmSzHw==
X-Received: by 2002:a17:902:d503:b0:1af:ffda:855a with SMTP id b3-20020a170902d50300b001afffda855amr12345882plg.9.1691455825231;
        Mon, 07 Aug 2023 17:50:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jb15-20020a170903258f00b001bb988ac243sm7491510plb.297.2023.08.07.17.50.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 17:50:23 -0700 (PDT)
Message-ID: <64d1914f.170a0220.a42fe.e4d1@mx.google.com>
Date:   Mon, 07 Aug 2023 17:50:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc5-223-g453869586392
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc5-223-g453869586392)
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
5-223-g453869586392)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc5-223-g453869586392/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc5-223-g453869586392
Git Commit: 453869586392a5c4f570ba90c557219a65fff41a
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
