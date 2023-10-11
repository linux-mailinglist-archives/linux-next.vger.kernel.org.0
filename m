Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5367C4937
	for <lists+linux-next@lfdr.de>; Wed, 11 Oct 2023 07:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjJKFbx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Oct 2023 01:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjJKFbw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2023 01:31:52 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C428E
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 22:31:49 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6c4c594c0eeso4327869a34.0
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1697002308; x=1697607108; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oX7avv+YJMmj3Oh2ogv7X7DoNAOcmJN9jihV0agjB0c=;
        b=jWgOoxnTsAcXXaAZ/RoThIUVlB6QKyO2Df1Znl8jmw0CvDSCpGw2MF4dt4RonZx6+W
         9XjFVOULIW2Y7YvOYR2llA/jeKzYRns/+HgDE4zsSfvXEF88h1qEkEEmtFQn/JKRAN7W
         PwVW5aXU7I4icNC7ftm5QEMvgGpyY6KcwHAGGKBDCbhUB9LpWsB2XflgXZmTXhUpvIa7
         ZdYffPV6AfFrfp5KKVD63GHXUJ+MVsZlfdSDnBy0R+aC+Y/JK2PtqN5GW3ObPSwQWX1e
         r/2qwCA9hRgeUeOwMq04a1KSxxoWpkXg5MLy1A/Tah3v9cXThP11+99reM/zPDeuTGPL
         iZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697002308; x=1697607108;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oX7avv+YJMmj3Oh2ogv7X7DoNAOcmJN9jihV0agjB0c=;
        b=ZRPxtMmTerF277DDyBR6BeSYWIFhHTTMNpbCo3vb8tm0/6XflTKmXUP6NpNHnfndEP
         LrDGqpYFA//lXNMheoHSFgJrLV36xoNzT962IMl1RhpTdhrP2qswHaQKpYqybv8IU7BL
         C2piUIOAA2+Nmrp+pYwMz/dYfSVcWq2d3Ti0pKFv6UAcBmG9cHMZtkvwPrlJyKaibzXC
         oIdNTGh+39ntuEurSLSvwIEiQrRjXR/uNJ6qXUb5FPmODJRveOT5ui1Uxm+wto5222Ul
         sr6eyQctsTud9aZJolLe1iWs7YOLiPS2AMSPNQlOUTfEXVxRcj57O+RIe0WyoLANsPAe
         xJGg==
X-Gm-Message-State: AOJu0YzYdgpmXX2kacAhFaXcQmOEQjl1VXqyi0uYBZXbfjD0AWrEYcn7
        rYv7v6sZf5hIRnQEfOnBLoGKolJFnbU1aloZtKXZnw==
X-Google-Smtp-Source: AGHT+IEQGstDA8JwffvxCSPcbDgUpGjGd6rLABNANcEXtpu/LGpzu4TXy5LN2sB9T/MSJXebV7FWTA==
X-Received: by 2002:a05:6870:1814:b0:1da:ed10:bcb with SMTP id t20-20020a056870181400b001daed100bcbmr21682320oaf.31.1697002308056;
        Tue, 10 Oct 2023 22:31:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d26-20020a63735a000000b0058a381de499sm8416750pgn.77.2023.10.10.22.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 22:31:47 -0700 (PDT)
Message-ID: <65263343.630a0220.d2c98.7231@mx.google.com>
Date:   Tue, 10 Oct 2023 22:31:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.6-rc5-300-g24760d837661b
X-Kernelci-Report-Type: test
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 81 runs,
 21 regressions (v6.6-rc5-300-g24760d837661b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 81 runs, 21 regressions (v6.6-rc5-300-g24760d8=
37661b)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
         | 1          =

kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig =
         | 2          =

qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =

qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv3      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =

qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =

qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =

qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =

sun50i-h6-pine-h64         | arm64  | lab-clabbe    | gcc-10   | defconfig =
         | 1          =

sun50i-h6-pine-h64         | arm64  | lab-collabora | gcc-10   | defconfig =
         | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.6-rc5-300-g24760d837661b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.6-rc5-300-g24760d837661b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      24760d837661b7b6b1eae5077e0eb5762550ad9a =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
imx8mn-ddr4-evk            | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/652602784144b0b511efcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652602784144b0b511efcefe
        failing since 12 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b)

    2023-10-11T02:03:19.994774  / # #
    2023-10-11T02:03:21.149074  export SHELL=3D/bin/sh
    2023-10-11T02:03:21.154598  #
    2023-10-11T02:03:22.694345  / # export SHELL=3D/bin/sh. /lava-3800988/e=
nvironment
    2023-10-11T02:03:22.699910  =

    2023-10-11T02:03:25.507679  / # . /lava-3800988/environment/lava-380098=
8/bin/lava-test-runner /lava-3800988/1
    2023-10-11T02:03:25.513590  =

    2023-10-11T02:03:25.513815  / # /lava-3800988/bin/lava-te<3>[   22.4154=
47] caam_jr 30902000.jr: 20000256: CCB: desc idx 2: RNG: Prediction resista=
nce
    2023-10-11T02:03:25.516848  st-runner /lava-3800988/1
    2023-10-11T02:03:25.588653  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
imx8mp-evk                 | arm64  | lab-broonie   | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/652602d6be606cbd0fefcef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-broonie/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/652602d6be606cbd0fefcefe
        failing since 36 days (last pass: v6.5-5353-gb22935905f9c, first fa=
il: v6.5-12059-g16fdf769151b)

    2023-10-11T02:04:59.627390  + set<8>[   27.487928] <LAVA_SIGNAL_ENDRUN =
0_dmesg 163841_1.5.2.4.1>
    2023-10-11T02:04:59.630957   +x
    2023-10-11T02:04:59.735011  / # #
    2023-10-11T02:05:00.894311  export SHELL=3D/bin/sh
    2023-10-11T02:05:00.899996  #
    2023-10-11T02:05:02.391472  / # export SHELL=3D/bin/sh. /lava-163841/en=
vironment
    2023-10-11T02:05:02.397125  =

    2023-10-11T02:05:05.111414  / # . /lava-163841/environment/lava-163841/=
bin/lava-test-runner /lava-163841/1
    2023-10-11T02:05:05.117258  =

    2023-10-11T02:05:05.132142  / # /lava-163841/bin/lava-test-runner /lava=
-163841/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
kontron-pitx-imx8m         | arm64  | lab-kontron   | gcc-10   | defconfig =
         | 2          =


  Details:     https://kernelci.org/test/plan/id/65260254fb4b65426eefcf19

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65260254fb4b65426eefcf20
        new failure (last pass: v6.6-rc5-269-g00b249acca70)

    2023-10-11T02:02:37.879226  / # #
    2023-10-11T02:02:37.981551  export SHELL=3D/bin/sh
    2023-10-11T02:02:37.982321  #
    2023-10-11T02:02:38.083734  / # export SHELL=3D/bin/sh. /lava-385129/en=
vironment
    2023-10-11T02:02:38.084464  =

    2023-10-11T02:02:38.185844  / # . /lava-385129/environment/lava-385129/=
bin/lava-test-runner /lava-385129/1
    2023-10-11T02:02:38.186731  =

    2023-10-11T02:02:38.206323  / # /lava-385129/bin/lava-test-runner /lava=
-385129/1
    2023-10-11T02:02:38.246663  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-11T02:02:38.256281  + cd /l<8>[   16.182570] <LAVA_SIGNAL_START=
RUN 1_bootrr 385129_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/652=
60254fb4b65426eefcf30
        new failure (last pass: v6.6-rc5-269-g00b249acca70)

    2023-10-11T02:02:40.641649  /lava-385129/1/../bin/lava-test-case
    2023-10-11T02:02:40.641848  <8>[   18.662950] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-10-11T02:02:40.641977  /lava-385129/1/../bin/lava-test-case   =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv2        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6526011359358966b1efcf00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526011359358966b1efc=
f01
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv2-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/65260110f189b889e1efcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65260110f189b889e1efc=
ef8
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv3        | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6526011159358966b1efcefa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526011159358966b1efc=
efb
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm-virt-gicv3-uefi   | arm    | lab-baylibre  | gcc-10   | multi_v7_d=
efconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6526011259358966b1efcefd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526011259358966b1efc=
efe
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv2      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6526022a7130ee3fe2efcf2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526022a7130ee3fe2efc=
f2c
        failing since 12 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/652602297130ee3fe2efcf27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/652602297130ee3fe2efc=
f28
        failing since 12 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv3      | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65260228ad80f29415efcf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65260228ad80f29415efc=
f16
        failing since 12 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6526022cfb4b65426eefcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6526022cfb4b65426eefc=
ef6
        failing since 12 days (last pass: v6.5-rc2-295-ge510699ebeee, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_i386                  | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/6525fe67a60e5355a5efcefe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525fe67a60e5355a5efc=
eff
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_i386-uefi             | i386   | lab-baylibre  | gcc-10   | i386_defco=
nfig     | 1          =


  Details:     https://kernelci.org/test/plan/id/6525fe68a60e5355a5efcf01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525fe68a60e5355a5efc=
f02
        failing since 12 days (last pass: v6.5-rc2-353-g4b0f0b4c6081, first=
 fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_riscv64               | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6525ff1ce704d417e4efcf27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525ff1ce704d417e4efc=
f28
        failing since 12 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_smp8_riscv64          | riscv  | lab-baylibre  | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6525ff1ba076f957fcefcef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_ris=
cv64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_smp8_ris=
cv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525ff1ba076f957fcefc=
ef7
        failing since 12 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64                | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/6525fecc284d732b8defcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525fecc284d732b8defc=
ef4
        failing since 12 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/6525fecd284d732b8defcef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525fecd284d732b8defc=
ef8
        failing since 12 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-10   | x86_64_def=
config   | 1          =


  Details:     https://kernelci.org/test/plan/id/6525fecb6448132414efcf04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6525fecb6448132414efc=
f05
        failing since 12 days (last pass: v6.5-rc3-160-g3ab5fb77387e6, firs=
t fail: v6.6-rc3-321-gad82df6ef94b) =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
sun50i-h6-pine-h64         | arm64  | lab-clabbe    | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/65260273f0e6274f68efcf06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-=
h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65260273f0e6274f68efcf0f
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)

    2023-10-11T02:03:18.565673  / # #
    2023-10-11T02:03:18.667971  export SHELL=3D/bin/sh
    2023-10-11T02:03:18.668583  #
    2023-10-11T02:03:18.769619  / # export SHELL=3D/bin/sh. /lava-438004/en=
vironment
    2023-10-11T02:03:18.770213  =

    2023-10-11T02:03:18.871255  / # . /lava-438004/environment/lava-438004/=
bin/lava-test-runner /lava-438004/1
    2023-10-11T02:03:18.872188  =

    2023-10-11T02:03:18.875812  / # /lava-438004/bin/lava-test-runner /lava=
-438004/1
    2023-10-11T02:03:18.954753  + export 'TESTRUN_ID=3D1_bootrr'
    2023-10-11T02:03:18.955327  + cd /lava-438004/<8>[   19.191791] <LAVA_S=
IGNAL_STARTRUN 1_bootrr 438004_1.5.2.4.5> =

    ... (11 line(s) more)  =

 =



platform                   | arch   | lab           | compiler | defconfig =
         | regressions
---------------------------+--------+---------------+----------+-----------=
---------+------------
sun50i-h6-pine-h64         | arm64  | lab-collabora | gcc-10   | defconfig =
         | 1          =


  Details:     https://kernelci.org/test/plan/id/6526026dfb4b65426eefcf65

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.6-rc5-30=
0-g24760d837661b/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pi=
ne-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6526026dfb4b65426eefcf6e
        new failure (last pass: v6.3-rc6-279-g281ec23cca3f)

    2023-10-11T02:07:35.240738  / # #

    2023-10-11T02:07:35.342598  export SHELL=3D/bin/sh

    2023-10-11T02:07:35.343231  #

    2023-10-11T02:07:35.444518  / # export SHELL=3D/bin/sh. /lava-11733239/=
environment

    2023-10-11T02:07:35.445245  =


    2023-10-11T02:07:35.546733  / # . /lava-11733239/environment/lava-11733=
239/bin/lava-test-runner /lava-11733239/1

    2023-10-11T02:07:35.547852  =


    2023-10-11T02:07:35.588172  / # /lava-11733239/bin/lava-test-runner /la=
va-11733239/1

    2023-10-11T02:07:35.629502  + export 'TESTRUN_ID=3D1_bootrr'

    2023-10-11T02:07:35.630019  + cd /lava-11733239/1/tests/1_boot<8>[   18=
.286755] <LAVA_SIGNAL_STARTRUN 1_bootrr 11733239_1.5.2.4.5>
 =

    ... (11 line(s) more)  =

 =20
