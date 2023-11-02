Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95407DEB8F
	for <lists+linux-next@lfdr.de>; Thu,  2 Nov 2023 04:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348268AbjKBD4J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Nov 2023 23:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346757AbjKBD4J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2023 23:56:09 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711BFFD
        for <linux-next@vger.kernel.org>; Wed,  1 Nov 2023 20:56:03 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so555889b3a.2
        for <linux-next@vger.kernel.org>; Wed, 01 Nov 2023 20:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698897362; x=1699502162; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n1v/Ude9gvcJ5JMCTl9iHk0wg/OEEvbIa674m+z/eWg=;
        b=MuI6ySJaL4Y2vC8MiLuFzzqb1vyIIFTCGayVRQbTyFFjEFjyCPt4fJz6ZIIS13IL0+
         WyVot7mGEYNkTdQT2k4TCoOUYZo59NNTmbvEicE79ahtefq5EqMSf2PEnLsitSnBevhl
         PRM62CRS9I+dM3R7jZPNVmvVpmZ4sMz8eGdYIBUZ7BOfl5fGC8G2KdgD6pzHGMs7/iC4
         /vLTYHHEifOA9NLgbJlv7x0NIde1vuQQUQNkcig1pwm3Gu0azm/CZhJ70LASiaIhtZDm
         p+UGbOYVp/vPU+NqE8w0VP1RugKRg3hmj4N+NQZ2Xu9akMqzdRFRsKugTuXoJdTr+DR6
         wSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698897362; x=1699502162;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1v/Ude9gvcJ5JMCTl9iHk0wg/OEEvbIa674m+z/eWg=;
        b=Jm6OCVEEPJiczD6ZMRs9BhWGTuP9BXankxlIRNw4JzKMZ7y3VVUnp8gGel0T6WwNX0
         7wOcdWG8Ks5UL2WGMSWvoXVLMEWdgwLI+aBlDlpIJ6Va+aHt4bu7tyB6c7+b1W04nub0
         OpsL2nNIPh513lDzI01VjrR8UErlhjLj2pjrbl7gQQI7L8Ys3K2I07S+IjQbp7WzMJxM
         o4iXsSYdGe2FPIhy65piP2nj7WFOkG1dV7IWzD/7lB8R2O2PNbwi1VFitaOD5SobC68R
         hLOp7goByVNUDO3Z7XoEr1UHfFr+k6BF4uuz3/3HskOng0NoCiSRnT1CkAfsDBiGZ/xG
         ltLw==
X-Gm-Message-State: AOJu0YzRZi9+P1g/00SfrNsypsHQoHH55gPgIt03bBudsaAJMHKteMaS
        W94yZFAzuM4Fy/cnhuWHNqhHtwzlTvaX7toZtPgKXA==
X-Google-Smtp-Source: AGHT+IHJGgILQuPdLeNtXAnkaxO84xjn6Bg0gq2GbDRfDGXqLcsDlcwJdED6jJCWmxfqV8HGMeCSTw==
X-Received: by 2002:a05:6a20:7483:b0:16b:e46e:1246 with SMTP id p3-20020a056a20748300b0016be46e1246mr19508700pzd.30.1698897361915;
        Wed, 01 Nov 2023 20:56:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001cc52b58df6sm1995684plh.215.2023.11.01.20.56.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:56:01 -0700 (PDT)
Message-ID: <65431dd1.170a0220.bdfcc.6890@mx.google.com>
Date:   Wed, 01 Nov 2023 20:56:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-9931-g40843e684a2b
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-9931-g40843e684a2b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-99=
31-g40843e684a2b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-9931-g40843e684a2b/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-9931-g40843e684a2b
Git Commit: 40843e684a2b26bc12796da4bc8ea775e0fa95bb
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
