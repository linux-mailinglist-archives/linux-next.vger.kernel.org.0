Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C122A5E91
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 08:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgKDHJE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 02:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgKDHJE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 02:09:04 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897F3C061A4D
        for <linux-next@vger.kernel.org>; Tue,  3 Nov 2020 23:09:02 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id h6so15797463pgk.4
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2020 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hpH4XXhZu0JFzldTDqcuYXyJCB9Euemt4ep7z9TjwkU=;
        b=Ze3P3CrO/3yAm0aj20fML9tOtVqbxjn4fCsFkeLlKst06jRMz93NpWz0YJccLaQ9Dk
         2o/oh2JYcvrX8514d/GDjYr0n3bkUKTMr0QFxNu0vuijiNEjcixJumGUc/F9AUfaTYnf
         wsYs63IAhzpbxTe6lfGzFqv1xIafAy68wUtANm8eX51zxgDy/SA8iLGlhuhRFmhEhZXX
         ikETdw9bAQeeZ/50sh8DqtTy43Y+Xi4T9NasIN82LA+bxTCvdMk35RmCx2F/41KBUMYT
         Bc/Sty5SWKslXWx8ilgDfgAY8y1GiVLds1EKZmDwPJ5t0lAsPMrcHOrNOdqNrND/RQOb
         O7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hpH4XXhZu0JFzldTDqcuYXyJCB9Euemt4ep7z9TjwkU=;
        b=iKfwEgzW5CTjcmgnk1PVKcnMuVtZAcaNa4BgPN5GZUzLPz1zlEyR+rUvIvUk27euvG
         seAJ98nGsa29l4GgJaZeumYrmUyxTveTRlRuxCCmhg6GHmv0dprlyJjMA4YJPK4oxIgL
         JLghQLta7oI2ZCijpLSiWimTr/DM4PzxyEo6J/CJwOB4xh8ovPb26rbbFvQPiXCNlgoF
         Ei36Pze7q9k0l6DtdWvbtkQkZsac2zR/2m/V3EGLhOH2XtpBTCWb5TblL/Mo4BuqBJV0
         cxTkJoZX41yOfgRKoxou0T7nsqFPGueZL1dAveb0/oSsTQDHC5fXWsSdxcgQhN9QV6MD
         EGEg==
X-Gm-Message-State: AOAM532YqC8fkb0gee59aY3aJyIJqZb46Sxi1k7jV1yBFRPYHGWxKUZs
        nov8tzk22qe0IgJ+M5bgrVqbCv6roT4PXw==
X-Google-Smtp-Source: ABdhPJw0//BK6P+tvPthWCmTDOfuOOWgvhZ/Vznhqh2bHOt0WxO5jK6IYa5/4Ps18vgaQqY8k0migA==
X-Received: by 2002:a05:6a00:1707:b029:18a:a5f1:6809 with SMTP id h7-20020a056a001707b029018aa5f16809mr20421102pfc.77.1604473741405;
        Tue, 03 Nov 2020 23:09:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o65sm1087566pga.42.2020.11.03.23.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 23:09:00 -0800 (PST)
Message-ID: <5fa2538c.1c69fb81.d6585.304c@mx.google.com>
Date:   Tue, 03 Nov 2020 23:09:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc2-346-g3261d524354a
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 342 runs,
 7 regressions (v5.10-rc2-346-g3261d524354a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 342 runs, 7 regressions (v5.10-rc2-346-g3261d5=
24354a)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc2-346-g3261d524354a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc2-346-g3261d524354a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3261d524354aac9d51eb78421293bf66b42c133e =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa21fcf1113e30ec0fb5308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa21fcf1113e30ec0fb5=
309
        failing since 182 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa222479499ad4df0fb530e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa222479499ad4df0fb5=
30f
        failing since 9 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa222b39499ad4df0fb532d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa222b39499ad4df0fb5=
32e
        failing since 9 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa2213c641596af36fb5326

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa2213c641596af36fb5=
327
        new failure (last pass: v5.10-rc2-238-g6462cab89467) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa21eadbce4faa0c2fb5308

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa21eadbce4faa0c2fb5=
309
        new failure (last pass: v5.10-rc2-238-g6462cab89467) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa221de56689e0c64fb5330

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fa221de56689e0=
c64fb5336
        failing since 91 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-11-04 03:36:56.341000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-11-04 03:36:56.346000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-11-04 03:36:56.352000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-11-04 03:36:56.358000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-11-04 03:36:56.363000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-11-04 03:36:56.369000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-11-04 03:36:56.375000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-11-04 03:36:56.381000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-11-04 03:36:56.386000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-11-04 03:36:56.392000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fa2232fe19c20eeeafb5313

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc2-3=
46-g3261d524354a/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fa2232fe19c20eeeafb5=
314
        failing since 91 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
