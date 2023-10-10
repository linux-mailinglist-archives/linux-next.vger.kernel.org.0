Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA057BF235
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 07:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346584AbjJJFag (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 01:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346354AbjJJFag (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 01:30:36 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376DBA3
        for <linux-next@vger.kernel.org>; Mon,  9 Oct 2023 22:30:34 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c434c33ec0so31860865ad.3
        for <linux-next@vger.kernel.org>; Mon, 09 Oct 2023 22:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696915833; x=1697520633; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nxcXO73vuZ3ikQhuafSWCdB4Y+ODrq2g2KGs9dgCm1Q=;
        b=GpL5cdnNYnzsF2qNHw9jLHpma8jC/N60X7W8FS+R9vKCDcuo2V9tvyNpJ9fQSVaBMX
         ReAPAcLSc2/HnBik+tNaHnDQroMwr3nrfjJpMoa5yW4oHLbfTg56rrp+/XrZjGl1Nk7V
         m3mtUYwST4Nq47LKXmIt0jndo5x7dIqhIRcSMnZ6QkCBjSZmkA5wDdG4f/puyQsYhFdy
         s0KIfkKHmUm0XLPtvqwN45j/mg4I1WiLJD4AnIH68xWkhl+qGY3gvondgRaDRTZJkw9M
         nURNfQnEB+fFCMNUWvlpMVx3YS2GkbvnYrGkV3YtxzOT/5hnvihZpnhID2Hh6cweKCnI
         a67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696915833; x=1697520633;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxcXO73vuZ3ikQhuafSWCdB4Y+ODrq2g2KGs9dgCm1Q=;
        b=pRcOH7pZ1QXBNuSQcFvrPlVxYnClw+dVKGGlZny+SlgvrulHSK23iHS2C4FA10qc+R
         uh1EyhaW9PGeJ7KWGgmPT6+BG/1NXLjKselkOzXSpeCRlebyEi0sTynxQPVjzifd38/i
         0omGPVTqZGLVM4ayxOdd/whC9D/tpqdfX0XU5Zi5v6kDXX7G/Yz/6WzsA1pJTWeARw8V
         CMdSidPiA6ywhgAq+MXqHmIoIZDAw8HqnaidtfVA4O3gJW1//T+9RSZV/MqVaE5u7khK
         h6Tw6WN1yU+i9A1OI9wpjLOFXHvQMVuGEF1ekD9dW9bbNAox7iBs9wpZxSzta5mpy5Yb
         hMrg==
X-Gm-Message-State: AOJu0YxVc6sItX8ynwZzTT0MZWmoMBxHBeUCJIJ2UXe6j5JKpERgrcO/
        Ch2k/gQ0WzyE+ZkbD9Tsl5LwPMIpAVW3FhTMSWaLCw==
X-Google-Smtp-Source: AGHT+IGy8USLTJq3e995cnuU4ETyTBj5oevxhQu42Or2VVeENRLqkdrzULW1wO4hlIugJDnP3OeeDQ==
X-Received: by 2002:a17:902:6bc1:b0:1c3:6e38:3943 with SMTP id m1-20020a1709026bc100b001c36e383943mr12799892plt.56.1696915832987;
        Mon, 09 Oct 2023 22:30:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902bd0500b001b9e86e05b7sm10612067pls.0.2023.10.09.22.30.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 22:30:32 -0700 (PDT)
Message-ID: <6524e178.170a0220.8acf8.c99f@mx.google.com>
Date:   Mon, 09 Oct 2023 22:30:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-269-g00b249acca70
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc5-269-g00b249acca70)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
5-269-g00b249acca70)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc5-269-g00b249acca70/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc5-269-g00b249acca70
Git Commit: 00b249acca70baaa39f56e37f5d5ed5da9bc550f
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
