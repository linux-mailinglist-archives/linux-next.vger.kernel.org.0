Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C11176C1D2
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 03:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjHBBCV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Aug 2023 21:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjHBBCU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2023 21:02:20 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EEA1BD3
        for <linux-next@vger.kernel.org>; Tue,  1 Aug 2023 18:02:19 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a6f87b2993so3464705b6e.3
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2023 18:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690938138; x=1691542938;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0YGSifztvO/jii+qrgg6AFv3a55D6R0s2R/KRBm3WOI=;
        b=wyC+w/YSz8JjtibrEPFTvtsD14qm9JEm/7Bwj6kBAArq3PFRV+n0CI2ahIWnBceGnS
         9uuKrrHFLBs1bG3iwYITSq7HtBzcGpBscbMlzQ47ATUKTKo+SA7hJ3bgN+yZS9iYix9V
         GeWYSlJtVrOyY47Tvfns48PcaeKguNpkmjmRlGT7ZYegQ5FTcE1Xm0S54WYMrpBTMbz3
         zDWjS/T2jyFURe5OImw3e6wuYRcqdLtVqhg116wDI/JOkfTDhdkEoioeiiv3uDVzHj96
         MKMvJfV7Oj3zoCcuSafhdo5ycgcaFrHco0t5Bt4i3+/NH5ycTiSRvoq16UOt1d02I/oT
         m/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690938138; x=1691542938;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YGSifztvO/jii+qrgg6AFv3a55D6R0s2R/KRBm3WOI=;
        b=a2wotIic+R6cUMDIozPSljtottjsI8CXce5ch8yhG/gCOxCjqKVCASaZjXKd5pdM4q
         1jH4F1h35Pr1WV5vChk4ZH7tLkZ/Yrw5TwEOVtpo3/WPqodL6cL1RA7pSzq7vrXV7I+L
         NPYtAQQiw3En1bkP6kdBaJl+nPXYb80T5BdEPeMx0bELSDc++37EyttO+mwlC9S7Qd+h
         fphY+WiDWgFMLSzxGckbTxnoxO0pGdT1qYx59BeFYFL7wVae0gTsBw31IQfg5O3NpdxM
         Wb7q8ZqiPhMAsWIRaZozbmNZTNu7LBGME5eQ3cE+eCNVbX8FpuDsCX/4ifQeCVPziXFL
         Vi2A==
X-Gm-Message-State: ABy/qLbHqeOu68MEMlJRXfgT2w4QZkGiF2pKVRwNwDbm98s6e8OvyPM3
        m0qCTlA+JMtyqHMdNFf8uvR0ZmEumIQjWpgpxfRc4A==
X-Google-Smtp-Source: APBJJlGRhkEZ0PJoJgd+s3jW/zENfbULqyjN/emtogHQZSCs9yOesJC8Tnyx/ReMogNSXpcosRFc6w==
X-Received: by 2002:a05:6808:1a92:b0:3a7:4802:c34 with SMTP id bm18-20020a0568081a9200b003a748020c34mr4360681oib.50.1690938137559;
        Tue, 01 Aug 2023 18:02:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g4-20020a63ad04000000b00563e1ef0491sm10438129pgf.8.2023.08.01.18.02.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 18:02:16 -0700 (PDT)
Message-ID: <64c9ab18.630a0220.d2165.4431@mx.google.com>
Date:   Tue, 01 Aug 2023 18:02:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc4-271-g34fbf9d4c5844
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc4-271-g34fbf9d4c5844)
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
4-271-g34fbf9d4c5844)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc4-271-g34fbf9d4c5844/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc4-271-g34fbf9d4c5844
Git Commit: 34fbf9d4c584469c2b06b8a434f20ecbe63221ba
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
