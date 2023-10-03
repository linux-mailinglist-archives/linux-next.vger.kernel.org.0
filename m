Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09C37B5DF0
	for <lists+linux-next@lfdr.de>; Tue,  3 Oct 2023 02:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjJCABx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Oct 2023 20:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237295AbjJCABw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Oct 2023 20:01:52 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F3CD7
        for <linux-next@vger.kernel.org>; Mon,  2 Oct 2023 17:01:48 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35135b79b6aso1197385ab.0
        for <linux-next@vger.kernel.org>; Mon, 02 Oct 2023 17:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696291307; x=1696896107; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FpZJ4jG228HhqsgeOr649mN6f50bmsnMKekSaM2MHAg=;
        b=XLBiljV8hQO3dZXu7Q9NDI4K04GsFa3A7PyOtWiuyI0032ckRSQOyiaXOTOxQMfkt6
         0eyOcXl8iCwvtJ2/f2Qt90U++qo4BnmTruJu1rdbn3L+iR20v7kLUUSRa2aPYGfk1Kmn
         CjjBpdHHCxf2xlsSGJSUGx34QV7TSUKC/lFaSpGwo2QE4XbQEcXRpLjIRIQncNVVvXxd
         8gW9zrjKzcsKAKBKlNSheUXGO7MwKiBm88PYGSGn5hGD6+YeDllQfLJnPSp3+ZIfyFfp
         mqxkaO8IizSCyQj+Z6tWy97Wg/3aHjCoz3G+PwcJt8aUddiGvKNHYCVRwTBGbotfYUjo
         +t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291307; x=1696896107;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpZJ4jG228HhqsgeOr649mN6f50bmsnMKekSaM2MHAg=;
        b=W7MVGWT7kSye/bGwkSPe8Y1CCjftuYoYc9I4oyoRXPTF38ZMlRXC6dlQFNzFE2xjg/
         AwtCdkZqHrhRIXp15pVHuxmZmFFQOukNvu/UcHBwYAOJvzuyeayeoCLrkkKjQboInmFQ
         p5N+TECc8modHdEYPC5X0cfnnFu4uimRYJWVy8hSBiU1d2OJecciisgubrlwxhFEC4m8
         F8kEvINNnMkI2knuK1kUSD/7NVz5HuVism1sNG8E0Wp055qRD8xf0TI71a2QJRShXvTR
         RHT7UFH5F4wrcTRJIf3PGMKouKEz9W9dMcCJ0y/mU/DUwZRUsd7BkO0NPtKKDOYR4fmd
         Nc+A==
X-Gm-Message-State: AOJu0YxA1XfmivuISqns6Oc1RV1FO8Evn8sIeVPWftWrh8FRXzSI+BmV
        gk0GlNXevKUBffY5crImJbU6SpHMEiuTKMWBd9dBSQ==
X-Google-Smtp-Source: AGHT+IGywEUhNzUqJOuUUYdDfZf/UAgEJ/4y4oWuq1V0ZfqUoBspq3U/PGqeEuG2MvCKXIbDmt4v/w==
X-Received: by 2002:a05:6e02:ef0:b0:34c:abcb:97e8 with SMTP id j16-20020a056e020ef000b0034cabcb97e8mr11859254ilk.24.1696291307511;
        Mon, 02 Oct 2023 17:01:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s1-20020a639e01000000b0057ab7d42a4dsm28292pgd.86.2023.10.02.17.01.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:01:46 -0700 (PDT)
Message-ID: <651b59ea.630a0220.5f3d4.01de@mx.google.com>
Date:   Mon, 02 Oct 2023 17:01:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-285-g5819084cf40c
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc4-285-g5819084cf40c)
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
4-285-g5819084cf40c)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc4-285-g5819084cf40c/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc4-285-g5819084cf40c
Git Commit: 5819084cf40c51313a953b510b9d5cdc3fb064b6
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
