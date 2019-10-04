Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79E6ECB926
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 13:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730847AbfJDLdR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 07:33:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40917 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbfJDLdR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 07:33:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so6739601wru.7
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2019 04:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9ZuxXSUYX9tgFwU9f7UVOm0mtvJfk7A1gDhPBDcgRSo=;
        b=GXjPAHU8L9zN0b7x2F8UkE0Te9IW1OiG2BUtyuK4ZledyfPziBYOIeJ9KCwbEBfEnf
         wkkoZh6KvpxJEGzrl64JYArpTkN0UPZ07nIc8ntam7s3GdHcQ+Hsbrcp6/R8puXAvSBW
         rhtR1GwsqIR1ciFBFjAgVen2r3fX45EsmRmMp6aiF3MB81dyokuzJCn04rD5kDb3Wqq5
         giXQKvFJDdQ2K+mTD5HZZsIYmZ3fK2/aPxaY40+CNslgnNLoxa67vomHZR1AmvxyuKC0
         //UOVpKeEMff6wbxj9gWfCmXWg05DB+nrozpl7ZNXYkS1lWU4D05G6GaYwqX2vMRwLo3
         97YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9ZuxXSUYX9tgFwU9f7UVOm0mtvJfk7A1gDhPBDcgRSo=;
        b=iCpfQJaaBj6bSm9kpFFW49baozShKwS19Pu2AS7fljcoSu+U1xASmYGtSmmN1hOOvf
         tRMi7J8TzHU5wKdfPK3xH8u2GmbGEBeJjppocTUuhWi+NjqGvFUiP3xS2d28ByZ7/7CA
         59HrPn+eH+Fnm5bbYkwORcl/x6sql293h/1owP/VgUpuoDqJ7xwHUdC0qYt4zGTHPgT7
         iJ1HDGN0PKDIxUIphbH/9QMBdAqOR4+j3xwKrvPkvjyxqlJ3c1BoXk2jl3Z5PrVo2+1L
         occptRYsoOA3wjW+C8PzTeCRO5vXVJWjJd/hISigHdquhOvaVz/A06yA+0K5fWGgnhQo
         OaiA==
X-Gm-Message-State: APjAAAXY3j2mo8oKcpkGxeNreRsYbRGTo3BoE8y2ixHqfbU6kTbrm9oo
        SjH7rneRAhbL55bsygKKggwUogI74r5NSQ==
X-Google-Smtp-Source: APXvYqwUhm6YF2vEL79ahOE//f01iiZN2iLI3CC7tLr9PCgLRRtOI0EFU7IOzt64ycQ+KJ5yCArUGA==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr10807975wrr.70.1570188795285;
        Fri, 04 Oct 2019 04:33:15 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w5sm6595268wrs.34.2019.10.04.04.33.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 04:33:14 -0700 (PDT)
Message-ID: <5d972dfa.1c69fb81.1b5c1.08fa@mx.google.com>
Date:   Fri, 04 Oct 2019 04:33:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20191004
X-Kernelci-Report-Type: boot
Subject: next/master boot: 303 boots: 11 failed, 268 passed with 23 offline,
 1 untried/unknown (next-20191004)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 303 boots: 11 failed, 268 passed with 23 offline, 1 untri=
ed/unknown (next-20191004)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191004/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191004/

Tree: next
Branch: master
Git Describe: next-20191004
Git Commit: 311ef88adfa3b69c40234bf3000d1269e718919a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 27 SoC families, 25 builds out of 218

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

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

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab

---
For more info write to <info@kernelci.org>
