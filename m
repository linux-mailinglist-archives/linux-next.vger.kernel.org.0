Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35AB7D2871
	for <lists+linux-next@lfdr.de>; Mon, 23 Oct 2023 04:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjJWCRl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Oct 2023 22:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjJWCRk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Oct 2023 22:17:40 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA2590
        for <linux-next@vger.kernel.org>; Sun, 22 Oct 2023 19:17:38 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cac80292aeso13814265ad.1
        for <linux-next@vger.kernel.org>; Sun, 22 Oct 2023 19:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698027457; x=1698632257; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=miXf/PLp8vl9mJNPrh21GVUDfJSLbCS1v6r3G7tMFRU=;
        b=itKFoAYm4Nu7rHX/gPKBSx7X3byDLU+YY7dk1oYXg79xgh0NZhh36VxffTdOtRAzMK
         Vw4oxbOA9eF4fG9Mqvmg+idRhJDLoIre1CpSOlTERT9aCBWRuITtheM9AwYUf8qkvpbo
         AhiTG+V0voZrpWTf3TX4kYnXE2Op6gZcguhneVbEDIpHIYUbaG10bPinDEY4rcAjASAB
         Vc+9yjvGi3gUfGJjfGQCr3Ey486cgFHOqcgp8NouiGUB5MNQeruGJwU+XZf5XQQ00aGX
         Z+G86SqEohqmDBfgLX050Ey+QEoHnxzj6JU1PHAybzL22QA3F0EOOApWDXypRz/xNzo/
         SWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698027457; x=1698632257;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miXf/PLp8vl9mJNPrh21GVUDfJSLbCS1v6r3G7tMFRU=;
        b=CQbKNjSQ+jlEV5RJWA1F5oMtRn8Vj8XOimAKYP7sY/DbaFiWPC9wtteKhI29IziMmn
         YcLArblabW+v75wSKCNYpcl+8shJ8tF4y1WXGK3kWDexud90NRLatkRGGgaFZ8pGVqup
         VpU1F3yiGlglYZzkGVhylXi6cm2kLvSP5+xNCMgHAEwDx6smNbxc+MExy/urlXQmskpR
         ab1yVru4GzLbvKHS6oUbG0vkqAAFK2oDc/iC02PNp9dKzW2DwNTBQiRmWUQHspaBo4ry
         6wDBwAFM+tHIwZDRPijbBYY8hAVsddeZ82nhXWA11di24jowQAEZ3ruZIig2mu+2RHZg
         7pDw==
X-Gm-Message-State: AOJu0YwRqyQM1XGRRVvt+SaycXj27V3HcMFvN35W0aypcnAwl7YjJ6LL
        WXLyBU9E5i1k0Y0QFmZmuTFpTelTaqDU+E2RjAVIjg==
X-Google-Smtp-Source: AGHT+IG6KeKxwpDQPLbx6isYzV3jIO3/z2D2F332m9RC52t8HjrRm7G0VcBPmvTgWThaPDWbCww9Gw==
X-Received: by 2002:a17:903:24e:b0:1c5:f110:efa0 with SMTP id j14-20020a170903024e00b001c5f110efa0mr6414529plh.30.1698027457617;
        Sun, 22 Oct 2023 19:17:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001b8b2a6c4a4sm4964606pli.172.2023.10.22.19.17.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 19:17:36 -0700 (PDT)
Message-ID: <6535d7c0.170a0220.73f7e.ec22@mx.google.com>
Date:   Sun, 22 Oct 2023 19:17:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-484-g284bb784f987
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc6-484-g284bb784f987)
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
6-484-g284bb784f987)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc6-484-g284bb784f987/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc6-484-g284bb784f987
Git Commit: 284bb784f98758e4416e5a52ceffbea845084abe
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
