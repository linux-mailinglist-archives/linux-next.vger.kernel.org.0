Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06A1597CA6
	for <lists+linux-next@lfdr.de>; Thu, 18 Aug 2022 06:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242738AbiHREDd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Aug 2022 00:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243165AbiHREC7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Aug 2022 00:02:59 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5FEABD45
        for <linux-next@vger.kernel.org>; Wed, 17 Aug 2022 21:02:34 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 202so341667pgc.8
        for <linux-next@vger.kernel.org>; Wed, 17 Aug 2022 21:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=QTq7c5aJpylNILLv0aJQw2Bll0zKgR84+rrZlsLxe1I=;
        b=VY3ja4kMy15qdcFeBFsGMFLwFb1c9qhZvkEHLPL0vX+5DhP9B3sFcJQyZizqPmgKnT
         3Jal3uuwCHJOHNgfmE73E5a1vgbFQ3cT0WiKLV01NPWR96E0hogqwwsYhvx5Bkr1LN23
         MkQl3Go8iMsIwLiTOQxTx2Be5BpHrBZPqF2EWdOnqyohpDIuAMwie5wNRhDuT7tchkji
         W+LGk72GQkG0NFGzek9Y24QA+VnNkoPtNMmfqq3S/jkl+2wLesYLshb2hNu03HVwf7sP
         PQpDkpLaiuAjOLCE/GjHRzGXXNcy6/+w6p93JmOrwrQf4P4y8E2RRB57uJGbPioRHj+r
         NoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=QTq7c5aJpylNILLv0aJQw2Bll0zKgR84+rrZlsLxe1I=;
        b=X6x+RzXwHdeiGlr0YGNrb2GUMIxU+Myw24OoV+d24vG8SieHpXWp/vrlsYkbXLLWWB
         O4sqwHMLkhqxHmin6E5sbl6mBVhSiNXEltxPtMpv8OxMYEOPb9T45jc2FKDnHmADjcVB
         2b1jRTPc9Q11+xSfeA4e8KZlHJ/Lq1qjc3xFM971g9GAukcDzw1fVeVtmlEddszIB1AL
         +T4umlehiGs74yjGZvzNdN1mIS6tZ1zrwAZHoEkuUhMrNLX29GfR7ryGtPQoOdEGZoSz
         rhEsxiejD8IGOoz/ODTrfxVMaJk9pT+90fbkWB3v7/9S6EEwPbET3Ww94rQ0lbZUWiru
         mQcg==
X-Gm-Message-State: ACgBeo0M7btHyVnbMfoXmFSWQOJiMjK4Xk04zNF/0AEqK2n7wc1dI+zf
        aWA5YqKqsD05bhfAS8YHlaI5MZhDgBOFB4Cg
X-Google-Smtp-Source: AA6agR7t5mHoTcKwLveVFPSPsvJykeRKdkrW7iv54PNmMC2N/YxfhI1EQovgCXw+NYoS2Yn6QrQVjg==
X-Received: by 2002:a63:5b65:0:b0:429:7548:a7bc with SMTP id l37-20020a635b65000000b004297548a7bcmr1079957pgm.617.1660795353337;
        Wed, 17 Aug 2022 21:02:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b20-20020a62a114000000b0052d92ddca7bsm355293pff.91.2022.08.17.21.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 21:02:33 -0700 (PDT)
Message-ID: <62fdb9d9.620a0220.7237f.0d86@mx.google.com>
Date:   Wed, 17 Aug 2022 21:02:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-285-gbb8b9a4857726
Subject: next/pending-fixes baseline: 372 runs,
 32 regressions (v6.0-rc1-285-gbb8b9a4857726)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 372 runs, 32 regressions (v6.0-rc1-285-gbb8b9a=
4857726)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig           | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig           | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

da850-lcdk            | arm   | lab-baylibre    | gcc-10   | davinci_all_de=
fconfig        | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig           | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

imx7d-sdb             | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =

jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 2          =

kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+cryp=
to             | 3          =

meson-gxbb-p200       | arm64 | lab-baylibre    | gcc-10   | defconfig+cryp=
to             | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig           | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =

panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =

qcom-qdf2400          | arm64 | lab-linaro-lkft | gcc-10   | defconfig+cryp=
to             | 1          =

qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a15 | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =

qemu_arm-vexpress-a9  | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc1-285-gbb8b9a4857726/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc1-285-gbb8b9a4857726
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bb8b9a4857726b532eaaa9d31c8acfb451227fbf =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fda1ce29f5753198355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fda1ce29f5753198355=
643
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-12861-g50a89f5a92e3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fda2260a4f027b0c355688

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fda2260a4f027b0c355=
689
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
am57xx-beagle-x15     | arm   | lab-linaro-lkft | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fda23190920e6599355651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/basel=
ine-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/basel=
ine-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fda23190920e6599355=
652
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd8d9cf8a43b1ae6355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd8d9cf8a43b1ae6355=
643
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd935087c7a558e7355649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd935087c7a558e7355=
64a
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd9620b829388711355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd9620b829388711355=
654
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
beaglebone-black      | arm   | lab-cip         | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd9bc0fde71b0582355663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd9bc0fde71b0582355=
664
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
da850-lcdk            | arm   | lab-baylibre    | gcc-10   | davinci_all_de=
fconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7fc8c23bafb512355690

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62fd7fc8c23bafb=
512355694
        failing since 206 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-08-17T23:54:36.511174  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-08-17T23:54:36.512237  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-08-17T23:54:36.514625  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-08-17T23:54:36.554843  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd858e1c5ed07b0935564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd858e1c5ed07b09355=
64c
        failing since 29 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd815715ef4c58ae35564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd815715ef4c58ae355=
64e
        failing since 53 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd8502a2c8c3f6f9355690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd8502a2c8c3f6f9355=
691
        failing since 78 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd87965f355d2b8435565f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd87965f355d2b84355=
660
        failing since 79 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6ul-pico-hobbit    | arm   | lab-pengutronix | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd8f665b186a20df355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/basel=
ine-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd8f665b186a20df355=
643
        failing since 79 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx7d-sdb             | arm   | lab-nxp         | gcc-10   | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd8509a2c8c3f6f9355698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd8509a2c8c3f6f9355=
699
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
jetson-tk1            | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd832e71873babe235564b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd832e71873babe2355=
64c
        failing since 110 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+ima =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/62fd817bc1d1929cb9355702

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fd817bc1d1929cb9355714
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-18T00:01:43.127126  /lava-156395/1/../bin/lava-test-case
    2022-08-18T00:01:43.127514  <8>[   19.340159] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-18T00:01:43.127758  /lava-156395/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
d817bc1d1929cb9355716
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-18T00:01:44.165244  /lava-156395/1/../bin/lava-test-case
    2022-08-18T00:01:44.165651  <8>[   20.384786] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-18T00:01:44.165907  /lava-156395/1/../bin/lava-test-case
    2022-08-18T00:01:44.166134  <8>[   20.404917] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-pitx-imx8m    | arm64 | lab-kontron     | gcc-10   | defconfig+cryp=
to             | 3          =


  Details:     https://kernelci.org/test/plan/id/62fd86b87ce18c9989355686

  Results:     49 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fd86b87ce18c9989355698
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-18T00:24:10.374890  /lava-156406/1/../bin/lava-test-case
    2022-08-18T00:24:10.375285  <8>[   19.347134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-18T00:24:10.375535  /lava-156406/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
d86b87ce18c998935569a
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-18T00:24:11.395434  /lava-156406/1/../bin/lava-test-case
    2022-08-18T00:24:11.395736  <8>[   20.391209] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-18T00:24:11.395891  /lava-156406/1/../bin/lava-test-case
    2022-08-18T00:24:11.396035  <8>[   20.411068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-18T00:24:11.396180  /lava-156406/1/../bin/lava-test-case   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62f=
d86b87ce18c998935569d
        new failure (last pass: v6.0-rc1-204-g5ca89432fef1f)

    2022-08-18T00:24:12.426127  /lava-156406/1/../bin/lava-test-case
    2022-08-18T00:24:12.426531  <8>[   21.454624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxbb-p200       | arm64 | lab-baylibre    | gcc-10   | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd88d3bc069458ca355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd88d3bc069458ca355=
643
        new failure (last pass: v6.0-rc1-204-g5ca89432fef1f) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd94dba47bf4c6cb35564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd94dba47bf4c6cb355=
64d
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd96cf4ca2afd475355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd96cf4ca2afd475355=
643
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defc.=
..MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd98d73c7bf13bb3355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd98d73c7bf13bb3355=
646
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
panda                 | arm   | lab-baylibre    | gcc-10   | multi_v7_defco=
nfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd9dd84c3b0217ea355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd9dd84c3b0217ea355=
663
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qcom-qdf2400          | arm64 | lab-linaro-lkft | gcc-10   | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd87a476bb67916a35568d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm64/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd87a476bb67916a355=
68e
        new failure (last pass: v6.0-rc1-204-g5ca89432fef1f) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7fd8005774178f355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7fd8005774178f355=
645
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7ff1a46710fa13355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7ff1a46710fa13355=
663
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a15 | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7fdb4b409f4f66355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7fdb4b409f4f66355=
643
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-baylibre    | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7fdabb2ac946b6355694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7fdabb2ac946b6355=
695
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-broonie     | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7ff21fb409550a3556a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7ff21fb409550a355=
6a6
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-vexpress-a9  | arm   | lab-collabora   | gcc-10   | vexpress_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fd7fdc04716ef8cd35566b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-28=
5-gbb8b9a4857726/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_=
arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fd7fdc04716ef8cd355=
66c
        failing since 12 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =20
