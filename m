Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660D119E3FE
	for <lists+linux-next@lfdr.de>; Sat,  4 Apr 2020 10:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDDIxi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 4 Apr 2020 04:53:38 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:40423 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgDDIxi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 4 Apr 2020 04:53:38 -0400
Received: by mail-pl1-f170.google.com with SMTP id h11so3792782plk.7
        for <linux-next@vger.kernel.org>; Sat, 04 Apr 2020 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dEp5NO3DUGIBO/+Xn4cVJdEV80UiZLylus/ARkErmJU=;
        b=Ly1jv1afXkoHMEmsehKGoLndLEDgjDNwhPDKlop49QnXb0zglyNzoIRM110wtb4iuh
         7WxsjqTRulDepWWZce+B+oWHuU6V3EMsVc321uAbfnSv2pZ2AYwR539e+6tVcTOPZ4MM
         lWIVqQJ5x77sVvzNqrtx1aWJAiMcJar0X6R8W94ceqAOpajUA42B8svQA893jXR1Dli2
         6/4rogRpyEughcw2E9wXcmCL+6WqbPvSqqGxXj4Y75DdwjPQ3m6szbqnjjRt+cICGK0+
         VR5QLz2mi8EJQgVDgjSIYaxvcLKYL1ZL2ZPGLbSMYMxHMj8bVAn1e3G7D70c7awXgaqX
         azNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dEp5NO3DUGIBO/+Xn4cVJdEV80UiZLylus/ARkErmJU=;
        b=T91oYBon6pP6HAGwsmVnRCCOXuc+LXuyQYJEdGiCYaqZpPaw4Y3VM9+ln3tvRQ6yhn
         gOyqo/i5eKsC/hdgEjHgUDEupDkAnmD5xeV3Q+fkKiChlnwu+WNKdoZm+f3MBsrRu7Y2
         SH4Lyhtsm36G2BC5W9pWcMYIMqRrSneO4BNdvQKvogmi+H+qx8IXGOMiVfti6CQz1on9
         NOeo02MO3eVt0ulk+CilEyyrUS6S/Lonbpkkkh3NcI3rXdJbI7fKysYDCJseWppFY9N0
         xIqVIcrXDWQqM2/TNyUSsx8ZaV4e2zjPVGOurl/TvO82GqtQht8deoD6yLX3bcfG4kml
         zspQ==
X-Gm-Message-State: AGi0Pub5+7Jes2BxEMqgPNCEs6rOqhpfSIUuOzz2kCA2XE/i0NQOJLTw
        7Sx7AvR5DLTgqBuos+ZEP8lKYp2KbdY=
X-Google-Smtp-Source: APiQypJkeJy0RoPLYzalqS/7B40tSOGFBVj62c8Lj+2IL0B81UeLTPLnt6HNOB+frxlivkpEOKid/w==
X-Received: by 2002:a17:902:9048:: with SMTP id w8mr11318635plz.24.1585990416561;
        Sat, 04 Apr 2020 01:53:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e7sm7366540pfm.3.2020.04.04.01.53.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 01:53:36 -0700 (PDT)
Message-ID: <5e884b10.1c69fb81.31479.3e24@mx.google.com>
Date:   Sat, 04 Apr 2020 01:53:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-9886-g0b1e9f1086f3
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 191 boots: 6 failed,
 177 passed with 3 offline, 5 untried/unknown (v5.6-9886-g0b1e9f1086f3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 191 boots: 6 failed, 177 passed with 3 offline, 5 =
untried/unknown (v5.6-9886-g0b1e9f1086f3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-9886-g0b1e9f1086f3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-9886-g0b1e9f1086f3/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-9886-g0b1e9f1086f3
Git Commit: 0b1e9f1086f336c8255ed310e1c82d26bd42c7d7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 22 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 4 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)
          exynos5800-peach-pi:
              lab-collabora: failing since 29 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 49 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 3 days (last pass: v5.6-1227-ga3=
25aefb3560 - first fail: v5.6-3095-g771732386d6d)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-8377-ged040e5bd75=
0)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-8377-ged04=
0e5bd750)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-8377-ged04=
0e5bd750)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 2 failed labs

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
