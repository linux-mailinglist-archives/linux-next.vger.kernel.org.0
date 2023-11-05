Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D25C7E17CF
	for <lists+linux-next@lfdr.de>; Mon,  6 Nov 2023 00:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjKEXKK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Nov 2023 18:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjKEXKJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Nov 2023 18:10:09 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9960E0
        for <linux-next@vger.kernel.org>; Sun,  5 Nov 2023 15:10:06 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-27d0e3d823fso2783601a91.1
        for <linux-next@vger.kernel.org>; Sun, 05 Nov 2023 15:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699225806; x=1699830606; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1w0EzvwOE348Am/eNkydlBV704zJ++mSKr6vyYbLru8=;
        b=j/MuN0qUjfMYCK+TEIfupc5TzyWwTXy3zvrFzI40q4uf9A90xHl3q3/3Js8TWK6Ayy
         k8u44YxdL3TBpLhUbiT7+RGPcFYHPZGANSW/6bq2z6iE9U1YRRHe1Z1ddB3PwhwcvuTS
         vI0HY2Tr3OYVTbDt7ldW9RSxdM3OqUm8ObTp/GE/aHcYYWRb9NQeWCqe/HkqbF63Ae5u
         AaZxzlgmxnIOrwCdnDbBap69KJoZAWPQnErWd67Yhnuc78yFYaGN8rUabv0JuP70ayRt
         vH1HdUTjLLrdfZMZTAJP8tldEHf6b6JsbRnsiU7GbYji+L6aZ3122+LO4ZyNXZ+IMN4+
         iBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699225806; x=1699830606;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w0EzvwOE348Am/eNkydlBV704zJ++mSKr6vyYbLru8=;
        b=n7wB5g9bvsHqcRxHXlL2ekLlZ6Ew0mfr+okK1qUOE6Hb2+aMmVsNgNYvIixI8T91sb
         1+SANPechn6DlJw7zW/mu7Lsf9HsgLwZv8pUrqOXsxLZ6HuTri2q5QjpXcj4cG09qXA0
         7D9j7D5TvJaUMEKUV4Pjoeep47dMs1wXKDarJMmBFsjznIsI+2iQo4ENrXo0bmcg0eqc
         +nkJCgfF2ohWrAwOwtYRPlWOWfNl3dWuUU+XsoC235QZf3yFz23EvRC0eOih1Y0MrAN2
         6kv130eX9zd8jp+kv4nF4ABaaPV4fom7BDL0+uWtuz/3sbI/a60AIxnWpu67duGJVi1X
         HIbw==
X-Gm-Message-State: AOJu0Yy02/Pmt7WMeobkufhRJCr0x+86Z6EyW+ElZuHT04Lca7YrodoS
        RbYhT/jk0IjYNRzLeXQfb+ffKMCeH9MKf48qp0/5Sw==
X-Google-Smtp-Source: AGHT+IEC6tWvlcMwVLLpS2aRxeK9YpiN1iLBnEoz9P8prI0p4Ciek+A9hAMhNbpWp9GrRzYxkTFvtQ==
X-Received: by 2002:a17:90b:947:b0:27e:3ae3:eae0 with SMTP id dw7-20020a17090b094700b0027e3ae3eae0mr21720877pjb.16.1699225805623;
        Sun, 05 Nov 2023 15:10:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q22-20020a17090ad39600b0027d06ddc06bsm4435429pju.33.2023.11.05.15.10.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 15:10:04 -0800 (PST)
Message-ID: <654820cc.170a0220.83e36.9cb5@mx.google.com>
Date:   Sun, 05 Nov 2023 15:10:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-14721-gb9892b3a09980
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-14721-gb9892b3a09980)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-14=
721-gb9892b3a09980)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-14721-gb9892b3a09980/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-14721-gb9892b3a09980
Git Commit: b9892b3a09980b1b785541463ff6948360afdcde
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
