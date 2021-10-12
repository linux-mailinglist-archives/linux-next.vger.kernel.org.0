Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 734A6429C1E
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 05:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232164AbhJLDzY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 23:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbhJLDzY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 23:55:24 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5187EC061570
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 20:53:23 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so1505991pjb.4
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0prb77PG9Mt/W2RBqjFWsMHbE7mo9gE7GVNERPgHv4g=;
        b=YdDpj5yjR//qTADLtW2+XI4F0yHl+c9icuDDvuexjRp9psJcdZiSnfp3nVTb0zgZSN
         qmGDWonHeTnlkcsFP90Gy3IeXjZgRbxngYzUEYZf/83s1AslW8BTQxDZxgUFOiP30Cq4
         NRrZg9MI2+YPNfx82kVcw60qSBQSq58Lh5IqluhR69Obj8HGDOdImJYP/+YbtAhSPgzh
         bihVAtMQCjjuFYdbfv8XmiJJ6OCe3qNfRl8XC0sDUyQe3iyBesmmVmHtT4bxLBbcFXMc
         J4pn4igfBsD9dusB82NLwisAHvzp9lwII9gxFEDuRa0VgGTjoMFB7825XthI84mR/7Qo
         LSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0prb77PG9Mt/W2RBqjFWsMHbE7mo9gE7GVNERPgHv4g=;
        b=UKAF3tO5bnuI3v54qAQjM9jofSzzMpegZPT61j0B3k5ef3XNpxn3HyvgUTXfvZnexi
         WGuu2hg0/EBNuSfMd/c9HxEREy8fQemsy6HONI8aXa0C0C9iHPbeqTK2FabQcamNqhig
         i3B3Mq9MXnFmd7SN3a1fxoC+olABK7pYAb8OACauCF7oGzpYbhe2yAGAaLIJmEXPX0Tq
         MwYO1zgplxIzFg3wdfxBO4iu7SaIvnC5Eap067A5dtYUM/U5VpvyOJ4rxI35F14e9Zzs
         wPd6/4zvvzJJlnUHhfJp7Ks3xY8sko1tZ+Te2brr7Zx8mtdrqvPF/LRKwEVuJhNjpFjD
         vcuA==
X-Gm-Message-State: AOAM532esExDDF2Q/xlk32atYXImsPnHcz6fdFeGfb9m6mkY/oUXmenP
        V4HDWBsMaVHM06ayVuwz3inVQDGVrajhZ3Wf
X-Google-Smtp-Source: ABdhPJzfqNApPV0D1K8CbEV7wkK1AwgOPplfRy8p2EDop7m/VUF8jZHrMAzRRCP7joj5Ld6cPKbf1A==
X-Received: by 2002:a17:902:bd45:b0:13d:b4d1:eb39 with SMTP id b5-20020a170902bd4500b0013db4d1eb39mr27726677plx.53.1634010802602;
        Mon, 11 Oct 2021 20:53:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id qe17sm938038pjb.39.2021.10.11.20.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 20:53:22 -0700 (PDT)
Message-ID: <616506b2.1c69fb81.fc70f.49d9@mx.google.com>
Date:   Mon, 11 Oct 2021 20:53:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20211011
Subject: next/master baseline: 309 runs, 12 regressions (next-20211011)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 309 runs, 12 regressions (next-20211011)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =

imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-8    | oxnas_v6_=
defconfig           | 1          =

rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211011/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211011
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d3134eb5de8546a214c028fb7195e764b89da7d4 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6164c8144e1f1d32ca08fab4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164c8144e1f1d32ca08f=
ab5
        failing since 229 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6164bb526611bd834408fab3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164bb526611bd834408f=
ab4
        failing since 3 days (last pass: next-20211006, first fail: next-20=
211008) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6164c69492b98b3cf208fabe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164c69492b98b3cf208f=
abf
        failing since 7 days (last pass: next-20210930, first fail: next-20=
211001) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d14bcaf1545a6908facc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d14bcaf1545a6908f=
acd
        new failure (last pass: next-20211008) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d34a4a2e45b21a08fada

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d34a4a2e45b21a08f=
adb
        failing since 325 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164b96db8f38e462c08fad9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164b96db8f38e462c08f=
ada
        failing since 164 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
hip07-d05                    | arm64 | lab-collabora | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d29526eb71c17108fabb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d29526eb71c17108f=
abc
        failing since 103 days (last pass: next-20210624, first fail: next-=
20210629) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm   | lab-nxp       | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6164c0d6c74f7fbcc808faae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164c0d6c74f7fbcc808f=
aaf
        failing since 350 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64 | lab-nxp       | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d39901141607d908faac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d39901141607d908f=
aad
        new failure (last pass: next-20211007) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre  | gcc-8    | oxnas_v6_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6164bed2752f1c467708fab4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164bed2752f1c467708f=
ab5
        failing since 4 days (last pass: next-20211006, first fail: next-20=
211007) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3328-rock64                | arm64 | lab-baylibre  | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d271d0c25d818808fabc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d271d0c25d818808f=
abd
        failing since 21 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6164d26ffcd496ba3408face

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211011/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6164d26ffcd496ba3408f=
acf
        failing since 4 days (last pass: next-20211006, first fail: next-20=
211007) =

 =20
