Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6825A13A85A
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 12:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgANLYK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 06:24:10 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36501 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgANLYK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 06:24:10 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so13281841wma.1
        for <linux-next@vger.kernel.org>; Tue, 14 Jan 2020 03:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CYdc+k0G3+r+5PWaOF5JXA7ys7aqQL3SfpuJMKCCFeA=;
        b=goHXvhMmqC2RsxK1D0RYIngqOwEEZronkwQpXqU28NNYcC3Pul4GvvrpTVXRG3MvRm
         FSTk218GRsxabmpWbzbQxIUSoZ4cznLw1Jy6fwLq72CFrDtW8vztgGyTTvbBaN5eer2E
         4ZIUoU/WOpbFUr7uhG7X6fqoyUKhkjgoLemYBs/N5ABqdPFxYhzU7w9WgK+0Q/VJ0mIa
         Da9em2BSfVkJxa0aWPnpzXLed8eygLDjRyfbWF+5Bas9k9u93f9tloq2fDVxD+vRmFai
         3dBzh0m3O4SjQiqNv9p4qifZBtFEa0HDea9csNmFqM0H+OUi1UrB5yRtwjYFE+sWJocJ
         bkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CYdc+k0G3+r+5PWaOF5JXA7ys7aqQL3SfpuJMKCCFeA=;
        b=nQV5w9PDSptnd5SQVeSlQrEjX6aoO+Negy03h+283TDoJEJaQEsco7lCDFoGthNK9P
         a+QIHuj15asOY4gDTfIAj+K8kXvf4tf5Jpy73Bs3iXNPkZnXvHjcibbuykja92gmV+d7
         ehPfWN45yDW20EnEH5XYHFIesNXPBe1REfhNkvuSdBZS1NDhpuK3G4EQFjWrpF/OwIfb
         YOYDNABWhs9GBEpktY0F+Gx2dLSbOD0GxI1JbzumU3Fa8w2whQLf+DCndrmQJct0DYwr
         nQ9kfOfGQ4cej+Y7Ye0OJQspOG1kHjL6GbypEj2FcBR+OSDewlMDM5m78yZOPl8o9Bq9
         Nr9g==
X-Gm-Message-State: APjAAAUJbGafcIKv9kjYWGoKK/dJnPGN9Y9cT/SxymFrMrCTrDQ4TB0/
        msoS4IEwBOkmY5kSZ98mjKqQADYV5Le8Og==
X-Google-Smtp-Source: APXvYqxb8DBmtouvjMTbAGGtgGeF1KQqlFbE0SIgJY4Zl3P9KFJHeUNeesanWcSH8omAFQ/QoRCkIw==
X-Received: by 2002:a05:600c:2c13:: with SMTP id q19mr25542107wmg.144.1579001048302;
        Tue, 14 Jan 2020 03:24:08 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i5sm17987743wml.31.2020.01.14.03.24.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 03:24:07 -0800 (PST)
Message-ID: <5e1da4d7.1c69fb81.8716f.baed@mx.google.com>
Date:   Tue, 14 Jan 2020 03:24:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200114
Subject: next/master boot: 114 boots: 16 failed,
 95 passed with 3 untried/unknown (next-20200114)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 114 boots: 16 failed, 95 passed with 3 untried/unknown (n=
ext-20200114)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200114/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200114/

Tree: next
Branch: master
Git Describe: next-20200114
Git Commit: 1b851f985f514a7a173e5c55b9fdbf5d18f9ea74
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 49 unique boards, 11 SoC families, 22 builds out of 215

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 8 days (last pass: next-20191220 =
- first fail: next-20200106)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 7 days (last pass: next-20191220 =
- first fail: next-20200106)

    omap2plus_defconfig:
        gcc-8:
          omap4-panda:
              lab-baylibre: failing since 7 days (last pass: next-20191220 =
- first fail: next-20200106)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 7 days (last pass: next-20191220 - f=
irst fail: next-20200106)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200113)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200113)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200113)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200113)
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 1 day (last pass: next-20200110 -=
 first fail: next-20200113)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: next-20200110 -=
 first fail: next-20200113)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: next-20200110 -=
 first fail: next-20200113)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20200113)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            msm8998-mtp: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            omap4-panda: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            omap4-panda: 1 failed lab

---
For more info write to <info@kernelci.org>
