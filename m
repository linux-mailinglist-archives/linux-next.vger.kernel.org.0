Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEDF84C5395
	for <lists+linux-next@lfdr.de>; Sat, 26 Feb 2022 04:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiBZDmd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Feb 2022 22:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiBZDmc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2022 22:42:32 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECF1190C1A
        for <linux-next@vger.kernel.org>; Fri, 25 Feb 2022 19:41:57 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 132so6344971pga.5
        for <linux-next@vger.kernel.org>; Fri, 25 Feb 2022 19:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AJBcFMTpXAg39C9PAk29K+R/JvEwO0q74b3zYDQI1nk=;
        b=AanJDkgxjK9f6dWNCPKAk0+OlkM4EJGCSn2IU/lVtJwLvD4kLesA9DiVwPz0Ww8O8t
         +S3TElLt6IAioVXZHGGWOwIlhqdh/0BVGlWj7A1IBMlUmXtg0i2vIrTpcSeseRJHnIt2
         FFRLvGpKtXGmRm2SQLl6pZ5BfO2GzmBISd4aIfd/ee988cf5xtuQkytmUys06dKTZnxh
         uEzA+4y+DRD0omI5ur3r82GWbeLqubDUt2a5lw+7JIQL7qnzwVAt56cVmSNPBkaW8Hvc
         350L/n2YBHOf84L5lrYM15ZD2t/Fhh+p0hzrYesr9VEgy9Cdazx/khhemaDqnNEtXkrf
         vtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AJBcFMTpXAg39C9PAk29K+R/JvEwO0q74b3zYDQI1nk=;
        b=MjjRlliqeRX1eGDdWk0rH1J2gsjwgkZRwwi+19+awousgX5/eJfU+CxD9RKLOoIcim
         mhfOdJMNWDSGsyY6XDPoZy7ucM6kjKgvywNRDQZDwnO/1+B1wA68o/TMRMWADO6+rTR9
         qvgzqDEgLkw+hp43uR8Y8BVmeLmFePNSACcINP3jG2Nm2omjlbJY6GWx5wIm2xalfcjw
         PN8xn+h5Jg86NThZZvILzy0sNOT+R+krvCmunLA2aK3XTHjytk9Oyk9blZI3l5O0/V/X
         NX1wPRCGO9IotkhgqDvy7AsXQOkYwj4zBGaLR4bGF5bbp2V8Im+HL0PPoNe9yTcFTP2V
         dwBA==
X-Gm-Message-State: AOAM532eLHnliWFj+5cwnQz4tytHZmGCQUHrrB2g+gKv3hfxXr/9SJO5
        XJGf/Qj/QDclsVV8hrL5PDKIwU4NmtWI37TTPE4=
X-Google-Smtp-Source: ABdhPJyEHnoAIwm8LndDoVQYy68IdOaK31Ds5kC5zL/+2ZGC8cKnn5z7c5RHTucFG06M+PZtAGrf1w==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id m19-20020a656a13000000b0037314f65d33mr8762421pgu.62.1645846916314;
        Fri, 25 Feb 2022 19:41:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 2-20020a631342000000b0037487b6b018sm3890142pgt.0.2022.02.25.19.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 19:41:55 -0800 (PST)
Message-ID: <6219a183.1c69fb81.9c737.ae4d@mx.google.com>
Date:   Fri, 25 Feb 2022 19:41:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc5-388-geb90b11d71c0
Subject: next/pending-fixes baseline: 325 runs,
 4 regressions (v5.17-rc5-388-geb90b11d71c0)
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

next/pending-fixes baseline: 325 runs, 4 regressions (v5.17-rc5-388-geb90b1=
1d71c0)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
bcm2711-rpi-4-b    | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =

bcm2836-rpi-2-b    | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =

da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =

kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+crypto   =
          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc5-388-geb90b11d71c0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc5-388-geb90b11d71c0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      eb90b11d71c05bbf65814c4a79f7b7e9d6e95025 =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
bcm2711-rpi-4-b    | arm64 | lab-collabora | gcc-10   | defconfig+CON...OMI=
ZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62196a28df5eb5d644c62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-colla=
bora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62196a28df5eb5d644c62=
999
        new failure (last pass: v5.17-rc5-244-gd77a1b37f796) =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
bcm2836-rpi-2-b    | arm   | lab-collabora | gcc-10   | multi_v7_defc...MB2=
_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62197027acda209be0c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62197027acda209be0c62=
977
        failing since 8 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, first=
 fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
da850-lcdk         | arm   | lab-baylibre  | gcc-10   | davinci_all_defconf=
ig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6219653875d046ed2bc62972

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6219653875d046e=
d2bc62976
        failing since 33 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-02-25T23:24:18.965093  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-02-25T23:24:18.965326  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-02-25T23:24:18.965464  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-02-25T23:24:19.009544  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform           | arch  | lab           | compiler | defconfig          =
          | regressions
-------------------+-------+---------------+----------+--------------------=
----------+------------
kontron-pitx-imx8m | arm64 | lab-kontron   | gcc-10   | defconfig+crypto   =
          | 1          =


  Details:     https://kernelci.org/test/plan/id/62196925f6d465eed0c629ae

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc5-3=
88-geb90b11d71c0/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220218.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/621=
96925f6d465eed0c629c5
        new failure (last pass: v5.17-rc5-317-g24650335a6e9)

    2022-02-25T23:41:11.830606  /lava-93277/1/../bin/lava-test-case
    2022-02-25T23:41:11.830975  <8>[   11.346381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =20
