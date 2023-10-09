Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C177BEBC4
	for <lists+linux-next@lfdr.de>; Mon,  9 Oct 2023 22:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377937AbjJIUkR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Oct 2023 16:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377918AbjJIUkQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2023 16:40:16 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88F79E
        for <linux-next@vger.kernel.org>; Mon,  9 Oct 2023 13:40:15 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9b1e3a809so399905ad.2
        for <linux-next@vger.kernel.org>; Mon, 09 Oct 2023 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696884015; x=1697488815; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RvQVARytOZzXz0AVoTgt2SvbDHKrXYmj81+p/vh1j7A=;
        b=lPEX71cGRZxbao8/mK3btAWlOGXSFbKV+PFtI/mUQtBHBkJcUpgpx6w+zWbQJ880kD
         +6Eo0FG6t4tGj6RyvHI+95NBb3Xd7H7SIep0BV8hnl+y7/seCDBV+a+xA0NQqAAZnlJL
         2sq7JISeGS3qsoK9AZlJOZ4+z4moyOAfd9TTXVZ7gUJKdBfSgVAIR+Q94MPvfVsjiypP
         cv6Rux5DmMPahuCeGOyfhHSravI64oH2gji6C3Rk0aEAEMzi8OegT0P4BtJ4cAiTmYi2
         9GKge/3WZ45K9LSj8EaS+BX3uYdFGod44zEOF9zqihUaP8nbcZdhNSCXisxHqpb9Ruth
         ZfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696884015; x=1697488815;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvQVARytOZzXz0AVoTgt2SvbDHKrXYmj81+p/vh1j7A=;
        b=ksoZPl38a68ZzTUQC12viaqhJhSe+Z9f1J0Ww5XC3wdxNX/y/czkGiGbwH44IV5f0d
         IXGaK6spHjZvIC9EVxmDvCq7AoZTaapbIEOLJ6IO3jV5ZZ+112r6AeW3NOGHveVPbHB6
         AGYtHUA2lqOzrNAzhreJ/dZNNS2zt5PHFnHKAmx9hCd3N9g8fz5+mBwI1rOpjJkD9562
         qnG1bqhkx3qZ90hn8o5Ai3xu0rtFs+8JhFcJHqAIFgyxIuoPtQ7HJT+WSK4Bww5YMNzb
         4b39Z3tIBFfEz3QkER3IMNl6l6WGug4Qek2YWwhXqIjUoR8q8BhPX6bNQ5QRJS4QAuJq
         bmbQ==
X-Gm-Message-State: AOJu0Yz/QThWzdbbWHir6ZRzr8jXJb17Y4M6K916MetU+lsme8eQT+zN
        tSdNGY+EoGembwPC6Slq0VwPtwbvKGwhcxolLCuHXA==
X-Google-Smtp-Source: AGHT+IFXmuUolibh3a4EObKlZYA0yc65TqhBb8JkPiVLIVF22GrUBYFk0ta+RTKpbIc7n/e7wck31A==
X-Received: by 2002:a17:903:1ca:b0:1c6:1a26:ef56 with SMTP id e10-20020a17090301ca00b001c61a26ef56mr17998667plh.48.1696884014669;
        Mon, 09 Oct 2023 13:40:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm10114519plb.7.2023.10.09.13.40.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:40:14 -0700 (PDT)
Message-ID: <6524652e.170a0220.46702.ad36@mx.google.com>
Date:   Mon, 09 Oct 2023 13:40:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-240-g35a9dc47bcc8
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc5-240-g35a9dc47bcc8)
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
5-240-g35a9dc47bcc8)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc5-240-g35a9dc47bcc8/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc5-240-g35a9dc47bcc8
Git Commit: 35a9dc47bcc822953d70a503ab9fb581d724b58e
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
