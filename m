Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DA27AFADA
	for <lists+linux-next@lfdr.de>; Wed, 27 Sep 2023 08:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjI0GSc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Sep 2023 02:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjI0GSQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 02:18:16 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA57FFB
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 23:18:12 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57b9231e91dso4622026eaf.2
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695795491; x=1696400291; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JYIu/Enz8c6AGz138Mh35oMpOkEbM/Vwr7H3auIuQAo=;
        b=B98b9v9ltEv/aya3WY3E5VgnTMX6vZCMJqdbZNIKTq2O+ZrwtbLfvlYuKueGczYPIe
         bB94fyxoY6j6tiohltF8Scgj/vOSmIw24tHqEjdk+A+C7IEsFmyHa1DunvVnhWrnNj3N
         27MkbWfSQmkvDg95Zg3JLSADovqyJJbhoYBpNBLnh7/XeOMkBQz7r4yVNw6Wg7BltFCM
         q0n3ZY6zXqCs8XQS9zsLIM4b+kErRAY3TueGQu82SjHmSpzPc+X4zdx1MbX/ok0nZOR4
         theyCOsN3esmWscAVT5rZ/6bpykG7U+dRsil7OCJtXI+CbzFWdH49oGtLtGPdKuWfg3/
         Rjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695795491; x=1696400291;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYIu/Enz8c6AGz138Mh35oMpOkEbM/Vwr7H3auIuQAo=;
        b=FDIDP5wmjy/neeHYGqt3LwvorivNG0JrJK7GXGDgNffzLd2m4PVcwzo3SNKvPiYh0G
         GN2stUp/hsTsJxi8umrl50rp33CihVNCQbaQeS3Hb8/FT7I54lZj6VPYCrshbJFjT29o
         /tgDuyxUcisbEhYj8kiNHh117soWnS3EAJC1qF1DJu8oyT1vd8vdWElHaEmRUjWONZbe
         2KJ0C8PAMrTceS4zdzlfiGqtuINgy4y+gY0hm/VzezCOzmHP/d1BbSi+SmhwRu847zP1
         WCHhX3X20yJzBioHqGxlxbCfQQQ6rcoo00NDUDTj6CnQ1I1C3CgaX+NXD/M8jy0gHSKy
         n3vg==
X-Gm-Message-State: AOJu0YzhsXcC4rtiLE5M/frciAKEvydVuVAAIEWiU4zSA4APsuDzANUr
        5RjofaivzMhclcYGggTxNkr7pnj6myTN7eli5CNmeg==
X-Google-Smtp-Source: AGHT+IH56IsC0vJky+UTB5J17Y4E3YBQksA+M2KjfOgxTMDhPNSGjyo4SN5r8LMGS5gjqEWQb0NCIA==
X-Received: by 2002:a05:6871:80f:b0:1b7:4655:2ac9 with SMTP id q15-20020a056871080f00b001b746552ac9mr1512870oap.6.1695795491572;
        Tue, 26 Sep 2023 23:18:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i10-20020a63bf4a000000b005646e6634dcsm9266239pgo.83.2023.09.26.23.18.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 23:18:11 -0700 (PDT)
Message-ID: <6513c923.630a0220.f4bbb.406c@mx.google.com>
Date:   Tue, 26 Sep 2023 23:18:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-286-g07ffb99534cc
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc3-286-g07ffb99534cc)
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
3-286-g07ffb99534cc)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc3-286-g07ffb99534cc/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc3-286-g07ffb99534cc
Git Commit: 07ffb99534cc6df026681df85ee321d91995a73e
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
