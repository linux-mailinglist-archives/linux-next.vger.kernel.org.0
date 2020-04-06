Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD35419F39A
	for <lists+linux-next@lfdr.de>; Mon,  6 Apr 2020 12:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgDFKfL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Apr 2020 06:35:11 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:34868 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgDFKfL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2020 06:35:11 -0400
Received: by mail-pl1-f175.google.com with SMTP id c12so5751332plz.2
        for <linux-next@vger.kernel.org>; Mon, 06 Apr 2020 03:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fDlsOKo2HS4YolopRHTCnAFLludI+daFEkBWGz1IIp8=;
        b=VGE5HBCU6o+AWYxvGQSxZ/K0Ab56AQX1t6i/rt8XTG24sjHEjf1VGQ5rx9EzHX6OyR
         w+g2/x4pkS9IRkA7zMilCBc6MefPa3qcUmGZbcOhlSuoCIPO3Kc65jRsbjaOg7SJaXkU
         /yisBvbDNZynMkj8JcW3syer3PxvybrHThBnjJZANyukkH8FsNvR3Ji8HEwSNcz0tjEI
         dTxBd+OQq3v2gEy0WGNJuESSS0edxDzvppEWw4djBYHSM4V4zEUJuG52aRFEVXw9FmW0
         SISulNRSgeeNNWgkkc2bZOZsPKntgZKOysX0kVL6mPkwDUbai4SA77g0fuL6HX01I1dV
         R2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fDlsOKo2HS4YolopRHTCnAFLludI+daFEkBWGz1IIp8=;
        b=cexshR7cqjuVP99e3ddZkcTbgMUpooWS6QUbUaPTM7Ii24gmC+jotOEkBmPzYkga0H
         1sYOEDuXTbkjYp+RqtdxRGQKprvtl/k9FidybgRgJ2bZDWhlLEr0GRwKferQr6sUCEJG
         zZsifum+fRU/gP965k4xtOa9wPAsnc9z9Bl2DwEst+tvAYuZfhItWAoLOMglh/83Vut6
         OXKHXNum+Tk9wDO3wdamQpniT4/ixjZpOM8fa3JO0peGTO65f0sqTvrTF29cxG5gKJnU
         MlKWL6vL4Jx51ohfJGJvpxhQ+pNy3yN7iR2DcpfoRCAYjQej8OTSlVYCrZl6iVmkXBB5
         RZXw==
X-Gm-Message-State: AGi0PubJ7Crl7O+7FYc29z4ss3HGttCOIahaODv97AWitEw2OmJR6frC
        daLexKGWTBN9bhqcFv5kqVZhGJKNXKk=
X-Google-Smtp-Source: APiQypKXX2lWdLOz1Wv0kvQ1DhM4luU/ObJaR4N3b5LhTFnCUNrMOjUXIk6zhtjbQRaYqYrBIJDaAw==
X-Received: by 2002:a17:902:b707:: with SMTP id d7mr9783311pls.297.1586169309272;
        Mon, 06 Apr 2020 03:35:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s9sm11671526pjr.5.2020.04.06.03.35.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 03:35:08 -0700 (PDT)
Message-ID: <5e8b05dc.1c69fb81.fae42.3939@mx.google.com>
Date:   Mon, 06 Apr 2020 03:35:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200406
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 271 boots: 8 failed, 252 passed with 4 offline,
 7 untried/unknown (next-20200406)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 271 boots: 8 failed, 252 passed with 4 offline, 7 untried=
/unknown (next-20200406)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200406/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200406/

Tree: next
Branch: master
Git Describe: next-20200406
Git Commit: b2e2a818a01717ba15c74fd355f76822b81a95f6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 16 days (last pass: next-2020031=
9 - first fail: next-20200320)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 48 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200405)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200405)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200405)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200405)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200405)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200405)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: failing since 1 day (last pass: next-20200404 -=
 first fail: next-20200405)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200405)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200405)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 9 days (last pass: next-2=
0200326 - first fail: next-20200327)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab

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
