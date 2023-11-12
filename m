Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986257E9353
	for <lists+linux-next@lfdr.de>; Mon, 13 Nov 2023 00:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjKLXJh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Nov 2023 18:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjKLXJh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Nov 2023 18:09:37 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4BC124
        for <linux-next@vger.kernel.org>; Sun, 12 Nov 2023 15:09:33 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b44befac59so3568604b3a.0
        for <linux-next@vger.kernel.org>; Sun, 12 Nov 2023 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699830572; x=1700435372; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rs2gNsIeCeYSwJg/2N72pudjllvJmMf+kfYlo6TlPKg=;
        b=kts4XzK+dOqe/FRFJTXMnys1djGzc0gD/ebVBDShRPsLGFvZ1t3NHmwQ+VHy8Z+A2K
         LJ3J8yj2trbVtUfDspwGiX/pz9gCMuSaZD36Km0XYPnkJXu3+k1TQ0lc2pFwp6hbcsHn
         TuxWJzpZUtFOzdUgSj3YerAStZ6QnX0j8wneTvHbXsUZlgCqj0wh63rCiE2F86wGIsMq
         cp4RUrxEAwyWHkqjrmEN/iAUAXR1Ul0BPsy4BkCkxd+e7sm47vDHHT5Tl0wL+M8+1Un+
         czkrx6vx14xfA36LmmypWQS7z06RfCsryJR0QRzyKuoyLGNwjVpWIqAvJuqpQ+otG9e7
         SIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699830572; x=1700435372;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rs2gNsIeCeYSwJg/2N72pudjllvJmMf+kfYlo6TlPKg=;
        b=v9y/duoxmlwR3tyrMV/4pW//63Whv+JKER8FAnsj2fIf1zKs3TTS+O2poKimm2qhaF
         kOfcJNvteGZyp6x2gfjF7cYqYHZPCMWFT53tZghQ7jV8hKso7teS8qDEfJAMfd5Mqlmb
         sYKe+GniZefMcM+wv27cpTYKJJ2+Z5kddMQib9nL37PYCQMfBx3cqhKciyKbFIRn3E8Z
         QBuB0w/TcecMP6yuqs0dQ4UDX2WYTTYjR7KFGvkkye9OgFq6cqwK7ES+HXOidnKfGXqN
         dQgSrjkhC7ig+sliznWuoRLri3f8lwL+sbHAaCISRGkq87S40zqWSeTy6eyrzb/df1UI
         ZzbA==
X-Gm-Message-State: AOJu0YxuEaMvJSa6hKBw+fZM38aN6qyLV7o9KFtmqn6nWr4kI7DxZBCq
        eWgNYAjut3g7hb6gcfdAi6P68odUjA2aI7W2L5g=
X-Google-Smtp-Source: AGHT+IEuJEgNND/cuwSREazscz+ToXkYYZhLB3kXpq7ZUCyNEv3gND1F4/gygM38chVuLltwnLdF1A==
X-Received: by 2002:a05:6a20:918a:b0:159:e4ab:15ce with SMTP id v10-20020a056a20918a00b00159e4ab15cemr8442406pzd.15.1699830572584;
        Sun, 12 Nov 2023 15:09:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id j1-20020aa78d01000000b006c34768a37fsm2861400pfe.114.2023.11.12.15.09.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 15:09:32 -0800 (PST)
Message-ID: <65515b2c.a70a0220.95a20.5b9a@mx.google.com>
Date:   Sun, 12 Nov 2023 15:09:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-16289-gf5a0c9203230
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-16289-gf5a0c9203230)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-16=
289-gf5a0c9203230)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-16289-gf5a0c9203230/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-16289-gf5a0c9203230
Git Commit: f5a0c920323037a7494a7f6b81fe697d315b87a4
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
