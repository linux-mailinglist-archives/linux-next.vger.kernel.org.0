Return-Path: <linux-next+bounces-395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D69B8130DD
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 14:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D9E1F22105
	for <lists+linux-next@lfdr.de>; Thu, 14 Dec 2023 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1074D5A1;
	Thu, 14 Dec 2023 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="sZ+OlqNb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC7A12E
	for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 05:03:39 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so7604768b3a.2
        for <linux-next@vger.kernel.org>; Thu, 14 Dec 2023 05:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702559019; x=1703163819; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0WonM62SiShGERtO/LXJD2NopMnD4vpcu4ixfmak8XE=;
        b=sZ+OlqNbNKfjLX+UKJ6ySRdxK6FyVCs2R+bVeHwFVJTEuRJQ6woW/DaDAuhDlK5XLi
         kiCSysDj/FiC7mzDqHt7L30FxOoPZagFx/VMR0JexQyfjHXGps38ylG6Yxn5gNU4icX8
         ghweMTOrorKhZdt0LkVEtcHVrWJxNd0RD/OXytKbZSmixYaWfMZlibS65r2ythi15QAQ
         IS1AR9/ytjw0Qo8acHu6ZEXWa2b0+hUVVQXPJKfpDWxAtKTU/JlT1hY13A6dByvkzQae
         SPTmC7zxNT/9tlWeqbK+whzFPz1XzjA7tMJsnlyjp9kZ+XU1wu4elnkQx2JB0BUhoEq6
         7Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559019; x=1703163819;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WonM62SiShGERtO/LXJD2NopMnD4vpcu4ixfmak8XE=;
        b=bLcWLulIMe61cmLHR+SUE77z+DUfMN9uDfjrtV/yxhmuPGyK09wtCZX5tlqzP7aOgq
         o8ZI6tLysD1qNkxlz+dIh7vVztaMxnIjJOltJVeS8Bswed6HZzxcOM2Ck9J5V6ytKjO9
         RijDp36HhEosGCQTV9GaH9LPocXShhnrfmJeCkqN2k9kmks3Xh+jsab/YgvjDU9usa4I
         Cunw5sHouczkVYzDIex+BHIrMH9Ke/g8rq2WRE7DLCK0ExAJdyV4EHY2uKxqERQoe5jb
         Nv4OauHTOlinW8OPuZr2GWwLAGgi6qLuLNpSxNO5KEcp4lMbWh1LCffeF1k01SJwK7xx
         Dbqg==
X-Gm-Message-State: AOJu0Ywe8d6rUiOePWX3qHcMWpu/VBkSWmq4hAmMwNjhrND7iKqiap0h
	58sg2wbWwtlwyQl6msVpK56O72Gq7LBM89fYS7AX4A==
X-Google-Smtp-Source: AGHT+IEGLdlskTcrZM5aNyULmjR4KuDnvA1N9akrg5FxvbaPBp1ukl/RypVjY2MbrPENo/fMHVR9Lg==
X-Received: by 2002:a05:6a20:2583:b0:18c:d38:9169 with SMTP id k3-20020a056a20258300b0018c0d389169mr11105316pzd.21.1702559018319;
        Thu, 14 Dec 2023 05:03:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id o17-20020a656151000000b005c2420fb198sm10082918pgv.37.2023.12.14.05.03.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:03:37 -0800 (PST)
Message-ID: <657afd29.650a0220.485b3.c5cd@mx.google.com>
Date: Thu, 14 Dec 2023 05:03:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.7-rc5-272-gc68cf4cd434e0
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.7-rc5-272-gc68cf4cd434e0)
To: linux-next@vger.kernel.org
From: "kernelci.org bot" <bot@kernelci.org>

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.7-rc=
5-272-gc68cf4cd434e0)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.7-rc5-272-gc68cf4cd434e0/

Tree: next
Branch: pending-fixes
Git Describe: v6.7-rc5-272-gc68cf4cd434e0
Git Commit: c68cf4cd434e0a4a7d1d4327a11081226810995e
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

