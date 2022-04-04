Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B996C4F1CA5
	for <lists+linux-next@lfdr.de>; Mon,  4 Apr 2022 23:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239519AbiDDV2P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Apr 2022 17:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379249AbiDDQuz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Apr 2022 12:50:55 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9E213D78
        for <linux-next@vger.kernel.org>; Mon,  4 Apr 2022 09:48:59 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w7so9482989pfu.11
        for <linux-next@vger.kernel.org>; Mon, 04 Apr 2022 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=n1CIUUILsijNyndDhoRSx88ZS3jNJI6RJM8ok7bcGCg=;
        b=NFo9fL0v5Sr1/QNvbTjZ4UtVfEkAH4xu5n9wyy5czKhz+/MkNelTlVsDkcvPxD5Zow
         UxJ8quEc915KsMOpogJMBqNz87y/3geGUGOtLDenRXzU/vZGYFsQdsmUwKf/z3IJaho8
         semilKvu3EloQt5joUdmSsqpQw1T6wWp6WzHhPCML60znst5kR7IABgQQdanGn4/v5P0
         YkyXVci1T6JhGNzXpkVAw9RdxJm8N9FGdSNfDlRY6Q+9dqZ1QC5IfKWmEG83vLhvEK0B
         l3lJxOUl8I9bQD3/6EIGkGLgEzplyBW3/w3FMiJZV9+A3iZAJxUqaS/iyxmLwD9yKOeT
         Bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=n1CIUUILsijNyndDhoRSx88ZS3jNJI6RJM8ok7bcGCg=;
        b=ttIFWmfzgqAi8mhKgqPS3lavqrppceodbYywtm3IzMiwtUcabyMeocp2k/dTrJ5y13
         6jaYoP+ZrhEFA1JoTr/UadxH+2Am2CDmJ9j8u/FyIJjDHcDr75DIfr8EkG8Bu9GjK/xf
         eaOjiHN5WbQ9zlPouDOsMisrO+iQBY9vhfk3H1T/znqLHXXMvRfUeEBYY9q3eT2YlSX8
         E9SCj6iS8gsp819CZvfsdR42BriSdiRd5Zz9EYVE3PJNIgj4UvvGxlUqyhJBVN/J2SDC
         el+G1NE/1JAKs2hpBl2KQw/fAyYOMbnVjNFI8obqGUZC+iHB5s6IAry2oG3ZQE6T496r
         3RTQ==
X-Gm-Message-State: AOAM531xAPqJJ9fCHNVN5asvgB2CZb4Tg7f72lnZFKK0z/5wn2Pa9ruu
        j88PF+viqPHE1S2XucayhYtKMSfIwPN+EYjhyK4=
X-Google-Smtp-Source: ABdhPJznPgZb4kjt2LCN3XrYjtiJWBfN4swC+927PR4IBJqf+HYTWSCWwssG2sd1J9bC2ZRdsK1gow==
X-Received: by 2002:a65:6cc3:0:b0:382:9d3c:ff82 with SMTP id g3-20020a656cc3000000b003829d3cff82mr696331pgw.110.1649090938757;
        Mon, 04 Apr 2022 09:48:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w19-20020a056a0014d300b004fae5e3970csm13446665pfu.35.2022.04.04.09.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 09:48:58 -0700 (PDT)
Message-ID: <624b217a.1c69fb81.60cf2.1b7f@mx.google.com>
Date:   Mon, 04 Apr 2022 09:48:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc1-107-g56ad09fc9d717
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 210 runs,
 4 regressions (v5.18-rc1-107-g56ad09fc9d717)
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

next/pending-fixes baseline: 210 runs, 4 regressions (v5.18-rc1-107-g56ad09=
fc9d717)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
          | 1          =

odroid-xu3         | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc1-107-g56ad09fc9d717/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc1-107-g56ad09fc9d717
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      56ad09fc9d717a4cff78fa14ae6e98b9571021b1 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =


  Details:     https://kernelci.org/test/plan/id/624ae61e2fe53e5c11ae06be

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da=
850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/624ae61e2fe53e5=
c11ae06c6
        failing since 70 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-04T12:35:25.040908  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-04T12:35:25.041132  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-04T12:35:25.041302  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-04T12:35:25.085153  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig          =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/624ae665e005b046aaae0693

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-=
imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-=
imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/624=
ae665e005b046aaae06a6
        new failure (last pass: v5.17-13747-gaeb9fed350ee)

    2022-04-04T12:36:43.773990  /lava-105430/1/../bin/lava-test-case
    2022-04-04T12:36:43.774327  <8>[   14.687937] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-04T12:36:43.774525  /lava-105430/1/../bin/lava-test-case
    2022-04-04T12:36:43.774711  <8>[   14.707595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-04T12:36:43.774898  /lava-105430/1/../bin/lava-test-case
    2022-04-04T12:36:43.775076  <8>[   14.728642] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-04-04T12:36:43.775255  /lava-105430/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
odroid-xu3         | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/624aead76140039255ae06d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/la=
b-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624aead76140039255ae0=
6d9
        failing since 25 days (last pass: v5.17-rc6-312-gf15bf60c638f, firs=
t fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/624aeae74d360279ceae067d

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
07-g56ad09fc9d717/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/bas=
eline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624aeae74d360279ceae069f
        failing since 35 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-04T12:55:40.174814  /lava-6016352/1/../bin/lava-test-case   =

 =20
