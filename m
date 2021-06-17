Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5443AAF14
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 10:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhFQIya (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 04:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFQIy3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 04:54:29 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DCEC061574
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 01:52:21 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso3431274pjb.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 01:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IeCt1LCBmQLpZJpPVPHS3FBvdFhhuGGfICz51qs5fU0=;
        b=RQr/ENhzCU1kAopAX0vic1S2ypMBbN/2uGMCG59jEkhsgaQY/uVB3FH8CnPvwBXQjO
         9Im9unIWmaA3QSyjNwuK9OBihgf9HDLWPK+Ntkq+H4E581z9MpmII2pJhAAGdU6+2OFp
         6aecMFkrJci3ZIkijoPLSMpzHUPhsbkRqCJQQJEJCtfNKU+rl26ujQuONhVmwbYHvPei
         yCa/Rx6xmH0OGsxjb2NBO9z+XkqpktR7ruNW4imfDyuHspmYbvMSaZsJLVssMBSBPSxN
         r/bc5GvA+w2YsSyyJptvguR+hkue0XZbC9uTJFf3ZwatQR54XgVcRkTqohlig967SqH1
         QIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IeCt1LCBmQLpZJpPVPHS3FBvdFhhuGGfICz51qs5fU0=;
        b=DGOkN1qtECT5QBxuKJHQvfg1Qrwzx+bLvYK+VP8l/eAE+jx2lbH8T/v7jjT4yjmk/m
         jpRma/DZeuDO0Coy1fmrWgwf5b63MfeJKe4WQvfT+SLNyTyoVozC8LjWNcoLV1hjF45J
         jUzW+EYeCrfPjhgnFsz61Cs9iMdoTfrAWEy5LP2HgzI7lg8WisvYFji7CUWQ8O1QpnPn
         u7WrAY+o31eYWA5vCyf5WOczBImt4wnOVMHgy9XDJlXhkjD8eEOwUiSjHN1DDzmxbfSe
         tHM9K103Mq2D2SOgXsAMbhScV88/xqayzHLAi+pQf4vB8tVyK4pF8vnf5WcEKk9tGjFt
         X3mw==
X-Gm-Message-State: AOAM5315mWuiNImHOS59MF/Leh8K4UJz0/JoefSo4yvBt/qUIRlhQkxO
        OowHgNqmAjwL1I5uJxbse7hOSby2R04p+jLU
X-Google-Smtp-Source: ABdhPJy3QyLHWmS1whRKKWcu+8Xtk33K7Fm8QyKbHizDjWFG1FjYBBuij33X1zlAFGs+FtDoJmlwUg==
X-Received: by 2002:a17:90b:3696:: with SMTP id mj22mr16104261pjb.124.1623919941157;
        Thu, 17 Jun 2021 01:52:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s13sm4896404pgi.36.2021.06.17.01.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 01:52:20 -0700 (PDT)
Message-ID: <60cb0d44.1c69fb81.c1443.dde9@mx.google.com>
Date:   Thu, 17 Jun 2021 01:52:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.13-rc6-296-g227cd20c3337
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 221 runs,
 5 regressions (v5.13-rc6-296-g227cd20c3337)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 221 runs, 5 regressions (v5.13-rc6-296-g227cd2=
0c3337)

Regressions Summary
-------------------

platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =

imx6q-sabresd        | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc6-296-g227cd20c3337/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc6-296-g227cd20c3337
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      227cd20c3337e2a689f86094523425708093664c =



Test Regressions
---------------- =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60caed266c56faaa8d413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caed266c56faaa8d413=
268
        failing since 132 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
imx6q-sabresd        | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cad47e07a9ce5792413322

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cad47e07a9ce5792413=
323
        failing since 234 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cacf98090ef4d2f8413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cacf98090ef4d2f8413=
271
        failing since 212 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cacf9b671958870b41326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cacf9b671958870b413=
270
        failing since 212 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60cacfa23f792caf4d413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc6-2=
96-g227cd20c3337/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cacfa23f792caf4d413=
279
        failing since 212 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
