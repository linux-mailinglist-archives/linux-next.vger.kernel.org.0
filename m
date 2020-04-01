Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A0819A4FF
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 07:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731777AbgDAFzP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 01:55:15 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:45762 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFzP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 01:55:15 -0400
Received: by mail-pg1-f180.google.com with SMTP id o26so11590123pgc.12
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=suh3tziA6yl7zTIX03eEpUfx7EdVTWxAo/RrT0FglI0=;
        b=oAXj17u3MS+wktjWpI1g84US7uKpjms5Gh1R0WjW7cL7/XooBV5fKU766xvbeE4wdR
         RtR8PaXCVix9/ySHNWJif18nJKDg7KyjU7dcf7jsdnX7sxEKmDeJkzv+QvtI82n/X0sI
         ILkK7VsNCdVqRB+WG583p4KBqJWS68dIgNwraS9zG9bhe+CY1iuZcrh69HAS+DVOROsy
         ZazZq8bijFuUZP9C0jnHqS8zqN76KozCYXTRwOKy5U06/6snPtTS+UNRHuwPhzOSo0c6
         z+eU6xFgxNAwvh7MaMKxQ8DvDGoEJeCy3uNoPC7ZdcDGw/m6mFweQgIhhG3zLo00qAQZ
         zWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=suh3tziA6yl7zTIX03eEpUfx7EdVTWxAo/RrT0FglI0=;
        b=rSNsK3pYVAoWA6z61Qz956v6y569+JWWqVCBWrmbBM803hR22VSj++NS7mFL6yVUaK
         nrHBkHvYAf0lqWRNbW4tdxynvhJ7AAkPVQC+qBX0SN1O2K87Qpoo5NUD24B1ehFXs/yy
         ZtmB+OmI1scJi/nALB8H58R5nKmElJdYfuwjce9BXOlQJ2V+tOqfX6YlrL639arsTcK1
         dGmZqbTK4+X+Ks+b9y8jc/p2y2lVVsrPdEUMWMSJzKZrKZZfYlT7oAlLRBOH8+sj8msv
         2TLf5+/fuCcMcfjqNFvgwlFxySKpRcFV9VxcDbbicxJYyeP/YFgZ1S6N8HGzK7xhwEdo
         Tkbw==
X-Gm-Message-State: ANhLgQ2+ehUpSe58j8B8FDn2Y19L0LR6LwAsXKoDn5RiYsGI/ZXw6Tp3
        Fn1jmz7CwTUI7/zXQ8RN92dZNHCvnDo=
X-Google-Smtp-Source: ADFU+vt4GHKg4hPHvHM5MOKptNVjaMvvEruPtyZK2PwY4HNbLd2JyKGckoVkJB0vkQwSqt29WBfm4g==
X-Received: by 2002:a63:5716:: with SMTP id l22mr21223454pgb.164.1585720511549;
        Tue, 31 Mar 2020 22:55:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x4sm690378pfi.202.2020.03.31.22.55.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:55:10 -0700 (PDT)
Message-ID: <5e842cbe.1c69fb81.b7f2e.3ab0@mx.google.com>
Date:   Tue, 31 Mar 2020 22:55:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-3095-g771732386d6d
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 283 boots: 10 failed,
 262 passed with 5 offline, 5 untried/unknown,
 1 conflict (v5.6-3095-g771732386d6d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 283 boots: 10 failed, 262 passed with 5 offline, 5=
 untried/unknown, 1 conflict (v5.6-3095-g771732386d6d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-3095-g771732386d6d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-3095-g771732386d6d/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-3095-g771732386d6d
Git Commit: 771732386d6d432929a4b34b06df4e5da23e2595
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 107 unique boards, 25 SoC families, 31 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: v5.6-rc7-404-g=
bcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)
          exynos5800-peach-pi:
              lab-collabora: failing since 26 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 46 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: v5.6-1227-ga325aefb356=
0)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.6-1227-ga325aefb3560)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-1227-ga325aefb356=
0)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-1227-ga325=
aefb3560)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.6-1227-ga325aefb3560)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-1227-ga325aefb3560)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-1227-ga325=
aefb3560)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-1227-ga325=
aefb3560)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
