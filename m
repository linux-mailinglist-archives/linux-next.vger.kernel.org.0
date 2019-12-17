Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A52F122D78
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 14:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfLQNxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 08:53:18 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:45609 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728554AbfLQNxS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 08:53:18 -0500
Received: by mail-wr1-f44.google.com with SMTP id j42so7191541wrj.12
        for <linux-next@vger.kernel.org>; Tue, 17 Dec 2019 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=uNW5byEOi5e2MV+d0u2RMRL/tor0KYARrjwCxoBaWMs=;
        b=OpqZOGBFe0nJ+rpEmTJ16n1VLVD8Q14K+hPm5Xa15u9c6W8M9OoTcTm6MbYre17SAr
         ckd4qL7nqdZumlJsUKZEojFIEh5zcJDxLnkQW8wf3fiw/rKmnkvgreYsVB7xjWXox+01
         bT/uJrk7r2Xt2E5CStdqrXEGwLNb15bTk75JrfqJiyzWsLDtlWw6RgNPizJul0zrp0E3
         vKII64H4P68jA5+TE0JkqDFmnhLGeW4dkHnYVmFfTWmczDa0QnfRvJV5rsxvsqc/hs4o
         ZHBXv6X3Z1vWSBs9eWJQVDVsZSQ5DzGGkJSHLUVrkonu9pjtXJksHxeoEjmzNHw0X8dM
         vjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=uNW5byEOi5e2MV+d0u2RMRL/tor0KYARrjwCxoBaWMs=;
        b=J4ziU3W+bFesq7ypZeVAzE72X94KNXgxRN/oFh26FdrvPC6dvSDMy5AWdao6EadGyP
         mcmUtRw4tcbm3uTX5sU8YbmJM1a1NL26E+5BcLekgnyk5ko5ogowmapSwB8FeWLzXM5R
         ege7SwdKoVeWPhwjHSfWZGczOziwQQn4dpIRS975txuyxcwnWt1KnzcZziIMfVL5ndFG
         klyzOMAnNF5+Li1/qFoRZy11m2p+rkJqNhLUv2m1uB4jjuaSCw0MwyzFkly7n0ICRium
         sIwmtXCENUlVuDksDIM+JCg0xZJee9X4+/NdksRbfTuIqaN3quq1PZhbRzDwCWf2OHjs
         lhyQ==
X-Gm-Message-State: APjAAAVwW+oJQZRb2i+3H2WY69meESh0uHC9MGB+Lcq2uuDqkzxbfvSp
        84z8xbIqIkQD5wG7LRxEJ+U5gpuoKXY36w==
X-Google-Smtp-Source: APXvYqy2wQTy59PFEU+xpvZ1se6mfTyYO12pcflhuBVc60DxVXZkBQ8+F41x09z3SzXxBOKPXkSSEg==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr35725338wrr.252.1576590795834;
        Tue, 17 Dec 2019 05:53:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j12sm26763314wrw.54.2019.12.17.05.53.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 05:53:15 -0800 (PST)
Message-ID: <5df8ddcb.1c69fb81.9425b.8871@mx.google.com>
Date:   Tue, 17 Dec 2019 05:53:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191217
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 203 boots: 7 failed, 172 passed with 23 offline,
 1 untried/unknown (next-20191217)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 203 boots: 7 failed, 172 passed with 23 offline, 1 untrie=
d/unknown (next-20191217)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191217/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191217/

Tree: next
Branch: master
Git Describe: next-20191217
Git Commit: fca4fe890ea0352f7e9e4bf33ffed287946ff59e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 22 SoC families, 27 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap4-panda: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7629-rfb: 1 offline lab
            omap4-panda: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

---
For more info write to <info@kernelci.org>
