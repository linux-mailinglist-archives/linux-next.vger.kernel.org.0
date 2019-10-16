Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B983D8715
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2019 06:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfJPD7v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 23:59:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52375 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfJPD7p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 23:59:45 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so1193358wmh.2
        for <linux-next@vger.kernel.org>; Tue, 15 Oct 2019 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Mc4pUu0opSwmQ1fDKrxrb+uwx9xL9AGOKiADytT27kI=;
        b=vCx7mcSVwqEbnuQ6qmLJPZaFtUlgps/Tc3RNXmx0DHseuC3S5B4X4uvwfV/aq4xoqq
         bwJQDzm/ExxzyI1cLC+Hh+wwmEYBuG3nkTYSqZ7BSVaYbPqa2Eg1miwsaUIzSbGYmSMr
         p0n7SIVFfhb/AIqim1l0kiSRBtcXzXE0mT73CyNnyiiCBh4EtjYQDscJ8+A5KrB6TN+w
         jtOb1DOMieze1McYLUDXtl8QRLtZubx0DIqCk0vo4eYH+sq8JIISxBQtO1vNHXbTU0We
         UKYOApkwWB/PmzGWCXOaHMELzB8zfacxBT207ZxMmrYnBkBO028QB84CvEXoo9cqQmJu
         7YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Mc4pUu0opSwmQ1fDKrxrb+uwx9xL9AGOKiADytT27kI=;
        b=pBcMedO1KBc+nmI8yhLCnXgchyVYicC5Tcl5s79+GPVtQHuLuChGhFtjKEvLjYJyWA
         olhw9+3bor/CG6U5vebEhvyEV7smLNr8kx2q2RaqKEyEMRLme/H+PG70rIpdC4qVKS2O
         /TFhaOdTDYQzpafZ/kt8RV97sN9TYTRhsAPRAvxvjmVzkixap0qFD125heMZQk+w6wAj
         hSpXtSbwkKr6CMgqOiiNsEwWDiVQiZkVnlInvGcPlTb6uTNZXpE6+Q4AW76DMEsYQM7p
         4DQbj9pKFUxfJ2SzLRTMYWGXGN29smlsfj6ADXHgUQByFaGZAX8YccnsBfxCpngEtVuk
         un9g==
X-Gm-Message-State: APjAAAXSMuSoHCOEJd2FrGfMIKYzOvTA1kqDcsetBAgy08UQFUtecGh3
        CR1OrQNB/9SMlYuV3fgwqBHKJOiY79Vibg==
X-Google-Smtp-Source: APXvYqztmTKqhKn21FlBCyQZc1iBSKBU3bkG0k75xBKv5Tfi7TFoJMOpysyFiMDO6UrhDfQd38Tzcw==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr1547575wmc.78.1571198381464;
        Tue, 15 Oct 2019 20:59:41 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t10sm999745wrw.23.2019.10.15.20.59.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 20:59:40 -0700 (PDT)
Message-ID: <5da695ac.1c69fb81.75441.48c7@mx.google.com>
Date:   Tue, 15 Oct 2019 20:59:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-311-gce15fc3fc1ae
Subject: next/pending-fixes boot: 281 boots: 9 failed,
 262 passed with 6 offline, 4 untried/unknown (v5.4-rc3-311-gce15fc3fc1ae)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 281 boots: 9 failed, 262 passed with 6 offline, 4 =
untried/unknown (v5.4-rc3-311-gce15fc3fc1ae)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc3-311-gce15fc3fc1ae/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc3-311-gce15fc3fc1ae/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc3-311-gce15fc3fc1ae
Git Commit: ce15fc3fc1ae8839fd1406206584a9f0697cd36d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 25 SoC families, 28 builds out of 215

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

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

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
