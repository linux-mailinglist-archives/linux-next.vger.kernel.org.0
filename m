Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07DFC199FE7
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgCaUXG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 16:23:06 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:42170 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgCaUXG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Mar 2020 16:23:06 -0400
Received: by mail-pg1-f174.google.com with SMTP id h8so10895506pgs.9
        for <linux-next@vger.kernel.org>; Tue, 31 Mar 2020 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3JK4PLTF62JSFBYEQUHmBujLdPQMd7zn6tfWTtToX7U=;
        b=1dEzKcPv00BA5N1BeBxDtc56ph3kWEMBJz3O+xxJXZ9ArH7jNZ0Lch6Tti07USkDah
         J80RYoQ1ZrRPgdtlVyYohJN/IO/onEOYqE9HwqYSLDZklJ3G5ijnO4tRprRt1DEu8qFE
         MAoSUOQaAsFiY8j2W3cN39AdK6HjwKAq/6Ud4c9VjkPBfFNRSzuCcDSxl346Xs8zji9k
         HwHvS+tJ0eEe47WmZD6Mwdr4eCAlrFcLBxFAgxV4MwdrXjOX0/XMPJhVZURlTVIvqtoc
         jp5+yUiu/TUMRLToVQlB3uE9qLjQM3g10mgCFs/DK/4z17D6WWMjb2+09YrQiaybm/S8
         n3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3JK4PLTF62JSFBYEQUHmBujLdPQMd7zn6tfWTtToX7U=;
        b=IvuTlWAmdALyhPOzU8fbWMm7YUgl2Jqy/x41R3nng+jHUex9Zxz5yZWU/ZCW0gnaU/
         AaJXHL5a5AaueP2VfzUe5nhTZ3AjUVmMZZfkNrzw7QLIYTdHiEyY/8tgP3V66y/xh1JP
         06GJzFf4nUd37HThkcZe5GNttMy0bOP7xKNL05tiBRKFNejd0J9Q3tgTvzHpYc6bNFY2
         B8YK/m4iHjqy7JNHVD9U/bxwVq9BrbPGRlKje0cesB3TV5HGUGBUaASh0uePDQ4+SDgB
         zpYzxz+7zPBVLVj5f5oke84jHBu5QkRmGjL96r83+DFiWza78hAAV5fy0Iezyudpj+HA
         A/cA==
X-Gm-Message-State: ANhLgQ0sYKaczpDvGlgO2BPXSEJjbdfgYX5JbSVArT2Fcz64WlVMisaX
        HbXjujiip3tE7SCbsXEy12PYH8W94UU=
X-Google-Smtp-Source: ADFU+vuHXCAsuTs1XVgkeIsMwDnuGQNN5gYnsN505qIbAMEfp2aym+1lGXJ5/EahBL7ZAhNsCiWa5g==
X-Received: by 2002:aa7:958f:: with SMTP id z15mr19363605pfj.130.1585686184316;
        Tue, 31 Mar 2020 13:23:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10sm5280926pgf.23.2020.03.31.13.23.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:23:03 -0700 (PDT)
Message-ID: <5e83a6a7.1c69fb81.efb7f.587a@mx.google.com>
Date:   Tue, 31 Mar 2020 13:23:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200331
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 271 boots: 7 failed, 254 passed with 5 offline,
 5 untried/unknown (next-20200331)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 271 boots: 7 failed, 254 passed with 5 offline, 5 untried=
/unknown (next-20200331)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200331/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200331/

Tree: next
Branch: master
Git Describe: next-20200331
Git Commit: 3eb7cccdb3ae41ebb6a2f5f1ccd2821550c61fe1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 24 SoC families, 29 builds out of 227

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 10 days (last pass: next-2020031=
9 - first fail: next-20200320)
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: next-20200305)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: next-20200129)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 42 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200330)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200330)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200330)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200330)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0200326 - first fail: next-20200327)

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

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

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

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

---
For more info write to <info@kernelci.org>
