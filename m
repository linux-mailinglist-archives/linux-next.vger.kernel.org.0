Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466EC1F76F9
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 12:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgFLK5m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 06:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgFLK5l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2020 06:57:41 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CDCC03E96F
        for <linux-next@vger.kernel.org>; Fri, 12 Jun 2020 03:57:41 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id m7so3604767plt.5
        for <linux-next@vger.kernel.org>; Fri, 12 Jun 2020 03:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9zwI3wZYg7XRmd3uB/TGZucTrc2mG1tiF2qfdrUK3Ok=;
        b=Hf3dY/mYjGIVIzzXbpFObPiBNxZB0R/j9GbPhClIbbPI8dae3c0iTWAPc4QbroX0C+
         Jv3T899aFWbGFLxMxhoNJ2L2tLbqD93Ge0W3BSEf4iiS8r4YZGvg/GaIqM2qGTceMKOT
         phOHczq/Q1Z5RgVhFsMxiC33f/BFkDCw04CV8m2ranU+oVvzZMASUGLFLX2dCkZ+Bx7D
         WnkdZ15TlGuGyRS869XSn6LZb1FEdAm152UFkiyLcHZhLljZ1Eplz9u00An/7ddoJHiL
         8hVwUtpCOhOOheHJgB0uVSv6LhLgZfj/PZtvW7gGKBf+Xx+v6hnTx41pMw1PSLg9vYrS
         JUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9zwI3wZYg7XRmd3uB/TGZucTrc2mG1tiF2qfdrUK3Ok=;
        b=KeNxuB9b7izR0WEIF4V3UHUN6g79TR2sV1E96uZIi69aTwNYh95cQFkyf7wU8BclMF
         gTlAW86kKKi74kxPTaQbM2Ns+ZXxsvOBnvVJIygCIvmxg/9kONWJk6Fj3gwSVPwhAbYh
         Pa3C6mljgTxgNyPdN1eG6tsCy87DbSg2z4rgiGqtn1BUto9D04jhUNEK2xORDrhYsQZL
         oPNhgS0CCkRKcTtet8GOx97FaAZbQFhwGUETX5mcZFoetgvYRDQSanHfL0cbYOryC6J1
         WR+Tb9+SSFmCWzYZK9u2ZuGqrj1AcnqD29cq/2roxtVRNdN6Fc4flW6MOq2NSy4UHzGD
         oC8Q==
X-Gm-Message-State: AOAM533KRmMFfEisE0hXBv0fOGDP9UtYGoaAafpTDeyWgZFgjHPnDe+w
        RpPtK3zLez8IukKjcMaSw2fk2FIwawQ=
X-Google-Smtp-Source: ABdhPJyjbKT0nj1jFuOP2c0bJ2WTXIIRYH51hjBVKUIDtCEkpKI3pv7WUd1A41eAQf2TF1vC5aLn7A==
X-Received: by 2002:a17:90a:e384:: with SMTP id b4mr11273787pjz.134.1591959460197;
        Fri, 12 Jun 2020 03:57:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r24sm4975799pgm.25.2020.06.12.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 03:57:39 -0700 (PDT)
Message-ID: <5ee35fa3.1c69fb81.717d1.0054@mx.google.com>
Date:   Fri, 12 Jun 2020 03:57:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200612
Subject: next/master baseline: 126 runs, 7 regressions (next-20200612)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 126 runs, 7 regressions (next-20200612)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | sama5_def=
config              | 0/1    =

bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =

hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-8    | defconfig=
                    | 0/1    =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =

qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig             | 0/1    =

vexpress-v2p-ca15-tc1        | arm    | lab-baylibre | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200612/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200612
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fd0fb6a88ce21de22a2ee9693ddb03d63fd9ef2b =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee3289aadd25e375397bf0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee3289aadd25e375397b=
f0b
      new failure (last pass: next-20200610) =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | sama5_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee3218a790fd75ee297bf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee3218a790fd75ee297b=
f13
      failing since 44 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee322a5cd2357ab2997bf0e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee322a5cd2357ab=
2997bf11
      failing since 2 days (last pass: next-20200608, first fail: next-2020=
0609)
      1 lines =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee3228c43f8bc8e4697bf2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee3228c43f8bc8e4697b=
f2f
      new failure (last pass: next-20200609) =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee328679c104605fa97bf13

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee328679c10460=
5fa97bf18
      new failure (last pass: next-20200611)
      2 lines =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee31fe10e3a0cdf2697bf16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee31fe10e3a0cdf2697b=
f17
      new failure (last pass: next-20200611) =



platform                     | arch   | lab          | compiler | defconfig=
                    | results
-----------------------------+--------+--------------+----------+----------=
--------------------+--------
vexpress-v2p-ca15-tc1        | arm    | lab-baylibre | gcc-8    | vexpress_=
defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee31ccfdffe2dd31c97bf24

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200612/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200612/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee31ccfdffe2dd3=
1c97bf27
      failing since 6 days (last pass: next-20200604, first fail: next-2020=
0605)
      2 lines =20
