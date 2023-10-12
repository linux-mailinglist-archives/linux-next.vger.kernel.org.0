Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F81E7C61F9
	for <lists+linux-next@lfdr.de>; Thu, 12 Oct 2023 02:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjJLAor (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Oct 2023 20:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjJLAor (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2023 20:44:47 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B04990
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 17:44:45 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-692eed30152so336117b3a.1
        for <linux-next@vger.kernel.org>; Wed, 11 Oct 2023 17:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697071484; x=1697676284; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GJdehtS/Rrx18faMZ7BlCegqs9/1AQUJDox6PvRcen0=;
        b=TJM5P4m83Fyk8+WzBFutjwqR3xIByL143UpA1WDUQslmEmSL4pUZokbz9UQaKRKd0h
         33r5bNFtsgRAvjivbLulaj0q5KN/8UMmtCyFIZx8fY1hMN0SA7oBxTHFyjdjuOx/xuE9
         8RIFGglxZSny17lCKoFi8Nilv8hkPcXPyXD4VHusIrIeikf3QwP9lA9g3RKT52adVIi7
         2uNmha2lWYLxgx8uTFz6qUXl9N/qFKcanf6g0WcZOhY4yARrlBaGh2ZW3CiNWwBs369M
         PxY5GbjTqqD/KEeiJp10+opLP/sgMFZrL2Q0eRqPjhSSmGion6UCOPWaKiaRtLLhjFJx
         b9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697071484; x=1697676284;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJdehtS/Rrx18faMZ7BlCegqs9/1AQUJDox6PvRcen0=;
        b=llV72nbHsMsVfKzJSgT/9szhuHl2SoBB4XmjsQ+V0KKmhxF4tBH+rAtN/QdXc/fl39
         WipIz188DJCvhTVmP8P66IdqWb66LH7fMEUdZt1VnrmWbjsuJ0IdeYl/GRGRuR4nOJZY
         5UYb7leq1cakKWM0Hoa8jktrq5dsmnxqmj/fg1LEQDqejw7TGYT2dXZRvqRhwoFifUUS
         J9j0baaGHK3ZdOCM1l35zyNJivYhuQLD7p2OPvTZAMvmDtqE8w0tivPJxSFJTRneP733
         SrkdUn1T0hL9NzA7L5yU/+j/7gU/dc5FS6Xe0y2HXcgc9iVUeFIIjMwFDoau5T2MNaFx
         S6Pw==
X-Gm-Message-State: AOJu0YziL01zLyoXb7gOOeM0wAQ/S8KJQ3oWEUgNcDSJ1WdqmDBDmxb+
        KaVrVw6FzSp3I09yEFn1919+7lewuuJdZ1giNKrVtg==
X-Google-Smtp-Source: AGHT+IG8Iu49V6gu9ZVwqvapYKtx646MW2SPoFTUgeOFaIcEkAaSsmLTML1/SEdKDPHNgH1NmKvWuQ==
X-Received: by 2002:a05:6a00:3906:b0:690:c75e:25d7 with SMTP id fh6-20020a056a00390600b00690c75e25d7mr22318862pfb.18.1697071484214;
        Wed, 11 Oct 2023 17:44:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7800f000000b0068aca503b9fsm10736157pfi.114.2023.10.11.17.44.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 17:44:43 -0700 (PDT)
Message-ID: <6527417b.a70a0220.b64c2.da9b@mx.google.com>
Date:   Wed, 11 Oct 2023 17:44:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-359-g960f4d0f660c7
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc5-359-g960f4d0f660c7)
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
5-359-g960f4d0f660c7)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc5-359-g960f4d0f660c7/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc5-359-g960f4d0f660c7
Git Commit: 960f4d0f660c7eca51d814d65d3757ead9c2ca65
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
