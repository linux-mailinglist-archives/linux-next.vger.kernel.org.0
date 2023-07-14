Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D34753B9C
	for <lists+linux-next@lfdr.de>; Fri, 14 Jul 2023 15:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbjGNNQH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Jul 2023 09:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbjGNNQG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jul 2023 09:16:06 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451D330D8
        for <linux-next@vger.kernel.org>; Fri, 14 Jul 2023 06:16:05 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-78372625badso69918439f.3
        for <linux-next@vger.kernel.org>; Fri, 14 Jul 2023 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689340564; x=1691932564;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jEKtb5EaQSJJlG8ts2IF0MJg3XhsYQefPCyrMFA1PSg=;
        b=jRxTCaNI9ui/No+BinGynVh29v0eoYm63lnAsaEGnu6XP4GNrzw2ej5pYHDWOIcPPN
         aJvt4pd0p/PXUft0fx7laEACqk2NgJ53pX3SvK8cWUqTcSHDzUCq2+EulQlnwwOlhQ2/
         bRa20UspIkO+icd46EDmDj/G3YmneoaIOlOc5lNrld0E9KUoDKjM6fdMNiJ/Zg12N2LU
         uQnl5gzOnX6ta/EIhQFLsbb+CG1Z0K//8MAeKzMhcQ+zBCjOygQd3l+WaJok3lRCxupA
         6wGIKYAGZ0KLb0/+2uMmJzHeqqsisVRJnz/juK2XAVOWVLyYuYtmJDRxqjD7kYjRUU5x
         4k3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689340564; x=1691932564;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEKtb5EaQSJJlG8ts2IF0MJg3XhsYQefPCyrMFA1PSg=;
        b=SJsUB693XjlfcICbUQ5ga5yLydydhF+bcNiQ+hP2P2jcikee0bM4R3/aM3T99jyygB
         /obOhdpL+ILW6f6pczoSbBUkO37FlVnYYXCk+wSx8yWYIqIrZP3V0zV2srHrLt1gTutT
         jXXOvQWuQAEfOPiJQnr2MSTg+EdQsR2wX0E+epWfOoFBF2D1MaraWR9z+g0PIqhh7/e2
         cp1oSealenUxISv9zEILMZ6EoVCqYg7rvFSC9eZw9YDN9RpuSMuxrOFXTCpbBGZcq2Vk
         Ykemo60xsFXGzqaxxWR+HajXe6IcaUcC/eBB94N7bQkxNBVBKmYbJmU3thrhd1/8WflF
         D1BQ==
X-Gm-Message-State: ABy/qLaVPz+zfe1uCuCweVlZ9l8A+VzHGxauzcGrBeZjNt/WSaUQzgI9
        mwjoP9VZDJ9U6hCC15l4MVerpuMVGUaCB6TqZzkMnA==
X-Google-Smtp-Source: APBJJlFgXYPRsIVjhIb3+5SK4mIc7smEU7pclUBGZg71x2RfEDMxWdkrpFdpaRTIgC0AGZlXHNgbpg==
X-Received: by 2002:a5e:da4c:0:b0:783:550e:33c0 with SMTP id o12-20020a5eda4c000000b00783550e33c0mr5158661iop.7.1689340564269;
        Fri, 14 Jul 2023 06:16:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id a2-20020a63bd02000000b0054fe7736ac1sm7451260pgf.76.2023.07.14.06.16.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 06:16:03 -0700 (PDT)
Message-ID: <64b14a93.630a0220.5284f.f486@mx.google.com>
Date:   Fri, 14 Jul 2023 06:16:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc1-374-g7758824d54f7
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 7 warnings (v6.5-rc1-374-g7758824d54f7)
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

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 7 warnings (v6.5-rc=
1-374-g7758824d54f7)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc1-374-g7758824d54f7/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc1-374-g7758824d54f7
Git Commit: 7758824d54f71f083cf6962a924ea56ef20db6c6
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
    x86_64_defconfig (gcc-10): 3 warnings


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redunda=
nt UACCESS disable

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x178b: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
