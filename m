Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975767A4052
	for <lists+linux-next@lfdr.de>; Mon, 18 Sep 2023 07:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbjIRFJ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Sep 2023 01:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236630AbjIRFJy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Sep 2023 01:09:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D945AA6
        for <linux-next@vger.kernel.org>; Sun, 17 Sep 2023 22:09:48 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c39f2b4f5aso28179075ad.0
        for <linux-next@vger.kernel.org>; Sun, 17 Sep 2023 22:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695013788; x=1695618588; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vY51BPJ4+BeP13WMIluT35SiaygD+Ixmg+0T/Wu7tb8=;
        b=PhzIgcjVk2aHOMK3nFHXzvXmPN6kll7+YlzoZsTdXnzxTfwvBdKN4OEsszon8+U9cr
         i+zPAGdRjzGd5TnOgo5J1og8tmF5jCa4nsi2J9ntsBI+ZEU+Jiuc/UVnkjkJQ6bqxh1a
         9Y8Agxki9Zkzi8Cxr2X51Ry4JFDSRtBe1oT7kGS4pB6znEdHLDvd0R5/yPFUNECJBWi8
         HU29Jd0OrjTOb+2l17h/sfd1KwSxe9ZzuvMhPgi0ZhY0N7F8t/KehJsoPHLMecvRvc4e
         vRMG7kRw4H4e2Xq3uEbOY2WAaBPRW1wVRaUOhaYyYy9OL9TKury2EIGskERt1hjg4SQc
         vb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695013788; x=1695618588;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY51BPJ4+BeP13WMIluT35SiaygD+Ixmg+0T/Wu7tb8=;
        b=U9dFo9MSv967gC34AMOh7FLu1NES/K+YNqk1NDjY55HwrQGwgQR7q5HkcC/Cc69cIk
         oAMayYvIyxFcNpz/Auu2acqL1/upF8osU6QpPJqF4iOoOh6kLNtPOF+N2HGJ5HNYH+5B
         QBiZj+gr5WJc+VnNEN4Nrisx0VjJ1/rAiKkF7H838JN1o+tjVmPu6lOh07O2ezCgU6dD
         apd9MhFNNnGuH7Rc68j9K5Ydr244OgHUUOm9PjVQCzyaf8UEw1ofAXVB8Ia8EaVUNtgN
         kGqDAI+aEZtpgIgvHJMHnnftbzwKekEyA+EQCcxbVvX0V2Gjyly7lhiAlBpRB8sg0IJE
         zJjw==
X-Gm-Message-State: AOJu0Yy3HUEoOc5yj3A0EharMnrZLqWeALGeBe0iSCY82DuXbQsDzrCR
        MlbA+B26F9iKmv/Wj1y6e9+8+580nDEuE5u8cS6fgRMR
X-Google-Smtp-Source: AGHT+IEm7qEM7aZ6FzqafAr4IRhRwKW+1Otm9FE+Dotkgs3reKUN2C4tu4JAesSHwcFDecNNTxZQvQ==
X-Received: by 2002:a17:903:2442:b0:1bf:70be:ca8b with SMTP id l2-20020a170903244200b001bf70beca8bmr7878732pls.43.1695013787871;
        Sun, 17 Sep 2023 22:09:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id z12-20020a170903018c00b001b392bf9192sm7428753plg.145.2023.09.17.22.09.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 22:09:47 -0700 (PDT)
Message-ID: <6507db9b.170a0220.3ad92.a6af@mx.google.com>
Date:   Sun, 17 Sep 2023 22:09:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-351-g529304bb5b40
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc2-351-g529304bb5b40)
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
2-351-g529304bb5b40)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc2-351-g529304bb5b40/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc2-351-g529304bb5b40
Git Commit: 529304bb5b40818cadc0ab9c7a41035528c5e4df
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
