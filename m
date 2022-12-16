Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3452064E64D
	for <lists+linux-next@lfdr.de>; Fri, 16 Dec 2022 04:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiLPDS3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Dec 2022 22:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLPDST (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Dec 2022 22:18:19 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E978A2187
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 19:18:18 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so4698342pje.5
        for <linux-next@vger.kernel.org>; Thu, 15 Dec 2022 19:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WJdMXvZ7kUAv4szoXLebQMQHWI3Ns6DNh26EWF8SFI=;
        b=UoLrIh+6czXNF/DuMQhDn4JYKP7jGgaQr1X/zlKZuRBNS6GJsoQA2TILEtuycs2nMv
         3zsMtBdIwo3/nugr8+UF9NwuPTTXtJk/g4oZcCdx7u0XQYqGiKQHKrhUgr6gmH1gZG8z
         /lDObJjce7UmkOyFNe1yeOhN0ELSuA5O57kNhRmFvm0qzOCCtI3vPYC951SCA7bm8Pgp
         d3BErhtuB/EzF70/EbmRc9p9CFLIPiTcisdXk4SlbanhqM5gQIkDTKpe92U1rLkRG9nj
         r+2SAfB01V5PoqPmTgFJiYSjP7mMuOMrNlcGSnQHGNc/ExsSz6T/cehTzfiuLaRMRaF8
         nCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WJdMXvZ7kUAv4szoXLebQMQHWI3Ns6DNh26EWF8SFI=;
        b=Sc7h2bBKc10RRW3+fbvwFN7Xi2QNYx9irtqujAFouv1eIyLnx8K3q2TJUuHK9BF0pU
         ArAI/2A289Owx3sYd3w9bQqeDtwwGERTSbEeZqJWxYufAx0Vy4tajnsqddXfjwBxT8mS
         BelCZofA1lYCVVdFYbAxO1QYEkb4FNaRFliT/l235t+Q1rtPTIVf+no0Jvosp8kKs4vY
         qUks1fF2aRS23b1UC3lwYazR30wSzuJLJ5ZA4yGUEQHcGRGr3K2mBGAEEOvSoCOiGrXU
         U8586aWo2H0+2rrdKaFqdv+QskKAzLIhWKnorx4g45eMuPRGWclQdl3A2hLXYOko4Kpu
         4T8A==
X-Gm-Message-State: ANoB5pkxy3KzmLm8PDsHtTDxF8wYpGrlDM922E5Doep+l9cU96CCNvvk
        hyW6+OV6J6x+gK+UUu2IiZF1RYAnVp+j8u57XeAbiw==
X-Google-Smtp-Source: AA0mqf7scVeV+vP5bbnz1KKRzffUQUrzffNum7vi2gQpo8ubhirGlBqWAmp8Qwa7DXqHweoVvQFnaw==
X-Received: by 2002:a17:902:cf4c:b0:189:d696:63e2 with SMTP id e12-20020a170902cf4c00b00189d69663e2mr35797502plg.39.1671160697998;
        Thu, 15 Dec 2022 19:18:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7-20020a17090301c700b0019101e8e006sm276686plh.56.2022.12.15.19.18.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 19:18:17 -0800 (PST)
Message-ID: <639be379.170a0220.89985.0b83@mx.google.com>
Date:   Thu, 15 Dec 2022 19:18:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221216
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 29 builds: 1 failed, 28 passed, 1 error,
 4 warnings (next-20221216)
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

next/master build: 29 builds: 1 failed, 28 passed, 1 error, 4 warnings (nex=
t-20221216)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221216/

Tree: next
Branch: master
Git Describe: next-20221216
Git Commit: ca39c4daa6f7f770b1329ffb46f1e4a6bcc3f291
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

arm64:
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning

arm:
    tegra_defconfig (gcc-10): 1 warning

mips:
    rs90_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning

x86_64:

Errors summary:

    1    include/linux/fortify-string.h:57:29: error: argument 2 null where=
 non-null expected [-Werror=3Dnonnull]

Warnings summary:

    2    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 de=
fined but not used [-Wunused-function]
    1    cc1: all warnings being treated as errors
    1    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    include/linux/fortify-string.h:57:29: error: argument 2 null where non-=
null expected [-Werror=3Dnonnull]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/coredump.c:841:12: warning: =E2=80=98dump_emit_page=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
