Return-Path: <linux-next+bounces-359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742780ED7D
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 14:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095672810B6
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B314161698;
	Tue, 12 Dec 2023 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="B1ws8vUW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54C883
	for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 05:26:52 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5c629a9fe79so3005515a12.3
        for <linux-next@vger.kernel.org>; Tue, 12 Dec 2023 05:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1702387612; x=1702992412; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAZuyLOSdh++ppEMuo25W8Bi8SGDtewKo43ySrj9t8w=;
        b=B1ws8vUWF9jEdHxxq8g7LrHUESfSlla3XoGUsSN3X8s2o0wHXKrZIoAG/2GOAikX+l
         cLMKhQL2fVGIGk7xHeWt8C4JDND5A5ya05UQb5AqqTD4B71B52jqSjTlHsg09zVdVx6z
         TzfkjJRcoRav9FuD0rv6ZW3f3eOyOYk5AUbjrWjaHpSxlAwcNGEAjP3KHm17enBZ49GH
         f6FSiqDUkr/2et5upbcB+KV/yo3ACHhsbRZjTADFtRbOPIpX8IpeZXNhXVG/CCyBPh/b
         5mH4X12aDCGFD4DPl2xfzs574yEds9iTRXGnw4pVIJezxuCHWVwefbSfRzunSCu8r3i2
         AuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387612; x=1702992412;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAZuyLOSdh++ppEMuo25W8Bi8SGDtewKo43ySrj9t8w=;
        b=pNjyCAd6i1vBTUOdyuWqEkoPF59rwXVPkzjPDyuuPq5JFD2qsRNP7PmHX4S6Bzi2WJ
         rn9Ed2foSn5/92kDipN9GooIUBoQW1rDI6kqzUb4+JkmF6IOr7FGCi4ykF7aFrsa3AjZ
         nTufKpKRjUxiOCQISilKRvvvP8xAkWVqw/yqL6xLU96kKi6pW2bL1k2J6zdHbbqriTuK
         Gi1225s3nAFz67Za7Li7WnAAzsnhZVMQlWgVCiYVAEaWRfTK3hsJ2vSjBOssEWH0YvYU
         DthOcCbSnDjhvpAYMn2UZg67tMLgKK1QIFNxhd/qQRoEEaDe6YhYVqaVGHq+TVTyrHgh
         z5YQ==
X-Gm-Message-State: AOJu0YxrYjlfquDoxnAGVIEIIZz9xA5pFdRX/xHsaMRvoKpvzq8IV/dj
	wX18qSB2kmjRXg9iRsHOTZ35jH9j3CDlPzFBZEWNtg==
X-Google-Smtp-Source: AGHT+IFEZQ5LABnh6aEHsDAP2qLkEKmGjaNYdZY/C3/tdYBs2nRhdV+s7DuzLmgpybvwBz69VeBF/w==
X-Received: by 2002:a05:6a20:e116:b0:190:a4d:b5cf with SMTP id kr22-20020a056a20e11600b001900a4db5cfmr3883428pzb.48.1702387610975;
        Tue, 12 Dec 2023 05:26:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p51-20020a056a0026f300b006cef5c09ca3sm795944pfw.147.2023.12.12.05.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:26:50 -0800 (PST)
Message-ID: <65785f9a.050a0220.aac3a.1a0c@mx.google.com>
Date: Tue, 12 Dec 2023 05:26:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20231212
Subject: next/master baseline: 409 runs, 44 regressions (next-20231212)
To: linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>

next/master baseline: 409 runs, 44 regressions (next-20231212)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =

at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =

beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231212/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231212
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      abb240f7a2bd14567ab53e602db562bb683391e6 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91-sama5d4_xplained        | arm   | lab-baylibre  | gcc-10   | sama5_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/657824cfbaba6b0eb9e1349a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657824cfbaba6b0eb9e13=
49b
        failing since 314 days (last pass: next-20230125, first fail: next-=
20230131) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | at91_dt_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65781edcef1087b869e13478

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/65781eddef1087b869e13498
        failing since 190 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-12T08:50:10.067580  /lava-344165/1/../bin/lava-test-case
    2023-12-12T08:50:10.109385  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
at91sam9g20ek                | arm   | lab-broonie   | gcc-10   | multi_v5_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657825fa0fa81eb8f3e134f3

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/657825fa0fa81eb8f3e13512
        failing since 190 days (last pass: next-20230601, first fail: next-=
20230605)

    2023-12-12T09:20:48.417245  /lava-344273/1/../bin/lava-test-case
    2023-12-12T09:20:48.460103  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/65781f0fdd610948e0e1347c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65781f0fdd610948e0e13=
47d
        failing since 190 days (last pass: next-20230601, first fail: next-=
20230605) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657826a4a4cdc27cafe134af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657826a4a4cdc27cafe13=
4b0
        failing since 258 days (last pass: next-20230327, first fail: next-=
20230328) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6578271191268977efe13477

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6578271191268977efe13=
478
        failing since 256 days (last pass: next-20230330, first fail: next-=
20230331) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beagle-xm                    | arm   | lab-baylibre  | gcc-10   | omap2plus=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6578278b583fbc4befe1347f

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
6578278b583fbc4befe13485
        new failure (last pass: next-20231211)

    2023-12-12T09:27:31.651846  cat: symbol lookup error: /lib/libc.so.6: u=
ndefined symbol: __po<1>[   50.300506] BUG: Bad rss-counter state mm:3adb5c=
a9 type:MM_FILEPAGES val:-3
    2023-12-12T09:27:31.652495  inter_chk_guard, version =

    2023-12-12T09:27:32.717421  /lava-3876494/1/../bin/lava-test-case
    2023-12-12T09:27:32.746599  <8>[   51.402893] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dall-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-broonie   | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65782bb0c6543a9778e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65782bb0c6543a9778e13=
476
        failing since 4 days (last pass: next-20231207, first fail: next-20=
231208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6578266c1a646319c7e13499

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6578266c1a646319c7e13=
49a
        failing since 4 days (last pass: next-20231207, first fail: next-20=
231208) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
jetson-tk1                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657820a91295fc1279e13653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657820a91295fc1279e13=
654
        failing since 609 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/6578227f02f32e4750e13484

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578227f02f32e4750e13487
        new failure (last pass: next-20231207)

    2023-12-12T09:05:53.626911  / # #
    2023-12-12T09:05:53.729057  export SHELL=3D/bin/sh
    2023-12-12T09:05:53.729775  #
    2023-12-12T09:05:53.831247  / # export SHELL=3D/bin/sh. /lava-404665/en=
vironment
    2023-12-12T09:05:53.831975  =

    2023-12-12T09:05:53.933421  / # . /lava-404665/environment/lava-404665/=
bin/lava-test-runner /lava-404665/1
    2023-12-12T09:05:53.934496  =

    2023-12-12T09:05:53.953284  / # /lava-404665/bin/lava-test-runner /lava=
-404665/1
    2023-12-12T09:05:53.997196  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:05:53.997623  + <8>[   20.693508] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 404665_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6578227f02f32e4750e1348b
        new failure (last pass: next-20231207)

    2023-12-12T09:05:56.106052  /lava-404665/1/../bin/lava-test-case
    2023-12-12T09:05:56.106479  <8>[   22.803888] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-12T09:05:56.106903  /lava-404665/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
78227f02f32e4750e1348d
        new failure (last pass: next-20231207)

    2023-12-12T09:05:57.166272  /lava-404665/1/../bin/lava-test-case
    2023-12-12T09:05:57.166716  <8>[   23.842477] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-12T09:05:57.167017  /lava-404665/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6578227f02f32e4750e13492
        new failure (last pass: next-20231207)

    2023-12-12T09:05:58.241852  /lava-404665/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6578227f02f32e4750e13493
        new failure (last pass: next-20231207)

    2023-12-12T09:05:58.245111  <8>[   24.956495] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-12T09:05:59.303946  /lava-404665/1/../bin/lava-test-case
    2023-12-12T09:05:59.304396  <8>[   25.978199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-12T09:05:59.304733  /lava-404665/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 5          =


  Details:     https://kernelci.org/test/plan/id/65782d50536a775951e134b4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782d50536a775951e134b7
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:54.283932  <8>[   20.129039] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 404698_1.5.2.4.1>
    2023-12-12T09:51:54.388948  / # #
    2023-12-12T09:51:54.491052  export SHELL=3D/bin/sh
    2023-12-12T09:51:54.491748  #
    2023-12-12T09:51:54.592961  / # export SHELL=3D/bin/sh. /lava-404698/en=
vironment
    2023-12-12T09:51:54.593667  =

    2023-12-12T09:51:54.694984  / # . /lava-404698/environment/lava-404698/=
bin/lava-test-runner /lava-404698/1
    2023-12-12T09:51:54.695944  =

    2023-12-12T09:51:54.715126  / # /lava-404698/bin/lava-test-runner /lava=
-404698/1
    2023-12-12T09:51:54.759007  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/65782d50536a775951e134bb
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:56.868403  /lava-404698/1/../bin/lava-test-case
    2023-12-12T09:51:56.868607  <8>[   22.695458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-12-12T09:51:56.868814  /lava-404698/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/65=
782d50536a775951e134bd
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:57.926527  /lava-404698/1/../bin/lava-test-case
    2023-12-12T09:51:57.926977  <8>[   23.734250] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-12-12T09:51:57.927330  /lava-404698/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65782d50536a775951e134c2
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:59.002532  /lava-404698/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/65782d50536a775951e134c3
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:59.005661  <8>[   24.847434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-12T09:52:00.065076  /lava-404698/1/../bin/lava-test-case
    2023-12-12T09:52:00.065542  <8>[   25.869160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-12-12T09:52:00.065831  /lava-404698/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6578226b392bdc6129e13480

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578226b392bdc6129e13483
        new failure (last pass: next-20231207)

    2023-12-12T09:05:35.334460  / # #
    2023-12-12T09:05:35.436734  export SHELL=3D/bin/sh
    2023-12-12T09:05:35.437476  #
    2023-12-12T09:05:35.539069  / # export SHELL=3D/bin/sh. /lava-404666/en=
vironment
    2023-12-12T09:05:35.539803  =

    2023-12-12T09:05:35.641193  / # . /lava-404666/environment/lava-404666/=
bin/lava-test-runner /lava-404666/1
    2023-12-12T09:05:35.642342  =

    2023-12-12T09:05:35.661520  / # /lava-404666/bin/lava-test-runner /lava=
-404666/1
    2023-12-12T09:05:35.715173  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:05:35.715337  + <8>[   21.162763] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 404666_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6578226b392bdc6129e13496
        new failure (last pass: next-20231207)

    2023-12-12T09:05:38.154605  /lava-404666/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/65782d37c9d56e1879e13484

  Results:     101 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782d38c9d56e1879e13487
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:15.856489  / # #
    2023-12-12T09:51:15.957145  export SHELL=3D/bin/sh
    2023-12-12T09:51:15.957395  #
    2023-12-12T09:51:16.057909  / # export SHELL=3D/bin/sh. /lava-404696/en=
vironment
    2023-12-12T09:51:16.058169  =

    2023-12-12T09:51:16.158705  / # . /lava-404696/environment/lava-404696/=
bin/lava-test-runner /lava-404696/1
    2023-12-12T09:51:16.159065  =

    2023-12-12T09:51:16.171885  / # /lava-404696/bin/lava-test-runner /lava=
-404696/1
    2023-12-12T09:51:16.231825  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:51:16.231932  + <8>[   20.958945] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 404696_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/65782d38c9d56e1879e1349a
        failing since 1 day (last pass: next-20231207, first fail: next-202=
31211)

    2023-12-12T09:51:18.667558  /lava-404696/1/../bin/lava-test-case
    2023-12-12T09:51:18.668193  <8>[   23.383407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-12-12T09:51:18.668459  /lava-404696/1/../bin/lava-test-case
    2023-12-12T09:51:18.668759  <8>[   23.401156] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-12-12T09:51:18.669028  /lava-404696/1/../bin/lava-test-case
    2023-12-12T09:51:18.669282  <8>[   23.420595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-12-12T09:51:18.669537  /lava-404696/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/65782e3452d23e1fcce134d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65782e3452d23e1fcce13=
4d5
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/657824849597a865fae134af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657824849597a865fae134b8
        failing since 5 days (last pass: next-20221017, first fail: next-20=
231207)

    2023-12-12T09:14:18.363731  <8>[   19.957092] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876416_1.5.2.4.1>
    2023-12-12T09:14:18.468605  / # #
    2023-12-12T09:14:18.569821  export SHELL=3D/bin/sh
    2023-12-12T09:14:18.570155  #
    2023-12-12T09:14:18.670912  / # export SHELL=3D/bin/sh. /lava-3876416/e=
nvironment
    2023-12-12T09:14:18.671275  =

    2023-12-12T09:14:18.772086  / # . /lava-3876416/environment/lava-387641=
6/bin/lava-test-runner /lava-3876416/1
    2023-12-12T09:14:18.772707  =

    2023-12-12T09:14:18.777361  / # /lava-3876416/bin/lava-test-runner /lav=
a-3876416/1
    2023-12-12T09:14:18.828621  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6578255aa4fab3383ce13486

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578255aa4fab3383ce1348f
        failing since 5 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-12T09:17:52.847805  <8>[   14.531036] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876440_1.5.2.4.1>
    2023-12-12T09:17:52.954433  / # #
    2023-12-12T09:17:53.055687  export SHELL=3D/bin/sh
    2023-12-12T09:17:53.056069  #
    2023-12-12T09:17:53.156863  / # export SHELL=3D/bin/sh. /lava-3876440/e=
nvironment
    2023-12-12T09:17:53.157301  =

    2023-12-12T09:17:53.258098  / # . /lava-3876440/environment/lava-387644=
0/bin/lava-test-runner /lava-3876440/1
    2023-12-12T09:17:53.258722  =

    2023-12-12T09:17:53.263782  / # /lava-3876440/bin/lava-test-runner /lav=
a-3876440/1
    2023-12-12T09:17:53.328475  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65782b28af3533d791e13536

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782b28af3533d791e1353f
        failing since 5 days (last pass: next-20221014, first fail: next-20=
231207)

    2023-12-12T09:42:36.328976  <8>[   14.508239] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876552_1.5.2.4.1>
    2023-12-12T09:42:36.435842  / # #
    2023-12-12T09:42:36.537016  export SHELL=3D/bin/sh
    2023-12-12T09:42:36.537376  #
    2023-12-12T09:42:36.638178  / # export SHELL=3D/bin/sh. /lava-3876552/e=
nvironment
    2023-12-12T09:42:36.638534  =

    2023-12-12T09:42:36.739353  / # . /lava-3876552/environment/lava-387655=
2/bin/lava-test-runner /lava-3876552/1
    2023-12-12T09:42:36.739966  =

    2023-12-12T09:42:36.745269  / # /lava-3876552/bin/lava-test-runner /lav=
a-3876552/1
    2023-12-12T09:42:36.805741  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6578267af1eb15a742e134b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6578267af1eb15a742e13=
4b4
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65782656f1eb15a742e13475

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65782656f1eb15a742e13=
476
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/65782678f1eb15a742e134ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65782678f1eb15a742e13=
4af
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6578266af1eb15a742e134a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6578266af1eb15a742e13=
4a7
        new failure (last pass: next-20231211) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip       | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65781fa200616be763e134ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/65781fa200616be763e13=
4ae
        failing since 5 days (last pass: next-20231205, first fail: next-20=
231206) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657821a33282ea75b1e13476

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657821a33282ea75b1e13=
477
        failing since 384 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/657820a0006b05aecfe13493

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/657820a0006b05aecfe13=
494
        failing since 384 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6578283f408099969ce134a8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578283f408099969ce134b1
        failing since 188 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-12T09:30:32.192147  / # #
    2023-12-12T09:30:32.295277  export SHELL=3D/bin/sh
    2023-12-12T09:30:32.296353  #
    2023-12-12T09:30:32.398301  / # export SHELL=3D/bin/sh. /lava-3876515/e=
nvironment
    2023-12-12T09:30:32.399687  =

    2023-12-12T09:30:32.501289  / # . /lava-3876515/environment/lava-387651=
5/bin/lava-test-runner /lava-3876515/1
    2023-12-12T09:30:32.502647  =

    2023-12-12T09:30:32.514818  / # /lava-3876515/bin/lava-test-runner /lav=
a-3876515/1
    2023-12-12T09:30:32.611107  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:30:32.645852  + cd /lava-3876515/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | clang-17 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/657828aeef43fdf85ae13476

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.6 (++20231208085823+6009=
708b4367-1~exp1~20231208085918.75))
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/clang-17/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657828afef43fdf85ae1347f
        failing since 188 days (last pass: next-20230525, first fail: next-=
20230607)

    2023-12-12T09:32:10.345793  + set +x
    2023-12-12T09:32:10.347496  [   21.703237] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447728_1.5.2.4.1>
    2023-12-12T09:32:10.455889  / # #
    2023-12-12T09:32:10.557471  export SHELL=3D/bin/sh
    2023-12-12T09:32:10.558090  #
    2023-12-12T09:32:10.659063  / # export SHELL=3D/bin/sh. /lava-447728/en=
vironment
    2023-12-12T09:32:10.659629  =

    2023-12-12T09:32:10.760618  / # . /lava-447728/environment/lava-447728/=
bin/lava-test-runner /lava-447728/1
    2023-12-12T09:32:10.761468  =

    2023-12-12T09:32:10.764382  / # /lava-447728/bin/lava-test-runner /lava=
-447728/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/65782455742c76006ee13499

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782456742c76006ee134a2
        failing since 194 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-12T09:13:38.243512  / # #
    2023-12-12T09:13:38.347010  export SHELL=3D/bin/sh
    2023-12-12T09:13:38.348294  #
    2023-12-12T09:13:38.450326  / # export SHELL=3D/bin/sh. /lava-3876407/e=
nvironment
    2023-12-12T09:13:38.451534  =

    2023-12-12T09:13:38.553676  / # . /lava-3876407/environment/lava-387640=
7/bin/lava-test-runner /lava-3876407/1
    2023-12-12T09:13:38.555186  =

    2023-12-12T09:13:38.566851  / # /lava-3876407/bin/lava-test-runner /lav=
a-3876407/1
    2023-12-12T09:13:38.692228  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:13:38.692653  + cd /lava-3876407/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6578268bf72116d2d4e13477

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578268bf72116d2d4e13480
        failing since 188 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-12T09:23:01.198064  <8>[   13.404844] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3876438_1.5.2.4.1>
    2023-12-12T09:23:01.305943  / # #
    2023-12-12T09:23:01.408996  export SHELL=3D/bin/sh
    2023-12-12T09:23:01.410175  #
    2023-12-12T09:23:01.512453  / # export SHELL=3D/bin/sh. /lava-3876438/e=
nvironment
    2023-12-12T09:23:01.513553  =

    2023-12-12T09:23:01.615393  / # . /lava-3876438/environment/lava-387643=
8/bin/lava-test-runner /lava-3876438/1
    2023-12-12T09:23:01.617168  =

    2023-12-12T09:23:01.629614  / # /lava-3876438/bin/lava-test-runner /lav=
a-3876438/1
    2023-12-12T09:23:01.750137  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65782aab13240201f6e134dd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782aab13240201f6e134e6
        failing since 194 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-12T09:40:45.627270  + set +x<8>[   14.456400] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3876551_1.5.2.4.1>
    2023-12-12T09:40:45.627425  =

    2023-12-12T09:40:45.730131  / # #
    2023-12-12T09:40:45.831172  export SHELL=3D/bin/sh
    2023-12-12T09:40:45.831534  #
    2023-12-12T09:40:45.932263  / # export SHELL=3D/bin/sh. /lava-3876551/e=
nvironment
    2023-12-12T09:40:45.932630  =

    2023-12-12T09:40:46.033362  / # . /lava-3876551/environment/lava-387655=
1/bin/lava-test-runner /lava-3876551/1
    2023-12-12T09:40:46.033881  =

    2023-12-12T09:40:46.075977  / # /lava-3876551/bin/lava-test-runner /lav=
a-3876551/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6578244d6c37de8e18e134bd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun7i-a20-cubi=
eboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578244d6c37de8e18e134c6
        failing since 194 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-12T09:13:31.486515  + set +x
    2023-12-12T09:13:31.488180  [   24.007060] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447706_1.5.2.4.1>
    2023-12-12T09:13:31.595841  / # #
    2023-12-12T09:13:31.697506  export SHELL=3D/bin/sh
    2023-12-12T09:13:31.698096  #
    2023-12-12T09:13:31.799091  / # export SHELL=3D/bin/sh. /lava-447706/en=
vironment
    2023-12-12T09:13:31.799687  =

    2023-12-12T09:13:31.900679  / # . /lava-447706/environment/lava-447706/=
bin/lava-test-runner /lava-447706/1
    2023-12-12T09:13:31.901558  =

    2023-12-12T09:13:31.904160  / # /lava-447706/bin/lava-test-runner /lava=
-447706/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6578267da4cdc27cafe13483

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6578267da4cdc27cafe1348c
        failing since 188 days (last pass: next-20230517, first fail: next-=
20230607)

    2023-12-12T09:22:51.209980  [   19.379755] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447716_1.5.2.4.1>
    2023-12-12T09:22:51.318849  / # #
    2023-12-12T09:22:51.420471  export SHELL=3D/bin/sh
    2023-12-12T09:22:51.421109  #
    2023-12-12T09:22:51.522233  / # export SHELL=3D/bin/sh. /lava-447716/en=
vironment
    2023-12-12T09:22:51.522892  =

    2023-12-12T09:22:51.623958  / # . /lava-447716/environment/lava-447716/=
bin/lava-test-runner /lava-447716/1
    2023-12-12T09:22:51.624965  =

    2023-12-12T09:22:51.628168  / # /lava-447716/bin/lava-test-runner /lava=
-447716/1
    2023-12-12T09:22:51.712961  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/65782aa213240201f6e134d2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/65782aa213240201f6e134db
        failing since 194 days (last pass: next-20230530, first fail: next-=
20230601)

    2023-12-12T09:40:34.162358  + set +x
    2023-12-12T09:40:34.164197  [   21.214026] <LAVA_SIGNAL_ENDRUN 0_dmesg =
447732_1.5.2.4.1>
    2023-12-12T09:40:34.274571  / # #
    2023-12-12T09:40:34.375917  export SHELL=3D/bin/sh
    2023-12-12T09:40:34.376424  #
    2023-12-12T09:40:34.477373  / # export SHELL=3D/bin/sh. /lava-447732/en=
vironment
    2023-12-12T09:40:34.477900  =

    2023-12-12T09:40:34.578903  / # . /lava-447732/environment/lava-447732/=
bin/lava-test-runner /lava-447732/1
    2023-12-12T09:40:34.579986  =

    2023-12-12T09:40:34.583534  / # /lava-447732/bin/lava-test-runner /lava=
-447732/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | sunxi_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/657827119fa5d42b70e13476

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231212/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231212/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/657827119fa5d42b70e1347f
        failing since 1 day (last pass: next-20231208, first fail: next-202=
31211)

    2023-12-12T09:24:43.942382  / # #
    2023-12-12T09:24:44.043619  export SHELL=3D/bin/sh
    2023-12-12T09:24:44.043997  #
    2023-12-12T09:24:44.144851  / # export SHELL=3D/bin/sh. /lava-3876492/e=
nvironment
    2023-12-12T09:24:44.145230  =

    2023-12-12T09:24:44.246064  / # . /lava-3876492/environment/lava-387649=
2/bin/lava-test-runner /lava-3876492/1
    2023-12-12T09:24:44.246682  =

    2023-12-12T09:24:44.254008  / # /lava-3876492/bin/lava-test-runner /lav=
a-3876492/1
    2023-12-12T09:24:44.397892  + export 'TESTRUN_ID=3D1_bootrr'
    2023-12-12T09:24:44.398362  + cd /lava-3876492/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20

