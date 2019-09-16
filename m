Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75193B3A3F
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 14:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfIPMZG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 08:25:06 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:43531 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732490AbfIPMZG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 08:25:06 -0400
Received: by mail-wr1-f47.google.com with SMTP id q17so33968822wrx.10
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZnYqcQqukW7P117BA09p62ESxm8cMhxg1S+b8U1tyuM=;
        b=RLEIPWf/5jiow8QSoL+y46mc8uVzV/txFCJpArplH0T3oUSWBI60a4rhzLcdF0B3m0
         WcBh8yWqi+urrI1B+4c017bnGBrRim1UMwQ36fQVy32iLIGaddyi+LiKUGU99r/g/0vp
         WgPgCqMiBpFpW6W4s+h7l8T2HbHxdRkzSUbNpoEA5zD2/SJCuMOcW8GMLK1YP/cIiIBT
         JmOIFZQKFouc5NwbpiFwDxIU7Hjxnr5WPDLJTKX33rjq2gDzAwXucYcgHq3mJ7rpUHxU
         vnhdwXKJ+Jj1tbwMWwxgcKkRy35bpeD6Vd6DNyJjzRwTIcknVE3Al65eRHWUXn781dH+
         qNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZnYqcQqukW7P117BA09p62ESxm8cMhxg1S+b8U1tyuM=;
        b=tLR2We/ZF9wPOZayqS6oRfzlBmtB+vVcBQmyP8RogVbfLdfF93wQjzLprCpNMjJLDg
         rMGoh84JoMuCzFP88WQ+QCZrWLjksjHmo3bvpNPshqkuMZqIBSx3Bt46P9kedkDTDaeK
         XsMeLAgvjTyPKJzA7zeujAhCp/lGjBMAeoOvrGenNER/LkxUEXMJ3Ow3ixFdSlGvXj09
         iNVVbGikvEoNDJDdxhZhyMrWkUPtLNy2zaaPHp9CUp9kvQzFwj+tAYi2noqAkZT8EKKm
         rjkxmnEM3QBBLFZJmWWorWhOf52FMKat59xWE5gBJp2y4mIIEKVjFJctJfn2RcATgQvt
         LCog==
X-Gm-Message-State: APjAAAU5tNc3221SSiKZhZp5+P0xmDoGy+qurl6vRIYygVa3LP5mrkJ8
        BJsei9Gj3EdWUujHR4gnKImR2Ey4hsg=
X-Google-Smtp-Source: APXvYqw59m7KCkc/3m9DbVYmCPn2gCfjf16qjaOVuu61NlM0aCmlK+F728aBV1F5cNOPLfcbV1X9VA==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr11421479wrp.290.1568636704704;
        Mon, 16 Sep 2019 05:25:04 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 33sm47458624wra.41.2019.09.16.05.25.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 05:25:04 -0700 (PDT)
Message-ID: <5d7f7f20.1c69fb81.91aff.a927@mx.google.com>
Date:   Mon, 16 Sep 2019 05:25:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-586-g78e9b0f1c69e
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 327 boots: 11 failed,
 304 passed with 11 offline, 1 untried/unknown (v5.3-586-g78e9b0f1c69e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 327 boots: 11 failed, 304 passed with 11 offline, =
1 untried/unknown (v5.3-586-g78e9b0f1c69e)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-586-g78e9b0f1c69e/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-586-g78e9b0f1c69e/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-586-g78e9b0f1c69e
Git Commit: 78e9b0f1c69e1bb067e2f5495bcc9aae3e472034
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 28 SoC families, 26 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab

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
