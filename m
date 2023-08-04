Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2255976F6D6
	for <lists+linux-next@lfdr.de>; Fri,  4 Aug 2023 03:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjHDBQn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 21:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjHDBQm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 21:16:42 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E374204
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 18:16:41 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-563c7aabf38so1877580a12.0
        for <linux-next@vger.kernel.org>; Thu, 03 Aug 2023 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1691111800; x=1691716600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJXODQzVyuthXkZxlXxNbTFONWQXwajhIz93DcrOhRc=;
        b=j+zgPA5KD49/R6KpEiOJ44QLRSPto7gKCNpP6uBuzS1K7QvzB3Lnx2qcg8wGLICjvw
         vQV2kWSZfGPwJfJKwhnlsvaSmua0fe0iz68hJ5BpLi55KSuzJ7Sab8Lxig7U2Jf6DHMG
         TTYlsr2Oh6WGcOEKXhdjFeEs7TnwWl5LxBGyOtc6o3Pq8sZ3aUemZ5rU0lzNRw98TfNQ
         OLiOe2lHSLMupwD3waJ/qmvXet/T53t8420FGv8v+E5PgXGvm7o7h6UtzuTeKEj0fAlV
         1g9p/gm74UhgIDCuiqG3LBT6EZ7CYY0MLrwZ4+J+Y4RZ9lU5j8+QoIeyVHXbb14+z+Th
         pg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691111800; x=1691716600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJXODQzVyuthXkZxlXxNbTFONWQXwajhIz93DcrOhRc=;
        b=cfM8jZekISvzDYdAXcOs8m9hERp7ZCA8TcolRCC/az5E8XiLDkGum5RyoS3nN/ohLM
         q0xZkQprhdEniuBtjysb2GtkWkI0ZSp4nqgx41a3iUhdZfUjWEgVcbwANMLM+A+ccdA6
         eHYM+9I5ION93kwY/I1DQnmalMgqQHf7lE0fVmgxUDzLQ0kkMSYvpFOc3Ja22lzRWGyQ
         YWKDkJz+QS2AurUUO1BR9lqXfeqHgNY5UcvhecxJJB9szJsqaxgfnNZqvknTyJTP8Juj
         J32VyHcj0rXGZF8W/PouHdicgw9Ngh+rKElRQkgBfwlpRFMQ1mHTaCKmkUkbEyYsZ3nL
         pGiw==
X-Gm-Message-State: AOJu0YxTn/JGJ036OXBGDFOPlyPvYWKYqpV5N8Hu9ih1Ogjq57RHwbdX
        XL95Oi+jcwNJoBobFgXHxy1S0Z9QcyTcbXzdOdDV+g==
X-Google-Smtp-Source: AGHT+IE/nb9XCqnmTrZJgPxaVHWBaaJNN+E+s0LHb7O4SVrrZln/KK2YzXfH6qyyKPIqhv/AdP8B9Q==
X-Received: by 2002:a17:90a:3941:b0:269:23fe:e325 with SMTP id n1-20020a17090a394100b0026923fee325mr514050pjf.6.1691111800403;
        Thu, 03 Aug 2023 18:16:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u19-20020a17090a891300b00267fbd521dbsm3081499pjn.5.2023.08.03.18.16.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 18:16:39 -0700 (PDT)
Message-ID: <64cc5177.170a0220.a07b.6f25@mx.google.com>
Date:   Thu, 03 Aug 2023 18:16:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc4-350-g514250232787
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc4-350-g514250232787)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
4-350-g514250232787)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc4-350-g514250232787/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc4-350-g514250232787
Git Commit: 514250232787bc4c20714949414b314a161120b4
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
