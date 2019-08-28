Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F74E9F812
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 04:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfH1CAD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 22:00:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46666 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbfH1CAD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2019 22:00:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so703696wru.13
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2019 19:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9tJo6A76SShCfQ+RfP9NWtKPdk7CR1NrZVt+tphqnLg=;
        b=pr/m/yebOvKU2ZO4Hnl90jL4AHpOe/CxAofoxgo1gpnbPENTTJd21BEFE4nNxmCqRq
         5haw6kDFKKYrQxPaSk0sEQle1njR2AsWDQdwltjIY4KB5jbLxL2mEPPayTG+Sh9UTYsJ
         IAhmSp3zekBbG+3mO21j+fqljzI9SqBkxJPUuftoF2Wgz1YmBd2PZlomNsaX378xARa5
         FSsh6i2xDXfWXKeesPpiRKRi42kTi3qjnvyyQLZAKO9Sbyro9zv28VGeu3uMcFYn/1bV
         7uBZKVfG8hJcjIKiYpgNvYdhIgroEyQx0p+s8CWZtdpvEYbg3lZ5tQUkGa0bGBcWpnJW
         WyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9tJo6A76SShCfQ+RfP9NWtKPdk7CR1NrZVt+tphqnLg=;
        b=ewcfHQyCWiyEm8TSC7Mxh2f1GD3CBnwaQxOw0ox3e4+VevW03OGqTgEA4ftft26xsj
         javynC1XK8tBpt06PqyMqVwdUluIHk2cRMEqfuiTjhHQiRVgRObo/Cb6hA+RsJw7oaRB
         PeNMbiFt8g7e0Yfdb6xwk1Wu+NVxuIFoK6Babm//J+mPQgFcBsKeo3PI6QgyrL7W5ygL
         LqnvJpSAQvSG9fHlVGBcxsQk4gZYr5SVHsLYYT44pdZpAIjxrDbxURGW6nfDstwzN9Xm
         fhiZKCm3N4srMVa0h/JhIrd60iG0ZGLwAJbHEasIoSz/XJR/eAALo7C6Egoa9FIaBWwB
         T1Gg==
X-Gm-Message-State: APjAAAVmwrVGHaaTEsImTe/PZk70KHD2IjN3iYe4nFz5J0maPxUL8k4t
        HS78UFuAGj+f4Ol1Ykon3xc9UBUknDqVMw==
X-Google-Smtp-Source: APXvYqz7nPrt/L64/9f/ek3pSxmzxr6os9XdP64nWpvc/TG1s912KlNqUbfawRFQhJeBAg1nyyuOHg==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr1154085wrm.297.1566957600626;
        Tue, 27 Aug 2019 19:00:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 91sm2251645wrp.3.2019.08.27.18.59.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 19:00:00 -0700 (PDT)
Message-ID: <5d65e020.1c69fb81.7e29f.b8b7@mx.google.com>
Date:   Tue, 27 Aug 2019 19:00:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190827
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 216 boots: 6 failed, 198 passed with 10 offline,
 2 untried/unknown (next-20190827)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 216 boots: 6 failed, 198 passed with 10 offline, 2 untrie=
d/unknown (next-20190827)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190827/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190827/

Tree: next
Branch: master
Git Describe: next-20190827
Git Commit: ed2393ca091048fa9711f4e8ab17ce52856e6412
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 26 SoC families, 16 builds out of 216

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: new failure (last pass: next-20190823)
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: next-20190823)

    omap2plus_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-drue: new failure (last pass: next-20190823)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
