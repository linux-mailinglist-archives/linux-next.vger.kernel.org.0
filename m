Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3C70B8481
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 00:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393595AbfISWLe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 18:11:34 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:35312 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391879AbfISWLe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 18:11:34 -0400
Received: by mail-wm1-f47.google.com with SMTP id y21so121040wmi.0
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2019 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sZlUcl4Sn9dUow7P9n3OB/d8OJoGz/szdyX/1PnFJcQ=;
        b=jegzDx5fkUcWzywqQ+uS6+dqnEOtd5LbdeGJDCmywI+DjjZ8amy8oIiTs+gvehQxU6
         M5+YkMpM+tduGJlaPwecB/eCaKofRcmJRzz0yuY9svb3qwtdTIcuKelb3199qhOvXPuI
         ynUnoYfLDozDZ4PZe/uYLaDpsS3jMUWPjvafG6nNisi9RWPFyxxwNuBRFTne/MnmKPhV
         Zav2M0JM6rUgjn4qpSB1OS5uEFMwLTmsrliUuxbnckNgrE9PsdCqB49jTpkiQM6ZQO0/
         r0nXYhqLrD4yEC5XmJAWhkG9dR8O5cOQm9A8MGt75RC9ACrC02zHbWM2OdwoMfPqFj9b
         Qxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sZlUcl4Sn9dUow7P9n3OB/d8OJoGz/szdyX/1PnFJcQ=;
        b=AamhatIcrEBrNYHkYFBoYnXLYVKsTyhUtmMSEYlRywFQpiWcq7xPU5mr/k7yYHcy/e
         BQbUds+wE6lmQztPZdr8DK3DwG+Y9B5aHad7v9sX2djRUS0ohBBKeO1YtZMOn2dZKwa1
         OUvkH8p/Im+eloHzDNOE8baLiwRCpUy8X6wkXNEI33RHWAvchsRKRSKon6tQUaDsSbY/
         2QaIppoO1CMI6uzyc2uI3iZ6fXLV2z5iE3zAIhIjCVytBNLXXYvz/lqV5Y2NgAtMIl7F
         vs3nI1BLeaWqPpLi8XPRKfmGKvY+XL84UZS9Qv57XTXm0uUl3gMmmjhI62pFNTjzDJ4K
         r/Ew==
X-Gm-Message-State: APjAAAU1OmywQHXSwtqjtObWOAC//qQtZYTvnqyQX5fjgh+SJ4/e2CZJ
        6ugIbCRW/eJnLUZFPGOiiKmjYGgsX/ndEQ==
X-Google-Smtp-Source: APXvYqzu7iJUVaLwSgTW0rM3KzYjt31e6MgGSgz6EzlzJaY0ZnyRLgvUo93nFnBa5Iyi46rY/RVy4g==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr69057wml.169.1568931092943;
        Thu, 19 Sep 2019 15:11:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z3sm6344845wmi.30.2019.09.19.15.11.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 15:11:32 -0700 (PDT)
Message-ID: <5d83fd14.1c69fb81.52bf.d2fe@mx.google.com>
Date:   Thu, 19 Sep 2019 15:11:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190919
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 316 boots: 18 failed,
 276 passed with 22 offline (next-20190919)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 316 boots: 18 failed, 276 passed with 22 offline (next-20=
190919)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190919/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190919/

Tree: next
Branch: master
Git Describe: next-20190919
Git Commit: eb2f12732f67eea9914f1c37c1f10d27127063c6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 27 SoC families, 25 builds out of 218

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
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

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

arm:

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

---
For more info write to <info@kernelci.org>
