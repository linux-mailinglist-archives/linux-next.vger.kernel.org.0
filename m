Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CD275147A
	for <lists+linux-next@lfdr.de>; Thu, 13 Jul 2023 01:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232343AbjGLXap (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Jul 2023 19:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjGLXan (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Jul 2023 19:30:43 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F37E5C
        for <linux-next@vger.kernel.org>; Wed, 12 Jul 2023 16:30:42 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666eec46206so133211b3a.3
        for <linux-next@vger.kernel.org>; Wed, 12 Jul 2023 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689204641; x=1691796641;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yX+Zv2WQjLQtA6Es6gG/0Djrz4QnEQwW1tyHxo8sndM=;
        b=DEzKBDQBddzTJqcRx25gZuA0PgrbVKyAk3+ARL2BS/Gvi6MAUASe/lVU88CVHsEJW1
         Qc6AvoH5xPUf215cRYxDxXmppqaslGtgRBtovHN8QZNraZcZJyfOI2QPRYkitPKy6vBC
         byVjwdcBPOZvttQ1mVKSOFhHBFgvZ5gBknbZrfZTRQ3oGXov78+3GD+xHCivOGgGcvLl
         AHRjfiDrL4lmpx7tEPMjyz1fw/33WsEnpyk9Dyj9hBB9a1sNb2WQqkakEFlk9nO0q7df
         pGVguq7kGfuuPo6ArXaW9ESs8HHNNwwy6tuTl00w2HrVq6Jt2IK62u8/80qUYLsZbbWv
         ZSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689204641; x=1691796641;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX+Zv2WQjLQtA6Es6gG/0Djrz4QnEQwW1tyHxo8sndM=;
        b=IuW2PejfiUgmfSiLZwDDwd6w4eHPozdt6zZ1ZoefgXw6/mLZD2dm5CHqNVBncveeHi
         n3+1kjIks3R6aFco+mj78rZCr/mArqgecHFzZ6kqWFn0eIEWVNW0k7E6Rg/jIo1/3RPx
         R5Tb/1fH5BammZvaGud0j7d4tNECu3I7hAF0X6NXWtASbdmYN54gijCQXt67Z2n5AF7a
         N7ynYKKHyHONBL+TEWKNgOuQ5nwkaQ/NQyANBfkDW6Q6i5kf1r8HpzGNUvRFeIH+kwP0
         FhZPIb26P5p20Q6jN0C3BJmX/c+ulmV4AbgneC3Hf3ZLQrRGuKoc1VRIbikvlZco5eaW
         ALzA==
X-Gm-Message-State: ABy/qLY+XEgvn5Z0VqDsUmp+4MdTyXlFDZVLRqePwcTVS63o1VgtceVO
        cA5kpsLCwJrHvwg/3mDkkHufSBruJqVqT9hAIe6U1w==
X-Google-Smtp-Source: APBJJlH8p8QlkHxJjtRK+LrIpEwPnVXXZW9e4OIhzIuUg2YKKeOsjpgFSILBF+USn/Sh8SCvlBO7xA==
X-Received: by 2002:a05:6a00:10c3:b0:67a:b045:e290 with SMTP id d3-20020a056a0010c300b0067ab045e290mr145822pfu.4.1689204641279;
        Wed, 12 Jul 2023 16:30:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i15-20020aa78d8f000000b0068277318e6asm4022858pfr.209.2023.07.12.16.30.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:30:40 -0700 (PDT)
Message-ID: <64af37a0.a70a0220.1b1a3.8877@mx.google.com>
Date:   Wed, 12 Jul 2023 16:30:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc1-303-gcfab091a85bd
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 7 warnings (v6.5-rc1-303-gcfab091a85bd)
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
1-303-gcfab091a85bd)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc1-303-gcfab091a85bd/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc1-303-gcfab091a85bd
Git Commit: cfab091a85bd646090b3f22425dd0da9524c0da3
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
