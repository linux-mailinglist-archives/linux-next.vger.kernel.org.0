Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E33E019D0CB
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388577AbgDCHGi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 03:06:38 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:41941 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388472AbgDCHGh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 03:06:37 -0400
Received: by mail-pg1-f181.google.com with SMTP id b1so3079540pgm.8
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2020 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cWow+TbB/9N+1cy6bVX5lKCTIsRkhC/NKsB1MtgkTyU=;
        b=0FVN+aj2cJI5xSDGQsadmn9W+Vg7jrFMUjKkVbigNz1LvaJ/04cmpEmZdDzjZAqm0j
         eEc0bLE0CA+NT9Itvq6S9LWYqqbYctv5HW6RMPjqAskuH9dYT6ML6u6ooV+RfnmKsHNH
         Os1Ueob0Xf628StcFkrllPslDn+nAj4I47SZtQOP9/MX2e7oTaxr5AuYvqTmANkgaxI4
         fLtwLguEqeHWqIX1sLVbSVA1tR57X2IsaLOR+jO9k+z/6PgerPUDdo1bCwyKkSWppdre
         LMtQR7hfulRV1486J4vKEpyglwlsMzQf3UopIqL89q4BoxtnTSsrKTTk7zcbmkLxL0GJ
         iibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cWow+TbB/9N+1cy6bVX5lKCTIsRkhC/NKsB1MtgkTyU=;
        b=adxexKATVmwivm1quU6fSWSLPJkTC7VtCcYX8xJJ0rua4PJGcabPRSs1i9VxmOFs5B
         EvuNP5Ie9nTuHj3zJ0Cw+cdRsXxtVhvp1ySN79kn5pxpERB5MIS/+UuaaXmshb71xWqq
         JLIEmpBm6Vng69iiSNrcEareZ6PwqVSisiyKNeX1QkdJl29QfmPGxz7Q2liopnZFP1jf
         KUaNLsgq6adWhD1kX9AoMeNg+1i85r72HPNxFIJBiISr4lGYYLrlQ7Mn5aC3AhDKkMqy
         apcAKegOwXvFLrptnQLfWGn56b+d8KnsIr6gImVRRzGerfg4HdWuoe5lqrjI4FD8Z0zs
         6txA==
X-Gm-Message-State: AGi0PuYprlgJgPI0pDii+twLFOYox7H53cjuLB1hL10YOjYntCsQ587F
        1pq1riLuyd++31RjHCgiZOIQjdSotT4=
X-Google-Smtp-Source: APiQypLCt8mP7RAHmfmD2xpss8ySUIlFVEB0TdhWXhQsaKwLYqBB35pj7/WD/MWUEmd9HrGGoqV1ZA==
X-Received: by 2002:aa7:9f49:: with SMTP id h9mr7107660pfr.217.1585897596766;
        Fri, 03 Apr 2020 00:06:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 1sm5107277pjo.10.2020.04.03.00.06.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 00:06:36 -0700 (PDT)
Message-ID: <5e86e07c.1c69fb81.284f4.935f@mx.google.com>
Date:   Fri, 03 Apr 2020 00:06:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-8377-ged040e5bd750
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 191 boots: 6 failed,
 174 passed with 4 offline, 7 untried/unknown (v5.6-8377-ged040e5bd750)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 191 boots: 6 failed, 174 passed with 4 offline, 7 =
untried/unknown (v5.6-8377-ged040e5bd750)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-8377-ged040e5bd750/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-8377-ged040e5bd750/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-8377-ged040e5bd750
Git Commit: ed040e5bd7507dd36b720d912cdd6c63590163b5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 22 SoC families, 28 builds out of 213

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 3 days (last pass: v5.6-rc7-404-=
gbcaebd8567a2 - first fail: v5.6-1227-ga325aefb3560)
          exynos5800-peach-pi:
              lab-collabora: failing since 28 days (last pass: v5.6-rc4-203=
-g8f169e319c63 - first fail: v5.6-rc4-359-gd038c5cebb94)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 48 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.6-3095-g771732386d6d)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: failing since 2 days (last pass: v5.6-1227-ga3=
25aefb3560 - first fail: v5.6-3095-g771732386d6d)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.6-6294-g700297ff160a)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-6294-g700297ff160=
a)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-6294-g7002=
97ff160a)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-6294-g7002=
97ff160a)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-6294-g7002=
97ff160a)

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

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
