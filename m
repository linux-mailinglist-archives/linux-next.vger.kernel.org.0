Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495C0226D52
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 19:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbgGTRmn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 13:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729786AbgGTRmn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 13:42:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB53C061794
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 10:42:43 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id md7so189593pjb.1
        for <linux-next@vger.kernel.org>; Mon, 20 Jul 2020 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xKCkTQzpEw0+vhMirVdOzidvMpE4N7o5a3fZAWpoqCI=;
        b=e6qWhi2JNXaTxT+Mm5LY2rU8qF0P46YCX22orwHvr1gYItSGfJ55AH/YRLudDHHyeD
         nBEEc608TyKeDTvwKcu4XMJ32Ipdkbdgq/8mIJtXJxQ6WziiROLGaeQkUflzm4/ms7gW
         2Qgb6yldHddsxXYfcItwVVJoLNPiqWg7E/4kXlysW4V4mE2AahPc5+fxiIGbUZvJEUxB
         AEgnLNpz2ebNEpp/C7TxPn56jBQw3ndDqJ7uSnPqlLfGZ/n66OFvbF1ieDSG6pNbDelK
         APXz3roYWAzbG4FwoOeLvXS/Dj/8x1hg+AlyFLUmIq481V/fTcEvktUrn3XEbEBCt2W4
         ROkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xKCkTQzpEw0+vhMirVdOzidvMpE4N7o5a3fZAWpoqCI=;
        b=i23Z+24LYY7FzsA52iGRNQsyzZ67czFqBszdCxVlEUqDRomcs1JBUk/jU37pQgoesb
         z837niDmHRmhpWh0C+2ALTcMX9tlrzyZj0NsMvaDpKazqpmTyKCUXur5k+RYxLP9E2Dg
         oxLWV8ClklS4gLSmX5U6NU6teNDc7ptO2KntuP+blzq4dqEIvrmV6FYcdzrvC38C8QR2
         pauf63givUyVQf/lpLYs7VP2HTuzkSJ80F8D2vqGXSLyt5CzAUHD8dq3TJBct6CPYdAI
         QsMSfhy4kv44Y1qKlCRYpxwgNj82pys/x+XW0mMv+qXiVOlLfvTOOmKgfwxbeOnom78h
         pMaQ==
X-Gm-Message-State: AOAM5301d5Ls2JjSVZ8/FzkZG09oqsESGFxZUIukROF+pgVmd7FFjZSx
        J5AzGWIOp0Eay6GOPYqR7IU+9yrwCGQ=
X-Google-Smtp-Source: ABdhPJyyAcXsE7EamkU/ktXtzgrldTF/M47+24LohrB9Tfdjar1ajs3+hwrPf/zKZrMnZmDfycMtHw==
X-Received: by 2002:a17:90b:19c5:: with SMTP id nm5mr496972pjb.155.1595266961764;
        Mon, 20 Jul 2020 10:42:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a16sm15966554pgj.27.2020.07.20.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 10:42:40 -0700 (PDT)
Message-ID: <5f15d790.1c69fb81.1d85a.306c@mx.google.com>
Date:   Mon, 20 Jul 2020 10:42:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200720
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 247 runs, 31 regressions (next-20200720)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 247 runs, 31 regressions (next-20200720)

Regressions Summary
-------------------

platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre | clang-10 | defconfig    =
                | 4/5    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b           | arm64 | lab-baylibre | gcc-8    | defconfig    =
                | 4/5    =

imx6q-var-dt6customboard  | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

meson8b-odroidc1          | arm   | lab-baylibre | clang-10 | multi_v7_defc=
onfig           | 3/5    =

meson8b-odroidc1          | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 3/5    =

meson8b-odroidc1          | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/5    =

omap4-panda               | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

omap4-panda               | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda               | arm   | lab-baylibre | gcc-8    | omap2plus_def=
config          | 0/1    =

sun50i-a64-bananapi-m64   | arm64 | lab-clabbe   | clang-10 | defconfig    =
                | 0/1    =

sun50i-a64-bananapi-m64   | arm64 | lab-clabbe   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre | clang-10 | defconfig    =
                | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig    =
                | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig              | 0/1    =

sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | sunxi_defconf=
ig              | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig              | 0/1    =

vexpress-v2p-ca15-tc1     | arm   | lab-baylibre | gcc-8    | vexpress_defc=
onfig           | 3/5    =

vexpress-v2p-ca15-tc1     | arm   | lab-cip      | gcc-8    | vexpress_defc=
onfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200720/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200720
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ab8be66e724ecf4bffb2895c9c91bbd44fa687c7 =



Test Regressions
---------------- =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159d8bacff74fba685bb23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159d8bacff74fba685b=
b24
      failing since 83 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre | clang-10 | defconfig    =
                | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f15a6e398381f83a585bb57

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f15a6e398381f83=
a585bb5a
      new failure (last pass: next-20200717)
      2 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f159e97a6a379247f85bb26

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f159e97a6a37924=
7f85bb29
      failing since 5 days (last pass: next-20200714, first fail: next-2020=
0715)
      2 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b           | arm64 | lab-baylibre | gcc-8    | defconfig    =
                | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f15a2b209f315a50685bb20

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f15a2b209f315a5=
0685bb23
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717)
      2 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard  | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a222f662b4813485bb40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a222f662b4813485b=
b41
      failing since 14 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
meson8b-odroidc1          | arm   | lab-baylibre | clang-10 | multi_v7_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f15a2577a5c571d3885bb22

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f15a2577a5c571=
d3885bb26
      new failure (last pass: next-20200716)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f15=
a2577a5c571d3885bb27
      new failure (last pass: next-20200716)
      53 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
meson8b-odroidc1          | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f159d05277c2cb30585bb2b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f159d05277c2cb=
30585bb2f
      new failure (last pass: next-20200717)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f15=
9d05277c2cb30585bb30
      new failure (last pass: next-20200717)
      49 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
meson8b-odroidc1          | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f15a0fb01d94777cd85bb18

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f15a0fb01d9477=
7cd85bb1c
      new failure (last pass: next-20200717)
      4 lines* baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f15=
a0fb01d94777cd85bb1d
      new failure (last pass: next-20200717)
      49 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
omap4-panda               | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f159d8aacff74fba685bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f159d8aacff74f=
ba685bb1c
      failing since 6 days (last pass: next-20200713, first fail: next-2020=
0714)
      60 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
omap4-panda               | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f15a1520e4e8aad8985bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f15a1520e4e8aa=
d8985bb1c
      failing since 5 days (last pass: next-20200710, first fail: next-2020=
0715)
      60 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
omap4-panda               | arm   | lab-baylibre | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a09e5979c316ff85bb25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a09e5979c316ff85b=
b26
      failing since 4 days (last pass: next-20200706, first fail: next-2020=
0716) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-bananapi-m64   | arm64 | lab-clabbe   | clang-10 | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a78ef4566f98fb85bb3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a78ef4566f98fb85b=
b3f
      new failure (last pass: next-20200717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-bananapi-m64   | arm64 | lab-clabbe   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159f162ee83553bb85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159f162ee83553bb85b=
b19
      failing since 3 days (last pass: next-20200715, first fail: next-2020=
0716) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre | clang-10 | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a8b79c0175bc6a85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a8b79c0175bc6a85b=
b19
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159dfc6637b8b70285bb3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159dfc6637b8b70285b=
b3e
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159fab2f1ba95e3c85bb1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159fab2f1ba95e3c85b=
b1d
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus    | arm64 | lab-baylibre | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a439dfabeda24485bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a439dfabeda24485b=
b19
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159dc04a6a623af185bb1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159dc04a6a623af185b=
b20
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a0e4a1069ebccb85bb3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a0e4a1069ebccb85b=
b3c
      failing since 2 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159dc0acff74fba685bb2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159dc0acff74fba685b=
b2e
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a0f351b78ade3f85bb57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a0f351b78ade3f85b=
b58
      failing since 2 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15972ab6a9047ef985bb2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15972ab6a9047ef985b=
b30
      new failure (last pass: next-20200717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2     | arm   | lab-clabbe   | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15973654cf27e8d185bb3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15973654cf27e8d185b=
b3d
      new failure (last pass: next-20200717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f159e17388a7c10dc85bb5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f159e17388a7c10dc85b=
b5c
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15a14f86365e52b985bb28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15a14f86365e52b985b=
b29
      failing since 2 days (last pass: next-20200715, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
sun7i-a20-olinuxino-lime2 | arm   | lab-baylibre | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f15978d796ba7b0f785bb5b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f15978d796ba7b0f785b=
b5c
      failing since 2 days (last pass: next-20200716, first fail: next-2020=
0717) =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
vexpress-v2p-ca15-tc1     | arm   | lab-baylibre | gcc-8    | vexpress_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f159bf4839a08830e85bb18

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f159bf4839a0883=
0e85bb1b
      failing since 44 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                  | arch  | lab          | compiler | defconfig    =
                | results
--------------------------+-------+--------------+----------+--------------=
----------------+--------
vexpress-v2p-ca15-tc1     | arm   | lab-cip      | gcc-8    | vexpress_defc=
onfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f159bf6839a08830e85bb21

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200720/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200720/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f159bf6839a0883=
0e85bb24
      failing since 44 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
