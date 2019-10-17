Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24228DA5E0
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 08:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407872AbfJQG7t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 02:59:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46495 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392672AbfJQG7t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 02:59:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so937806wrv.13
        for <linux-next@vger.kernel.org>; Wed, 16 Oct 2019 23:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5Xwdnogg0BA99UrQkJ3tz+6grZq1M7FSfaLWGbwQjIc=;
        b=wd9PigvLqGsGWXimEZgSp9rUR04cNMvPDcR9L1dwW6CbXhmkz5wZN1gPnNGenCCb86
         exiWvTI0dRBngv5QIwGJKdxYsqhYQXNHlpOqmw5ux8oDtJH7N8rTQ/CAaRSoFH82aZJa
         uH127e5ABHUAvsb7xzDdxFg5S2JssdxqJDRA8OTgB9v/fpn01sTYTRR324WB0w58zKYO
         m19lQdCCiJgixe2AHl1iyxg3ZTa3dtp7ACKC8FR0l30psir+c2Z0o6oNSzywyURrhzht
         fYWaAXnRDWO17xeYFWPquo+UDyymepXeYnETDt1+67H9A5AVrglu2bGyVgfFsJlUJrqH
         Pg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5Xwdnogg0BA99UrQkJ3tz+6grZq1M7FSfaLWGbwQjIc=;
        b=Ol3pb6CsU3/MghK7nTNnnJJuFPiJAEy9UevaXkmIuF5ALctxZuYD0Yem1H+8csgDuF
         HudNxVv+eGNrF0668Up1NDkpxAAsrWj+pptB2ReSGrSGVzkximSdsyzYIcqvUOdfm1mM
         CWrpi+3dQkRiHxVHzmCntTNLkxV0cLLgAvoTx8l2Lxa38oboniXNOg9bDCZTnkHzLODh
         T0igFUQhcFvlvkC/w0efJTQtVGBwUtgtJDDLW/rjXXGAUvesFSI09H9Bo0O3z+ow6UjU
         jbaxFb/nM1D1OPxhbmcbi20KG+DjRDjws0IJ1lx9jI1yfAWqeqvLoY2cT5Osmg8LdNYU
         x5rQ==
X-Gm-Message-State: APjAAAVzv6D+GhMcG5Is5sA3Z5V2YhJs/Ca5pr9beSXlvm6U/kv+P5nU
        TwfCb2v9347dYCTQeMtIljFFvPKQ7Ms=
X-Google-Smtp-Source: APXvYqyOeSEGKKTvpdv6hs77gGWbvtwdMwHaUQpwgBsNtJ7zlwM5sy5u4rMC0Bo3T2YFK88Ew/9wnA==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr1494753wrr.165.1571295586844;
        Wed, 16 Oct 2019 23:59:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l18sm1202294wrc.18.2019.10.16.23.59.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 23:59:46 -0700 (PDT)
Message-ID: <5da81162.1c69fb81.3523c.5596@mx.google.com>
Date:   Wed, 16 Oct 2019 23:59:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-353-ge94100b439a8
Subject: next/pending-fixes boot: 238 boots: 7 failed,
 221 passed with 7 offline, 3 untried/unknown (v5.4-rc3-353-ge94100b439a8)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 238 boots: 7 failed, 221 passed with 7 offline, 3 =
untried/unknown (v5.4-rc3-353-ge94100b439a8)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc3-353-ge94100b439a8/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc3-353-ge94100b439a8/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc3-353-ge94100b439a8
Git Commit: e94100b439a8adee55801508cc95cd2a45a8b40c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 25 SoC families, 28 builds out of 215

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc3-311-gc=
e15fc3fc1ae)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.4-rc3-311-gce15fc3fc=
1ae)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: v5.4-rc3-311-gce15fc3fc1ae)

    defconfig+kselftest:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc3-311-gce15fc3fc=
1ae)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
