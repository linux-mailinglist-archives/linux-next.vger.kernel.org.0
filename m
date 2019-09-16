Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E81B36D8
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 11:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfIPJJh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 05:09:37 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:35933 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfIPJJg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 05:09:36 -0400
Received: by mail-wr1-f43.google.com with SMTP id y19so38005654wrd.3
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fPxW4A+HP8iVmR73iI7gAXkcAWArrV4Bi3EaE5sEHuw=;
        b=EaigyW5fOzYdNhzyriW31nDsLTL3cUwn570PEsWb0KciGWfLWp1oWQH71n/WPhkeGU
         kUFpvXzqnnvAsyTeMkKsFAQnY1AxG5OEYf59OcyZTVFcyjbFQdQ2Fih1F673xpKAJZGi
         2DieU0QxUp6p+A9LlEXTMjmlDGFhWNXSJnTPOm5+IU3wInpiOEjkPnGWeX/VJaICLK+j
         8mOByn/Gmltk0+EM9EMnuIfytNbervXA2KzZX2M8vg5o+TjwzEklUarLULqK7uvyzNx9
         lkM3PApLQZUdyYjdr8YLJKo/XEaTI2VxuHMIpFRl1Vhk1o817fI5oL/WLP2gsEr22orc
         yoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fPxW4A+HP8iVmR73iI7gAXkcAWArrV4Bi3EaE5sEHuw=;
        b=pwCSGBuJVvZxtZx+Aqe7yETGILFY2WxU88+AfPt9ZRUKPVkGHC24ZJ09GgCsMNBMIN
         dtq47JnYxb2bakQ0lcdVqTudUOdLK8v9OhHsSIhvMBDH0zS9uMaL2/uwJmAsowpIruv+
         DvcHp4iq+7crYKuyWtm4sRiiL0tDeLqGYNLI2f5Qi8ZXObAY12Y84Ove06EWHMzsEmAn
         CpP4SyYI+2NmeDClt/9nE459xd+MqbCobZORKEWrTAfyOrrbKweq7D464f9y+mMIGrah
         UY8UgzeLs0Nm9kQLi2KrPnOYA1oebVA36aFeCQLYdl7HrHV9CPiz3Q8anPhPoB1iHXTC
         ae6A==
X-Gm-Message-State: APjAAAVwK+RshvUelcU4c4E1C7PZDQdWAwWuqUXPshmWpfcaI87QokFv
        e9xXKw8O4OFqpBtC66F6Eo8Rd6vECI8=
X-Google-Smtp-Source: APXvYqwDbwPLLNo48yGJbZZHjx/3cd+sEYE/mtDEm8kmhUSfWSFxxbVyXNcPiI+l7e/8x1hdWT/XHQ==
X-Received: by 2002:a05:6000:1632:: with SMTP id v18mr29623096wrb.233.1568624970261;
        Mon, 16 Sep 2019 02:09:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t13sm73057510wra.70.2019.09.16.02.09.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 02:09:29 -0700 (PDT)
Message-ID: <5d7f5149.1c69fb81.90644.40f3@mx.google.com>
Date:   Mon, 16 Sep 2019 02:09:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190915
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 378 boots: 22 failed, 345 passed with 10 offline,
 1 untried/unknown (next-20190915)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 378 boots: 22 failed, 345 passed with 10 offline, 1 untri=
ed/unknown (next-20190915)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190915/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190915/

Tree: next
Branch: master
Git Describe: next-20190915
Git Commit: 2015a28f2cd57fc46ad14d1a763ca658d82ebc68
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 28 SoC families, 27 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
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
            meson-gxl-s905d-p230: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

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

---
For more info write to <info@kernelci.org>
