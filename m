Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A9F784FC5
	for <lists+linux-next@lfdr.de>; Wed, 23 Aug 2023 07:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjHWFDv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Aug 2023 01:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjHWFDv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 01:03:51 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09223E4A
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 22:03:49 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf55a81eeaso23194815ad.0
        for <linux-next@vger.kernel.org>; Tue, 22 Aug 2023 22:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1692767028; x=1693371828;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W6SwhCThWxt/Ts78Pbm1eCo75Ahm0aLRAx4sOgCCFgE=;
        b=FxsqQa2WHL4mrA+f06wx6qs7L/6bjaVATQzSU/IKmmDPwDWu80WjOeYCX4RoQJFtTQ
         iTNVDcI+C0aJz4lNN/T9+L++nKoFNh9AZS7hmGiw02mHYriuz1RVWr+Vh1f/2RsWwGH6
         GitwXZLcHlbOnLFmWPx76cv96Ii219h/0b0+J4Xx3q/3FlJjrqRMLh8fRrB1qmmJozzO
         4T5RiFl7blTFm7MI2uOW/uz7+0T3puh69UQC1v4kJjAwAHyo8rsPOdzGQrXyJ2KGgvl4
         Cs2aeVSHqOWDvH7YtMBb5qU1+hDX66sY9X8glubdUG9qm32/y9Z1vNusJspu+TmhKkUx
         bIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692767028; x=1693371828;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6SwhCThWxt/Ts78Pbm1eCo75Ahm0aLRAx4sOgCCFgE=;
        b=R3NPl96rFA+UsLsissjm5/1GJRBS9FHZG60gKU42qIexPlq3shaP12Ny8fFRhLTIo+
         Fw6NXalhhkl7ChgDYNMDCxpNmBzPK5gksOUXde7QUTw/uey9TxXR4bZe7xkFY8UOZsIM
         tksSpCj4b3+esuT9FY38LurfYHDv42zmlXGlCf6hqihKmSvmGjZTpPTiQueBvbqbRwT7
         3QG7RiSR8P2XJa3XQ4THCMMnEZqS0K8y3NgJgg8v9P6j0dN1qosc0y74WJ5elzMbipr+
         /Tr0vmP+5jtBo3NJNO10IdXLk/v0dPWJ0afD61o5jbr9fmOi9jH0e2xMGNbqX1gJln16
         RqJA==
X-Gm-Message-State: AOJu0YyKhLSpERcYK9YnMb7r4p5HhNmEeXWaHJaHqD1oepB7Br5ffmR8
        +IzW03VjtAWlwL9xPAuHtLx7ipWQMuUpAuMVy3Q=
X-Google-Smtp-Source: AGHT+IFhykj7j3dI/gl1b4tClY4Z6P9jqQqINjyoOCyXiwzaSaC0tDpiX/OAkpD+IrdFZg6F+r38kQ==
X-Received: by 2002:a17:902:c1c4:b0:1bc:73bf:304c with SMTP id c4-20020a170902c1c400b001bc73bf304cmr8871739plc.48.1692767027976;
        Tue, 22 Aug 2023 22:03:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m13-20020a170902db0d00b001b8b45b177esm9934515plx.274.2023.08.22.22.03.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 22:03:46 -0700 (PDT)
Message-ID: <64e59332.170a0220.fe3ba.37ea@mx.google.com>
Date:   Tue, 22 Aug 2023 22:03:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.5-rc7-148-g8221b76fd7de
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.5-rc7-148-g8221b76fd7de)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.5-rc=
7-148-g8221b76fd7de)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc7-148-g8221b76fd7de/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc7-148-g8221b76fd7de
Git Commit: 8221b76fd7defd16b9af1c0a505acbdcbe32e2f1
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
