Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9616D131168
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 12:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFL1H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 06:27:07 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:35663 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAFL1H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 06:27:07 -0500
Received: by mail-wm1-f44.google.com with SMTP id p17so14915208wmb.0
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2020 03:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ovzcBh65yT39kD5/9e961doNb2hDWF5Mgl7lDgD9euA=;
        b=Er+8kE+xpD88IIZqkMBXmI9df5kgj7Zpdbf+TPBpRTH0ZXFmvq8brCFgeunyARBMpg
         LhmscMsN7mnxHeQqPG2o3+jLg7MEksmhtI432yW9AvNCM8G5G2JkLT30bAujn0NloHbq
         O3C+EOYKHAtiKXTHdCtEGUHkX40YgQZWVPTzdO5gtPYzMUaXqG+F1YnZO+nSvmyNKXuw
         9hyAcvmW6Lji5n+41hiRJ8/FYlz1I63slzl5JDD7eyuHs2dPlSYIb6hrRYIGU6aZhM66
         Yz5sVZPQsP3qVQPaG755H9vhN7lWX6LqZiGZYjxY9FNM2vUwrd/JyZVrFziIUsh1j61L
         7TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ovzcBh65yT39kD5/9e961doNb2hDWF5Mgl7lDgD9euA=;
        b=bpalantdrGWqVm0di5gIbAjP0DiuAjusPk0GYFvqLkY6h1hg6HBoeSFBL4EJIKKw95
         adchFttzF4SNH0w3OoXcTs0roLIvp9it+XAko+SC3TGZ0DFIhM3UhcrktTXULh6OHXhX
         4w5P6zoc4VCgKYzpQFES/aDINYztQH3UBmEF4xKdQhOsTEa4J3OeAKtKS+/6WOuc46h2
         CRR1RtunT8+JnA3u/RCvcbJeBo0RzxjWIu136R2C4OxAS21xD0cW/GJ4RMqq0Fj2ALbU
         k8LpImGXOQnHGdoVpwQ/uAuFwfoHbeHn8A6zSYxc4cWJ8xGqOL6eq8fSll5WvNN26VZa
         FhHQ==
X-Gm-Message-State: APjAAAV3fozhoNJho1WQ/tzJHYI88NskYgQzs71v1Nk6x122SS+dy+RL
        6Rukt1kHdTWAryts4BRlBe1eQL6YLCM=
X-Google-Smtp-Source: APXvYqzIxGr2pyqsloy1iyCfkAljtoBL8gGA+C4xI7/ry2ci5hA8hs7wazaYgVruIu/c+AZK9jxAlw==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr33737796wmg.16.1578310024316;
        Mon, 06 Jan 2020 03:27:04 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v14sm70834435wrm.28.2020.01.06.03.27.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 03:27:03 -0800 (PST)
Message-ID: <5e131987.1c69fb81.2bd95.069d@mx.google.com>
Date:   Mon, 06 Jan 2020 03:27:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200106
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 137 boots: 31 failed,
 102 passed with 4 untried/unknown (next-20200106)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 137 boots: 31 failed, 102 passed with 4 untried/unknown (=
next-20200106)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200106/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200106/

Tree: next
Branch: master
Git Describe: next-20200106
Git Commit: 9eb1b48ca4ce1406628ffe1a11b684a96e83ca08
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 57 unique boards, 12 SoC families, 22 builds out of 214

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: next-20191220)

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191220)
              lab-drue: new failure (last pass: next-20191220)
          am57xx-beagle-x15:
              lab-drue: new failure (last pass: next-20191220)
          imx6q-sabrelite:
              lab-baylibre: new failure (last pass: next-20191220)
          omap4-panda:
              lab-baylibre: new failure (last pass: next-20191220)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20191217)
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: next-20191220)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20191220)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191220)
              lab-drue: new failure (last pass: next-20191220)
          am57xx-beagle-x15:
              lab-drue: new failure (last pass: next-20191220)
          imx6q-sabrelite:
              lab-baylibre: new failure (last pass: next-20191220)
          omap4-panda:
              lab-baylibre: new failure (last pass: next-20191220)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20191219)
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: next-20191220)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20191220)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191220)
              lab-drue: new failure (last pass: next-20191220)
          am57xx-beagle-x15:
              lab-drue: new failure (last pass: next-20191220)
          omap4-panda:
              lab-baylibre: new failure (last pass: next-20191220)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: new failure (last pass: next-20191219)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20191219)
          sun7i-a20-cubieboard2:
              lab-clabbe: new failure (last pass: next-20191220)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20191220)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20191220)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20191220)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20191220)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191220)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20191220)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191220)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191220)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            am57xx-beagle-x15: 1 failed lab
            imx6q-sabrelite: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            omap4-panda: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            imx6q-sabrelite: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

---
For more info write to <info@kernelci.org>
