Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66E26CBF7
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 22:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgIPUhh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 16:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgIPRKC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 13:10:02 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AC4C0073E3
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 06:59:19 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o16so1655162pjr.2
        for <linux-next@vger.kernel.org>; Wed, 16 Sep 2020 06:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eo3o6iZdvQbHAl0e+ZnSCAJGbOi5mCEFwK+3BIFIgrA=;
        b=PK7zuTQ2KSuno46UAAUIXkiypQLV2emawFDaRp7XTV1behcNEpnc06di6qr8buqn5O
         9oJO9Dwnv9E15IhCPnTI3amY17iuwGS9b9rcQiSadgXKxttRQHE56HVXF289d9z0nVrp
         bWWSI0En5v3SzAbi+H5lNjcNk8DhDAhiO47m7BPgJpJCtLDlaMSqjoyj6Onoj4A07Xft
         bMk7VtZ/ZrmSYRubRuy1SUkHNkI6CJ7LGRcYz0PGjtreTV6PnXPOLYUKepBbOqPoEbfW
         WDFh91JALaL8AmTVLTNRfUyK5ktFtxtKtVxkpHCXeQI9FBmB5BheZ46MfU63ZCwn5DvS
         aw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eo3o6iZdvQbHAl0e+ZnSCAJGbOi5mCEFwK+3BIFIgrA=;
        b=h2nTb/NYud2M+ksQ+/Ee/XPrKFrqaJc49u0hULIsBdSZQLcH/++RrN6QUKtywVvVvo
         GBJdD/GcKx3Rhjl8/nl27CltrSqb7kapABAYkFUl8jQbG3derBjwcjq2lRPvHhehFx7g
         hoBhZ6z6PePt5JNYjaC0OyubhOPdO1DLncr0K8e26/PTHt20QCViQh1mqRQE/aismj2W
         V4UUqukIER6bcE9Mztlp+i1k+Xcs7iJsfKuAC8PW5IU5Vy3xkxjZEhq4+oeZ20cgFJiM
         XeVBYJbr1TvDvf2q9FoWinbCIogaE4KWXN9aRxLnIwGdFLU25TXOXS+J+a/YbgLI2MMO
         himw==
X-Gm-Message-State: AOAM5312BRqD0C8tNSPfwyfHulD1+cNg3wLhUWiV5nUAV0lFZPLzhgrK
        ti+RpBKym0nSl3/bMX3CusTDzxrIgnAhrw==
X-Google-Smtp-Source: ABdhPJwgC3PzWZlNbiQ48CM1+dG76Fep69lsz3XBvxH9H0nZWwNF2MB0A2v09S1ylRKXopSiyI/1JQ==
X-Received: by 2002:a17:90a:5a:: with SMTP id 26mr4029188pjb.0.1600264756848;
        Wed, 16 Sep 2020 06:59:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e62sm17044846pfh.76.2020.09.16.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:59:15 -0700 (PDT)
Message-ID: <5f621a33.1c69fb81.5a06f.b017@mx.google.com>
Date:   Wed, 16 Sep 2020 06:59:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200916
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 405 runs, 183 regressions (next-20200916)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 405 runs, 183 regressions (next-20200916)

Regressions Summary
-------------------

platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre          | gcc-8    | sam=
a5_defconfig              | 0/1    =

bcm2836-rpi-2-b            | arm   | lab-collabora         | gcc-8    | bcm=
2835_defconfig            | 0/1    =

bcm2836-rpi-2-b            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

beaglebone-black           | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

beaglebone-black           | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

beaglebone-black           | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

beaglebone-black           | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

beaglebone-black           | arm   | lab-baylibre          | gcc-8    | oma=
p2plus_defconfig          | 0/1    =

beaglebone-black           | arm   | lab-cip               | gcc-8    | oma=
p2plus_defconfig          | 0/1    =

dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mve=
bu_v7_defconfig           | 2/5    =

hifive-unleashed-a00       | riscv | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

hip07-d05                  | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

hip07-d05                  | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

imx27-phytec-phycard-s-rdk | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v5_defconfig           | 0/1    =

imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | imx=
_v6_v7_defconfig          | 0/1    =

imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

imx6q-sabrelite            | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

imx6q-sabrelite            | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

imx6q-sabrelite            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

imx6q-sabrelite            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | imx=
_v6_v7_defconfig          | 0/1    =

imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | teg=
ra_defconfig              | 0/1    =

jetson-tk1                 | arm   | lab-collabora         | gcc-8    | teg=
ra_defconfig              | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

odroid-x2                  | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =

odroid-x2                  | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

odroid-x2                  | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

odroid-xu3                 | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =

odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

panda                      | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

panda                      | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

panda                      | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

panda                      | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

panda                      | arm   | lab-baylibre          | gcc-8    | oma=
p2plus_defconfig          | 0/1    =

panda                      | arm   | lab-collabora         | gcc-8    | oma=
p2plus_defconfig          | 0/1    =

peach-pi                   | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =

peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-vexpress-a15      | arm   | lab-baylibre          | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a15      | arm   | lab-broonie           | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a15      | arm   | lab-cip               | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a15      | arm   | lab-collabora         | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a15      | arm   | lab-linaro-lkft       | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a9       | arm   | lab-baylibre          | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a9       | arm   | lab-broonie           | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a9       | arm   | lab-cip               | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a9       | arm   | lab-collabora         | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-vexpress-a9       | arm   | lab-linaro-lkft       | gcc-8    | vex=
press_defconfig           | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =

r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

rk3399-puma-haikou         | arm64 | lab-theobroma-systems | gcc-8    | def=
config                    | 0/1    =

rk3399-puma-haikou         | arm64 | lab-theobroma-systems | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =

sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =

tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =

tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =

tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =

tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | teg=
ra_defconfig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200916/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200916
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5fa35f247b563a7893f3f68f19d00ace2ccf3dff =



Test Regressions
---------------- =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre          | gcc-8    | sam=
a5_defconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e60d30eb3e879dbed94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e60d30eb3e879dbed=
94c
      failing since 140 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
bcm2836-rpi-2-b            | arm   | lab-collabora         | gcc-8    | bcm=
2835_defconfig            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb95dd915fc73bbed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb95dd915fc73bbed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
bcm2836-rpi-2-b            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ece3ac5b7fc445bed94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ece3ac5b7fc445bed=
94f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e930a35a8a9a24bed96a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e930a35a8a9a24bed=
96b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea0648db41e23ebed978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea0648db41e23ebed=
979
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9cefeb9bb8308bed955

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-beaglebone-black.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9cefeb9bb8308bed=
956
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea4788652e2babbed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea4788652e2babbed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-baylibre          | gcc-8    | oma=
p2plus_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e740d835e86b26bed95f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e740d835e86b26bed=
960
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
beaglebone-black           | arm   | lab-cip               | gcc-8    | oma=
p2plus_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e744d835e86b26bed979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e744d835e86b26bed=
97a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb9387a8896531bed9b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-dove-cubox=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-dove-cubox=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb9387a8896531bed=
9b7
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecd9ac5b7fc445bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecd9ac5b7fc445bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
dove-cubox                 | arm   | lab-pengutronix       | gcc-8    | mve=
bu_v7_defconfig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f61e79ddc53514f14bed948

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f61e79ddc53514=
f14bed94c
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-16 10:23:21.482000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-16 10:23:21.483000  kern  :alert : pgd =3D (ptrval)
    2020-09-16 10:23:21.484000  kern  :alert : [0000001c] *pgd=3D3fe07831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f61e79ddc53=
514f14bed94d
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-16 10:23:21.519000  kern  :emerg : Process dropbear (pid: 157, =
stack limit =3D 0x(ptrval))
    2020-09-16 10:23:21.520000  kern  :emerg : Stack: (0xeea71e30 to 0xeea7=
2000)
    2020-09-16 10:23:21.528000  kern  :emerg : 1e20:                       =
              00000004 c027c538 c0ea5f5c 00000002
    2020-09-16 10:23:21.537000  kern  :emerg : 1e40: c0b01a74 c0b01a78 eea4=
b4c8 eea4b4b0 00000003 000003c4 eea4b4c8 0000002a
    2020-09-16 10:23:21.546000  kern  :emerg : 1e60: 00000000 00000000 eea7=
1f78 c0107e3c eea4b4c8 0000002a 00000000 eea4b4b0
    2020-09-16 10:23:21.555000  kern  :emerg : 1e80: eea4b4c8 c027d3b4 0000=
0000 00001000 bec3b848 eea4b4d8 00000000 c0a09b7c
    2020-09-16 10:23:21.564000  kern  :emerg : 1ea0: c0e28634 c0b16c50 0a99=
5f68 ef1f5f80 c027d038 eea93b40 bec3b848 00001000
    2020-09-16 10:23:21.573000  kern  :emerg : 1ec0: eea71f78 00000001 c02d=
2e04 c02d2eac eea70000 00001000 00000000 bec3b848
    2020-09-16 10:23:21.574000  kern  :emerg : 1ee0: eea93b40 eea71f78 0000=
0001 c0254898 00000008 00000000 00000051 c0269cac
    2020-09-16 10:23:21.581000  kern  :emerg : 1f00: fffff0c4 ffffffff 0000=
0001 00000000 3b9abac4 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
hifive-unleashed-a00       | riscv | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8d28ad12e6be3bed946

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8d28ad12e6be3bed=
947
      failing since 6 days (last pass: next-20200818, first fail: next-2020=
0909)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
hip07-d05                  | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea076a4f19f8bebed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea076a4f19f8bebed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
hip07-d05                  | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecbb5870907e3fbed95a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecbb5870907e3fbed=
95b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx27-phytec-phycard-s-rdk | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v5_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e72b9025686355bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rd=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rd=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e72b9025686355bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | imx=
_v6_v7_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ebaaaa0a0ebfeabed948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ebaaaa0a0ebfeabed=
949
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea63f572fe0f2bbed96c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx53-qsrb=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx53-qsrb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea63f572fe0f2bbed=
96d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx53-qsrb                 | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecfa0036b95d2ebed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecfa0036b95d2ebed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6q-sabrelite            | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea4e3f958c0c0dbed970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-sabreli=
te.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-sabreli=
te.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea4e3f958c0c0dbed=
971
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6q-sabrelite            | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecf3ac5b7fc445bed987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecf3ac5b7fc445bed=
988
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6q-sabrelite            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61fade5c4b06e951bed979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-imx6q-sabrel=
ite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-imx6q-sabrel=
ite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61fade5c4b06e951bed=
97a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6q-sabrelite            | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61fc2af21a9848f5bed9d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61fc2af21a9848f5bed=
9d7
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | imx=
_v6_v7_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eba8aa0a0ebfeabed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eba8aa0a0ebfeabed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea553f958c0c0dbed97b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-imx6ul-pic=
o-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea553f958c0c0dbed=
97c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
imx6ul-pico-hobbit         | arm   | lab-pengutronix       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecf4cab8764f11bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecf4cab8764f11bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea4cf572fe0f2bbed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-jetson-tk1.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea4cf572fe0f2bbed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ee362251529048bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-baylibre/ba=
seline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-baylibre/ba=
seline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ee362251529048bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0d257ab0f0904bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0d257ab0f0904bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea39bbdd5a9f44bed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea39bbdd5a9f44bed=
950
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ee0e1a384adf33bed959

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ee0e1a384adf33bed=
95a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0ae5a2484a1a7bed95d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0ae5a2484a1a7bed=
95e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-baylibre          | gcc-8    | teg=
ra_defconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecefac5b7fc445bed97c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecefac5b7fc445bed=
97d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
jetson-tk1                 | arm   | lab-collabora         | gcc-8    | teg=
ra_defconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecc8fba0b2d42fbed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecc8fba0b2d42fbed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e70ec5a891516ebed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e70ec5a891516ebed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e88120018d010abed958

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e88120018d010abed=
959
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
mt8173-elm-hana            | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e928d0fa5482cbbed95b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e928d0fa5482cbbed=
95c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-x2                  | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea37763da8015bbed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea37763da8015bbed=
952
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-x2                  | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8ee8ad12e6be3bed959

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-x2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8ee8ad12e6be3bed=
95a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-x2                  | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb84fab9d4f090bed964

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb84fab9d4f090bed=
965
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-xu3                 | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62080be18f4bafe0bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62080be18f4bafe0bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f620569b794a30309bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f620569b794a30309bed=
944
      failing since 53 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f62095c24dd1f627fbed94a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f62095c24dd1f627fbed=
94b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
odroid-xu3                 | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f620e8dce7d16f926bed953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f620e8dce7d16f926bed=
954
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec41090d5130efbed96f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec41090d5130efbed=
970
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ee306f482706c6bed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ee306f482706c6bed=
948
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9cbfeb9bb8308bed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9cbfeb9bb8308bed=
950
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb13fb1d76c321bed95d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb13fb1d76c321bed=
95e
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-baylibre          | gcc-8    | oma=
p2plus_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e814d396d3e326bed94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e814d396d3e326bed=
94f
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
panda                      | arm   | lab-collabora         | gcc-8    | oma=
p2plus_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e7359025686355bed953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e7359025686355bed=
954
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
peach-pi                   | arm   | lab-collabora         | gcc-8    | exy=
nos_defconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef17b12122550fbed95a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-peach-pi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-peach-pi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef17b12122550fbed=
95b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edc5e139fbc406bed94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-peach-pi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-peach-pi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edc5e139fbc406bed=
94c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0567e4ecf76a1bed953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-peach-pi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-peach-pi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0567e4ecf76a1bed=
954
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
peach-pi                   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f2eb8860071b21bed972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-peach-pi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-peach-pi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f2eb8860071b21bed=
973
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a15      | arm   | lab-baylibre          | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9870ae6c09961bed953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9870ae6c09961bed=
954
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a15      | arm   | lab-broonie           | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edab76ad9ba901bed94d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edab76ad9ba901bed=
94e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a15      | arm   | lab-cip               | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edcae139fbc406bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edcae139fbc406bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a15      | arm   | lab-collabora         | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9e24cad56795dbed96c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9e24cad56795dbed=
96d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a15      | arm   | lab-linaro-lkft       | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61efe410901af131bed96a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61efe410901af131bed=
96b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a9       | arm   | lab-baylibre          | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9b419ec5ccabfbed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9b419ec5ccabfbed=
950
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a9       | arm   | lab-broonie           | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef007adb12641ebed97b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef007adb12641ebed=
97c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a9       | arm   | lab-cip               | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef172b754025e8bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef172b754025e8bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a9       | arm   | lab-collabora         | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ead544a3f4a113bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ead544a3f4a113bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-vexpress-a9       | arm   | lab-linaro-lkft       | gcc-8    | vex=
press_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f02249bd32c913bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f02249bd32c913bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea4ff572fe0f2bbed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea4ff572fe0f2bbed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb445d698525cebed958

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb445d698525cebed=
959
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ee281a384adf33bed976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ee281a384adf33bed=
977
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f07d8f0fa4705ebed952

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f07d8f0fa4705ebed=
953
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ee492251529048bed954

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ee492251529048bed=
955
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f03206a139d1f9bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f03206a139d1f9bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eaeb199f4c4f39bed965

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eaeb199f4c4f39bed=
966
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec886dc729d396bed958

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec886dc729d396bed=
959
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eff6da81a7b523bed944

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eff6da81a7b523bed=
945
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0d3994c4f70f5bed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0d3994c4f70f5bed=
950
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9cafeb9bb8308bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9cafeb9bb8308bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb425d698525cebed952

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb425d698525cebed=
953
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecd2b0d9e5f2b9beda3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecd2b0d9e5f2b9bed=
a40
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0ad1773ba2d73bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0ad1773ba2d73bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecf3cab8764f11bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecf3cab8764f11bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0751f87790d32bed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0751f87790d32bed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea3b763da8015bbed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea3b763da8015bbed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecd0fba0b2d42fbed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecd0fba0b2d42fbed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef894caa648fd8bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef894caa648fd8bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv2-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0d4211b83b2fabed94d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0d4211b83b2fabed=
94e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea36bbdd5a9f44bed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea36bbdd5a9f44bed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb6c79c84420eebed969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb6c79c84420eebed=
96a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edac908e79264bbed989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edac908e79264bbed=
98a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f1d2b8c8c43a3cbed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f1d2b8c8c43a3cbed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edbfed750a98e1bed94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edbfed750a98e1bed=
94c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f18e38e9055fedbed960

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f18e38e9055fedbed=
961
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ead244a3f4a113bed94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ead244a3f4a113bed=
94c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ed56908e79264bbed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ed56908e79264bbed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61efb4ca7c09f402bed94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61efb4ca7c09f402bed=
94f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3        | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0d1d92261fb73bed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0d1d92261fb73bed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e988a2fa4ac806bed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e988a2fa4ac806bed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre          | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb435d698525cebed955

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb435d698525cebed=
956
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec57ffb224beb3bed969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec57ffb224beb3bed=
96a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie           | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f093fbbfc4cde9bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f093fbbfc4cde9bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec75e2c19da7babed962

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec75e2c19da7babed=
963
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip               | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f058102b218608bed957

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f058102b218608bed=
958
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9a51bfdbe52d1bed962

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9a51bfdbe52d1bed=
963
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecb8d988c4a6fabed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecb8d988c4a6fabed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef77ff9ab9e00bbed955

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-qemu_arm-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef77ff9ab9e00bbed=
956
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm-virt-gicv3-uefi   | arm   | lab-linaro-lkft       | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0d530046824c6bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0d530046824c6bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e7010aa02baf60bed948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e7010aa02baf60bed=
949
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8f2f07d97f304bed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8f2f07d97f304bed=
950
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e78992c88be26dbed963

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e78992c88be26dbed=
964
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb7d39c8ad70e7bed976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb7d39c8ad70e7bed=
977
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e79a27b474ceadbed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e79a27b474ceadbed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eba1dd915fc73bbed949

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eba1dd915fc73bbed=
94a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e6f38c07879528bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e6f38c07879528bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9855fad8bebe4bed959

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9855fad8bebe4bed=
95a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb8739c8ad70e7bed985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb8739c8ad70e7bed=
986
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecd63ad1844c61bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecd63ad1844c61bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef488ffd73bee5bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef488ffd73bee5bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f062b1e8a2e51ebed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f062b1e8a2e51ebed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e6ebb5a2c2f443bed953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e6ebb5a2c2f443bed=
954
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e88920018d010abed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e88920018d010abed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e774506cbed7ffbed96e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e774506cbed7ffbed=
96f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb07fb1d76c321bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb07fb1d76c321bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e799dc53514f14bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e799dc53514f14bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb266c0f73b088bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb266c0f73b088bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e6f5b5a2c2f443bed95f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e6f5b5a2c2f443bed=
960
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8f145c730fb55bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8f145c730fb55bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec1449e73280f5bed965

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec1449e73280f5bed=
966
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ecacd988c4a6fabed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ecacd988c4a6fabed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef496a68902dd2bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef496a68902dd2bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f08f1f87790d32bed95d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f08f1f87790d32bed=
95e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e700a244ef69b1bed94a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e700a244ef69b1bed=
94b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e868a02438bca1bed95f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e868a02438bca1bed=
960
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e859a02438bca1bed946

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e859a02438bca1bed=
947
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb0486c9d9fd87bed9b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb0486c9d9fd87bed=
9b7
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e87220018d010abed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e87220018d010abed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb126ee9d75b81bed94a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb126ee9d75b81bed=
94b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e6fd0aa02baf60bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e6fd0aa02baf60bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e896b0178da29cbed958

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e896b0178da29cbed=
959
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb29b1fb88bd44bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb29b1fb88bd44bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edc2ed750a98e1bed950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edc2ed750a98e1bed=
951
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef4a8ffd73bee5bed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef4a8ffd73bee5bed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3      | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f04c5fdfa0906cbed945

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f04c5fdfa0906cbed=
946
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e6ec898f3a77afbed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e6ec898f3a77afbed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8fb45c730fb55bed954

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8fb45c730fb55bed=
955
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie           | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e704c5a891516ebed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e704c5a891516ebed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie           | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec59e2c19da7babed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec59e2c19da7babed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e71ce0f7e14e9fbed952

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e71ce0f7e14e9fbed=
953
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec6c05fe3e9087bed94b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec6c05fe3e9087bed=
94c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e70cc5a891516ebed949

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e70cc5a891516ebed=
94a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9845fad8bebe4bed956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9845fad8bebe4bed=
957
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec1369bc78eecbbed96b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec1369bc78eecbbed=
96c
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec826dc729d396bed954

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec826dc729d396bed=
955
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ef5e6a68902dd2bed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ef5e6a68902dd2bed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-linaro-lkft       | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f078fbbfc4cde9bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f078fbbfc4cde9bed=
94d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e7349025686355bed94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e7349025686355bed=
94f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8bb1d2e6efb19bed95a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8bb1d2e6efb19bed=
95b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e93480f2d85c48bed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e93480f2d85c48bed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e72930b6febbc3bed957

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e72930b6febbc3bed=
958
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8ae696eb18453bed962

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8ae696eb18453bed=
963
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea0448db41e23ebed975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea0448db41e23ebed=
976
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e72f9025686355bed948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e72f9025686355bed=
949
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e8af1d2e6efb19bed94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e8af1d2e6efb19bed=
94f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
r8a774c0-ek874             | arm64 | lab-cip               | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea126d2a4ee375bed94a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea126d2a4ee375bed=
94b
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edae76ad9ba901bed951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edae76ad9ba901bed=
952
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eefe6e8988cd9fbed95e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eefe6e8988cd9fbed=
95f
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-rock2-square        | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f19638e9055fedbed965

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f19638e9055fedbed=
966
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ed0bcab8764f11bed96d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ed0bcab8764f11bed=
96e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61edb6ed750a98e1bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61edb6ed750a98e1bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3288-veyron-jaq          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61f0f330046824c6bed95c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61f0f330046824c6bed=
95d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ea6f3666859012bed943

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ea6f3666859012bed=
944
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb21fb1d76c321bed989

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb21fb1d76c321bed=
98a
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3399-gru-kevin           | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61eb9287a8896531bed9b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61eb9287a8896531bed=
9b2
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3399-puma-haikou         | arm64 | lab-theobroma-systems | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e704a244ef69b1bed955

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-theobroma-systems/baseline-rk3399-puma-haikou.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-theobroma-systems/baseline-rk3399-puma-haikou.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e704a244ef69b1bed=
956
      new failure (last pass: next-20200417)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
rk3399-puma-haikou         | arm64 | lab-theobroma-systems | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e87d20018d010abed94f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-theobroma-systems/baseline-=
rk3399-puma-haikou.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-theobroma-systems/baseline-=
rk3399-puma-haikou.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e87d20018d010abed=
950
      new failure (last pass: next-20200417)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e78092c88be26dbed957

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e78092c88be26dbed=
958
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e9e44cad56795dbed96f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e9e44cad56795dbed=
970
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-baylibre          | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61ec0049e73280f5bed947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61ec0049e73280f5bed=
948
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e71ee0f7e14e9fbed958

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e71ee0f7e14e9fbed=
959
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e88c20018d010abed964

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e88c20018d010abed=
965
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
sun50i-h6-pine-h64         | arm64 | lab-collabora         | gcc-8    | def=
config+CON..._64K_PAGES=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61e925a35a8a9a24bed95c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61e925a35a8a9a24bed=
95d
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61fb6d252e4e9dd9bed961

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-tegra124-nya=
n-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-tegra124-nya=
n-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61fb6d252e4e9dd9bed=
962
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61fe15b4cea0e06cbed963

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61fe15b4cea0e06cbed=
964
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | mul=
ti_v7_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f6204932fbcbadcbdbed94d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f6204932fbcbadcbdbed=
94e
      new failure (last pass: next-20200915)  =



platform                   | arch  | lab                   | compiler | def=
config                    | results
---------------------------+-------+-----------------------+----------+----=
--------------------------+--------
tegra124-nyan-big          | arm   | lab-collabora         | gcc-8    | teg=
ra_defconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f61fcbf6f837e79f2bed95d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200916/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f61fcbf6f837e79f2bed=
95e
      new failure (last pass: next-20200915)  =20
