Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2EF79803C
	for <lists+linux-next@lfdr.de>; Fri,  8 Sep 2023 03:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbjIHBgT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Sep 2023 21:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235744AbjIHBgT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Sep 2023 21:36:19 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AB819BD
        for <linux-next@vger.kernel.org>; Thu,  7 Sep 2023 18:36:14 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6c09d760cb9so1114271a34.2
        for <linux-next@vger.kernel.org>; Thu, 07 Sep 2023 18:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694136974; x=1694741774; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZnEVm+zH2R1aI5HJ+Iu3IWHWponfaAAbar6gH+pNpw=;
        b=pgxg45H3WXQVWnGzA+u/X9rRYzIV+fzlRggQTcav04cpKP/s+2ueI9awJSVcPLUHnm
         sSxcTrhddJ7rxeq5AyZOUWW8L8qX4/m6udh08bgaT0wV+HGk7UwS1j1efRxt45pY7T9l
         JXfI0fW50isoWUmQArA5hV/9++HhhzLd8qPmb9gNgVWd3ykwmOnAL184HxEukpObh8/a
         5TrYE8l3wRw/j3E3+KCZr2EopijOiiLjgwsOvTm/P9k4yH0Zs1z72AiXyUpQ62q3FAxc
         n21EC8TDJhfi1UVbrsKfmbf6twjMPlVjvNmE1kJdW5+4RtyOB3g/kzpmg83CIimVWp2N
         MKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694136974; x=1694741774;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZnEVm+zH2R1aI5HJ+Iu3IWHWponfaAAbar6gH+pNpw=;
        b=hmksbT3O5cUGn21aywDOp7Zvr2DSHBZBLONXfVyLqVf2vupX9bhridePtaifVwC/bn
         7gkhERQNxuXQW3xrsoJrOVTD6dA7dcPL0CsdCZIOrxAZ5KOeSLlzW4bqdRzLpM5ESJxW
         9eyACaM3N09mQIrzdOJINfNcmAZgOl0XyqunRh4hONb5YKJb39QvNrFDk+nA7UlLeABc
         eBan+NrfwIjT3uw+2se0zaY0w//nDBH/WSMUMO22fAxVweTzCti/CuS/cHquKRpj6zJU
         fNzHxwMRGDZChtJWtJADVf9frqBP2Y+aJW/k3ImDhQLP6rUAAmXrRUXleP8A1KgeySzC
         QXNA==
X-Gm-Message-State: AOJu0YxHUM5w4g91lampDuCCAE1cKOknJeSGQaXCXXNASQpFd96J5qxx
        u/1f13vdf3GNdjwQIGATwY7K9mPxyiCTJQ1iX4mBlA==
X-Google-Smtp-Source: AGHT+IGs8wm4+whFJcEUrz+AbVLvuq/cgIpbQw58t936JQ8EpOIZPuB2RfUUtKJBz7m2Oy2tN33d0w==
X-Received: by 2002:a05:6358:342a:b0:133:b33:3b9a with SMTP id h42-20020a056358342a00b001330b333b9amr994298rwd.3.1694136973710;
        Thu, 07 Sep 2023 18:36:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x22-20020aa79196000000b0068bc014f352sm308681pfa.7.2023.09.07.18.36.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 18:36:12 -0700 (PDT)
Message-ID: <64fa7a8c.a70a0220.391f4.12bb@mx.google.com>
Date:   Thu, 07 Sep 2023 18:36:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-12940-g9fc05fa98a11
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-12940-g9fc05fa98a11)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-12=
940-g9fc05fa98a11)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-12940-g9fc05fa98a11/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-12940-g9fc05fa98a11
Git Commit: 9fc05fa98a113fe105271eacfb97c33027fcd4a3
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
