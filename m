Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CF9F01AD
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 16:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfKEPka (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 10:40:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40024 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfKEPka (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 10:40:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id i10so1241699wrs.7
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 07:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8EQHSCHzeTppNJWagKtNfL+Wjt7VOi672QSzkFOPgzk=;
        b=bqxgNxKQP9dVIp29K9KOgkPRwd016UOcNA8oXeTJSlXc8WYY5T4NFwh4/H8rdfuqze
         QuD5KJOh8nKZZQKlNd/vpV3QNkpUco+mxkTjVfsj8lzuiPa5EJieHeGkwMNxibBE0dD0
         Y17hZLaZIMR1AENF/Z8vkODTKZ5nV6wEAuoL8Le+JZoHYArqPPFJ/v4pDhMh3BnIzCR1
         N8DawrlEetFeUKiK0P/LPOWeMjUSFCZBtPh6spuLIxK9vcPTSL5X+/W0U7FvD6grZIFq
         b4BbizahC1Wp8dHDPgwowx0r4lEwQaSmfYFExxJGlLqO4b3Q5+M4NsNlFzv9dxDx7C8Z
         qwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8EQHSCHzeTppNJWagKtNfL+Wjt7VOi672QSzkFOPgzk=;
        b=r8tU/pAdzL3uVO9IkVCUKe9+lHrGauevdTPI96BiSjr6FYnKD/uF5QgB2SSo5MRnN0
         NM4TZFGvpY6FuJVh4Lc2yKDum0d4a7DOkLWaTE/0bbkCSvFYtLJQUTdJYLvzdl3+kXUB
         xs5zEAgdZX7vmncTDpwcAdsuSF4tiCqsPfwmgOY8wsTC3G6m+7XR2qi93m9RxKBeY7d+
         3bGLfXZ46QbMPJ0MYG7Mqb39rpqD0OeY68AF8YL6r1x6yct7xPOXEaXjramyJLr3pk/C
         9tIdHLJ7uvTyKMDOFt3QdYUmB8f2Uc0hBqiiZnkbdVgJJyIqwCmi73m/dUjDkhvjYAaf
         qVVw==
X-Gm-Message-State: APjAAAVFZDFFaVA0vMaMwLtVYSTzGYNQdH/ghDfKB5SJmCSTjuQie9Hn
        5op1oNBSHlBwgxp22ZcaJTW47LNGQp3oEQ==
X-Google-Smtp-Source: APXvYqzlZ0ww+HpVd/VkmpqepHiVxxEOGiSfqNdAmyaoZYGTDSIaNmSoXpZkvupgODE3ztjdtPdj5g==
X-Received: by 2002:adf:da42:: with SMTP id r2mr6113326wrl.383.1572968428367;
        Tue, 05 Nov 2019 07:40:28 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t13sm14342469wrr.88.2019.11.05.07.40.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 07:40:27 -0800 (PST)
Message-ID: <5dc197eb.1c69fb81.c2292.498f@mx.google.com>
Date:   Tue, 05 Nov 2019 07:40:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191105
Subject: next/master boot: 142 boots: 34 failed,
 101 passed with 7 offline (next-20191105)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 142 boots: 34 failed, 101 passed with 7 offline (next-201=
91105)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191105/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191105/

Tree: next
Branch: master
Git Describe: next-20191105
Git Commit: 51309b9d73f5de2d8cba2c850df0c3b5d9125bee
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 65 unique boards, 22 SoC families, 25 builds out of 216

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

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

---
For more info write to <info@kernelci.org>
