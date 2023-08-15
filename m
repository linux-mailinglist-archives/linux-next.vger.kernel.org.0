Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88C877CD80
	for <lists+linux-next@lfdr.de>; Tue, 15 Aug 2023 15:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbjHONp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Aug 2023 09:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbjHONpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Aug 2023 09:45:23 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B524F199A
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 06:45:22 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc7e65ea44so36568775ad.1
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692107122; x=1692711922;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E870LgYaf6qSEkLs5stAkA8hNZxmJK6ucn32F3tNFMc=;
        b=AK7N2tl5pEYsLZzERxqoTEGBir1k2muUBNzN8qAziyVEvRXHaHs8MS7vs95UCPL9JH
         9dbfBRF8iFsXYXxFRb7oC7AppVCfakE8vtCvpAhifodCd1o3gQWnJ7+j6wqwW3Fnpd0j
         y0jUftvjyoT+JS1VrgAY3Loi5voybsh5KQbEPC7PxptPLFrLBU1ggEe0Jek1PKnmhz4R
         UOX2xEAKxn//iZkQvvdly5Da+6pKBrFXYblbbuTFNVLnrhMEXQdbr+aIzPjk8qirmGpv
         fztXR14yTH5+tbNq2n9aHogPpBKEVQbmoAzeFOoalGw4mQbmSmkR/GzKIJxKa71hq8A6
         ISQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692107122; x=1692711922;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E870LgYaf6qSEkLs5stAkA8hNZxmJK6ucn32F3tNFMc=;
        b=Uo7pTV2XJY4HinBU4gPIxLd6q/KR7mcEbqRCby1CVX8y+2XTSYtFfqrc0FUMfg44FV
         ZFc1aOxsCoQdZSw0D8S8wvvzmuvz5QgstQiIgVj6w8vdgWxo8zE2SaSsD6JCjxVNmuvF
         lktjaHWiMdzAi4D33B+6rt7Ratu+5GpSruzsyn5qllTrYkvU7TQlScQ8A/5mXgXBgYW0
         IeDduZ5SxC/+TPHG08/otGMLLNWsweGii2rEOSvLP8DrRKf37FnaZ6v14h07aIWRzOkD
         WZYP8LHUjZNLjAKEEZrJ6CzmcKo8g8Npy97P2G2ORRWBcx5G11O/vxK8Dack67lv72hJ
         /eJQ==
X-Gm-Message-State: AOJu0YzazJnfKUn78jLpUzDZRgAg4OCb0KV1qvPeL4hf4ejQaQKdp0Zk
        AgD/9QqxfyF1v56YusKZhNH44tXrpqyb9gGBYtkkpw==
X-Google-Smtp-Source: AGHT+IH2GEHdpBepw69XiHnGuupFecAS0fjczR4l4ux1Gx0mm5zTLVcoN7xZhzOfELeh87Feo1eD3w==
X-Received: by 2002:a17:902:e807:b0:1bc:210d:6365 with SMTP id u7-20020a170902e80700b001bc210d6365mr2632520plg.2.1692107121641;
        Tue, 15 Aug 2023 06:45:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902b60e00b001bd41b70b65sm11093688pls.49.2023.08.15.06.45.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 06:45:21 -0700 (PDT)
Message-ID: <64db8171.170a0220.8d442.3b9f@mx.google.com>
Date:   Tue, 15 Aug 2023 06:45:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc6-140-g34b80cd104fe
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc6-140-g34b80cd104fe)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
6-140-g34b80cd104fe)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc6-140-g34b80cd104fe/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc6-140-g34b80cd104fe
Git Commit: 34b80cd104fef7e1f21f7a83c697a77b04dcb534
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
