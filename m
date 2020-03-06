Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065B617C69F
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 20:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgCFT5P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 14:57:15 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38533 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFT5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 14:57:14 -0500
Received: by mail-pl1-f194.google.com with SMTP id w3so1298648plz.5
        for <linux-next@vger.kernel.org>; Fri, 06 Mar 2020 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ehZ2ZlF9iDDleMAXVnfnfhrFZZMLYF0kd8+ncb0ATVQ=;
        b=g2ZekVYlSJTNQGjIGKGKrtyYY5SpVqBWfVdnurtbF10vCiedc7z8ddsSW8AgoRTYpA
         FypeJGBEH/AtNosxd05aiyGdIfsB5Cat3dsGlBVL2RCezJIvdX1R1jj/qkxFbsOVquIn
         z0F0pt4gTW8eS7+VgFHzm6oeu1PXZmzVoTyfiqs4J40eDhxpC+2iN8/L8gyeVdixMOpn
         q8FuCZuIAmgmhMBGmN/E0ISFIOmXNzhiTwIxwvDR+jmWYSpIqAdS86vJfq/KoAaoxjrU
         zoFGEBBqbKv7nG5l+889qvTLVYm6FJ2OAA/QFmNtKMBP1QzAMvzxhGjboxGnCAvNLCtw
         LLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ehZ2ZlF9iDDleMAXVnfnfhrFZZMLYF0kd8+ncb0ATVQ=;
        b=nTg10sb9VEAjquAqq3zzNiwbg7GKlJs0/4PqVZE64Uxs3YZeo1A0cUEksSPptsQEc5
         4LPlzhfaQGk/75cvJxV6zf0+VuEh+P7xPmYrPzPQoAKlJiqHo4FP9U9SWXUtLfEdB0fn
         uZgwskyQtLnlE1iKh1namxnMmYdY8hcUPdcmLT1CZ3prt8ONozl0SpKAyw82DFuXJPc3
         mwC+va4xC1swxS//cBnrBa+ov1WUjBYaQozvtM8DbY7NR16p9wyl61nTMmhg+9xTSSiF
         k4MJhn2O2Spupxx2jSFCalBcVCh+mTw9b8VjfHbOxbHCvIAR3HzOPLmxnOf+rxQvWdlj
         hZ2w==
X-Gm-Message-State: ANhLgQ1Qt4w7968vvf9xFKM6Z4cvvci8U7B+kZ/5cOXtZz6GG4aq6Sft
        Bn2XixmPs0FWNKyryTdyE9py2tPW05s=
X-Google-Smtp-Source: ADFU+vv5NA6neddpOAKtipzOasM7LpdYUGzehBGm1/VRlhKDxPuj19leBYUGc1eMvwZSIokkmZrHqQ==
X-Received: by 2002:a17:90a:2551:: with SMTP id j75mr5059322pje.165.1583524632867;
        Fri, 06 Mar 2020 11:57:12 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v8sm10356737pjr.10.2020.03.06.11.57.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 11:57:11 -0800 (PST)
Message-ID: <5e62ab17.1c69fb81.4114c.b6aa@mx.google.com>
Date:   Fri, 06 Mar 2020 11:57:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200306
X-Kernelci-Report-Type: boot
Subject: next/master boot: 197 boots: 12 failed, 181 passed with 3 offline,
 1 untried/unknown (next-20200306)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 197 boots: 12 failed, 181 passed with 3 offline, 1 untrie=
d/unknown (next-20200306)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200306/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200306/

Tree: next
Branch: master
Git Describe: next-20200306
Git Commit: b86a6a241b7c60ca7a6ca4fb3c0d2aedbbf2c1b6
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 98 unique boards, 24 SoC families, 28 builds out of 329

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-rock2-square:
              lab-collabora: failing since 14 days (last pass: next-2020021=
3 - first fail: next-20200221)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 17 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200305)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200304)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200305)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200305)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200305)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5800-peach-pi: 1 failed lab

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
            apq8096-db820c: 1 failed lab
            meson-gxm-q200: 1 failed lab
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

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

---
For more info write to <info@kernelci.org>
