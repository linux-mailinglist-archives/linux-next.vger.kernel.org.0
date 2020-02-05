Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677C915252A
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2020 04:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgBEDOI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Feb 2020 22:14:08 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]:38748 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbgBEDOI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Feb 2020 22:14:08 -0500
Received: by mail-wm1-f46.google.com with SMTP id a9so906176wmj.3
        for <linux-next@vger.kernel.org>; Tue, 04 Feb 2020 19:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ytpsIvBlDjPWT6jWbG+XC+ESaho3vRPMr8L6DxU8qIo=;
        b=Aa/47/alTdbEtnV8iB7cpzIppeFW4Zhl5bxC8Y6XLK7aCUzXFzRb4Ai+1gMaq6VaHV
         E2epH7K4P3OYnNqCDqmmOuoifNYjj1RpTDGFUjp5Ua7lQ+Trl6GHSaizOv4ld5oQsWYs
         KLfSxNZ43xZkemGBH6mVeXlXWYyldcmobgvjNRe6ZP9QmLrOZ60Z4MtBoErs+Agu95G9
         m+gMo5qjk4IzVqPa8mTjjPf+7beWg22tnevkEHFGRQCcB6lopqBjc9Jqtq/WMPnIa9tF
         S2iakQABvUaUzQMeioreATk12R2FfZPAWE9RkdroJEC0BxFQ7CgGLN89BdDf2TgM0+BP
         8Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ytpsIvBlDjPWT6jWbG+XC+ESaho3vRPMr8L6DxU8qIo=;
        b=VVCwpIaIdkEhpQOwbatboHDxAjTS0cFXuRXMfywms/HbQg2/VyTEPgEfNczmxYcslv
         j/k7z8kJu4V9c+HMU1Gf27lSq87Bq0mXs6c6FYRd17EZhY5Mwn/8hM9KhCYbEAuJAcUr
         RLTr4XWsHN7NJWlYpIWP2ivJTZbbthaeu+k6PTEf7fpi8l99ugVLrLShrfShDJ5LQHsn
         pYL13KqaS4PbS38ZtZhQ3PWLpj4OcxWg3LMy2fNt+WnsYdvCDEbsh+d5GcozB/j1VQxw
         9ZKTjvt/Byy6aMxV3hOqkZqyJ046XgWFQB3D/jzVoe1FzZ9VqO6mwb0oYlZvlG/e3p8/
         l6sw==
X-Gm-Message-State: APjAAAXOimrDaIlTlVpYwtR8BmKrnzQG9DLOc/C16j9D603eK2tL5hwV
        CjYsauFAx8imeYIA8LRubYT5Fcb5yCaw1A==
X-Google-Smtp-Source: APXvYqxVy6J+Lb2RI+pGD8LRt6f4okrSZA2ygYVsFelyWDvd1unoYlV/Uagc5WXsuqMFunOI5j0wXA==
X-Received: by 2002:a1c:38c7:: with SMTP id f190mr2499688wma.94.1580872446466;
        Tue, 04 Feb 2020 19:14:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s16sm33685412wrn.78.2020.02.04.19.14.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 19:14:05 -0800 (PST)
Message-ID: <5e3a32fd.1c69fb81.695d0.20f2@mx.google.com>
Date:   Tue, 04 Feb 2020 19:14:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-9475-g7c2eb3712de1
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 207 boots: 7 failed,
 197 passed with 2 offline, 1 conflict (v5.5-9475-g7c2eb3712de1)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 207 boots: 7 failed, 197 passed with 2 offline, 1 =
conflict (v5.5-9475-g7c2eb3712de1)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-9475-g7c2eb3712de1/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-9475-g7c2eb3712de1/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-9475-g7c2eb3712de1
Git Commit: 7c2eb3712de143f22d0e542f4238bbac7a75a096
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 24 SoC families, 26 builds out of 191

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: new failure (last pass: v5.5-8929-g9e4730e1c5e0)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: failing since 2 days (last pass: v5.5-7=
780-g420617c9e573 - first fail: v5.5-8839-g56c8845edd39)

arm64:

    defconfig:
        gcc-8:
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: v5.5-8929-g9e4730e1c5e0)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.5-8839-g56c8845edd39)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.5-8839-g56c8845edd39)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: v5.5-8839-g56c8845edd39)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-sei510: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        am335x-boneblack:
            lab-baylibre: PASS (gcc-8)
            lab-drue: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
