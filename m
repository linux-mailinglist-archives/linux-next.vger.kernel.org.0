Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893523FFFB4
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 14:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349140AbhICMZm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 08:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245400AbhICMZm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 08:25:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2119CC061575
        for <linux-next@vger.kernel.org>; Fri,  3 Sep 2021 05:24:42 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 18so4157807pfh.9
        for <linux-next@vger.kernel.org>; Fri, 03 Sep 2021 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DLMFifxH/f7ukEsjKNqBV/54TeuE+eNXzF8ZBWxC0ys=;
        b=ooOSQWlJmGjU/N7zvoZgbc1+4wOD7SGnW98QefZGgw2+JfIJQGz09ObOlvpr3dUCNk
         Qpuj7Eln/j59KcCx5WOffes2eigwKcyO6IvFWXf1oqNPNr/GhoW8jMivksgmSeL01ydq
         m/5PASUADyjmIN0GGtpsDXs72UsnkpLUf7+tjxD3DCOsiH6NOgcDFxynkKechqJay3hv
         vgAIw64deqW0HNPv9p4jfGz7NnbP2RbjdRvYdBbVxL+2Q2xiwfNQhws1fB/46qSkx8LP
         48MP//geF/5cXzt6uehZJhUkgRWFImbLV0W+39WCBBRO/oWAckmJdbZdsV2lH5f2A9SJ
         7Bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DLMFifxH/f7ukEsjKNqBV/54TeuE+eNXzF8ZBWxC0ys=;
        b=ERTMMvDkI3S7eVN3Th4HlMBDD8ojlRTF8ycB1Af5D7RCMggO812mG6IBx6Vj1sSYgA
         1k9ST0e1ZmB1mweF12JzL0KfXRcMUqJaM1gWNAFeg7qsO0eyfmY7eSlPDJbidSwH7vep
         7EZwDiXiBl0vbM9PvK6miC9i5bG525n7Jrjq0I25a89j+23qjh5inuvwYVcyWHtfmnWA
         XVn4zm4zuV36H8YOElTPXVPxszGOXgrP9Z9xO0QYWJXgrtFlSwtHYIQTE0c0khuUwrjb
         C0zCGLH1ewEa3Fn9TGvqPQP84VQXKEjYwSkCvcdg1JTPkMDo+w2EvXTHkrrUzH7em5ge
         /CtA==
X-Gm-Message-State: AOAM532Iz+VOUIEPbTRUkOmee7u0qKeolrVyBk+isSLQS8Q+FRMsQcP3
        dK1eOCVJdH6ffIlcqPHlrGJs7xDZueifbF8u
X-Google-Smtp-Source: ABdhPJx8Dh2p4pspYrCmp9kF2k0rnDe8xbK37+8keCmNcWf9ju/RNLkbUbSL3djTUa8YOZP4WuaPwg==
X-Received: by 2002:a62:878b:0:b0:412:3e11:1eff with SMTP id i133-20020a62878b000000b004123e111effmr232244pfe.69.1630671880997;
        Fri, 03 Sep 2021 05:24:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 17sm5304847pjd.3.2021.09.03.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 05:24:40 -0700 (PDT)
Message-ID: <61321408.1c69fb81.915de.dbef@mx.google.com>
Date:   Fri, 03 Sep 2021 05:24:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210903
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 753 runs, 36 regressions (next-20210903)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 753 runs, 36 regressions (next-20210903)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | clang-12 | defconfig  =
                  | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-8    | omap2plus_d=
efconfig          | 1          =

fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =

hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 1          =

imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mn-ddr4-evk          | arm64 | lab-nxp         | gcc-8    | defconfig+i=
ma                | 2          =

imx8mp-evk               | arm64 | lab-nxp         | clang-12 | defconfig  =
                  | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+i=
ma                | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | clang-12 | multi_v7_de=
fconfig           | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fconfig           | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64            | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig+i=
ma                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210903/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210903
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      14c6345e6e6ca0570f3897214f24748ef6009761 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dcc5b91b1d9377d59674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dcc5b91b1d9377d59=
675
        failing since 190 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | clang-12 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131deee903931e741d5968d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131deee903931e741d59=
68e
        failing since 77 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d80de974aed813d596cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d80de974aed813d59=
6cd
        failing since 77 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dab50dce5a669ad5967d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dab50dce5a669ad59=
67e
        failing since 77 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dd5eadec58e308d5967c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dd5eadec58e308d59=
67d
        failing since 77 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d9d2ebc9377101d5970a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d9d2ebc9377101d59=
70b
        failing since 38 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-8    | omap2plus_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dd6a99ebeac31dd59670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dd6a99ebeac31dd59=
671
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d9a4de3f609ee7d596b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d9a4de3f609ee7d59=
6b8
        failing since 287 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131ddfa70fdb64b35d59681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131ddfa70fdb64b35d59=
682
        failing since 286 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb          | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e22b7bb2dcc2fad5967b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e22b7bb2dcc2fad59=
67c
        failing since 287 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
hifive-unleashed-a00     | riscv | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d4abdfd6d211d6d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d4abdfd6d211d6d59=
666
        failing since 126 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dec26da8bf8f26d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dec26da8bf8f26d59=
666
        failing since 64 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e43f39ccee19a2d59686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e43f39ccee19a2d59=
687
        failing since 64 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
hip07-d05                | arm64 | lab-collabora   | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131ece441101d64f6d59672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131ece441101d64f6d59=
673
        failing since 64 days (last pass: next-20210624, first fail: next-2=
0210629) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dc11261a5ab43bd59667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dc11261a5ab43bd59=
668
        failing since 312 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131df7aa36768362ad59673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131df7aa36768362ad59=
674
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mn-ddr4-evk          | arm64 | lab-nxp         | gcc-8    | defconfig+i=
ma                | 2          =


  Details:     https://kernelci.org/test/plan/id/6131d8fc58aa4a6093d5968c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6131d8fc58aa4a6=
093d59693
        failing since 3 days (last pass: next-20210827, first fail: next-20=
210830)
        12 lines

    2021-09-03T08:11:55.185147  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   13.417484] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-09-03T08:11:55.185321  0098
    2021-09-03T08:11:55.185453  kern  :alert : Mem abort info:
    2021-09-03T08:11:55.185563  kern  :alert :   ESR =3D 0x96000046
    2021-09-03T08:11:55.185693  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-03T08:11:55.185815  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6131d8fc58aa4a6=
093d59694
        failing since 3 days (last pass: next-20210827, first fail: next-20=
210830)
        2 lines

    2021-09-03T08:11:55.186539  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-09-03T08:11:55.228087  kern  :alert :<8>[   13.445562] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | clang-12 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e3396efaad9886d596d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e3396efaad9886d59=
6d2
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d90b56dacb5e66d596a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d90b56dacb5e66d59=
6a1
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/6131db5f90967dc5a3d59675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131db5f90967dc5a3d59=
676
        failing since 0 day (last pass: next-20210901, first fail: next-202=
10902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dd3d03c984c70cd5968b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dd3d03c984c70cd59=
68c
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e0fd35bb05590ed59679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e0fd35bb05590ed59=
67a
        failing since 14 days (last pass: next-20210818, first fail: next-2=
0210819) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d9f120445e8c62d59677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d9f120445e8c62d59=
678
        failing since 289 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dbbee05d391820d59689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dbbee05d391820d59=
68a
        failing since 289 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d9ffe73ec78fbad59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d9ffe73ec78fbad59=
666
        failing since 289 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131da1f3365ff1568d5966c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131da1f3365ff1568d59=
66d
        failing since 289 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e73a330497e546d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e73a330497e546d59=
666
        failing since 289 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6131dd77391b134d8dd5967e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131dd77391b134d8dd59=
67f
        new failure (last pass: next-20210902) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | clang-12 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6131ec29e3190c978fd5975f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210825103134+fed41=
342a82f-1~exp1~20210825083911.137)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131ec29e3190c978fd59=
760
        failing since 15 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6131de3245e77f3db8d5980a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131de3245e77f3db8d59=
80b
        failing since 15 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e5352ecafc084dd5966d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e5352ecafc084dd59=
66e
        failing since 15 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-8    | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131e7f93879b915d3d5968b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131e7f93879b915d3d59=
68c
        failing since 15 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3328-rock64            | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d6dcf8a8cae2a8d59683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d6dcf8a8cae2a8d59=
684
        failing since 79 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d81533524c5fa1d59671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d81533524c5fa1d59=
672
        failing since 204 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64  | arm64 | lab-clabbe      | gcc-8    | defconfig+i=
ma                | 1          =


  Details:     https://kernelci.org/test/plan/id/6131d97deb60c5a3c1d596c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210903/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6131d97deb60c5a3c1d59=
6c4
        new failure (last pass: next-20210902) =

 =20
