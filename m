Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26F4DCB3B3
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 06:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfJDETs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 00:19:48 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:39967 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729226AbfJDETs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 00:19:48 -0400
Received: by mail-wr1-f48.google.com with SMTP id l3so5285683wru.7
        for <linux-next@vger.kernel.org>; Thu, 03 Oct 2019 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=S08NEo62gfCcaPU7MxwGw43LALxiWtJw26ZnCbVot8g=;
        b=UBhKVSrlXkPmGjrrdO7IZnE0WlFyVz7MX5xjNGClqk2Y+M1+M3DkEsIj8g7Bn1QOE9
         90tJVBg7gYkSdd8CJmq2n1Aivv/zJSl/WDSh2Bbu0+0jVrSCH7cRnC23ohSGqjyPV2Dx
         zA9s+Jd4QgkvQO7yIoWqpCkUD39sU1qrI97ZMrsZryMR1JZCnB0xR8aYfoEjOQN5QpiP
         Jv3nrOPY92Awrw22Yxu4JHy/yISyOtprV/k6hVpBFJ3E4JL7TiY6wr8tkOSRqh1aqbuv
         1ySQ9+kWSC8NrryR1Ev/LMwYciILMVEr09eznOXkdhzu6FXiDzGmYCUWRLah4GIS3KcS
         m1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=S08NEo62gfCcaPU7MxwGw43LALxiWtJw26ZnCbVot8g=;
        b=isFpNo+HF1Y0XKX36nes7k5Jfm/9JGCeYa3EeWFVPeZDzxZOswkjsiD/40DXSsGNoA
         WsRX2etU9A0jegtPh7KuvKhQxQUECEK+VsVLJeftTcKMJR5I3jcarbYhRDNrPCy+7dil
         zPLQfSlxXCnTJ4iJtkGwMXsOUDX2lLqATf0UCgjJWp42rkynEsVjz+lRdCVHUrgYDAcu
         ZUxEzxrtaTPo2xKOPN+iO1igNoBOw7vUeJEZhXPuxOMvbm2iD3+Z1IK3FtBQES8l88Pi
         Gj9jNMpCxP234q/0S0tbAjFbdgKrRBmjyL6yCSAX9+yALMRLYSPktbrWjj6OEJymJI6R
         lzRQ==
X-Gm-Message-State: APjAAAUH6/wsGj/acHmZkxbYEwdfEE4aee9/GAuSPiNESYBYgIuVipEq
        4peef9QUleJRiiatdseQs3KV964ojdu1pQ==
X-Google-Smtp-Source: APXvYqzJV25bzEdfqhVdTc6hXZkS9HUu7P12AwhPnR52P+5/+jXLR9P07+RPgzjuQ8k6RmZBuZkJ2g==
X-Received: by 2002:a5d:470e:: with SMTP id y14mr9298441wrq.332.1570162785382;
        Thu, 03 Oct 2019 21:19:45 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b12sm4763500wrt.21.2019.10.03.21.19.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 21:19:44 -0700 (PDT)
Message-ID: <5d96c860.1c69fb81.7ba56.5855@mx.google.com>
Date:   Thu, 03 Oct 2019 21:19:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-261-g829a15f23627
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 285 boots: 13 failed,
 258 passed with 12 offline, 2 conflicts (v5.4-rc1-261-g829a15f23627)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 285 boots: 13 failed, 258 passed with 12 offline, =
2 conflicts (v5.4-rc1-261-g829a15f23627)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc1-261-g829a15f23627/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc1-261-g829a15f23627/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc1-261-g829a15f23627
Git Commit: 829a15f23627ab3211304a590b7786e60576960b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 27 SoC families, 25 builds out of 214

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        exynos5422-odroidxu3:
            lab-collabora: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

    multi_v7_defconfig+kselftest:
        exynos5422-odroidxu3:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
