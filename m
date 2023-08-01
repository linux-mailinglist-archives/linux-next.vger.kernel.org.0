Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EB976A564
	for <lists+linux-next@lfdr.de>; Tue,  1 Aug 2023 02:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjHAATR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 20:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjHAATQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 20:19:16 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9A7133
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 17:19:15 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-563c7aabf38so4090531a12.0
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 17:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690849155; x=1691453955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TQUu8MQSgUoaNsjoiL7UL9Z5npiwBENwn7Bm9velPdM=;
        b=MhgYp/U77qIGM89gU5EKxOmBqnrLj8SLPBPF/809tXHMfGQscZTT8Ay35CQdgzR8r7
         4DbfVFbc5u9yMvdOfNvEstrfIem90UQd+B+qBK2K9Q+tbbAAEmZdOwwmwhOiTvwnq0WU
         vO7lfn0cT6x8ygT0OiZUAFQUTwjZz/pMcMohMDATQNe/GmlARtLrFWQfGFAZUY3WaqJo
         m+Xc74YCxSNHWuJyQDyski+9QbeIr+gvs5yO+nymFHK2j3MJQXVoJqM3sUcJVMIFqT3Y
         W6Gc+vBo0w9kHUSC4Iw8rOOdSUfJH0s0bvLUh6sT/RSsGwHD3KhzXIuHe2KfFL3ezg0P
         ayTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849155; x=1691453955;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQUu8MQSgUoaNsjoiL7UL9Z5npiwBENwn7Bm9velPdM=;
        b=adDE0jCf//O/SJkVWn+lQMUY4/vQ8yPzIueo9M3TWcTfZ/inaZRnXpQPhU9efEiy1r
         EkLSK+ebtw90Nz6yCK9QAF1C9CHi+FpQCB++XlIOVvdgE54IJw9KxFxMKR4VQeY6gIPy
         g1GlihPJdUn10JEOWbmbKTjHaq/a5OzUfGQtu3BXnj6n91N07UUfbEZ6pXYu5ZqEDETj
         BqM2lcuAR5sDOHQclrfCq623bqpIwOnP1srCafsUzSsGwoq4tgThIPyuwHj4plmVSNaO
         w9Nh6Oye9Ult8temxlgXpGjoR0RscGyXkSFJacjgEBSDV1cmBINWC6cReAMUUp/pNhjF
         8Xaw==
X-Gm-Message-State: ABy/qLY04cXs8pEmo1ArTGOVDF5+zs7AVJRp9gi1ZHQNs3/ilwpshroO
        47d9CBwKdl48iQE1TJ0PCo3y1kMFFK8jhJ2P8/X+Fg==
X-Google-Smtp-Source: APBJJlEzZuO3XItO8PuRB2MOJVC6y/TZM3tHBASrOZRHR7SwQycdKp5wFZVUQdepAic2sBdZqnMCMg==
X-Received: by 2002:a17:90b:4f47:b0:267:f8f3:6584 with SMTP id pj7-20020a17090b4f4700b00267f8f36584mr13636087pjb.6.1690849154659;
        Mon, 31 Jul 2023 17:19:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b001b89c313185sm9140635plx.205.2023.07.31.17.19.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 17:19:13 -0700 (PDT)
Message-ID: <64c84f81.170a0220.bfa49.14e3@mx.google.com>
Date:   Mon, 31 Jul 2023 17:19:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc4-220-gd08ef24947110
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 7 builds: 0 failed, 7 passed,
 4 warnings (v6.5-rc4-220-gd08ef24947110)
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

next/pending-fixes build: 7 builds: 0 failed, 7 passed, 4 warnings (v6.5-rc=
4-220-gd08ef24947110)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc4-220-gd08ef24947110/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc4-220-gd08ef24947110
Git Commit: d08ef24947110c3528df7902eed86276d39c6eb1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:

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
