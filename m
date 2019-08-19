Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D78B9949C3
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfHSQYl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 12:24:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40303 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfHSQYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2019 12:24:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so91065wmj.5
        for <linux-next@vger.kernel.org>; Mon, 19 Aug 2019 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AaTxpjh+DdUS0jvQ6T9ArXwa26EjJfOXhnQ/adLyx8Y=;
        b=nisWMxAtk6d9DF8FirOvha2ZDNJifNt6vPmtJLQqh0fYBcj6cBqQT2PdIK2SBisFvX
         e2A3h03kMn+znz4vFkQWGkxyNrxTEHk1jOnfW126nVwu19DW9PPq0n+uyZfz80TI8rgB
         ZAUaWEmertYTpypI7Qkk3900Myew7hYtICP/uNIa1hjnWHTlyzTive+w/21RRSy/SiIW
         vjTCjf0G2iVGC0pmtrF7Dr/W3z50Mf04MZQYUE7NlsAVUaIIedGRZ4TUTN7+VL/Sp6xy
         Gd4/lpQR3X6X1KnJXaKoWxaiNhp6nGq/lHrRofAmobWu7VTV1uQNv87JGxpk54Adjkzg
         FeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AaTxpjh+DdUS0jvQ6T9ArXwa26EjJfOXhnQ/adLyx8Y=;
        b=r/Mz7zVcJtpgCMa1Y4zuqSe7T/dg6KtnZeKQi1AjwHCAOeQAOJyWY89Rkqv2kfnjHd
         SHmsnlOK6Bw9zq4ZVlU0VA3FVOcjlbKJs4WGXAJrRao4RcZuuaWUmcA1b5DkbuSfTr8H
         eozUPA9RbvqY5u/H/LuiHbMU4qMlZ9M+i+mrMMWvnMqplYxKrMZ870sxsLdg0dcnxB5Q
         a4J2VtwgcttzRcPIBVXseqO9YfOpkBVF27v4W/q7hTJouEVrzKooeNQGJ2jg1DwPO2CK
         /pFYPQ+hUaP5Z302beJzFwl47bGPqNN6OgKqYNi3Pkp2JbSAjOzq62etjHf9dPd2AjmS
         Iidg==
X-Gm-Message-State: APjAAAUsdK5LcBKOmW5uxGpYtzGCubOFqUddyK17dXJqoZBEnoLPQez0
        LfS5slXJyjdfEprM4sfz1UNBCgwp7siOmQ==
X-Google-Smtp-Source: APXvYqxHB4Grs7Kk3EXpapEEQLuAs+jMZD4yUyC+4yM7yEB/qKK9We1dVtglXwWuYu880mWybXxOdg==
X-Received: by 2002:a1c:6782:: with SMTP id b124mr22672086wmc.143.1566231878430;
        Mon, 19 Aug 2019 09:24:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c15sm41566786wrb.80.2019.08.19.09.24.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 09:24:37 -0700 (PDT)
Message-ID: <5d5acd45.1c69fb81.bd5c7.b746@mx.google.com>
Date:   Mon, 19 Aug 2019 09:24:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc5-211-gd078de74e640
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 173 boots: 3 failed,
 146 passed with 24 offline (v5.3-rc5-211-gd078de74e640)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 173 boots: 3 failed, 146 passed with 24 offline (v=
5.3-rc5-211-gd078de74e640)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-rc5-211-gd078de74e640/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc5-211-gd078de74e640/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc5-211-gd078de74e640
Git Commit: d078de74e6405b65d72ac571477031a0f660c6f6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 71 unique boards, 25 SoC families, 20 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
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

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab

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
