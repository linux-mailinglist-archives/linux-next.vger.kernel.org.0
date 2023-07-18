Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56747757566
	for <lists+linux-next@lfdr.de>; Tue, 18 Jul 2023 09:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjGRHb0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Jul 2023 03:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjGRHbY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Jul 2023 03:31:24 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B1010C2
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 00:31:22 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8b4748fe4so32313455ad.1
        for <linux-next@vger.kernel.org>; Tue, 18 Jul 2023 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689665481; x=1692257481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fBJnaNvNVJchDbOXrr9w7J0hPOynQY6xp0EpThEjT3w=;
        b=GJg/5MA0Cu06HtCvEQlTVfTS44bxLcCDYw7mgulDhVx5bOc7MvLMfkY8w9C8Vg+7/r
         RaoPhwuH2ZMBrJIRs1J9BrKf8Tea63wEHRF1T2oZlyl3+BFO8GU44FXfJGVa9vVmt/W1
         /CIIVyIE6ZV6n4eGbvELhw2lkDTyRZ42sRQINCRfEK8IS3aIxe0XNZfUqLJwK52oQfJ7
         RRpvONsXX9izcYZY44R5hiz3gcn/j5bYJgMnPaDluKi4MoOUs8XATNfAJhUoRpLbCywc
         Oqc/DcaABd2O0U0cq7IA9x5+SLPksmj0vKGSMqkEN33zOt60y9VdlIhVRHhMeSURLYI8
         Mc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689665481; x=1692257481;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBJnaNvNVJchDbOXrr9w7J0hPOynQY6xp0EpThEjT3w=;
        b=XO10hN2/AtMBu6C694OIGDNND7X3ll9++HGne1pRs2VAG6c3I/NXeTKNAwkbJT0Ub0
         ESXthSfsleFfTyn3HG9+g65eDDyvcLtEd2nWt6v99pZyOAp4dyjKrVl0dKliH5wxHyfg
         S3Xpl58CU8UbvHlPYO3YM31Z99i5z9BctdI1MqT2P25FtOteyuVI8pYwnPdtoO984TRU
         lxUzfisjxctSsKLVsS21nIxKvCxppcHfJ7SwbETv7tVweK3yW2RKXFmzRTuMqFRgqRby
         HMFTzVtVZg0iY1H35jBCirgOb/R4JDKW4dY8eqAj5r2vSQBrcOvFmjzW7EjZb5syYWXq
         86xg==
X-Gm-Message-State: ABy/qLapqRPPpLNuw6MGHBZ+fTxeVw1bz/Z5AvWBvraJ3mzlsltITL9o
        QJZfxwsubKfLvP/57PT/jt/J8Vfgk2dxDDmEat9mOg==
X-Google-Smtp-Source: APBJJlFh2QO7ReglxJWPNSQ+ZQkIIfMhQ8OzPkxyHxtykXa9WY5S+Pfa7pEP6nEULAsJdc5nUzyeBQ==
X-Received: by 2002:a17:903:2351:b0:1b8:86a1:9cf with SMTP id c17-20020a170903235100b001b886a109cfmr15408793plh.32.1689665480664;
        Tue, 18 Jul 2023 00:31:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b001b3df3ae3f8sm1078938pln.281.2023.07.18.00.31.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 00:31:20 -0700 (PDT)
Message-ID: <64b63fc8.170a0220.27440.29e0@mx.google.com>
Date:   Tue, 18 Jul 2023 00:31:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc2-246-gefabeaa08ef1
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc2-246-gefabeaa08ef1)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
2-246-gefabeaa08ef1)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc2-246-gefabeaa08ef1/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc2-246-gefabeaa08ef1
Git Commit: efabeaa08ef1e95ca92675c66fd8a1ef7acbdde2
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
