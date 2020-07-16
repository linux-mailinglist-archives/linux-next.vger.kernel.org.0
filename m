Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED74D2229C5
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 19:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPRYf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 13:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPRYe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 13:24:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4994C061755
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 10:24:34 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id x9so4163643plr.2
        for <linux-next@vger.kernel.org>; Thu, 16 Jul 2020 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=o6E1kNklX3AXYLmhXVFijK3mXmZPC/x9KKtW/AZ58NQ=;
        b=KettQ1DKH+eZhNNxXmj8XS48pYbkBxTMNQ004IhtW7vqa64vEVoG5pqNHn0pew1qyB
         NOr0hu+vQgQM0fmNVDM/caMt7S2u1ZGCz+1nFbsVXkTwn2572kXGgi1oCQjR+CM0hwxC
         nXuCF6aSI2j0fDHbubjrFlGJUnrfWiQ45m2a90JvEXk+vTDaFG6mRgwEQqpOd4OZgFh9
         7udbeMiiflNRxAOWNTJBlmFWeHoMXJAPcWlEsHy+M/dQoBSpYu7Q7XERFBES3vnJEBKY
         R5GPtRj/U/JIkzVVW+Fdl88yP4p5/QEdJcJBkmAP8ZKu9gPgD1LET9ZYNlxYzHcogtZ+
         fAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=o6E1kNklX3AXYLmhXVFijK3mXmZPC/x9KKtW/AZ58NQ=;
        b=PnJyTW7CCU4O6XPdBhKG8Uv3/DV6KI1Kgt/wXUHPSyNqOEHwFAPt0B9YQsF2dbH8su
         +RWX1sU3ecGojHkQROp0A9byGiQzyhT7k1Stqbu6z9otpQdCmNDlRoB+Xw6JGu5qafh4
         k+ZIBtU/hU64KFCo8K/RMgLj9gpd85QXWpmiGg/BLaVMocvafBWAlVNCUhhNEyuNFqLH
         hD/LAnFd9+0whh/t/lcY8uolCBXwgmmEPblIKsuHmTmcBB3r42agtFOTih8CD/fFGK1P
         8x8WNwzyhzYLwFmbQSfuGI812PlidWQSWehEp3VHGjwMpsQHCzpUHU6vh20MtToSyEny
         yATg==
X-Gm-Message-State: AOAM531wxaA5UvkOtXee6A2JtzHV39wiGiy4uokwk03hH8ycUmpAlDxG
        Ev9IjfmDQyH26/Dqa9BbvkVv75LsAL0=
X-Google-Smtp-Source: ABdhPJyOdqK2UYl4J1ThpWUgC8yovwMyFHWlM8q3cAtDGq87E6vIdcFMu5qC8wjfyC8oH7Q5icUJcw==
X-Received: by 2002:a17:902:b589:: with SMTP id a9mr4041420pls.98.1594920273688;
        Thu, 16 Jul 2020 10:24:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j26sm5187870pfe.200.2020.07.16.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 10:24:32 -0700 (PDT)
Message-ID: <5f108d50.1c69fb81.90e81.f23f@mx.google.com>
Date:   Thu, 16 Jul 2020 10:24:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200716
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 256 runs, 12 regressions (next-20200716)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 256 runs, 12 regressions (next-20200716)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | clang-10 | defconfig      =
              | 4/5    =

bcm2837-rpi-3-b         | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig            | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =

imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | multi_v7_defcon=
fig           | 2/4    =

omap4-panda             | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 4/5    =

omap4-panda             | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =

vexpress-v2p-ca15-tc1   | arm   | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =

vexpress-v2p-ca15-tc1   | arm   | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200716/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200716
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4c43049f19a280329c1d01699f3cc8ad6910cbbe =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f104e84e4868415bf85bb4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f104e84e4868415bf85b=
b4f
      failing since 79 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | clang-10 | defconfig      =
              | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1054dfc791ee248685bb24

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1054dfc791ee24=
8685bb27
      new failure (last pass: next-20200715)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1050f463380a593d85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1050f463380a593d85b=
b23
      new failure (last pass: next-20200714) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1058e8d9d671bed585bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1058e8d9d671be=
d585bb1b
      failing since 1 day (last pass: next-20200714, first fail: next-20200=
715)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | multi_v7_defcon=
fig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f104f0946c3bb34b485bb26

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f104f0946c3bb3=
4b485bb29
      new failure (last pass: next-20200715)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f10=
4f0946c3bb34b485bb2a
      new failure (last pass: next-20200715)
      44 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
omap4-panda             | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f104fafd343886bac85bb19

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f104fafd343886=
bac85bb1d
      failing since 1 day (last pass: next-20200713, first fail: next-20200=
714)
      60 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
omap4-panda             | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f10510e63380a593d85bb2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f10510e63380a593d85b=
b2b
      new failure (last pass: next-20200706) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f104f882cbdcd940585bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f104f882cbdcd940585b=
b19
      failing since 10 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f10598d180174c50e85bb23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f10598d180174c50e85b=
b24
      new failure (last pass: next-20200715) =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-baylibre | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f104beafabf95fabd85bb1d

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f104beafabf95fa=
bd85bb20
      failing since 40 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                | arch  | lab          | compiler | defconfig      =
              | results
------------------------+-------+--------------+----------+----------------=
--------------+--------
vexpress-v2p-ca15-tc1   | arm   | lab-cip      | gcc-8    | vexpress_defcon=
fig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f104bf1605b74e8dd85bb19

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200716/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200716/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f104bf1605b74e8=
dd85bb1c
      failing since 40 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
