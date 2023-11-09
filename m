Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789097E64E0
	for <lists+linux-next@lfdr.de>; Thu,  9 Nov 2023 09:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbjKIIFf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Nov 2023 03:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjKIIFf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Nov 2023 03:05:35 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A0B2590
        for <linux-next@vger.kernel.org>; Thu,  9 Nov 2023 00:05:33 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b497c8575aso591098b3a.1
        for <linux-next@vger.kernel.org>; Thu, 09 Nov 2023 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699517132; x=1700121932; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E/LzF0M1OyYnrtxjE2KZ2ULExpYDwDY+i0gr60i80rQ=;
        b=Znk1FLmKjXJPj6rhEsfA5UBQ1bo4ztjdRxEQ2kExBXyLfMpnwGgrB9XGWUhOZ5b/V2
         x4MnopUdieVkgXt1An+I6CEboF0UCXAXfS3WX9UZHis5DiWXVFHNevDR0JUUqDNikneQ
         bPLUwlWCd01/swNSPoQOeXvd/6PsfMIksbr3NJtwhseYp3OqoOrrAtANEt6V1mmo49tX
         rO8yxqXOEFESRRgH73CCFo4be17krFu6U9dU4JV+AN0FR7imXi4/UBzbzN7dbpN4HZL2
         hNKuAKNSDSwXiUK+sYU/npIijkwtPoVkdO2MiuazeljPgQpLjHsVxgHQD9VLSUs0DY4Y
         myJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699517132; x=1700121932;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/LzF0M1OyYnrtxjE2KZ2ULExpYDwDY+i0gr60i80rQ=;
        b=WFbZlWLHnw5hbbecb7v7Q9pyPKPAQcp6mnkwjxmLMOnlE3zgXby54fLD1TWYmh3Sjf
         ciwwsW0N8k0CQs6/3tCybL7YMIjPANNVDEYHx2JabG0cWsMtZ0BEO365o/jr1IKjWXAq
         KQYNdi03QbibpP4S66UG6E1/q9QKM0/GLTLeYzpqBQTkps7PLmU8oxpdnjRilw5XY4xU
         3SHDTdW9hl3qp8niyPg8x4GZ2wMxZemm9T1mnRpLxprcSBaGuTg10cnKPY7oOnTUnN19
         fgT0P/Dp9Ws4/twTdcVRu1hgtzuNasUOZB1l5WXtVeo1JVapqqJ56hlY/ZW/trZET3mo
         UZ7w==
X-Gm-Message-State: AOJu0YwWnfWhwWgLFOiiIl2tv7hYSKF4dvCulegsJoYqUoKbnsyEBmre
        5+ZEw94xskj0AZiHZ9XhTBXwJzOgM0IONojbIFiQVg==
X-Google-Smtp-Source: AGHT+IHb2oN1qCKPVWM5hONZmxJVbY3OeVewBWd2kNe/hohTMJBEcuQv18ck51t5QucWrx+XA0nalw==
X-Received: by 2002:a05:6a00:138c:b0:6bd:b3b9:649f with SMTP id t12-20020a056a00138c00b006bdb3b9649fmr4613574pfg.7.1699517132254;
        Thu, 09 Nov 2023 00:05:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x20-20020a056a00189400b006b8ffc49ba5sm10116520pfh.38.2023.11.09.00.05.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 00:05:31 -0800 (PST)
Message-ID: <654c92cb.050a0220.7d91b.99ac@mx.google.com>
Date:   Thu, 09 Nov 2023 00:05:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-15762-gb2fa3be579b5
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-15762-gb2fa3be579b5)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-15=
762-gb2fa3be579b5)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-15762-gb2fa3be579b5/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-15762-gb2fa3be579b5
Git Commit: b2fa3be579b5bf39d5db3c2ecd8b7d32b3cd36e4
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
