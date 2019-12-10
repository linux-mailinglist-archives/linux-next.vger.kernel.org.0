Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3E6118D22
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 16:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfLJP7U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 10:59:20 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:42430 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJP7U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 10:59:20 -0500
Received: by mail-wr1-f43.google.com with SMTP id a15so20662044wrf.9
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 07:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tdpzyzGivwWQ9M3lp3lzRhGvZ4ZeQj1RJD2Fi2o7PhQ=;
        b=vqWsd6iiI/x3W/YpXnxvmBtou0BadRHuZQjnniIMbY1gHntbXTUq9BK8kKcdYdhOo6
         R3xafP96Lcc9PCBKe9z9XYr8DXvm+N0ptWweZF+SiSXBV8kow/0J2Y1LOdjMDa/BxtUI
         Xx6zHvmvkKbzMeB0HBB+DAC+mlyxxpjvE/oxexQauuygEp1y9jl3lWfQ4mShSTlzx/aj
         zr2FR38y/fHQd2a3CiO0m9v5ERnnu7eI3VVF4LG7aIjI+tpOnivlYo7heD9AaVQ0tq2x
         b1DOsENMfG+dgC59nxgdn5CzlfKjS4JCuuFzDpT1UyD8onwwTzv80fhBPmO5AE/WPU62
         U/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tdpzyzGivwWQ9M3lp3lzRhGvZ4ZeQj1RJD2Fi2o7PhQ=;
        b=F0E9ZdbBCisX/D89XDarNliTSs4+bnqL0myzfwNojg+z/mfC0FE27/VGJ+mJq8pxvt
         ILz5q8DdbsvHAEUnJBqgBtoMuRHqHUFPO13k1HHIOsCnM4gn1I7oF5LnhTk+G175I+8J
         H109KjcI13GiMJKVqILNotPluZOVLFzfBjS8EFbUNtLqFQEV+VXhs35Mn4kPU29ljIzj
         1JZ0mWTjQyc1RtsP+wFT0buDRDwEXGAZQIzUHgOmET0oede6f+xZw2EWXS4UmEpYSC9h
         KPlkxD8YhS0HL7LovxUr66awpCWi+GGCjnvBZp40a2oD/dPWSMua086V8WCPHRhTUrNw
         AAOw==
X-Gm-Message-State: APjAAAUDtdAUpX2jMeV1QkRA6AJblB8oIP6X0Lbx8A2EEDK5E5BYTdA8
        LYLNgL5WO3fhCbkZ2B8OCFFUwTEt6p2OZg==
X-Google-Smtp-Source: APXvYqxhfciqqEYzPrEWokwl+wiTJEJmNeP/EnJah7VRAK36Qr94V0g1etD1ZFfHO552F1LWQ6BfBQ==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr4421571wrv.380.1575993557869;
        Tue, 10 Dec 2019 07:59:17 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g7sm3701959wrq.21.2019.12.10.07.59.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 07:59:17 -0800 (PST)
Message-ID: <5defc0d5.1c69fb81.b23c4.6e8a@mx.google.com>
Date:   Tue, 10 Dec 2019 07:59:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191210
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 168 boots: 22 failed, 139 passed with 6 offline,
 1 untried/unknown (next-20191210)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 168 boots: 22 failed, 139 passed with 6 offline, 1 untrie=
d/unknown (next-20191210)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191210/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191210/

Tree: next
Branch: master
Git Describe: next-20191210
Git Commit: f7768006a0d1a8580e43a406d186ad384c18bb02
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 63 unique boards, 22 SoC families, 28 builds out of 214

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20191209)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20191209)

Boot Failures Detected:

arm:
    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            da850-lcdk: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6q-sabrelite: 2 failed labs
            rk3288-veyron-jaq: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5250-arndale: 1 failed lab
            exynos5422-odroidxu3: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            imx6q-sabrelite: 2 failed labs
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
