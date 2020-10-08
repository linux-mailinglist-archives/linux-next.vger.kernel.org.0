Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E930287B0C
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 19:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbgJHReG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 13:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731239AbgJHReG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 13:34:06 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3ED5C061755
        for <linux-next@vger.kernel.org>; Thu,  8 Oct 2020 10:34:05 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d23so3100007pll.7
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2020 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Oknmj3IGIlY4nvb2zZ39uXGCBqx3JblJP7ok85lAWmQ=;
        b=Ohp6AndPoStTdjEW325flkuBUskZMPmP/C+ls9z0cTdhlqeSax+fb+1vJ+PmcSuC0M
         nB80Yo1Dd1PqdrV6FERvr+DJzZWSoM9SoKZtX9vFBRy2FSFIdJ2/1yfFhPo0MXnmwxJW
         +24uQ8BP2VoePc3r+RrSn/mrG5izrewYyWZYyekiUvYhTPTjhG5g3g1FgKss573vXals
         nXJyajSW0MuDOxjU1EKlTS/wp4+f5gqx27+Pz++Yv0BJTOaa+d9PBLlpD8z+IPo4q7LF
         EjMhRa46tGmbh9pCOMqGA/qDJUjmrwO8I8b7F8e5uXm04dveFtpHLnaeaih4ozLb2A3U
         wKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Oknmj3IGIlY4nvb2zZ39uXGCBqx3JblJP7ok85lAWmQ=;
        b=CcqYGOc/zGt/oqNJlo39plZv8+G3E2rzaochVvT6YrIz6tHSk/x5dRgIdo7V7LZIAM
         K9FG+dBEy6y1H01M7gFWV8sUz4I5TFiOuZViD83zSfy1asShQ4WIUo1tIzI3IhFICFxa
         36lbj4OsnQUUzQPCcUkLcr7rhuwa7u5AryB2C7GFbHH/SDNV4Gi943LWlEL7IVZl4kRG
         mOr8QDzu10qvouruqkHaEE3H4c76Vv2s+1/8ytbc4XV+TySTF5EUtcW94GbtbXx7nIdH
         KVCrLGMSIRiUwU7zZadQCHXzgCFz1dZVMw2nD6R3xlIPJTrvvpv3kRtvJ3bzrVYe+25P
         n4JA==
X-Gm-Message-State: AOAM532kbdeIRDg1eaui/s70kZV+nLbTd4nOqKHyoPZKjz49rCoMpcIH
        0EfnpuIKkK+GJ+nSvBIv8J0QZMB9bzq/kA==
X-Google-Smtp-Source: ABdhPJzWF7NepzD1YKQ5/7kL1WDPkdnrlPgwhFR/8akKy2tM4uUg+W4OP6vcZMapE4XF53KznkI61Q==
X-Received: by 2002:a17:902:7209:b029:d3:f65f:961c with SMTP id ba9-20020a1709027209b02900d3f65f961cmr6606919plb.27.1602178445066;
        Thu, 08 Oct 2020 10:34:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6sm2926888pfq.140.2020.10.08.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 10:34:04 -0700 (PDT)
Message-ID: <5f7f4d8c.1c69fb81.9dc3e.47fa@mx.google.com>
Date:   Thu, 08 Oct 2020 10:34:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201008
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 466 runs, 5 regressions (next-20201008)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 466 runs, 5 regressions (next-20201008)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201008/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201008
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e4fb79c771fbe2e6fcb3cffa87d5823a9bbf3f10 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7f0fb7af04416f744ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201008/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201008/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7f0fb7af04416f744ff=
3ea
      failing since 163 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7ef90da83e6793bb4ff3e1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7ef90da83e6793=
bb4ff3e5
      failing since 6 days (last pass: next-20200930, first fail: next-2020=
1001)
      3 lines

    2020-10-08 11:30:41.124000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-08 11:30:41.124000  (user:khilman) is already connected
    2020-10-08 11:30:56.898000  =00
    2020-10-08 11:30:56.899000  =

    2020-10-08 11:30:56.899000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-08 11:30:56.900000  =

    2020-10-08 11:30:56.900000  DRAM:  948 MiB
    2020-10-08 11:30:56.914000  RPI 3 Model B (0xa02082)
    2020-10-08 11:30:57.001000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-08 11:30:57.032000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (391 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f7ef47ba1c53a68b94ff3ec

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201008/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201008/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f7ef47ba1c53a68=
b94ff3f0
      failing since 1 day (last pass: next-20201006, first fail: next-20201=
007)
      4 lines  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7f09ecf463e713494ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201008/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201008/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7f09ecf463e713494ff=
3ea
      failing since 28 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f7f10d7f0a57a02304ff3fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201008/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201008/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f7f10d7f0a57a02304ff=
3fb
      failing since 78 days (last pass: next-20200706, first fail: next-202=
00721)  =20
