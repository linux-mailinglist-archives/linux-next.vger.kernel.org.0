Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E507A71C2
	for <lists+linux-next@lfdr.de>; Wed, 20 Sep 2023 07:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjITFI3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Sep 2023 01:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjITFI3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2023 01:08:29 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB719F
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 22:08:22 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso380993b3a.0
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695186501; x=1695791301; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hxsXNzz6VGMK1ORJh6cvfWMgMIC9jb1enCu0Akp1WTc=;
        b=Zu/hsX2GNXZgroQnT1vVPmF/NvOEqAgxkT3IeUhna0hRh1/bgDBWcQMsvQeGLRVZgI
         eS0db8DwzUnJhw9jOe62eE9+SSTt+obTF9+nQ4DC7vu/qZbCOUGuj/RXMnsIXop2/OFJ
         UvEkLt3+wFaNmVgAHG4bNVcr4327Zb4pR9YNUDcrv7KmjudhNQN501QAPvOJAeB41NMH
         ICB378+BCbwBsK2z8O7H60UHMYR1cLzO9K6EOmf/TnMwjMtstD8jmjh+cboS/aHui9JC
         HlzZVU6IUorcXI5oRxv3BDG+s1IjOGJv9ZKMfpmJUDFJ0aAuYvtRSUVEgStucfDK9SCy
         9Tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695186501; x=1695791301;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxsXNzz6VGMK1ORJh6cvfWMgMIC9jb1enCu0Akp1WTc=;
        b=epS2FGclD/YzOjBXvmdzWolLq5pIUw5k2K7CILkO+dgKudAb4t2AnSY/gXMAmONSzb
         b7mVJBxCcPhyhl/GCBzBkXIJzBtdI+7vPfcA7aBuuUxuQ2X2LCagZRwR/VfCDNYD3ALG
         78f4htXmtAvipsuBcTYTw9Bq/j4j3ThnXXuPc0tgLGhXzyYM69wfFCFkv/FToH8oIMxo
         lxi11VO12BOoh4YonJlnkzGmsjsA1m92/35j45kV0ZoslEUcRu7wi19oT6tYvQkWo7h6
         eziZDNnvb0N7o285z5d9iKBA65dyT+XLfus0M270lyRcyU3D/kW9gyKMtUgJ37MVx7rs
         +GyQ==
X-Gm-Message-State: AOJu0YwYZfIHzMMDJlzZTm7Bn6bT1Rphn2vt4Hg8bPDfB/L6LrIs47r/
        Y3iLzxZJF9x6Q/B5o+Ng5buWfv1rsQ7gxjhDG/Xx6A==
X-Google-Smtp-Source: AGHT+IE+zvvt0ZV9oeGwziPReNLjYDJoCj76xdHSmD63KrXFZDkGJHoAswiIh5kHU1uMugvqUJsobA==
X-Received: by 2002:a05:6a00:4298:b0:690:9a5a:e34e with SMTP id bx24-20020a056a00429800b006909a5ae34emr6170992pfb.12.1695186501491;
        Tue, 19 Sep 2023 22:08:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7910f000000b006877b0b31c2sm9684459pfh.147.2023.09.19.22.08.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:08:20 -0700 (PDT)
Message-ID: <650a7e44.a70a0220.334db.20c4@mx.google.com>
Date:   Tue, 19 Sep 2023 22:08:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-403-g51a4070c505b
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc2-403-g51a4070c505b)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
2-403-g51a4070c505b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc2-403-g51a4070c505b/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc2-403-g51a4070c505b
Git Commit: 51a4070c505b5b958250e95ce78e9c58c7043200
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
