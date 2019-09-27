Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37392BFC29
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2019 02:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfI0AJr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 20:09:47 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:56277 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbfI0AJq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 20:09:46 -0400
Received: by mail-wm1-f50.google.com with SMTP id a6so4591911wma.5
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 17:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fherCAp5Hz9ubGfWG0Wj1QyxdaPfmkWPjj3eFTmyBqU=;
        b=08+ncK5OHORHJiOhFbMo+KldkzFHuoR+KMcnxoDj/uT+XKuYI4ckmLM/W95GxgCEw3
         QPBXLiEBQmGFYh+dk4Jl8IPFzyk5yV2GuOWOuYXGHncsYY38vkl3KOO/f1SQc2kHC6gy
         yHwvOMVZbDeX4GVeJ6C9wlD5J/kElTZt4h7X7olU8a8mlUKpD6fZD2N+bzztURy7Cyln
         PbxAxiIXuUKKDtOvlhBIPyAbiOaW+cEfAA7GQEu5h+5aGvykzXgAxAsJnxeLemZACWyc
         BlQg2xydTfvmwlQiui+Dlw5fVRHpeAAdD23KHFUBAuw2pUpwAVp9+xUvCd9ZxPRr7gP/
         70Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fherCAp5Hz9ubGfWG0Wj1QyxdaPfmkWPjj3eFTmyBqU=;
        b=S8jaE8dmKMBfX24UKpdlrY/CQEUftXO4yf0gwp9a52CvHJ4VXw1MtLmTs+jyRGDwVC
         0WCHlkvUQjIaIKUDwBHOSyDBqxmucW3TlHO2Ly0EhhHOA3YIdZHEhioO5/IaZMDE08Ry
         TGJ/5GVUdz1r9rN5Fpx/v4hdUx37vjAGlV8rLvLVA0KuHpUNUb32KOA63ym0vzxXvAV+
         hdsCQaJLtQAJtsirW4GnJXkdhT+DHiyM6ao9PI1XkEPuJ16GKhf8VfUNY7tKeDFzc0dc
         Rb2/b6cwiK8p6BV1xphfr0SfwJ7lu/vEJ2IHC907vzxLQ2bzTwG8dTez7ReT2TBCz6+S
         ghWQ==
X-Gm-Message-State: APjAAAWX9x6SmlJq2IiOOuNOb4tKOMEEm18tur+uUQmoPM1MmJ3grBWW
        WHtOHusRhL1jYTfJA7ywqrtEZxKy9sTssw==
X-Google-Smtp-Source: APXvYqxJjaBm78aNiu39ZihxfdY2401JZJYa95ziOYLwBf+qEpdEmE6zW4B6FH4ZsBKuAcoE4JV5cw==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr5203016wmo.114.1569542984310;
        Thu, 26 Sep 2019 17:09:44 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o22sm2166025wra.96.2019.09.26.17.09.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 17:09:43 -0700 (PDT)
Message-ID: <5d8d5347.1c69fb81.fcb83.8c18@mx.google.com>
Date:   Thu, 26 Sep 2019 17:09:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190926
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 339 boots: 14 failed, 310 passed with 12 offline,
 3 untried/unknown (next-20190926)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 339 boots: 14 failed, 310 passed with 12 offline, 3 untri=
ed/unknown (next-20190926)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190926/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190926/

Tree: next
Branch: master
Git Describe: next-20190926
Git Commit: bb2aee77c82d7e7c08d4c78a4f65c703eef0fc60
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 95 unique boards, 27 SoC families, 26 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
