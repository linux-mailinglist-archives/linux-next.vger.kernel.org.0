Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203934D5816
	for <lists+linux-next@lfdr.de>; Fri, 11 Mar 2022 03:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbiCKCYb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 21:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbiCKCYa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 21:24:30 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5EE31052AD
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 18:23:26 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t2so4035084pfj.10
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 18:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=srp6xgSniN1zlfAHPL8bmPD/SMQjM9fiEvTKwaQRH68=;
        b=ZIPz5+FSxSK2hAaHC+Yxi9UnLEtlx98kWtsgDwvJOgch+RKJ4DTRdQu4v/YZXAXkET
         +3HzdggCeBBBITVq+tX8Sx2AfBxZWclruyaL/o3wuuhOdhtBY7161uxZTkY9wEZxJLeL
         kTFXkoiQnCZODkHrmujwzKK/Y7OHElCXsNHJUwYlEZMgrhuMlz60LZBkSvAVK2gtRPPW
         bGV+nfIxrziabWEbIo18g0YH7Am9Onl4P+lU/XB6L766uBrt7VJjiBL8DjqZBG4DbmtY
         j17EDd4oBA1GgKmJZaFKmIOIO/Fv8byhAQhrHnrf6SfQxvk6awRld8G/dCkBnfB2kOOm
         xivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=srp6xgSniN1zlfAHPL8bmPD/SMQjM9fiEvTKwaQRH68=;
        b=g6SnS3dbjaCBkbqdHIatjZT/5GTLB7RzjthDx5F3JWZ9A8TBqcYDLKnf8RiVbal4rV
         HbVtl1KNzTZhlkIZZiJpMu7kOswJxvhmwzo/OfWEDOc7kQp+GqBfAseccJvudlp/OUvH
         sQuiY3BiYaxFdlMaJDYsjx6AQA4OUd5+lKBik2tD1qhk/lWIfAclL6IRz1k//YJ6o1RD
         ubdYBrJMwSwz/7DYBdIrPMocAUyXeRhQOyS3nwYG+hXcSD+hWzWYB7fDY5Pb0pXejOHw
         HO9BUtmqGGOtfQNwG+EDfDa+B21tLi/LgY3PmIH+FA9gJMduL0/3lriz+pUBCi+d47aE
         jWmw==
X-Gm-Message-State: AOAM530sMmR0+1R1QJEkl6y3Rwa9mOywqv4nv+L7HyMlrOM51L6CTDIz
        PYS/zN/o3uPYi0ER1sAP7kuP/tw8lVJuLDlBgGY=
X-Google-Smtp-Source: ABdhPJw063CM1EneDUJP9M8UptcTUg0J+Qz4BDUBw2POAFpyyJ/JOlnBCnxpLHM4udmVrDikIz327Q==
X-Received: by 2002:a63:89c6:0:b0:37c:9168:ab0c with SMTP id v189-20020a6389c6000000b0037c9168ab0cmr6449378pgd.353.1646965405538;
        Thu, 10 Mar 2022 18:23:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u25-20020a62ed19000000b004f140515d56sm8100769pfh.46.2022.03.10.18.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 18:23:25 -0800 (PST)
Message-ID: <622ab29d.1c69fb81.bb28c.6c58@mx.google.com>
Date:   Thu, 10 Mar 2022 18:23:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc7-220-g483b57a0f972
Subject: next/pending-fixes baseline: 284 runs,
 28 regressions (v5.17-rc7-220-g483b57a0f972)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 284 runs, 28 regressions (v5.17-rc7-220-g483b5=
7a0f972)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc7-220-g483b57a0f972/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc7-220-g483b57a0f972
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      483b57a0f972a29d6f83e07c8f66e65ae6e8988c =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c70435f4e1bf9c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c70435f4e1bf9c62=
969
        failing since 21 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7d6a2c055e9d2cc629b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7d6a2c055e9d2cc62=
9b7
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7d532c055e9d2cc6298e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7d532c055e9d2cc62=
98f
        failing since 1 day (last pass: v5.17-rc4-202-g519817c8f9d2, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/622a77b2ba2c7be902c629c0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/622a77b2ba2c7be=
902c629c4
        failing since 46 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-10T22:11:40.367645  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-10T22:11:40.367930  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-10T22:11:40.368104  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-10T22:11:40.410503  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c294640e7d544c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c294640e7d544c62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7bfb3b7be6bd45c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7bfb3b7be6bd45c62=
972
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c4a058f43c46cc62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c4a058f43c46cc62=
983
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7e2f3ce15b0f91c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7e2f3ce15b0f91c62=
973
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a89b839328b3eacc62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a89b839328b3eacc62=
977
        new failure (last pass: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c10ad781ca9e1c629a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c10ad781ca9e1c62=
9a1
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7e483ce15b0f91c62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7e483ce15b0f91c62=
979
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7ed9a3b0390299c62999

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7ed9a3b0390299c62=
99a
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7dc7d76bac45bec62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7dc7d76bac45bec62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7dee5109da18d6c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7dee5109da18d6c62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7dc536a73c1e86c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7dc536a73c1e86c62=
96d
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7db1514c6832b7c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7db1514c6832b7c62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a88c1431e47b69cc6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a88c1431e47b69cc62=
97c
        failing since 0 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a842442be013363c62970

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a842442be013363c62=
971
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7aec2224f919cec62985

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/622a7aed2224f919cec629ab
        failing since 10 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-10T22:25:24.240304  /lava-5854081/1/../bin/lava-test-case
    2022-03-10T22:25:24.251110  <8>[   33.877188] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c2b17f8f980bfc629a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c2b17f8f980bfc62=
9a9
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c7b435f4e1bf9c62971

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c7b435f4e1bf9c62=
972
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c16ad781ca9e1c629a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c16ad781ca9e1c62=
9a7
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7cfd0ad4b66938c629a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7cfd0ad4b66938c62=
9a5
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c8c435f4e1bf9c62a2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c8c435f4e1bf9c62=
a30
        failing since 1 day (last pass: v5.17-rc4-173-gecf2acb68532, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c0f17f8f980bfc62990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c0f17f8f980bfc62=
991
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a7c1117f8f980bfc62996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a7c1117f8f980bfc62=
997
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a8077c7495a858fc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a8077c7495a858fc62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622a82578c71555268c62972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
20-g483b57a0f972/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622a82578c71555268c62=
973
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =20
