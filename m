Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E41587E42
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 17:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436712AbfHIPkx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 11:40:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55030 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfHIPkx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Aug 2019 11:40:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so6171620wme.4
        for <linux-next@vger.kernel.org>; Fri, 09 Aug 2019 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q8lqGhVus1MPaquPpaSZpEJh0PEZWTiQI8QGiMvyda8=;
        b=kYHviYP5ymdqiIeFVRXWq7Ico45Rr7rU5Uq1ka47HHqwo3vH4D1Zj4YS5hrvaoajMJ
         0hfVoAMiuljFWK6tDUI0RnYsEnNHA/RMhYYlvEFdP8qnR1RrOsvEf/6H7t1sJlUAyRnz
         wW/QjsWoGN5eCRbC4qWsSD8kP83G17LcB1eVqmq2JVeRMGmjMxMS56bAml2Dnst2ueU7
         1DT6QkZyb1nxd7gXItQQpKJyIfjct1hGucPTRk2S/LRwlyagGXNy2G/u/SEwHux5tPeO
         v8mQjA1Bv2JIN3qrQYRusjc8mnmD7JxGa0SY/oTi45R/DtffkZqfSNIxFa3xW1H2nPhW
         Iwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q8lqGhVus1MPaquPpaSZpEJh0PEZWTiQI8QGiMvyda8=;
        b=V34+ypXsdtRz2zbM3BK2mYm2X+DjRcob9qdOBtO4lnmaO2yFmyFWIBzbBSzpWadSg9
         XCbLZku3hn16mvJN3+XJ04WbmDWSbbIRb8/vJbOI3Moa+swnqXh6YRYMZQNPRPwjRqrz
         +eFLVsY/iNH9mmo0km9OraoHM0oMw3L7lKX5kr0p1FmWRUU7yn5P+TOuKVCgRFF/o5d/
         3hbhIo5rxPWE3lI7vehOQgObCsFvvATsEZBZgQhvy9Hv6l9s8u9bhgF4F2MO7yjfdxtf
         TDOfv9HhB9bXYCvCYY9MwzK7mtuElvs0J+1aNMGS+SRiRmdgfnjFX1oa8AzIaFvVVr9o
         0ISA==
X-Gm-Message-State: APjAAAXW+lJimHAqdvpaCJ3IRCtlYbsbJJ7bWe1jsjQrRQp+1TYkCxEV
        jVtf5gTunowx02MnbTYZw0BLvZWGb3f0VQ==
X-Google-Smtp-Source: APXvYqwnJLtmokaoQHIrQ6nqvwj1O4vRuipptrnhfuMoNp//Ss9cg7zW+os/McR/zxV0Jt1A3j7N/A==
X-Received: by 2002:a05:600c:228b:: with SMTP id 11mr11846528wmf.26.1565365250400;
        Fri, 09 Aug 2019 08:40:50 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a142sm2354245wme.2.2019.08.09.08.40.49
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 08:40:49 -0700 (PDT)
Message-ID: <5d4d9401.1c69fb81.2887a.c60d@mx.google.com>
Date:   Fri, 09 Aug 2019 08:40:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc3-519-ge06aa63031a1
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 218 boots: 4 failed,
 194 passed with 20 offline (v5.3-rc3-519-ge06aa63031a1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 218 boots: 4 failed, 194 passed with 20 offline (v=
5.3-rc3-519-ge06aa63031a1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc3-519-ge06aa63031a1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc3-519-ge06aa63031a1/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc3-519-ge06aa63031a1
Git Commit: e06aa63031a1f7db7d97336476e9eb87c1650351
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 28 SoC families, 21 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
