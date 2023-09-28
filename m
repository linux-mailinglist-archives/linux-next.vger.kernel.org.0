Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177CD7B0FC2
	for <lists+linux-next@lfdr.de>; Thu, 28 Sep 2023 02:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjI1AFP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Sep 2023 20:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjI1AFO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Sep 2023 20:05:14 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226E3F9
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 17:05:13 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-57bab4e9e1aso4700046eaf.3
        for <linux-next@vger.kernel.org>; Wed, 27 Sep 2023 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695859512; x=1696464312; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pSGrp7GtM0FP+f4kQNfMo7ITId0ZYvNWo7jy+TX1KNE=;
        b=qbxjvfg+djMVrt3yCOiv5pEeXsNvb5iagDdj/KeF0R8KXyRuYQY7MxpeLgYhfUXeG7
         9QJCQFSTx1gq6wZPXiNSX2nk8IaeQ9OYvbZpP15n2dpeY2zvz7F03YPczF9UhFN7fTbZ
         FwuBGHQ+JGr9+B/z39tWVhllFG3YueCVL8ovBVVwwTgbVzy9yE7a3Ma6cgdnUTz4waCB
         cc0o8qNAq3APbHO+RRQ/DsdE7wRa+nfqGI450c2Vo3c7OCufTc1mjFPYFIR82cpxqj9y
         jxIJb3/eE4pAtjqybM0nJRN5qpjeaVfZSDDg5uQIkhFWWFyujgAW0BiXNlq+6GvwLnHz
         ltbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695859512; x=1696464312;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSGrp7GtM0FP+f4kQNfMo7ITId0ZYvNWo7jy+TX1KNE=;
        b=jOfIvISn2ct8STN8hb2/njmAb/pPkpU6CY75iNUnJF63zrSvouBgPPlhCtTXF95/bM
         aIUfsaY7gpiSX3laXCm8/3DwBBEwxwgSCmH0OWkSZa7NOmk4S4Z9BCMJA/FTXAXDJqER
         KNzSTcfFFaaflkzD1i336fHdFHQCNFgK4uMgyVYStjlgzQ4L9Se1zvkXfZDjULrb4Nyp
         3LOLpYswTdJvJtHNmTxZ395N8Pesi0HYkUDJ/mUS0q/z3vaIsHQRbf8j0JE+ip46M6af
         Xk+aNLgH3VtGdQggd8fjx7+mdOnNFAAUaYn4IX8zw1855wRmWtzeogQwkdRDShklfOvB
         wdKA==
X-Gm-Message-State: AOJu0YxYrpHRxYIF2Gmk6PpUfCZ2OScCZpYICYa28SnbfgH5nuflHg5g
        dFvHCkDeZvBA9kOhsz1N4+tIBPGzoKwjQridBjKLCA==
X-Google-Smtp-Source: AGHT+IFl4KFoGHF5UhDJf3pAshvAcH0mZVpgctASNW7NRaqcreBOpvQ8WiWlNbLE16JAqyQxACYQNw==
X-Received: by 2002:a05:6358:94a4:b0:145:68c1:4007 with SMTP id i36-20020a05635894a400b0014568c14007mr3830415rwb.27.1695859511905;
        Wed, 27 Sep 2023 17:05:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id t6-20020a639546000000b0057a868900a9sm11852872pgn.67.2023.09.27.17.05.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:05:10 -0700 (PDT)
Message-ID: <6514c336.630a0220.e6673.0fa6@mx.google.com>
Date:   Wed, 27 Sep 2023 17:05:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-321-gad82df6ef94b
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc3-321-gad82df6ef94b)
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
3-321-gad82df6ef94b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc3-321-gad82df6ef94b/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc3-321-gad82df6ef94b
Git Commit: ad82df6ef94b32608e7ebccd610c0457faed505e
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
