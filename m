Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B4A6878E8
	for <lists+linux-next@lfdr.de>; Thu,  2 Feb 2023 10:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjBBJeG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Feb 2023 04:34:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbjBBJeA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Feb 2023 04:34:00 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91F46A48
        for <linux-next@vger.kernel.org>; Thu,  2 Feb 2023 01:33:30 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id h9so1236238plf.9
        for <linux-next@vger.kernel.org>; Thu, 02 Feb 2023 01:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iJRPlMFpZb93qTqfhSUKeJpty1u74cSK67+mPafl5z8=;
        b=DWPPxBDdwBWm+gvEad2ixyCxepGw9e9kd8dSTPEVoU/n80UOgOFts6QQCHVbZBXMnR
         LRVuC9L7DQtHMjOpj4RlH9BV/N9ZKbwgK+IpDVtn8Cj7nSuFR7yP1f0vQIpwtEteAe8C
         qlLQfcnwHKc5pSdR5uOGk9tO1PhYNDybJz+07uEu7wvCM2ccdW0I64OZ/ROAi7wwSSC6
         ELW4M+vlQ1ongamFpiY3z1fNccxvBJJKcnoWf0oLbkYgD5jlLpS2pc9DsnaE2UaDi74O
         f0Kxd+jFzZ0Snl4mTfQKdwSWdW9odHAQ+nbOJ3WCCKo4vKd4foP/CcDqXsSVFj4f3vAm
         Jr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJRPlMFpZb93qTqfhSUKeJpty1u74cSK67+mPafl5z8=;
        b=v9UQBChPMU3Flt33IWWmQFJcLc1cCKQ70uuL3sskkQMTl1+Gl4Z5jtGl09NgetFibi
         EO6OyBp3/FZjbcCCCzWNzwpgFOkhjqWTPnhgni2ukV31IE2F80i1AXeuoo47FNw3bO4Y
         id0MF9wT+OXa3CY1FruL7fN9kHf9M4Nw0RC5/w5QJ+JQv+4TIZ8ct8mlr+j5t4f8xtsi
         xn2O7kKJbDo6UfJ2wqIQPwMc6evuAIdi8NJn2YM6dB91gXo33qi7GtoFEPBsu5lCFqVf
         lmcDP1B96cyzHQP8RPZDpbNUq1Fwdr2RdNjIHZPVJNBLi5lL1j5ND8Qe0Ve6Ceu1Yx1V
         Aogg==
X-Gm-Message-State: AO0yUKVb1wjXP0z98ch+rinQRh9BHFZSbxjeUazWxI/rct2kwmjyV54W
        CnRVBU0QR+jm8khc9awwH41EubxKSMk4tUZPS/ufrA==
X-Google-Smtp-Source: AK7set8s9p02F1yo65KoQhC4vnjTVOWmKizea8bK9uxuMX/0TjUTR8FJwATM0fNvlrHaTrE+pblLsA==
X-Received: by 2002:a17:903:1d2:b0:189:81a2:d616 with SMTP id e18-20020a17090301d200b0018981a2d616mr7425295plh.16.1675330408420;
        Thu, 02 Feb 2023 01:33:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ji14-20020a170903324e00b00192e0f0e021sm13206397plb.257.2023.02.02.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 01:33:27 -0800 (PST)
Message-ID: <63db8367.170a0220.10ceb.7c65@mx.google.com>
Date:   Thu, 02 Feb 2023 01:33:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230202
X-Kernelci-Report-Type: test
Subject: next/master baseline: 714 runs, 94 regressions (next-20230202)
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

next/master baseline: 714 runs, 94 regressions (next-20230202)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 3          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230202/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230202
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db51dff9b462b07a915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db51dff9b462b07a915=
ed5
        failing since 138 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db534d8629f1323a915eca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db534d8629f1323a915=
ecb
        failing since 140 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63db47dd7253cbfa58915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db47dd7253cbfa58915ef0
        failing since 8 days (last pass: next-20230124, first fail: next-20=
230125)

    2023-02-02T05:19:06.966649  + set +x
    2023-02-02T05:19:06.970317  <8>[   18.777724] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 234820_1.5.2.4.1>
    2023-02-02T05:19:07.104697  / # #
    2023-02-02T05:19:07.207127  export SHELL=3D/bin/sh
    2023-02-02T05:19:07.207480  #
    2023-02-02T05:19:07.308695  / # export SHELL=3D/bin/sh. /lava-234820/en=
vironment
    2023-02-02T05:19:07.309073  =

    2023-02-02T05:19:07.410435  / # . /lava-234820/environment/lava-234820/=
bin/lava-test-runner /lava-234820/1
    2023-02-02T05:19:07.411102  =

    2023-02-02T05:19:07.417158  / # /lava-234820/bin/lava-test-runner /lava=
-234820/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c859d40835942915f14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4c859d40835942915=
f15
        failing since 8 days (last pass: next-20230124, first fail: next-20=
230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4b47e8aed6222a915f27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4b47e8aed6222a915f2c
        failing since 14 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-02T05:33:35.397321  <8>[   16.642624] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3270728_1.5.2.4.1>
    2023-02-02T05:33:35.504566  / # #
    2023-02-02T05:33:35.606267  export SHELL=3D/bin/sh
    2023-02-02T05:33:35.607709  #
    2023-02-02T05:33:35.709100  / # export SHELL=3D/bin/sh. /lava-3270728/e=
nvironment
    2023-02-02T05:33:35.709563  =

    2023-02-02T05:33:35.811103  / # . /lava-3270728/environment/lava-327072=
8/bin/lava-test-runner /lava-3270728/1
    2023-02-02T05:33:35.811761  =

    2023-02-02T05:33:35.817499  / # /lava-3270728/bin/lava-test-runner /lav=
a-3270728/1
    2023-02-02T05:33:35.906973  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4dfd73bc9c1723915f22

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4dfd73bc9c1723915f27
        failing since 15 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-02T05:45:08.174960  <8>[   15.595639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3270978_1.5.2.4.1>
    2023-02-02T05:45:08.286669  / # #
    2023-02-02T05:45:08.389763  export SHELL=3D/bin/sh
    2023-02-02T05:45:08.390752  #
    2023-02-02T05:45:08.493176  / # export SHELL=3D/bin/sh. /lava-3270978/e=
nvironment
    2023-02-02T05:45:08.494281  =

    2023-02-02T05:45:08.494758  / # <3>[   15.851897] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-02T05:45:08.596864  . /lava-3270978/environment/lava-3270978/bi=
n/lava-test-runner /lava-3270978/1
    2023-02-02T05:45:08.598604  =

    2023-02-02T05:45:08.602666  / # /lava-3270978/bin/lava-test-runner /lav=
a-3270978/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4fea162eb4ee4d915ec5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4fea162eb4ee4d915ec8
        failing since 27 days (last pass: next-20221124, first fail: next-2=
0230106)

    2023-02-02T05:53:38.044239  [   14.303256] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1151236_1.5.2.4.1>
    2023-02-02T05:53:38.151649  / # #
    2023-02-02T05:53:38.253571  export SHELL=3D/bin/sh
    2023-02-02T05:53:38.254020  #
    2023-02-02T05:53:38.355439  / # export SHELL=3D/bin/sh. /lava-1151236/e=
nvironment
    2023-02-02T05:53:38.356037  =

    2023-02-02T05:53:38.457479  / # . /lava-1151236/environment/lava-115123=
6/bin/lava-test-runner /lava-1151236/1
    2023-02-02T05:53:38.458248  =

    2023-02-02T05:53:38.460259  / # /lava-1151236/bin/lava-test-runner /lav=
a-1151236/1
    2023-02-02T05:53:38.480475  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e33da1aef730a915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4e33da1aef730a915=
eba
        failing since 9 days (last pass: next-20230120, first fail: next-20=
230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4b280cb3a7b5b4915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4b280cb3a7b5b4915edb
        failing since 2 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-02T05:33:08.169459  + set +x
    2023-02-02T05:33:08.169615  [   12.178250] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895624_1.5.2.3.1>
    2023-02-02T05:33:08.275904  / # #
    2023-02-02T05:33:08.377641  export SHELL=3D/bin/sh
    2023-02-02T05:33:08.378160  #
    2023-02-02T05:33:08.479437  / # export SHELL=3D/bin/sh. /lava-895624/en=
vironment
    2023-02-02T05:33:08.479975  =

    2023-02-02T05:33:08.581340  / # . /lava-895624/environment/lava-895624/=
bin/lava-test-runner /lava-895624/1
    2023-02-02T05:33:08.582176  =

    2023-02-02T05:33:08.585429  / # /lava-895624/bin/lava-test-runner /lava=
-895624/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ce16e6c1e197f915ee5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4ce16e6c1e197f915eea
        failing since 2 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-02T05:40:31.111140  + set +x
    2023-02-02T05:40:31.111296  [   13.072939] <LAVA_SIGNAL_ENDRUN 0_dmesg =
895636_1.5.2.3.1>
    2023-02-02T05:40:31.218927  / # #
    2023-02-02T05:40:31.320358  export SHELL=3D/bin/sh
    2023-02-02T05:40:31.320854  #
    2023-02-02T05:40:31.422054  / # export SHELL=3D/bin/sh. /lava-895636/en=
vironment
    2023-02-02T05:40:31.422650  =

    2023-02-02T05:40:31.523917  / # . /lava-895636/environment/lava-895636/=
bin/lava-test-runner /lava-895636/1
    2023-02-02T05:40:31.524633  =

    2023-02-02T05:40:31.527693  / # /lava-895636/bin/lava-test-runner /lava=
-895636/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e48fa164ff3ea915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4e48fa164ff3ea915=
eda
        failing since 176 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4df873bc9c1723915ef0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4df873bc9c1723915=
ef1
        failing since 163 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db544af6c0c6d333915ef2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db544af6c0c6d333915=
ef3
        failing since 28 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ab28f44831f13915ee6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4ab28f44831f13915=
ee7
        failing since 27 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c2eba24d8d19c915ee3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4c2eba24d8d19c915=
ee4
        failing since 28 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4dd6c946137424915f09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4dd6c946137424915=
f0a
        failing since 28 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db5080d1f1b4bfff915eee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db5080d1f1b4bfff915=
eef
        failing since 28 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db520cfa76c49572915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db520cfa76c49572915=
ebc
        failing since 28 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db52b474b0aa452a915f12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db52b474b0aa452a915=
f13
        failing since 28 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/63db51e6f9b462b07a915edc

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63db51e6f9b462b07a915ee9
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T06:02:05.849220  /lava-263414/1/../bin/lava-test-case
    2023-02-02T06:02:05.852366  <8>[   25.538615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
b51e6f9b462b07a915eeb
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T06:02:07.855820  /lava-263414/1/../bin/lava-test-case
    2023-02-02T06:02:07.856237  <8>[   27.613149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-02T06:02:07.856488  /lava-263414/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db51e6f9b462b07a915f01
        new failure (last pass: next-20230127)

    2023-02-02T06:02:09.330004  /lava-263414/1/../bin/lava-test-case
    2023-02-02T06:02:09.330409  <8>[   29.142989] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/63db4aa376fe687596915ed1

  Results:     47 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4aa376fe687596915ed4
        new failure (last pass: next-20230127)

    2023-02-02T05:30:44.605580  / # #
    2023-02-02T05:30:44.707518  export SHELL=3D/bin/sh
    2023-02-02T05:30:44.707953  #
    2023-02-02T05:30:44.809360  / # export SHELL=3D/bin/sh. /lava-263358/en=
vironment
    2023-02-02T05:30:44.809822  =

    2023-02-02T05:30:44.911261  / # . /lava-263358/environment/lava-263358/=
bin/lava-test-runner /lava-263358/1
    2023-02-02T05:30:44.911988  =

    2023-02-02T05:30:44.917548  / # /lava-263358/bin/lava-test-runner /lava=
-263358/1
    2023-02-02T05:30:44.988537  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:30:44.988839  + cd /lava-263358/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63d=
b4aa376fe687596915ee3
        new failure (last pass: next-20230127)

    2023-02-02T05:30:50.328504  /lava-263358/1/../bin/lava-test-case
    2023-02-02T05:30:50.328884  <8>[   28.060521] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-02-02T05:30:50.329135  /lava-263358/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db4aa376fe687596915ef6
        new failure (last pass: next-20230127)

    2023-02-02T05:30:51.748945  /lava-263358/1/../bin/lava-test-case
    2023-02-02T05:30:51.749782  <8>[   29.562840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/63db4b19a4847cf0af915eed

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63db4b19a4847cf0af915efa
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:33:02.330872  /lava-263365/1/../bin/lava-test-case
    2023-02-02T05:33:02.334011  <8>[   25.206082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
b4b19a4847cf0af915efc
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:33:04.342916  /lava-263365/1/../bin/lava-test-case
    2023-02-02T05:33:04.343616  <8>[   27.279375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-02T05:33:04.343906  /lava-263365/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db4b19a4847cf0af915f12
        failing since 0 day (last pass: next-20230130, first fail: next-202=
30201)

    2023-02-02T05:33:05.810285  /lava-263365/1/../bin/lava-test-case
    2023-02-02T05:33:05.810870  <8>[   28.804197] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-02T05:33:05.811134  /lava-263365/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 3          =


  Details:     https://kernelci.org/test/plan/id/63db4b954ed3309ecf915ede

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63db4b954ed3309ecf915eeb
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:35:00.463439  /lava-263378/1/../bin/lava-test-case
    2023-02-02T05:35:00.469714  <8>[   25.424738] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
b4b954ed3309ecf915eed
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:35:02.470210  /lava-263378/1/../bin/lava-test-case
    2023-02-02T05:35:02.470497  <8>[   27.498195] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-02T05:35:02.470648  /lava-263378/1/../bin/lava-test-case   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db4b954ed3309ecf915f03
        failing since 1 day (last pass: next-20230130, first fail: next-202=
30201)

    2023-02-02T05:35:03.936221  /lava-263378/1/../bin/lava-test-case
    2023-02-02T05:35:03.936506  <8>[   29.022135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-02T05:35:03.936657  /lava-263378/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e9d13a1b0c8cc915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4e9d13a1b0c8cc915=
ebb
        new failure (last pass: next-20230201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63db50e40943624f00915eb9

  Results:     47 PASS, 5 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db50e40943624f00915ebc
        new failure (last pass: next-20230130)

    2023-02-02T05:57:40.845675  / # #
    2023-02-02T05:57:40.947338  export SHELL=3D/bin/sh
    2023-02-02T05:57:40.948050  #
    2023-02-02T05:57:41.049487  / # export SHELL=3D/bin/sh. /lava-263395/en=
vironment
    2023-02-02T05:57:41.050033  =

    2023-02-02T05:57:41.151481  / # . /lava-263395/environment/lava-263395/=
bin/lava-test-runner /lava-263395/1
    2023-02-02T05:57:41.152316  =

    2023-02-02T05:57:41.159238  / # /lava-263395/bin/lava-test-runner /lava=
-263395/1
    2023-02-02T05:57:41.221106  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:57:41.221441  + cd /l<8>[   21.785763] <LAVA_SIGNAL_START=
RUN 1_bootrr 263395_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63db50e40943624f00915ec6
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:57:45.113527  /lava-263395/1/../bin/lava-test-case
    2023-02-02T05:57:45.116736  <8>[   25.862165] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63d=
b50e40943624f00915ec8
        failing since 13 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-02T05:57:47.124807  /lava-263395/1/../bin/lava-test-case
    2023-02-02T05:57:47.125175  <8>[   27.935823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63d=
b50e40943624f00915ecb
        new failure (last pass: next-20230130)

    2023-02-02T05:57:48.159510  /lava-263395/1/../bin/lava-test-case
    2023-02-02T05:57:48.159899  <8>[   29.008540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =


  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db50e40943624f00915ede
        new failure (last pass: next-20230130)

    2023-02-02T05:57:49.552962  /lava-263395/1/../bin/lava-test-case
    2023-02-02T05:57:49.554243  <8>[   30.460878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-02T05:57:49.554866  /lava-263395/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db517067c0aed75b915ee1

  Results:     49 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.fec-ethernet0-probed: https://kernelci.org/test/case/id=
/63db517067c0aed75b915f06
        failing since 1 day (last pass: next-20230130, first fail: next-202=
30201)

    2023-02-02T05:59:57.192163  /lava-263407/1/../bin/lava-test-case
    2023-02-02T05:59:57.192560  <8>[   28.803003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfec-ethernet0-probed RESULT=3Dfail>
    2023-02-02T05:59:57.192806  /lava-263407/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13 | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c25f93414a9de915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4c25f93414a9de915=
ec5
        failing since 5 days (last pass: next-20230123, first fail: next-20=
230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63db49c6021e956b1d915ef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db49c6021e956b1d915=
ef4
        failing since 8 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4a8c761a3b2bb8915f85

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4a8c761a3b2bb8915=
f86
        failing since 8 days (last pass: next-20230123, first fail: next-20=
230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4dd4c946137424915ef1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4dd4c946137424915ef6
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:44:38.692348  <8>[   18.046572] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3271067_1.5.2.4.1>
    2023-02-02T05:44:38.795808  / # #
    2023-02-02T05:44:38.897266  export SHELL=3D/bin/sh
    2023-02-02T05:44:38.897793  #
    2023-02-02T05:44:38.999035  / # export SHELL=3D/bin/sh. /lava-3271067/e=
nvironment
    2023-02-02T05:44:38.999431  =

    2023-02-02T05:44:38.999635  / # <3>[   18.288882] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:44:39.100817  . /lava-3271067/environment/lava-3271067/bi=
n/lava-test-runner /lava-3271067/1
    2023-02-02T05:44:39.101388  =

    2023-02-02T05:44:39.105720  / # /lava-3271067/bin/lava-test-runner /lav=
a-3271067/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4a630e3e6d953e915f00

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4a630e3e6d953e915f05
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:29:48.486557  / # #
    2023-02-02T05:29:48.588389  export SHELL=3D/bin/sh
    2023-02-02T05:29:48.588900  #
    2023-02-02T05:29:48.690312  / # export SHELL=3D/bin/sh<3>[   18.564235]=
 brcmfmac: brcmf_sdio_htclk: HT Avail time. /lava-3270637/environment
    2023-02-02T05:29:48.690750  out (1000000): clkctl 0x50
    2023-02-02T05:29:48.691048  =

    2023-02-02T05:29:48.792247  / # . /lava-3270637/environment/lava-327063=
7/bin/lava-test-runner /lava-3270637/1
    2023-02-02T05:29:48.792926  =

    2023-02-02T05:29:48.799452  / # /lava-3270637/bin/lava-test-runner /lav=
a-3270637/1
    2023-02-02T05:29:48.843211  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ac95b97acc1ed915f66

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4ac95b97acc1ed915f6b
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:31:29.973625  <8>[   17.866718] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3270678_1.5.2.4.1>
    2023-02-02T05:31:30.077850  / # #
    2023-02-02T05:31:30.179438  export SHELL=3D/bin/sh
    2023-02-02T05:31:30.179790  #
    2023-02-02T05:31:30.280869  / # export SHELL=3D/bin/sh. /lava-3270678/e=
nvironment
    2023-02-02T05:31:30.281291  =

    2023-02-02T05:31:30.281535  / # <3>[   18.114125] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:31:30.382820  . /lava-3270678/environment/lava-3270678/bi=
n/lava-test-runner /lava-3270678/1
    2023-02-02T05:31:30.383705  =

    2023-02-02T05:31:30.394304  / # /lava-3270678/bin/lava-test-runner /lav=
a-3270678/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4b53e8aed6222a915f53

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4b53e8aed6222a915f58
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:33:59.461432  / #
    2023-02-02T05:33:59.563543  # #export SHELL=3D/bin/sh
    2023-02-02T05:33:59.564181  =

    2023-02-02T05:33:59.665823  / # export SHELL=3D/bin/sh. /lava-3270776/e=
nvironment
    2023-02-02T05:33:59.666273  =

    2023-02-02T05:33:59.666499  / # <3>[   18.170772] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:33:59.767874  . /lava-3270776/environment/lava-3270776/bi=
n/lava-test-runner /lava-3270776/1
    2023-02-02T05:33:59.768612  =

    2023-02-02T05:33:59.780250  / # /lava-3270776/bin/lava-test-runner /lav=
a-3270776/1
    2023-02-02T05:33:59.837163  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ce36e6c1e197f915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4ce36e6c1e197f915ef8
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:40:45.809355  / # #
    2023-02-02T05:40:45.911329  export SHELL=3D/bin/sh
    2023-02-02T05:40:45.911866  #
    2023-02-02T05:40:46.013271  / # export SHELL=3D/bin/sh. /lava-3270862/e=
nvironment
    2023-02-02T05:40:46.013770  =

    2023-02-02T05:40:46.014044  / # <3>[  102.910088] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:40:46.115407  . /lava-3270862/environment/lava-3270862/bi=
n/lava-test-runner /lava-3270862/1
    2023-02-02T05:40:46.116215  =

    2023-02-02T05:40:46.121022  / # /lava-3270862/bin/lava-test-runner /lav=
a-3270862/1
    2023-02-02T05:40:46.184734  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d33e10b3880e9915ebd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4d33e10b3880e9915ec2
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:42:00.622005  / # #
    2023-02-02T05:42:00.723402  export SHELL=3D/bin/sh
    2023-02-02T05:42:00.723820  #
    2023-02-02T05:42:00.825110  / # export SHELL=3D/bin/sh. /lava-3270919/e=
nvironment
    2023-02-02T05:42:00.825506  =

    2023-02-02T05:42:00.825743  / # <3>[   18.196774] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:42:00.926956  . /lava-3270919/environment/lava-3270919/bi=
n/lava-test-runner /lava-3270919/1
    2023-02-02T05:42:00.927634  =

    2023-02-02T05:42:00.945299  / # /lava-3270919/bin/lava-test-runner /lav=
a-3270919/1
    2023-02-02T05:42:01.000294  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d835286000b1e915ed8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4d835286000b1e915edd
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:43:19.493410  / # #
    2023-02-02T05:43:19.594847  export SHELL=3D/bin/sh
    2023-02-02T05:43:19.595212  #
    2023-02-02T05:43:19.696432  / # export SHELL=3D/bin/sh. /lava-3271044/e=
nvironment
    2023-02-02T05:43:19.696926  =

    2023-02-02T05:43:19.697181  <3>[   18.053907] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:43:19.798588  / # . /lava-3271044/environment/lava-327104=
4/bin/lava-test-runner /lava-3271044/1
    2023-02-02T05:43:19.799753  =

    2023-02-02T05:43:19.811793  / # /lava-3271044/bin/lava-test-runner /lav=
a-3271044/1
    2023-02-02T05:43:19.872742  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4eab1225c87b47915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4eab1225c87b47915ebe
        failing since 14 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-02T05:47:53.097738  =

    2023-02-02T05:47:53.199380  / # #export SHELL=3D/bin/sh
    2023-02-02T05:47:53.199742  =

    2023-02-02T05:47:53.301053  / # export SHELL=3D/bin/sh. /lava-3271071/e=
nvironment
    2023-02-02T05:47:53.301418  =

    2023-02-02T05:47:53.402766  / # . /lava-3271071/environment/lava-327107=
1/bin/lava-test-runner /lava-3271071/1
    2023-02-02T05:47:53.403388  =

    2023-02-02T05:47:53.408124  / # /lava-3271071/bin/lava-test-runner /lav=
a-3271071/1
    2023-02-02T05:47:53.479985  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:47:53.480248  + cd /lava-3271071/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4a8403ded02e87915f12

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4a8403ded02e87915f17
        failing since 14 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-02T05:30:19.782612  / # #
    2023-02-02T05:30:19.884308  export SHELL=3D/bin/sh
    2023-02-02T05:30:19.884682  #
    2023-02-02T05:30:19.986008  / # export SHELL=3D/bin/sh. /lava-3270654/e=
nvironment
    2023-02-02T05:30:19.986398  =

    2023-02-02T05:30:20.087728  / # . /lava-3270654/environment/lava-327065=
4/bin/lava-test-runner /lava-3270654/1
    2023-02-02T05:30:20.088355  =

    2023-02-02T05:30:20.093728  / # /lava-3270654/bin/lava-test-runner /lav=
a-3270654/1
    2023-02-02T05:30:20.173631  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:30:20.174123  + cd /lava-3270654/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4af9d60777d20b915f58

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4af9d60777d20b915f5d
        failing since 14 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-02T05:32:26.402938  / # #
    2023-02-02T05:32:26.505969  export SHELL=3D/bin/sh
    2023-02-02T05:32:26.506951  #
    2023-02-02T05:32:26.608791  / # export SHELL=3D/bin/sh. /lava-3270704/e=
nvironment
    2023-02-02T05:32:26.609651  =

    2023-02-02T05:32:26.711515  / # . /lava-3270704/environment/lava-327070=
4/bin/lava-test-runner /lava-3270704/1
    2023-02-02T05:32:26.712428  =

    2023-02-02T05:32:26.726745  / # /lava-3270704/bin/lava-test-runner /lav=
a-3270704/1
    2023-02-02T05:32:26.788680  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:32:26.789637  + cd /lava-3270704/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4b7c3518aa0452915eec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4b7c3518aa0452915ef1
        failing since 14 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-02T05:34:20.254462  + set +x<8>[   18.171685] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3270757_1.5.2.4.1>
    2023-02-02T05:34:20.360164  / # #
    2023-02-02T05:34:20.461939  export SHELL=3D/bin/sh
    2023-02-02T05:34:20.462295  #
    2023-02-02T05:34:20.563615  / # export SHELL=3D/bin/sh. /lava-3270757/e=
nvironment
    2023-02-02T05:34:20.563969  =

    2023-02-02T05:34:20.665290  / # . /lava-3270757/environment/lava-327075=
7/bin/lava-test-runner /lava-3270757/1
    2023-02-02T05:34:20.665901  =

    2023-02-02T05:34:20.671240  / # /lava-3270757/bin/lava-test-runner /lav=
a-3270757/1
    2023-02-02T05:34:20.747171  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c4257d8f1a138915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4c4257d8f1a138915ebe
        failing since 14 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-02T05:37:51.401368  / #
    2023-02-02T05:37:51.503282  # #export SHELL=3D/bin/sh
    2023-02-02T05:37:51.503633  =

    2023-02-02T05:37:51.604974  / # export SHELL=3D/bin/sh. /lava-3270854/e=
nvironment
    2023-02-02T05:37:51.605480  =

    2023-02-02T05:37:51.706832  / # . /lava-3270854/environment/lava-327085=
4/bin/lava-test-runner /lava-3270854/1
    2023-02-02T05:37:51.707444  =

    2023-02-02T05:37:51.712423  / # /lava-3270854/bin/lava-test-runner /lav=
a-3270854/1
    2023-02-02T05:37:51.784183  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:37:51.784442  + cd /lava-3270854/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4dae80d75fda4a915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4dae80d75fda4a915ed7
        failing since 14 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-02T05:43:57.092315  / # #
    2023-02-02T05:43:57.194281  export SHELL=3D/bin/sh
    2023-02-02T05:43:57.194694  #
    2023-02-02T05:43:57.296027  / # export SHELL=3D/bin/sh. /lava-3270951/e=
nvironment
    2023-02-02T05:43:57.296395  =

    2023-02-02T05:43:57.397780  / # . /lava-3270951/environment/lava-327095=
1/bin/lava-test-runner /lava-3270951/1
    2023-02-02T05:43:57.398632  =

    2023-02-02T05:43:57.403696  / # /lava-3270951/bin/lava-test-runner /lav=
a-3270951/1
    2023-02-02T05:43:57.475557  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:43:57.475938  + cd /lava-3270951/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e2935738ea379915ef4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4e2935738ea379915ef9
        failing since 14 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-02T05:46:02.970097  + set +x<8>[   18.255830] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3271023_1.5.2.4.1>
    2023-02-02T05:46:02.970356  =

    2023-02-02T05:46:03.075387  / # #
    2023-02-02T05:46:03.177231  export SHELL=3D/bin/sh
    2023-02-02T05:46:03.177752  #
    2023-02-02T05:46:03.278885  / # export SHELL=3D/bin/sh. /lava-3271023/e=
nvironment
    2023-02-02T05:46:03.279408  =

    2023-02-02T05:46:03.380543  / # . /lava-3271023/environment/lava-327102=
3/bin/lava-test-runner /lava-3271023/1
    2023-02-02T05:46:03.381319  =

    2023-02-02T05:46:03.400740  / # /lava-3271023/bin/lava-test-runner /lav=
a-3271023/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db53493aaf4cea76915f1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db53493aaf4cea76915=
f20
        new failure (last pass: next-20230201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d97f0e1a7486b915f25

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230130102947+16a5=
dd495d02-1~exp1~20230130223052.7))
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4d97f0e1a7486b915f2a
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:43:45.001390  + set +x<8>[   17.960158] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3271059_1.5.2.4.1>
    2023-02-02T05:43:45.109425  / # #
    2023-02-02T05:43:45.211056  export SHELL=3D/bin/sh
    2023-02-02T05:43:45.211474  #
    2023-02-02T05:43:45.312855  / # export SHELL=3D/bin/sh. /lava-3271059/e=
nvironment
    2023-02-02T05:43:45.313636  =

    2023-02-02T05:43:45.314060  / # <3>[   18.208950] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:43:45.415883  . /lava-3271059/environment/lava-3271059/bi=
n/lava-test-runner /lava-3271059/1
    2023-02-02T05:43:45.416593  =

    2023-02-02T05:43:45.421906  / # /lava-3271059/bin/lava-test-runner /lav=
a-3271059/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4aa48f44831f13915eda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4aa48f44831f13915edf
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:30:48.505265  / # #
    2023-02-02T05:30:48.607304  export SHELL=3D/bin/sh
    2023-02-02T05:30:48.607727  #
    2023-02-02T05:30:48.709295  / # export SHELL=3D/bin/sh. /lava-3270652/e=
nvironment
    2023-02-02T05:30:48.709632  =

    2023-02-02T05:30:48.709819  / # <3>[   18.095025] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:30:48.811072  . /lava-3270652/environment/lava-3270652/bi=
n/lava-test-runner /lava-3270652/1
    2023-02-02T05:30:48.811717  =

    2023-02-02T05:30:48.818897  / # /lava-3270652/bin/lava-test-runner /lav=
a-3270652/1
    2023-02-02T05:30:48.877720  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ac9b25991af0b915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4ac9b25991af0b915ebe
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:31:31.409390  / # #
    2023-02-02T05:31:31.511308  export SHELL=3D/bin/sh
    2023-02-02T05:31:31.511862  #
    2023-02-02T05:31:31.613394  / # export SHELL=3D/bin/sh. /lava-3270700/e=
nvironment
    2023-02-02T05:31:31.613759  =

    2023-02-02T05:31:31.613947  / # <3>[   18.085085] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:31:31.715019  . /lava-3270700/environment/lava-3270700/bi=
n/lava-test-runner /lava-3270700/1
    2023-02-02T05:31:31.715921  =

    2023-02-02T05:31:31.727916  / # /lava-3270700/bin/lava-test-runner /lav=
a-3270700/1
    2023-02-02T05:31:31.785878  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4bc0caeadf5469915f1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4bc0caeadf5469915f21
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:35:29.390795  / # #
    2023-02-02T05:35:29.492424  export SHELL=3D/bin/sh
    2023-02-02T05:35:29.493274  #
    2023-02-02T05:35:29.595194  / # export SHELL=3D/bin/sh. /lava-3270754/e=
nvironment
    2023-02-02T05:35:29.596481  =

    2023-02-02T05:35:29.596930  / # <3>[   18.124824] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:35:29.698658  . /lava-3270754/environment/lava-3270754/bi=
n/lava-test-runner /lava-3270754/1
    2023-02-02T05:35:29.699470  =

    2023-02-02T05:35:29.709914  / # /lava-3270754/bin/lava-test-runner /lav=
a-3270754/1
    2023-02-02T05:35:29.768992  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c57fd4d2080e1915ef9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4c57fd4d2080e1915efe
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:38:14.450138  / # #
    2023-02-02T05:38:14.551873  export SHELL=3D/bin/sh
    2023-02-02T05:38:14.552443  #
    2023-02-02T05:38:14.653365  / # export SHELL=3D/bin/sh. /lava-3270812/e=
nvironment
    2023-02-02T05:38:14.653830  =

    2023-02-02T05:38:14.654069  / # <3>[  102.921369] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:38:14.755229  . /lava-3270812/environment/lava-3270812/bi=
n/lava-test-runner /lava-3270812/1
    2023-02-02T05:38:14.756094  =

    2023-02-02T05:38:14.772286  / # /lava-3270812/bin/lava-test-runner /lav=
a-3270812/1
    2023-02-02T05:38:14.827111  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ca7880654f946915f3c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4ca7880654f946915f41
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:39:41.541385  / # #
    2023-02-02T05:39:41.642949  export SHELL=3D/bin/sh
    2023-02-02T05:39:41.643340  #
    2023-02-02T05:39:41.744545  / # export SHELL=3D/bin/sh. /lava-3270901/e=
nvironment
    2023-02-02T05:39:41.744902  =

    2023-02-02T05:39:41.745085  / # <3>[   18.191010] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:39:41.846301  . /lava-3270901/environment/lava-3270901/bi=
n/lava-test-runner /lava-3270901/1
    2023-02-02T05:39:41.846896  =

    2023-02-02T05:39:41.859705  / # /lava-3270901/bin/lava-test-runner /lav=
a-3270901/1
    2023-02-02T05:39:41.915702  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d47ac6903c9f2915f15

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4d47ac6903c9f2915f1a
        failing since 14 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:42:08.880456  / # #
    2023-02-02T05:42:08.982335  export SHELL=3D/bin/sh
    2023-02-02T05:42:08.983143  #
    2023-02-02T05:42:09.085021  / # export SHELL=3D/bin/sh. /lava-3271009/e=
nvironment
    2023-02-02T05:42:09.085765  =

    2023-02-02T05:42:09.086211  / # <3>[   18.091006] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:42:09.188241  . /lava-3271009/environment/lava-3271009/bi=
n/lava-test-runner /lava-3271009/1
    2023-02-02T05:42:09.189511  =

    2023-02-02T05:42:09.199510  / # /lava-3271009/bin/lava-test-runner /lav=
a-3271009/1
    2023-02-02T05:42:09.258424  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63db511d6f64ffaabb915ec7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db511d6f64ffaabb915ecc
        failing since 15 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-02T05:58:28.076293  + set <8>[   17.715029] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 3271224_1.5.2.4.1>
    2023-02-02T05:58:28.076598  +x
    2023-02-02T05:58:28.180493  / # #
    2023-02-02T05:58:28.282219  export SHELL=3D/bin/sh
    2023-02-02T05:58:28.282668  #
    2023-02-02T05:58:28.384031  / # export SHELL=3D/bin/sh. /lava-3271224/e=
nvironment
    2023-02-02T05:58:28.384475  =

    2023-02-02T05:58:28.384745  / # . /lava-3271224/environment<3>[   18.02=
7680] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-02T05:58:28.485957  /lava-3271224/bin/lava-test-runner /lava-32=
71224/1
    2023-02-02T05:58:28.486630   =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63db521755132c2181915eca

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63db521755132c2181915f7c
        new failure (last pass: next-20230130)

    2023-02-02T06:02:26.741217  /lava-8983237/1/../bin/lava-test-case
    2023-02-02T06:02:26.744635  =

    2023-02-02T06:02:26.751126  <8>[   22.800291] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63db521755132c2181915f7d
        new failure (last pass: next-20230130)

    2023-02-02T06:02:25.722021  /lava-8983237/1/../bin/lava-test-case
    2023-02-02T06:02:25.725375  =

    2023-02-02T06:02:25.731640  <8>[   21.780647] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63db521755132c2181915f7e
        new failure (last pass: next-20230130)

    2023-02-02T06:02:23.694633  =

    2023-02-02T06:02:23.695241     0
    2023-02-02T06:02:23.695632    Res:          0x0
    2023-02-02T06:02:23.697427  TPM2_CC_TestParms:
    2023-02-02T06:02:23.697913    value: 0x18A
    2023-02-02T06:02:23.701161    commandIndex: 0x18a
    2023-02-02T06:02:23.701648    reserved1:    0x0
    2023-02-02T06:02:23.703977    nv:           0
    2023-02-02T06:02:23.704467    extensive:    0
    2023-02-02T06:02:23.707404    flushed:      0 =

    ... (53 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63db4ea713a1b0c8cc915ecf

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63db4ea713a1b0c8cc915f81
        new failure (last pass: next-20230130)

    2023-02-02T05:48:00.036007  /lava-8983043/1/../bin/lava-test-case
    2023-02-02T05:48:00.039600  =

    2023-02-02T05:48:00.046223  <8>[   21.961628] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63db4ea713a1b0c8cc915f82
        new failure (last pass: next-20230130)

    2023-02-02T05:47:59.017016  /lava-8983043/1/../bin/lava-test-case
    2023-02-02T05:47:59.019541  =

    2023-02-02T05:47:59.026054  <8>[   20.942127] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63db4ea713a1b0c8cc915f83
        new failure (last pass: next-20230130)

    2023-02-02T05:47:56.992805    rHandle:      0
    2023-02-02T05:47:56.992882    V:            0
    2023-02-02T05:47:56.996263    Res:          0x0
    2023-02-02T05:47:56.996336  TPM2_CC_GetTestResult:
    2023-02-02T05:47:56.999064    value: 0x17C
    2023-02-02T05:47:56.999136    commandIndex: 0x17c
    2023-02-02T05:47:57.002645    reserved1:    0x0
    2023-02-02T05:47:57.002721    nv:           0
    2023-02-02T05:47:57.005994    extensive:    0
    2023-02-02T05:47:57.006067    flushed:      0 =

    ... (110 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ac75b97acc1ed915f53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4ac75b97acc1ed915=
f54
        failing since 162 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f5a22b41aa551915ece

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f5a22b41aa551915=
ecf
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f50f9e9852e55915ed4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f50f9e9852e55915=
ed5
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4def73bc9c1723915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4def73bc9c1723915=
ebe
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f56f9e9852e55915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f56f9e9852e55915=
ee0
        failing since 139 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f2897fc0e031a915ee8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f2897fc0e031a915=
ee9
        failing since 139 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4dee73bc9c1723915eba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4dee73bc9c1723915=
ebb
        failing since 139 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f3ef9e9852e55915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f3ef9e9852e55915=
ec7
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f52f9e9852e55915ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f52f9e9852e55915=
ed8
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f5822b41aa551915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f5822b41aa551915=
ec9
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4f3c2e4a2df562915fa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4f3c2e4a2df562915=
fa3
        failing since 141 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c1bf4136ca1e5915ec5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4c1bf4136ca1e5915=
ec6
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d6e8e0280ee7e915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4d6e8e0280ee7e915=
eba
        failing since 5 days (last pass: next-20230125, first fail: next-20=
230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d309660f95ca8915ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4d309660f95ca8915=
ec1
        failing since 13 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e0f35738ea379915ec4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4e0f35738ea379915=
ec5
        failing since 1 day (last pass: next-20230131, first fail: next-202=
30201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4db9c3d0510c1e915ed7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4db9c3d0510c1e915edc
        failing since 27 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-02T05:44:08.814443  + set +x
    2023-02-02T05:44:08.815732  <8>[   68.190710][  T196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 389772_1.5.2.4.1>
    2023-02-02T05:44:08.947828  #
    2023-02-02T05:44:09.050378  / # #export SHELL=3D/bin/sh
    2023-02-02T05:44:09.051009  =

    2023-02-02T05:44:09.152515  / # export SHELL=3D/bin/sh. /lava-389772/en=
vironment
    2023-02-02T05:44:09.153155  =

    2023-02-02T05:44:09.254777  / # . /lava-389772/environment/lava-389772/=
bin/lava-test-runner /lava-389772/1
    2023-02-02T05:44:09.255782  =

    2023-02-02T05:44:09.265647  / # /lava-389772/bin/lava-test-runner /lava=
-389772/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4e4def8b47f2b5915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4e4def8b47f2b5915=
ed3
        new failure (last pass: next-20230201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4aefd60777d20b915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-stm32mp157c-=
dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4aefd60777d20b915ecd
        failing since 1 day (last pass: next-20221012, first fail: next-202=
30201)

    2023-02-02T05:32:12.643859  <8>[   19.473554] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3270727_1.5.2.4.1>
    2023-02-02T05:32:12.749977  / # #
    2023-02-02T05:32:12.852575  export SHELL=3D/bin/sh
    2023-02-02T05:32:12.852983  #
    2023-02-02T05:32:12.954224  / # export SHELL=3D/bin/sh. /lava-3270727/e=
nvironment
    2023-02-02T05:32:12.954747  =

    2023-02-02T05:32:13.056138  / # . /lava-3270727/environment/lava-327072=
7/bin/lava-test-runner /lava-3270727/1
    2023-02-02T05:32:13.057016  =

    2023-02-02T05:32:13.060122  / # /lava-3270727/bin/lava-test-runner /lav=
a-3270727/1
    2023-02-02T05:32:13.131034  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
stm32mp157c-dk2              | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4c1dc9ae576691915ed6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-stm32mp157c-dk2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4c1dc9ae576691915edb
        failing since 1 day (last pass: next-20221012, first fail: next-202=
30201)

    2023-02-02T05:37:26.313626  <8>[   13.843154] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3270974_1.5.2.4.1>
    2023-02-02T05:37:26.419408  / # #
    2023-02-02T05:37:26.521400  export SHELL=3D/bin/sh
    2023-02-02T05:37:26.522037  #
    2023-02-02T05:37:26.623811  / # export SHELL=3D/bin/sh. /lava-3270974/e=
nvironment
    2023-02-02T05:37:26.624457  =

    2023-02-02T05:37:26.726271  / # . /lava-3270974/environment/lava-327097=
4/bin/lava-test-runner /lava-3270974/1
    2023-02-02T05:37:26.727309  =

    2023-02-02T05:37:26.731856  / # /lava-3270974/bin/lava-test-runner /lav=
a-3270974/1
    2023-02-02T05:37:26.805652  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4ce26e6c1e197f915ef0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4ce26e6c1e197f915=
ef1
        failing since 105 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4d91560b6e4d3f915ee1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4d91560b6e4d3f915=
ee2
        new failure (last pass: next-20230201) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4b3a9b466e9ecd915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63db4b3a9b466e9ecd915=
eda
        new failure (last pass: next-20230130) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db4a35f18ce31fb8915ebf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db4a35f18ce31fb8915ec4
        failing since 8 days (last pass: next-20230123, first fail: next-20=
230124)

    2023-02-02T05:29:10.023724  / # #
    2023-02-02T05:29:10.125571  export SHELL=3D/bin/sh
    2023-02-02T05:29:10.126208  #
    2023-02-02T05:29:10.227808  / # export SHELL=3D/bin/sh. /lava-3270621/e=
nvironment
    2023-02-02T05:29:10.228281  =

    2023-02-02T05:29:10.329660  / # . /lava-3270621/environment/lava-327062=
1/bin/lava-test-runner /lava-3270621/1
    2023-02-02T05:29:10.330351  =

    2023-02-02T05:29:10.334827  / # /lava-3270621/bin/lava-test-runner /lav=
a-3270621/1
    2023-02-02T05:29:10.489507  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-02T05:29:10.490132  + cd /lava-3270621/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63db80260fb7b0d262915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230202/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230127.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63db80260fb7b0d262915ece
        failing since 28 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-02T09:19:21.155926  + set +x
    2023-02-02T09:19:21.182001  <8>[   43.542209][  T171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 839131_1.5.2.4.1>
    2023-02-02T09:19:21.315895  #
    2023-02-02T09:19:21.417223  / # #export SHELL=3D/bin/sh
    2023-02-02T09:19:21.417449  =

    2023-02-02T09:19:21.518409  / # export SHELL=3D/bin/sh. /lava-839131/en=
vironment
    2023-02-02T09:19:21.518636  =

    2023-02-02T09:19:21.619618  / # . /lava-839131/environment/lava-839131/=
bin/lava-test-runner /lava-839131/1
    2023-02-02T09:19:21.620028  =

    2023-02-02T09:19:21.625914  / # /lava-839131/bin/lava-test-runner /lava=
-839131/1 =

    ... (18 line(s) more)  =

 =20
