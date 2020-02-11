Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD1159560
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 17:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgBKQxC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 11:53:02 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:34093 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbgBKQxC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 11:53:02 -0500
Received: by mail-wr1-f49.google.com with SMTP id t2so13304876wrr.1
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2020 08:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FOO/8GW1+mQTU1bHZEDNUHUmzQtL6u257cclErhebZE=;
        b=bjRMqov6D5fuqMe6RZk3AIFecvihiyV0oa1Dmr1mwmdzunSdOaMk3ZguSj0uhz3D1u
         pHUru9STWTgFxHBbVYdS1xVdgoBSXumWUZj1m9+Ab+F3JTIKuB/Bw7n06LKEdopKZixn
         i6pOA7UfT3ceFMkJP3r3jW91CbC9MUzdi2v5/lvyCfU/EtW4FIVcfPDBAMn3mjfpoAAo
         XVCRXXWdQyKs7mAi8jlUMu7x8jewZ11di63QmMtIXcrqym4LTdABd6ao9kpj9hlBlyjf
         CqwpEg+tEszfrcC52FbHE9+tM9nVbLZWqRqKP1szU4L4/SB8zhGNqjHOTiwYw+QtoXXM
         NIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FOO/8GW1+mQTU1bHZEDNUHUmzQtL6u257cclErhebZE=;
        b=aYmjxwBeXWuIpf/oCxFb1Esf2rUZJz36Ev2YYhU3Py36QXOxStbhu5jOFOcy9c3Psp
         BIgSr0ubOZ+vQpY4dTa4JQYNbLy3cP7NnYnGnxwGAMg2kDZ0dgMaEMvFyHezbcXoCLRl
         xVg0Hzt9CrHRp6GbizgUISB4J1HC5GK5pwr3dcHsTTT09ItwzASY63ifXvB0lhxFbuJz
         D9sucaJaXnQn0hLrKOvMUq0NRm8c8Qw2NnVbAZ3mkCSrzQwjHgxmYAgtxGUJhUHlSXMo
         lzzupItR7rVQyAPpQvAWXnG0Ti6rJ1kNsaRZlNUuja7kdUesV2YfmVQdhdP07fVxzK2x
         U4ZQ==
X-Gm-Message-State: APjAAAUrGcP3NpteSGmH4yHocaOQ7+sAyNUnUifECaJSGO7Gll6Clxwj
        CCS1OjmjjlVnVegQvwS/ep4JjdzSSqgMcw==
X-Google-Smtp-Source: APXvYqxvD+AFsxNu2T53HU7S1JZtOP5p+ddx2G1xkYcF86S0w5wP5D1OUnvANwTaz7UJvKk8oaE2lw==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr9137947wrs.424.1581439979716;
        Tue, 11 Feb 2020 08:52:59 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 25sm4321086wmi.32.2020.02.11.08.52.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 08:52:59 -0800 (PST)
Message-ID: <5e42dbeb.1c69fb81.f1942.455b@mx.google.com>
Date:   Tue, 11 Feb 2020 08:52:59 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200211
Subject: next/master boot: 189 boots: 13 failed,
 171 passed with 5 offline (next-20200211)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 189 boots: 13 failed, 171 passed with 5 offline (next-202=
00211)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200211/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200211/

Tree: next
Branch: master
Git Describe: next-20200211
Git Commit: ac431e2d7b1be81bfe58163b9f81ba79bc987dc3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 23 SoC families, 28 builds out of 184

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: next-20200210)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 11 days (last pass: next-20200130 - =
first fail: next-20200131)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200210)
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: next-20200210)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20200210)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200210)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200210)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200210)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: next-20200207 -=
 first fail: next-20200210)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200207)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200207)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200207)

i386:

    i386_defconfig+kselftest:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20200210)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

i386:
    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            msm8998-mtp: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
