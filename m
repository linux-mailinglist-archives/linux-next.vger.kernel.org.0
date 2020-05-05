Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3505A1C60AF
	for <lists+linux-next@lfdr.de>; Tue,  5 May 2020 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEETEd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 May 2020 15:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgEETEd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2020 15:04:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657FFC061A0F
        for <linux-next@vger.kernel.org>; Tue,  5 May 2020 12:04:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so1490741pgg.2
        for <linux-next@vger.kernel.org>; Tue, 05 May 2020 12:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0wLK6FmQA0YPUmjJtdcpjWQ2WRCOYc9r30BqNc1CYIk=;
        b=SapMHXuWLN9RW/Y+sriA5gAqXX4n2hagQjBq5NKsBiU/JxR0Y6a47DUz/frlK58esH
         U7pmXgFQxOv+ZWQSQDUN6zrPkPdauQRIoe24M4MxDmLMjGv48yD+uzTamN5wyqrsW5zt
         Fg0LQ5gM/NaKPNrfS/aOobCebnpOg52XFYaFcdfF+/WTAA8uZijwhedFwgsMajE3PgP2
         UJ8qgIDS0SEQdVwMwQWg36s31Mm2Ajo6b45Q/l6wlUr5NhJH5J4QWH1YGf8aWg4BhEai
         uYksF7YdRKFw4EjbMmy+5L+CnQwQwRgZAdIK3mHcOlndiXjHxhvjdtET9e1IzxtkyZYx
         /VXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0wLK6FmQA0YPUmjJtdcpjWQ2WRCOYc9r30BqNc1CYIk=;
        b=mqxUAhRZ6UDxvMLboYs1bw5gL3ty07lwIfD0XXNVPQA2bhUcOjNwW2qqFMnSZMKODU
         MTHVqhLPH63QVKwnRdKqaW9xJZISWazfiVfNbNExXjgpLTjVnSEdy34nmtChjrMHhA+F
         dO1Ric89ekf15ytdKlFFtpq7bepdxA07Q9NPdXFhRRjnOE00VhZcPxHySH38elXJZ77y
         8bT0IF6/005MvC5XmVA2a8MS5DaGVOuXAxwYg2zXffzlCcN7Za2Az7tn/+W/rfvBuXIL
         VA6UxgOM78mX5zH9xN7t3rr2GurD+vPc6qJpy5sRvh7sjwfaY1IUdNJsfOCW+jZZXsZ9
         sgqQ==
X-Gm-Message-State: AGi0PuZdo2gXXRrtxLmR3/+ePrg7nZC/v3Q+KcKt169wiPeSmYilPruz
        iienaaWDPgisMy3HZU8KP40Q3+jv1Tg=
X-Google-Smtp-Source: APiQypJSO8G2k4FQfUgrtJnlAxuX/honIRRhvhA0iKM2aNwhhOLeVGAzgVP7rGs4my9TQynn30GiRA==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr4426341pfq.31.1588705472296;
        Tue, 05 May 2020 12:04:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cp22sm2644927pjb.28.2020.05.05.12.04.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:04:27 -0700 (PDT)
Message-ID: <5eb1b8bb.1c69fb81.c075c.958d@mx.google.com>
Date:   Tue, 05 May 2020 12:04:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc4-280-g8474014cf12d
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 265 boots: 9 failed,
 241 passed with 5 offline, 6 untried/unknown,
 4 conflicts (v5.7-rc4-280-g8474014cf12d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 265 boots: 9 failed, 241 passed with 5 offline, 6 =
untried/unknown, 4 conflicts (v5.7-rc4-280-g8474014cf12d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc4-280-g8474014cf12d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc4-280-g8474014cf12d/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc4-280-g8474014cf12d
Git Commit: 8474014cf12df779cda1bb11e43fd8aa0bd4fdcc
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 25 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 81 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          exynos5422-odroidxu3:
              lab-collabora: failing since 4 days (last pass: v5.7-rc3-247-=
gf693cee801ec - first fail: v5.7-rc3-277-ga37f92ef57b2)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: v5.7-rc3-277-ga37f92ef=
57b2)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc3-277-ga=
37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc4-211-g6d431502=
3bc9)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 4 days (last pass: v5.7-rc3-194-g163=
1e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc4-211-g6d4315023=
bc9)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.7-rc4-211-g6d4315023=
bc9)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 25 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
