Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D9E7ED843
	for <lists+linux-next@lfdr.de>; Thu, 16 Nov 2023 00:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjKOXh7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Nov 2023 18:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjKOXh6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Nov 2023 18:37:58 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9888EE6
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 15:37:55 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d261cb07dcso117285a34.3
        for <linux-next@vger.kernel.org>; Wed, 15 Nov 2023 15:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1700091474; x=1700696274; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xvgcE1EwQslM46V6FJtKMlhWfmg1Xm0W80gL0cG0Jlw=;
        b=MuF7nYnoJbdRFRgOJ405d+cjWT0RVic66ztzTnBfuv0s7l+w9r8iguX41AIgwT4JLP
         oSjFRrwjc27Z6pdkEnVaKdaHzBA/3916yGcvGW7bcLOm5x7/8CuQ6La6NZXotMudydYG
         UmPa6VCa2Lihm0J5pxm+2zXUK4oDIpW+ihSl2ZtuobldI5D3XVuxK5ilsNcKyw9q/Dsr
         AhS8mfB8jb7/5qBOdPAsEtG0edejd/HCf62ORJLY4+JOiqgr+jZNnIIodefQ7bbkm8jC
         W5jkFvkEsvf9+GzXySbZ+9SAmKW54eToF3bqO9czcgEs2/FkKxWxwqb2Dm6USrIlQXln
         ++yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700091474; x=1700696274;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvgcE1EwQslM46V6FJtKMlhWfmg1Xm0W80gL0cG0Jlw=;
        b=c9qMQmxVECGdMPy5b4X/p437AO6y43O4pimR2IW1t45tHIfJeROW3V8bXgTpRclHlO
         EtQhTugC8oVJ1POMVhlrRwFIakOyJkdObeLwKYaMPe0+DAsvFegxbGfzKwErlXlmoSAR
         idlLT+7x8xOEGRY3BwKJ3sxFqzyvtv17Gni5JxyaKcMfH7gnOYZKp9Zb9IozkfFJWJXi
         mwqONqwRp2F8CyZFFRfO8h1cX7EIQE04+IczhISQg7l4k3e9vj4BkzSruCk+xkyrZ/jY
         ECRDLRKeWFD4UbUxLE7m/7l2r+gZVJFumUlR60yH9xnpxP8/XHd4of9LvlucjkZ7sV2e
         SsRA==
X-Gm-Message-State: AOJu0Yw5CHvZx9VKwmoK4KA4nP8+JuYueqgakFb1JZsXcYEFtal3oSJ9
        EjsZ+AC0LZ4jn5d/QrQVDBw8DHZLIqd+oV2OLUfqhg==
X-Google-Smtp-Source: AGHT+IFVRiRuqUxxFA4lx2K/9yf02Qv8+WxO4qyioGlbCjWGF4pmh9kIGNebtdGr9AgeHbUaQxpNqA==
X-Received: by 2002:a05:6830:1d7c:b0:6d6:4b8b:baf1 with SMTP id l28-20020a0568301d7c00b006d64b8bbaf1mr7360203oti.23.1700091474284;
        Wed, 15 Nov 2023 15:37:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c6-20020a6566c6000000b005b9083b81f0sm1486950pgw.36.2023.11.15.15.37.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 15:37:53 -0800 (PST)
Message-ID: <65555651.650a0220.e3e06.4947@mx.google.com>
Date:   Wed, 15 Nov 2023 15:37:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.7-rc1-195-g5e1e439d6801
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc1-195-g5e1e439d6801)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
1-195-g5e1e439d6801)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc1-195-g5e1e439d6801/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc1-195-g5e1e439d6801
Git Commit: 5e1e439d68019cf3ee514d29a5547ff1c962147a
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
