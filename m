Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 518CA127ACD
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 13:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfLTMOL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 07:14:11 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:50700 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfLTMOL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 07:14:11 -0500
Received: by mail-wm1-f41.google.com with SMTP id a5so8716699wmb.0
        for <linux-next@vger.kernel.org>; Fri, 20 Dec 2019 04:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2AONt3uKYEROHCwq0toY7E0/i4tdAP1QegACJTBhANc=;
        b=PZU83Ps+HIL5WyWn1lvMgg3SIXOGRmDR0vqmMkfPrhi+enfCoNgvK2vNwmkxROgbaa
         TQmPBIrCy9oppxOdIPrY9EoCz2waxQplsdmL/VK2hD6MW00ZZ6yCVIcn1/Onp8bZQCHk
         KbUEdP1MtT6YnSsSWA3tIGnok/KxlVOJ+bIxJr8qt5r2usBKupOwzGkd2NEboN5q9JDY
         9nQbTAPYmRh84ONqEvV7ZNcNyXrn++O5NFAQeYwiCS5FOHHjKRe27cstq5rhCk5UGxQ7
         NX4EK8ixKlIunWxmCT4WSS4XCYPF1wNMPlLoLQJ8HKigIwfhChYe1zz9pwvIT7QCXWOh
         wR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2AONt3uKYEROHCwq0toY7E0/i4tdAP1QegACJTBhANc=;
        b=VWQL4ODlWXe4MHV4KuWpN/6sSnwk6FhFzevjBwBBBCKqT2TtCJ2GbWVZMbrptIOF1U
         gfOoe7cATX6FxwV61K0EZxqr8llQOh8t96o9+ya3QB3SO8fSqE1Do9EaxN1O4bG4P3IW
         Xc2W094JQZY8WS8uz9/DsTiGAZKR3s5pmVDsMwBwYZlm2qEwOHWH5GBvMfFJrQZgcbpq
         P4WbzIjSEGYfVfQ1W/YolZLMhGE8T42SghgV90Q+Uu2OOqcsc/xSW1pi3f8+E53dtH6+
         MtiqrC0pb4YEzrOZDiCjvKe/cPBQ2AeAJTUZQlSOGpr1m/+ZOhf5bExIwtj0NBY4Ts7b
         9kQw==
X-Gm-Message-State: APjAAAUD8Qd5C8kFB+5YwIKVO5GwzCJ6m6rcbvyWTNTTz2VvCYnNbqeZ
        SWj6rt5jg/q8kkFaVYuf5taJTNfb7ceLTg==
X-Google-Smtp-Source: APXvYqxsib+kvJbgZLiH7ygULY4gVEoJfD2GibDoq3mzm1MWTtX8oUN8pTOMBInMAsB4BFY6MPkwLg==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr16865846wmb.91.1576844048784;
        Fri, 20 Dec 2019 04:14:08 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k8sm9721811wrl.3.2019.12.20.04.14.07
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 04:14:07 -0800 (PST)
Message-ID: <5dfcbb0f.1c69fb81.375af.14fa@mx.google.com>
Date:   Fri, 20 Dec 2019 04:14:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191220
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 215 boots: 7 failed,
 202 passed with 6 offline (next-20191220)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 215 boots: 7 failed, 202 passed with 6 offline (next-2019=
1220)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191220/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191220/

Tree: next
Branch: master
Git Describe: next-20191220
Git Commit: 7ddd09fc4b745fb1d8942f95389583e08412e0cd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 86 unique boards, 22 SoC families, 21 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 2 failed labs

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

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

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
