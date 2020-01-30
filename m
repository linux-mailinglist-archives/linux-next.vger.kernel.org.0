Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B7714DBDF
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2020 14:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgA3N3o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 08:29:44 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:39238 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbgA3N3o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jan 2020 08:29:44 -0500
Received: by mail-wm1-f53.google.com with SMTP id c84so4213925wme.4
        for <linux-next@vger.kernel.org>; Thu, 30 Jan 2020 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5TWH/xgyJw7MZSA4+xO6SsIBsx08QTtGnQ1qGKBtOGY=;
        b=Q/GhSWnkXwIwoO088zknw70BZAj3ROunUjbnVSAlirtvV7zqW60PkAQQpUmRuHyGzH
         EOHHraVuL08y+5jancwcMnpxSps0LxkYYtRusQJ7Hi1XG2d+2Oa/pgLV2GjjkNrGZTGG
         iv+HUzjBbxb0iRtKkptdJ9h9a5qD6z9PPGA0R/PpGMpFdKpU56SYHrCYFtIBJycFyka2
         /r9pBdClxMls0JRMPtuxTCNwpYmy3F0uqQJ5UM8M0MRKGDcRSNmiWX2I5XIKaLdPIEC3
         9EwolUL4Hei8gEo+4TMF3511BUXsZfoUVmRTUkw6wvSA4IUBFWsj24UzNpji5FJs5jiH
         HBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5TWH/xgyJw7MZSA4+xO6SsIBsx08QTtGnQ1qGKBtOGY=;
        b=fKe3gRSBE7NmNwv0N7mmkqSgO1ZDkC5nlfkJVE8LEcmytMfh+VEnvW2HBsh0TZlPas
         CeqBRqE6+gvgDzA44DF9bMgUlo1U7n3keEdSDIjmz2OFG9KNavYWBs/I4dyyryoQ+OCV
         XZIMECyDTXni3uERzKip6b2ExQrcaH0UhwHEji0njS50e+RihVfHPCygX6/9L2lpfcUT
         boNnTCdV/6CG35lZm+eVMFvGivaNzCVPLDB4N5/7KKZn/oUcJ5n0TuhPlCpg61hNEoxw
         F8KEVlMqtVBH1LCjDcuLbAeL4m7Ja/Wbiq2+z6jU8CnaGA0Y4Ee3en50fKCDW3lH7tAz
         6/yw==
X-Gm-Message-State: APjAAAUY5aeV4NcPwZFNXe/YH0cNmEaQjMn2/fXPBfsyKgkQgR3hhM1o
        Zz0pYPLqzqE4QTOfP6pQTiLqldkEPzzFvQ==
X-Google-Smtp-Source: APXvYqzxHShtKgl7YDDDBx43uFian19qZYNFmB/JomNlvQ7rloUcP1mt5UVue3CE0XMCu+03rZfzTQ==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr5676557wmh.58.1580390981744;
        Thu, 30 Jan 2020 05:29:41 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l15sm7305675wrv.39.2020.01.30.05.29.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 05:29:41 -0800 (PST)
Message-ID: <5e32da45.1c69fb81.d68c8.0d4c@mx.google.com>
Date:   Thu, 30 Jan 2020 05:29:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200130
X-Kernelci-Report-Type: boot
Subject: next/master boot: 183 boots: 12 failed,
 169 passed with 2 untried/unknown (next-20200130)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 183 boots: 12 failed, 169 passed with 2 untried/unknown (=
next-20200130)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200130/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200130/

Tree: next
Branch: master
Git Describe: next-20200130
Git Commit: c32e1d01a152aee976763ccf7c7ced53ca45b78f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 66 unique boards, 16 SoC families, 23 builds out of 214

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 1 day (last pass: next-20200122 =
- first fail: next-20200129)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 1 day (last pass: next-20200122 =
- first fail: next-20200129)
          exynos5422-odroidxu3:
              lab-collabora: failing since 1 day (last pass: next-20200122 =
- first fail: next-20200129)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200129)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200129)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200129)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-collabora: failing since 1 day (last pass: next-20200123 =
- first fail: next-20200129)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: failing since 1 day (last pass: next-20200123 =
- first fail: next-20200129)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

x86_64:
    x86_64_defconfig:
        gcc-8:
            qemu_x86_64: 2 failed labs

    x86_64_defconfig+kvm_guest:
        gcc-8:
            qemu_x86_64: 2 failed labs

---
For more info write to <info@kernelci.org>
