Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBD096223A3
	for <lists+linux-next@lfdr.de>; Wed,  9 Nov 2022 07:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiKIGAV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Nov 2022 01:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKIGAU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2022 01:00:20 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEFE71EEE0
        for <linux-next@vger.kernel.org>; Tue,  8 Nov 2022 22:00:17 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id m6so15815281pfb.0
        for <linux-next@vger.kernel.org>; Tue, 08 Nov 2022 22:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=geT55yn1Uc3IWU87xo5+7PXOvJuXtVbKzuZsmO/PZ9Y=;
        b=EUHompibSiox8vIxQxHEgrlmQ0+Dag7xqmDROIEy+BZL5tr6+d8UdeqWtvskuhViNI
         Dh/xiYUqHAIeGdjlalNHgb5NcFyIfEu+V4xmZFRMkYFF/s+leRUIhuPBo/yr1jmbbxKT
         KYSiUchQBlSGpL8gIesh5V2dDA4pltQBbAvqzkd55JpzdqnZMb/oy8HhcGCRYLUGHsLz
         XogFSYLKIlCDsEpbEazkKo/Z3sgk/dEYo1u2qSDQS4sRz05iPTw3UievQ5vd517VHmU8
         3LOOUQMPeVA3rKjRJUcWZnyfRWaSMILlsfiKCoiDtlMADewO3CXtTlB6TJSo1NLiotIG
         xlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geT55yn1Uc3IWU87xo5+7PXOvJuXtVbKzuZsmO/PZ9Y=;
        b=scIz+mCm77SgjC2MD4fk4TFPF8CiXAiH6WMcgHKieVVJBetdO/aE5iG4Z0FxfdWtrW
         kgVm5TDaiMBqQ/RW3pr2NBvAEanFolOx0QMDivd/wVbpOjU6/Hqrb94FpnLHFliaRm2W
         dJ2K1RNr4tNbIcUeHCqt3OFAFyvJlBIbk5DSwui9hcHyRhtiFuhN4m3uN7GWNVmzZ2nm
         bc6dP3vy8DVVgXNqqVJuacjlXjnDPw+l/3vcflAStyDxZ6LYnkaXg5ygkxXNQqXUXg9O
         TMCF6W79/7EN2MOtwegTP8EdZxD+Pr403SHKrX5t01DooAC/AF73CY2PpRHdmNPuzkNL
         c04A==
X-Gm-Message-State: ACrzQf0eAMaRT2xCcQEntOUXkK6SgQGjhMDR7mqiAesScteJoC39gVgV
        yr6/ZGbwernFYQDNAVwGeTM0oLaMqruTm/d+
X-Google-Smtp-Source: AMsMyM53jzH2+WXed3DBxdDsFl3JbzslPgGNWmPeWS+vVABLOhdIblwmhwf9TC1NUvJkLOrbN89Yyg==
X-Received: by 2002:a63:b12:0:b0:44a:d193:6b16 with SMTP id 18-20020a630b12000000b0044ad1936b16mr51178035pgl.604.1667973616986;
        Tue, 08 Nov 2022 22:00:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w14-20020a17090a1b8e00b001ef8ab65052sm334283pjc.11.2022.11.08.22.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 22:00:16 -0800 (PST)
Message-ID: <636b41f0.170a0220.65727.07b1@mx.google.com>
Date:   Tue, 08 Nov 2022 22:00:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.1-rc4-339-g185da88d03ed
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 505 runs,
 24 regressions (v6.1-rc4-339-g185da88d03ed)
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

next/pending-fixes baseline: 505 runs, 24 regressions (v6.1-rc4-339-g185da8=
8d03ed)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =

at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

da850-lcdk                   | arm  | lab-baylibre    | gcc-10   | davinci_=
all_defconfig        | 1          =

imx6dl-riotboard             | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

imx6sx-sdb                   | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-14x14-evk             | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+ima       | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-10   | oxnas_v6=
_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm  | lab-collabora   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm  | lab-collabora   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm  | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =

stm32mp157c-lxa-mc1          | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc4-339-g185da88d03ed/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc4-339-g185da88d03ed
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      185da88d03ed28e7602c6f278232209cb02e5548 =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/636b3d33056d374002e7db4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b3d33056d374002e7d=
b50
        failing since 30 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b3e88a5135ce7d2e7db7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b3e88a5135ce7d2e7d=
b7b
        failing since 28 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636b1bb68e853df31fe7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sa=
ma5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b1bb68e853df31fe7d=
b4f
        new failure (last pass: v6.0-12387-ge54e01f1826aa) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/636b1fd12b54e8ee9ae7db4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-at9=
1-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-at9=
1-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b1fd12b54e8ee9ae7d=
b50
        new failure (last pass: v6.1-rc4-279-gef5b2e74bc50) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm  | lab-baylibre    | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0674f8c4175c8be7db82

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/636b0674f8c4175=
c8be7db8a
        failing since 289 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-11-09T01:46:03.701046  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-11-09T01:46:03.701837  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-11-09T01:46:03.704646  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-11-09T01:46:03.750597  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6dl-riotboard             | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b10d5a39c38dedde7db5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b10d5a39c38dedde7d=
b5c
        failing since 2 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6qp-wandboard-revd1       | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0df3fe769399e7e7db78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0df3fe769399e7e7d=
b79
        failing since 54 days (last pass: v6.0-rc4-291-g83a56f559828, first=
 fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6sx-sdb                   | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636b09952c912092b4e7db51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b09952c912092b4e7d=
b52
        failing since 64 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-14x14-evk             | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636b09921385117066e7db82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x1=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x1=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b09921385117066e7d=
b83
        failing since 62 days (last pass: v6.0-rc3-304-gd62f6b276548, first=
 fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636b230a46a32508b0e7db5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b230a46a32508b0e7d=
b5d
        failing since 112 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, fir=
st fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/636b211615ea30479de7db55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b211615ea30479de7d=
b56
        failing since 162 days (last pass: v5.16-rc4-356-ga119cd39dcbf, fir=
st fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636b267a43f615f2d6e7db5c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b267a43f615f2d6e7d=
b5d
        failing since 136 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fi=
rst fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/636b2a628ee2f98ff4e7db54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b2a628ee2f98ff4e7d=
b55
        failing since 162 days (last pass: v5.16-rc4-356-ga119cd39dcbf, fir=
st fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/636b2c56a76dc01523e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b2c56a76dc01523e7d=
b4f
        failing since 162 days (last pass: v5.16-rc4-356-ga119cd39dcbf, fir=
st fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/636b2ce236ae918ce8e7db63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b2ce236ae918ce8e7d=
b64
        failing since 162 days (last pass: v5.16-rc4-356-ga119cd39dcbf, fir=
st fail: v5.18-11575-gceccc06b624ed) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx7ulp-evk                  | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0981a5cf90cb80e7db87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0981a5cf90cb80e7d=
b88
        failing since 97 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/636b40c5e6d3563a93e7db61

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b40c5e6d3563a93e7d=
b62
        failing since 193 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636b061e7b114e6607e7db4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b061e7b114e6607e7d=
b50
        failing since 28 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0e1377d82b7dd8e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0e1377d82b7dd8e7d=
b4f
        failing since 28 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv2          | arm  | lab-collabora   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0df33e1bedd7aee7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0df33e1bedd7aee7d=
b4f
        failing since 28 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0e3f76a17f720be7db60

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0e3f76a17f720be7d=
b61
        failing since 28 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
qemu_arm-virt-gicv3          | arm  | lab-collabora   | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0df44af3490825e7db54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0df44af3490825e7d=
b55
        failing since 28 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm  | lab-cip         | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/636b082f6ffc486b12e7db89

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b082f6ffc486b12e7d=
b8a
        failing since 4 days (last pass: v6.1-rc3-324-g60a091309878, first =
fail: v6.1-rc3-392-g53fcf96923f7) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
stm32mp157c-lxa-mc1          | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/636b0df44af3490825e7db4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-stm32mp157c-lxa-mc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc4-33=
9-g185da88d03ed/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-stm32mp157c-lxa-mc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221024.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/636b0df44af3490825e7d=
b4f
        failing since 2 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.1-rc3-573-g82d05e3975f5) =

 =20
