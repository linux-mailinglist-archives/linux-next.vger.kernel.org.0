Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9171467DA
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 13:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWMXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 07:23:35 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:32872 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWMXf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jan 2020 07:23:35 -0500
Received: by mail-wr1-f54.google.com with SMTP id b6so2896364wrq.0
        for <linux-next@vger.kernel.org>; Thu, 23 Jan 2020 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dGW2CjjHfvy0AJ6wcB9IPgkzdavYFy0bii1ZXXgt0Oc=;
        b=AgENbf86Zf8n/bOYTpu2NVl5Qu7scHH7bsszlRTTBR//c5nGgILbCaTcjchz6i4dt/
         hYsl2tb2Ls2sy8ee2tRgg3EgFx6HrEZwTTUVU8GYOLADWkoJkgl2ExQcGjnO9zdhHdsE
         LJnACIl28LgVGZzkVQm8xKE6hqqFgUCSJjSsvdzsvsXvyjmPdHYaG0Jp8CzuL3b1UGma
         +fc3hTv7gdFygiLw8LL2ujuUPIyZHTFCjC48HFoLtZytr1JTMhJpivjpB4GrcKDs0lWA
         ttFH3ccaV/ouyQYqCnlSbQR2rJ8ryZ9mLIznpghTT6gNIZzSnAKgpTXxYyYceOLQpOA0
         jTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dGW2CjjHfvy0AJ6wcB9IPgkzdavYFy0bii1ZXXgt0Oc=;
        b=QyK3aAB7It1p9jDXuZsPgpB3RUcenJaH9QEWrs2OZuNUXpCtVjHOlYl+ImbtBcqIlU
         i/emga96bAvdhYpTtW3nOqSEyHHUawA+MJdSRxuIEBiYse9Q5plfROTWr590ShWO3qMq
         axwWncAH7gylqcYjz4Smp8MSsqCu99rd6y1XI/H6qiOujvAH5mH0MSesxXyZTzBzaNYK
         FDSG07Rw6Mr9mQmUoSNhOF+qzp9dNhn+Xsmj/T1RFXDlSsOsNl4dozUdxTOzrifLQUMo
         Gic09j7BALbxA35d3TNqE301L0+za0pGfIVU6Zpk26Y0CR92dPwT/b1gbaGQkJcxMOMv
         V8jw==
X-Gm-Message-State: APjAAAVAwktTnNTodsApxemomcFLrMhzkjW1Kd8wFatUGP8kscAqhg0P
        Bp5iDb6Cdqsu9BO+cie92UxynjjoFDtBKw==
X-Google-Smtp-Source: APXvYqwpaluzEBZzEz4SSBwj6vNBO76yF4U5HAErT3DGa2v95d53QlbY+RGM9vbq8/WIk+dT299l9w==
X-Received: by 2002:a05:6000:12:: with SMTP id h18mr16674941wrx.87.1579782213086;
        Thu, 23 Jan 2020 04:23:33 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q3sm2416302wmc.47.2020.01.23.04.23.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 04:23:32 -0800 (PST)
Message-ID: <5e299044.1c69fb81.9c8f7.9d26@mx.google.com>
Date:   Thu, 23 Jan 2020 04:23:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200123
Subject: next/master boot: 198 boots: 10 failed, 177 passed with 10 offline,
 1 conflict (next-20200123)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 198 boots: 10 failed, 177 passed with 10 offline, 1 confl=
ict (next-20200123)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200123/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200123/

Tree: next
Branch: master
Git Describe: next-20200123
Git Commit: 41539ebf9bacf9a9102322ad944990f5a38f5538
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 90 unique boards, 22 SoC families, 29 builds out of 214

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

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

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            mt7629-rfb: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
