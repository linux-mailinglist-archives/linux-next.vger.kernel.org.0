Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F40413276F
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 14:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgAGNTd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 08:19:33 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56050 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAGNTd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2020 08:19:33 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so18914061wmj.5
        for <linux-next@vger.kernel.org>; Tue, 07 Jan 2020 05:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NT9ljiQezMBAt0DH5XjIEk7u0Umo4RGM8vR+yO1GQJc=;
        b=pE8OerSJqiMTkGDk9wd87f7T/04VvhhyHo77nHzwCrnsgOgxRj2Sm8YqNSuCHPDeaE
         d/0sS5k+ZJzUb7QMonLMBSyJaY+ukCWBA/8NVZN4RWN9/3Yb/sAUtoLJu+YOGug1JR/A
         rNkd9/1bNCDlzqPwe8JcU2GRe0sJhltXBM/XFLFXCbmx9zfv2XDggss0/5UrXXi3U64h
         UxaC+q75DUk2Q/m09CYzqQJJb7u+RpjC860rXWDyk85jaJ/6AZIE7uKN3Kwy0aTP7uEW
         jwp2KFZhxtp0N3hQC2VkH5YhubE32WQbAIwioVivMq+Kcr2W6hPmT2Jp19TRWR6iONhC
         V9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NT9ljiQezMBAt0DH5XjIEk7u0Umo4RGM8vR+yO1GQJc=;
        b=dLpX4TvORd3qoCNpSNobvR/D6FdRtZWDj9BowsJmjSBrELN/pj5cJNGDbwFOlK90qN
         hCWL2ua/TlfcvoFgaqwKinchhCL69JShCZCfgjWAujimpwcXhkU5noQIpaeyxHj6QfFW
         aJ3V8MO3FkboftBoiW0u0HJx1HJEAWMZkzqUFb2yv8hmEqwig93Elly5nVZWPRvGOI7Q
         0VOnXPlf6qEm8We4rzXHeHFgJFg0PlFoF++sSo69rv4eSzZkSl3+teMSKO5+oLAgg+OR
         vlG9gFZfpScw0nXHEnQ8ex58j407c925DAgKweQ0aJGRKkAt+EN2g/qs4Dlp3nuLdloq
         Ru7Q==
X-Gm-Message-State: APjAAAXyEUXbDDlhxb9OxybIKmB6jj9JU7urlIdkB9wE87NFNBsNPjU+
        7mZVhmngBbCGQq8se5bnGJ7Y0wpwSsmy5g==
X-Google-Smtp-Source: APXvYqytNmoILEo/mr+/VNFXA1j0L90ankGjquuaiAKrjPfVXM4eyq0yuEiOsQboo+5YuDGB1y6m0g==
X-Received: by 2002:a1c:a513:: with SMTP id o19mr37720514wme.156.1578403170614;
        Tue, 07 Jan 2020 05:19:30 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t190sm26635155wmt.44.2020.01.07.05.19.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:19:30 -0800 (PST)
Message-ID: <5e148562.1c69fb81.f9e45.5bad@mx.google.com>
Date:   Tue, 07 Jan 2020 05:19:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.5-rc5-156-gc9f6236e0a3b
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 201 boots: 11 failed,
 186 passed with 4 untried/unknown (v5.5-rc5-156-gc9f6236e0a3b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 201 boots: 11 failed, 186 passed with 4 untried/un=
known (v5.5-rc5-156-gc9f6236e0a3b)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc5-156-gc9f6236e0a3b/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc5-156-gc9f6236e0a3b/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc5-156-gc9f6236e0a3b
Git Commit: c9f6236e0a3bb8282b18b32157560fc71084fad4
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 69 unique boards, 17 SoC families, 25 builds out of 214

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.5-rc2-549-g9125728f=
cf86)

    multi_v5_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)

    multi_v7_defconfig:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: v5.5-rc2-549-g9125728f=
cf86)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: v5.5-rc2-549-g9125728f=
cf86)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: new failure (last pass: v5.5-rc2-549-g9125728f=
cf86)

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: failing since 1 day (last pass: v5.5-rc2-432-g9=
eed7d73a938 - first fail: v5.5-rc4-312-gb224c14fb049)

arm64:

    defconfig:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.5-rc4-312-gb224c14fb=
049)
          meson-gxm-q200:
              lab-baylibre: failing since 1 day (last pass: v5.5-rc2-549-g9=
125728fcf86 - first fail: v5.5-rc4-312-gb224c14fb049)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxm-q200: 1 failed lab

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            rk3288-rock2-square: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

---
For more info write to <info@kernelci.org>
