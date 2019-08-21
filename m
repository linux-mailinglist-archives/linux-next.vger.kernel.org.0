Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991E097F9A
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 18:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfHUQCm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 12:02:42 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50468 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfHUQCm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2019 12:02:42 -0400
Received: by mail-wm1-f47.google.com with SMTP id v15so2693061wml.0
        for <linux-next@vger.kernel.org>; Wed, 21 Aug 2019 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qZPhtztpD+6LVdHkxJL/pQd7tsVDORk01w9wW188mBM=;
        b=X/pH/HxP8onNuP50tierEbjX6Wv4EC9O99ZT4N/E6owNFNL7bYx/QxDF++my0I+q7p
         pvAp0lCX7Oriduc7xVwmy3x2X6tYFPaBI2zuTx5JaR9cKAic/MWjZkdGPTiJVFNiGdRI
         urok9Oib1lS5oSPHQilLxW4xYaMBx3vaWLKBKntlplWJxNkoBffjlBIb3NCIL0D9W8+j
         k+6sE5laEV4dyV5Fvzbb2ipL2pycRTaqroQRIYx04kXsm10w8la1E7fSCTU3SIqNfP1t
         dWy7/3K9Bte5E1rhoNjE7iZfrpa8aidBOYBLnzlGSQFyk2GESPqNFEYmAxA3GvbmKNxi
         FvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qZPhtztpD+6LVdHkxJL/pQd7tsVDORk01w9wW188mBM=;
        b=NxEXDba2H5xoRWPfwyhn3ltJWoF+QgrSKgNm924tY0RFe5bKT0YIptR7I85ZXYOjJs
         Yf32Mb96WnUn4mT2dEUZ6B0g0Xb8UWOr51Wj4256XF6nIUXdHQbp/GEnHw4cOzoIiLQX
         FsnjhN+6ucukxnKAtwTi2imDKw7udE1mI1bW8xtejdmio21wY4AhOV4wUgNoOruVYm3A
         gBjIoOq9hW5+cItXnexpD5Ay7lK9KXSeNqI4w/PakD7ZSNWoCOm+W7uvetiwzuet6/xQ
         l4z70dOb4spnxHjurAQVD6+k842ILzEorM5lRVxi+90s4uqiDYAfKRfxRJAsci2pnVk7
         x3/g==
X-Gm-Message-State: APjAAAV9GNdstFs5iFS+jPR6cVupKa5vi1nJVxBYWXWnG9wRWf1bHCo/
        ZB1ayBCFUdLNmFAeOXxezL78h9waYEgQQw==
X-Google-Smtp-Source: APXvYqwLWwLiSCPTVcK+8MtoixbWx12xoZ38lYtsXzahaaNPz3C2FwcSDV0/j/HoaGqON+okKv3SFA==
X-Received: by 2002:a1c:a6cd:: with SMTP id p196mr806494wme.111.1566403359873;
        Wed, 21 Aug 2019 09:02:39 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n14sm68911801wra.75.2019.08.21.09.02.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 09:02:39 -0700 (PDT)
Message-ID: <5d5d6b1f.1c69fb81.a452d.1092@mx.google.com>
Date:   Wed, 21 Aug 2019 09:02:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190821
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 235 boots: 6 failed,
 201 passed with 28 offline (next-20190821)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 235 boots: 6 failed, 201 passed with 28 offline (next-201=
90821)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190821/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190821/

Tree: next
Branch: master
Git Describe: next-20190821
Git Commit: a34a6117538e0030fa8d3af8f23e591ec189a8fc
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 81 unique boards, 26 SoC families, 22 builds out of 221

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

mips:

    pistachio_defconfig:
        gcc-8
            pistachio_marduk: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-g12a-x96-max: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
