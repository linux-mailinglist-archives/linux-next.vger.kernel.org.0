Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9703F7E75B3
	for <lists+linux-next@lfdr.de>; Fri, 10 Nov 2023 01:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234962AbjKJALN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Nov 2023 19:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbjKJALG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Nov 2023 19:11:06 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA9C4EEB
        for <linux-next@vger.kernel.org>; Thu,  9 Nov 2023 16:06:59 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso1543402b3a.2
        for <linux-next@vger.kernel.org>; Thu, 09 Nov 2023 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699574818; x=1700179618; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wwLWQSc6uAMz+m8fLXyoYO83mjkHQd1SYtdtSH6Rt8E=;
        b=c2jJhC1S1jAS94Ki/DW8nfYloaxAKDva8/ChfM5JvmXFwM3NLdy2THBMWLODD9vylV
         CNk3otyjjZgc6SGfVjMojkdHtOthKU06Aabrhn4kZQtjyYejSXzZ4oTNdaSB/B5rwtU8
         Viy99pms4Xf9fCY15H5rZLGq08/mDFQRs5m6XrNThPG1aClm7NHOWRAFryxgSlizC2dF
         6yqSwfBWhCAyTXsr8okCgCagC92vLABRfdpvt26kCoupIWZGiHp4a4cUXLLTbZUA25w6
         nwF7nm2pmF/ossFxxHCn4fIx0RLk+mwTacXuq8MiAWgo07+eBcdCyP7Mm3WVweMPKSei
         uIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699574818; x=1700179618;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwLWQSc6uAMz+m8fLXyoYO83mjkHQd1SYtdtSH6Rt8E=;
        b=tvvBYQEYqwJm++7lO6KQ2cIf5pbBZ2GwfHc5t5p8r7USEx+NqHwfY1fON72ATX9LvU
         JitZg9Ko5vf50ukPncl+metE4spjtywWihGlT3R2J/iSBNUHW/JYsUi83hPLbn9DgaSp
         WdX/tDFEaMEtCgVDBHNq5snSEeonNaquRb1PBzPA/x11vd0Qy0iBY9unzzSHJSYO9ffq
         sWdH0MUfovLLiimXxjO/Nr1q56ndh7CGsYFy3mjBDyYSnfr6PnogHnmi0TxQr3KjYAPl
         gAKexn9MT2tLuF2KYaie8Eq9Uiqt9VEQZz3bcm/OxeWXCDrtoa0XllYOzeIbZ2XacfvI
         Uz1w==
X-Gm-Message-State: AOJu0YyOoONXUI5OZVN7WPsnlMWv/skKIe52un08jOBavBCDkW5t2Cal
        0lsdR3l029wRQ6ium5DOE0gqirC1pBmzKw3igEGKKg==
X-Google-Smtp-Source: AGHT+IETQPbYN4vMM9I/MgkyPE9aGUCgOIQPFC+fGuC2Qw1wcRBiXv1IuQKNDahcv7FENiw7ywpvDA==
X-Received: by 2002:a05:6a00:1587:b0:6bb:4360:159e with SMTP id u7-20020a056a00158700b006bb4360159emr7682827pfk.17.1699574818371;
        Thu, 09 Nov 2023 16:06:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id fj11-20020a056a003a0b00b006c341cf08f9sm11633316pfb.140.2023.11.09.16.06.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 16:06:57 -0800 (PST)
Message-ID: <654d7421.050a0220.5f926.f533@mx.google.com>
Date:   Thu, 09 Nov 2023 16:06:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-15892-g41e1be6c2334
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-15892-g41e1be6c2334)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-15=
892-g41e1be6c2334)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-15892-g41e1be6c2334/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-15892-g41e1be6c2334
Git Commit: 41e1be6c233485441f9168883ef7df7b2a4cca97
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
