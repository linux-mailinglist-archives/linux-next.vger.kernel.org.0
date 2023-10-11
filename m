Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABEBF7C479B
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 04:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344527AbjJKCCn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 22:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344209AbjJKCCm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 22:02:42 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8F38E
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 19:02:41 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c5cd27b1acso50488185ad.2
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 19:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696989760; x=1697594560; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BVu7BNHipk4Syfl+bvtdJUU9Y5DrOg2JKETMP4r78iI=;
        b=pD0VdMR/xPCNhFknRiQqBDTlunChnf412O5sQe23HKvJHMd9Fz9QQgxNH/DQ4Xnxt3
         Lx7T1Lkga9M9mrgdLI3secu990zyK8eQfLRF2cyuKE8keZuzQiiy45aGWLAziLGFdP+w
         fJPgTQKNbzSfTIN496vctiV/ufNQ77yzufEVKrJP8FKXdmO/CkXt2Nxk3GgVZOW6ZphJ
         TOOueusdTDP9DgWBWxAkYalrp/AYTksVJK6tTDXP6v8HFDTzXcyb2htltYmFlUIH6pqR
         yTWR6ijr0UyfvtOs574s/glV2B8yvXTQcFAbAFWyf/710tNVTZe0oFW/DaCsnhzEPTkA
         m/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696989760; x=1697594560;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVu7BNHipk4Syfl+bvtdJUU9Y5DrOg2JKETMP4r78iI=;
        b=Uj2+LUf8Yls2CKeObXVnfqxW5Bik5ZVzce46odo7ViZXr2dJRbKaK0g2RIyPqGcVOS
         P8WdhU4nW5KbeuFqMwdQmbq6k7U7SsZzAKPLdnm9MPtLbT+M5adeypwvgXE5M2C5zrva
         Cf8whdaYHoI/XgSX0VtXV9/e1JW3rxbKQRhXYO8MvCxbr0y7vKGIevGCDWQvGQJY8rwZ
         S25UzrFPT0AqJ5cwxi8wW/9Jb0b9XT0U/CTgHN1TAPhqAlugJrfoM5+pH0mOS3C+cUcx
         J0IET5JCjClU16wFnCEyKB5sKE1QQWsuFCYf4/Mq0BB5Vwb+q4kv+kf/NDA+YAYqU/QO
         oSQA==
X-Gm-Message-State: AOJu0YyarpPeZyT+xKKACbNEDxRnLb7oUkCZDV9qU2fEgZ1CU+pi5dPX
        du9qykFFRf/JLBhHUfCY4p5ZKSnU3QZ53o8HuDdo2g==
X-Google-Smtp-Source: AGHT+IHk+bpDh+3BJa8UWMQS4TLPI8VWm+XEEh+JaUi0+EnVVDUxFq5WT0zZNyY1dAUmagshe9dMPA==
X-Received: by 2002:a17:902:cf46:b0:1c9:b338:8073 with SMTP id e6-20020a170902cf4600b001c9b3388073mr3128297plg.15.1696989760232;
        Tue, 10 Oct 2023 19:02:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id w18-20020a170902e89200b001b9c960ffeasm2231158plg.47.2023.10.10.19.02.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 19:02:39 -0700 (PDT)
Message-ID: <6526023f.170a0220.92bfb.7e99@mx.google.com>
Date:   Tue, 10 Oct 2023 19:02:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-300-g24760d837661b
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc5-300-g24760d837661b)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
5-300-g24760d837661b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc5-300-g24760d837661b/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc5-300-g24760d837661b
Git Commit: 24760d837661b7b6b1eae5077e0eb5762550ad9a
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
