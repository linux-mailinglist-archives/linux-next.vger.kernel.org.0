Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86336B721C
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 06:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbfISEHW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 00:07:22 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:50846 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729163AbfISEHV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 00:07:21 -0400
Received: by mail-wm1-f45.google.com with SMTP id 5so2552947wmg.0
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 21:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/kt7eEkh9aACu/c7+oH8jnR0WtAB6mQdHMM+t7TpQ2Y=;
        b=CCAteej9mef+NlqpMZlhoR7VOYxmbTtYdmUtU6R4G+1FACW4ERjqb94Np0Z+eOyrMM
         ZON5ykx+ChImWmNK0aNTqkOILWQZDpX4f6H66B0cucXDYs6mV1y9hBkO+qnKX7/UvjSS
         rj6F1YDAP9jZD0bFjW52OogSXKbTjzSFNdu2/qrzOKl/p3VrVTO4fWPVlwIkuIwWuSeb
         rZBFGKo7Xje5wwgVRZ7Uiymj+nKmZ2orAzc9ELpt9a+tW/aBASs/7owRj3t7BboexBZ8
         xixSJw/Ujf5qm/gGWHjqUvFL5W6u0lbsbpzLuThFIAZtgIexD6IBIomCRfdroQoRojaH
         umyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/kt7eEkh9aACu/c7+oH8jnR0WtAB6mQdHMM+t7TpQ2Y=;
        b=jNrGwWknN7ATa7HJv1K/zxrBYdlDn30DSMADpP0SZwJeaSWxqb/hj4FzPz3uaSqI62
         urjTsmBRxebSwuFwTB1Hq8jfE/m3wlk7NJbtLDRrRtagyEDdQkmcVavMHD55/f/qmbRl
         N/9NL9SsBW0WEfiZQgWDapzR7SAspqvJ+wUply2oWNZ+htsZvB8onDDaFf4KRJyn8sPd
         ICkzCcJPMTlQMqFSyp8DD0eD1H9nXF4At0R4BaP494Q+E+FXZyTdF6psAm0mH5dfTVQ5
         b3cJAaU2K/COsW4Z0dBPl74epfwFDeGhMDBoK+TilAZ07XbfLPxXknzgMRZ+kGVtwfzk
         nNSw==
X-Gm-Message-State: APjAAAXY11cr2Ic8plNyhGT9ohaxGDAcD9fLU4GCgWTvf00PyqpEsTNj
        2PM1wyttT2lWI2+vMXQtnW1IFJjbbLcQVg==
X-Google-Smtp-Source: APXvYqwQ/0BdmL8Ceizr2RoaghVQeSQxba3SxQ88MDhZMz7l8+cImndNbbyATPWuqPNLtlEd8v3H3Q==
X-Received: by 2002:a1c:1a45:: with SMTP id a66mr871412wma.102.1568866039056;
        Wed, 18 Sep 2019 21:07:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d4sm8492988wrq.22.2019.09.18.21.07.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 21:07:18 -0700 (PDT)
Message-ID: <5d82fef6.1c69fb81.e6e8c.7275@mx.google.com>
Date:   Wed, 18 Sep 2019 21:07:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190918
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 356 boots: 19 failed, 325 passed with 11 offline,
 1 untried/unknown (next-20190918)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 356 boots: 19 failed, 325 passed with 11 offline, 1 untri=
ed/unknown (next-20190918)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190918/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190918/

Tree: next
Branch: master
Git Describe: next-20190918
Git Commit: 288b9117de5cc1b7fb80f54b7c17deed6f018641
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 28 SoC families, 27 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

i386:
    i386_defconfig+kselftest:
        gcc-8:
            x86-pentium4: 1 failed lab

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
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
