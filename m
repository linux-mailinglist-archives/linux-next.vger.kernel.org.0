Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 010BD19E4B9
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 13:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgDDLoj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 07:44:39 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:37005 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgDDLoi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 4 Apr 2020 07:44:38 -0400
Received: by mail-pj1-f47.google.com with SMTP id k3so4256463pjj.2
        for <linux-next@vger.kernel.org>; Sat, 04 Apr 2020 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uqyJ/8pHJNIYKpU9UAjeb1pxnaNVvQu4tpXNP+6jUTQ=;
        b=xWGzB7AqOtnWNj/cQpKmqv42w91dRwJtsVJO/ba+AEoV70yB5F0XbXJAVdvlFduonV
         IFx4K58Fpvxr5kFh48/ubRpfLSpya5JpeZvxWK3Ey0VEizfcharEogKueiyviU4IDZye
         uHByAO7O67LrvZnPwJipQAvvncm/1pYkyywAKWFlmRySjVzPbP8sOss4xr98w3hkemP5
         rvE5pSSnJzpdAQtsSRcEmsmq9Z3rCQ5pCmtPVUyEGLQzyy1Bl/aN7rlMVAvSaTZ9UUIY
         9gmNuF3llclil3PWsHT+ZXfjLndmoZUqUtfc6HWZoLSCXE+orEr14AVjlcSrTeK8ZZXb
         LRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uqyJ/8pHJNIYKpU9UAjeb1pxnaNVvQu4tpXNP+6jUTQ=;
        b=YFlnoXGSaUGu/YUWpF5mhYPZBEH/wUjcmQ/YMTb4zIsuiXgCZqI95IO/NAcvVZ5bnH
         HHm9ZdrVjZOs+R1+gE/MhU4DYxoLSi6aJWsqDKKJkMLRvMRjdWjyOgn+avjqBvp1I9uT
         HMqdCNO+ggw+T6X/rg49ndB8u27SBfQHuC1/8uWph1UPiSEDsFN15bPew+1E7LEbA2mG
         PiMP/XXCol66+67+NDwDSlYnrdiqDjhIX4MKCliYNSK8L1goT8iBawvLMs9xoEHEjOKo
         FCssrI2bzMOgc7a2oYQc6DuFYJ/Z4Nfq3acpZRpymOP2vJycUiDupDC1TEWfobkkyD9R
         6afg==
X-Gm-Message-State: AGi0PubjUNiCv3Si7EB4Xmc1v1xxhOC2BaTFNtKq+eX5W9w7TEQvEi89
        mUoa86ZCfY7Ri2GPcJar26ZAVUm+pO8=
X-Google-Smtp-Source: APiQypK2xPXVSqkFz0ZtB0qvIpjj7MZcKIgNLz1/CBTQ1/QSiadToxdHkyYvIAPR6fjacUhnWJh+5A==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id kb8mr15030907pjb.79.1586000676168;
        Sat, 04 Apr 2020 04:44:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z8sm7785587pju.33.2020.04.04.04.44.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 04:44:35 -0700 (PDT)
Message-ID: <5e887323.1c69fb81.f568.4e79@mx.google.com>
Date:   Sat, 04 Apr 2020 04:44:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200404
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 217 boots: 4 failed, 206 passed with 4 offline,
 3 untried/unknown (next-20200404)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 217 boots: 4 failed, 206 passed with 4 offline, 3 untried=
/unknown (next-20200404)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200404/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200404/

Tree: next
Branch: master
Git Describe: next-20200404
Git Commit: dff79597431045a775f2e5d4d9de31bfa0d32a34
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 22 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200403)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 46 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200403)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200403)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200403)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200403)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 7 days (last pass: next-2=
0200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
