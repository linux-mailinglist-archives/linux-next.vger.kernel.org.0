Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7322B1A7A
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 13:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgKMMCk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 07:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgKMMCU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2020 07:02:20 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A98C061A48
        for <linux-next@vger.kernel.org>; Fri, 13 Nov 2020 04:01:30 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id h6so6926664pgk.4
        for <linux-next@vger.kernel.org>; Fri, 13 Nov 2020 04:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1teYGlS5w3a6/tPQGwYUeo69alQhPrM92Y3Lf5I+2iE=;
        b=oDIY36TF5r9BoSRTTjJ5DWCqYPyW7pNATRaVn+jyqx9D56JAhf6gxq+FSjNp3JV1Av
         2kbeqbtWQ6TNBpTLBhr2b0QGToV4MonQ2LrioqWg/6dQDVs0i99gRRdEnrxapHq51wL8
         wq2I+TwJeTrQODCg8zaS9OXDcLp43Cub0hQTzUsKN43fSIF6lkVc8NJ1mQhe21UpL6YW
         PSsGKMAF6ZjQvIZXfqmTGFuTZ/Mok8VE7v0hXz9b4fSxLJPF85paYd93JaCTCeTrSmbs
         GzMsXTNBWNd4vALuy0xQ+Qd1VihR+xqkrVe8eGBWZ4hNw+SVuyqylPzEv9fXX7m8wICz
         vYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1teYGlS5w3a6/tPQGwYUeo69alQhPrM92Y3Lf5I+2iE=;
        b=m8uLrK55H3aV1Vp9O1JukhLOIsC0ybIwFRZsAStYdf1eh8uUF7TvHgzkgrjb9hx9gE
         W4zVLy85NxtCcap0zdnGgurg8awc79AsIeV7TMYmfahexEIbb6i1s9+X5RLHy5xL0dFu
         boR59msGO9nf5DP9RaYg3Avy/GTb72aDaHPpaoUlvPaG/mGp4PnCs7i04ONmh4VgkvQt
         M+uoYjYiJ7yLjT74mD544MxzjgOeNE4qe5rIaMg3IkEodFjMkscNR9UziBJ1Jz24KUJF
         lcGkP3h9LjsmF+ZRxz6/RQDSw2as6GAEFWcGvpdgkLc2zjxo8dHAduKEO3rzCiESxeqS
         vU5g==
X-Gm-Message-State: AOAM530u+SWqG1PPAqFIjKo7AkF6oZQElHIiZng5zAL0ZSTEHHKjf8E4
        bS8f3+cRCUqBzniY+gxKEh/4c/q2rRNRtQ==
X-Google-Smtp-Source: ABdhPJxA8++T+ReB5Rb0GzybqCWUcMlUs/icsK0i5FZAw/QV/F2jnP25tST9xqbCR5SRyw6xO1+c/g==
X-Received: by 2002:a62:e516:0:b029:156:3b35:9423 with SMTP id n22-20020a62e5160000b02901563b359423mr1790044pff.19.1605268886154;
        Fri, 13 Nov 2020 04:01:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q126sm9945302pfc.168.2020.11.13.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 04:01:25 -0800 (PST)
Message-ID: <5fae7595.1c69fb81.60a38.4742@mx.google.com>
Date:   Fri, 13 Nov 2020 04:01:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20201113
Subject: next/master baseline: 656 runs, 15 regressions (next-20201113)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 656 runs, 15 regressions (next-20201113)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =

bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | clang-11 | defconfig  =
                  | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201113/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201113
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      92edc4aef86780a8ad01b092c6d6630bb3cb423d =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | bcm2835_def=
config            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae44823818ee918adb8863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae44823818ee918adb8=
864
        failing since 16 days (last pass: next-20201027, first fail: next-2=
0201028) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae47512817730185db8865

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae47512817730185db8=
866
        failing since 43 days (last pass: next-20200929, first fail: next-2=
0200930) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae40b414415cbe31db8880

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fae40b414415cbe=
31db8883
        new failure (last pass: next-20201112)
        2 lines

    2020-11-13 08:13:02.409000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-13 08:13:02.409000+00:00  (user:khilman) is already connected
    2020-11-13 08:13:18.737000+00:00  =00
    2020-11-13 08:13:18.738000+00:00  =

    2020-11-13 08:13:18.738000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-13 08:13:18.738000+00:00  =

    2020-11-13 08:13:18.738000+00:00  DRAM:  948 MiB
    2020-11-13 08:13:18.754000+00:00  RPI 3 Model B (0xa02082)
    2020-11-13 08:13:18.841000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-13 08:13:18.873000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (387 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-ls1088a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae3fb910b60de7d2db8863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae3fba10b60de7d2db8=
864
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | clang-10 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae3ff76fd7d17d05db88c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae3ff76fd7d17d05db8=
8c3
        failing since 1 day (last pass: next-20201111, first fail: next-202=
01112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae42776b6d4d2182db8857

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae42776b6d4d2182db8=
858
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
fsl-lx2160a-rdb            | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae458aa1c2c4cbbcdb885b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae458aa1c2c4cbbcdb8=
85c
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-sabresd              | arm   | lab-nxp       | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae40961e4dad0fa6db886b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae40961e4dad0fa6db8=
86c
        failing since 18 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae4251574129d3addb885f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae4251574129d3addb8=
860
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-10 | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae468c22fc2f50cedb8863

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae468c22fc2f50cedb8=
864
        failing since 1 day (last pass: next-20201109, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | clang-11 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae4459b145b6a6c4db8856

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201103062553+ef4ff=
cafbb2-1~exp1~20201103053214.125)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae4459b145b6a6c4db8=
857
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae4279cc217c21fcdb8855

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae4279cc217c21fcdb8=
856
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx8mp-evk                 | arm64 | lab-nxp       | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae48a71d15f5a28ddb8861

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae48a71d15f5a28ddb8=
862
        failing since 1 day (last pass: next-20201110, first fail: next-202=
01111) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae42c1a8aa45a541db88c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae42c1a8aa45a541db8=
8c7
        new failure (last pass: next-20201112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64-model-b | arm64 | lab-baylibre  | gcc-8    | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fae42d46e898a7ee9db895c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fae42d46e898a7ee9db8=
95d
        failing since 1 day (last pass: next-20201110, first fail: next-202=
01111) =

 =20
