Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B1AD2099
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 08:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfJJGEb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 02:04:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33226 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJJGEb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 02:04:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so6294499wme.0
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2019 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OOwZhZEEeE/ilHuzFWy4ZyXoZdkwSAUjVPbTdjIels8=;
        b=avTbP40kXr2ICZmNtd7zMrnoLwXJ0m75lBNW7JJ7VfJbFp3wROtrxLsFLygpMA8iez
         IW7JWj7MCOdxNooQkNh1VFktrjbPSD8kRmnpKHgGA76CdV15zkfWwKl91qqkVKd24+/7
         b1L69pIdtZdF8ajZW0LJfGFGSf2DG6W+ADIU+MSTnGrSIzGx5sQeUvNps9J/VoDXukvy
         +Tb7U3e1wcffHh4d7dM7P80/b2/OTfTYJJRndByMSj98F7DzYUYZnSuThwM1Xh33Dp5l
         GwibZwnfRbLflFzx/w9Y9Uke919EOXbrgU66XDzfJZvmXUEdxE0wQ+esSl9kZ37bC7BG
         dqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OOwZhZEEeE/ilHuzFWy4ZyXoZdkwSAUjVPbTdjIels8=;
        b=RII6gW+0MFV+v3t87Vcq2EaxXn/RX9PsSTNlJNcRB0Mpy8NbWgk/XYwnDYFtGnmb3O
         sBryN6cSCUguyS/LvTP/+LOQokGP9dKgAdj0LMiGQ2vFSlE4muPuIRciIbvopOImaS6o
         kF27CV16s+SNfSVSkgP2k7WseRu0KNghyh6ra2NpE8sSu80bISktMZm7CChU5MKq7mvl
         O0l/ajk5CG9dkutH+MODlIEnepk4o7XhA91bsvxOsnWXx3r18ErtLuI0ncymJQ2j2XEE
         6kFoSqSsOn0JCIX2JcUQbvFMTWBUuMsmzzneL1AlR5+N8k6bf7jwZJS4XPw9oZWRA96S
         3UYQ==
X-Gm-Message-State: APjAAAXxMIU/4uorfKDyLIypUsjNcV0uVXwjQYnoODfchKLyl0r1F+EH
        SmJeJNR7bMYOHFOrcgrIjleOU/WlKl4kAA==
X-Google-Smtp-Source: APXvYqwUPrO37uUQuOabulvmSbasZF4A7UPtsZ5ncyZi6ZqEqWHxag6+8GzFlkoSHEzFDyE5G2LkIg==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr5968655wmb.97.1570687469242;
        Wed, 09 Oct 2019 23:04:29 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j26sm6370766wrd.2.2019.10.09.23.04.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 23:04:28 -0700 (PDT)
Message-ID: <5d9ec9ec.1c69fb81.e0333.ea6d@mx.google.com>
Date:   Wed, 09 Oct 2019 23:04:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc2-398-ga34d1d2d2853
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 290 boots: 9 failed,
 267 passed with 12 offline, 2 untried/unknown (v5.4-rc2-398-ga34d1d2d2853)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 290 boots: 9 failed, 267 passed with 12 offline, 2=
 untried/unknown (v5.4-rc2-398-ga34d1d2d2853)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc2-398-ga34d1d2d2853/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-398-ga34d1d2d2853/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-398-ga34d1d2d2853
Git Commit: a34d1d2d28537f6b682e88eae97c77c2f5d759bf
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 24 SoC families, 27 builds out of 214

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-g12b-s922x-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab

---
For more info write to <info@kernelci.org>
