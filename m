Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3284A7DFE39
	for <lists+linux-next@lfdr.de>; Fri,  3 Nov 2023 04:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjKCDHU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Nov 2023 23:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjKCDHT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2023 23:07:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58B01A3
        for <linux-next@vger.kernel.org>; Thu,  2 Nov 2023 20:07:13 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28014fed9efso1563636a91.0
        for <linux-next@vger.kernel.org>; Thu, 02 Nov 2023 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698980833; x=1699585633; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TRGQjG4XmI/Etkvi/fDOFvc23qxL7Qrwm8Z5mVvzNDI=;
        b=n77QQKy60ftjfkjk0Fot0nn5LnS2XHJf+JMI9E+lIZM3N3BEmqMnm5f/Vm5iGdr7pN
         fx6NIPzptYmhL+auU83kufJdd0SfoNKB/gUaak7PELBIS8ZSsfT9vZHdTIyznYo7I0oD
         GkFxq1h5KFEhUpiXgn+MoBRBwRzVhdDks9Ql8wZ8QtgcIvLNAXf0V3+mOYGV8+bB+BHb
         qp7phUzduA9XoxertWzLUIcZ7fmsuyWooWTIe9TG1vfv0hl9lEP4U0d5CXsuA8c4KIYS
         b9qWwXO0BxnelN18z9sDPdJXV52EwFsCZ+YDmcs0aeiW6hUf2vg67PivZ0+bhgizlfzp
         cSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698980833; x=1699585633;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRGQjG4XmI/Etkvi/fDOFvc23qxL7Qrwm8Z5mVvzNDI=;
        b=JBtC7jTR0Igoorf6oHclWuR9YnI/7tDdKJJ+7wa1O84ICPeYuDRH0uzOQnXrtZODxD
         +t1NO+C20DbF0keiNcYQrFgmVeuc+/OcA048C9kHFSPfmOtOyoLSUKJHveq/Xg36nEJi
         gPT9dngZmj5X6RSqVgRptDnuOlENVHqym6zY0JGlOD/Lsfm8+iKJ/2mi6APeVQbr8I3V
         9VOoIGZH7b/Pt2ae/lp12UiBWfOJgsG96sKA3Lddi6f5N/pUVknjBRyQ4gALNUHXbhvm
         kR4feyopuRcmgDLD4EGadNiZRU/sDVEYYzrEyOTcb+uKU+5N5ZIWM5Wm+BW1TfxSJS7U
         JhJg==
X-Gm-Message-State: AOJu0YzJhbP4Xl3hKGG/S54oaahjdDrqPtsm0NEEPoRYNwOQCJNqZRoF
        9XZuscm09UyQVFXSUU75Dhbhs0UqTNeQz3XEQZu3PA==
X-Google-Smtp-Source: AGHT+IEbo/QaXbEge1G5Z/WI8GC4WjEpd8nYwf63b05jI4LounoIbn3xImuEMnpU6SQ7nND9Q4pI7A==
X-Received: by 2002:a17:90a:740b:b0:27d:32ba:3403 with SMTP id a11-20020a17090a740b00b0027d32ba3403mr15840594pjg.22.1698980832839;
        Thu, 02 Nov 2023 20:07:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l12-20020a17090a660c00b00267d9f4d340sm461076pjj.44.2023.11.02.20.07.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 20:07:12 -0700 (PDT)
Message-ID: <654463e0.170a0220.2324.1f6f@mx.google.com>
Date:   Thu, 02 Nov 2023 20:07:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-11517-g3985620ae80d
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-11517-g3985620ae80d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-11=
517-g3985620ae80d)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-11517-g3985620ae80d/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-11517-g3985620ae80d
Git Commit: 3985620ae80d3c4b95988e034f350e6c11aee27b
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
