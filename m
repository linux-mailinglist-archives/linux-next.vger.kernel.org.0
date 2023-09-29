Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8767B2A10
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 03:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjI2BDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Sep 2023 21:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjI2BDF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Sep 2023 21:03:05 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65663B4
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 18:03:03 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3ae2f8bf865so6625958b6e.2
        for <linux-next@vger.kernel.org>; Thu, 28 Sep 2023 18:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695949382; x=1696554182; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pMbD+OVy125rBGi0GDeffGGISIAf85/HGwV2yV0+YTs=;
        b=sVKURsKOMz7KtO5VhaXJhFF2EiZS0ykkFRfFgzxk6fdVFYQudGCrk0orOkfrzBJe84
         Ef4GmOZt9NQLf3XOjZSHizS377iYke8JjYnxQH7dXWdnHuVd8+C9/crYRS60T19Lts20
         okVzKb5KhaSSlunOlIeXBpbpqZkq//TKj75IvxaO2nRwysGXQ5qosnDrD93qfJpAyLE9
         30VK0YUNlwkkqI+eHJ4xBrJeUdR5KNMoBKnTJoI6hOqkiQsIITzGO+BBkxJZRnoOskLh
         5HHnAk+gFA3FEDXlHYXhzMj9dS6L0Qgy925/lG890rdV8DDJMhK9H/0HNIXtlhbfucuk
         BX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695949382; x=1696554182;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMbD+OVy125rBGi0GDeffGGISIAf85/HGwV2yV0+YTs=;
        b=jl9DwieGWbsplf3nSgbcK+LPi8/sWCJUy/I0xR5ZPtpzlGl/NP0Iuw5d5myLu+BRjH
         emjtMKcUR0tfNSBK0sae23z8IlrBSirdjK1huBaUA+cGey/3oJMRGtERLQWS9+wPwGA5
         znCB6w8u2Zt25DEeMWphnhrTGaOmVrvIgnSDsJDU7bikWv1aZoSeg/zhS5Hw1AbFx6B0
         naRX2U2Bb/cAbQ4zue1ws5b2PNuMTL7RkO5xpPktDxhpfaPR0jEjEOmtTuio58F2Lv3t
         IeUM88AtOvUV+DBGYpzx7WljytVrVypesCIul9Or+w1R8jI7pzHMkO+8Pb01oUZyy+PO
         qttQ==
X-Gm-Message-State: AOJu0Yzsyi1eitWLWd+8GbhASxOeZ1qLMVRZ1wQDlTd0MmHUdoU0nFS4
        tQ6fykq39lu8qv6X1+IWFH9nHxS9AKxXln4K7ECEDg==
X-Google-Smtp-Source: AGHT+IEOYR98/5MQ1K+gSovRvICz31D6kUwd29ayMCSFQbIcL1HpF/UVgwkrdTNcVk1mZHVGnLBcCQ==
X-Received: by 2002:a05:6808:1520:b0:3ae:4cb2:fb43 with SMTP id u32-20020a056808152000b003ae4cb2fb43mr3537277oiw.21.1695949382148;
        Thu, 28 Sep 2023 18:03:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x2-20020aa784c2000000b006884844dfcdsm13995432pfn.55.2023.09.28.18.03.00
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 18:03:00 -0700 (PDT)
Message-ID: <65162244.a70a0220.7394b.89a9@mx.google.com>
Date:   Thu, 28 Sep 2023 18:03:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-342-g4bd3c2b6ac51
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc3-342-g4bd3c2b6ac51)
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
3-342-g4bd3c2b6ac51)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc3-342-g4bd3c2b6ac51/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc3-342-g4bd3c2b6ac51
Git Commit: 4bd3c2b6ac5170584f2fcca0ad94cd890073b4c8
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
