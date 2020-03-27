Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0923A1951D6
	for <lists+linux-next@lfdr.de>; Fri, 27 Mar 2020 08:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgC0HVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Mar 2020 03:21:55 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38356 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgC0HVz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2020 03:21:55 -0400
Received: by mail-pl1-f194.google.com with SMTP id w3so3133644plz.5
        for <linux-next@vger.kernel.org>; Fri, 27 Mar 2020 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8JJApL8ZuQ3qdajlUs1w/Mk8/YMkkptAtkD+K/QXKdo=;
        b=CFt/rWyKg9I0V8yyRFg4gOknMgiS/9nVACgRhW3ghNS9HO25B1wR+zbdFtKzwGfg/D
         v+tSDMZB7Gf7zPsNWNyCa9o9fdnMwwhwauegxdTxJD+bwLWwc4iJNGiDH0+HqBS3MdlF
         u1+dZ0eRYbgE0EWA9DtGdmscQoqjJagY2qCHOoGIPRiPxeB7peOcLw2yn9MV2/zNHfOA
         DDexjN6+CU3TEWXGodLRVDiVSUOnXTP3oVyiHiAok9J2SHLLC2N2dmmMVPpl2+551eZx
         BWMBVxYp51Tz1t3dWBobcHsCTmtHlv4aL+g2EEn4DX1BnVsAIGkTZspmZZDIPECmRgFN
         BMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8JJApL8ZuQ3qdajlUs1w/Mk8/YMkkptAtkD+K/QXKdo=;
        b=UL6Epr8PWiASgkfX5390HcR9K8QQ3uUyVgIHE9j8ISsWdUrf3Y/LHZ1s3Lbr4REQ3N
         rqVoqq1FcR5p8LnFVeQgQbpTKjltKNC8YVDeeLTYRa1KvM1pYakTzN3EV3b4JQjkaYFb
         SRiFpWbPOb094LzCVliWNcVE3yHBly6ljTFA4WlvRQFqhbo5Cjibjd0q/Jkb2qBdztps
         cFA+IzMlFd9Rkapy7SnWUN4NBtuI4EnhwRPov7+w1AG9RyE9GXJUG38YT628QPJgRk44
         NSCFMgaX+8NG1QYd4bOKVrha1RCmGVgb6ul02uslXZDloybwiz4vhE3ikriO+6HCJPml
         t8jw==
X-Gm-Message-State: ANhLgQ3TTOSQpWPw2TsTl3NM8iArP8p1zX09nKm7tn+d2zDf+LSEINiF
        f4awGHXrLTNmi0YMQ4o1qbgqgsbVsAQ=
X-Google-Smtp-Source: ADFU+vvphyHwKQg5lmCeRlaKIG3Rj2pqk2nSEwDkZZBmo/ICFDTnZdeyfUouXHrG+La/4rL6vGMGZQ==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr4460527pjn.8.1585293712192;
        Fri, 27 Mar 2020 00:21:52 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e187sm3255956pfe.143.2020.03.27.00.21.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 00:21:50 -0700 (PDT)
Message-ID: <5e7da98e.1c69fb81.45baa.c845@mx.google.com>
Date:   Fri, 27 Mar 2020 00:21:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-360-g4dc51f5a7118
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 216 builds: 0 failed, 216 passed,
 25 warnings (v5.6-rc7-360-g4dc51f5a7118)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 216 builds: 0 failed, 216 passed, 25 warnings (v5=
.6-rc7-360-g4dc51f5a7118)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-360-g4dc51f5a7118/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-360-g4dc51f5a7118
Git Commit: 4dc51f5a71180a89d86e20fe598316356568c951
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:

arm:
    allmodconfig (gcc-8): 16 warnings
    multi_v7_defconfig (gcc-8): 1 warning

i386:

mips:
    malta_qemu_32r6_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning


Warnings summary:

    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    /tmp/ccKJcP7D.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccKJcP7D.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1160:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: vmlinux.o(.text.unlikely+0x39c8): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3674): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

---
For more info write to <info@kernelci.org>
