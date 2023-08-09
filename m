Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2938E7751A7
	for <lists+linux-next@lfdr.de>; Wed,  9 Aug 2023 05:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjHIDtV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Aug 2023 23:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjHIDtU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2023 23:49:20 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549B7E5E
        for <linux-next@vger.kernel.org>; Tue,  8 Aug 2023 20:49:20 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686f090310dso6297935b3a.0
        for <linux-next@vger.kernel.org>; Tue, 08 Aug 2023 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691552959; x=1692157759;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UOKC4u196Tw3POFJ6bIpvPeaZ8Nm0Wak2K6ex2GCylA=;
        b=KIyQZZx0+IhvhwxTHsF6GK8F1FHBwyTRIn/CuLR0oJDg5t5rRnfyFdGgejIt0vxBVY
         pBh1IsLO7my/OWA38vpmu4G6Z1yKrpiHs2LDhCrNPyWNkkcSNNABVrlEWe6onoWy7SuE
         3SzRt+0njyfp5+0Brb4nPjDfQTaFedDzIPcDhJmQCKmrFCwWD1Mmx0H1vzRN7Ej/uYZi
         JDuEm5J0CAYBnROZQBDm9x0v8ykIfM1DzKhoEyM9Z3Lsw5dopcpozulHh2KkZFYJNN2s
         lS8lVg8vELR5grlVup5yM+/uQ6xVj/TN5gkF0UBtIZjAh/Kl75czpwzfEyhY6NkI8A18
         X1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691552959; x=1692157759;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOKC4u196Tw3POFJ6bIpvPeaZ8Nm0Wak2K6ex2GCylA=;
        b=dnpXRZEhct9mVEZowcDDiW6b2lPaZkeq5R262bJVE3fp5W8yb1UUtdrf66QCNPjz9T
         MjE4sKjMZfTx8x/X9MsAmsumu+kuSn3nm4wNUAXWIwm/PXsq2H1p7jSFrzvDbUw6MBAS
         MvW2A1UVbUJ+LCtDiuIOqWo3LJQQ47RznGd9r4T9y9Shs0hGSashl3Tr5rVxUQHDs29c
         pvXsCAj++gNF7TCzLpic4j4w8UsjxHXLonh6ymkyXEW8XshS4xWZ4PE6myQBGeYS5BeM
         Y/o2yzi8eiIBKDQEOZNaQcspae57Rb5wsJ8Kf9UETnLXaMtmdiVsnXsm1oIsFcVyjjte
         Gpyg==
X-Gm-Message-State: AOJu0YwEPKG/+y4ZfZ2PlTG+sObfXxwMDsA9MyuBhjwXYHL+lTtKpu6x
        96J7omsy2NyfgfepX0Ac8k1SQN+y36dABn9fXjVSFg==
X-Google-Smtp-Source: AGHT+IHYX3e/Z0Vw7m55Poq0eO1Brcz53596KZs8i3FHHmU63eQX3c7ksWQPwo/EUFzhnKHJbU/K6Q==
X-Received: by 2002:a05:6a20:12c3:b0:130:11e4:d693 with SMTP id v3-20020a056a2012c300b0013011e4d693mr1806963pzg.53.1691552959286;
        Tue, 08 Aug 2023 20:49:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 4-20020aa79144000000b00660d80087a8sm8846633pfi.187.2023.08.08.20.49.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 20:49:17 -0700 (PDT)
Message-ID: <64d30cbd.a70a0220.3e6c3.1722@mx.google.com>
Date:   Tue, 08 Aug 2023 20:49:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc5-275-g2f2141a263ce
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc5-275-g2f2141a263ce)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
5-275-g2f2141a263ce)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc5-275-g2f2141a263ce/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc5-275-g2f2141a263ce
Git Commit: 2f2141a263cea22c235fbd6cffad596d457a3754
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
