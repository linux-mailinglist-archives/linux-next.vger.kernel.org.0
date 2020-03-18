Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B8C18A2E9
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 20:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgCRTIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 15:08:16 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:35340 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgCRTIP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 15:08:15 -0400
Received: by mail-pj1-f44.google.com with SMTP id j20so848036pjz.0
        for <linux-next@vger.kernel.org>; Wed, 18 Mar 2020 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vtg4KsOjM3opDmyBSFJ8RCkhVL5EFghGdY4dJiX6Pi4=;
        b=P6psujjNZq13chWbCiNf95gYF7Shokb5dA2WDH0UAL6MOjbqrWeGuySym5dxdi5I3Z
         709cZnBCwWi+Gd+3/468BN7mxYvwv/UDgGX5S+j6by1m1waiBFVSJmY81pSYz2u0vXSM
         KgQMhpK01JKsirJFzcF6/eClQK1sbXqK64USR/j6rO81OgND1GgH/UtkzD2CK8xcbI/d
         Uf8HBXLqJgoyzXfdDy+oejXRu/lz6hHJURvxxLtLc18BxYTOrhxMkyjzA00ZsuwaBWxV
         MsEEScOw1fXc3+ibrfFwrDFvKDGpRhTZoBeHwQV9YgwPgb2h/ZhSQtdIcfattmY76ZqL
         KV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vtg4KsOjM3opDmyBSFJ8RCkhVL5EFghGdY4dJiX6Pi4=;
        b=jRKRnYzTrIOli8jbJDHIZy3+QcKi480mtlubbOec4uKCIBgMYukTxXS6Zv5HWe3i8/
         EopPNP4tmc1PP6kW1QBTgJSAr/YuJ9UA6yVpzi8kXBovtk6b/+AQUm3zb1UqX17rS3Gi
         ya4jq7dYRxD86WR9rL5m9ruwmsW1u9xBKc8JKnml/X1SVEKkisnjzKmcntaGA82CoRTd
         LLb/8Epcv90nEgWuwyL1x33rCFbL6Tz30VFNGD+dBwyp9IczWjynSTWWEX0NDBVFI70j
         9lM1p/lP7Ns4u7QLqzudWFRWId497I6M5z6OW/dy7Gpop4MJLlH9Gn9//W82qWKiorVu
         Q0CQ==
X-Gm-Message-State: ANhLgQ1LSypnsPnPjktJOBy+Vz6EMMEQfitjkOAuOeHBzkKbQ8xAhGXC
        k8QulqlfHyvMJZ9FwAlzGZ5uAPmrMuM=
X-Google-Smtp-Source: ADFU+vt8nMIhFkuFk38FwdP3PoFDvrTlhm/XCZFnCtuNOHEKYUoEYdMD6D3uue4inF+PLLwADWhgQQ==
X-Received: by 2002:a17:902:8348:: with SMTP id z8mr4815950pln.342.1584558492531;
        Wed, 18 Mar 2020 12:08:12 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i23sm7402412pfq.157.2020.03.18.12.08.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 12:08:11 -0700 (PDT)
Message-ID: <5e72719b.1c69fb81.b3a22.b639@mx.google.com>
Date:   Wed, 18 Mar 2020 12:08:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200318
X-Kernelci-Report-Type: boot
Subject: next/master boot: 161 boots: 12 failed, 140 passed with 2 offline,
 7 untried/unknown (next-20200318)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 161 boots: 12 failed, 140 passed with 2 offline, 7 untrie=
d/unknown (next-20200318)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200318/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200318/

Tree: next
Branch: master
Git Describe: next-20200318
Git Commit: 47780d7892b77e922bbe19b5dea99cde06b2f0e5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 62 unique boards, 20 SoC families, 21 builds out of 329

Boot Regressions Detected:

arm:

    imx_v6_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 2 days (last pass: next-201910=
11 - first fail: next-20200316)

    multi_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 2 days (last pass: next-201910=
11 - first fail: next-20200316)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 1 day (last pass: next-20200316 -=
 first fail: next-20200317)
          tegra124-nyan-big:
              lab-collabora: failing since 2 days (last pass: next-20200226=
 - first fail: next-20200316)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: failing since 5 days (last pass: next-20200312=
 - first fail: next-20200313)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200312=
 - first fail: next-20200313)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 2 days (last pass: next-201910=
11 - first fail: next-20200316)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: next-20200317)
          tegra124-nyan-big:
              lab-collabora: failing since 2 days (last pass: next-20200226=
 - first fail: next-20200316)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 29 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200317)

Boot Failures Detected:

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
