Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC61F174B
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 14:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKFNiM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 08:38:12 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:43798 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730487AbfKFNiM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 08:38:12 -0500
Received: by mail-wr1-f49.google.com with SMTP id n1so25819470wra.10
        for <linux-next@vger.kernel.org>; Wed, 06 Nov 2019 05:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DEgfnfR1waRZS+YHJIZf+tZ5IKGWWEc8qekBBoS7tIs=;
        b=MAsMeG9KvOboUXWNwHrVi69ExzZZg840yjtiOYm31C6qU5z8c1MmD/uQcQ/WSBflP6
         ZXTpb72mjdyrDFSbLcxTnXq5i93ZU50PmVog0Ixvd4+xDhFoGOjPfd73er8MSDw9JjwQ
         Y/3f+NHZnWcU0YtPdvD/VOOVpf9IdXbKIW7Z2Ru/pcEgYuzk04fkYqT8yR8WoVOmuX3M
         cXQ77g8I2dtHEUh9nNsaLzQrCQUTUElrVhNR8qnztUCzVr7reVZh7zj309IUmxfrapkJ
         /4IdoYO7ZVRX6GfCznHzUe464knQND/nCOc+UbqzIzmviiHX8+y5MFnvRWWgtLoA1mUR
         8fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DEgfnfR1waRZS+YHJIZf+tZ5IKGWWEc8qekBBoS7tIs=;
        b=G/mKmHjbjgkU9B9viX7q5OfoM7tgyOY427eQumRmHhwDjmCHs0AzyKTuRH2zr6vhKU
         H9Gxfe/RkEgBJf2qPfAbMdwtHqI+Qj6gBpRa0PQzffogdj/Cjjj/d1Tr670r9bhVx2wD
         U/+uT9sUJDy/kdwnAmiUoYxFGdRAHWrIcFNdWkqNRAkEe539ckd45JUZmvcUrDGudFto
         FGWFZK6LOtlo1dSJ+LpVR3q11aiosy5rNMso4iEnC5clUYVwy2w0HhyZdWB91YkjbEpW
         lhmgnZQUo3QcI8sRj3IjTJ8ALHcZ0MEJXoF4oZw7ecvjtap2KVVK34m+qwhGw1fo3b2T
         lOiA==
X-Gm-Message-State: APjAAAUpFBMjmh2iuIc2VHEbhWEraRqqAhDiE5pYt8SeinctSYZsi9UH
        JxnMJNYhpLm45cbH31U8iMQGzV3CJ6QcPA==
X-Google-Smtp-Source: APXvYqxb9nBxknih3aLOs+vY2wyL6mJGswSMfgqoxx/V0wP9U/mfc6Y/N93xe6AVKlla3ualyZh7Hw==
X-Received: by 2002:adf:fd84:: with SMTP id d4mr2733890wrr.152.1573047488511;
        Wed, 06 Nov 2019 05:38:08 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m3sm19204039wrw.20.2019.11.06.05.38.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 05:38:07 -0800 (PST)
Message-ID: <5dc2ccbf.1c69fb81.d96b8.eeb2@mx.google.com>
Date:   Wed, 06 Nov 2019 05:38:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191106
Subject: next/master boot: 203 boots: 45 failed, 150 passed with 7 offline,
 1 conflict (next-20191106)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 203 boots: 45 failed, 150 passed with 7 offline, 1 confli=
ct (next-20191106)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191106/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191106/

Tree: next
Branch: master
Git Describe: next-20191106
Git Commit: dcd34bd234181ec74f081c7d0025204afe6b213e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 24 SoC families, 25 builds out of 216

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20191105)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: next-20191030)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20191031)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20191031)
          sun8i-h3-orangepi-pc:
              lab-clabbe: new failure (last pass: next-20191105)

arm64:

    defconfig:
        clang-8:
          sdm845-mtp:
              lab-bjorn: new failure (last pass: next-20191016)
        gcc-8:
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20191031)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: next-20191031)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20191031)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: next-20191031)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-g12b-odroid-n2:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20191031)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20191031)
          r8a7795-salvator-x:
              lab-baylibre: new failure (last pass: next-20191031)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        r8a7796-m3ulcb:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
