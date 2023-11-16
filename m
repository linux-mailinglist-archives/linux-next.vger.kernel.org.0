Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A12D7EE9DD
	for <lists+linux-next@lfdr.de>; Fri, 17 Nov 2023 00:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjKPXHN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Nov 2023 18:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjKPXHM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Nov 2023 18:07:12 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E6E130
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 15:07:08 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28003daaaa6so1125262a91.0
        for <linux-next@vger.kernel.org>; Thu, 16 Nov 2023 15:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700176028; x=1700780828; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QS2u+12vNLw8OHDFQdBjeAc33Jss03WYF3mq2tjMg2k=;
        b=Q3hEaOLNUXhbkbhnCpeF9LIFmJVdwnyfKUh+RlAIe5yguq+tltO5hLM7SIq22hHRqg
         kGgP+xPtVtbtrcpz8GR3uOMHaDNtq83umCo+JG0QEaeNPH+z7K42IjcVeBecpVpwKJt1
         Dqo9Ec7yryCdYXkoypeUUavcVBEMk55ghxXMXRVOsT5hRHmlmLKh5Ny5n6ckkoqmr4kZ
         PNDvEI7BIc2AjQF0wuTVCmZT3olMJTOVCQMdd2iAde5llEs/iAbbMZmJ64lTPKLJgs/T
         vNmzJYwMwgVMWImhmFzU/1BJRw8WKUiDlfCYN8lvD71oG+Vz/gRv9LnkejIB7+rmEcdn
         5DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700176028; x=1700780828;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS2u+12vNLw8OHDFQdBjeAc33Jss03WYF3mq2tjMg2k=;
        b=T8JiOFeVcmG4ZdW5qT6/n1i092DcdYtJP+yzv6hMoPnvi2zc8ZOQD0foz0jsFtFd6D
         nonWLP8mvxPA73u8cqkQsS99LrS0dP2MRHBjNRNg9+VjSvGXCRuDdMC87W7K6HKwlIP6
         AuYcdto1UnPOh0/tKw91nvMBMpg7WKe5jQo+UrSCKzjabmOrM6tyJARsa324PVCv7N95
         lDQf6f6WT/o1cLPMXMmwpsJS6fDlqJL8noR/zYUJ2uyiey5i+XNAGuv4qANnnm5ymWiO
         NKZ+oYOXTI6fQUdVyFvu5DTqqeq1xr0GAwnSoIekLFD3tGxvoDahyWTapD6kp+5yknph
         2rOQ==
X-Gm-Message-State: AOJu0YzAIGtDBGrH8IT6ukvio7+8zE3abTj5LR3o7IyZU0iECqlaOGHD
        aOWS4sc2Dp0lIppqOmlN7+Wf9t6u1DRMqBpXf6g=
X-Google-Smtp-Source: AGHT+IFkN4L3eqc36melCggqIFcNK+iYJxels/Fmx5oqeM2jA57dUccUDLOqLYKeElJbQjAYjjzTEQ==
X-Received: by 2002:a17:90a:e7c7:b0:282:e851:a7ea with SMTP id kb7-20020a17090ae7c700b00282e851a7eamr16279016pjb.48.1700176027804;
        Thu, 16 Nov 2023 15:07:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090a9b8400b00278ff752eacsm218228pjp.50.2023.11.16.15.07.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 15:07:07 -0800 (PST)
Message-ID: <6556a09b.170a0220.77646.121f@mx.google.com>
Date:   Thu, 16 Nov 2023 15:07:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-251-g1da100f819fbe
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc1-251-g1da100f819fbe)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
1-251-g1da100f819fbe)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc1-251-g1da100f819fbe/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc1-251-g1da100f819fbe
Git Commit: 1da100f819fbef3f6f1982cd0e448694e6ef2956
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
