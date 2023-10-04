Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38937B987D
	for <lists+linux-next@lfdr.de>; Thu,  5 Oct 2023 01:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbjJDXAm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Oct 2023 19:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbjJDXAl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Oct 2023 19:00:41 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C553EDD
        for <linux-next@vger.kernel.org>; Wed,  4 Oct 2023 16:00:35 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso306095b3a.0
        for <linux-next@vger.kernel.org>; Wed, 04 Oct 2023 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696460435; x=1697065235; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ewlzbL45g7O1sNuqGdqKQiijyX2vlG4ScVmgkD3nXm8=;
        b=VChF9FchKiVRtYwUNyqr2RYBoGVR56i1nVKYY80anc0Y6VDP17rrd62Je4bn0Pv4ni
         68gxXRA71GeYt/WtyV6hROo8C2qku3JruF3f5Nmdxp+Gv2J23i64SZYeeF8X0MypDZqe
         Qxb8T8ZIx4ufrqrD1sDvZNGN+sO0mASvM1ttI8XZCkPujua0V6N4HHbFC3FsGGLWRe9i
         /3AYx4pKXhLm81gw2yXL1+El7ZmwfjbrTicbwLad+VEzKoFZPiNYEnEPbFxXyMQ0//8k
         L47m3Je70FLpLV3eNQgzBwx2I80Vjdg2ZmqFfhf5DPedEXF8SCP+Cx0Rc494QJwdkFby
         EIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696460435; x=1697065235;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewlzbL45g7O1sNuqGdqKQiijyX2vlG4ScVmgkD3nXm8=;
        b=GmlgiOhvSkTbA2rDB+/f2aJwMSUvABJoVgwrbdIF9j8YlagYvwjTVhs0u01IX3znUl
         BrDgR1z9IehOGtE/0aTAqM3sOL6Lh4R8t8uZMIZrb8LIEqELSLPfOW+Tig+gPfOHvHx+
         vAfdP0zWqAL5yXwue+0k7+tvG3uHqN7pX/YvZaLAbcb1aDkizpepDzoYYxMIl5tg5vT7
         Xd1jCwlw5E+JeqPJ3gTAnA/7Yyih+OyJdFpzGyhogRNCyQ5cWiggPU7swjN+ybsZT/r7
         HvJDqOy0e3NuPSbXqY9xsybc9wDBNgseFlXglgj92i2kc1jdiYvViFwnZkwWh+WNTSvj
         NxsQ==
X-Gm-Message-State: AOJu0Yw4qEfdJbcwmolvYBa3y/BKRJaVsYDe04qx/qpiOZhfz+5xr9T/
        VL+2UjTYMzTn3BI4LN9QgBfMfpFj1lPhXmWae1wTBQ==
X-Google-Smtp-Source: AGHT+IG9LDI+fioa56WBI9JoB07FccVWc5+U7subviXilG+WJhBUzztP3rdTg6JEE5BXZnLDKYK+AQ==
X-Received: by 2002:a05:6a00:4197:b0:690:9a5a:e34e with SMTP id ca23-20020a056a00419700b006909a5ae34emr1413273pfb.12.1696460434633;
        Wed, 04 Oct 2023 16:00:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l2-20020a62be02000000b006875df4773fsm41700pff.163.2023.10.04.16.00.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 16:00:33 -0700 (PDT)
Message-ID: <651dee91.620a0220.e4902.04fe@mx.google.com>
Date:   Wed, 04 Oct 2023 16:00:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-348-g4d6ee1bd3e382
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc4-348-g4d6ee1bd3e382)
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
4-348-g4d6ee1bd3e382)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc4-348-g4d6ee1bd3e382/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc4-348-g4d6ee1bd3e382
Git Commit: 4d6ee1bd3e3820b523d43349cbcae230fdfcb613
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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
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
