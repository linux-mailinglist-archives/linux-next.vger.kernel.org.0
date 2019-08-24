Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4F79BB6E
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2019 05:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfHXDaZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 23:30:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50776 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfHXDaZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2019 23:30:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so10516843wml.0
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VfcGy8yRqxJ+vW5QCY3rgHCR0yNueAwLbVjBXwdGyGM=;
        b=AAREt9Ehp0acEyzxSCV9FpEkTtoES846Bu8Ba4EsOAlbVd3q3FILTBZNqMEL+8o3m5
         8u63jJanfnA2a0oJWyMtQ4a2lkPDSe1Dvh5QIySH7jAyzhVPV+EqFg5S8pnKOupBl+0A
         JCM6Ol5zQb1LyeKYXGGIw65cQepDqmTa3LMLJLKXBl1j1ppn0K5V5XJkcabfpVNNO3XZ
         jE2jVWpphYm6SwgwJypeq7wBITYlsN2uco28DsPhSWRlPkT+WhFG+AD/1z9AF3ruTRPc
         e11WzYaSspC4HvqKo89+0GlvOSB6W2OsLOaEHOu3O3/czEVAl+0yp+Nwl4Tdjg1yEHoA
         xu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VfcGy8yRqxJ+vW5QCY3rgHCR0yNueAwLbVjBXwdGyGM=;
        b=ZWRYRHGmpt2dgtxw85CTaUqOxihSP6hG/3FgxigRorcDsglaKDp7cO+jVgrhjeU9ZT
         1heDemJ8dbcsZV6zvpVc29Dl3r5HyjczcoNbfPpX+djhl/FySd3XncbmztbI9+K3iHLQ
         f7qnjCOGNy38dkanYYasjA7ZPk/slzDo1LSyYEodFL7sQ/vivW4z6MGRc0bIAd2/nZOg
         fxeGOB3W943BektTW03Te2mpUFVrQbyP+YsNapcQ9attsM2yvk0f9EW01Oqs/dRc1FuE
         8/6m/Q//1ss7HOcYWn1WuYor9eyu7mIkpHRV7uEfmKFLpsCzmJKuHhPqBy6EKDck6df7
         Lh8g==
X-Gm-Message-State: APjAAAXm9tz2rojrfcVWFx37d4x+kMY0SuLhEtgsqywqZTxv+dznxB9V
        6HHEDVNCgCyHbTtfUrax88iltKd6JlU2BQ==
X-Google-Smtp-Source: APXvYqwKPuDQs9zZrQ3tk+6ly3XbVnsL0UYxJ7ts5T3hXxRJTlEBYIpikS96/HMMjhUFIWot5093/A==
X-Received: by 2002:a05:600c:254e:: with SMTP id e14mr9083979wma.150.1566617422862;
        Fri, 23 Aug 2019 20:30:22 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 25sm3696841wmi.40.2019.08.23.20.30.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 20:30:22 -0700 (PDT)
Message-ID: <5d60af4e.1c69fb81.20d84.fba4@mx.google.com>
Date:   Fri, 23 Aug 2019 20:30:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190823
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 259 boots: 5 failed, 236 passed with 15 offline,
 3 conflicts (next-20190823)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 259 boots: 5 failed, 236 passed with 15 offline, 3 confli=
cts (next-20190823)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190823/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190823/

Tree: next
Branch: master
Git Describe: next-20190823
Git Commit: 9733a7c62c66722bcfdb1a6fe4d35c497312d59a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 27 SoC families, 22 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    omap2plus_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

    multi_v7_defconfig:
        am57xx-beagle-x15:
            lab-drue: PASS (gcc-8)
            lab-linaro-lkft: FAIL (gcc-8)

    sama5_defconfig:
        at91-sama5d4_xplained:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
