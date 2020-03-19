Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDD518ABB7
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 05:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgCSEWu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 00:22:50 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:40694 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgCSEWu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2020 00:22:50 -0400
Received: by mail-pg1-f173.google.com with SMTP id t24so523833pgj.7
        for <linux-next@vger.kernel.org>; Wed, 18 Mar 2020 21:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5fynDUultTpiU/d6r/q1D9QPVS98JeaGRFOc8zAU0cE=;
        b=Ykvy53+7OWz++G8fkQs1tx1S1yRLkG3wF2g29o1Q7tJ39FwT1RHLq1XegQFXdAK7m5
         kYrFkHBkTzrt+OZQT4rQSt39QwlDb2xctPwvETFNIX71OomtBacoRgC/D9ahl3ErKnMH
         kTKmuqScatDg56rEP5PBqRLjQxvrgukj0I5BMz3jZ9aSde8/M9QvUA9HjeoC1EKRJtV3
         q8/Lb/yPRdfyV7KXCCF4gnqGH0u8FVbFSvjj6HlUxZu9qxuWALlQM/BkqHRM4HQ9uUZ6
         SsC3b+9uVmx8xvPsyJmaL3ZLrHl4AEXFNhOtX72RJGO+EvtFc8bdk75eLUga3hDnzSID
         mqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5fynDUultTpiU/d6r/q1D9QPVS98JeaGRFOc8zAU0cE=;
        b=SySvUAPfACj/+JwHIiVVg+Xm3SKVxx5hOSXdqsE6/k0YMFlLBCiAQi98771/9/EfwE
         z1JTdv5Wqf28fr+iBxhamdXjwQrt+tZaYmYQQLym5bk80fPfi/oBKJCglaqZhNjc8vPb
         UQTVHY7107RvqXu7bY4NY9DPsrnfvTNsNbcq5BfZE4Tbv+gwHY7BjtX/Vu+fpOPZ1rIt
         uIQRyOoB90YHxhJyoFbhzDyP3ri+WaCQG/y5scDik/N1nd8tYFo/gMqMAhHL1C08bO/j
         vBHXP5V2wRrRsLhhP45qyjBGv03nFesinx65c1IInIoTaTqrjJuPlQpP5lkj7gjCwU4F
         YGGA==
X-Gm-Message-State: ANhLgQ0WtzRw0eg9NJoJiJ18fb/bx1PXimLGg9eu03Y1pOW/Bw/d5qIE
        K+OQDzC3irILgmIlaMyBINoSS6lYQ2k=
X-Google-Smtp-Source: ADFU+vszKd6S9nv17HvKFud5HMdECoIjLtvtm7Qot7rg1TwVpIcPlWAhD9+/axhy5YluT345jlesAQ==
X-Received: by 2002:a63:2989:: with SMTP id p131mr1307315pgp.281.1584591767135;
        Wed, 18 Mar 2020 21:22:47 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m68sm449693pjb.0.2020.03.18.21.22.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 21:22:46 -0700 (PDT)
Message-ID: <5e72f396.1c69fb81.167a2.3e7d@mx.google.com>
Date:   Wed, 18 Mar 2020 21:22:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc6-269-g4a20aa053992
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 279 boots: 7 failed,
 263 passed with 3 offline, 6 untried/unknown (v5.6-rc6-269-g4a20aa053992)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 279 boots: 7 failed, 263 passed with 3 offline, 6 =
untried/unknown (v5.6-rc6-269-g4a20aa053992)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc6-269-g4a20aa053992/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc6-269-g4a20aa053992/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc6-269-g4a20aa053992
Git Commit: 4a20aa053992133bed0f57663ae6c2d53f05fabe
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 23 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.6-rc6-178-g=
95cd16255210 - first fail: v5.6-rc6-220-g39ff0c2fc628)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 33 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc6-220-g39ff0c2f=
c628)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.6-rc6-220-g39ff0c2fc628)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.6-rc6-220-g39ff0c2fc=
628)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-220-g3=
9ff0c2fc628)
          meson-gxm-q200:
              lab-baylibre: failing since 1 day (last pass: v5.6-rc6-178-g9=
5cd16255210 - first fail: v5.6-rc6-220-g39ff0c2fc628)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
