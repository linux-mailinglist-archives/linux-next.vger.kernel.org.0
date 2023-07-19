Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63695758BA2
	for <lists+linux-next@lfdr.de>; Wed, 19 Jul 2023 04:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjGSC5p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Jul 2023 22:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjGSC5o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jul 2023 22:57:44 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5451FCB
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 19:57:24 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bb1baf55f5so38267515ad.0
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 19:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689735443; x=1692327443;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L/wNO0JHLOKnjLavXuC0HYBdop1o8WLP1inynVywQhU=;
        b=g5z9oyUx3H2Y5vZRD0PvLPVinehNySTOgdIVzGRdGgrb3mzPYX697+psLISeVoQ16S
         zQh3XT16Zs/BdoVDJOtqgbFbXrPKyHSPPA0D6zu/uXBrFgQEjpPSxWQ3k/bc9nQRvao6
         dW7tJ7Q2vOibLxRsC1RJw6tHYF7RfEJ+8bXt10/VtTRS5TgS/pCZwFgwHLR3h9nj/CeW
         OjvAMEKXcVzsp0dWqyGNLd9VlhnO338Ccy+sGJX5FQiFIKMNDtnkkDwVxmoL2bkeBYY1
         WJrZzVbjadiCk3G7Dy2oXd9nTOIsiAEQhD4t53AmPF9NFGhO3bGUGrQCgP/dG+G04BNt
         O5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689735443; x=1692327443;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/wNO0JHLOKnjLavXuC0HYBdop1o8WLP1inynVywQhU=;
        b=HgWmTTce3l8BkQO8+nsIJSTx2Ff1nPQHoxhVzRkKsO8TptFMqsHvLjstIdjoU8jbTq
         B57hnkmnqIMCVET4/1jDxlxhW+GKai/ZTl1HL+xybx09HCcaUE8nlhF9TR+NwT/Ldq8g
         Ee92wTDv2E/n0Ez+Ew/DVO9TidC+qXXBA1p6GRFH9GdJS6ZCgAk2/ZKjB0Bj4o4TRvds
         575d+ItdV5f7ZgYwxVYkr4+uxu7h2y/aDG3LDhkNIvalAGdOwIxhyS/HjyFPKhtvKDM3
         UpxEri7UYYxTWZFHUHOlXDSALhjuTIuST9eNIZhQRgPA8ze5RgJDOflH9zD0tBF3YpGm
         PukQ==
X-Gm-Message-State: ABy/qLYQpgDMYcnTqhZQ3qdnit0zNSAqyvYNp7soQPvA2W93d0tKdVxd
        yHgSzIJUyrM/bLxKUtf16n+65T0xb6kLxFdLfnIAGQ==
X-Google-Smtp-Source: APBJJlEU/e3U7iD1Unao+grjCYF89wkWgeqwYlD3d0xX02bLNMHzgCk/+KOfRaW2OGPEIj7kyFUCMw==
X-Received: by 2002:a17:902:a409:b0:1b9:be2e:2b40 with SMTP id p9-20020a170902a40900b001b9be2e2b40mr14277657plq.50.1689735443240;
        Tue, 18 Jul 2023 19:57:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b001b8b07bc600sm2606861plw.186.2023.07.18.19.57.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 19:57:22 -0700 (PDT)
Message-ID: <64b75112.170a0220.9d2f8.6b82@mx.google.com>
Date:   Tue, 18 Jul 2023 19:57:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-295-ge510699ebeee
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 5 builds: 0 failed, 5 passed,
 4 warnings (v6.5-rc2-295-ge510699ebeee)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 5 builds: 0 failed, 5 passed, 4 warnings (v6.5-rc=
2-295-ge510699ebeee)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc2-295-ge510699ebeee/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc2-295-ge510699ebeee
Git Commit: e510699ebeeec48ffefbe3ef86a96a35a6fe69c3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings


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

---
For more info write to <info@kernelci.org>
