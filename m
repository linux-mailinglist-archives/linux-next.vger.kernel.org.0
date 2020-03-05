Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A9017B0A9
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 22:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgCEV3S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 16:29:18 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34679 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgCEV3R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 16:29:17 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so3196975plt.1
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2020 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3hQtrH0t/Y+JM13CkGPYaEDgoceif6ybzNJIYlg2bZ4=;
        b=pK8MNFu4twQhqhkaiToxYiLwKga8vArEN//ZNRf+zP1nFUNM+2A483moOtKqrxl+ol
         IiOx1VnOUBIxoAdW2jPFDafr+RXV80/nldhvnRwWX2gEwSSD00Z4qEYx7xUjOXiaYgEM
         s7BAe2imFbTT5DTb6i24CawHXJn1VPXli8oUs8ppEsLi4DTIkMMTlH/yVm12oln3R8dD
         uPZWEj7vGaLzgVzLIAMICN+Sme8funtBTvGXWBDDt+AocEPVcB5XDIhbrCfTqJlVfxFI
         /CxA5717gu2B1wItE7aCgO5gNf4fQdnJhdqpndgdaAWq0124vqqshQ3Sbm2sJTho6JKY
         KOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3hQtrH0t/Y+JM13CkGPYaEDgoceif6ybzNJIYlg2bZ4=;
        b=X0LXm1rLEK8w2KHuY6Qt9oubfH0TIcDRd4WW9/36ZebTkCQ99SLreSuBFYP+NU2x2X
         iWIGPB3C3sWdqBymzSZ4qy5V2LTfDyQDipITKKlLyI953vEYdevOYsCmEEnH6v/9m8eT
         /J/ljM1oD4aEh2PSzlcbklaJ1qO0jx7zVCb+TktNWRaB9M/SYHLAnfpsrslSEAoDHMoG
         E3x0eE6tTDGTuXjA3TaiQ+GrwLbHuYDCMXDtn8QSgEh/Ssg8pkd+Z1vQErt5hiQXgcCn
         AtKzTsJwt4RcVYOHo6V87RaAy6LLEbtbxwEiHQDVIHfvt9GRBjZyhEuCniRuYRnrW74R
         8dSw==
X-Gm-Message-State: ANhLgQ114oIAwHlzsFhzJ8Qw5/riegPXHkuH53B7F4uMLeaHutE19EqF
        b6o+dZbVWznHDiHIAljb8XhE62ULDG8=
X-Google-Smtp-Source: ADFU+vstPy3dRvJ5gI4gh6u+AkY+9bi23QVrO0KnmqQQLcc+oNuH0eULqPlLCuGzDFwwIeW/p0W7yg==
X-Received: by 2002:a17:90a:7ac6:: with SMTP id b6mr88323pjl.105.1583443756292;
        Thu, 05 Mar 2020 13:29:16 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c17sm12247804pfo.71.2020.03.05.13.29.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 13:29:15 -0800 (PST)
Message-ID: <5e616f2b.1c69fb81.3e2e2.18a9@mx.google.com>
Date:   Thu, 05 Mar 2020 13:29:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.6-rc4-359-gd038c5cebb94
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 196 boots: 5 failed,
 185 passed with 4 offline, 2 untried/unknown (v5.6-rc4-359-gd038c5cebb94)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 196 boots: 5 failed, 185 passed with 4 offline, 2 =
untried/unknown (v5.6-rc4-359-gd038c5cebb94)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc4-359-gd038c5cebb94/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc4-359-gd038c5cebb94/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc4-359-gd038c5cebb94
Git Commit: d038c5cebb945e819c82bb7dc88d661b74cabde5
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 24 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: v5.6-rc4-203-g8f169e31=
9c63)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: v5.6-rc4-203-g8f169e31=
9c63)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-219-g0=
2c04c823da1)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.6-rc4-203-g8f16=
9e319c63 - first fail: v5.6-rc4-219-g02c04c823da1)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-219-g0=
2c04c823da1)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc4-219-g0=
2c04c823da1)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
