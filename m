Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48205157180
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2020 10:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgBJJPh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 04:15:37 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]:36778 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgBJJPh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Feb 2020 04:15:37 -0500
Received: by mail-wm1-f45.google.com with SMTP id p17so9650051wma.1
        for <linux-next@vger.kernel.org>; Mon, 10 Feb 2020 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qyVjY2zLFnkzNJ5s80N9eopAgtVLXmUfNaPfmyvrjvs=;
        b=aRx7o+TNJyW3tcURXv4yRWNtRW7C28zTKzMxNQ0rK33h8VWfGGiTS6BCaEw1MeT3nN
         8vTn3OZwVmDnl8Rhv6BR++qogiIzyeqUTg+jbbnPn/G6MxwjcAnZOg+DfKSmRrSgZuF5
         s4s6Zup+D1V8O/J8ImymERiSSylhpZa7SFkOpcyBwymqfpN+B+TawhjbRwDv5rmCiUxT
         Qa4ihNozq+LoW592FvXJmYnZBLk/MIpSxAS2rl67Os7Pp+xE/33QGx1ZG6FoLkdXZPpE
         5cLXwSQPnFbRl1uXFpxBtc+PVV9s15DMFHtkiYVUQ7a2lr8F35YhaTLNsCYCrTgd3/sM
         /TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qyVjY2zLFnkzNJ5s80N9eopAgtVLXmUfNaPfmyvrjvs=;
        b=UDKbkh3eIwq9OOP7ISPispHPDZUN78HH5U0HYbf6/HNd57/g7TAd1qSsyMwwPMY6MY
         rUKG2h4sLyosQ+Mqvd+E7WHbc73Ql4Kyu7/C0AiobmsNtJKXGueMVlk+/xb6OEJU9oqi
         t8qrmxjR4TBcvcPS6dlKBSrYVgGdxAQugX/dCYSkyGDZtDGHMo3i6JT9DJuRWWsI2vuU
         rRgPlqbKKIGrVvw8Tr6CdfqmPTp57UxDd0dSZvCvIRo8EF2a3otn7Z9BahVwCxQjGc2j
         SEnUUlMig/b6kj5z+aoeTwM5+nTfYiofKMDoc3ZGxmgL+9rDh038mJOmvYL74wwThA1j
         7Ipw==
X-Gm-Message-State: APjAAAXeo+rIoDM5joVzwgh35P2w+Vv6w3gF5TbpNZPA4VLQnTuQngC2
        aP/qqPNv5lblBWJiQY8dh3GoqTaQRiI=
X-Google-Smtp-Source: APXvYqzyRW6uGx7DbyMXpt2bTlm9XX78iq401VcAMxYf2O71JE5oeJswf3Z8RJ5tBavzZ1gydPQ2AA==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr14429647wme.186.1581326134353;
        Mon, 10 Feb 2020 01:15:34 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u23sm9649623wmu.14.2020.02.10.01.15.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 01:15:33 -0800 (PST)
Message-ID: <5e411f35.1c69fb81.4bb2e.7e38@mx.google.com>
Date:   Mon, 10 Feb 2020 01:15:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200210
Subject: next/master boot: 162 boots: 9 failed, 147 passed with 5 offline,
 1 untried/unknown (next-20200210)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 162 boots: 9 failed, 147 passed with 5 offline, 1 untried=
/unknown (next-20200210)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200210/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200210/

Tree: next
Branch: master
Git Describe: next-20200210
Git Commit: 2981de746b18227892dfbda7b70c099077c4580d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 24 SoC families, 22 builds out of 184

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200207)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 9 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200207)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200207)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200207)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200207)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200207)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200207)
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 2 days (last pass: next-20200206 =
- first fail: next-20200207)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200207)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200207)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            juno-r2: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

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
