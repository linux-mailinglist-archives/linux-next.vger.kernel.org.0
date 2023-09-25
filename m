Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3817ACD62
	for <lists+linux-next@lfdr.de>; Mon, 25 Sep 2023 03:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjIYBDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Sep 2023 21:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjIYBDE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Sep 2023 21:03:04 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE7BC4
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 18:02:58 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5789ffc8ae0so3289616a12.0
        for <linux-next@vger.kernel.org>; Sun, 24 Sep 2023 18:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695603777; x=1696208577; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BW9VpzR30VRfKEyWQAg1gQf3Dw3i3Tuzo6wqIK3MrKU=;
        b=KYn5b0yS1Br/ORyWEEl0ES+e7NtpxKGbYME3d3OC0gywuGoZspTzV0ejQlLHYxMxQt
         BGbIkyc/8kKEg5Cvr3aP5U9U1C/dS0PR7g4bYMTT0hBFkmK/pvDXuHdTWQQZekmtd1IM
         wqRm+Sh2JlNMwP/fb+Py+s24Zhx8WEBVMLBFk+WUzAF8YP/98xGVGdk2ZlNDjnGF87fF
         S45sEEN5R5jk8CfyTr3t+6zR1S+Kgw7sZDHB33nzk3I3qT8zj7E4iiWTrV5hJs6q4ap+
         MvZKp+UEFJlBSGS1Uv82KxyDi4SCNbbYzndjScTxFpEV/7ZdZgl9zddqZOx0DXvN5xCr
         cGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695603777; x=1696208577;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW9VpzR30VRfKEyWQAg1gQf3Dw3i3Tuzo6wqIK3MrKU=;
        b=GOYxuwp0usVYUlrgC9cj5RcQUQnF3jWO9MsRKA5OLphMuaWa2Q04EX7vqahksozJBH
         fS6DdSTKIXo8bDxjJZxb3qJ8BmacQemgbL3vAO/VJOZ+VaWcuNhc2QP9bWG9K59jaC5s
         Cts6xBkB9NQoaDgCNFL7n82+1GK6ccXTYo41/HfMzXlA+CLZBO+uU8ByoigS6FBcqL5c
         NQxR/3R298lsFiwKCm2isz4EuKQqn0PmoMyjjbBgST2eNKp0k+OTpwKN2O4nyJBFYYFn
         dhd6HVCDHxKTcPG00RSRsdCy3hcQKqLyxrRhx74UP1Bl9y9NRA/hOT1VLqITv5WSidEo
         AhcA==
X-Gm-Message-State: AOJu0YyVd45BXg5Ux6MEfVPUwwX2QmqJIMNPtCMoZwv/QcNYzGHhIpYB
        1vUkN2kpJayDl2cdpgY6rgwjsxHPlpWTvS2TbhGaaw==
X-Google-Smtp-Source: AGHT+IGlNWKikKez1uFLSlZS9bay3f4j1CbBWXE7MG0Zmxf4chk5Tf2pq9zntDyvW3arG9PcBRue9g==
X-Received: by 2002:a05:6a20:3950:b0:15e:bb88:b771 with SMTP id r16-20020a056a20395000b0015ebb88b771mr1298436pzg.37.1695603777020;
        Sun, 24 Sep 2023 18:02:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090ace8400b0027498485107sm8493505pju.12.2023.09.24.18.02.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 18:02:56 -0700 (PDT)
Message-ID: <6510dc40.170a0220.edc06.37a6@mx.google.com>
Date:   Sun, 24 Sep 2023 18:02:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc3-217-geba2d8a9dfc5
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc3-217-geba2d8a9dfc5)
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
3-217-geba2d8a9dfc5)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc3-217-geba2d8a9dfc5/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc3-217-geba2d8a9dfc5
Git Commit: eba2d8a9dfc51f4f4c72ff31e43064a502807453
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
