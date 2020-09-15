Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9897C26AC7E
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 20:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbgIOSsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 14:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727713AbgIOR1G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 13:27:06 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5590C061797
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 10:26:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id k15so2317645pfc.12
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tl2MeSq/wL1eIOjNBDPmtfU5DGYmK1NC7AH/4CMsvaM=;
        b=FiBW8rbJRYgJeZSDhnnj4kNdRJLQ98gJSSxTR8XTFa+FDqlEfrqdziDEiE8vov1dfc
         3Gf6J2TF3CraBtLMk3lgNvdvAUgCFt6iKdL+W/EmGfYkfhp9h90YOXax39HMSwmFXfZQ
         UKHSlLUL7sZo/dIhx2Qoh+U48ncIIt3tWX3VqTkpLfGcBHOhePM6Wj8flJww9MUVGD7e
         QGKoEXjQuuKAMMIJU84n2juqJKF2kCG1fq3edRfC0mu8dYMDRmCid8VmKtu2cvyPfVKc
         u/ikHsgRn782KVgeD0DnFnZ6N+++EM1jRJvXX2cnwpGmpOJfnJPRj2xjYm7pORbt0ejY
         4YLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tl2MeSq/wL1eIOjNBDPmtfU5DGYmK1NC7AH/4CMsvaM=;
        b=jAvo0gAkV84wGAUJfsg6843OPOlCtBQEroH3/fFKAnlqBQfmOjia6lZAQCmEISnA6r
         z1sQjI1GPwPRsuejLhB6S7kZiLpeu34TEMF6aEOh5jKeFM0TcnSsQV+WLICGjNmWFUFW
         ILriMWE9TJOGhXIlGh63lvBQfSc8ET3YMkih4XhhXiYBbAzA2PLJz/p2CHtjARS0JqwT
         ueKd0X5BAqdClppgv/snnv1ezDvwH1xBt1BeL6Snc5g2kSa8dMVDCM5Tjr9YPDi8CcMg
         sxhRrkVTquY+M7EVgs5CNuUUlCQvsohUzfo7i61Pn6GYxdxsYwFHh//Vn5S2A2F2x0/v
         WDnA==
X-Gm-Message-State: AOAM5301T1RDODWHVZSgH5xS3+av9ky5F5XR8YW2+mJj2ofC+VHRYct9
        DZa3BNjLymB8fHbA0XpoGgxIGC5yUUUdxg==
X-Google-Smtp-Source: ABdhPJyUF7j7zKsuZYWpjwZ4HsCXfV1l3wVKStKvzPA00I3uDtI92rrD5IMYh7MyyCqws9Ejcu+h4A==
X-Received: by 2002:a63:ff07:: with SMTP id k7mr15338332pgi.39.1600190808536;
        Tue, 15 Sep 2020 10:26:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u2sm124286pji.50.2020.09.15.10.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 10:26:47 -0700 (PDT)
Message-ID: <5f60f957.1c69fb81.1c169.052a@mx.google.com>
Date:   Tue, 15 Sep 2020 10:26:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200915
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 405 runs, 40 regressions (next-20200915)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 405 runs, 40 regressions (next-20200915)

Regressions Summary
-------------------

platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 0/1    =

beaglebone-black          | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

beaglebone-black          | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 2/4    =

beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 3/5    =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =

hifive-unleashed-a00      | riscv | lab-baylibre    | gcc-8    | defconfig =
                   | 0/1    =

imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 2/4    =

imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =

imx6q-sabrelite           | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

imx6q-sabrelite           | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

meson-gxbb-p200           | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 2/4    =

odroid-x2                 | arm   | lab-collabora   | gcc-8    | exynos_def=
config             | 0/1    =

odroid-x2                 | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =

panda                     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =

panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =

panda                     | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 0/1    =

panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =

sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =

sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =

sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200915/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200915
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6b02addb1d1748d21dd1261e46029b264be4e5a0 =



Test Regressions
---------------- =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c9c7a4b3b6ec60bed9ba

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c9c7a4b3b6e=
c60bed9bd
      failing since 0 day (last pass: next-20200902, first fail: next-20200=
914)
      4 lines

    2020-09-15 14:03:45.584000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 14:03:45.584000  kern  :alert : [0000001c] *pgd=3D23a9b831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c9c7a4b3=
b6ec60bed9be
      failing since 0 day (last pass: next-20200902, first fail: next-20200=
914)
      29 lines

    2020-09-15 14:03:45.675000  kern  :emerg : Process dropbear (pid: 138, =
stack limit =3D 0x(ptrval))
    2020-09-15 14:03:45.676000  kern  :emerg : Stack: (0xc3aa7e30 to 0xc3aa=
8000)
    2020-09-15 14:03:45.676000  kern  :emerg : 7e20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 14:03:45.676000  kern  :emerg : 7e40: c137d8dc c136c3e0 c3a4=
3018 c3a43000 00000003 00000428 c3a43018 00000038
    2020-09-15 14:03:45.676000  kern  :emerg : 7e60: 00000000 00000000 c3aa=
7f78 c0307f4c c3a43018 00000038 00000000 c3a43000
    2020-09-15 14:03:45.676000  kern  :emerg : 7e80: c3a43018 c04cad18 0000=
0000 00001000 beb12858 c3a43028 00000000 c100edbc
    2020-09-15 14:03:45.719000  kern  :emerg : 7ea0: c1877074 c138f104 043f=
5377 db20e680 c04ca99c da734240 beb12858 00001000
    2020-09-15 14:03:45.720000  kern  :emerg : 7ec0: c3aa7f78 00000001 c052=
36b0 c0523758 c3aa6000 00001000 00000000 beb12858
    2020-09-15 14:03:45.720000  kern  :emerg : 7ee0: da734240 c3aa7f78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 14:03:45.720000  kern  :emerg : 7f00: ffffd120 ffffffff 0000=
0001 00000000 3b9a9b20 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
at91-sama5d4_xplained     | arm   | lab-baylibre    | gcc-8    | sama5_defc=
onfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60c55511485f87f8a60928

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60c55511485f87f8a60=
929
      failing since 140 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c8c90d84604a48a60918

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c8c90d84604=
a48a6091b
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:59:31.927000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:59:31.930000  kern  :alert : pgd =3D e2558e05
    2020-09-15 13:59:31.936000  kern  :alert : [0000001c] *pgd=3D83798831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c8c90d84=
604a48a6091c
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      29 lines

    2020-09-15 13:59:31.972000  kern  :emerg : Process dropbear (pid: 127, =
stack limit =3D 0x828530af)
    2020-09-15 13:59:31.977000  kern  :emerg : Stack: (0xd787be30 to 0xd787=
c000)
    2020-09-15 13:59:31.985000  kern  :emerg : be20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 13:59:31.993000  kern  :emerg : be40: c137d8dc c136c3e0 c361=
a018 c361a000 00000003 0000044f c361a018 0000003d
    2020-09-15 13:59:32.001000  kern  :emerg : be60: 00000000 00000000 d787=
bf78 c0307f4c c361a018 0000003d 00000000 c361a000
    2020-09-15 13:59:32.009000  kern  :emerg : be80: c361a018 c04cad18 0000=
0000 00001000 be851858 c361a028 00000000 c100edbc
    2020-09-15 13:59:32.018000  kern  :emerg : bea0: c1877074 c138f104 2e23=
02a9 db23d980 c04ca99c c372c780 be851858 00001000
    2020-09-15 13:59:32.026000  kern  :emerg : bec0: d787bf78 00000001 c052=
36b0 c0523758 d787a000 00001000 00000000 be851858
    2020-09-15 13:59:32.034000  kern  :emerg : bee0: c372c780 d787bf78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 13:59:32.042000  kern  :emerg : bf00: ffffecf5 ffffffff 0000=
0001 00000000 3b9ab6f5 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-cip         | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c87b20613462faa6091b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c87b2061346=
2faa6091f
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:58:15.109000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:58:15.112000  kern  :alert : pgd =3D a234bd70
    2020-09-15 13:58:15.118000  kern  :alert : [0000001c] *pgd=3D98335831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c87b2061=
3462faa60920
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      29 lines

    2020-09-15 13:58:15.153000  kern  :emerg : Process dropbear (pid: 125, =
stack limit =3D 0xaf4f909e)
    2020-09-15 13:58:15.158000  kern  :emerg : Stack: (0xc370fe30 to 0xc371=
0000)
    2020-09-15 13:58:15.167000  kern  :emerg : fe20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 13:58:15.174000  kern  :emerg : fe40: c137d8dc c136c3e0 c350=
8018 c3508000 00000003 0000044f c3508018 0000003d
    2020-09-15 13:58:15.182000  kern  :emerg : fe60: 00000000 00000000 c370=
ff78 c0307f4c c3508018 0000003d 00000000 c3508000
    2020-09-15 13:58:15.191000  kern  :emerg : fe80: c3508018 c04cad18 0000=
0000 00001000 bec80858 c3508028 00000000 c100edbc
    2020-09-15 13:58:15.199000  kern  :emerg : fea0: c1877074 c138f104 3538=
1cf4 db23d980 c04ca99c c35a2f00 bec80858 00001000
    2020-09-15 13:58:15.208000  kern  :emerg : fec0: c370ff78 00000001 c052=
36b0 c0523758 c370e000 00001000 00000000 bec80858
    2020-09-15 13:58:15.215000  kern  :emerg : fee0: c35a2f00 c370ff78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 13:58:15.224000  kern  :emerg : ff00: ffffefe3 ffffffff 0000=
0001 00000000 3b9ab9e3 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c3d0279d11ad56a6092e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c3d0279d11a=
d56a60931
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:38:17.560000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:38:17.561000  kern  :alert : pgd =3D 85da6f00
    2020-09-15 13:38:17.561000  kern  :alert : [0000001c] *pgd=3D9b0cf831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c3d0279d=
11ad56a60932
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      28 lines

    2020-09-15 13:38:17.614000  kern  :emerg : Process dropbear (pid: 150, =
stack limit =3D 0xf84c2df1)
    2020-09-15 13:38:17.615000  kern  :emerg : Stack: (0xdb621e40 to 0xdb62=
2000)
    2020-09-15 13:38:17.616000  kern  :emerg : 1e40: db620000 c02fb8d8 c0ee=
8d20 00000002 00000690 db0bc4b0 00000003 0000003e
    2020-09-15 13:38:17.617000  kern  :emerg : 1e60: 00000000 c0e604f4 db0b=
c4c8 db0bc4c8 db621f78 c0108028 00000000 c0e604f4
    2020-09-15 13:38:17.618000  kern  :emerg : 1e80: db0bc4c8 db0bc4b0 0000=
06c5 c02fc70c 27088f37 00001000 bec05858 db0bc4d8
    2020-09-15 13:38:17.656000  kern  :emerg : 1ea0: 00000000 00000000 11e5=
5ada de16a380 c02fc384 db12be40 bec05858 00001000
    2020-09-15 13:38:17.657000  kern  :emerg : 1ec0: db621f78 00000001 c036=
5aec c0365b94 db620000 00001000 00000000 bec05858
    2020-09-15 13:38:17.658000  kern  :emerg : 1ee0: db12be40 db621f78 0000=
0001 c02d1c34 ffffeb01 ffffffff 00000001 00000000
    2020-09-15 13:38:17.659000  kern  :emerg : 1f00: 3b9ab501 00000000 0000=
0001 00000000 3b9ab501 00000000 00000001 000f423a
    2020-09-15 13:38:17.660000  kern  :emerg : 1f20: 3b9ab501 00000000 0000=
0002 d98c5e75 00000000 bec05850 db620000 db621f68
    ... (17 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
beaglebone-black          | arm   | lab-cip         | gcc-8    | omap2plus_=
defconfig          | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c3bf36b8498446a60922

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c3bf36b8498=
446a60926
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:38:02.673000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:38:02.676000  kern  :alert : pgd =3D 5d87fb5e
    2020-09-15 13:38:02.682000  kern  :alert : [0000001c] *pgd=3D83b4f831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c3bf36b8=
498446a60927
      failing since 0 day (last pass: next-20200806, first fail: next-20200=
914)
      28 lines

    2020-09-15 13:38:02.726000  kern  :emerg : Process dropbear (pid: 148, =
stack limit =3D 0x89db2e21)
    2020-09-15 13:38:02.730000  kern  :emerg : Stack: (0xc3c03e40 to 0xc3c0=
4000)
    2020-09-15 13:38:02.738000  kern  :emerg : 3e40: c3c02000 c02fb8d8 c0ee=
8d20 00000002 000006c4 de2e14b0 00000003 0000003e
    2020-09-15 13:38:02.747000  kern  :emerg : 3e60: 00000000 c0e604f4 de2e=
14c8 de2e14c8 c3c03f78 c0108028 00000000 c0e604f4
    2020-09-15 13:38:02.754000  kern  :emerg : 3e80: de2e14c8 de2e14b0 0000=
06f9 c02fc70c 20ad8662 00001000 be98e858 de2e14d8
    2020-09-15 13:38:02.763000  kern  :emerg : 3ea0: 00000000 00000000 119f=
6680 de16a380 c02fc384 dd4c9c00 be98e858 00001000
    2020-09-15 13:38:02.771000  kern  :emerg : 3ec0: c3c03f78 00000001 c036=
5aec c0365b94 c3c02000 00001000 00000000 be98e858
    2020-09-15 13:38:02.779000  kern  :emerg : 3ee0: dd4c9c00 c3c03f78 0000=
0001 c02d1c34 ffffeb7e ffffffff 00000001 00000000
    2020-09-15 13:38:02.788000  kern  :emerg : 3f00: 3b9ab57e 00000000 0000=
0001 00000000 3b9ab57e 00000000 00000001 000f423a
    2020-09-15 13:38:02.795000  kern  :emerg : 3f20: 3b9ab57e 00000000 0000=
0002 905b6967 00000000 be98e850 c3c02000 c3c03f68
    ... (17 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c9c6f6ee477d40bed9b8

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c9c6f6ee477=
d40bed9be
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 14:03:44.250000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 14:03:44.251000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 14:03:44.251000  kern  :alert : [0000001c] *pgd=3D3b9cd831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c9c6f6ee=
477d40bed9bf
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 14:03:44.288000  kern  :emerg : Process dropbear (pid: 132, =
stack limit =3D 0x(ptrval))
    2020-09-15 14:03:44.289000  kern  :emerg : Stack: (0xc41e1e30 to 0xc41e=
2000)
    2020-09-15 14:03:44.297000  kern  :emerg : 1e20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 14:03:44.305000  kern  :emerg : 1e40: c137d8dc c136c3e0 eef7=
f018 eef7f000 00000003 0000040b eef7f018 0000002a
    2020-09-15 14:03:44.314000  kern  :emerg : 1e60: 00000000 00000000 c41e=
1f78 c0307f4c eef7f018 0000002a 00000000 eef7f000
    2020-09-15 14:03:44.324000  kern  :emerg : 1e80: eef7f018 c04cad18 0000=
0000 00001000 beefc848 eef7f028 00000000 c100edbc
    2020-09-15 14:03:44.333000  kern  :emerg : 1ea0: c1877074 c138f104 12ef=
96e4 ee8a5d80 c04ca99c c42043c0 beefc848 00001000
    2020-09-15 14:03:44.341000  kern  :emerg : 1ec0: c41e1f78 00000001 c052=
36b0 c0523758 c41e0000 00001000 00000000 beefc848
    2020-09-15 14:03:44.342000  kern  :emerg : 1ee0: c42043c0 c41e1f78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 14:03:44.350000  kern  :emerg : 1f00: ffffee9c ffffffff 0000=
0001 00000000 3b9ab89c 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
dove-cubox                | arm   | lab-pengutronix | gcc-8    | mvebu_v7_d=
efconfig           | 2/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c43d0694f7324ea60933

  Results:     2 PASS, 2 FAIL, 1 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c43d0694f73=
24ea60939
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:40:08.357000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:40:08.357000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 13:40:08.358000  kern  :alert : [0000001c] *pgd=3D3fdc1831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c43d0694=
f7324ea6093a
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 13:40:08.393000  kern  :emerg : Process dropbear (pid: 155, =
stack limit =3D 0x(ptrval))
    2020-09-15 13:40:08.393000  kern  :emerg : Stack: (0xeea65e30 to 0xeea6=
6000)
    2020-09-15 13:40:08.402000  kern  :emerg : 5e20:                       =
              00000004 c027c010 c0ea5f3c 00000002
    2020-09-15 13:40:08.411000  kern  :emerg : 5e40: c0b019b8 c0b019bc eea4=
b4c8 eea4b4b0 00000003 000003c4 eea4b4c8 0000002a
    2020-09-15 13:40:08.420000  kern  :emerg : 5e60: 00000000 00000000 eea6=
5f78 c0107e3c eea4b4c8 0000002a 00000000 eea4b4b0
    2020-09-15 13:40:08.429000  kern  :emerg : 5e80: eea4b4c8 c027ce8c 0000=
0000 00001000 bea26848 eea4b4d8 00000000 c0a09b7c
    2020-09-15 13:40:08.438000  kern  :emerg : 5ea0: c0e28634 c0b16b00 09f4=
773e ef1f5f80 c027cb10 eea6d600 bea26848 00001000
    2020-09-15 13:40:08.447000  kern  :emerg : 5ec0: eea65f78 00000001 c02d=
28dc c02d2984 eea64000 00001000 00000000 bea26848
    2020-09-15 13:40:08.448000  kern  :emerg : 5ee0: eea6d600 eea65f78 0000=
0001 c0254374 00000008 00000000 00000051 c0269784
    2020-09-15 13:40:08.456000  kern  :emerg : 5f00: ffffefec ffffffff 0000=
0001 00000000 3b9ab9ec 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
hifive-unleashed-a00      | riscv | lab-baylibre    | gcc-8    | defconfig =
                   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60c2b3f60673a4aba6091c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60c2b3f60673a4aba60=
91d
      failing since 5 days (last pass: next-20200818, first fail: next-2020=
0909)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_=
defconfig          | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c3ce279d11ad56a6091b

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c3ce279d11a=
d56a6091f
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:37:16.900000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:37:16.901000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 13:37:16.902000  kern  :alert : [0000001c] *pgd=3Dc8286831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c3ce279d=
11ad56a60920
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      28 lines

    2020-09-15 13:37:16.976000  kern  :emerg : Process dropbear (pid: 169, =
stack limit =3D 0x(ptrval))
    2020-09-15 13:37:16.977000  kern  :emerg : Stack: (0xdc8dbe40 to 0xdc8d=
c000)
    2020-09-15 13:37:16.985000  kern  :emerg : be40: dc524e00 dc524e6c c16a=
00c0 00000002 c1d2a49c dc8af000 00000003 00000171
    2020-09-15 13:37:16.994000  kern  :emerg : be60: 00000000 c15a1afc dc8a=
f018 dc8af018 dc8dbf78 c01084d4 00000000 c15a1afc
    2020-09-15 13:37:17.003000  kern  :emerg : be80: dc8af018 dc8af000 0000=
0558 c02e06cc dc8dbef8 00001000 becd3858 dc8af028
    2020-09-15 13:37:17.012000  kern  :emerg : bea0: 00000000 00000000 2b48=
7a6a dc2b8b40 c02e0334 dc3bc3c0 becd3858 00001000
    2020-09-15 13:37:17.021000  kern  :emerg : bec0: dc8dbf78 00000001 c034=
d08c c034d134 dc8da000 00001000 00000000 becd3858
    2020-09-15 13:37:17.030000  kern  :emerg : bee0: dc3bc3c0 dc8dbf78 0000=
0001 c02b18c4 ffffc7c0 ffffffff 00000001 00000000
    2020-09-15 13:37:17.031000  kern  :emerg : bf00: 3b9a91c0 00000000 0000=
0001 00000000 3b9a91c0 00000000 00000001 000f4231
    2020-09-15 13:37:17.039000  kern  :emerg : bf20: 3b9a91c0 00000000 0000=
0002 e475f9a5 00000000 becd3850 dc8da000 dc8dbf68
    ... (17 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx53-qsrb                | arm   | lab-pengutronix | gcc-8    | multi_v7_d=
efconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c9134d002edb65bed955

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c9134d002ed=
b65bed95b
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 14:00:45.079000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 14:00:45.080000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 14:00:45.080000  kern  :alert : [0000001c] *pgd=3Dcb1bd831
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c9134d00=
2edb65bed95c
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 14:00:45.127000  kern  :emerg : Process dropbear (pid: 128, =
stack limit =3D 0x(ptrval))
    2020-09-15 14:00:45.128000  kern  :emerg : Stack: (0xc8351e30 to 0xc835=
2000)
    2020-09-15 14:00:45.136000  kern  :emerg : 1e20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 14:00:45.145000  kern  :emerg : 1e40: c137d8dc c136c3e0 c801=
70b8 c80170a0 00000003 00000425 c80170b8 00000171
    2020-09-15 14:00:45.154000  kern  :emerg : 1e60: 00000000 00000000 c835=
1f78 c0307f4c c80170b8 00000171 00000000 c80170a0
    2020-09-15 14:00:45.163000  kern  :emerg : 1e80: c80170b8 c04cad18 0000=
0000 00001000 be91b858 c80170c8 00000000 c100edbc
    2020-09-15 14:00:45.172000  kern  :emerg : 1ea0: c1877074 c138f104 1480=
28cf de9f3680 c04ca99c c8152780 be91b858 00001000
    2020-09-15 14:00:45.181000  kern  :emerg : 1ec0: c8351f78 00000001 c052=
36b0 c0523758 c8350000 00001000 00000000 be91b858
    2020-09-15 14:00:45.182000  kern  :emerg : 1ee0: c8152780 c8351f78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 14:00:45.190000  kern  :emerg : 1f00: ffffef66 ffffffff 0000=
0001 00000000 3b9ab966 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx6q-sabrelite           | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60cc4816e9c57d5bbed98d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60cc4816e9c57d5bbed=
98e
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
imx6q-sabrelite           | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60ca3fff7d4d52fbbed998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60ca3fff7d4d52fbbed=
999
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
meson-gxbb-p200           | arm64 | lab-baylibre    | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c5f0f9d3708474a60914

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f60c5f0f9d37084=
74a60916
      new failure (last pass: next-20200914)
      1 lines

    2020-09-15 13:45:58.605000  Trying 127.0.0.1...
    2020-09-15 13:45:58.607000  Connected to 127.0.0.1.
    2020-09-15 13:45:58.608000  Escape character is '^]'.
    2020-09-15 13:45:58.610000  =00=00=00=00=00=00=00=00=00=00=00=00=00=00G=
XBB:BL1:08dafd:0a8993;FEAT:E0FC3184;POC:3;RCY:0;EMMC:0;READ:0;CHK:F3;SD:0;R=
EAD:0;CHK:0;
    2020-09-15 13:45:58.611000  no sdio debug board detected =

    2020-09-15 13:45:58.612000  TE: 508180
    2020-09-15 13:45:58.614000  =

    2020-09-15 13:45:58.615000  BL2 Built : 11:58:33, May 27 2017. =

    2020-09-15 13:45:58.617000  gxb gc3c9a84 - xiaobo.gu@droid05
    2020-09-15 13:45:58.618000  =

    ... (838 line(s) more)
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c5f0f9d3=
708474a60918
      new failure (last pass: next-20200914)
      2 lines  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
odroid-x2                 | arm   | lab-collabora   | gcc-8    | exynos_def=
config             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60c2f78228c70b48a60935

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60c2f78228c70b48a60=
936
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
odroid-x2                 | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60ca1dff7d4d52fbbed96d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-odroid-x2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60ca1dff7d4d52fbbed=
96e
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
odroid-xu3                | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60e1edd4b125f4c6bed94c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-odroid-xu3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60e1edd4b125f4c6bed=
94d
      failing since 52 days (last pass: next-20200723, first fail: next-202=
00724)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60cc1c0fe7dbf650bed984

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60cc1c0fe7dbf650bed=
985
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f60c84eaf15861abaa60949

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c84eaf15861=
abaa6094d
      failing since 62 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-15 13:57:28.794000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-15 13:57:28.799000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-15 13:57:28.805000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-15 13:57:28.811000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-15 13:57:28.817000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-15 13:57:28.822000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-15 13:57:28.828000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-15 13:57:28.834000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-15 13:57:28.840000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-15 13:57:28.846000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | multi_v7_d=
efconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60ca03ff7d4d52fbbed955

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60ca03ff7d4d52fbbed=
956
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-baylibre    | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60c56d0bec9656d1a60920

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60c56d0bec9656d1a60=
921
      failing since 55 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
panda                     | arm   | lab-collabora   | gcc-8    | omap2plus_=
defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f60c4c3c85ab48bfca60923

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f60c4c3c85ab48bfca60=
924
      failing since 55 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60f8f393ac5ba21abed94d

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60f8f393ac5ba=
21abed950
      new failure (last pass: next-20200911)
      4 lines

    2020-09-15 17:24:58.163000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 17:24:58.164000  kern  :alert : [0000001c] *pgd=3D43d4c831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60f8f393ac=
5ba21abed951
      new failure (last pass: next-20200911)
      29 lines

    2020-09-15 17:24:58.205000  kern  :emerg : Process dropbear (pid: 130, =
stack limit =3D 0x(ptrval))
    2020-09-15 17:24:58.207000  kern  :emerg : Stack: (0xc3d69e30 to 0xc3d6=
a000)
    2020-09-15 17:24:58.208000  kern  :emerg : 9e20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 17:24:58.209000  kern  :emerg : 9e40: c137d8dc c136c3e0 c3ae=
2018 c3ae2000 00000003 00000618 c3ae2018 00000078
    2020-09-15 17:24:58.211000  kern  :emerg : 9e60: 00000000 00000000 c3d6=
9f78 c0307f4c c3ae2018 00000078 00000000 c3ae2000
    2020-09-15 17:24:58.247000  kern  :emerg : 9e80: c3ae2018 c04cad18 0000=
0000 00001000 beaeb858 c3ae2028 00000000 c100edbc
    2020-09-15 17:24:58.248000  kern  :emerg : 9ea0: c1877074 c138f104 3555=
f4c3 df18d980 c04ca99c c3c1d540 beaeb858 00001000
    2020-09-15 17:24:58.250000  kern  :emerg : 9ec0: c3d69f78 00000001 c052=
36b0 c0523758 c3d68000 00001000 00000000 beaeb858
    2020-09-15 17:24:58.251000  kern  :emerg : 9ee0: c3c1d540 c3d69f78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 17:24:58.253000  kern  :emerg : 9f00: ffffebfb ffffffff 0000=
0001 00000000 3b9ab5fb 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun4i-a10-olinuxino-lime  | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60f2220da0e575c0bed95e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60f2220da0e57=
5c0bed961
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 16:55:46.570000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 16:55:46.572000  kern  :alert : [0000001c] *pgd=3D43424831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60f2220da0=
e575c0bed962
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 16:55:46.612000  kern  :emerg : Process dropbear (pid: 129, =
stack limit =3D 0x(ptrval))
    2020-09-15 16:55:46.613000  kern  :emerg : Stack: (0xddef9e28 to 0xddef=
a000)
    2020-09-15 16:55:46.615000  kern  :emerg : 9e20:                   c0cf=
bdb4 c0c0505c 00000008 c0c04edc c0800574 00000002
    2020-09-15 16:55:46.616000  kern  :emerg : 9e40: c091de40 c091de44 ddea=
0018 ddea0000 00000003 00000655 ddea0018 00000078
    2020-09-15 16:55:46.617000  kern  :emerg : 9e60: 00000000 00000000 ddef=
9f78 c01075d4 ddea0018 00000078 00000000 ddea0000
    2020-09-15 16:55:46.653000  kern  :emerg : 9e80: ddea0018 c024c9f0 0000=
0000 00001000 be8c9858 ddea0028 00000000 c080557c
    2020-09-15 16:55:46.655000  kern  :emerg : 9ea0: c0c49334 c092ebec 1c67=
9276 df540b80 c024c674 ddf0d180 be8c9858 00001000
    2020-09-15 16:55:46.656000  kern  :emerg : 9ec0: ddef9f78 00000001 c029=
b3ac c029b454 ddef8000 00001000 00000000 be8c9858
    2020-09-15 16:55:46.658000  kern  :emerg : 9ee0: ddf0d180 ddef9f78 0000=
0001 c0223d90 00000008 00000000 00000051 c0239270
    2020-09-15 16:55:46.659000  kern  :emerg : 9f00: ffffef3c ffffffff 0000=
0001 00000000 3b9ab93c 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | multi_v7_d=
efconfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60cbefba478a1feabed955

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60cbefba478a1=
feabed958
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 14:12:36.335000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 14:12:36.336000  kern  :alert : [0000001c] *pgd=3D43b8b831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60cbefba47=
8a1feabed959
      failing since 0 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 14:12:36.377000  kern  :emerg : Process dropbear (pid: 122, =
stack limit =3D 0x(ptrval))
    2020-09-15 14:12:36.378000  kern  :emerg : Stack: (0xc3acbe30 to 0xc3ac=
c000)
    2020-09-15 14:12:36.379000  kern  :emerg : be20:                       =
              00000010 c04c9e9c c19f7f9c 00000002
    2020-09-15 14:12:36.381000  kern  :emerg : be40: c137d8dc c136c3e0 c3a9=
00b8 c3a900a0 00000003 00000352 c3a900b8 00000044
    2020-09-15 14:12:36.383000  kern  :emerg : be60: 00000000 00000000 c3ac=
bf78 c0307f4c c3a900b8 00000044 00000000 c3a900a0
    2020-09-15 14:12:36.417000  kern  :emerg : be80: c3a900b8 c04cad18 0000=
0000 00001000 bea5c858 c3a900c8 00000000 c100edbc
    2020-09-15 14:12:36.420000  kern  :emerg : bea0: c1877074 c138f104 2c75=
7e1d c90f1d80 c04ca99c c3bbe600 bea5c858 00001000
    2020-09-15 14:12:36.421000  kern  :emerg : bec0: c3acbf78 00000001 c052=
36b0 c0523758 c3aca000 00001000 00000000 bea5c858
    2020-09-15 14:12:36.423000  kern  :emerg : bee0: c3bbe600 c3acbf78 0000=
0001 c04a198c 00000008 00000000 00000051 c04b7264
    2020-09-15 14:12:36.424000  kern  :emerg : bf00: ffffed72 ffffffff 0000=
0001 00000000 3b9ab772 00000000 00000001 00000000
    ... (18 line(s) more)
      =



platform                  | arch  | lab             | compiler | defconfig =
                   | results
--------------------------+-------+-----------------+----------+-----------=
-------------------+--------
sun5i-a13-olinuxino-micro | arm   | lab-baylibre    | gcc-8    | sunxi_defc=
onfig              | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f60c47a9c18699312a6097e

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200915/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200915/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f60c47a9c18699=
312a60981
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      4 lines

    2020-09-15 13:41:01.313000  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000001c
    2020-09-15 13:41:01.314000  kern  :alert : pgd =3D (ptrval)
    2020-09-15 13:41:01.316000  kern  :alert : [0000001c] *pgd=3D47f32831, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f60c47a9c18=
699312a60982
      failing since 1 day (last pass: next-20200911, first fail: next-20200=
914)
      29 lines

    2020-09-15 13:41:01.356000  kern  :emerg : Process dropbear (pid: 122, =
stack limit =3D 0x(ptrval))
    2020-09-15 13:41:01.357000  kern  :emerg : Stack: (0xc7f91e28 to 0xc7f9=
2000)
    2020-09-15 13:41:01.359000  kern  :emerg : 1e20:                   c0cf=
bdb4 c0c0505c 00000008 c0c04edc c0800574 00000002
    2020-09-15 13:41:01.361000  kern  :emerg : 1e40: c091de40 c091de44 c7e0=
2018 c7e02000 00000003 0000038f c7e02018 00000044
    2020-09-15 13:41:01.362000  kern  :emerg : 1e60: 00000000 00000000 c7f9=
1f78 c01075d4 c7e02018 00000044 00000000 c7e02000
    2020-09-15 13:41:01.397000  kern  :emerg : 1e80: c7e02018 c024c9f0 0000=
0000 00001000 be9ad858 c7e02028 00000000 c080557c
    2020-09-15 13:41:01.399000  kern  :emerg : 1ea0: c0c49334 c092ebec 3427=
e54b c949cf80 c024c674 c7f52600 be9ad858 00001000
    2020-09-15 13:41:01.401000  kern  :emerg : 1ec0: c7f91f78 00000001 c029=
b3ac c029b454 c7f90000 00001000 00000000 be9ad858
    2020-09-15 13:41:01.402000  kern  :emerg : 1ee0: c7f52600 c7f91f78 0000=
0001 c0223d90 00000008 00000000 00000051 c0239270
    2020-09-15 13:41:01.404000  kern  :emerg : 1f00: fffff060 ffffffff 0000=
0001 00000000 3b9aba60 00000000 00000001 00000000
    ... (18 line(s) more)
      =20
