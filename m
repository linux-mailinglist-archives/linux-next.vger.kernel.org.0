Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A321C0510
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 20:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgD3Sp4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Apr 2020 14:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgD3Spz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Apr 2020 14:45:55 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E54C035494
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2020 11:45:55 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f8so2603417plt.2
        for <linux-next@vger.kernel.org>; Thu, 30 Apr 2020 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DRZ//oxJn7DKI+s6WMFISZEcs2z6THL76vW+uINbdac=;
        b=syANKAYsoyXUg9+ecxMcaE6WTxMHmepsoC7JSHNH1mgXOkigP4B7yCiggyX7BFiWVi
         Q+doqnDNGeJMVGx0MtSuyHnFeJW9s0VZqRO1xfydAtD2jqLX3OblsszuEIuB/UNsc4ob
         6GdB6rdXJ+MYhT6nH2PjXwliXgRWAC6YJyrEgIwHVech6YVU8oJSpedhlc8WtLxLrx8X
         OUBXsJOEbRMmQfCP0YthtdnmIjgAxjryHyAapYBs0uAC1LQGS5sNw05/Y7pVe1jMpiUp
         lMHxn6DCbiOYZS0zWSOA8ZeDCrjZh0ydTvqPxcEefAdTgIw6I/jcJDGst7qaUZ9rGDO9
         btrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DRZ//oxJn7DKI+s6WMFISZEcs2z6THL76vW+uINbdac=;
        b=SBiOCEis9l7afHrQMx7+esNkLDhpMH+c0BMi0G7+QUJnY9MkdAyKEOp2WdC4RF+/dx
         h4AZVRiqAWwXk/HpGe8xLFDS0Q78HK3jwHLEJ/s8LHOTQdmnPaRQFDJkuQT4XgrjcXQu
         lERrM30eLPYSP60ECTNLiQoKhuv9fUpVVpyH20+GsT6QFJYdap2fg5k1yALdVQ23dpWG
         kYP7wQICb+fGePBDqUBEvf5AVnBghHZR+qHcrdwHmg/RXbseyZly3/kAKZKjGVWcihAM
         hqrFTMwyiSlQAr/2a0Oc52+sNwbunkiyyBXweKkIttYphvnTMMdqJbGm6AA4ESwyY4n7
         B+pQ==
X-Gm-Message-State: AGi0PubW8g0fszY6kFrVqcM3yh+k11KQufig9FReyvLxE1t+q/WoC6oK
        Ut3ml3tRHuJzvIX5itjk5GWURIDJmEE=
X-Google-Smtp-Source: APiQypJuqBkbOlr0ZQs0zjxLQxT7KSYulVAdxFQSzF0bMa8XNCT+IZ4rLHNHa5hTuQZFMUjMNhJ4dg==
X-Received: by 2002:a17:902:d216:: with SMTP id t22mr379333ply.186.1588272351832;
        Thu, 30 Apr 2020 11:45:51 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c124sm423489pfb.187.2020.04.30.11.45.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 11:45:51 -0700 (PDT)
Message-ID: <5eab1cdf.1c69fb81.be6cf.1653@mx.google.com>
Date:   Thu, 30 Apr 2020 11:45:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200430
X-Kernelci-Report-Type: boot
Subject: next/master boot: 291 boots: 6 failed, 268 passed with 7 offline,
 7 untried/unknown, 3 conflicts (next-20200430)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 291 boots: 6 failed, 268 passed with 7 offline, 7 untried=
/unknown, 3 conflicts (next-20200430)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200430/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200430/

Tree: next
Branch: master
Git Describe: next-20200430
Git Commit: e4a08b64261ab411b15580c369a3b8fbed28bbc1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 110 unique boards, 25 SoC families, 31 builds out of 231

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 72 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200429)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200429)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200429)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200429)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200429)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200429)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200429)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200429)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 34 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200429)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
