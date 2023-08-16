Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7954377D959
	for <lists+linux-next@lfdr.de>; Wed, 16 Aug 2023 06:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241726AbjHPECS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Aug 2023 00:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241738AbjHPEBz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Aug 2023 00:01:55 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6A61FC3
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 21:01:53 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc5acc627dso40817605ad.1
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 21:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692158512; x=1692763312;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWHJeU5ofElHrWB3Bdm3qwGule4nJdM2Iw4v/CnfIgU=;
        b=iIeLd98NzrPvioEIu9kLMq3FHPYnxM/K/39h5plTYzosVcuT2Jjg4OLvE5SnsK2JgP
         XIlmW99MJ1oxm9/5ten96WqOS9M2HLWGCK2q59SF+m2Wp6poAuAFshu3Scje5NtZRCx/
         AlIyaLS2GCtRplYL/bXcokLH6YTXjvDBfuuqP8ITg0P6SIq9Hk79axPNMz3UU8GrGWOI
         8QRfM4OmgJ/Q4s2NitYK6n/B6MkgvfXIJvITxaUqn8wuLi3Yio+GDptQ3Y5ZV/wmksmc
         BO5sju16fxcsvoMcLad6VOAQzKfoNoEv4AK7OGcY5Y6vQSqm8QcYifD9NP2buCjBKYDs
         KKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692158512; x=1692763312;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWHJeU5ofElHrWB3Bdm3qwGule4nJdM2Iw4v/CnfIgU=;
        b=S/BYGXhP5ffyV7msdXFDup1EC1V6UV4UPcPxR19wEojzUmHusuERmVd0Y98pi4uJDb
         /dibuf+FlrOmv+fDUnAG4ibOiMJC1tw1wxhMTu3mFoyDRXuH8xQToZBLYR2G/i4Ma3Lg
         +kMUQFzmn3rhI0/QKsHh86qjQx2RG11WzswyyTGV8MDHUv17wMbRQ/LVfwjb99kaKqmW
         2B5yQ/RGs6BBfq0uqTQ5YK3vVAsSQfl0+7KQrTPIqljZLQz+T7O7R+PE18h/Jab9Qa3d
         UjSspYGoM+/tfw/KgihR/HDTL4THY4L25ee9zEMlT6eqWJSyORQ/VnKnNfeJwxza2bLa
         Vcbg==
X-Gm-Message-State: AOJu0Yx5XCWub8L/iA6EwLcFNkxKp0kZRwkeWc7I36aQnywxexuf2Sml
        tSe1zWqQcPAI9NolgB8+hgP9ropZS31peNdLVH9zwA==
X-Google-Smtp-Source: AGHT+IHd43qeoj78QwJg4/HVw0E/B6zFxi4FzMjxC9cf6T9P6fZ8ci4G+KYeAcpRrBmyse0oEhnTWQ==
X-Received: by 2002:a17:902:e546:b0:1bd:c931:8c32 with SMTP id n6-20020a170902e54600b001bdc9318c32mr648226plf.62.1692158512152;
        Tue, 15 Aug 2023 21:01:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ix7-20020a170902f80700b001bdb073a830sm10406300plb.162.2023.08.15.21.01.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 21:01:51 -0700 (PDT)
Message-ID: <64dc4a2f.170a0220.7747e.436b@mx.google.com>
Date:   Tue, 15 Aug 2023 21:01:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc6-182-g1f1203b93bb4
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc6-182-g1f1203b93bb4)
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
6-182-g1f1203b93bb4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc6-182-g1f1203b93bb4/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc6-182-g1f1203b93bb4
Git Commit: 1f1203b93bb45d3d8b56e939fe76785da6c73cc4
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
