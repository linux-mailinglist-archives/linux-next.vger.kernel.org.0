Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C992B8DFB7
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 23:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfHNVUz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 17:20:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46228 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729546AbfHNVUz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 17:20:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so392742wru.13
        for <linux-next@vger.kernel.org>; Wed, 14 Aug 2019 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=F4UU8SfedkpcMGABbw3DgzdGVWExQCMPWQ1LbYC7DaU=;
        b=B3xFaH8RF/bme9RsRwYd9X7394xcSzrvSuBQXBLcy1nvxbnm1I/StitaaotzbGw4lr
         dKiIScHRtQhNoqV25vWkytRCL2wNWlf4baWBoZMvEq/K2MBZRklfYIbvXJDaKLf0bjlI
         BBWvG1AfclcUQfxFL0z8fBW1Ya0NR6Ajk5jb5nmqdB9b1KfLFcwnSHn5/yG5cnp+8WPJ
         CWGM3TnrbdKI27p13jP63IGeHKziKEE1t4MeLFOqdPqr2yo6xneiIFkz6dJ13Xbgdt/v
         wU7TMljPQ3n8rxamIHhbiw39koyJUmUwmmZbOa2DhrZAmQ8t12NvvvTNQ56E07QG1W2I
         4imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=F4UU8SfedkpcMGABbw3DgzdGVWExQCMPWQ1LbYC7DaU=;
        b=YR/iZsGcofHRniImR6oVHzTsk+F9l9NS1V05Qo82kWJMwAbniqSZh7FauxT2YIuEtQ
         gKSrhwk64EVTlbZWr4H49giv1jGK5rfMVlNW6P9bTSrfxSdUZCiaDBscjYkel0arbIaT
         9AAxSGiZwlaJmlTYp3yD2TNlR4gvpBgM9FcqQO3QV7KGEbeaF3nz3bIdIDLT6cawBl80
         eNd4CXPDy/mLl18vuqyRe6X7O0o56M5CEBZibuD0NVYqckkJLaaP1WD+2FzTbIQlfCvs
         oJGDA0+lPNEHR7pTk/74vBALJdCpoUtnRAra7pecPg/tHlQP8Ts4mY+dztKWCacbsHgM
         VFZg==
X-Gm-Message-State: APjAAAUlyBqsYJNLu8fNOFWzEKGV6EuwX6+ts0psVL065rpl3gkcV9lY
        1C6Z6EUqzmQTzCk5pYEspBDJJ4fegw927Q==
X-Google-Smtp-Source: APXvYqzIQe6L/bpC4YhgpRL5hs5swaJ89aIk1ibJLFSHl71r9ZtIW4p3FyJ3CbLehhGxQPggGZFVBw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr1681998wro.158.1565817653369;
        Wed, 14 Aug 2019 14:20:53 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q124sm651777wma.33.2019.08.14.14.20.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 14:20:52 -0700 (PDT)
Message-ID: <5d547b34.1c69fb81.4ee9b.35cf@mx.google.com>
Date:   Wed, 14 Aug 2019 14:20:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190814
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 298 boots: 13 failed, 266 passed with 16 offline,
 3 untried/unknown (next-20190814)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 298 boots: 13 failed, 266 passed with 16 offline, 3 untri=
ed/unknown (next-20190814)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190814/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190814/

Tree: next
Branch: master
Git Describe: next-20190814
Git Commit: 17da61ae48ec0c2a3e57bc840cb85494222e77b7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 27 SoC families, 22 builds out of 224

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-nanopi-k2: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        clang-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

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

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

---
For more info write to <info@kernelci.org>
