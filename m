Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6221921034D
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 07:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgGAFa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 01:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgGAFa2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 01:30:28 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EEDC061755
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 22:30:28 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o22so5481781pjw.2
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 22:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MVqBmqXnxDvECZ34UrKbHtho/45ZRgn+juiosv7dsaU=;
        b=1h9n1/5vwDQK+TtaPNJJrDr9XVrGTA3OF/knGYh9XrDSBNLfu6m+R+acGTUDuqVZxm
         x+YEo5MqDvZdnhVnCIu1sRQuy7jk2hCNO1YN2SmddH7VT7ZVDwnmGQKZPtdZgug8mDTT
         y+ASbQcLwTvPpBIPzNtcPDdWCehCyXhlEj3kHuhYRj7HcqN2oWMnmZ3Bqf71HxVtLsGX
         UilWzhRGVTEvHypyg9wr0jVre+6O3hiVkG8epFKuhVtMMgoOGcrYNEKCi5Df1s6av82N
         geNeLuWHk+GNtB/djfHe3D/sTqpldA/k6q/0qdU2pS0TguhkqWsNwyCxiBn8AOC/EMhV
         XbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MVqBmqXnxDvECZ34UrKbHtho/45ZRgn+juiosv7dsaU=;
        b=MytjH/rTdRFDoJwAKvyjHPrWo0C/+enRsq/iOO+izwiyPwMD0o8QsnAev5v9hAJUbO
         NGWXHwmv/s2psuNqCUIjEjTcZ8U5RYhyctmhoPInk4snGLvZBu0ZQUYD/fKMNMS97XiD
         fh1mZV7FpdV7Z9RDhuvfvphfi42XsWkZgXM3Cf8mrlJbFIYqWAH4tifSGRBRtBltDWT4
         739MPwoQMsQFE2x2w1kZMP2rKQXdOg0f0arxZJ9hn0xAsnGDc4Ctm1CjFXqJaDZU4DQb
         i3TWBaEiBGikGFN222P1KseD8VtOEhvMoxA0wPAzGMqMANREweQQO11wi/UMPpvKbjxp
         MGxw==
X-Gm-Message-State: AOAM533ztKtYrE+v4BQYty+38j1JPOxBXdhJQE33tC4MVjowVaHydW16
        /ZVHsvxqoxeVV0Aye+W6TS0cpsk1nrM=
X-Google-Smtp-Source: ABdhPJy8TeiSmajpalakmLP2Tpbpx/UB5+bVdzgSVOWs31W1SKabRErFHbCVjzFmT29f9WjfPat6Lg==
X-Received: by 2002:a17:902:e78f:: with SMTP id cp15mr21354982plb.41.1593581427606;
        Tue, 30 Jun 2020 22:30:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c14sm4342217pfj.82.2020.06.30.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 22:30:26 -0700 (PDT)
Message-ID: <5efc1f72.1c69fb81.17ab8.c988@mx.google.com>
Date:   Tue, 30 Jun 2020 22:30:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.8-rc3-259-ga26ea8c1e000
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 142 runs,
 4 regressions (v5.8-rc3-259-ga26ea8c1e000)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 142 runs, 4 regressions (v5.8-rc3-259-ga26ea8c=
1e000)

Regressions Summary
-------------------

platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
            | 4/5    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g           | 3/5    =

vexpress-v2p-ca15-tc1 | arm   | lab-cip      | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-rc3-259-ga26ea8c1e000/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-rc3-259-ga26ea8c1e000
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a26ea8c1e000acb6d371254e2c24422225ba3049 =



Test Regressions
---------------- =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig        =
            | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efbea97bdf2d1249a85bb32

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbea97bdf2d124=
9a85bb37
      failing since 6 days (last pass: v5.8-rc2-295-g0780e0d6abd0, first fa=
il: v5.8-rc2-376-g1c7e639860a8)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5efbeda791881169c985bb3d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbeda791881169=
c985bb42
      new failure (last pass: v5.8-rc3-210-g0a3929819868)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-baylibre | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efbeb9a6efdbcb07285bb2a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm/vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress=
-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbeb9a6efdbcb0=
7285bb2f
      failing since 2 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =



platform              | arch  | lab          | compiler | defconfig        =
            | results
----------------------+-------+--------------+----------+------------------=
------------+--------
vexpress-v2p-ca15-tc1 | arm   | lab-cip      | gcc-8    | vexpress_defconfi=
g           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5efbeb0c910c9200b685bb41

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-rc3-25=
9-ga26ea8c1e000/arm/vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-=
ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5efbeb0c910c9200=
b685bb44
      failing since 2 days (last pass: v5.8-rc2-453-gf59148f15013, first fa=
il: v5.8-rc3-164-g155c91ddae03)
      2 lines =20
