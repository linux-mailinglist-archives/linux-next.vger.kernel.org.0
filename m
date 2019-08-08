Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3045D8651F
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 17:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732533AbfHHPFh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 11:05:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55580 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHPFh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 11:05:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id f72so2740942wmf.5
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1QaHtKz5LoMnDLIY4pUxUDHrSAIPlTJqU7szsCgyBVU=;
        b=ycI/KCyh0PTpKV+1VVO38OLp1HA84dIRcyw+VJ57O4NPFBOE/Dub0+mLjt15Xg6OF9
         vtvqkgRp+aOMJMaCOhONs7ODX8R1DPgsEagsfW+oqIP1/k6CIpddAwNrM6uBSFeTulN+
         Af3VwxkapI7ei+J/yR0SfFKpw1HlwKklbjxgbNmc93Yys3ARgADYRfG7H/Fv+m7rJDBD
         uiBHSwC+Vcab5MTcLBW5YoB1B8yTAghy3KcwyYwfHK8xZTJ4AjF/POnF7KzX6y8hk0vl
         9s5Mov6IPV+eefqLk8LvlR5FTIjuETdqeKkf1HMCuOTaHI3rwcoB6uuELh7VJ4weSgFH
         3TwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1QaHtKz5LoMnDLIY4pUxUDHrSAIPlTJqU7szsCgyBVU=;
        b=Mk8YjCq3ma/vNVdY5y3JFVRMmCMLSNCxq/U8opiJO/odZkfwzK2RELFRBWufAdWK7a
         naqUPgr1+Gwap/tykgOdnGLWTYolSrw59oG1p45JHXhndx1XvuMHr73qyzI9V0OhyjtJ
         Hdb0bwz6ekgD0uRq0vveaALFf33hOLp6fvSKSOV1+/7mZMOLVBP+t6Nvm2s47kqNZInn
         Yvab2nZ4HnxFWGVYPmFuBSHYhxqDKzuEK4QjdQ9/BvAHtoMvooKlQeUMcbhpLrTKPRAH
         k1BkRhtb0EVSSlMr+SKmUUg+t9fbltxF6U2ls3Q5XWo61R4ZYGzeOAv5Dv9MpDUVlxrN
         diIg==
X-Gm-Message-State: APjAAAWcmfR4TxoO+x8rZWtiQhHvcp30//Oee10/F/12xj4jSDTBlFau
        cIxyvrXs3I4UNbWsUMXRiw0u2m1rBovSVQ==
X-Google-Smtp-Source: APXvYqyDqV2C8Gtfmtz/GyRXrj11vkqK6VW16tjTlWLacopn3djbucHLmkDY+N9K184vNNwln6hHeA==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr2803270wmj.71.1565276735170;
        Thu, 08 Aug 2019 08:05:35 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l17sm70151154wrr.94.2019.08.08.08.05.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 08:05:34 -0700 (PDT)
Message-ID: <5d4c3a3e.1c69fb81.b239c.d223@mx.google.com>
Date:   Thu, 08 Aug 2019 08:05:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20190808
X-Kernelci-Branch: master
X-Kernelci-Report-Type: boot
Subject: next/master boot: 270 boots: 11 failed, 236 passed with 20 offline,
 3 untried/unknown (next-20190808)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 270 boots: 11 failed, 236 passed with 20 offline, 3 untri=
ed/unknown (next-20190808)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190808/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190808/

Tree: next
Branch: master
Git Describe: next-20190808
Git Commit: 2ae2563177637a8a9f150bdac674ad5d36b95bcb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 28 SoC families, 22 builds out of 230

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905x-nexbox-a95x: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab
            qcom-apq8064-ifc6410: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
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

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
