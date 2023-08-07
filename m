Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026AA7717A1
	for <lists+linux-next@lfdr.de>; Mon,  7 Aug 2023 03:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjHGBCi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Aug 2023 21:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjHGBCh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Aug 2023 21:02:37 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7088170A
        for <linux-next@vger.kernel.org>; Sun,  6 Aug 2023 18:02:36 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-686f94328a4so2570696b3a.0
        for <linux-next@vger.kernel.org>; Sun, 06 Aug 2023 18:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691370156; x=1691974956;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wYlHu+fpqxnb4OdZMWCwQ+WLBO5Ifq0JyfW7Wg2THGU=;
        b=3I53Na1g0whKwT2oDXAoZ989YTe25lt5RnSFgComOwU/9YZ62DuqyFMbndeORyNhub
         d/ZTOxUp1itDOcLj/lIx9tvZj1w+IFoZtoQhgiDEyekBv261/4NWp9Fm1K00DgbpDlZU
         pXLsQ+SQwyTd3WNuYvIIyNmiqZSAIDHTrt6Ilk6Cykw8vTCOiQvskLhP+tNQiCqIaYNO
         cHV0rp9xWHDDHHQSxg0AJCYgJmQtC/DvYhT7cK+psBZobZE1GppLiZDwko2WF3k9MO8h
         7OvoBPW9sDRDjPTPIjhL3IKrFHHsnlp9hQsxD+y1/uOAxNBXZSpPjJSVkCLitFAHNmX6
         6StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691370156; x=1691974956;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYlHu+fpqxnb4OdZMWCwQ+WLBO5Ifq0JyfW7Wg2THGU=;
        b=MnpsYImP3k+7AAwm3iEyyYYt4ReTm5LunJQanhdgRPFMJ0ubQBJdjJmhw+z1YdDgUE
         3ofHsymjWboGQ3O+KIJyHt0sZfToWM3OU3QEJEZ58K6LpBeemJfWyHYE5L3iFVHzba+1
         5CwF2aWrCSnwYzeQyt4r0GWWsCMUNJDld2OMUnaYBg/iJcTwl8pFyli+U0rv17SdHru0
         PwHloEs+brRd07zfcCYtwRVmaq421b65dwlepSNy9bEXrsEOmR1bdUrNOzQqsW0jtBm2
         cu7GmBz5OOAMdoXHjwHmA4vNe5AXDA00XCh+Lh+QIyXUwCdNKnKp8C2shTuV/dpRf0j5
         O7WQ==
X-Gm-Message-State: AOJu0YzNS0A+nIikEHjb+rlME2kZ476JuNsPgXpepOzxOdP+KZjqdmMt
        TWSMi/7Tjs6Y8l2RdvALtXAb7njgI9R4LaeMvwy5Kw==
X-Google-Smtp-Source: AGHT+IEO8O+77usRI94SN9+dtMu6oSMjK/Hs5z41huoUW+U3XOTIAEpCIBRSDZvcbGaw3ip8mnWDGA==
X-Received: by 2002:a05:6a00:1823:b0:64d:42b9:6895 with SMTP id y35-20020a056a00182300b0064d42b96895mr7185826pfa.5.1691370155585;
        Sun, 06 Aug 2023 18:02:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n5-20020a62e505000000b0068779015507sm4887636pff.194.2023.08.06.18.02.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 18:02:34 -0700 (PDT)
Message-ID: <64d042aa.620a0220.3b2b9.88aa@mx.google.com>
Date:   Sun, 06 Aug 2023 18:02:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc5-186-g6c8c4ff08090a
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc5-186-g6c8c4ff08090a)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
5-186-g6c8c4ff08090a)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc5-186-g6c8c4ff08090a/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc5-186-g6c8c4ff08090a
Git Commit: 6c8c4ff08090acd310317de24d25cce7f24b95ad
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
