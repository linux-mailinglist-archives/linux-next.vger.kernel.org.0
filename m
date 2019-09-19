Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7841B786F
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 13:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389829AbfISLZ7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 07:25:59 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:51908 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388045AbfISLZ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 07:25:59 -0400
Received: by mail-wm1-f43.google.com with SMTP id 7so4054925wme.1
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2019 04:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oPvtOafvq76kiLVqfAmEseelG4Y2Ff2XEtEcadYdFVw=;
        b=sUkcHgegQ6vAXIKQtwcJcnpNB7Vpf2mERtD+t6kGBFwXy/ekwL8wavMWeVECbZ+Bnm
         RirzdAdCXDvvy/9qRA3I+Ku5yARidnvTAB59Ko2eNvHTUi8iZf7H1s0xhL4uzp6uWMBD
         rNzsnxS/bxIJIB6KjIgHcwpfvVsN40bB+SmcBdWR8YlBsUU2CC8++x6GoXB3WaqCrHNR
         KmY3sJx/sS7r1tcKdtSW+VRXoloZWX+STSzeRjpN2nc6Bwllk0gOZwI7nTKRTGwDvkzh
         KtOtd8QvrYkHnJjcazUAlEMfTJxPwl5ITkNMYMmoczYPIBLUUsuD4oJszVx6cOm5q6rn
         CPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oPvtOafvq76kiLVqfAmEseelG4Y2Ff2XEtEcadYdFVw=;
        b=Xz0pOUgTGl8h7modiVp0S7XtcrAqbJQ+shcEMNqfrWUPbYrA1Ys9kM/tSxBWLLnqYc
         ueBpXVDAHJcs3+RZ1hM0X/FNqEpEAri9inTcddErIjIMDjrSXJ2UkQ/88E+3W/1feIfY
         6aISRrFFGmOFJ6BdtKY7rNvVM5C3YMJF1D8vcQJdKOyLQ65fAYOYqWeOCLu5WsEHzXBW
         Kn/G4WF/M60NHxsheXQZ0RvgHGZ8fhlptuLirdAjUyO3Foxcx7/RWthX3hWK/DjQ6rMO
         lBem2KGAQ4Dc0X0W7BIC0Ld5M/dsTnvnIMaSD3IeXg1uEf37PtCu4gLB7wPi1dgG3KH4
         VK2Q==
X-Gm-Message-State: APjAAAWja+IMZaL+c9xpfeMQyGkWjQYhrP98S2jscY0V92+S53O+mm6c
        owyINaWPaKTfUiKPR9I7NgGWrA87CixhtA==
X-Google-Smtp-Source: APXvYqwzVzxBmXYi+hC2JGBTZiROsHEgg7yfx7yIk9A3eBT7KiXqjngb0JK807OYSuyGAQj13k7cwg==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr2161562wmi.61.1568892357235;
        Thu, 19 Sep 2019 04:25:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u68sm7913808wmu.12.2019.09.19.04.25.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 04:25:56 -0700 (PDT)
Message-ID: <5d8365c4.1c69fb81.96da1.332a@mx.google.com>
Date:   Thu, 19 Sep 2019 04:25:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-7731-gcd0a293e6cef
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 325 boots: 14 failed,
 299 passed with 12 offline (v5.3-7731-gcd0a293e6cef)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 325 boots: 14 failed, 299 passed with 12 offline (=
v5.3-7731-gcd0a293e6cef)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-7731-gcd0a293e6cef/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-7731-gcd0a293e6cef/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-7731-gcd0a293e6cef
Git Commit: cd0a293e6cef4a0111ed8d5c7f9350aa1c9096c1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 28 SoC families, 27 builds out of 214

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
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
