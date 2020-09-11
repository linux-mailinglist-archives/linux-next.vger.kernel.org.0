Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACE9265EE8
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 13:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgIKLlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Sep 2020 07:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgIKLk6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2020 07:40:58 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FCEC0613ED
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2020 04:40:57 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n3so2546812pjq.1
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2020 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XRZtOfVobvepLDQCZhU+w08HdW0CMMMqKxlS2qM/h9I=;
        b=jwm+Ync6UrKyVt3CW4wEDGN8WvoybNbmVne7GJLlbaD9LVYSeIvkr8ZXm+jUJutdiA
         HT5n7qYD9TuL0mas56fbXxvFRJvNnFsErpJTG/e/mQjngmE8oHr4xD1V5SjS199TASXo
         +WGZ7TSm6m25WyCgey05JIptFO/taOFiqP/MPXIynZeogMNeDf4NoXp3nyDc8KWfCxQb
         p0BxYXuDsSIjadq64vmZWjLyF7gk6ApAt8qoYWx/wi3cSBKuFn4r/X2Yy/uKdKvu/dOK
         P2lpsbx6gQsnpTarlWQXh+DTsZamdJNSD+LpN0Wy6faIKfBBscu24JwRnpubyMoFZFI/
         rALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XRZtOfVobvepLDQCZhU+w08HdW0CMMMqKxlS2qM/h9I=;
        b=lG5MgedA6qTvcOwD3JAB0lDq7o3HoVclYPJHJH+lDz0z67vgb++x96WiqKJLMIKsCa
         puz+CdNf8r7QnFk4XH5Mp1uJ+eeKe4R/QloFl44JDm5BdyjDeli88zVnun2EUXBiL2xl
         G2y5bULlwt5TTxWpL5h7Lw/xJWI4bMegw+xioR2cD0OQUS4jO2uLE0Yt3G+rCzXtp/Iq
         6Ox+YhEgIUOzxaWmpRi2TZUkxxT9R3Sx+rTCbkv/S0Svhfy1Yd7pIwP9ZfcYp13DQEae
         9PkncnBty7J0mfl/Dox6+XTHZwu3c07def+UGWGSL/93Pqn1e/Z6YeHM7kdVXu7+RpR3
         Zdaw==
X-Gm-Message-State: AOAM530bRZp2i1I/ZA6TYigwdCUepvLvf9uTamL8OoUPGA/KCWeLZi1B
        8sQ3bAwN9jOR/DmA3C6h5z2mZ2Zor1qQRw==
X-Google-Smtp-Source: ABdhPJwAgzOfLI6a/s/y5AjNEMvuFn5L7K12QUkDquiC97dpHcoWwGfVLtRVzrIZUZw9NlTdUHCFQA==
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr1858612pjr.207.1599824456066;
        Fri, 11 Sep 2020 04:40:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i62sm2147172pfe.140.2020.09.11.04.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 04:40:55 -0700 (PDT)
Message-ID: <5f5b6247.1c69fb81.c8035.53b9@mx.google.com>
Date:   Fri, 11 Sep 2020 04:40:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200911
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 473 runs, 7 regressions (next-20200911)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 473 runs, 7 regressions (next-20200911)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =

hifive-unleashed-a00     | riscv | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2/4    =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200911/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200911
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d5b2251d63b5344ee827d3680fa79bdb9f9ddfa1 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5b2c704a1771827ed35370

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5b2c704a177182=
7ed35372
      failing since 0 day (last pass: next-20200828, first fail: next-20200=
910)
      1 lines

    2020-09-11 07:48:55.032000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-11 07:48:55.032000  (user:khilman) is already connected
    2020-09-11 07:49:10.005000  =00
    2020-09-11 07:49:10.005000  =

    2020-09-11 07:49:10.021000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-11 07:49:10.021000  =

    2020-09-11 07:49:10.022000  DRAM:  948 MiB
    2020-09-11 07:49:10.037000  RPI 3 Model B (0xa02082)
    2020-09-11 07:49:10.129000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-11 07:49:10.161000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
hifive-unleashed-a00     | riscv | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5b2e4c35b498fd68d35379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5b2e4c35b498fd68d35=
37a
      failing since 1 day (last pass: next-20200818, first fail: next-20200=
909)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f5b3213deced08e59d353a6

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5b3213deced08=
e59d353a9
      new failure (last pass: next-20200910)
      4 lines

    2020-09-11 08:12:36.926000  kern  :alert : pgd =3D (ptrval)
    2020-09-11 08:12:36.926000  kern  :alert : [752f7389] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5b3213dece=
d08e59d353aa
      new failure (last pass: next-20200910)
      47 lines

    2020-09-11 08:12:36.969000  kern  :emerg : Process kworker/1:1 (pid: 54=
, stack limit =3D 0x(ptrval))
    2020-09-11 08:12:36.970000  kern  :emerg : Stack: (0xeec55d58 to 0xeec5=
6000)
    2020-09-11 08:12:36.970000  kern  :emerg : 5d40:                       =
                                ed3b55b0 ed3b55b4
    2020-09-11 08:12:36.970000  kern  :emerg : 5d60: ed3b5400 ed3b5414 c144=
2490 c09a06b0 eec54000 efd9d5a0 c09a1a74 ed3b5400
    2020-09-11 08:12:36.971000  kern  :emerg : 5d80: 752f7369 0000000c c199=
9344 ee801d80 ed1b4600 efd9b680 c09ade98 c1442490
    2020-09-11 08:12:37.012000  kern  :emerg : 5da0: c1999328 c47f7839 c199=
9344 ed2ad700 ed28b200 ed3b5400 ed3b5414 c1442490
    2020-09-11 08:12:37.012000  kern  :emerg : 5dc0: c1999328 0000000c c199=
9344 c09ade68 c14401b8 00000000 ed3b540c ed3b5400
    2020-09-11 08:12:37.012000  kern  :emerg : 5de0: fffffdfb eeac8c10 ed1c=
7600 c0983edc ed3b5400 bf048000 fffffdfb bf044138
    2020-09-11 08:12:37.013000  kern  :emerg : 5e00: ed2897c0 edb21108 0000=
0120 eeb6a8c0 ed1c7600 c09dd564 ed2897c0 ed2897c0
    2020-09-11 08:12:37.013000  kern  :emerg : 5e20: 00000040 ed2897c0 ed1c=
7600 00000000 c199933c bf0b308c bf0b4014 0000001c
    ... (36 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5b30b8040c6ceefcd35370

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5b30b8040c6ce=
efcd35374
      failing since 57 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-11 08:09:22.383000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-11 08:09:22.388000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-11 08:09:22.394000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-11 08:09:22.400000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-11 08:09:22.406000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-11 08:09:22.412000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-11 08:09:22.418000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-11 08:09:22.425000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-11 08:09:22.430000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-11 08:09:22.436000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5b31c289b3908c9ed3537b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5b31c289b3908=
c9ed3537f
      failing since 57 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-11 08:13:48.307000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-11 08:13:48.313000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-11 08:13:48.319000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-11 08:13:48.324000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-11 08:13:48.330000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-11 08:13:48.336000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-11 08:13:48.341000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-11 08:13:48.347000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-11 08:13:48.353000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-11 08:13:48.358000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5b2f6bf490db03f2d35370

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200911/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200911/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5b2f6bf490db03f2d35=
371
      failing since 51 days (last pass: next-20200706, first fail: next-202=
00721)  =20
