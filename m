Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC528191E88
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 02:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbgCYBTS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 21:19:18 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:45628 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgCYBTS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Mar 2020 21:19:18 -0400
Received: by mail-pl1-f175.google.com with SMTP id b9so133081pls.12
        for <linux-next@vger.kernel.org>; Tue, 24 Mar 2020 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3dtTC8+iZdjqxqy0sblaPakrFz1RxZMERSy1J/csk70=;
        b=mu9SRN/9PJZnl0/w3XWF5nCO/MTGOzuLP1qqBpfIZnKwBvoe1B3u/XP78Zu33Urv4b
         aMfCc9a9U3pIgxqIq22/T7F4YMwu+lcz3hm2s6VYSjydTFrN0WAovkdaqMjpQDylTOMy
         FqlPddWKiLwMCkviNwiKHLncMlKykiflHzUUZdB2M1wWuhMiO6kII0WBUFFWHXsl17SM
         zQT5bxa+wP4GgXJeMSqyhmMAqjCb6VXUcgVNndxHDePSncSOak+wU57WxEUWHANWLPdd
         Txv2TGxfJyE5NaXQaUltMQl/9ID/fFEyCrhrVUTkktj+PGwPXKCMTaxRR9RAebPYXkHK
         KDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3dtTC8+iZdjqxqy0sblaPakrFz1RxZMERSy1J/csk70=;
        b=dOdoDJqNON62m+fHVHU7cgA7GRNLVVJqGoSCh/Ju734BXOzgqr6rW/F3ufperH+y0T
         nAg4+GuP5OZPj6lU1k8Gn3rOR+0MN+Q9QYIC6KTOpIkyojYPTa3wRfF9e9dpzx6WBUE/
         8AvzqwTVnW3Iy2n9B5RAABfc/ArfBVRD3LmRcfwNvWvU8INXhn4veJ259pD52tTRzX7s
         2eBs7Vgx76N/phFcUKEm2N9wEdMOR1tuZn1NvDlnoPNndadI9+000bY8znHvkG4UhY/B
         yWIqDCSujBuRDb/Ac2uFMChMiakc2G3xi/X9dqp/yrDNY4S5+1ZUxv1ZCGCj4sUE+MzK
         vqXQ==
X-Gm-Message-State: ANhLgQ1YYrghw7g+/aAmDz+Er5tOnxMfZXGxjn0Z+SY3Ab8pRIr3l8jG
        sntt+wEqJP1paOppxO0NCsai/Hg43hk=
X-Google-Smtp-Source: ADFU+vtf6iIQZRslk3xNe3anBEVPEmnVYZO+l8xE0cXD2yTbIEAf8PQjG+bSS2ZEV+f3Fn8S8SyQMA==
X-Received: by 2002:a17:902:341:: with SMTP id 59mr842221pld.29.1585099156759;
        Tue, 24 Mar 2020 18:19:16 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c1sm3347464pje.24.2020.03.24.18.19.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 18:19:16 -0700 (PDT)
Message-ID: <5e7ab194.1c69fb81.682fb.e7fa@mx.google.com>
Date:   Tue, 24 Mar 2020 18:19:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200324
X-Kernelci-Report-Type: boot
Subject: next/master boot: 278 boots: 8 failed, 259 passed with 4 offline,
 7 untried/unknown (next-20200324)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 8 failed, 259 passed with 4 offline, 7 untried=
/unknown (next-20200324)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200324/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200324/

Tree: next
Branch: master
Git Describe: next-20200324
Git Commit: f15e8108f6251f3480d572bca5729c1b849edfb3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 25 SoC families, 30 builds out of 329

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200320)

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 4 days (last pass: next-20200319=
 - first fail: next-20200320)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 36 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200323)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200323)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200323)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200323)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200323)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200323)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200323)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200323)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200323)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: failing since 1 day (last pass: next-20200320 -=
 first fail: next-20200323)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200323)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
