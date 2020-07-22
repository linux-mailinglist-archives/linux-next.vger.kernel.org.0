Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A43B228F23
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 06:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgGVE0r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 00:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgGVE0q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 00:26:46 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84410C061794
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2020 21:26:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id s26so513332pfm.4
        for <linux-next@vger.kernel.org>; Tue, 21 Jul 2020 21:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=smCpVkP8doQT3KLAiNcQE1eq07hOtYYib5XIvSoP++g=;
        b=SmRuMbk6xieL1K/pCNNAX7IF1eYR6J6qDhb3VEvukdu4mtQthHYOBA8Gs/2wbV1KXL
         Bz0Ldn8drIN4HJrZhk1xB9tMjjR+KIRYlnq+CWqKMRuaNV00AoymC1gEOHVrn8vjOKfa
         dXr/IiYHTFVst1moej+iXZmRCYWQWMoE/KofPkasEzhOZKkzJwny2PK9OEEtaIOwJo6p
         Y1BpuSYkhexCfi/0GqZ7N9uT+l+WqEjxiJJnMSpTYZ3V6PAAIO6e9ulDD+qzBvlDmbic
         Ptudp7/nkxCrhaqVsqjNqBc/lJyIgVDUhoauW+WErIiMzb1+GhaJjUtkuvxXVpdik7pb
         B9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=smCpVkP8doQT3KLAiNcQE1eq07hOtYYib5XIvSoP++g=;
        b=TW7gc66kk2MdoWAwd16b5CHlsSncGJtLKBADc7eEBL07GHfgKx2bvgMYmU4cTRe4tf
         XDMivNwzbXHl+X8Grg6ZKyPUqccG6FIFBlPsTReXePpb/9x8d6YTnsGJy4uTOLq95AzE
         aVMnsrq3bNH+vw73oQg3v30E9eGiCH9yerT0zsYRkT0S3beMdAOMjeKpHpyhwQB32i6W
         Up+GAlMP9HltzLrDmdd3TMc7Q4z8vZppudCtW3x1+IKNoE+OSmNshOPzux2zVSlNMc3P
         BzAW+Zo1AkAkHpG/cWfXeuAu8zt3TFnqgfoGNjA4iInApcX+un4LTM3X/bpksZWXlBnJ
         PwoA==
X-Gm-Message-State: AOAM531GlhBYc+10Hf/NuWi4ZHaln4NcVaKHUbuDDLGfCBCWbElZDksh
        9rCkAZ6dHD0LhI/n5DCdOXNYuZeTJTo=
X-Google-Smtp-Source: ABdhPJw4WLiRr/qC8USU9Z4C9f8jRww4LBSxaJD9OlUJhXAUy37LrjmYi0Idn5L5u6Q5ubf4pgI6Yw==
X-Received: by 2002:a63:417:: with SMTP id 23mr23890301pge.44.1595392004891;
        Tue, 21 Jul 2020 21:26:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 200sm22426095pfy.57.2020.07.21.21.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 21:26:44 -0700 (PDT)
Message-ID: <5f17c004.1c69fb81.7885e.63da@mx.google.com>
Date:   Tue, 21 Jul 2020 21:26:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200721
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 301 runs, 17 regressions (next-20200721)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 301 runs, 17 regressions (next-20200721)

Regressions Summary
-------------------

platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 4/5    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =

exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =

meson8b-odroidc1          | arm   | lab-baylibre  | clang-10 | multi_v7_def=
config           | 3/5    =

omap4-panda               | arm   | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 0/1    =

omap4-panda               | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 0/1    =

sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | gcc-8    | defconfig   =
                 | 0/1    =

sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | clang-10 | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-clabbe    | gcc-8    | sunxi_defcon=
fig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200721/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200721
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      de2e69cfe54a8f2ed4b75f09d3110c514f45d38e =



Test Regressions
---------------- =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre  | gcc-8    | sama5_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f178204d268b5bc1985bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f178204d268b5bc1985b=
b1e
      failing since 84 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f178405081a65877e85bb40

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f178405081a6587=
7e85bb43
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717)
      1 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f178f35ec171725c485bb38

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f178f35ec171725=
c485bb3b
      failing since 6 days (last pass: next-20200714, first fail: next-2020=
0715)
      2 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
exynos5422-odroidxu3      | arm   | lab-collabora | gcc-8    | exynos_defco=
nfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f17882b64dc923cd885bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f17882b64dc923cd885b=
b28
      new failure (last pass: next-20200630) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
meson8b-odroidc1          | arm   | lab-baylibre  | clang-10 | multi_v7_def=
config           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f178c1895f5b3d38c85bb2d

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f178c1895f5b3d=
38c85bb31
      failing since 1 day (last pass: next-20200716, first fail: next-20200=
720)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f17=
8c1895f5b3d38c85bb32
      failing since 1 day (last pass: next-20200716, first fail: next-20200=
720)
      53 lines =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1785ce3784323dcd85bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1785ce3784323dcd85b=
b31
      new failure (last pass: next-20200706) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
omap4-panda               | arm   | lab-collabora | gcc-8    | omap2plus_de=
fconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f17858a64a681e0e485bb2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f17858a64a681e0e485b=
b2b
      new failure (last pass: next-20200706) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1784c7131e60c95e85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1784c7131e60c95e85b=
b23
      new failure (last pass: next-20200720) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-bananapi-m64   | arm64 | lab-clabbe    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f178fba33e6da748b85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f178fba33e6da748b85b=
b19
      failing since 5 days (last pass: next-20200715, first fail: next-2020=
0716) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | clang-10 | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f178ce86b6fa5acc585bb3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f178ce86b6fa5acc585b=
b3f
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1785e0d9a9260a0185bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1785e0d9a9260a0185b=
b19
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1790565672e909ef85bb29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1790565672e909ef85b=
b2a
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1791c8a2f06a15d285bb44

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1791c8a2f06a15d285b=
b45
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f178778cae009abff85bb38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f178778cae009abff85b=
b39
      failing since 1 day (last pass: next-20200717, first fail: next-20200=
720) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-clabbe    | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1787796c73f51dda85bb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1787796c73f51dda85b=
b2d
      failing since 1 day (last pass: next-20200717, first fail: next-20200=
720) =



platform                  | arch  | lab           | compiler | defconfig   =
                 | results
--------------------------+-------+---------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre  | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1787ceef82d5076d85bb39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200721/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1787ceef82d5076d85b=
b3a
      failing since 4 days (last pass: next-20200716, first fail: next-2020=
0717) =20
