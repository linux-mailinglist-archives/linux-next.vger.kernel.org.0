Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4A77AE3BB
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 04:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbjIZCqG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Sep 2023 22:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjIZCqF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Sep 2023 22:46:05 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C0210A
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 19:45:59 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6c4a25f6390so4293862a34.2
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2023 19:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695696358; x=1696301158; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SydhPoGBQMRA9oBFb7ZP2U1IsnyFvuknsr/bm2KJIW8=;
        b=JYmKTS3tuw0gMrQo33AamprH8FoF6snx/Oo/jO+Lke//T5Czys+cZJiyW3lwt1jrpu
         MVKWo9ToC7HGFviboN89153hqanqnPZFojlGZTT26mSomlIAAy8TSt5ijHwzZyV/I2U4
         wHGXbB8odwh5YIAUXCHgDIQ/k7F2cIxG8H2MbQego0v7c94n/FXBRq51CdnoVZd/op0H
         oTzBUd15roXo7A2vtfd8MEVMD5IO3Mp9V1vVCwO5bCNS97eSJrVqusGWxiv1UPTZHbM3
         Kp3e+vvFyKy6f60zSuCfDM+SDoAXI9WvbE7C/GWNaYKXons5po2iLkb7R8KA1LGpA/uY
         ZCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695696358; x=1696301158;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SydhPoGBQMRA9oBFb7ZP2U1IsnyFvuknsr/bm2KJIW8=;
        b=PQKSRF8Jyw/jh5UL6d/fYX8awCmCnO3UrCrLI68nj/qaSDaVlTJOm+Op1NrW/BSKZ1
         OpDYFyIT4Abqm1eTBL68qIKvpy2RuNTD4S+RPU+p01kUgFajhnCcAIOWff+AdGhIMY8r
         CUe1JBH8ZnbJiYx4q3ZpSexwqWisukXhIvCpd/1ExD2MeD2m9LEpv/Oap5+VuXF79oZL
         ZQyvMR01mi04+svC0xkucnfw0QmGICan/b2JAYO+TEvF+hpkVap1o8bMfxlckJzfDDjh
         Xbet7uhdU9f6oguWKmmBEvqMJE8jHxuTQaI4dRxEUU+ZsuZjQNWJYM80EOuz14iAsiDE
         nOYw==
X-Gm-Message-State: AOJu0YxYtmPOT8SLKljQ3rvUqdGj57btJDUxl/dvsv51u3+SDZwDZanX
        Xjn/uRGjR4lbt2xwBgSJx645PMSp6mnEqHyrCMtMpQ==
X-Google-Smtp-Source: AGHT+IFPrnV0ktfeQ4XfYu7ErQktMS3E4lB0ipVuwjkNAyKYC8A83k4XuOpRch8KgR3/wVNPqOnCdw==
X-Received: by 2002:a05:6830:1e64:b0:6b9:5b04:8cb0 with SMTP id m4-20020a0568301e6400b006b95b048cb0mr8941291otr.9.1695696358005;
        Mon, 25 Sep 2023 19:45:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p1-20020aa78601000000b0068bc2c76393sm8775764pfn.21.2023.09.25.19.45.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 19:45:57 -0700 (PDT)
Message-ID: <651245e5.a70a0220.19214.5eb1@mx.google.com>
Date:   Mon, 25 Sep 2023 19:45:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-240-ga427b9ee9815
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc3-240-ga427b9ee9815)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
3-240-ga427b9ee9815)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc3-240-ga427b9ee9815/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc3-240-ga427b9ee9815
Git Commit: a427b9ee9815a9d07e1d182ddc994caa06042786
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
