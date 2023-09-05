Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAD3792675
	for <lists+linux-next@lfdr.de>; Tue,  5 Sep 2023 18:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjIEQDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Sep 2023 12:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243946AbjIEBFT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Sep 2023 21:05:19 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC394C4
        for <linux-next@vger.kernel.org>; Mon,  4 Sep 2023 18:05:15 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso11130595ad.0
        for <linux-next@vger.kernel.org>; Mon, 04 Sep 2023 18:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1693875915; x=1694480715; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9djz4sqkqwn+Mj2qdlBo1qH0rHVyFESw+D2/Ol7Y2LY=;
        b=l87SMsacqr6AQucVTBpQBrVa1zwxvRNzhdfzp6rEfmhm7LLeaqWR83+vbtZMEQO54w
         v0Mn7Mz7mEyEQxwCcuG0sz6ZwtvMWbcCrVo4lRj7Yqghyb+jT+PqIex4SEzu+W/BNxjK
         L8TchElSFmVAxeEjHxn97eJmCThvKpjxxrq0VAOR1jT/gfuDk52x5J3EnAb7henILqrh
         BDm2UmCG5ift9KyHuMd1YO/kIVaSDA0diGNSgjZwcZPYry2s8NxLIJCxX8xAnF4zsAKu
         IRtE82IydE/PVFeoNibVH/e00SsJdAwVaDLbYw1bnnnxp53qyKcugHU70PYvW76pA+OL
         TXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693875915; x=1694480715;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9djz4sqkqwn+Mj2qdlBo1qH0rHVyFESw+D2/Ol7Y2LY=;
        b=MqxQ3fRDIn++/pOvupiWspZEG9pnQI9ty5Wy1wXvoqlEvOYuqAL/WtE5/+Z3MmneA6
         cNZ7M60YBlfNBgmQEXypI2wef7BN2xqcfKv58fS/+axKBKNtEqA5XmX0noofcajVNo+U
         CQKO258q6ZElnH9DuygBNorNdCzybpKOEBgNCAdfjKBvzN5vRdrQuDoVrxpZTZmqHxv2
         USgzsfgXJe07NsnUQrjRbvd3jdATBLrEVId060Jo+EEObpmAEUsehhbNgiloul4Gotw7
         3O9S90wmDYsDDrdGSWyPJxdVd81adcIGfJFdnukRC9NYvCIeiOCy7eB9nAHFlaBlPCvt
         q1OA==
X-Gm-Message-State: AOJu0YxOBqsA9QJPAJOsLbIUI3nRdJtoQo73YlP20yiIBM+nFApMsgC5
        T9xypMc0fJqrSHF+vd8gnQrXQccHF8b7BCtpM6g=
X-Google-Smtp-Source: AGHT+IF5GlsuNjSdKkxqW+BWcVYtcLg+OF0/N/mQ9otLj50sdomQ4g1Ve66L6gvBaf6lDQjRC8EPeQ==
X-Received: by 2002:a17:902:8c92:b0:1bf:6ad7:2286 with SMTP id t18-20020a1709028c9200b001bf6ad72286mr8533357plo.43.1693875914782;
        Mon, 04 Sep 2023 18:05:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902e74300b001b8b4730355sm8088324plf.287.2023.09.04.18.05.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 18:05:14 -0700 (PDT)
Message-ID: <64f67eca.170a0220.b1970.05b4@mx.google.com>
Date:   Mon, 04 Sep 2023 18:05:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-12059-g16fdf769151b
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-12059-g16fdf769151b)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-12=
059-g16fdf769151b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-12059-g16fdf769151b/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-12059-g16fdf769151b
Git Commit: 16fdf769151bc97ad78abd022c6c9c8b9d6a3fb2
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
