Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8215121CE62
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 06:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgGMErX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 00:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgGMErX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 00:47:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5705BC061794
        for <linux-next@vger.kernel.org>; Sun, 12 Jul 2020 21:47:23 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f16so5625984pjt.0
        for <linux-next@vger.kernel.org>; Sun, 12 Jul 2020 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0PaICmkwzXyyz3O2AnObT2so5UXCkBmH8PBC2iznPW8=;
        b=QJN6uX8zaLyoLpBxQxiNWkC8Ku83UKK24BZPRWN6x4iZPUITgBT5uTKYW9Hh1QrlbP
         iqp+FY0LadCgM7nvH4mu0H+z7AtNzOyINtIkU98nwGFBaA13wK5POL1Rc0bUDXSEkfHh
         FRkKQ1XgRRNlw3awkyDYYLJQznkecNtRvjPU2EOROZqPTxRnGKDllsPjBGMMKP7eXjxy
         JQZO9QR+cl/wA392xqmcAa2klbpRd6qcyieeUHyT4m/Z64YFc/A6/rVIsz7xlKTrZ5TL
         FfP1rE3A87XwU1iRvFVqII04YW/nSWbzNmVXxsN8JW7rVfQc/cjY6RInUWCr2TbRuJii
         fhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0PaICmkwzXyyz3O2AnObT2so5UXCkBmH8PBC2iznPW8=;
        b=EQ5k0XRfIeca7Ku/NqeOLZNS895HCMKvc+R/bm8bXmP40gGJ/bRCC1N2B9O5G0a0RA
         2o7nb+oZKWg/Uvhs4YwCduMlcRvuIbDz1MBqphqSN872rW0OJK2C9lHa3ZP/De3yF11I
         f89aKSHH/LvaZXN721eeJbCrD4FFJZ69D0kKw/jDPkdWqCnAUD8lSeBzvGgsvCWVwpaO
         Rs/lIh2LbKl1VlFPBL5QHInjbSpr9ytgSqvwAuOdXXTkXQLCFfNOP1KKRT1y921Tzxeq
         XDp2LBZ4kOciUrwFiOQdpvvpwPcjwvaHwL25WGOgRTu/sFKM1ygiZ3FjLM3lgXBvxTbr
         iawA==
X-Gm-Message-State: AOAM531qqSoXY/pFzL0wUFhkinxTc3hMEgIzGrpUbKQSCmssiKXAwTRC
        +o+Tkm1AGMORDm8a/EgL921KTiS7BxQ=
X-Google-Smtp-Source: ABdhPJyDY9mc3nKMRQ55z8orKr+3uU7MhR1T27tUmcGlfqQlCgDtanVOnEJfdoxQGssGiYYu4U83EQ==
X-Received: by 2002:a17:90a:178e:: with SMTP id q14mr17372165pja.80.1594615642489;
        Sun, 12 Jul 2020 21:47:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gv16sm13179405pjb.5.2020.07.12.21.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 21:47:21 -0700 (PDT)
Message-ID: <5f0be759.1c69fb81.4387d.ec78@mx.google.com>
Date:   Sun, 12 Jul 2020 21:47:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc4-597-gb8976598d3c1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 134 runs,
 4 regressions (v5.8-rc4-597-gb8976598d3c1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 134 runs, 4 regressions (v5.8-rc4-597-gb897659=
8d3c1)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc4-597-gb8976598d3c1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc4-597-gb8976598d3c1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b8976598d3c1a868a68c28f6d8b85a0581e4537c =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f0ba44effb854a1e885bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f0ba44effb854a1e885b=
b20
      failing since 68 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ba9721531f8c75285bb2f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f0ba9731531f8c=
75285bb34
      failing since 3 days (last pass: v5.8-rc4-328-g1432f824c2db, first fa=
il: v5.8-rc4-410-gf11279e61036)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ba363f394772cf685bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ba363f394772c=
f685bb1b
      failing since 14 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform                     | arch  | lab          | compiler | defconfig =
                   | results
-----------------------------+-------+--------------+----------+-----------=
-------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-cip      | gcc-8    | vexpress_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f0ba35a98679099a785bb19

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc4-59=
7-gb8976598d3c1/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f0ba35a98679099=
a785bb1c
      failing since 14 days (last pass: v5.8-rc2-453-gf59148f15013, first f=
ail: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
