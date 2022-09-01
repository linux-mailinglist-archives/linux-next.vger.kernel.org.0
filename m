Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC835A9662
	for <lists+linux-next@lfdr.de>; Thu,  1 Sep 2022 14:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiIAMIs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Sep 2022 08:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbiIAMId (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Sep 2022 08:08:33 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84C4EA30B
        for <linux-next@vger.kernel.org>; Thu,  1 Sep 2022 05:08:31 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id q15so11906708pfn.11
        for <linux-next@vger.kernel.org>; Thu, 01 Sep 2022 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=j2D0c/3A5/N8OoTPlE7PW9E6+oqTJQx9Z/MfZp+Naok=;
        b=AFtBSUrGPsSO0NFHdONDKjGST4WokfK/P5Yj0n2sr/WPFJDphqGPEv+f+VaT4Zvxda
         wMW1MhOL4J3K18ZAqs/MrcDH52vjrZmHBbZIo/kT3xryIrpN5db3fIRQkOQZTpJHyPFa
         oRMo9/hfjorvNtbxhR50XoFND49blzF59iXm2xfnPMn/Iek3iTo6XAujEyFSKPb+9aPK
         2wb+Ud10w7xMF0g9dpR8M3GwllXtBxqrCWGk7+niwvSPAiyspkwh11zgR/LnZ+ee779K
         YDhgeZhS2pw9rWXdQkC3Jk5gbGuazA4Ug+83PpatzhpAn+8mUsDjMxuIE/uNsjaM01Or
         tuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=j2D0c/3A5/N8OoTPlE7PW9E6+oqTJQx9Z/MfZp+Naok=;
        b=edC51Jpv3h0oyvD7tnG2Bx8Ay2sWd204ji8UGzidV7Lc7sNwOl9Ak4ozaXRPpEuZG+
         P8rOtjkPgO3SX42HBDitU/P5Z88Y09yhvmSHOdBayJun0JC7E9eIkDt886j85FkE9UDU
         DlJYUWmEMQcIv0ECAOt2tG/wLe+JzmucFhcD5HOksZB1YhRoyLehIaYtt5/4eVxKIeno
         inFWnn6trNRzEAov/OENX55oG+6r/tCQq6G+0cl9CTaOEMQXc7x6htOn/T7WmtklErPo
         44uH3kmo6EOKuWUcsDcEuvQpDFcJFSACgzMe0Hggtjh+PCm6vQLpOv9tvm45Hkom962R
         Sfmg==
X-Gm-Message-State: ACgBeo2wEp784EQsH9pCkFm8c9VaPrdgvbaMdDK0sVMdrR6jhJv2A0Pq
        JM8M5bETGD67hee0aVsYaP/W9EwWduN5TMTjVbM=
X-Google-Smtp-Source: AA6agR4ce0fSzkX1IoVh3rCZqyKYW0gO5deOzbyIu2GnH5xmoSm1cbw0LEYBl2QWO7pY5QN2PJmOWw==
X-Received: by 2002:a05:6a00:b55:b0:538:579c:d5ae with SMTP id p21-20020a056a000b5500b00538579cd5aemr16575712pfo.22.1662034110952;
        Thu, 01 Sep 2022 05:08:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mh16-20020a17090b4ad000b001f8aee0d826sm3133335pjb.53.2022.09.01.05.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 05:08:30 -0700 (PDT)
Message-ID: <6310a0be.170a0220.d4d53.5fc6@mx.google.com>
Date:   Thu, 01 Sep 2022 05:08:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220901
Subject: next/master baseline: 68 runs, 10 regressions (next-20220901)
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

next/master baseline: 68 runs, 10 regressions (next-20220901)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220901/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220901
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e47eb90a0a9ae20b82635b9b99a8d0979b757ad8 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63106d42c312654e2535564c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63106d42c312654e25355=
64d
        failing since 48 days (last pass: next-20220705, first fail: next-2=
0220714) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6310709c5b5e9b1767355685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6310709c5b5e9b1767355=
686
        failing since 111 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63106bff1a6909f84635565f

  Results:     71 PASS, 21 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-efuse-probed: https://kernelci.org/test/case/i=
d/63106bff1a6909f846355685
        failing since 1 day (last pass: next-20220812, first fail: next-202=
20831)

    2022-09-01T08:23:01.010202  /lava-7158810/1/../bin/lava-test-case
    2022-09-01T08:23:01.022839  <8>[   37.762843] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-efuse-driver-present: https://kernelci.org/tes=
t/case/id/63106bff1a6909f846355686
        failing since 1 day (last pass: next-20220812, first fail: next-202=
20831)

    2022-09-01T08:22:58.963283  <8>[   35.702083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-drm-driver-present RESULT=3Dfail>
    2022-09-01T08:22:59.981861  /lava-7158810/1/../bin/lava-test-case
    2022-09-01T08:22:59.993174  <8>[   36.732320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | cros://ch=
rome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63106b751697e55efd35564a

  Results:     82 PASS, 10 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-efuse-probed: https://kernelci.org/test/case/i=
d/63106b751697e55efd355675
        failing since 1 day (last pass: next-20220830, first fail: next-202=
20831)

    2022-09-01T08:20:43.510932  /lava-7158802/1/../bin/lava-test-case
    2022-09-01T08:20:43.521253  <8>[   28.136389] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-efuse-driver-present: https://kernelci.org/tes=
t/case/id/63106b751697e55efd355676
        failing since 1 day (last pass: next-20220830, first fail: next-202=
20831)

    2022-09-01T08:20:42.481080  /lava-7158802/1/../bin/lava-test-case
    2022-09-01T08:20:42.493826  <8>[   27.108024] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-efuse-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63106fd31f252900e5355646

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63106fd31f252900e535568f
        failing since 126 days (last pass: next-20220422, first fail: next-=
20220427)

    2022-09-01T08:39:30.219362  /lava-7159019/1/../bin/lava-test-case
    2022-09-01T08:39:30.232505  <8>[   40.110849] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63106fd31f252900e5355690
        failing since 126 days (last pass: next-20220422, first fail: next-=
20220427)

    2022-09-01T08:39:29.177049  /lava-7159019/1/../bin/lava-test-case
    2022-09-01T08:39:29.190764  <8>[   39.068813] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63106fd41f252900e5355691
        failing since 126 days (last pass: next-20220422, first fail: next-=
20220427)

    2022-09-01T08:39:28.104937  /lava-7159019/1/../bin/lava-test-case
    2022-09-01T08:39:28.125346  <8>[   38.003293] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora | clang-13 | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63106fa2f628f8d822355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-++20220126092033+75e33=
f71c2da-1~exp1~20220126212112.63)
  Plain log:   https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220901/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63106fa2f628f8d822355=
645
        failing since 9 days (last pass: next-20220822, first fail: next-20=
220823) =

 =20
