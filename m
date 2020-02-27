Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 256E71725A7
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 18:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbgB0RwG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 12:52:06 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35538 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729382AbgB0RwG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 12:52:06 -0500
Received: by mail-pf1-f196.google.com with SMTP id i19so205205pfa.2
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Xb6BDDhMmp8JdjDq0w3krecr2eqLH2th+7g6s6rhB+c=;
        b=lQhePBonXlbPtXg9xfNIFd2KD4yxDXhXjFqg5YfMnEhj8W6srwFZmwOqBQMVVbBWMZ
         4TS9tOi0eirJeRaaeMB32TJ82bwM4AKbYaMeMQF86ar2bdsaje+rUMnWLQLD8s6m57LN
         yeE7wFmoT+IyBYEXXKIRTTUrItoRCkIHb4f0ksFY9lFuXpKwgRvZCkzTxZZn4gTM7ZXu
         tsAaQYEg2y+u1oPEbxztB1UnLqfyUU49GYmz50jwJNiSJn5GYqhFMItnFkc5ZqEeAOE9
         /MSUv8mzzm1IQFVr/dQJqUlGXZnR4Wv7PwrtppjT+OhkxeFX6aXAz/iuJ2E90CDlGIK1
         dOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Xb6BDDhMmp8JdjDq0w3krecr2eqLH2th+7g6s6rhB+c=;
        b=X/41VQXMz7LXHEgZqFCn+QWh9UzZ6IHFToLCbObln/UY56GS8YQL+6E70d/UhGPvf8
         NfkPQHg/mVazwLyE4RcSHdPiPid5n1ydSN50zBb5IqTyyriL9UJ93Ml/pH9dNEGJ7fBV
         MpgsyMtuCBD/E32r75in7trgi74DiTswq6IzIXzCOnUHaI8Y/coeF0K8uPpVDvucbmOE
         yAGuSAORfb2mDBZMZiRtxD1qalAtME75IrpThvKCM5tjr0y/7cQhyo2ncneMhPcNQFOq
         baNW0Dnq61nXB/zhYZWRQBUSvCBtRC0wryXCCuOO9aO82WXB62aLy1MJ5XCh+gV08tX2
         PqNA==
X-Gm-Message-State: APjAAAURped/A0HysuzhcQRhkBnOy9ZEhE9afvb7vfFscs9rFbpacDhX
        J9rzbgAmxmOtpU/HBjNy0gIxeLltm60=
X-Google-Smtp-Source: APXvYqw9qMeV7TgxIWBK7FAb/8yue6jHQYB3UQxe1lXtwT2qpxxmDamR7NFwhOB0VUFoRJ1daM33rg==
X-Received: by 2002:a63:8e44:: with SMTP id k65mr487695pge.452.1582825923657;
        Thu, 27 Feb 2020 09:52:03 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y10sm8155060pfq.110.2020.02.27.09.52.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 09:52:02 -0800 (PST)
Message-ID: <5e5801c2.1c69fb81.6ffea.4b9d@mx.google.com>
Date:   Thu, 27 Feb 2020 09:52:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200227
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 153 boots: 36 failed, 117 passed (next-20200227)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 153 boots: 36 failed, 117 passed (next-20200227)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200227/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200227/

Tree: next
Branch: master
Git Describe: next-20200227
Git Commit: 10569a280f259f696c0b32fc1d45866d2fd33f53
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 62 unique boards, 15 SoC families, 24 builds out of 219

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200226)
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h3-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 9 days (last pass: next-20200213 =
- first fail: next-20200217)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 9 days (last pass: next-20200213 - =
first fail: next-20200217)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 9 days (last pass: next-20200214 =
- first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubieboard2:
              lab-clabbe: failing since 13 days (last pass: next-20200212 -=
 first fail: next-20200214)
              lab-baylibre: failing since 13 days (last pass: next-20200212=
 - first fail: next-20200214)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: failing since 13 days (last pass: next-20200212=
 - first fail: next-20200214)
          sun8i-a33-olinuxino:
              lab-clabbe: failing since 13 days (last pass: next-20200212 -=
 first fail: next-20200214)
          sun8i-a83t-bananapi-m3:
              lab-clabbe: failing since 13 days (last pass: next-20200211 -=
 first fail: next-20200214)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: failing since 13 days (last pass: next-20200212=
 - first fail: next-20200214)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 13 days (last pass: next-20200207=
 - first fail: next-20200214)
          sun8i-h2-plus-orangepi-zero:
              lab-baylibre: failing since 13 days (last pass: next-20200212=
 - first fail: next-20200214)
          sun8i-h3-orangepi-pc:
              lab-clabbe: failing since 13 days (last pass: next-20200212 -=
 first fail: next-20200214)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200226)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
