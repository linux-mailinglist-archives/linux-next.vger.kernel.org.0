Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B500F2646DB
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 15:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730397AbgIJNYB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 09:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730718AbgIJNWn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2020 09:22:43 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E03C061573
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 06:22:40 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u13so4255156pgh.1
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6PmGXph0wYYoLuFVpwLOyRpWXmgvhAnKKtZ1lPU712o=;
        b=ofW863cbgkpk5TV4++vzm8rW2H7rDFVY6yG0uTONiSCFeJwRqQjPZrgOWLKWNjBUWs
         AFsLfOEYJauaerr07FmC2Susy7L/S8F81mT65UlXafE1/CnYbF0xw/ppvy41kl/MnvMQ
         7BapI+3JcmP8TbA0/Nt1tYmpy2INSasHX4yFPGiTrvp21qbDAjnO1GLdMPcECT6GzCWI
         4EI7XQmgi7ejxEnOyPNbgFvsyUNii1b0UJ1Kp/ubYhzhu4iy3wWxBnTgBdFA2EpHHtjw
         iTeDFSL7uZlp8Jsb7BEU1dgXxNNFZPGQh1klQcL9j99e5QuRFO3mL4hNWyv746qEj9i3
         +IGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6PmGXph0wYYoLuFVpwLOyRpWXmgvhAnKKtZ1lPU712o=;
        b=r0rIsBLeeWl6HuRWDyMq+GZ1Xt5H3K0REp8ENptgOmX6ljgPLKKNxiUmZ6yrLNojKY
         dLRkkU9sUhdMwmLE0d94iDTIS39L9exiqG0F5kd5zbzv033eZ5/CX0UA0EqdQu0llUxI
         dVlYm4rMyIVQ5zFye3rx9eQXDDEIZYTgZXm78AoxbqaXlSiru33+Biouml3dobh1QMqZ
         rfNCyuvlo4J/XKCFfhVO5qsYA5/EUrSdQD3KypGIc3H4zRr4EpvqxxNTs65xuKI/YO2S
         Erjl1C8bS9QIN/vg80YASU6Ze55wU3J2vXuZdegCu8vieZexYNOCmDBbKiCoauOVDOFw
         tTtg==
X-Gm-Message-State: AOAM5337J47M+iTOzD8N+4FWZ9TlIVMX+xD1eik6ClmAYga3n0NzhB67
        QnGen2IJMsax0cvjqLx1ObCKrcHZTCx2SQ==
X-Google-Smtp-Source: ABdhPJy43HSdOqo2yosRnq1DVIOp0kzMAXRrQ1vMJlHa1whTYXZgtlASZTKPv1aI7mJ/kJoiFxIE/A==
X-Received: by 2002:a63:464c:: with SMTP id v12mr4485373pgk.130.1599744159137;
        Thu, 10 Sep 2020 06:22:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m25sm5937739pfa.32.2020.09.10.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:22:38 -0700 (PDT)
Message-ID: <5f5a289e.1c69fb81.64530.f7fa@mx.google.com>
Date:   Thu, 10 Sep 2020 06:22:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200910
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 524 runs, 7 regressions (next-20200910)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 524 runs, 7 regressions (next-20200910)

Regressions Summary
-------------------

platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 3/4    =

hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =

panda                | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

panda                | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =

rk3288-veyron-jaq    | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 67/69  =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200910/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200910
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7ce53e3a447bced7b85ed181c4d027e93c062e07 =



Test Regressions
---------------- =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
bcm2837-rpi-3-b      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...O=
MIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f59e902dac4766ddbd35378

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f59e902dac4766d=
dbd3537a
      new failure (last pass: next-20200828)
      2 lines

    2020-09-10 08:48:53.959000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-10 08:48:53.959000  (user:khilman) is already connected
    2020-09-10 08:49:08.858000  =00
    2020-09-10 08:49:08.858000  =

    2020-09-10 08:49:08.873000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-10 08:49:08.873000  =

    2020-09-10 08:49:08.874000  DRAM:  948 MiB
    2020-09-10 08:49:08.889000  RPI 3 Model B (0xa02082)
    2020-09-10 08:49:08.981000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-10 08:49:09.013000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (386 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
hifive-unleashed-a00 | riscv | lab-baylibre  | gcc-8    | defconfig        =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f59ee50885bae0f12d353a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f59ee50885bae0f12d35=
3a8
      failing since 0 day (last pass: next-20200818, first fail: next-20200=
909)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f59f379ffc8eb261bd35370

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f59f379ffc8eb2=
61bd35374
      failing since 56 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-10 09:35:47.495000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-10 09:35:47.501000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-10 09:35:47.507000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-10 09:35:47.513000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-10 09:35:47.519000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-10 09:35:47.525000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-10 09:35:47.530000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-10 09:35:47.537000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-10 09:35:47.543000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-10 09:35:47.548000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f59f6498f2ec70826d3537a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f59f6498f2ec70=
826d3537e
      failing since 57 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines

    2020-09-10 09:47:47.430000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-10 09:47:47.435000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-10 09:47:47.440000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-10 09:47:47.445000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-10 09:47:47.450000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-10 09:47:47.459000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-10 09:47:47.464000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-10 09:47:47.469000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-10 09:47:47.474000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-10 09:47:47.480000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
panda                | arm   | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f59f5c65879ef8e3fd35379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f59f5c65879ef8e3fd35=
37a
      failing since 50 days (last pass: next-20200706, first fail: next-202=
00721)  =



platform             | arch  | lab           | compiler | defconfig        =
            | results
---------------------+-------+---------------+----------+------------------=
------------+--------
rk3288-veyron-jaq    | arm   | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 67/69  =


  Details:     https://kernelci.org/test/plan/id/5f59f1d600a1e6b31ad35373

  Results:     67 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200910/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f59f1d600a1e6b=
31ad35377
      new failure (last pass: next-20200909)
      4 lines

    2020-09-10 09:28:47.187000  kern  :alert : pgd =3D 25d624b7
    2020-09-10 09:28:47.187000  kern  :alert : [003bffc4] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f59f1d600a1=
e6b31ad35378
      new failure (last pass: next-20200909)
      46 lines

    2020-09-10 09:28:47.204000  kern  :emerg : Process udevd (pid: 123, sta=
ck limit =3D 0x1294a5bc)
    2020-09-10 09:28:47.217000  kern  :emerg : Stack: (0xed20dd08 to 0xed20=
e000)
    2020-09-10 09:28:47.217000  kern  :emerg : dd00:                   ed3a=
a600 c19ef5a0 ffffffff c07367a4 00000001 ffffff04
    2020-09-10 09:28:47.230000  kern  :emerg : dd20: ffff0a00 c035e4d8 0000=
0016 ed64d000 ed20dd3a ed64d000 c14c1334 c073a610
    2020-09-10 09:28:47.242000  kern  :emerg : dd40: c14c1334 ffffff04 ffff=
0a00 00000010 ee006200 ed64d000 129b2fff ed20c000
    2020-09-10 09:28:47.242000  kern  :emerg : dd60: ed20df78 ffffff04 ffff=
0a00 58ff619c c2ab54c0 ed20c000 ed20c000 00000002
    2020-09-10 09:28:47.255000  kern  :emerg : dd80: ed64d000 ed3aa420 c19c=
20d4 ed3aa400 ed20df78 c073a990 ed20ddb0 58ff619c
    2020-09-10 09:28:47.267000  kern  :emerg : dda0: ed64d000 00000000 c0cd=
68a4 c14c1334 003bffc4 58ff619c ffff0a00 58ff619c
    2020-09-10 09:28:47.273000  kern  :emerg : ddc0: 003bffc4 58ff619c ed20=
c000 c19c0f58 ed64d000 0000004a ed401000 ed401000
    2020-09-10 09:28:47.286000  kern  :emerg : dde0: ed64d000 00000000 ed20=
df78 c0cd6948 0000000f 00000000 ed3aa420 ed3aa400
    ... (35 line(s) more)
      =20
