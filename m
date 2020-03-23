Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D53318EE00
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 03:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgCWCbf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 22:31:35 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:33563 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCWCbf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Mar 2020 22:31:35 -0400
Received: by mail-pg1-f180.google.com with SMTP id d17so5848867pgo.0
        for <linux-next@vger.kernel.org>; Sun, 22 Mar 2020 19:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9KDK93xOdeufRCmEhSK0GjQCWTBjpgAHAJSHZXq4puQ=;
        b=udi3HLr6Yyt2fu3p8HB2S0DAawmvWK6E/v5MGkDN7r9yHOSfzvFSpdKxNuE0SQh8U2
         ePKAsWaV8LIc/APMbAc0NnFdJYHXrnU7tBWc6Z4XMKWyWKH2va7KuTDpdt7Sx0NpJQvm
         r0Q86aOglwRpFE0xIzJ/ACqDXQdThOxri47CpB5/SVknnTxlAoo+UI4OYYPyza4tJfPu
         YdQUkODDjasi/8Fy0Y5ro9QjCfJLiwuO53ALLJOCX4KMm9/8arUOtjldh7GgSd65BCbX
         7hLog3H8JOxki/jVzJjpGyi5oA6z7E7bo4CrusRmFzxC+jxTNt1G9RJ0KmDNxho2D0ag
         AHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9KDK93xOdeufRCmEhSK0GjQCWTBjpgAHAJSHZXq4puQ=;
        b=rfGVpfXyBpUPFvOzCcN/B3wttvqX+COg8enQqKVfEJPY/ldHWiar0PZn6UJZfsR0Rz
         cwAGrlYlhDVv0kFJmCRybWgMMRMHDU5ro8hPEjiiiS5miEh4+rACrmMrDNsdTuu7t8JW
         UeKPNl0oW3BcRqllpPe6e3v/yiPb4yKhhRCmfeXb1a9ytm1RIKeezLz0JjqmrVDkIcw/
         gcMmW5y9NtsO7oLhkTY3RMOAxMEsh1s/SDmuu2ZgdVCdEoCvPaKvzvk/8oSaz/Z3JJrZ
         0EKh297ZfxyubebH0QozSkTV9PG7F4MNE7iIhJoP4NXsU7cofT9Y0bygVyBDuoivCav/
         yQ/g==
X-Gm-Message-State: ANhLgQ0mCGK/Qyecp+wkjAcfiwFrOINen3HJqJ4NZyZiFK/H1JEHq25s
        BfIjmB1qe4MmXBszcQhREEemaz16+Uk=
X-Google-Smtp-Source: ADFU+vvRQHW2lXLJcmgsizYu5w+t1J9YJuCk2TZLg/LB/5k79GzuGYqJvgPbawJ4BxQOlScdhcU3hQ==
X-Received: by 2002:a62:fb06:: with SMTP id x6mr21720930pfm.149.1584930692142;
        Sun, 22 Mar 2020 19:31:32 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a127sm11701803pfa.111.2020.03.22.19.31.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 19:31:31 -0700 (PDT)
Message-ID: <5e781f83.1c69fb81.7a7c7.ca6a@mx.google.com>
Date:   Sun, 22 Mar 2020 19:31:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc6-370-ga32dcb4acc60
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 277 boots: 5 failed,
 262 passed with 4 offline, 6 untried/unknown (v5.6-rc6-370-ga32dcb4acc60)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 277 boots: 5 failed, 262 passed with 4 offline, 6 =
untried/unknown (v5.6-rc6-370-ga32dcb4acc60)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc6-370-ga32dcb4acc60/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc6-370-ga32dcb4acc60/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc6-370-ga32dcb4acc60
Git Commit: a32dcb4acc60dc98badb734775b191d6d76f4b06
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 23 SoC families, 30 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.6-rc6-295-g996cfaad=
8d71)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 37 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: v5.6-rc6-295-g996cfaad8=
d71)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.6-rc6-295-g996cfaad8=
d71)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-295-g9=
96cfaad8d71)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc6-295-g9=
96cfaad8d71)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
