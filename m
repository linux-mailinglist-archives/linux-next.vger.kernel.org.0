Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6194D78E49C
	for <lists+linux-next@lfdr.de>; Thu, 31 Aug 2023 03:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345637AbjHaBvL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Aug 2023 21:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238255AbjHaBvK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2023 21:51:10 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EBCCD6
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2023 18:51:05 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68a6f6a66e1so223605b3a.2
        for <linux-next@vger.kernel.org>; Wed, 30 Aug 2023 18:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1693446665; x=1694051465; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cRnQo7FJJmTF29gcohRdP6+QyesuXQcoZh7gHMWwJ5M=;
        b=2gTNAa7dkDgJAzjfm4Ueh5ZmkuzD5wKbIDEBMMq3Md7gsJHNJ6oWtFJbchM0z36gBF
         fOOQWoMf3ogRk/I+b0KHV82hDW2h9emO+kilemyNPhDVoApClSO5H7OHxReVHNtw7mf0
         KN2ZBdpv+axp/FtMvYg9271ONhUnvHaucFSBZJRgQ2SrlO6yhGF1WjDhvv+8yigNHufP
         HOO2bAS5uphhMghD1dmllABoLujfIfvvSefQV0rIU5YWCeCl/IRsNukBLIfrabpZxPNh
         /XRxausagmTN9Q5K33+yWANrp7UQl0BPWidIgXFp91mnWOjtdxiusbosddW/Votn2u/o
         Sv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693446665; x=1694051465;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRnQo7FJJmTF29gcohRdP6+QyesuXQcoZh7gHMWwJ5M=;
        b=Z8q4fX0U1CP2asVWnVP0/dYZzal0c2G8BFPmd9VPfYe8XmwuUbX1/KMO4zlJH+QTye
         4HTRayyl5thlKAFTiGu91ViOeSBwNK9vb+IGks14QdIUkDGRiFSU/JAIQG7Ua2+814Ug
         NqPl4ejvMY6IWIlO84FG7+/UzqfI6X+kqxn5MoyoCK4R1wggnFeR6LzM4LoLAhuN6gw3
         G732qLFNpObFjKdCQ+gOOkp4NLYkO30avVFY0Vg/w6s8bdE/3nsGHEzV/n0iBGCuyqCn
         UsbCI7BOjAGn7MxM0T9PjQDRAvrKivmjR9Dyo8kN78qyRCfhyHrj9ZknjXM9T97mn+aP
         bIlg==
X-Gm-Message-State: AOJu0Yzqh9TUXzeq1uaCAL+lQqQfUlbRum1EKCAiDCewI9aQl201TlxB
        OKHnwOOCUodtqRHlg/dRL44XZPcJ1M9suqBmUqg=
X-Google-Smtp-Source: AGHT+IG2XX1AftwoVCrHtKCyqgKQ24rfwyGH7xV6c1BsjHVtKKqhEBjnRmhSbtjI0E2YoQicst094Q==
X-Received: by 2002:a05:6a20:5483:b0:14c:fadb:4e5e with SMTP id i3-20020a056a20548300b0014cfadb4e5emr4576321pzk.5.1693446664609;
        Wed, 30 Aug 2023 18:51:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0068be3489b0dsm216621pff.172.2023.08.30.18.51.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 18:51:03 -0700 (PDT)
Message-ID: <64eff207.620a0220.b8425.07fd@mx.google.com>
Date:   Wed, 30 Aug 2023 18:51:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-7234-gcaed158a50c7a
Subject: next/pending-fixes build: 5 builds: 0 failed, 5 passed,
 4 warnings (v6.5-7234-gcaed158a50c7a)
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

next/pending-fixes build: 5 builds: 0 failed, 5 passed, 4 warnings (v6.5-72=
34-gcaed158a50c7a)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-7234-gcaed158a50c7a/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-7234-gcaed158a50c7a
Git Commit: caed158a50c7a877da046e89b8c2cbc69079ac8e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 5 unique architectures

Warnings Detected:

arc:

i386:

mips:

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

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
