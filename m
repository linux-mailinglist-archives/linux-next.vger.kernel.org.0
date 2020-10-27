Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0654629A38D
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 05:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442634AbgJ0EGo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Oct 2020 00:06:44 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:35855 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732989AbgJ0EGo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Oct 2020 00:06:44 -0400
Received: by mail-pf1-f179.google.com with SMTP id w65so150991pfd.3
        for <linux-next@vger.kernel.org>; Mon, 26 Oct 2020 21:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=d0TtLZUtP94mCtv5v2gEk/kxskLfWb7Ju+E4YeiDIoI=;
        b=mGwf/27fL81znY7ovHCzP5skJzbrPkqDR8ae7Ow6ECpLsuqJ1H+FA+CVIOzKf7MunS
         D424l9da6JsDpfX3veij4pJ+yFReKV9J3kGh2OCFq1KxtAQQgrO0Nw/rjchbbtmKG866
         rh7oVjOi2CHWdZydKROmr8cMm+I8qlqcOaFw2KVP1pIgtlIPZe/xMkGRP0vlcUMQVhkO
         h8fPDw56hQ7r/erpUX+5dqZtFrWsUH+3yJ57JaLVUf4yzDLU8IGe23oR3gPWY0L9RoO7
         ComEi0eAwWI6OYB3bwC6m7WDz2xiSi+Ay+tjj/5ZE+YVYlxTiVyLnXJ0fDdLwRXVM2do
         wmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=d0TtLZUtP94mCtv5v2gEk/kxskLfWb7Ju+E4YeiDIoI=;
        b=hPhLKK8c9YoMIPfW/GBu4ZWU77pj7YL3Jn8RlDCT3M75SjMHEBG7y6ooVfkAemXnnC
         nbdetIIXMS7PBx7wlaTyi/+g2JtRVZbVaH1GlzVXVSaFshG67ijGqzLrHMZ5IqubV5SP
         mzPBuHjdBuSqJ47UHu5f6BZxwdr/XxPA3s+cYWDaTa0P3Aa5lnadY58A84vuNHVYh1Le
         68ZpgZWLJlaYS4BWViBACDcWtqsfYqyhdNhos2y+lONnnE+CYWxU9hUIDbYP1eS/toLn
         sbtNfeKiqs2bGAP+sjGoFqNQCgAOpE9Eb3bdLWnZsQl8GdJZ8QuHqI/1jgoFr934E9iA
         cK1Q==
X-Gm-Message-State: AOAM530IVj2kdNv5M9JeLf1AJ1ryA8JKGui45fdJDA22hEHtQCwDIuIK
        x/0rf98R3pSbFNzuGFZ4CJkxVMFpnqYkJw==
X-Google-Smtp-Source: ABdhPJxEp6NwP8sU2+SjP/w5RAgOwcmmm/Fk05zx5DlMBUAnrADxMBaE22bFnO3M9ljNEwEmaPMhtQ==
X-Received: by 2002:aa7:87d7:0:b029:163:c013:884e with SMTP id i23-20020aa787d70000b0290163c013884emr334283pfo.19.1603771602327;
        Mon, 26 Oct 2020 21:06:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm320113pfj.100.2020.10.26.21.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 21:06:41 -0700 (PDT)
Message-ID: <5f979cd1.1c69fb81.ce7c0.0fb0@mx.google.com>
Date:   Mon, 26 Oct 2020 21:06:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-155-gee89b55f83b5
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 330 runs,
 11 regressions (v5.10-rc1-155-gee89b55f83b5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 330 runs, 11 regressions (v5.10-rc1-155-gee89b=
55f83b5)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32       | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =

beagle-xm                | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc1-155-gee89b55f83b5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc1-155-gee89b55f83b5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee89b55f83b51187b9b1f833eaced93a3762aa70 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9762440e65d6fbb1381028

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9762440e65d6fbb1381=
029
        failing since 174 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9761c5ffeaa6081538103c

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f9761c5ffeaa608=
15381041
        new failure (last pass: v5.9-14860-gd56fc2efcc70)
        1 lines

    2020-10-26 23:52:38.780000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-26 23:52:38.780000+00:00  (user:khilman) is already connected
    2020-10-26 23:52:53.979000+00:00  =00
    2020-10-26 23:52:53.979000+00:00  =

    2020-10-26 23:52:53.979000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-26 23:52:53.980000+00:00  =

    2020-10-26 23:52:53.980000+00:00  DRAM:  948 MiB
    2020-10-26 23:52:53.996000+00:00  RPI 3 Model B (0xa02082)
    2020-10-26 23:52:54.083000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-26 23:52:54.115000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97635881431d0690381037

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97635881431d0690381=
038
        new failure (last pass: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
beagle-xm                | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9764f11c90dd008d38101a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9764f11c90dd008d381=
01b
        new failure (last pass: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f976475926de47c79381034

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f976475926de47c79381=
035
        failing since 1 day (last pass: v5.9-13195-g0281c5220c40, first fai=
l: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f97659d3439d3a8a4381026

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f97659d3439d3a8a4381=
027
        failing since 1 day (last pass: v5.9-13195-g0281c5220c40, first fai=
l: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5f9767dd8cc3356ada381026

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9767de8cc3356=
ada38102c
        new failure (last pass: v5.9-14860-gd56fc2efcc70)
        4 lines

    2020-10-27 00:20:07.584000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-10-27 00:20:07.584000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-10-27 00:20:07.585000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f9767de8cc3356=
ada38102d
        new failure (last pass: v5.9-14860-gd56fc2efcc70)
        26 lines

    2020-10-27 00:20:07.627000+00:00  kern  :emerg : Process kworker/1:2 (p=
id: 79, stack limit =3D 0x(ptrval))
    2020-10-27 00:20:07.627000+00:00  kern  :emerg : Stack: (0xc3595eb0 to =
0xc3596000)
    2020-10-27 00:20:07.628000+00:00  kern  :emerg : 5ea0:                 =
                    1e9b10fe 1904b2c8 60000013 cec60217
    2020-10-27 00:20:07.628000+00:00  kern  :emerg : 5ec0: 00000000 0000000=
0 00000003 00000000 00000000 1904b2c8 c390a040 cec6008f
    2020-10-27 00:20:07.628000+00:00  kern  :emerg : 5ee0: cec6020f ef7ad40=
0 00000000 c09b28e8 fffffc84 fffffc84 c3b1e000 ef7ad400
    2020-10-27 00:20:07.670000+00:00  kern  :emerg : 5f00: 00000000 c1a2006=
0 00000000 c09b2dd0 c3b1e1a0 c329d680 ef7aa1c0 c0360740
    2020-10-27 00:20:07.670000+00:00  kern  :emerg : 5f20: c26a8600 ef7aa1c=
0 00000008 c329d680 c329d694 ef7aa1c0 00000008 c1803d00
    2020-10-27 00:20:07.670000+00:00  kern  :emerg : 5f40: ef7aa1d8 ef7aa1c=
0 ffffe000 c0360d2c c26a8600 c1a1f757 c137e0ec c0360a84
    2020-10-27 00:20:07.671000+00:00  kern  :emerg : 5f60: c329d680 c25d224=
0 c3296f40 00000000 c3594000 c0360a84 c329d680 c2137ea4
    2020-10-27 00:20:07.671000+00:00  kern  :emerg : 5f80: c25d2264 c0366e8=
8 00000001 c3296f40 c0366d38 00000000 00000000 00000000 =

    ... (15 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f976383edf8ce5efe381041

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f976383edf8ce5efe381=
042
        new failure (last pass: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9763a5604cc9c22838102f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9763a5604cc9c=
228381035
        failing since 82 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-10-27 00:02:40.209000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-10-27 00:02:40.214000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-10-27 00:02:40.220000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-10-27 00:02:40.226000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-10-27 00:02:40.232000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-10-27 00:02:40.238000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-10-27 00:02:40.243000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-10-27 00:02:40.249000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-10-27 00:02:40.255000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-10-27 00:02:40.261000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f976506447fd5f9e7381018

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-1=
55-gee89b55f83b5/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f976506447fd5f9e7381=
019
        failing since 82 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
