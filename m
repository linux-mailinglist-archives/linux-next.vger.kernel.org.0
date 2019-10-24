Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1DCEE34BD
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 15:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387989AbfJXNtx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 09:49:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53446 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732044AbfJXNtx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Oct 2019 09:49:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id n7so2108373wmc.3
        for <linux-next@vger.kernel.org>; Thu, 24 Oct 2019 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GS79idFhJywag+RKkaXM2JavFOR3J2ksbC/3sG+Rjz4=;
        b=p71Ar1YSA1Urr6V/frmU4Ewy7R8mzVgF1d1jeXMg50o36aCxKXp3O0KrUnHzDFsTJF
         yEllVj7FsG79rJIukRCvRQPL/Puy22LyvFPQRHDhoXS7kdvCnUD7kJUF/oQAwbYq5mU0
         uiwR6UBbw0b9YjhoCvLACD2bn14+i5f77bs8/0F7+NZnMKK9LPzEMciFYOxfYi1+i57Q
         y0gnV93wwwUvVzIeeDbgxs99FHtC4FvUGEc5nVcgr4bFLaPZ35JX99/Cks4pRYpcrcok
         Oe2yYXFjZIuCifCv0ftPtlGrC1PtlKKL9WW3n7nGi19I0hO3j9ViFVoWSDHMLuCgnPLA
         Bw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GS79idFhJywag+RKkaXM2JavFOR3J2ksbC/3sG+Rjz4=;
        b=XkTeFUeXmvm88YbSCqEwECVcjPTIqFj7K2RDkScEnwlawpK+Lhct5suM7a0F1mGLBo
         1I+MwT5Cs8U+RZLw5WKU+EOWp5k/QKNYACugX8RC2pCq7GkmR9SWNUk0uOgv/Q6osDLC
         7oQp8yPXN0q3vFfzR/BlQYcH3c6VEvDykiSjKliYUZp3U+0cZURj595S3hwIWPzww6Bf
         ELhpakqFeITGWmXuegnY05uyjOHA8yIkHBbqaLgBDfWRn51JkDePtLEhqC2+h7PxMzZ9
         Bp4cwZlcdNfGzm383tRcE+a5X9QBwseE/+FW0TwNEoTBHHWthFpSnunBed2HA6l4vyYE
         H6Jg==
X-Gm-Message-State: APjAAAWPZkfupD25JLva1Msw+1tCUdWFuGBNZKUab6b8B8IcOIsFmSNA
        i/4l4RASrgvOh3IJ2WgXKvgRcOywBBgGNQ==
X-Google-Smtp-Source: APXvYqzO0PH69Qv8iksXqw+b/Caa1iJFfBLUiCV5WfNUX3WedsGVPwjCcEDmnixaEOJ5k8hM5oUzYQ==
X-Received: by 2002:a1c:988b:: with SMTP id a133mr4860641wme.22.1571924991030;
        Thu, 24 Oct 2019 06:49:51 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z15sm24754138wrr.19.2019.10.24.06.49.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 06:49:50 -0700 (PDT)
Message-ID: <5db1abfe.1c69fb81.2e091.0460@mx.google.com>
Date:   Thu, 24 Oct 2019 06:49:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc4-358-g489045e34557
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 240 boots: 14 failed,
 214 passed with 9 offline, 3 untried/unknown (v5.4-rc4-358-g489045e34557)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 240 boots: 14 failed, 214 passed with 9 offline, 3=
 untried/unknown (v5.4-rc4-358-g489045e34557)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc4-358-g489045e34557/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc4-358-g489045e34557/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc4-358-g489045e34557
Git Commit: 489045e345575c7c9872670f3291cd4222f33bb9
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 25 SoC families, 28 builds out of 215

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

arm64:
    defconfig+kselftest:
        gcc-8:
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
