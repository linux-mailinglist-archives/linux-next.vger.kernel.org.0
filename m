Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53BF7D1873
	for <lists+linux-next@lfdr.de>; Fri, 20 Oct 2023 23:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjJTVyt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Oct 2023 17:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjJTVys (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Oct 2023 17:54:48 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18143D45
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 14:54:46 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c9e95aa02dso10478745ad.0
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 14:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697838885; x=1698443685; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aRnn6QeGBDLpaUcxOYOsIOPii/Fy1pgBeWLE+fKLGSM=;
        b=ny+F3lfE05qN7jrwOAkolQSkdrRQhdhOR8Un94xqzBHUsxZKMVeL4zEI6CaVrT0Mkj
         rH8MUnsdW0vg/4JrWEYIe6q59qnAZCWX1o7D7e3f6kd+yesfVL5NAsJdkzZVifr/+Uww
         bKwOX/QGLw0srkAG/+qpwvynPG4KmFC7tXH/Kuvl4bU39b5MpFKPj552n74ZqQ5h2Hla
         +XVGWnwMkVXGhQ2v8uAtXz60vf2D6irudlHO5SEP54Ov5ygdXf8jw2waTlYMaH4AOa6O
         MdJvagIk6AiJOomGOHkJ+WgCjoSgFEBM5kbCG5MFvk5M93kGtB1QHfpG5EAVNjJFf7L7
         Dc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697838885; x=1698443685;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRnn6QeGBDLpaUcxOYOsIOPii/Fy1pgBeWLE+fKLGSM=;
        b=UlEh+nCDjX7zw0Tc7KB6Lapl5zNm2n2R+LQQLzgVyyCEJLuzMPWgPUHIBwVn9tZ5Na
         Nlk1Dp2rosccuXWSkMgOzjrN9CXG/hZJjfHpZRd9LJ0QFSvtwhkPa7RTs1zUoa3A6KiG
         ygjjcmNQ+PA0eiNzTvHAso6qLTJdEZXtWREBpG6zeinXaIJGWLvjL6sZYxMiKBd41gHy
         hJ4gWBRBSVF8nF1X1JFYLDui6epLY0bEG/hPB0pOYZ3odlwBcLGW/I/TdVDx4q0XxhSe
         FHzCXvKaYbEATrChrlqBqEXJEbDthdvxLNfQ2Vsu+TJAA8znaWnhtgBmOtit7+4tMxPn
         7lvw==
X-Gm-Message-State: AOJu0Yz9LXufxtC+t4P5+BjwhjgKu72YFqFiFMswQfHA7S+UGec875up
        jdLkogWQ1rWK3XoU29xb7iQ1VyweOdH0dckR7XR82A==
X-Google-Smtp-Source: AGHT+IFGoWVTuWC0n44qdVMJWBmR9TkYgOzZ3VC+C0NiGQqpCoH3lSDKwGvxT478eMb/TBH751drlQ==
X-Received: by 2002:a17:902:ea07:b0:1c9:f6df:8a88 with SMTP id s7-20020a170902ea0700b001c9f6df8a88mr10727790plg.26.1697838885071;
        Fri, 20 Oct 2023 14:54:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902ecc800b001c88f77a156sm1968306plh.153.2023.10.20.14.54.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:54:44 -0700 (PDT)
Message-ID: <6532f724.170a0220.7a6be.7678@mx.google.com>
Date:   Fri, 20 Oct 2023 14:54:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc6-398-g08f4e7d168e5
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc6-398-g08f4e7d168e5)
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
6-398-g08f4e7d168e5)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc6-398-g08f4e7d168e5/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc6-398-g08f4e7d168e5
Git Commit: 08f4e7d168e500762255211cd70d1f4eb162200c
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
