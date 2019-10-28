Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF11E745D
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 16:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbfJ1PDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 11:03:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35785 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbfJ1PDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 11:03:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id x5so2259441wmi.0
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=f/go57JKI1ZAqP4cB/XBwAMAdUXXLU50pT1q0C9GqsY=;
        b=UEudDiDDIv+5M6anZ/Wdis/blvYwXD35nr6ALyb2pUq1XgccjIzDobw19P3Wi5+hb7
         rk5eChQSiifDS2Ir8p6yvqbmmFD14GIW7iM4IAcb6JaGArp/4i+/zcxGGMit6mUneDvf
         4bVLSwpoCxxn/rlVSUYci6dQYjE4O9c8ntnOW+EnDdPa9ZJUT+MisE72Mpy72ThyhFOo
         z4kaq/LkdBZFft3mr2BWGfOL53585+M5w9G54PQmyflwS2jVV9vsnwYA0BvVbAP5axH0
         kbaVjfLvIqRDOIaGbbeXHtWPhLZnk6HSQyww6Y7iXC90LNhh08HSKOpg19vVsQHFO07Y
         G+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=f/go57JKI1ZAqP4cB/XBwAMAdUXXLU50pT1q0C9GqsY=;
        b=fia87+TG4uiw70ku29a2/Lf+Sh1PbH0E9c7Z0NZgaoEcT5qddc3/sXPNAiMBrT0hko
         3TVUVfZgH+dIgn633UR4okiFhqsAP2XMZdkKLNCU9ET4nxS21RolosR7YExTxxJvEkAy
         nR6oLUqt9BsVLOeFky7sGXZqfj0X5EojJwS8hO3Whi/i7nt8oVgho8IW2ggtsQDlxdcP
         T0uvfEBSayB/ih/KCMH1VHsZFyBYgx61CJ9nWa0UE2Kt46WgEBBgzN8m2aaBua/F0oPD
         HSYnlJ0e2jLKII7W05/lXGwBznHd9cQaK+AmbguRre1F/RKhbHG5hBTP9y+zeMBJjytH
         mBRg==
X-Gm-Message-State: APjAAAWGatMMORz4mfjU8HgYgXcOGCoLR0Y/tSROK/EZ8Jbn/mEoSBUa
        5IZq/j+qghUt4b2sB9cFhcz+cotc10OvXw==
X-Google-Smtp-Source: APXvYqxHMf1m6uDVUNzGrKTHzY8oqymSvqNpe+G8I5mblPrYtITXOR0EaSIQ8rVQ8QeXA+XLTOvaLA==
X-Received: by 2002:a05:600c:2487:: with SMTP id 7mr408511wms.164.1572274988697;
        Mon, 28 Oct 2019 08:03:08 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d10sm8351079wme.47.2019.10.28.08.03.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 08:03:08 -0700 (PDT)
Message-ID: <5db7032c.1c69fb81.1a75.aa4e@mx.google.com>
Date:   Mon, 28 Oct 2019 08:03:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191028
X-Kernelci-Report-Type: boot
Subject: next/master boot: 257 boots: 8 failed, 237 passed with 8 offline,
 2 untried/unknown, 2 conflicts (next-20191028)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 257 boots: 8 failed, 237 passed with 8 offline, 2 untried=
/unknown, 2 conflicts (next-20191028)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191028/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191028/

Tree: next
Branch: master
Git Describe: next-20191028
Git Commit: 60c1769a45f4b6beddcc48843739d7d41b88dc1c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 26 SoC families, 28 builds out of 216

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    exynos_defconfig:
        exynos5422-odroidxu3:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

arm64:
    defconfig:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
