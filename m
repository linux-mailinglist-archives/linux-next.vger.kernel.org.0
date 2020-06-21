Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D737E202979
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 10:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbgFUIDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 04:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgFUIDu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 04:03:50 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DC6C061794
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 01:03:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id s14so2023028plq.6
        for <linux-next@vger.kernel.org>; Sun, 21 Jun 2020 01:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qdRF0P+50H/PvHr3v2Gt+VHSFzT/M8hfEmQwD2ndNc8=;
        b=vizUO4eIYiuUuPuNvsumT8LJyXvCfk8IjMYGE0Cdulx0lwGKBFrjTaBvGKiaV4zsRk
         0m7C4WKwmVdXFn+hIIMY0cXXbU8CT4kzMqcXNRGeOpKqDfw3oHX0/iUpyrme7WjHE8BE
         MasBlsdjMNNQ0tPrsloz8R2dJKYmHSEJUo8itVMHcquhLPBm/L3fXtnMxpvyW3Zfkjzu
         sHpXShfOBuvjt9iJd4JPaImq9Rwz8hmcz0PX04fO6SFzmyD3xEy01Canu80DNrCNs1Sy
         4H1ywTHBIK8a+FwIMfMyU3/QyI8wi06zCT65R7dsvPSwBDHbIALZgrzOOIT4YndbOi+K
         P90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qdRF0P+50H/PvHr3v2Gt+VHSFzT/M8hfEmQwD2ndNc8=;
        b=FGtuCigvXXtamMtevuE9W0i43FXdVAUi9WVmZsD6UCwWOuiOEoImUpwpeXW9nlHHyQ
         0RmtYvFrlTNsIZRJh+KvigFtccckyqV/4r2yNyKnMO8T5COQ3Ivzr4X7D4Ne+IJrv2BI
         c/TopZZoNyVwEPlC1DkARcE5uBz9HkspD6yJT/eU+WKgrfiyYunS7t266Eu/5xcToVNO
         tGwoIjmQvFNfRczzRrgR9EW6LSeriO0NwPHGsH1+TR4j9/VWrmqjvRGFVMM9+gMkYYPE
         wjkgneR1YBkQofyDopaNujcDu8bu1g0yFCC/TPQ44Neebyu23hTeXC9NxqldiXzLL8PV
         Gshg==
X-Gm-Message-State: AOAM533gOaXYeQkV7eR3XSZytfuGUcFTyvQobzOeLvur5VyWsXI527Rm
        2C6nYxMgW7cuekHHRhjxNOrUWiEcYXY=
X-Google-Smtp-Source: ABdhPJxqI1T/EoeY2TyCy8klI5VT9zpsVvBQjtVR2DF0IEWLYS97srVmfxPSJT+wThiXbAwuM3TuvA==
X-Received: by 2002:a17:902:7783:: with SMTP id o3mr14664703pll.286.1592726629544;
        Sun, 21 Jun 2020 01:03:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h9sm9737563pjs.50.2020.06.21.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 01:03:48 -0700 (PDT)
Message-ID: <5eef1464.1c69fb81.e2bcd.ec36@mx.google.com>
Date:   Sun, 21 Jun 2020 01:03:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.8-rc1-559-g6de53dcd5c17
Subject: next/pending-fixes baseline: 68 runs,
 4 regressions (v5.8-rc1-559-g6de53dcd5c17)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 68 runs, 4 regressions (v5.8-rc1-559-g6de53dcd=
5c17)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =

meson-gxbb-p200              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc1-559-g6de53dcd5c17/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc1-559-g6de53dcd5c17
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6de53dcd5c174cf6f53565b6d27f2cd5920cb2a6 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeed0c374226e084897bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeed0c374226e084897b=
f0a
      failing since 46 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeed7d8c2cbde7a8c97bf17

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5eeed7d8c2cbde7a=
8c97bf1a
      failing since 3 days (last pass: v5.8-rc1-231-gbf332658aac2, first fa=
il: v5.8-rc1-339-g3b15f0074015)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxbb-p200              | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeedfbe2f0f1e4e5a97bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeedfbe2f0f1e4e5a97b=
f11
      new failure (last pass: v5.8-rc1-339-g3b15f0074015) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeed81798987b2b6097bf27

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc1-55=
9-g6de53dcd5c17/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eeed81798987b2=
b6097bf2c
      new failure (last pass: v5.8-rc1-339-g3b15f0074015)
      2 lines =20
