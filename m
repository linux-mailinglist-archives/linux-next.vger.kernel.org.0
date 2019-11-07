Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70538F35EA
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 18:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729970AbfKGRlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 12:41:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50774 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfKGRlf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 12:41:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id l17so2625915wmh.0
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 09:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Fv5EtLRoqBXCoiKcVohigxv3QfIUinCFu1I62A4KjXQ=;
        b=xABqfzwFmXycIj6Uh9iug9d4W9KbB/5YvwKzrEEhdSv0Ywa5sJhbFLcF4hoA7cM3ju
         XSZlQemdhEzLBksLSGDtGC8r3UK8Ms1luYi5ZOVa+ob4fOHRHRks+mSpICq7/LoRu5iU
         GY7RifGvAjeuj+QvaZ6wEnqTfqNd7+sH+B+lqBql5+mBe//M7dvHElFCgOuK4AP5jued
         dheSHweg8bE+e/j1KQHYeGHbKqq9GQps1A3ilQnUQvAP6M9qFhH0+sO9NDCEqr+XgYkk
         lCt6JG4QtEe33M8daq6UmcOphTcYK/f8jZz4hEqzM/I1ECMlIPd0UvChWyWxh0UoXroF
         4yZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Fv5EtLRoqBXCoiKcVohigxv3QfIUinCFu1I62A4KjXQ=;
        b=YOfcIzS3N/52BGBfE+rRoU34sR1f+6USz8STbpu9k3Zz1PzxrjkAe14xJNzczNkNbp
         2NEbEzGsfFyfGptLvAh39+XMkXTgJCKhzEorDTzerAzj6dYkz5omEgZVnFTSrgW2U9Pq
         n+zMNQv69x5VOVQ+CLEsZmtaPnaABJ1CRaJ3I7E9Ux933UKV++ecMIvISjopeQz49Yu+
         6KD2F/u2VRlPglEqXn19W0KeG3IsLXozsRTWY5kCFEVXnZbWvOqQPzD1+72UsKVq0piq
         E0lL5NnQRa8L0PYvQ4zo3tsLMsIdzJFZv9OE2wTyPb8hFAC7dP+FYTKyTuLtWYc2TYq/
         Eeyw==
X-Gm-Message-State: APjAAAVmXJsSJzfhf55yPS/SB4XlnNXgT6Irs+sOkc2XNpNn+Q3i3DcS
        iSdn0f+h5egLm972sF3NcVqNrsBWpGzMEg==
X-Google-Smtp-Source: APXvYqzIKMqBF3boGwmmtWbXD403NG43Z5p0eyCFGyGlS6rfhrDaBXiJS4PtFIeGEnU531C4ScW3LQ==
X-Received: by 2002:a1c:cc16:: with SMTP id h22mr4300805wmb.51.1573148491052;
        Thu, 07 Nov 2019 09:41:31 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t12sm2706932wrx.93.2019.11.07.09.41.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 09:41:30 -0800 (PST)
Message-ID: <5dc4574a.1c69fb81.7fde.f733@mx.google.com>
Date:   Thu, 07 Nov 2019 09:41:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191107
Subject: next/master boot: 228 boots: 58 failed, 161 passed with 8 offline,
 1 conflict (next-20191107)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 228 boots: 58 failed, 161 passed with 8 offline, 1 confli=
ct (next-20191107)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191107/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191107/

Tree: next
Branch: master
Git Describe: next-20191107
Git Commit: c68c5373c504078cc0e0edc7d5c88b47ca308144
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 24 SoC families, 26 builds out of 216

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            meson-axg-s400: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            msm8998-mtp: 1 failed lab
            mt7622-rfb1: 1 failed lab
            qcs404-evb-4k: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            sdm845-db845c: 1 failed lab
            sdm845-mtp: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        r8a7796-m3ulcb:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
