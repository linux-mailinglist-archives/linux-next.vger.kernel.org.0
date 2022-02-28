Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90D4C62BA
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 07:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiB1GCs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 01:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiB1GCr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 01:02:47 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966E152B05
        for <linux-next@vger.kernel.org>; Sun, 27 Feb 2022 22:02:07 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id u16so10111313pfg.12
        for <linux-next@vger.kernel.org>; Sun, 27 Feb 2022 22:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HguoPjZfpkrKR1mSDdmKVfQ89kCy1Su7fQ/+3dncM00=;
        b=zfs47ClozxQ0r0NSdkFIaMrlINXNBhhhbnejVqnMQ90xXo2avjvYqW8svsHAPPORAI
         QVP1LjjpFFxDu51odgqOJoNol3lZwuOiqAt7rVZg2o/5AbB/oceA18FOo8Pe0v2uN78I
         wiGdWA1d18H2+XFtYZqsJIEI+YCB59EObOCsEoQIVUL3t3VPSckSVo3cT4GU6UK5RGFO
         7/a2sW33ng9johERAQVO3yo9TC5tk/SZYzWlM1A+suaX9HIeWJEAwQfZRafTiTbUdCo/
         q7YOj14lQB5mCkSZ+v1JsaPI8jJDxXPw5wTuLGhn+z3iH2Etg1bEKelqF5AuiKbCYh1E
         mHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HguoPjZfpkrKR1mSDdmKVfQ89kCy1Su7fQ/+3dncM00=;
        b=g22ygRNvMmdWEIKdh/aPsSwh8H/aH4zJ1I35gfQQTJ2bGewfHUePSnbCwBHPGP23ad
         NWsIsLuNL89fAMvMEVcwq1gwQcAnJRMtuYN+bqOuE/tdHLUNPfCBtDX1D7WbMLfX8QCB
         0ljuSSoJkUEypusMtDlCvJzIKLrAlhG4tKwW+ACSTCouS3TjSWUBksEP5lMi4NNj6ngS
         TaFVLtEgr5UsUv+OKgqlrcxizyspB5Y7UkQzKWmS6heFLAqwhw97sGoSGsKnE57s7wDP
         rQPHitV004jYWH+MkyZQWLow1ZFOo2kcPZ2rWD6Y3ZgFPQfWesvCkE/RVq7ak4IqS4qY
         Mf3g==
X-Gm-Message-State: AOAM530514BVeyDVfm2SMkPzjTrLTCVy4gJkLm2LDHGCMkMw9DSIaBLt
        8arjOCQzZZSVLfSo0EHYfuy0QaXZTUtZ7/s4r/A=
X-Google-Smtp-Source: ABdhPJxiC5vXLgW789zQJejNJJNMNMFd88txNUCUojp9pcv/DX7dDwYBIKa7MdKjXekzw4PETf4hsw==
X-Received: by 2002:a62:1c47:0:b0:4f1:2735:3219 with SMTP id c68-20020a621c47000000b004f127353219mr19796696pfc.70.1646028125249;
        Sun, 27 Feb 2022 22:02:05 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090aa58100b001bcb7bad374sm12716341pjq.17.2022.02.27.22.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 22:02:04 -0800 (PST)
Message-ID: <621c655c.1c69fb81.f0de7.0bef@mx.google.com>
Date:   Sun, 27 Feb 2022 22:02:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc6-176-gb4e03e0dde48
Subject: next/pending-fixes baseline: 335 runs,
 3 regressions (v5.17-rc6-176-gb4e03e0dde48)
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

next/pending-fixes baseline: 335 runs, 3 regressions (v5.17-rc6-176-gb4e03e=
0dde48)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc6-176-gb4e03e0dde48/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc6-176-gb4e03e0dde48
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b4e03e0dde487ad6967de1588724011ba3ca9976 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =


  Details:     https://kernelci.org/test/plan/id/621c2a2b921396d74ac62975

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/621c2a2b921396d=
74ac62979
        failing since 35 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-28T01:49:13.356469  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-28T01:49:13.356759  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-28T01:49:13.356937  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-28T01:49:13.401373  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/621c324184a2da104bc62973

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/621=
c324184a2da104bc6298a
        new failure (last pass: v5.17-rc5-388-geb90b11d71c0)

    2022-02-28T02:23:50.098545  /lava-93997/1/../bin/lava-test-case
    2022-02-28T02:23:50.098842  <8>[   11.322874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-02-28T02:23:50.098993  /lava-93997/1/../bin/lava-test-case
    2022-02-28T02:23:50.099133  <8>[   11.342718] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-02-28T02:23:50.099274  /lava-93997/1/../bin/lava-test-case
    2022-02-28T02:23:50.099410  <8>[   11.363833] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-02-28T02:23:50.099545  /lava-93997/1/../bin/lava-test-case   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
rk3399-gru-kevin   | arm64 | lab-collabora | gcc-10   | defconfig+arm64-chr=
omebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/621c2db595426fbab1c62968

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc6-1=
76-gb4e03e0dde48/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/621c2db595426fbab1c6298c
        new failure (last pass: v5.17-rc5-244-gd77a1b37f796)

    2022-02-28T02:04:08.740337  /lava-5786148/1/../bin/lava-test-case   =

 =20
