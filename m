Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CD37D1A9D
	for <lists+linux-next@lfdr.de>; Sat, 21 Oct 2023 05:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbjJUDSA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Oct 2023 23:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjJUDSA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Oct 2023 23:18:00 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80855D78
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 20:17:54 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so1237598b3a.1
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697858273; x=1698463073; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ILkWk+P1NbzLw6yh2Fi9pbE+L659pQSd/FeiAceJf4=;
        b=wd3Hdb81t4AHQ6N+JTFAwbQUTyNGnwB0uJv13nT8syfUOClQAqA8s4+k5d55J+ZEzL
         rWs9npMYDz++iEaK2QP0K44crZIhip0GqHL2EzXscu8w8fKkcxbi1DGU3S3RagYPg/gM
         RkOMvFY9StS55pLBVFM1/2s/2wK+HDW1T/J9p7KcrIWfpH84S9wxfJBffQJ6WZKJm2IW
         Ia3iTfKPIfvkfbh6/WE2d2lfoRc8kYbyrWUVYxl3DIHK2iCOmpmsL63mzu56Ro7HfmCF
         blQYI9u+HWxQ6ZcKO67cfNfKFMUbiCl3z+uTxfnPVBwY1HZaozr0x1Ucaa5mIAjjXsar
         GI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697858273; x=1698463073;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ILkWk+P1NbzLw6yh2Fi9pbE+L659pQSd/FeiAceJf4=;
        b=XSTgU0y1K51ktvtqdBhXnSH0OtIl8x2UWDPZl2PJyQH/uPMXj23JAaEDHV+FG9I3o8
         HvzV31Agg/g5h8VU7lxPz8akCaX1HqXh30MaM7ym1IYC77S8mQJvvLIcEZKDB8jv24L1
         3W5YvCj0H69bOF+eS7Mx4LU8wMbniqW3aLXrcRJkD7T8ahmXh+6+0YZTWr8WcC5C3ytU
         dMxZ8KxjqSSHldJKkXd0GNb4BSSKzOYEaQC67DsGVBFkG03MKH9K+RX3j9A7AbdnPM+Z
         0g9+aEDU6d5ozv5CmLDCO52pr5UhAYyJPn1U28B7RU2Ovh7em3c6szJ9YDTofseJPQ+E
         nRHQ==
X-Gm-Message-State: AOJu0YyBSd5P5rt3vuILFaZ0PtmaT8vUmzDOG80Xp/RSZsgWthFKFyui
        bg1eIPpuLuXPzmluB/ipvh4uYsh26ptEFAWVkQlQxQ==
X-Google-Smtp-Source: AGHT+IGTTmVfKAudydQz9HGzwLYkslF9i7lIZct4Y21qE+N4ji17pOD9aqC3kt7Xak4TwbCiDXd0+Q==
X-Received: by 2002:a05:6a00:1896:b0:6be:2bfa:6290 with SMTP id x22-20020a056a00189600b006be2bfa6290mr3938371pfh.8.1697858273412;
        Fri, 20 Oct 2023 20:17:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x26-20020aa79ada000000b006be5af77f06sm2251321pfp.2.2023.10.20.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 20:17:52 -0700 (PDT)
Message-ID: <653342e0.a70a0220.1bddfb.8c43@mx.google.com>
Date:   Fri, 20 Oct 2023 20:17:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231020
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 335 runs, 10 regressions (next-20231020)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 335 runs, 10 regressions (next-20231020)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =

imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =

sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231020/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231020
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2030579113a1b1b5bfd7ff24c0852847836d8fd1 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653303f2bde9bc6188efcf8d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653303f2bde9bc6188efcf96
        failing since 17 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-20T22:48:56.831708  + set<8>[   17.295904] <LAVA_SIGNAL_ENDRUN =
0_dmesg 3808751_1.5.2.4.1>
    2023-10-20T22:48:56.831906   +x
    2023-10-20T22:48:56.936423  / # #
    2023-10-20T22:48:58.091061  export SHELL=3D/bin/sh
    2023-10-20T22:48:58.096530  #
    2023-10-20T22:48:59.636343  / # export SHELL=3D/bin/sh. /lava-3808751/e=
nvironment
    2023-10-20T22:48:59.641820  =

    2023-10-20T22:49:02.450764  / # . /lava-3808751/environment/lava-380875=
1/bin/lava-test-runner /lava-3808751/1
    2023-10-20T22:49:02.456492  =

    2023-10-20T22:49:02.456698  / # /lava-3808751/bin/lava<3>[   21.393514]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/653307075a1f3f31d3efcf65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653307075a1f3f31d3efcf6e
        failing since 17 days (last pass: next-20230717, first fail: next-2=
0231003)

    2023-10-20T23:01:49.517912  / # #
    2023-10-20T23:01:50.672140  export SHELL=3D/bin/sh
    2023-10-20T23:01:50.677775  #
    2023-10-20T23:01:52.218269  / # export SHELL=3D/bin/sh. /lava-3808797/e=
nvironment
    2023-10-20T23:01:52.223822  =

    2023-10-20T23:01:55.033190  / # . /lava-3808797/environment/lava-380879=
7/bin/lava-test-runner /lava-3808797/1
    2023-10-20T23:01:55.038994  =

    2023-10-20T23:01:55.039196  / # /lava-3808797/bin/lava<3>[   21.393461]=
 caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resistance
    2023-10-20T23:01:55.054720  -test-runner /lava-3808797/1
    2023-10-20T23:01:55.070603  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653307be0aeebfda11efcf33

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653307be0aeebfda11efcf3c
        failing since 66 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-20T23:05:15.458264  + set<8>[   28.205731] <LAVA_SIGNAL_ENDRUN =
0_dmesg 182950_1.5.2.4.1>
    2023-10-20T23:05:15.458858   +x
    2023-10-20T23:05:15.568514  / # #
    2023-10-20T23:05:16.732879  export SHELL=3D/bin/sh
    2023-10-20T23:05:16.738644  #
    2023-10-20T23:05:18.233226  / # export SHELL=3D/bin/sh. /lava-182950/en=
vironment
    2023-10-20T23:05:18.238939  =

    2023-10-20T23:05:20.958385  / # . /lava-182950/environment/lava-182950/=
bin/lava-test-runner /lava-182950/1
    2023-10-20T23:05:20.965267  =

    2023-10-20T23:05:20.976818  / # /lava-182950/bin/lava-test-runner /lava=
-182950/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-broonie   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6533085d39fdbfc94cefcf36

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-imx8mp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6533085d39fdbfc94cefcf3f
        failing since 66 days (last pass: next-20230809, first fail: next-2=
0230815)

    2023-10-20T23:08:02.428263  + set<8>[   27.934181] <LAVA_SIGNAL_ENDRUN =
0_dmesg 183003_1.5.2.4.1>
    2023-10-20T23:08:02.428827   +x
    2023-10-20T23:08:02.534495  / # #
    2023-10-20T23:08:03.696831  export SHELL=3D/bin/sh
    2023-10-20T23:08:03.702584  #
    2023-10-20T23:08:05.195219  / # export SHELL=3D/bin/sh. /lava-183003/en=
vironment
    2023-10-20T23:08:05.200920  =

    2023-10-20T23:08:07.913310  / # . /lava-183003/environment/lava-183003/=
bin/lava-test-runner /lava-183003/1
    2023-10-20T23:08:07.919045  =

    2023-10-20T23:08:07.931966  / # /lava-183003/bin/lava-test-runner /lava=
-183003/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jh7100-starfi...isionfive-v1 | riscv | lab-clabbe    | gcc-10   | defconfig=
+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/653308986b0c859a53efcf1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/653308986b0c859a53efc=
f1f
        failing since 255 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653303c181e0d4488aefcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653303c181e0d4488aefcefe
        new failure (last pass: next-20231013)

    2023-10-20T22:48:16.114209  <8>[   21.812783] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439482_1.5.2.4.1>
    2023-10-20T22:48:16.219642  / # #
    2023-10-20T22:48:16.321181  export SHELL=3D/bin/sh
    2023-10-20T22:48:16.321712  #
    2023-10-20T22:48:16.422681  / # export SHELL=3D/bin/sh. /lava-439482/en=
vironment
    2023-10-20T22:48:16.423191  =

    2023-10-20T22:48:16.524180  / # . /lava-439482/environment/lava-439482/=
bin/lava-test-runner /lava-439482/1
    2023-10-20T22:48:16.525003  =

    2023-10-20T22:48:16.532078  / # /lava-439482/bin/lava-test-runner /lava=
-439482/1
    2023-10-20T22:48:16.580983  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (42 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653303bf4cc3ce0b7eefcf1a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653303bf4cc3ce0b7eefcf23
        failing since 7 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231013)

    2023-10-20T22:48:26.323142  <8>[   18.672388] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 439480_1.5.2.4.1>
    2023-10-20T22:48:26.428203  / # #
    2023-10-20T22:48:26.529821  export SHELL=3D/bin/sh
    2023-10-20T22:48:26.530400  #
    2023-10-20T22:48:26.631396  / # export SHELL=3D/bin/sh. /lava-439480/en=
vironment
    2023-10-20T22:48:26.631998  =

    2023-10-20T22:48:26.733010  / # . /lava-439480/environment/lava-439480/=
bin/lava-test-runner /lava-439480/1
    2023-10-20T22:48:26.733916  =

    2023-10-20T22:48:26.738278  / # /lava-439480/bin/lava-test-runner /lava=
-439480/1
    2023-10-20T22:48:26.811441  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/653306e2f632474cacefcef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653306e2f632474cacefcefc
        failing since 10 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-20T23:01:37.505101  / # #
    2023-10-20T23:01:37.606681  export SHELL=3D/bin/sh
    2023-10-20T23:01:37.607256  #
    2023-10-20T23:01:37.708247  / # export SHELL=3D/bin/sh. /lava-439488/en=
vironment
    2023-10-20T23:01:37.708758  =

    2023-10-20T23:01:37.809580  / # . /lava-439488/environment/lava-439488/=
bin/lava-test-runner /lava-439488/1
    2023-10-20T23:01:37.810304  =

    2023-10-20T23:01:37.816349  / # /lava-439488/bin/lava-test-runner /lava=
-439488/1
    2023-10-20T23:01:37.848357  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-20T23:01:37.889638  + cd /lava-439488/<8>[   19.173927] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 439488_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/653303a0a81abf9595efcf0b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653303a0a81abf9595efcf14
        failing since 7 days (last pass: v6.3-rc6-12018-gd3f2cd248191, firs=
t fail: next-20231013)

    2023-10-20T22:52:03.095083  / # #

    2023-10-20T22:52:03.197270  export SHELL=3D/bin/sh

    2023-10-20T22:52:03.197956  #

    2023-10-20T22:52:03.299289  / # export SHELL=3D/bin/sh. /lava-11833396/=
environment

    2023-10-20T22:52:03.300016  =


    2023-10-20T22:52:03.401464  / # . /lava-11833396/environment/lava-11833=
396/bin/lava-test-runner /lava-11833396/1

    2023-10-20T22:52:03.402537  =


    2023-10-20T22:52:03.419598  / # /lava-11833396/bin/lava-test-runner /la=
va-11833396/1

    2023-10-20T22:52:03.484839  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-20T22:52:03.485335  + cd /lava-1183339<8>[   19.354443] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11833396_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-h6-pine-h64           | arm64 | lab-collabora | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/653306e98b80a7dee4efcf0b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231020/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/653306e98b80a7dee4efcf14
        failing since 10 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20231010)

    2023-10-20T23:06:07.753089  / # #

    2023-10-20T23:06:07.854980  export SHELL=3D/bin/sh

    2023-10-20T23:06:07.855693  #

    2023-10-20T23:06:07.957105  / # export SHELL=3D/bin/sh. /lava-11833447/=
environment

    2023-10-20T23:06:07.957828  =


    2023-10-20T23:06:08.059285  / # . /lava-11833447/environment/lava-11833=
447/bin/lava-test-runner /lava-11833447/1

    2023-10-20T23:06:08.060458  =


    2023-10-20T23:06:08.065033  / # /lava-11833447/bin/lava-test-runner /la=
va-11833447/1

    2023-10-20T23:06:08.145158  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-20T23:06:08.145663  + cd /lava-1183344<8>[   19.635525] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 11833447_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
