Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45BF374E2B6
	for <lists+linux-next@lfdr.de>; Tue, 11 Jul 2023 02:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjGKAnk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Jul 2023 20:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGKAnj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Jul 2023 20:43:39 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1CFA0
        for <linux-next@vger.kernel.org>; Mon, 10 Jul 2023 17:43:38 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55ba5fae2e6so3772055a12.0
        for <linux-next@vger.kernel.org>; Mon, 10 Jul 2023 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689036218; x=1691628218;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q2VAu5GA/YY/umUNVqOBIKpbaCNgpXgN80bzLqIEsUk=;
        b=Hyh8usO90XpJni/2k8CZjrzmbJL8swkOKvWvfHlT++SpA2nvi+trUb6iM0ywaKRyCk
         zzl9BOqVuX7kJ0Q1WOG3IW+v3//Hee0NEme1ylxyPdWJJDaipbbXjVEUEFO0RvmTwv+A
         El5QjPuLuMRk4HnsuA4Acv6f0BgDc8bBlWsoG1puueWqms82UQjaWY0AhSloDH9ZnMfP
         kqUaXFTxJ3atFez9828L1OU2pEawWPXXUWEPXEXL5ZOemwgVrvfEfXo/79Y5q9ItY8AN
         sYch1qqFRykYf7ORhzJOGEC06Xxv8MeNI/+sVdE4tUEjfxXpj+Jha3mf/uuw4UVvzyCC
         PTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689036218; x=1691628218;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2VAu5GA/YY/umUNVqOBIKpbaCNgpXgN80bzLqIEsUk=;
        b=FsjyUcfl5Fyv13epnp0cgjUnJFMb7s+c+wkMfHQ7v7wlqWhlzM3LZOR3+QFEZbIMXZ
         TistBnfSQdcQtn00HBrjWtGmw75j5XP3QSCPP0NEM1PS2PnMnxBDJCDhoYnQ3mJsToXP
         td7GAk41XV1kN0SJR+z6AtbbbIVoiE8GPQYO1SIOhMXmHlITAYr9mhcyguR3Gyeo9QIB
         oY0LFZi9DYzrDt0hnbBAAgLj8GJguv6zcTPmjElu3PQIz1VST0Exe6huokEjMLbBiPa3
         sHkBpTzAFtVa4ExnLSdvbPxJDq4zV/I048XURdUfhkWAEZPdd8Z2mC2vb0ma+wVOhwO9
         vDtA==
X-Gm-Message-State: ABy/qLaYN/SWfbkbCo9tCbl5jO6ETTDk/z+pSypCNlubBg6JZHmmtv1O
        57ecPXZc0bf1Yw8h/rKwvDcYZxKhTpocdJY0FFLBDg==
X-Google-Smtp-Source: APBJJlGLSJ59tTABb7kbey8SdRrVqw1USrTuX9/+wvyn8wyWU83duOl9Qe0FAGNQwAEHbweOks8UFw==
X-Received: by 2002:a05:6a20:a11a:b0:11f:c1a1:8c with SMTP id q26-20020a056a20a11a00b0011fc1a1008cmr18420734pzk.54.1689036217788;
        Mon, 10 Jul 2023 17:43:37 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p1-20020aa78601000000b00668652b020bsm373903pfn.105.2023.07.10.17.43.36
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 17:43:37 -0700 (PDT)
Message-ID: <64aca5b9.a70a0220.ac5e4.1917@mx.google.com>
Date:   Mon, 10 Jul 2023 17:43:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.5-rc1-172-g920076ec8e23
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 5 builds: 0 failed, 5 passed,
 4 warnings (v6.5-rc1-172-g920076ec8e23)
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

next/pending-fixes build: 5 builds: 0 failed, 5 passed, 4 warnings (v6.5-rc=
1-172-g920076ec8e23)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc1-172-g920076ec8e23/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc1-172-g920076ec8e23
Git Commit: 920076ec8e23cfc65583baab127a8cb151bb908e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Warnings Detected:

arc:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings


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
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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

---
For more info write to <info@kernelci.org>
