Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9363E7F0A3A
	for <lists+linux-next@lfdr.de>; Mon, 20 Nov 2023 02:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbjKTBFV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Nov 2023 20:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjKTBFV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Nov 2023 20:05:21 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673E5F2
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2023 17:05:17 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso2471761a34.0
        for <linux-next@vger.kernel.org>; Sun, 19 Nov 2023 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700442316; x=1701047116; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rJHSKV528241+U2G2QClBCFyL3bZByCzPeKPLXyoXLc=;
        b=ux4zpZ163JN8caSG++lVzWVekZw/z9BUcPW0Pof6jqPS8RipycHyKIX/wYqBepyUmX
         8mbf57cuDf7R12kTBhwfLhqKrxwJ7e48ibdGYtb0gRWdwnIxib4TeNAMz+Nykkmg71s6
         0oeH/6+7PjziCT2+qnQMka0nhYjd6neprneVgVhFzsi+VrsgwG2dck0AP5fituAZ9mIu
         E9GP3fuwhcU1vk4ieWseSHY0C8bAj+Q6qGH3owiPHWD6pqOAaop/mxctRZNJ+I5kd23f
         KZz0S0h5EGdCEP5IGxdO076CFA4BUwOvw0kFf3Jzb6AmY3OnW2Fr66CrIibLeacbEHe0
         QywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700442316; x=1701047116;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJHSKV528241+U2G2QClBCFyL3bZByCzPeKPLXyoXLc=;
        b=aRUh1AlKrrFdIsEu2ZXcZU+F8KZ/D0qGICSY0gWZpLVQCzA4r4j/0g4fIHvAbt1V0z
         2xEihYEweWNr7KYf0aihS77Zn3Kr/oIibzQwJcm6AAeJfM2DUxE1UkkKN1SS0rTrqJio
         pjNNYlP5RDoPlOJinUcSHrG8QAM15lNQtcjVg85Jr9/BzO/rneTGYQ7KHqI/8/yKngob
         wxHPMRCAchw9v9t9r9xADH6kWFJ73uw6BYi3ffvlF+ahaZg/E1P958Cz80cZ2LxUUSDf
         nqmKVzLU0faGjOUlP57kas8k9lRj7Kl3h51UYWkzvcoWUHwVgm+R1VpUOQPObxtcEC3t
         ZOSg==
X-Gm-Message-State: AOJu0YyqclJRnlG8WjOb0PwB2UKmWAvmuhHkH+QWDZqDGEQ+H9++It+H
        Fb1BUR0ZJ/AVAtmbSFgb4bIAMs1yycIT3abBMNg=
X-Google-Smtp-Source: AGHT+IHlaN4GgkJfYk8IhKEjLw51toY+hjV3srk6Ei6boNm6rCiyPf+SEOHUdDFy+kFL/TZMXbv7Ow==
X-Received: by 2002:a05:6830:1ce:b0:6b8:7eef:a236 with SMTP id r14-20020a05683001ce00b006b87eefa236mr7222741ota.30.1700442316099;
        Sun, 19 Nov 2023 17:05:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a24-20020a656418000000b005b9083b81f0sm4241558pgv.36.2023.11.19.17.05.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 17:05:15 -0800 (PST)
Message-ID: <655ab0cb.650a0220.5ad4b.9d12@mx.google.com>
Date:   Sun, 19 Nov 2023 17:05:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc2-118-g64e6d94bfb47
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc2-118-g64e6d94bfb47)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
2-118-g64e6d94bfb47)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc2-118-g64e6d94bfb47/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc2-118-g64e6d94bfb47
Git Commit: 64e6d94bfb47ed0732ad06aedf8ec6af5dd2ab84
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
