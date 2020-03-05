Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3A0179DC8
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 03:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbgCECYm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 21:24:42 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45540 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgCECYm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2020 21:24:42 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so1923968pls.12
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2020 18:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=edK+zzeEqS7YVLUs2ulvcDiZdSvP02ShZjvIDiNW180=;
        b=1aVCz+2L+6PIbizF5EMSlm2+oyjpr2g44Lw4NQwNY/eo0JYgG0gI9DM8Wr+njydtA0
         l7Gs5sP5ttIFxmxoM3JpibAQQfrPTshxY9BfpD8WihUPSJ6KEmtKVN6W3bdj/tD4mp7V
         Mttb8CYHzGdhIHBj2yqEc3cSi43KBnEk8QEY5nOBzS+UHxN5xUz4G9F1ha2G3AwuBBK5
         cKSVz+q3ACCzBMlNXBlFGts7dtEKsWZL7JQ7bObFXLdCOBXWaPT0XSSRj1NaFN1ZREqk
         kOyiMRDXGPTeUiapNy912xsSf+iTJcwGmTyLbvPKaxsIBZc4q1poTwZpWZBb7cf/9vO4
         CtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=edK+zzeEqS7YVLUs2ulvcDiZdSvP02ShZjvIDiNW180=;
        b=I5W2LAzNzb+DzxJQQVhTHONA5t04MV5VLUq35aljVcaIy8DT6feXAfuxc3+kU6f2gu
         ar/Mh0OfhNwNBa68p7O2Z/6IWBOTvNJsQaPiYJQt4rhz+cQcWREztGtDArNDMhL/3fBC
         uFmi/N0ExUZnUxFMBVTv2fBgS7w0WsALuZNFKsNAwlFm44F0z0gS6/+6cl7p0uevNhfj
         JP7xLm2bXSmJadUBeG/BzBeqi9l8DBrPItWTrVVyJrKsE6OZ15Xq5FVUCdvn6DwJH3XR
         p1iC8XGJdSHVE5ZGNt4KT6auFdS8Hmx3wZeLAwYNWZCtXu5o0bEiJCMbiS3s3rTbpe8I
         oRlw==
X-Gm-Message-State: ANhLgQ27o6TJXTO4z+cKm0FtonDc+vA21Dyuww1YqFxpGFkF2rgBmzkG
        F44CqE7Ib9vd95pqYDcuHyXIWo4llz4=
X-Google-Smtp-Source: ADFU+vuKMyF/mPk2jH20XrrQPIJkBjawoaVgTUanG7mf7nVf6OEd98APhap/NfNFVQRmBNNq2oDLcg==
X-Received: by 2002:a17:902:8f94:: with SMTP id z20mr5898249plo.62.1583375080563;
        Wed, 04 Mar 2020 18:24:40 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k1sm8428566pgg.56.2020.03.04.18.24.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 18:24:39 -0800 (PST)
Message-ID: <5e6062e7.1c69fb81.79334.7955@mx.google.com>
Date:   Wed, 04 Mar 2020 18:24:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200304
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/master boot: 192 boots: 9 failed, 173 passed with 9 offline,
 1 untried/unknown (next-20200304)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 192 boots: 9 failed, 173 passed with 9 offline, 1 untried=
/unknown (next-20200304)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200304/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200304/

Tree: next
Branch: master
Git Describe: next-20200304
Git Commit: bd78794fc00f79e6ae99e7f8f304554f399e3485
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 93 unique boards, 23 SoC families, 27 builds out of 329

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20200214)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20200214)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200228)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 16 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200303)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200214)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200303)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200217)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200217)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

Offline Platforms:

arm:

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
