Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6C674FD6E
	for <lists+linux-next@lfdr.de>; Wed, 12 Jul 2023 05:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGLDIJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Jul 2023 23:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjGLDII (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Jul 2023 23:08:08 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955821712
        for <linux-next@vger.kernel.org>; Tue, 11 Jul 2023 20:08:07 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6b5f362f4beso5632443a34.2
        for <linux-next@vger.kernel.org>; Tue, 11 Jul 2023 20:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1689131286; x=1691723286;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9IToPE5epGW1Hm++NoZ04PAExQYGDU+DxNhcXWzLp4E=;
        b=gc9FoiyBgXtRK0sjnx9EGJFWYNN7lfmkrg/pw/V7IeIVHMcoOuRmiFi42ja8gqfbq7
         CY5ZcINUIb6sLqmPujsHaR0dghsoIsrNVV8xHTQm/7GY+hvyQCqOe9OY1eD2aqN/pz3U
         AKTc/xq7zL+iKnXdJGA+nlXEdo30eCihywGdzaN2JsS8ieoKlGovL/sY8qxWWnK1uoQM
         8QwMY2OhfwiekHVjJu/0zNfqyJirkPNe86fAIsHfGAq/skObmB1d3E82mnNo82LYBvmg
         Qhft+KQBY2sBJFwJViHwnWS0z/x8FVjmPv1MEs4rjy6gL6JAfmtGqq8hb+hob3qSTOL0
         tQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689131286; x=1691723286;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IToPE5epGW1Hm++NoZ04PAExQYGDU+DxNhcXWzLp4E=;
        b=Qyk456QYiP+AiHceK7zNP7IB1Z04/aGxL0nWApYrqWv8HgrJl1oQd4u8NHVaRuGkVG
         CvFtQp/I18m8r4SAnL3ImqD8fqsmZAXentBsQ196C0PMpDnS5/3/pgESNJ/al6Ie4Wtd
         Mp12O1sYdrBB6iLYd0jB4BEf1SPstXcFbFTVVU/gfyJAtx5J4qobyEBYITFRmZtZ/AjU
         xX6pKlxBP8JtLgka+Eg5tHfqCA8xx4BRo64Z4wREXP/VUqEeBaYr92oUxl6GBjtcOnK0
         C1tE9QYws61ce7GnEvpBCliekiKa4dvHJEkh3GDHWvzF72JtqTlvVQR0Iwngpa3xYPcK
         j3uw==
X-Gm-Message-State: ABy/qLbGP07QHMC6v+1LVNrAORzRypSRXJZ5lrOtRxxla3Jd5Y5Vz1FD
        EU2r/oe8AIKlZj5/X9XD/evvRhp5N5JDBjMcDe5fKw==
X-Google-Smtp-Source: APBJJlGfmqB9LeeAmCwaxVMonvJXQkCCdc9m/CATFARFmveu/lO2/WAt1ptm+knisANQhp1AS+YDeA==
X-Received: by 2002:a9d:68c4:0:b0:6b7:52ce:ff38 with SMTP id i4-20020a9d68c4000000b006b752ceff38mr17122640oto.16.1689131286422;
        Tue, 11 Jul 2023 20:08:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b0024e4f169931sm8851152pjj.2.2023.07.11.20.08.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 20:08:05 -0700 (PDT)
Message-ID: <64ae1915.170a0220.c56a2.0f20@mx.google.com>
Date:   Tue, 11 Jul 2023 20:08:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.5-rc1-266-g5d4deffc2b3b
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 7 warnings (v6.5-rc1-266-g5d4deffc2b3b)
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
1-266-g5d4deffc2b3b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc1-266-g5d4deffc2b3b/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc1-266-g5d4deffc2b3b
Git Commit: 5d4deffc2b3b1422611cafe884db6364d1e5d4cb
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
