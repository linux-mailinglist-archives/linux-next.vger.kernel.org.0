Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662837DD910
	for <lists+linux-next@lfdr.de>; Wed,  1 Nov 2023 00:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347258AbjJaXD1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Oct 2023 19:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347255AbjJaXD0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Oct 2023 19:03:26 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029A4E4
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 16:03:24 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-565334377d0so4917046a12.2
        for <linux-next@vger.kernel.org>; Tue, 31 Oct 2023 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698793403; x=1699398203; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U/q89Ev6m3dZ85/1jOKgaP6SgrhxpNWK+FZuOnPFi9M=;
        b=l/2NzYH1Iylp8ePgg2xgPC/gHQwp8eHYj6+YWndpi31q6DEpV3V2msER6khgu3NUZa
         LP+f9Tqt6enpPSs7/4fJ+EZmsrMLJl4HHeA6IXkQecyX/DXCp4yxjMP61D+g3fHJHk0s
         gumddbNldbiEiN/oEOriJJSff7WPwXN1oFrnMld02ulr7AZY35j4T75sKPdR5JbgTw+/
         OCmT6xbGNcbVgjS/k1uA1ilShrPDw943UyJF6IXm/2TlCZCfb5PbCwyCDFFwX+G/sp58
         +HtqQQieyOtDMjgYccMqkiIQUyaenRKN6fUVIyAFEOTFwIs4Qi2WGGP+fcuXxwU5W9FG
         FE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698793403; x=1699398203;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/q89Ev6m3dZ85/1jOKgaP6SgrhxpNWK+FZuOnPFi9M=;
        b=HloTU/kWiGH3TKFG04Ol9j4e0PNRygjQAuGF6E0ur4LLHjqry1mv91c1AmNvxwfLv4
         8TjoslwE+lVIfXJaXtRqvDrCuo5rYjLCoSVF2Wpzsjnrcq8LusZUNOgSCgnvdsJ6GDo1
         IWSl8vG6I0h53NsdZGOf6nC/1iV2lefjJtknPqr4rLYUR4D5iIMPTM7HYIP2JbHpqxUo
         PVAfqW4dcEhrqMsbQz9X9e+ZzcLWROUQUyTIQ3O3TWBPrMsaKjHS8CA/jc7qYeXWuZ1+
         p8JsPzlkpCLSuoNUsNNMADNMNiuhubYyrwV6gQ86TbLuFtKpaRE/kLjPQax/4zkwkMmw
         FTRQ==
X-Gm-Message-State: AOJu0YzbKBNmVShLURt1rWoStww2FO97z67Gep0DUhTmm6RpTsk/Ls+9
        XCgIIxQ2fReJphMb+CNFjq6lnQSXTdI5iGT8jbAhDg==
X-Google-Smtp-Source: AGHT+IFxI52aF+JOIRHH99OyB/uE4pPGf1K+JO5iDhHFr6anghrlKQyEF/ALWEkwDTUPqFMWPkA6Wg==
X-Received: by 2002:a17:90a:e642:b0:280:9074:eb36 with SMTP id ep2-20020a17090ae64200b002809074eb36mr4572573pjb.14.1698793402749;
        Tue, 31 Oct 2023 16:03:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090ad58300b0027dafa55306sm1541541pju.40.2023.10.31.16.03.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 16:03:22 -0700 (PDT)
Message-ID: <654187ba.170a0220.2085d.41ef@mx.google.com>
Date:   Tue, 31 Oct 2023 16:03:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-6725-g1201a4a5fe1e
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-6725-g1201a4a5fe1e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-67=
25-g1201a4a5fe1e)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-6725-g1201a4a5fe1e/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-6725-g1201a4a5fe1e
Git Commit: 1201a4a5fe1e49877e185144473374dff355447f
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
