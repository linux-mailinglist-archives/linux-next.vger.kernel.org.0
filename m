Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A987C7AC0
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 02:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjJMAL1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Oct 2023 20:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjJMAL0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Oct 2023 20:11:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2268DB7
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 17:11:25 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2799b7280d1so1164835a91.1
        for <linux-next@vger.kernel.org>; Thu, 12 Oct 2023 17:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697155884; x=1697760684; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFP52lmUb/vuQdjE4Vhh7Fa8GVGv7pVjZMIOrd8n9/o=;
        b=d/N/aELU17ZfP4SgdsXzPB84ULhloQFZHrS25W0sczwituZT++yX01YnY8JxVquQzf
         Gs5ysZB2eM1rui5iyTfag8CEPMiH8QZugbV2cOxInVckh/NMlzVi/E/V//bLhKpozyrU
         hYbiWvXzk33/VxAb2mj2hwS5JAdZilepzQq9qc6COnFWA56sSSTAbDB6uTT1zCVS+otg
         VRj4ejXUishjl59kP2eFrPD03dzu+i4igiqqR+EmPKZePKIKgfHkcoDnWhFRGkNtL65q
         maZTMpgDTvz9AzDZGBoMCUI7Kbh5HYWlLVUMtM0URqPOFBcU6Or/Y8XC2uQ7dNa/1jRE
         UC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697155884; x=1697760684;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFP52lmUb/vuQdjE4Vhh7Fa8GVGv7pVjZMIOrd8n9/o=;
        b=eeKkx9H8zPh+tP4pliCvwgCVqkLZoITRuc8QpQEH8ucWQsO/S8lh15DEN7RrcWpBDX
         JWBRA1yevMDrWdXBmCbeOXBU03ZPyqgvuwgC5hlW0oLujwh/kiChzNUHuxJAXlrAYkOO
         K4xDcFcVhqM2VESQQvJMmlLWcM1/hUqbBiaMK5oSR7KaNVDOYHogZvXmPc0gi6LyOzUf
         wmOkyGOpW7jCy2j9gBlQ1DM22Snaox/O6Uo9hZzcxzS9zhQ/vUKZKAvNMPdtjccs9jOk
         EF16koQtO/agw+j/RHz4B50Iv9kppqknKGYSzZqPeREX5Ep2WZC9oJcak+U6XcR2ctwg
         J3WA==
X-Gm-Message-State: AOJu0Ywe/HLRvi0Cio2Mim7pUMZX+N/gM4YieiRuKZexrJJjq9xIfILB
        D53/BmWR0SOvXSznJgInH3KwbjmQSISZJZy13E7x8g==
X-Google-Smtp-Source: AGHT+IHOtl0O+dg8/4sOZPnKNNYIi9kKg60xUM9bgaVAp7Kgb30zWq9SJ1xcJCNLWBAgesn7mf5C7g==
X-Received: by 2002:a17:90a:f48f:b0:268:557e:1848 with SMTP id bx15-20020a17090af48f00b00268557e1848mr22432484pjb.2.1697155884071;
        Thu, 12 Oct 2023 17:11:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id y18-20020a637d12000000b0059d219cb359sm2180349pgc.9.2023.10.12.17.11.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 17:11:22 -0700 (PDT)
Message-ID: <65288b2a.630a0220.508e6.7df4@mx.google.com>
Date:   Thu, 12 Oct 2023 17:11:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-397-g1026f1ab9e072
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc5-397-g1026f1ab9e072)
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
5-397-g1026f1ab9e072)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc5-397-g1026f1ab9e072/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc5-397-g1026f1ab9e072
Git Commit: 1026f1ab9e072d96616b988ed4b066b5b95613a2
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
