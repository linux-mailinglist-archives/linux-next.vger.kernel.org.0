Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 075C71970FE
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 01:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbgC2XB0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 19:01:26 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:35985 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbgC2XBZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Mar 2020 19:01:25 -0400
Received: by mail-pj1-f66.google.com with SMTP id nu11so6518817pjb.1
        for <linux-next@vger.kernel.org>; Sun, 29 Mar 2020 16:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UbizUVPVXpGyA3BsXl6Vd43AqsSRySswa+EaMqUJmJI=;
        b=eCj6l69GIn2zfGol9w2eRh/FFh6puaHHX4Fbpca445P0wJe6Gr4q2YmSA6yojwXzhX
         D7EkApD42dNhPAajprO6uz0Lf9EGaaWHOTSKdUi7TgAUl0Tt70DfTKS0aTB1DBsSGsHB
         FGIvdmQ11ZslacYOR5QDkvbw5/BFYycQgSq8AbGWDRf+rRgRJmGRODHrBxei6u9VnAcj
         DlPhmL246/D/0E4lnmtB6PCkLRIhmx+DykxH8LF9eSc91Y70CIseoeXzFBgKmSkEDQLQ
         rv/t8/DcmUSMNmKUklzoNR19AB5tSXve1wr2+ssAj3F0kPvIAggfkh23U1BK/d7VgO55
         Rurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UbizUVPVXpGyA3BsXl6Vd43AqsSRySswa+EaMqUJmJI=;
        b=PlpU3aVx/8ThELeqHInBVbqMgMDrwC3KvMHaZQmbljF6uNNHWMKUhKaXpwZGdw+QKC
         8Kt9qFmPWtCabn8Ee4A1OLJjejqQib3uGV+n376VsjTVmvx043gExOGzMAiQWxpPvWC2
         ZS5LujPHyPda26GKCzaosY75hhhujmt2YEmeadTEKpTu3e3OJJZZFKcFtjCu+Dd6Uw8b
         J4ZzqDfZtoK/bjlsGCTKROmv+6KiPX8bvWxUePshKya+P9fJy4GoVpI348q5RNDuDKLT
         ChyRLEUNv5ck3vDrCU317Fs87qy1fZd7sb5yY+G6eWtUQyprp7obV4wq12TnlhLRe2VA
         L3ig==
X-Gm-Message-State: ANhLgQ0R+KySfbr5J/xjWQJPPDlOab7TGfeZAKeWSmO9Yz1fpa+lgcaU
        ckd9LuHJ3ovgXJMA4U6xH1EDqcUH6AQ=
X-Google-Smtp-Source: ADFU+vtG2CFynrm37xPrm5sFFHZwwRZJqxo/oElwoMGeqWw5zvxBqhHCu9+t9N79Tp36tj8ZXP9RsQ==
X-Received: by 2002:a17:90a:30c7:: with SMTP id h65mr13242286pjb.44.1585522884216;
        Sun, 29 Mar 2020 16:01:24 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o11sm8253814pgh.78.2020.03.29.16.01.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 16:01:23 -0700 (PDT)
Message-ID: <5e8128c3.1c69fb81.52c43.4e56@mx.google.com>
Date:   Sun, 29 Mar 2020 16:01:23 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-404-gbcaebd8567a2
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 216 builds: 0 failed, 216 passed,
 25 warnings (v5.6-rc7-404-gbcaebd8567a2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 216 builds: 0 failed, 216 passed, 25 warnings (v5=
.6-rc7-404-gbcaebd8567a2)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-404-gbcaebd8567a2/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-404-gbcaebd8567a2
Git Commit: bcaebd8567a2ab4f4c551d5c503004a2059e2ac5
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
    1    /tmp/ccNrnfBO.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccNrnfBO.s:18119: Warning: using r15 results in unpredictable=
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
