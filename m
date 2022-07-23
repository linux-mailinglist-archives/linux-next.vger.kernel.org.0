Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5C857EB2B
	for <lists+linux-next@lfdr.de>; Sat, 23 Jul 2022 04:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiGWCCW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jul 2022 22:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiGWCCV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2022 22:02:21 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7649687358
        for <linux-next@vger.kernel.org>; Fri, 22 Jul 2022 19:02:20 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id q5so5906921plr.11
        for <linux-next@vger.kernel.org>; Fri, 22 Jul 2022 19:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sGJ4ZSDIFXtg8sm6+VKkyQEa92ECnsSoNFHEEjpKnaE=;
        b=MmhWRwx+/BhrBaPyxUDolxRSHxaCbtIFoi3bCk6wqlJMbhDxdSoxs6F0YPtg7Bl4YH
         /coyukxABCnaZyEI3EvqAioHCVNNHfwBN+qxNRRzT8XUN+f5uvQWcIVP8tlpTASqXao/
         uVjB8ZILu+aHBz9Tce4mXQcB05CC+MoFoOKauCl9C0024WJydAXQrjeylGHQnDhCQjLK
         rn9QgmJTLZDxpORL3fXBuswP8M2JljCj3NrSxf96oLxKYy6puIQZcAv5fjS3SeCMXYXU
         VG6vVaq1BaKSTUCGK6ppH7RV3oB6MGRLDV0eWfO6cCLI88oQnLNSxIye2ZUINkckhNHI
         kMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sGJ4ZSDIFXtg8sm6+VKkyQEa92ECnsSoNFHEEjpKnaE=;
        b=4OscUSfairUx13erqzFtAzeaFd/VIzgBEhl/l0OsW+RR3Hb3KdrDMNLcPmupVFWRFs
         iziCKFz8vFXgdBdg64zcz8aieXEGJtAF3GKCUYyMMopDaGXhYF2tfq6PwljRzrzmmqi+
         uBysJ0CjJCoR/3GdbkUHsta1gVkD5FnXCOFFGs40+NcHUHemX1Jo85iBFxql9Xk2mSYD
         FHA2y9OJ1ATrgZsmGyazhXJXr2gdpZUJsSL3Wa/dn18Z3dUgIEyv99XbOaun8+6sN2Kc
         ZlLz/pS37Qjpll1UkH/63HxxsWthWbXfdxi0aGQIuT+DEdsjkBDi+I0+XNbzY7Z8ss/M
         nY5A==
X-Gm-Message-State: AJIora8hKPC3BSYUHBhgTN45IFIrfLTMbO3YCWQlDQQcm1xZIfp6mRBH
        QAi8hRh1AA+AUeGDUAORTQU8lMZpjIwRipd0
X-Google-Smtp-Source: AGRyM1shBPhvg3aPY64bRcZAHdBIPAmMW25XnQ2PQT2Y7xn0bdOIIChH0flh81t78EH+ZfMuZGOdyw==
X-Received: by 2002:a17:902:dac1:b0:16c:6988:d226 with SMTP id q1-20020a170902dac100b0016c6988d226mr2517032plx.39.1658541739700;
        Fri, 22 Jul 2022 19:02:19 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h29-20020aa796dd000000b0052a198c2046sm4723008pfq.203.2022.07.22.19.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 19:02:19 -0700 (PDT)
Message-ID: <62db56ab.1c69fb81.1dafb.8003@mx.google.com>
Date:   Fri, 22 Jul 2022 19:02:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-rc7-273-gae7d06669281
Subject: next/pending-fixes baseline: 291 runs,
 10 regressions (v5.19-rc7-273-gae7d06669281)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 291 runs, 10 regressions (v5.19-rc7-273-gae7d0=
6669281)

Regressions Summary
-------------------

platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =

imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk    | arm64 | lab-nxp         | gcc-10   | defconfig+ima    =
            | 1          =

jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =

meson-gxbb-p200    | arm64 | lab-baylibre    | gcc-10   | defconfig+debug  =
            | 1          =

rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-rc7-273-gae7d06669281/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-rc7-273-gae7d06669281
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ae7d0666928179c7ae95db6d44d150ef95f04ae8 =



Test Regressions
---------------- =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...C=
ONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62db348ab34abe002adaf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutron=
ix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db348ab34abe002adaf=
058
        failing since 52 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defconfi=
g           | 1          =


  Details:     https://kernelci.org/test/plan/id/62db37e6573a55bd44daf077

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db37e6573a55bd44daf=
078
        failing since 27 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx6ul-pico-hobbit | arm   | lab-pengutronix | gcc-10   | multi_v7_defc...M=
B2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db387272ff599538daf087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db387272ff599538daf=
088
        failing since 52 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
imx8mn-ddr4-evk    | arm64 | lab-nxp         | gcc-10   | defconfig+ima    =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62db245b750b97efdbdaf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db245b750b97efdbdaf=
068
        new failure (last pass: v5.19-rc7-260-gaab2277715b66) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
jetson-tk1         | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G=
_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62db220b964cc9ad09daf073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db220b964cc9ad09daf=
074
        failing since 84 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
meson-gxbb-p200    | arm64 | lab-baylibre    | gcc-10   | defconfig+debug  =
            | 1          =


  Details:     https://kernelci.org/test/plan/id/62db272ccb1482381ddaf068

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62db272ccb1482381ddaf=
069
        new failure (last pass: v5.19-rc7-214-g7bc501036b62c) =

 =



platform           | arch  | lab             | compiler | defconfig        =
            | regressions
-------------------+-------+-----------------+----------+------------------=
------------+------------
rk3399-gru-kevin   | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-c=
hromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62db1faaebafc9a135daf083

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-rc7-2=
73-gae7d06669281/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62db1faaebafc9a135daf0a5
        failing since 144 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-07-22T22:07:25.598858  /lava-6872515/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62db1faaebafc9a135daf0c8
        failing since 52 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-22T22:07:22.392870  <8>[   33.397729] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-07-22T22:07:23.422400  /lava-6872515/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62db1faaebafc9a135daf0c9
        failing since 52 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-22T22:07:22.379927  /lava-6872515/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62db1faaebafc9a135daf0ca
        failing since 52 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-07-22T22:07:20.298725  <8>[   31.303365] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-07-22T22:07:21.335147  /lava-6872515/1/../bin/lava-test-case
    2022-07-22T22:07:21.347067  <8>[   32.353183] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
