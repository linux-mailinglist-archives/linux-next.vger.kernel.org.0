Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753FE152805
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2020 10:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgBEJHC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Feb 2020 04:07:02 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:53240 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgBEJHC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Feb 2020 04:07:02 -0500
Received: by mail-wm1-f52.google.com with SMTP id p9so1527759wmc.2
        for <linux-next@vger.kernel.org>; Wed, 05 Feb 2020 01:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=N4PDtDHaIZz1FvVK38oxFDF/fV+YA9B0oSLI+BppZF4=;
        b=HSgfBgwtxWHreeeTPTS4TARonbXwq9HwqlYPJWOvzQhabnvfeNWqXyFkyyrBUmWllL
         FaB07aiBfu93BpbBWEBuFvKB36Yi6nlApJwnb2grwgvahkADJs5eickk/QjBmisCpHwm
         0W95TAmoRDcm8tsE4tIgD4tx4EcDiENvco7dDNOi1frYXqtg8IH2HKIx5yayJXVGtFdd
         qRLZ65kreFkIK0RH9OWUd5B5+1/PIJQfyifoxrpV3q8EHNyQJ3CQlcfvYPN+YYTPgROw
         nzaJwFH5cGEkvCRBTT4ecgla7bl/wr4FvIeWL3mJ/nsBSmyU7kBPcZFjEIEW9v72IJSP
         qDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=N4PDtDHaIZz1FvVK38oxFDF/fV+YA9B0oSLI+BppZF4=;
        b=H0FUA2/f9LgHgG2GPa/uRz6ZrMkhFYblCVT3ux6K310fSF3jCWwHrD7HEKLDWQOba8
         pTJtGoqYTl8Nv2Ra5Zx9Q3DyhXkOgPAJd5sM/Tnx+toy8AaqX43vwkAXM9xPmSoLpQNR
         o9+fDiSAJZrcIe+l90uLDxgER8ox72PYzMsdpvdPR7OhJ66l7rd4qS732nUl5c4+nM5K
         kK9GUuFnoCvddYRgi4lVdmPrxTUf5c+E4D7dvrmN4cbTFGp7HFQjXQ9ipMeITGU1yHv3
         ZsuVEVpBXn02CuVDlzImP3rQS0kjRZzZwuwZr+HiyF3hiT8xqBEvJfsg8vdiuww4ETzH
         sHmg==
X-Gm-Message-State: APjAAAVFqStX38aoB+CTzMmE55ox+sfgQxIBEggSvIiur2grnYAnyEG4
        GkHLp0u9SitglPT2TX+WHLm/hsad1fhP/g==
X-Google-Smtp-Source: APXvYqymc31AX+re7nDAu6CKNuMVnHTmHxL0GT6E+8PEBrg8yOKSwf/BoLNeTl3dLNUy0XRuWZZIZg==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr4718763wmg.38.1580893619460;
        Wed, 05 Feb 2020 01:06:59 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b17sm34214271wrp.49.2020.02.05.01.06.58
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 01:06:58 -0800 (PST)
Message-ID: <5e3a85b2.1c69fb81.43a73.4882@mx.google.com>
Date:   Wed, 05 Feb 2020 01:06:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200205
X-Kernelci-Report-Type: boot
Subject: next/master boot: 207 boots: 9 failed, 192 passed with 5 offline,
 1 untried/unknown (next-20200205)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 207 boots: 9 failed, 192 passed with 5 offline, 1 untried=
/unknown (next-20200205)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200205/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200205/

Tree: next
Branch: master
Git Describe: next-20200205
Git Commit: 14b549456391a8b8f812529896b2690c16349734
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 22 SoC families, 27 builds out of 194

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: failing since 1 day (last pass: next-20200203 -=
 first fail: next-20200204)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
200203 - first fail: next-20200204)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200204)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: failing since 2 days (last pass: next-2=
0200131 - first fail: next-20200203)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 4 days (last pass: next-20200130 - f=
irst fail: next-20200131)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200204)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200204)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200204)

Boot Failures Detected:

arm:
    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            da850-lcdk: 1 failed lab
            dm365evm,legacy: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
