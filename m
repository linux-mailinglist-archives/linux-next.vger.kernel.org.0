Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C7F7A8FD4
	for <lists+linux-next@lfdr.de>; Thu, 21 Sep 2023 01:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjITXZ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Sep 2023 19:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjITXZ6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Sep 2023 19:25:58 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC9CC1
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 16:25:52 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1d69c93954fso217046fac.0
        for <linux-next@vger.kernel.org>; Wed, 20 Sep 2023 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695252351; x=1695857151; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hB334XTRJCuzsjiEQYqJng/109s+4HUe1tFd5RjVwgo=;
        b=eXck1CN37ZKsQU9bYSujYbChC1a+2A3YAFN8ZrPYC6dAzJIliua/pZyHcGfU1d/eUH
         xAc8cbZRn0o/2bpIpXGHxodrIXe1bAtqatXFLnyguq46WIZWw6Ajh4EUg8MrOeQGTCGM
         lKAIF8844SRxqWlG+Wi62Y+8HjyZxvQ8Jj23cOOHMB62/pYB8THcvgj+abaaB43SYUW3
         Iu0G+/mpRfdJBagGa2HFOpVDiIf+fVq8JnqFQCd22eq8ANANW04Dip7TGOWhqWnzlBl/
         vTJueMq6D5QcRez9xnnJ/7z29FmWJ7mwyatgrpczjsGlPpsutV27xQYFCYVfdMmirMhJ
         O86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695252351; x=1695857151;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB334XTRJCuzsjiEQYqJng/109s+4HUe1tFd5RjVwgo=;
        b=fxvruxZjXqV8VGduvTdElWpC382aF1CUcQ0KRzCOyDhSoS2kORsgnvT4dpeULcEY5e
         Gcmf2q/MY4lT5t2Iq7VTaku1L8Nsn7ScRiITSRynFKFUwcoPdC9ynuQsc6udh/KHoSZM
         xhStVCIq0nZwRlbXUVlv1LDITjgwoocsmt3vNmkuzyLz30QxB3iTtujPjX97IkdHQ1Af
         wBWjGHcpo0IlM9v867LzPN83mIEbtKqAzJywZ0U8uTXT43hJg1rnlxA03utBCCaBotHR
         tMeaJD94+M69UptYSm6Hyc59GYUgNGK6psKeNDyPnSby92xLrSYjGAF1oYomB6fjSRiv
         SHJw==
X-Gm-Message-State: AOJu0YzvWZT4SvmjZ8RuJ7s7mkYgOF8Dlx8EA2tDXnpjQxQxGwFqITk+
        6HsNsl+Uthj3roUh4q+PFugfDR9JFgIVPSyNOq6BjA==
X-Google-Smtp-Source: AGHT+IHRS795lg4/twMKOHJ41gfxGEi335OIy8jiG4/noawde9VYg3JfiOGWYzL8Zo/ZKpoVkbs8Rw==
X-Received: by 2002:a05:6870:b621:b0:1bf:dc26:4947 with SMTP id cm33-20020a056870b62100b001bfdc264947mr4496119oab.46.1695252351028;
        Wed, 20 Sep 2023 16:25:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m26-20020aa78a1a000000b0068fd026b496sm74766pfa.46.2023.09.20.16.25.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 16:25:50 -0700 (PDT)
Message-ID: <650b7f7e.a70a0220.793d6.0db5@mx.google.com>
Date:   Wed, 20 Sep 2023 16:25:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-432-g1785a80001120
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc2-432-g1785a80001120)
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
2-432-g1785a80001120)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc2-432-g1785a80001120/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc2-432-g1785a80001120
Git Commit: 1785a80001120a6d3c04ded80f1f06c116d684e4
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
