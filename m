Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0A679CEAE
	for <lists+linux-next@lfdr.de>; Tue, 12 Sep 2023 12:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbjILKqL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Sep 2023 06:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbjILKpR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Sep 2023 06:45:17 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964C61735
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 03:45:12 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf6ea270b2so36878235ad.0
        for <linux-next@vger.kernel.org>; Tue, 12 Sep 2023 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1694515511; x=1695120311; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4eprgW+piFaMRsg0O/W3SI0YmddvuB23YPw4hz01kOQ=;
        b=vR5TOzRmS0mJycadRkSxtmkkPDdx6f32ghlgv6hLzaDJs5GLdbyCJy15xrLWUKgcSe
         rm+9kuvfJgTPb65tbLwL4h7bAJ5wq0lWcVIxCaGSzOfnCpnXnL0BnuxQX7uT5P5ZomwH
         1a++jgdmqw6jX/YPZqI50ceUzgGtHApBTebe1+mtOHbg2oG/DbExcQBx2B6WTq8CX0gH
         lWDgp3N5tNXw4jBELG9WtfTwgwQaJIDhdRb11gdTNO3oEEMqJdD0p6iw6wrCtjMbSp7j
         YkxLBjSy1mUvdmI6qACrV/0xD64sFl0Jx+B/oanJpZJ0VxnYRHjWcWsoQ0+RkVY4vxZP
         Gp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694515511; x=1695120311;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eprgW+piFaMRsg0O/W3SI0YmddvuB23YPw4hz01kOQ=;
        b=TtiAoQa+I/9gLv5WCkrV4R/+Wh96mS74saYqQl88D8Z37VyE1EYbRzJl0V1cpUXKPC
         fbWQyWzm424Z5YZAvt3lGaC4BjBzljsEVoFEl7c8XZR4H5CW2YJjSRNf33kN+RSrivkN
         JW7DZNaq2J658wkHb2LDKfF1dBbKvE7LcqmE3PZg22kebROxI7kmsIokHdmSNYDByGoS
         JRMDxUlup4rYRJvaDuHzX7xKjKpTKaR1o5fNjopBzXaMjYq6qaWx6X9K4rx7tBhEIQSi
         0dHvFG2M49BePOZHHhb97zNj0IuGELU+gUnKnKBax2r3AFr65Ytd8Cnf2iNuwftyUWKy
         t26Q==
X-Gm-Message-State: AOJu0Yz+Jds9ayCH8ytnI2mqTiSP1AvUCjutuMrlbW/HkSbv4HuQPdKS
        YBju17pyRk0/ftaHa7MiZPgGT3Oif8/FpJVreVc=
X-Google-Smtp-Source: AGHT+IGO/xBkFf/7H0x5EM+775sPgmCueKTm9GWuaU/UAsQi5/KmIdJE3DdhOtvUBMGd8JqdvYMzdQ==
X-Received: by 2002:a17:902:8c8d:b0:1b6:649b:92cc with SMTP id t13-20020a1709028c8d00b001b6649b92ccmr8378634plo.69.1694515511407;
        Tue, 12 Sep 2023 03:45:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001b8b73da7b1sm7494312pll.227.2023.09.12.03.45.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:45:10 -0700 (PDT)
Message-ID: <65004136.170a0220.4bb3f.34fe@mx.google.com>
Date:   Tue, 12 Sep 2023 03:45:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc1-139-gf73758af4eb4
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc1-139-gf73758af4eb4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
1-139-gf73758af4eb4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc1-139-gf73758af4eb4/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc1-139-gf73758af4eb4
Git Commit: f73758af4eb4e17b2a02b7c63f0bdc31e9e5db7c
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
