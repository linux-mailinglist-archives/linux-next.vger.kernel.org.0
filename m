Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8671EC8BC
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 07:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgFCF0F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 01:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCF0F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 01:26:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222B0C05BD43
        for <linux-next@vger.kernel.org>; Tue,  2 Jun 2020 22:26:03 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id g5so812046pfm.10
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2020 22:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ExW2iN4cT43BShINNTCYsC8z2xayKIE4BuxUtHqp9I0=;
        b=Kr/hlyayrSnpRyKu3d1TOFzXGtgPqzB4Xg+XuEicHcyItDTqdGNDq8I4Nb99+u78CN
         bWluTuDEvDVcNpUOsB3HQX8BHb1wOOBhOxKyul1UykOC56eIbPc2K/6kdBdpkE1G6Sq3
         wb+h+D/QO9rD+v6btly2PyzFk4H1LZxlMAJF512aezSv2dgCwJBu9F3kyEJ/OIuJ50Ce
         QfSwJDxeWXCO0u3xAJgpfNSyMyvVsEzKwfB3vb7Zndghj2fQtsA2bMCChhADzwCDMuRN
         9Or6Dz1VTY3bdaRCxAnaJU3sWUmkEGsK1ivVNjeyQCv/x2xn3nFzCmqykkxN82xcixkk
         adWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ExW2iN4cT43BShINNTCYsC8z2xayKIE4BuxUtHqp9I0=;
        b=EuzKMzYsq1uY0rtv+5K685TxiAVA5OPTDwhtfPkdaDzDvwTNnhrMveSnEQgtfLRFGV
         +L/5+k2VLHybPE/9GaNjPwiTwyDovj7UmTS2zTtoLHZl3AGkadKEGIOFQniWsZ/eC3rY
         LbEZV9EnLltRtzARcOY4gZnlQ/UXzqrq8W37XUcDcUzckJI3gDD12ZxmGI/Kr8iaCI6M
         We2V4qvzOVlsY9Z/Wel9xCBT7VhraKCOpPF84KmmAMsdOlQNvi8hDzT2e7Hk17u6oon0
         ByqR8N5W6qZQVqEyfEYKZJm649Gz+HgmdRNIvKMRdtAd2yeNd6nWSB8lgh2QpbTv9YOs
         NwqQ==
X-Gm-Message-State: AOAM531B6T8/H7pIpIIGRaDk0eH1KOsjbULu6+6DxVKz3LFqPCEsTnKW
        pGylrn6peRGbVyzp65wa8n9cOkgofmg=
X-Google-Smtp-Source: ABdhPJyeDvSOBXd5ZVaybzhmRN8RUKgAqFczR7kS40PP1ddIjp4DjWsonMC15LrztFIz4fsh9SoU1A==
X-Received: by 2002:a17:90a:7645:: with SMTP id s5mr3527086pjl.50.1591161962120;
        Tue, 02 Jun 2020 22:26:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gd1sm816792pjb.14.2020.06.02.22.26.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 22:26:01 -0700 (PDT)
Message-ID: <5ed73469.1c69fb81.74d6.31e8@mx.google.com>
Date:   Tue, 02 Jun 2020 22:26:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.7-3707-g4973fabb59f6
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 214 boots: 4 failed,
 202 passed with 4 offline, 4 untried/unknown (v5.7-3707-g4973fabb59f6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-3707-g4=
973fabb59f6/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 214 boots: 4 failed, 202 passed with 4 offline, 4 =
untried/unknown (v5.7-3707-g4973fabb59f6)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-3707-g4973fabb59f6/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-3707-g4973fabb59f6/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-3707-g4973fabb59f6
Git Commit: 4973fabb59f61553da8b677333357e016550eeef
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 23 SoC families, 27 builds out of 171

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc7-238-g5=
9fcbde6ab90 - first fail: v5.7-930-g3a1d4c3e458b)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-930-g3a1d4c3e458b)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.7-930-g3a1d4c3e458b)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 53 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

---
For more info write to <info@kernelci.org>
