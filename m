Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603847B75A3
	for <lists+linux-next@lfdr.de>; Wed,  4 Oct 2023 02:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjJDAIc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Oct 2023 20:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjJDAIb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Oct 2023 20:08:31 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3509B
        for <linux-next@vger.kernel.org>; Tue,  3 Oct 2023 17:08:28 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d857c8a1d50so1610022276.3
        for <linux-next@vger.kernel.org>; Tue, 03 Oct 2023 17:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696378107; x=1696982907; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iScidWKbjqdeBvsURH6IfH/nnlmHjbkyIg3BGfwSqgM=;
        b=mgMoK1H1NB+GBdOattPUMqJx0KV2ahniEB804gaFYy/MFg4zmEIXO1i46CCjSD1HfO
         ZankPtgFVJyQdV5SWy63zxahiQy27e9wwf4ABTwDo0Ou+xADMQJbJU09Nsngi00fmwD6
         xAbr437yjqOSCaaSgPjFeSP8PIyH6zEtbadt1YvMwpuS5q8GxOhypqdaTh1kcIP4TFjY
         mzZZ+u4XP8kMdXWsdM4GNMhCJcfXc/lW/MGrz/F6gv9yP/jt8N1vQO1cqqX2bOmr5fWF
         Sz6zWHfDkwPd++lwVpbeErWVbmKGn2HJo9GVvD9ExUp1ou7rpyHviIlC6NqTMMnbkkoF
         7bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696378107; x=1696982907;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iScidWKbjqdeBvsURH6IfH/nnlmHjbkyIg3BGfwSqgM=;
        b=Rpswq9ni/xTDZjxA5NmWEc8x2vkNhV5d1+tOwaWslob7/RQEk66rWWpbzygelx27g1
         F+UC6OFJJi8VLpLvU8XOhy1sYGmIOh3AKbERr6emPt2yvWLu+bEDx5bqiLh+JljbWsyw
         uKP/j0YRMrfHUNXV6qQDRcXCn2kJvf73kEXQ/kOm0QcmptgFjeGBOK2YjCs7Ualfc4Nn
         ZBFA8PSt79HbgL4iLV9qTFj1k2A4q7ZXKwi2rl56BTKv9ixG2dXeo/+7jdrCy472mTFu
         LEIgeuaPrzVQgngZ9UvkOnMxGNeOW8SviCY/rXfNvy8VNwg6EhWSyMHjxxKTsY8VWjrl
         HLLg==
X-Gm-Message-State: AOJu0Yxy0y1JO6s/5i6WwZJGBZ6y3dq7tg8xOSdnQdYj/GXZfRgMciUz
        +K/ypbh/4xjgXnHc+AADsD557e3xywNzpjzGODYWKw==
X-Google-Smtp-Source: AGHT+IFmfCcpcpvXVboipPjtX7v+gsuKrGNCBjj8GwLA028uDQr7lHEhKlNYLM7ASQ8CIjHhdHSx2w==
X-Received: by 2002:a25:b190:0:b0:d1b:c879:5e6f with SMTP id h16-20020a25b190000000b00d1bc8795e6fmr768702ybj.23.1696378107349;
        Tue, 03 Oct 2023 17:08:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o2-20020a639a02000000b0057408a9b3a8sm1980116pge.42.2023.10.03.17.08.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:08:26 -0700 (PDT)
Message-ID: <651cacfa.630a0220.7af46.5dca@mx.google.com>
Date:   Tue, 03 Oct 2023 17:08:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc4-304-g4bafb81eae31
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc4-304-g4bafb81eae31)
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
4-304-g4bafb81eae31)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc4-304-g4bafb81eae31/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc4-304-g4bafb81eae31
Git Commit: 4bafb81eae31686d759aacc6243c8cb499496f2a
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
