Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB7278A411
	for <lists+linux-next@lfdr.de>; Mon, 28 Aug 2023 03:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjH1B5A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Aug 2023 21:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjH1B4a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Aug 2023 21:56:30 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F5E123
        for <linux-next@vger.kernel.org>; Sun, 27 Aug 2023 18:56:27 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-68c0d886ea0so1703811b3a.2
        for <linux-next@vger.kernel.org>; Sun, 27 Aug 2023 18:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1693187786; x=1693792586;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PpFoyBN0L91JY6ijzSmYVRWmfEcFJn0tE/+3wloyX3A=;
        b=ykmMAi2eAH8KuNDTRJYUlQLleWw+KX6kE296pWX7ALyiFKZkoLe7hxtjrpIi380Myl
         Hpfz/UftglfOWc/g7Zr81Y/FMl6RhMO0r/jKPmfQSlzc/Arf4OE1cfr/XbKs3n0J+xBr
         F9aoDGYcITXOlCeqS+GhbCJUttm3wS9U/sJjgTjH/apmcQsqjdozlWR06RJNx8HHxOE4
         7VkkatcH0tJqKSGdH+Xnj6ftPQu6ItMYfEEQOdTItvEdlLfavET7gyNQMcB6aiOF7kS+
         rHuM9XbeX6aeOs0E7FMx6M//83pKMHNplqoMx/Awo7Jr8FS6/W3tP+A/w7sFwbecQPnD
         jscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693187786; x=1693792586;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpFoyBN0L91JY6ijzSmYVRWmfEcFJn0tE/+3wloyX3A=;
        b=NyOOd4B7txJge4I5Q3hufOawmdQrU8mWrGW7g48wdv6zaSCA4yGmunYUrbC2UE3Up1
         KVTj+/P9eLK9+ttRnZS1Uy9gV47AmFr/EkFutU6v89HSx8iMLAlQ84UUTQb7flX/rg6r
         tA1hzY9w7ohkOPIILubfWDrEvvRVlj6NEmRtV+lf3IIWUWeBm1CO+qmOvhQocnMxZV5R
         EywJ1YDbgazwkRgbAz3WVMB5KQ0mbKo5/V3xWB3rVt7saEnuEto0K46cBbiQcS7kJYcK
         UOeD04PRztwuyAQMpbCpxZeEXxq67ypzyuZKG3Kib1Ns4wUG6cYJnVp+gb8c5HmMocU6
         UAkQ==
X-Gm-Message-State: AOJu0YyxkRK7mWDsr3vi1ToNwiigqxWV2W73H0jRZnPie8c40/dOGKgA
        nVvAakESraBv+y0SP2xPp11v3sVrdl6vdXeYqkM=
X-Google-Smtp-Source: AGHT+IGCvzW0Yr5mtsl36PN2BTYnniVYpqC/F5AQhgbBuHW9ekVENcjkIslTaPO6W09M++d7z08/VA==
X-Received: by 2002:a05:6a20:160b:b0:143:f4dd:dfae with SMTP id l11-20020a056a20160b00b00143f4dddfaemr30869346pzj.43.1693187786328;
        Sun, 27 Aug 2023 18:56:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x53-20020a056a000bf500b00689f8dc26c2sm5477711pfu.133.2023.08.27.18.56.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 18:56:25 -0700 (PDT)
Message-ID: <64ebfec9.050a0220.873b4.8403@mx.google.com>
Date:   Sun, 27 Aug 2023 18:56:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-85-g63006762d709
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-85-g63006762d709)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-85=
-g63006762d709)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-85-g63006762d709/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-85-g63006762d709
Git Commit: 63006762d7091f6f1a878f8198b96d4f6d6b4f70
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
