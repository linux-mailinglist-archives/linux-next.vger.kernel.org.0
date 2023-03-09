Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301146B209F
	for <lists+linux-next@lfdr.de>; Thu,  9 Mar 2023 10:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjCIJuL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Mar 2023 04:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjCIJt6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Mar 2023 04:49:58 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74B622A3B
        for <linux-next@vger.kernel.org>; Thu,  9 Mar 2023 01:49:57 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so5457317pjg.4
        for <linux-next@vger.kernel.org>; Thu, 09 Mar 2023 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678355397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qBE8/bUIu8uFihmrZzb4200HkAzHyGtmvWgen2dzv4A=;
        b=xR5tujewJvkoCH+ZHyhlbgtBYSzR4MCjIihLgGpEvZGWK8CxQBmpg5LGFJhFpoG0t9
         K8zgE/v04JuW5C1o7yNHmSjTegK9tdQTLcOVX9usFpIY9Qpdu31jj7GXIGvmv30JVEos
         KV3cSdA0ICx5lypD7OFo61kGM5El+jWqYgJHV/+cBaFnvyB8rxiA2qBU+G+T7L3BRFDF
         CSrFN5i/S5/fQSH8E4uPIziTtzZ7nV2mUD62oD08OFHvrei5EInPGBWKovt/p4COYxHD
         g0ZpA/o8FOVOT65GPT+i55nD5kBDTYhsaC+VLYAeg2gqxTyz5Obi3ej/4R1DNFsGsUDb
         1VLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678355397;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBE8/bUIu8uFihmrZzb4200HkAzHyGtmvWgen2dzv4A=;
        b=v/Oig+wkp+rsMqCN14Rk+7dAkvSWmRDPclnNNBUuLdvVWuWZD+QZi+h7woempr81vL
         rnShvNltqwRQ9FO11LdFkonRAOesnEUcCANWLjEW4e6L08V1DCRQ39JiucLR5QUxwNQP
         7jYS9u1wzbWp43AR/ntasVFQkT5pc/ZmagxmNIurMz2enyuJ1BhszG1R6AIWchkoirJp
         ECmx1x4EEsgs040wYoxTkidTQDldIcEhw0DhRYxgz1VLNQlKjjQUoKe9aLLlXrznaCfV
         XY/UzO6RSawTXRmWJgPU9rbA9hKLkyEfo9PBKs2w3E1wsfSlPmTxD7+B519Z3CoYqMzg
         GI0w==
X-Gm-Message-State: AO0yUKVeOsupdejUPoLqXlBlnb2JKmYEdrt6UwuPt3x+myqYPGDJ/hv8
        PGeDXmaL8or8Ts9EjVu9d9i9j3FTQFp7jq64rOvC+6f2
X-Google-Smtp-Source: AK7set8ZJsrU8aWDHgY16DG9xPkR+ZCFyvLYJWorAu22nuAqnyZq8EV22yJEhd4KW+sR5XZihamaLw==
X-Received: by 2002:a17:902:8c8d:b0:19a:9880:175f with SMTP id t13-20020a1709028c8d00b0019a9880175fmr18046716plo.51.1678355396862;
        Thu, 09 Mar 2023 01:49:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id km12-20020a17090327cc00b0019e30e3068bsm11289182plb.168.2023.03.09.01.49.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 01:49:56 -0800 (PST)
Message-ID: <6409abc4.170a0220.509e7.4f7a@mx.google.com>
Date:   Thu, 09 Mar 2023 01:49:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230309
X-Kernelci-Report-Type: build
Subject: next/master build: 14 builds: 1 failed, 13 passed, 3 errors,
 3 warnings (next-20230309)
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

next/master build: 14 builds: 1 failed, 13 passed, 3 errors, 3 warnings (ne=
xt-20230309)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230309/

Tree: next
Branch: master
Git Describe: next-20230309
Git Commit: 2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failure Detected:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 3 errors, 3 warnings

Errors summary:

    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:115=
2:34: error: variable 'software_shutdown_temp' is uninitialized when used h=
ere [-Werror,-Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
9:24: error: variable 'memlimit' is uninitialized when used here [-Werror,-=
Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:114=
6:3: error: variable 'hotspotlimit' is uninitialized when used here [-Werro=
r,-Wuninitialized]

Warnings summary:

    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
6:18: note: initialize the variable 'memlimit' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
5:22: note: initialize the variable 'hotspotlimit' to silence this warning
    1    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:113=
4:32: note: initialize the variable 'software_shutdown_temp' to silence thi=
s warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1146:3: =
error: variable 'hotspotlimit' is uninitialized when used here [-Werror,-Wu=
ninitialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1149:24:=
 error: variable 'memlimit' is uninitialized when used here [-Werror,-Wunin=
itialized]
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1152:34:=
 error: variable 'software_shutdown_temp' is uninitialized when used here [=
-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1135:22:=
 note: initialize the variable 'hotspotlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1136:18:=
 note: initialize the variable 'memlimit' to silence this warning
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1134:32:=
 note: initialize the variable 'software_shutdown_temp' to silence this war=
ning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
