Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F14041D7E5
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 12:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241052AbhI3KjE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 06:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349928AbhI3Ki7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 06:38:59 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33C2C06176A
        for <linux-next@vger.kernel.org>; Thu, 30 Sep 2021 03:37:16 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id s55so3530848pfw.4
        for <linux-next@vger.kernel.org>; Thu, 30 Sep 2021 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8cixvvOnYYyXl+HioDCeNrKTfaaGMftXqSfwDAqc48c=;
        b=HgKKD+qCdqsYKCmRzjU7tGKrlBr619ZccVPOmXgUJ6oV4LP/EDSUdiAOxWa3dpMJsg
         jsA6qJ6JId7z28jTLMLnCbzjtfiV8k5UtyLfF4a6QBbzvxNafx5LMUIw3awnwvOxxr7O
         TJBgunfE7dlj3id4utcOa89CVnHMbxdQcMPN4Hdj6PZFuPP4pSiqoXC3McKK1aZL3tPL
         EMnc3bq3ADAxXhyNSgs6JdTG42bED20rNgzmARhaAgREhR43Fqg4cPAGewQw6LRK9hNP
         6y1BN7tOHAomjGW2QnU4TVk2Orn4SmnwTCjQiNUNov9lq3HjrtbT4M9Kf/ak4tVMepXI
         zffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8cixvvOnYYyXl+HioDCeNrKTfaaGMftXqSfwDAqc48c=;
        b=snpdxrvl4mt1Ssiqi6gmxVRr1bSr5z4qKQFo6+DiJXaaEqI9Cz7HFRR60+r6KDt8vK
         N15Ja+ysjRBD0Qnhj63z0bESH/YJ74eHrNtkgkWTXbej5GwCp8wN5BbYJ3XSysQDlUkV
         U0fMDeXIsR+NX0bdBJnl23RChFdSGpc0kRyjN5313xuxNnroV789eDqoADBiiPcNbtAJ
         HfCrWE8C8I7cRY07oK1I81P1rRLSmaKjC2KccOzvPGHk0rSBrmVUOHqWswqTampwBWkP
         ouOIL+qmfvjwhUu1Lp/3V4Uu0AdOWA78o2g6YF9Vs8+VrUDiwqUJYzlbWy5MCHAcD+I9
         A1Uw==
X-Gm-Message-State: AOAM530evURDwqs2nT8DF0PoBQKcifxixaH17nGa8UWyWGHntwxxLxnh
        LgZjy9xPiOvmnfdjw//AE7VRocvdfqz93tL4fJQ=
X-Google-Smtp-Source: ABdhPJyX3K+zTmD1xpLDLj+WyQpOPk15xjGAJljpLc8V9fqwvA4No6yEK5VcsCFWDpgh9aVPh6OfIg==
X-Received: by 2002:aa7:9596:0:b0:43e:48:dbeb with SMTP id z22-20020aa79596000000b0043e0048dbebmr3538368pfj.77.1632998235737;
        Thu, 30 Sep 2021 03:37:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n26sm2781272pfo.19.2021.09.30.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 03:37:15 -0700 (PDT)
Message-ID: <6155935b.1c69fb81.64816.7e0d@mx.google.com>
Date:   Thu, 30 Sep 2021 03:37:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc3-397-g80b7383f5539
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 497 runs,
 18 regressions (v5.15-rc3-397-g80b7383f5539)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 497 runs, 18 regressions (v5.15-rc3-397-g80b73=
83f5539)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+crypto    | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc3-397-g80b7383f5539/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc3-397-g80b7383f5539
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      80b7383f55399869d5915335a5e2416ac4cbcd14 =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615554e66b28373b2899a32c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615554e66b28373b2899a=
32d
        failing since 237 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615554e6c85721c3b099a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615554e6c85721c3b099a=
2dd
        failing since 1 day (last pass: v5.15-rc3-260-g1a398301185b, first =
fail: v5.15-rc3-320-g55d87bb21463) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/615555d7ab392681ef99a382

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615555d7ab392681ef99a=
383
        failing since 2 days (last pass: v5.15-rc2-438-g281756d0de8c, first=
 fail: v5.15-rc3-260-g1a398301185b) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6155582e76ec9c458b99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155582e76ec9c458b99a=
2e1
        failing since 0 day (last pass: v5.15-rc3-320-g55d87bb21463, first =
fail: v5.15-rc3-355-gce19122666db) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615557cb4cee4a7dad99a32f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615557cb4cee4a7dad99a=
330
        failing since 0 day (last pass: v5.15-rc3-320-g55d87bb21463, first =
fail: v5.15-rc3-355-gce19122666db) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/6155563a11e1a940ca99a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6155563a11e1a940ca99a=
2e3
        failing since 90 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61555ef2cc7cf064b299a3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61555ef2cc7cf064b299a=
3e1
        failing since 85 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615552842f5c3b741099a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615552842f5c3b741099a=
2f4
        failing since 317 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615552831de0c51d9c99a320

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615552831de0c51d9c99a=
321
        failing since 317 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615552861de0c51d9c99a327

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615552861de0c51d9c99a=
328
        failing since 317 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61555935173267809499a337

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61555935173267809499a=
338
        failing since 317 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61555238c8a51427eb99a308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61555238c8a51427eb99a=
309
        failing since 317 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/615554ed49d1d1e80399a2ff

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/615554ed49d1d1e80399a305
        failing since 79 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-30T06:10:40.621590  /lava-4608537/1/../bin/lava-test-case
    2021-09-30T06:10:40.633593  <8>[   25.318215] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/615554ed49d1d1e80399a306
        failing since 79 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-30T06:10:39.585079  /lava-4608537/1/../bin/lava-test-case
    2021-09-30T06:10:39.595157  <8>[   24.283747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61555a7ff8e89f38fc99a2ec

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61555a7ff8e89f38fc99a2f2
        failing since 79 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-30T06:34:33.545177  <8>[   51.568893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-09-30T06:34:34.567483  /lava-4608796/1/../bin/lava-test-case
    2021-09-30T06:34:34.579271  <8>[   52.603545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61555a7ff8e89f38fc99a2f3
        failing since 79 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-30T06:34:32.511447  <8>[   50.534666] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-30T06:34:33.533037  /lava-4608796/1/../bin/lava-test-case   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/61555564f1c8938b0c99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61555564f1c8938b0c99a=
2e1
        failing since 0 day (last pass: v5.15-rc3-320-g55d87bb21463, first =
fail: v5.15-rc3-355-gce19122666db) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61555a77f8e89f38fc99a2e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-3=
97-g80b7383f5539/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61555a77f8e89f38fc99a=
2e7
        failing since 0 day (last pass: v5.15-rc3-320-g55d87bb21463, first =
fail: v5.15-rc3-355-gce19122666db) =

 =20
