Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E7EE2169
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 19:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfJWRHv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 13:07:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40528 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfJWRHv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 13:07:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so20362931wmj.5
        for <linux-next@vger.kernel.org>; Wed, 23 Oct 2019 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MzAkOD4aN66jKUu/z76t/2V05qseELgo+yGhh+yDtvA=;
        b=jml9NBmYM9EnXhMIstBgKPibKbuS85/8x3RZ5E6BPdyrq15bSV7L0LPlRP9ppDB7eX
         2yaLMeg+xgIh1cPxiYXQClt8uaGvqebLZdI1ZE+m3fRBiSRaUsQ5GCGdCcFQtj8EaCEO
         WHlHQySZ8jI3EBYeG2EOB47csFpDvhKP4EL6G5aC0CfGzFo6pZOjjSWzvUQeHvTAkRFZ
         Pf7oKuJERSrKd84jRhKRf2cED4o4Xl3Gc6iF+b+cva4SvFWxLrGWCZhuwOrfDkeyhTAr
         EhZs05mt6YrEgtqcpAkO4w+Wpzc9qHD4XieGtF/GFbAvWgYpW2T6iule9WVOyB9Z+P/v
         VWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MzAkOD4aN66jKUu/z76t/2V05qseELgo+yGhh+yDtvA=;
        b=fcyXRY9jw+YnAkeukdCp9iVuIsq8D/wTLl+zkCtk96CFc+bSat9JzpoWq0klWNJNl5
         yKGHg7ibi3sxwDMUicG4u11lNGcYwxvv9d85UGxh4PIxfCisUZVA8wH1k4seiCqjRmD7
         PBwpMWALIplD0PCho1dcqbgUAA+QZW0zVatO9zqbS9UPElg6WyLOtJXtru9YrrHGdHwi
         /j9MyzI9z2pZggUMI/6a9J3HsDEj3OsuHhxOjmCdO5Y3ETShtl7sf4j6CfNUJE62KjGx
         VaunJDfbYMhc/RM/4mo3R5GKha287NpNcn9Qqy+DKUMkzJsAgXez1K2Pj8X3miGjL3rf
         isyQ==
X-Gm-Message-State: APjAAAWBpkyVrhEPcB3vFb0uEdvkQiF833uVnEqomASy31BBlcjT9Sb0
        lj2KHw+tRXKbRDqrpIIz+kT/x5mVRAO8tw==
X-Google-Smtp-Source: APXvYqz188dG5lhlecdRISnvXqYhV3ZV2ZBg127/0eVi5r5z0MFUWhbwAtesG94+ML+7FRnndWCkvQ==
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr818029wmj.85.1571850469147;
        Wed, 23 Oct 2019 10:07:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o18sm25387419wrm.11.2019.10.23.10.07.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 10:07:48 -0700 (PDT)
Message-ID: <5db088e4.1c69fb81.51d2b.2d1a@mx.google.com>
Date:   Wed, 23 Oct 2019 10:07:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191023
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 289 boots: 18 failed, 258 passed with 8 offline,
 4 untried/unknown, 1 conflict (next-20191023)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 289 boots: 18 failed, 258 passed with 8 offline, 4 untrie=
d/unknown, 1 conflict (next-20191023)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191023/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191023/

Tree: next
Branch: master
Git Describe: next-20191023
Git Commit: f3c452cfc59c817950b150b51ec2b33409d7640b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 26 SoC families, 28 builds out of 219

Boot Failures Detected:

arm64:
    defconfig+kselftest:
        gcc-8:
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        omap3-beagle-xm:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
