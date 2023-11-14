Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C601A7EAB8F
	for <lists+linux-next@lfdr.de>; Tue, 14 Nov 2023 09:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjKNI0C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Nov 2023 03:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjKNI0B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2023 03:26:01 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126FD1A8
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 00:25:56 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5be24d41bb8so2942266a12.0
        for <linux-next@vger.kernel.org>; Tue, 14 Nov 2023 00:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699950355; x=1700555155; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XarySsv38uLZJmUjHr65Yq2DmlMdmJwTRrvH3PPmY00=;
        b=OseeuKDqSdEguj8bCe0imLKyofftRbTvayTXmV5NS6wMqpSMRSx28U8AuTXMaPSFbH
         1vhx+aKvMQBM6jXkyQ0GVm4qsddN6DnvhnZJx5Kjp0kanTgx6rsglX/YrFmlImFtNGjP
         cCVw5sqcRaqjeOgPW/eCZzLsPVxraSmmRqQPSDJDz1vpXIfozw5uDq9hGjODK5NCAGWU
         eqPAuEgi3IDMfJPBEqGuxOJnagZvg0VBImbT5ExiKCISS46sHc4zUO8vDkn+KkfV1BLy
         QeXGE/FRKKDD0mukLZQpeo0iNWlVwyvVLNxHz5tv6KfNBPLY0OdRjKKN/S3kkb1YGi8v
         gMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950355; x=1700555155;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XarySsv38uLZJmUjHr65Yq2DmlMdmJwTRrvH3PPmY00=;
        b=pMBMJKIqRkHN68D/NMcP2GbGbAsogcybc7pA1Cd8Yk95EaKcqA8epag2KHBwbmGVY+
         5Br+9JiAAFO4brrc473Tr+HopSwh1KLBFaVclwWeLYnNHqRcMynI05Z1HpXNgAa8kaZJ
         8+CByw2/wTfLFWALRr2MLC6PyM+WzTTYE6wlqElcww9TCUP8RodWxuFDnp3Y6bVEkA9L
         iVyiiQS1acOgH/vEnnKO08GlKx6b0ligug130Xut+PMAs0yN+K6ZWR0b4C5yx2HerUkn
         8EgJgDwnFAEJDagjV2G6ySy3gIo/bArR6auLK1qrn488Xcg+0N9BNCn1jZVtuJHYkTCU
         SM4w==
X-Gm-Message-State: AOJu0YxOVZZYcGNJL62+vSLsaq+cApDoa6/cWZuuLOvKmTJ0Z6FNsnuE
        Ir9h18HAigBZUG2rB10Gg6NMQMlsxZrnLtjORHxQAg==
X-Google-Smtp-Source: AGHT+IFZ1Yikf/ExNQ6Z7jxiW0+vCuNsCkjuQXDAHh2HdyMiPca5S4ul3GbcwhR3WyT8H3EP2n6v5A==
X-Received: by 2002:a17:90b:f0e:b0:280:4a23:3c84 with SMTP id br14-20020a17090b0f0e00b002804a233c84mr2703654pjb.22.1699950354739;
        Tue, 14 Nov 2023 00:25:54 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id ft13-20020a17090b0f8d00b0026b70d2a8a2sm4772539pjb.29.2023.11.14.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 00:25:53 -0800 (PST)
Message-ID: <65532f11.170a0220.f8a8f.a94a@mx.google.com>
Date:   Tue, 14 Nov 2023 00:25:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231114
Subject: next/master baseline: 517 runs, 26 regressions (next-20231114)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 517 runs, 26 regressions (next-20231114)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =

at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

da850-lcdk               | arm   | lab-baylibre    | gcc-10   | davinci_all=
_defconfig        | 1          =

imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

imx6ul-14x14-evk         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =

k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =

rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =

sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231114/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231114
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5ba73bec5e7b0494da7fdca3e003d8b97fa932cd =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-10   | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f7bf362a5b03c47e4a74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f7bf362a5b03c47e4=
a75
        failing since 286 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | at91_dt_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/6552eed5d0586d0b3b7e4a75

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6552eed5d0586d0b3b7e4a95
        failing since 161 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-14T03:51:22.655043  /lava-239648/1/../bin/lava-test-case
    2023-11-14T03:51:22.698189  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91sam9g20ek            | arm   | lab-broonie     | gcc-10   | multi_v5_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f1e2215cb963407e4a8a

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/6552f1e2215cb963407e4aa9
        failing since 161 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-11-14T04:04:24.031564  /lava-239679/1/../bin/lava-test-case
    2023-11-14T04:04:24.073597  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f79f18290fa8077e4a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f79f18290fa8077e4=
a70
        failing since 161 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f458a9b50b148b7e4a7e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f458a9b50b148b7e4=
a7f
        failing since 230 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f43fa9b50b148b7e4a6e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f43fa9b50b148b7e4=
a6f
        failing since 227 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
da850-lcdk               | arm   | lab-baylibre    | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f445cb03b954e27e4a72

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6552f445cb03b95=
4e27e4a75
        failing since 273 days (last pass: next-20230208, first fail: next-=
20230213)
        32 lines

    2023-11-14T04:14:40.025193  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4c26800 pointer offset 4 size 512
    2023-11-14T04:14:40.062556  kern  :alert : Register r9 information: 1-p=
age vmalloc region starting at 0xbf2f9000 allocated at load_module+0x6b0/0x=
1954
    2023-11-14T04:14:40.063201  kern  :alert : Register r10 information: no=
n-slab/vmalloc memory
    2023-11-14T04:14:40.063862  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2f9000 allocated at load_module+0x6b0/0=
x1954
    2023-11-14T04:14:40.065820  kern  :alert : Register r12 information: no=
n-paged memory
    2023-11-14T04:14:40.129382  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-11-14T04:14:40.170512  kern  :emerg : Process udevd (pid: 74, stac=
k limit =3D 0xb292e0e5)
    2023-11-14T04:14:40.171105  kern  :emerg : Stack: (0xc8805ca8 to 0xc880=
6000)
    2023-11-14T04:14:40.171451  kern  :emerg : 5ca0:                   c4c2=
6800 c078f7d8 00000000 c03c0620 c0d4fe60 68f8a424
    2023-11-14T04:14:40.171771  kern  :emerg : 5cc0: 0000005d 68f8a424 c078=
f7d8 bf2f9220 00000000 00000000 00000001 bf2f9220 =

    ... (6 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6dl-riotboard         | arm   | lab-pengutronix | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f3fc13ee1031707e4a9e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f3fc13ee1031707e4aa7
        failing since 145 days (last pass: next-20230620, first fail: next-=
20230621)

    2023-11-14T04:13:26.453260  + set[   15.003887] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 1008713_1.5.2.3.1>
    2023-11-14T04:13:26.453486   +x
    2023-11-14T04:13:26.559222  / # #
    2023-11-14T04:13:26.661090  export SHELL=3D/bin/sh
    2023-11-14T04:13:26.661615  #
    2023-11-14T04:13:26.763214  / # export SHELL=3D/bin/sh. /lava-1008713/e=
nvironment
    2023-11-14T04:13:26.763807  =

    2023-11-14T04:13:26.865223  / # . /lava-1008713/environment/lava-100871=
3/bin/lava-test-runner /lava-1008713/1
    2023-11-14T04:13:26.865947  =

    2023-11-14T04:13:26.869241  / # /lava-1008713/bin/lava-test-runner /lav=
a-1008713/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6ul-14x14-evk         | arm   | lab-nxp         | gcc-10   | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f0d31d48c9b99b7e4a6d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f0d41d48c9b99b7e4a74
        new failure (last pass: next-20230428)

    2023-11-14T03:59:50.698622  + set +x
    2023-11-14T03:59:50.701786  <8>[   18.943052] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1258439_1.5.2.4.1>
    2023-11-14T03:59:50.813002  / # #
    2023-11-14T03:59:51.968997  export SHELL=3D/bin/sh
    2023-11-14T03:59:51.974594  #
    2023-11-14T03:59:53.516770  / # export SHELL=3D/bin/sh. /lava-1258439/e=
nvironment
    2023-11-14T03:59:53.522431  =

    2023-11-14T03:59:56.334715  / # . /lava-1258439/environment/lava-125843=
9/bin/lava-test-runner /lava-1258439/1
    2023-11-14T03:59:56.340718  =

    2023-11-14T03:59:56.343164  / # /lava-1258439/bin/lava-test-runner /lav=
a-1258439/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f94b84682558027e4a98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-pengutronix/baseline-imx8=
mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f94b84682558027e4=
a99
        new failure (last pass: next-20231113) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mm-innocomm-wb15-evk | arm64 | lab-pengutronix | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552fa3bbcaaeae9d27e4a97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-pengutronix/baseline-imx8m=
m-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552fa3bbcaaeae9d27e4=
a98
        new failure (last pass: next-20231113) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
jetson-tk1               | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f2848c28738d7c7e4a9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f2848c28738d7c7e4=
aa0
        failing since 581 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-am625-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f15ef35a55d20d7e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f15ef35a55d20d7e4=
a6e
        failing since 4 days (last pass: next-20231103, first fail: next-20=
231110) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
k3-j721e-sk              | arm64 | lab-baylibre    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f1aa13f4d1362c7e4a6d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f1aa13f4d1362c7e4=
a6e
        failing since 11 days (last pass: next-20231025, first fail: next-2=
0231103) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre    | gcc-10   | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f65d44b3b14dc17e4db9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f65d44b3b14dc17e4dc2
        new failure (last pass: next-20231113)

    2023-11-14T04:23:41.026831  <8>[   16.597241] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3833613_1.5.2.4.1>
    2023-11-14T04:23:41.132271  / # #
    2023-11-14T04:23:41.233387  export SHELL=3D/bin/sh
    2023-11-14T04:23:41.233736  #
    2023-11-14T04:23:41.334414  / # export SHELL=3D/bin/sh. /lava-3833613/e=
nvironment
    2023-11-14T04:23:41.334807  =

    2023-11-14T04:23:41.334950  / # <3>[   16.838085] mmc0: error -84 whils=
t initialising SD card
    2023-11-14T04:23:41.435604  . /lava-3833613/environment/lava-3833613/bi=
n/lava-test-runner /lava-3833613/1
    2023-11-14T04:23:41.436253  =

    2023-11-14T04:23:41.440365  / # /lava-3833613/bin/lava-test-runner /lav=
a-3833613/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
odroid-xu3               | arm   | lab-collabora   | gcc-10   | exynos_defc=
onfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f0d3bf5e61a72c7e4a82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f0d3bf5e61a72c7e4=
a83
        new failure (last pass: next-20230621) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-rock2-square      | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f353209912547a7e4b42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f353209912547a7e4=
b43
        failing since 356 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
rk3288-veyron-jaq        | arm   | lab-collabora   | gcc-10   | multi_v7_de=
fc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f23b896f6d8f307e4ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f23b896f6d8f307e4=
ab7
        failing since 356 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-clabbe      | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f10154b03143d87e4ab6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f10154b03143d87e4=
ab7
        failing since 276 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64       | arm64 | lab-collabora   | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f122c06c1dcdf27e4a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6552f122c06c1dcdf27e4=
a7b
        failing since 276 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f440c8fff0d2377e4a74

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f440c8fff0d2377e4a7d
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:14:30.062122  / # #
    2023-11-14T04:14:30.163321  export SHELL=3D/bin/sh
    2023-11-14T04:14:30.163693  #
    2023-11-14T04:14:30.264363  / # export SHELL=3D/bin/sh. /lava-3833637/e=
nvironment
    2023-11-14T04:14:30.264789  =

    2023-11-14T04:14:30.365527  / # . /lava-3833637/environment/lava-383363=
7/bin/lava-test-runner /lava-3833637/1
    2023-11-14T04:14:30.366036  =

    2023-11-14T04:14:30.407153  / # /lava-3833637/bin/lava-test-runner /lav=
a-3833637/1
    2023-11-14T04:14:30.499982  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-14T04:14:30.500388  + cd /lava-3833637/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f68320f1dfe4367e4a81

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f68320f1dfe4367e4a8a
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:24:24.885100  / # #
    2023-11-14T04:24:24.986167  export SHELL=3D/bin/sh
    2023-11-14T04:24:24.986941  #
    2023-11-14T04:24:25.088388  / # export SHELL=3D/bin/sh. /lava-3833688/e=
nvironment
    2023-11-14T04:24:25.089287  =

    2023-11-14T04:24:25.190809  / # . /lava-3833688/environment/lava-383368=
8/bin/lava-test-runner /lava-3833688/1
    2023-11-14T04:24:25.192044  =

    2023-11-14T04:24:25.235324  / # /lava-3833688/bin/lava-test-runner /lav=
a-3833688/1
    2023-11-14T04:24:25.326689  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-14T04:24:25.327287  + cd /lava-3833688/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-baylibre    | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6552fb0733c68973007e4ad7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552fb0733c68973007e4ae0
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:43:28.037678  <8>[   13.411406] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3833829_1.5.2.4.1>
    2023-11-14T04:43:28.148190  / # #
    2023-11-14T04:43:28.250405  export SHELL=3D/bin/sh
    2023-11-14T04:43:28.250841  #
    2023-11-14T04:43:28.351639  / # export SHELL=3D/bin/sh. /lava-3833829/e=
nvironment
    2023-11-14T04:43:28.352078  =

    2023-11-14T04:43:28.452894  / # . /lava-3833829/environment/lava-383382=
9/bin/lava-test-runner /lava-3833829/1
    2023-11-14T04:43:28.453556  =

    2023-11-14T04:43:28.468442  / # /lava-3833829/bin/lava-test-runner /lav=
a-3833829/1
    2023-11-14T04:43:28.593269  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f4377e95d9c3507e4aa7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f4377e95d9c3507e4ab0
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:14:21.460685  + set +x
    2023-11-14T04:14:21.462435  [   18.871353] <LAVA_SIGNAL_ENDRUN 0_dmesg =
443957_1.5.2.4.1>
    2023-11-14T04:14:21.570633  / # #
    2023-11-14T04:14:21.672180  export SHELL=3D/bin/sh
    2023-11-14T04:14:21.672712  #
    2023-11-14T04:14:21.773692  / # export SHELL=3D/bin/sh. /lava-443957/en=
vironment
    2023-11-14T04:14:21.774222  =

    2023-11-14T04:14:21.875221  / # . /lava-443957/environment/lava-443957/=
bin/lava-test-runner /lava-443957/1
    2023-11-14T04:14:21.876067  =

    2023-11-14T04:14:21.879174  / # /lava-443957/bin/lava-test-runner /lava=
-443957/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6552f604e8df8cbfce7e4a7b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552f604e8df8cbfce7e4a84
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:22:08.349399  + set +x
    2023-11-14T04:22:08.351125  [   23.289296] <LAVA_SIGNAL_ENDRUN 0_dmesg =
443961_1.5.2.4.1>
    2023-11-14T04:22:08.459629  / # #
    2023-11-14T04:22:08.561213  export SHELL=3D/bin/sh
    2023-11-14T04:22:08.561756  #
    2023-11-14T04:22:08.662733  / # export SHELL=3D/bin/sh. /lava-443961/en=
vironment
    2023-11-14T04:22:08.663244  =

    2023-11-14T04:22:08.764246  / # . /lava-443961/environment/lava-443961/=
bin/lava-test-runner /lava-443961/1
    2023-11-14T04:22:08.765071  =

    2023-11-14T04:22:08.767587  / # /lava-443961/bin/lava-test-runner /lava=
-443961/1 =

    ... (12 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
sun7i-a20-cubieboard2    | arm   | lab-clabbe      | gcc-10   | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6552fa8cad574783ef7e4ac0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231114/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6552fa8cad574783ef7e4ac9
        failing since 165 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-11-14T04:41:25.707496  + set +x
    2023-11-14T04:41:25.709197  [   22.510959] <LAVA_SIGNAL_ENDRUN 0_dmesg =
443973_1.5.2.4.1>
    2023-11-14T04:41:25.817528  / # #
    2023-11-14T04:41:25.919263  export SHELL=3D/bin/sh
    2023-11-14T04:41:25.919968  #
    2023-11-14T04:41:26.020947  / # export SHELL=3D/bin/sh. /lava-443973/en=
vironment
    2023-11-14T04:41:26.021485  =

    2023-11-14T04:41:26.122477  / # . /lava-443973/environment/lava-443973/=
bin/lava-test-runner /lava-443973/1
    2023-11-14T04:41:26.123290  =

    2023-11-14T04:41:26.126148  / # /lava-443973/bin/lava-test-runner /lava=
-443973/1 =

    ... (12 line(s) more)  =

 =20
