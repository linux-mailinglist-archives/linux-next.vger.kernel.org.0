Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1213F1E8AB0
	for <lists+linux-next@lfdr.de>; Sat, 30 May 2020 00:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgE2WBn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 18:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbgE2WBn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 18:01:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C3EC03E969
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 15:01:42 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m1so557392pgk.1
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uHkPOjk+pqlyTbFW5QKHtDsvTFPL4AWQ05DyECvapyo=;
        b=WiGoQbPZWVCCgLJ7r1xcn8aEgUYEZWFAfeViBoPjmLnYkoR4c14702jouKWn7y0DdO
         WUVWSRjxJBBYxCoRxxmENHkGc9otzQP0w6cgowFTDZi+Pq7h9s95x/aNsNCZmcfMWtK+
         U9vIaQRi6gVgACMBGbEZjfrzU5jmfFlBWyO2QAq4zz5HGB4X5f2GOwwEIskCziwyRbOk
         CHx2EKlr6EkVBBIUvcVEQ+hQO+8bf0n55/DmzxpBXGHwCc0rxhLmQv8FL47ln8+XvysH
         Jn+QxelZM3xXWidyHgHxX8IwtEXdbUIEcqzH2iH4v/9r2RRWM1P0uPVrasQfHbO50Qj3
         oJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uHkPOjk+pqlyTbFW5QKHtDsvTFPL4AWQ05DyECvapyo=;
        b=j2igRWWXSZ9WsuMR6/gnR+omCelayys099jFNbqnGGAOEKtUD3a3r+1yEuSToCk+Nd
         33K2e85TB4lo7rQNVlTCSr1cXSF8F9vgMcEmtDuxH0O1sIncZz3Xjmw/A51uef3wklTs
         ai3BdFutwhViyPqolNPauX2RI597bIk4JVFK6tLB3pn/3XBYQphUHEuBIM5dVANOc+zm
         ia4sFQuAkKELaL0PxG2gZPsxMKglCQB8MIFw9U0so9Vz1vMwf8VYSzVqxdoMsVhJALes
         zYh/5yFIXR/AT6c7/L8m4oZXm3aMhUOtVsB/GYfgdNqYc85NgRikgK0i35f8jkMIvKy6
         gmWg==
X-Gm-Message-State: AOAM533S6FvNKJQDKwlW/ZZvZVERz8Va1QUEEAeot8zF2uwsZTChI6/a
        PSmqm2aZVGbKgExFlaPvsPv4bbxtLtU=
X-Google-Smtp-Source: ABdhPJztvIWsuEGen8ZG0CSAiBkPY4K1v3YhHykS/XDswF8fTsoIa3h9+Zb+q93nnwH27MjvpCBWpQ==
X-Received: by 2002:aa7:85da:: with SMTP id z26mr10176655pfn.25.1590789701453;
        Fri, 29 May 2020 15:01:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h21sm373494pjz.6.2020.05.29.15.01.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:01:40 -0700 (PDT)
Message-ID: <5ed18644.1c69fb81.b017e.62a9@mx.google.com>
Date:   Fri, 29 May 2020 15:01:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200529
Subject: next/master boot: 204 boots: 17 failed, 180 passed with 2 offline,
 5 untried/unknown (next-20200529)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/master/kernel/next-20200529/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 204 boots: 17 failed, 180 passed with 2 offline, 5 untrie=
d/unknown (next-20200529)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200529/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200529/

Tree: next
Branch: master
Git Describe: next-20200529
Git Commit: e7b08814b16b80a0bf76eeca16317f8c2ed23b8c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 20 SoC families, 28 builds out of 179

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 7 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 7 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 7 days (last pass: next-20200515 =
- first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 7 days (last pass: next-20200519 =
- first fail: next-20200521)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200528)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 7 days (last pass: next-20200515 =
- first fail: next-20200521)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 7 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 7 days (last pass: next-20200515 =
- first fail: next-20200521)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 63 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
