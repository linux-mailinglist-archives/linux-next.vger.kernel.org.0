Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4821CD378
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 09:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgEKH7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 03:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbgEKH7g (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 May 2020 03:59:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E16C061A0C
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 00:59:35 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so4395914pfn.5
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RdKM19AVGYZdDiU3LAyncc+UKndwaeKzc7xiq/qRogw=;
        b=cU+RT+UBDX4XmaPi3v27J2EyasqzqS9xguEBK2ikPylEbSOTmkguY+MWSuUE8KS4/S
         zyJLvEF9q4PCUutsgvLYnaWQVnuNleZfvCly6T8DT+UCP8DUAhSEA+ZMC+MWq1NW7fqN
         PVflkfcb6R7eQbJzzuV72obXZhL4xRHo/JN8Py+g055zIcDqPBD5xG7PXARovZ96QeZ+
         KgZeWWe2e9n5RezYKAHQNwQegbQQ8yt2ugutY0F0tXn3lTVExOuxa62uu2uKQVh/UX+x
         cAb7wucqbp+8x4ODLK3QBPXx1zeGMemU/A0AIFWvCnXiiD7FHdTnwuVBecGWtTvJ4AE0
         n50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RdKM19AVGYZdDiU3LAyncc+UKndwaeKzc7xiq/qRogw=;
        b=rxLHkt4PnRiFj8spHuWXH3lLM9yiRgXOywnkZEOrAPpk5EN1hFQwOnY6vBFJYUGCGJ
         l1lnpZP36Sjio27QU95zrvqP+z4/WQX8il+38Jo6XqoK2kG9GPETEYqNB68dWI04Gimd
         TToME5KXlc4Q/WVX1PXRIac0Qx5burW3M+plIEyKNXUeUhUoRtZ9XRr0hdjDFss3zXjH
         VPBt87c6C2rNHM0f5c3w+HV6JkND9n52ojT5hN1TQDGVY2+1W/CB3MmIBAiwdokB2ubC
         B2xsZeBR7PjWV/jDhoavAei6DwfHNSISs5RTgtXShlNDJdUY5fXQXuncyZjJBO5vEFx3
         0DNA==
X-Gm-Message-State: AGi0PuaL32qICy3/KK/fK72nLhflMf7sAOvwyFe5ideiM7eS0LsX8Fxx
        sjpA+wug4HyXL5VbVZWjAKqXCJ143X4=
X-Google-Smtp-Source: APiQypINDi70SI4o2OK8tPNEaGNMdN6W1AcnLcHt13fuTVUo78jYWMr9LeaBOu82FmneyULhPA/hXg==
X-Received: by 2002:a63:6fce:: with SMTP id k197mr13481498pgc.431.1589183975006;
        Mon, 11 May 2020 00:59:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13sm8409280pfk.86.2020.05.11.00.59.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 00:59:34 -0700 (PDT)
Message-ID: <5eb905e6.1c69fb81.765cb.cfc2@mx.google.com>
Date:   Mon, 11 May 2020 00:59:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc4-552-g1e823790a7f1
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 255 boots: 8 failed,
 230 passed with 12 offline, 5 untried/unknown (v5.7-rc4-552-g1e823790a7f1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 255 boots: 8 failed, 230 passed with 12 offline, 5=
 untried/unknown (v5.7-rc4-552-g1e823790a7f1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc4-552-g1e823790a7f1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc4-552-g1e823790a7f1/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc4-552-g1e823790a7f1
Git Commit: 1e823790a7f114948e20f9bcd3576bb90d3727e2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 24 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc4-407-g604da244=
20e3)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc4-407-g6=
04da24420e3)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc4-407-g6=
04da24420e3)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 5 days (last pass: v5.7-rc3-277-g=
a37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: v5.7-rc4-407-g6=
04da24420e3)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 2 days (last pass: v5.7-rc4-364-ga26=
7cf4704df - first fail: v5.7-rc4-407-g604da24420e3)
          sm8150-mtp:
              lab-bjorn: failing since 10 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 30 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

Offline Platforms:

arm:

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            omap3-beagle: 1 offline lab
            stih410-b2120: 1 offline lab
            tegra30-beaver: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
