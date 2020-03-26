Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5EB193A88
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 09:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCZIOz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 04:14:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45188 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgCZIOz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 04:14:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id j10so2378207pfi.12
        for <linux-next@vger.kernel.org>; Thu, 26 Mar 2020 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FpJTSfP3g+WVgT6ItH5BjrGM1N6gc49FRyWdruBjY6E=;
        b=ZoS7f0eVb+EtYQJcssBnA8G2pPxnBpz/RGY9TwBPmelW7UqDhBkhCl0g+Mgr9HbgH5
         o5d37X+4yaidgml2Y5ArOa/bjG1PhU0W2SLD0M/hcVUMhtEO0CeQMSFJXM9tekia5vLr
         LntlMklGkeG5EkoCMnKLGbCUQI6XXTGxSXF1t9tiasRLIZ9xxumI6Dgz6Cxt8dTaVVUr
         g1W6I2RllN55kDrUjI/Y/2ryZ2YsWRUsa0x2LRAKK5P/y64v1EqSjOKcdsxPv1nb6r+v
         zpGLjWRxVbXENuFtYYzazmg3Kwu+pWZ5dFvytwJ60cRa3+8UMVeQuWkTKP+ahO9KPDiv
         9RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FpJTSfP3g+WVgT6ItH5BjrGM1N6gc49FRyWdruBjY6E=;
        b=XCQSf5ftayiM7NfMJPMWlselmyJHqpi8qdjOWfull7Gj0D/VBwsMneJE7wa7YA4rKk
         fVOMFmP/qWil5wn+SvRs6WszNhkrrEbjsLHa5SDHhFAutt28wtKTaBc+A8/gn9H0oePL
         zVz92h3lgH+0M5dxnExmCxNV0ywndd7fTIyAlEOLxyU4bQXzTjALWHDH6JxLHa2IYSqC
         DIaDQ1CgioY9hIScocG6Jt0HKSThfX8BSsTtQPg+VjYHFuaPD+4Xhr9EDFv10B05m2fr
         CuDzqMtyiqdF9io53mkVYgu2DfNGlpz5IWCNttB1MDE1/aVV7AVCE2LKIu8zRBux9P01
         VeHw==
X-Gm-Message-State: ANhLgQ1p6bySu0zD1AK4HP14jQFbrW+ujOpIIE29Cmx5qNmtWMz9AhVZ
        b09sX/yIjs85YDkb3IpHCNEUFST5ukg=
X-Google-Smtp-Source: ADFU+vvuJ2oPvTpr/hjBIW2FBwX7j8VFXOkXHKwEZSJMRt3Qo5gK9rJqXwmqPGL6Wl0JNR8BbGf/Ig==
X-Received: by 2002:a63:d84f:: with SMTP id k15mr487434pgj.137.1585210493964;
        Thu, 26 Mar 2020 01:14:53 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i6sm1058296pfe.62.2020.03.26.01.14.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:14:53 -0700 (PDT)
Message-ID: <5e7c647d.1c69fb81.b2b09.47ec@mx.google.com>
Date:   Thu, 26 Mar 2020 01:14:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-rc7-337-g9a2ad1626af6
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 216 builds: 0 failed, 216 passed,
 25 warnings (v5.6-rc7-337-g9a2ad1626af6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 216 builds: 0 failed, 216 passed, 25 warnings (v5=
.6-rc7-337-g9a2ad1626af6)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc7-337-g9a2ad1626af6/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc7-337-g9a2ad1626af6
Git Commit: 9a2ad1626af61c3d68f80b6a7301a94bd6ed0028
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
    1    /tmp/ccW1W0z4.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccW1W0z4.s:18119: Warning: using r15 results in unpredictable=
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
