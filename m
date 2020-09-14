Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE1E268453
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 08:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgINGC6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Sep 2020 02:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgINGCz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2020 02:02:55 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1593CC06174A
        for <linux-next@vger.kernel.org>; Sun, 13 Sep 2020 23:02:54 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id o20so11662248pfp.11
        for <linux-next@vger.kernel.org>; Sun, 13 Sep 2020 23:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KRj1UVIpDRIOhg8kM5Gwly2DFgd9NtueKrNBYbLzuSg=;
        b=hTl5kyKrnor7rFTP/RFNhKPMyyHVItDK3gTkDSgewffkbTsJCnmA69QbYz0fZ8x2ZL
         f23/VYYX57Nnnh5Qz/J2NYXW4HFsVRoGr9VCQIGXAvy+HnBnJxT+dSED9TG5ktWb984/
         4hsVSU/gkWf/FPnYopab9aAB0rnUxAvMxPl/YdYdjylXKEzGCsgPGsIBw5flYGIMsEay
         MIGiUtr5W2GAT+PolYusI2mZI2mb1u5hFcYYNr68vkkt6762LsoE9OugamUhszj71Hpp
         ANnN+edSsIHiOazYvous9ta71k/0ld7FXwR75iyw78x2HqTHDnmkjQHTjiVix/UNdpTr
         iJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KRj1UVIpDRIOhg8kM5Gwly2DFgd9NtueKrNBYbLzuSg=;
        b=BjW2AFjiFhH2gLFImr+ioJVifL6T/SesB0ucaiLA47//XZDs2g2ltASfhMYOgxp3Da
         w44ij2cUzHO/ClaloJPRDa67YMAN57JIInN/18uuyvrPrHromBCFMKEqyzPMG96Mb/lD
         qDN42wzn+iyQqO2cw3S9tUnRGbQua89pxeeRHEJnczSCh72Lr6WGG4AXNQy0YVL19sr6
         wkM/JB4a6TEOWquG6qm6zXE6m+99sm/FCy0xFNO7omfT1sHraxkKjPHmIzX13/02LPTA
         rEKpWLkdl0EUaR/VghLyh24f41i+re2qf9Ajmp+m5e910Yjgy4/zO6zNI4XOS4oyL0T9
         J2dA==
X-Gm-Message-State: AOAM531EumLNZP1UYF+qckrW5v94jQHX3/U0TI6s//U2vPgxXq8YBoEk
        Z93oKLCOYV5ImwAdZmylzKelySSpJhWf/A==
X-Google-Smtp-Source: ABdhPJxFIc34wJQseaVVEOvclWeKZo5c7t3ovzZqyAAYNkKILXtjuc8lkwCwC5dghjldTuguLFpaXA==
X-Received: by 2002:a63:d506:: with SMTP id c6mr9665456pgg.396.1600063369184;
        Sun, 13 Sep 2020 23:02:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j35sm7085867pgi.91.2020.09.13.23.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:02:48 -0700 (PDT)
Message-ID: <5f5f0788.1c69fb81.84f9f.3073@mx.google.com>
Date:   Sun, 13 Sep 2020 23:02:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc4-496-g5ff48878bf9d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 290 runs,
 6 regressions (v5.9-rc4-496-g5ff48878bf9d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 290 runs, 6 regressions (v5.9-rc4-496-g5ff4887=
8bf9d)

Regressions Summary
-------------------

platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
bcm2837-rpi-3-b    | arm64 | lab-baylibre  | gcc-8    | defconfig          =
          | 3/4    =

bcm2837-rpi-3-b    | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b-32 | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig  =
          | 2/4    =

panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 4/5    =

panda              | arm   | lab-collabora | gcc-8    | omap2plus_defconfig=
          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc4-496-g5ff48878bf9d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc4-496-g5ff48878bf9d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5ff48878bf9d18cf69ea9afcec82d2c49da3066b =



Test Regressions
---------------- =



platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
bcm2837-rpi-3-b    | arm64 | lab-baylibre  | gcc-8    | defconfig          =
          | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5ed10f4c9aa41fa3a60935

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5ed10f4c9aa41f=
a3a60937
      failing since 10 days (last pass: v5.9-rc3-380-g4d386b9bd46d, first f=
ail: v5.9-rc3-474-gc41730a9bddc)
      1 lines

    2020-09-14 02:08:20.219000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-14 02:08:20.219000  (user:khilman) is already connected
    2020-09-14 02:08:35.839000  =00
    2020-09-14 02:08:35.861000  =

    2020-09-14 02:08:35.861000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-14 02:08:35.861000  =

    2020-09-14 02:08:35.861000  DRAM:  948 MiB
    2020-09-14 02:08:35.877000  RPI 3 Model B (0xa02082)
    2020-09-14 02:08:35.963000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-14 02:08:35.995000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
bcm2837-rpi-3-b    | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...OMI=
ZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5ed366a29f998ac5a60924

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5ed366a29f998a=
c5a60926
      failing since 3 days (last pass: v5.9-rc4-363-g1dfc67596dbb, first fa=
il: v5.9-rc4-402-gc7fa2d821136)
      1 lines

    2020-09-14 02:18:10.767000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-14 02:18:10.767000  (user:khilman) is already connected
    2020-09-14 02:18:26.801000  =00
    2020-09-14 02:18:26.801000  =

    2020-09-14 02:18:26.801000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-14 02:18:26.801000  =

    2020-09-14 02:18:26.802000  DRAM:  948 MiB
    2020-09-14 02:18:26.816000  RPI 3 Model B (0xa02082)
    2020-09-14 02:18:26.904000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-14 02:18:26.936000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
bcm2837-rpi-3-b-32 | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfig  =
          | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f5ed59af83d729ae1a60932

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5ed59af83d729=
ae1a60935
      new failure (last pass: v5.9-rc4-402-gc7fa2d821136)
      4 lines

    2020-09-14 02:29:35.164000  kern  :alert : pgd =3D 5598704e
    2020-09-14 02:29:35.165000  kern  :alert : [00000000] *pgd=3D041fe835, =
*pte=3D00000000, *ppte=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f5ed59af83d=
729ae1a60936
      new failure (last pass: v5.9-rc4-402-gc7fa2d821136)
      60 lines

    2020-09-14 02:29:35.167000  kern  :emerg : Process udevd (pid: 102, sta=
ck limit =3D 0xed00d45b)
    2020-09-14 02:29:35.172000  kern  :emerg : Stack: (0xc4219d68 to 0xc421=
a000)
    2020-09-14 02:29:35.207000  kern  :emerg : 9d60:                   c421=
9d94 c4219d78 c06292c0 c040f5e4 60000013 c4109000
    2020-09-14 02:29:35.208000  kern  :emerg : 9d80: ea539810 ea539810 c421=
9dac c4219d98 c06292f8 c0629284 ea539810 c4109000
    2020-09-14 02:29:35.209000  kern  :emerg : 9da0: c4219dbc c4219db0 c062=
9318 c06292e4 c4219de4 c4219dc0 c062bf64 c062930c
    2020-09-14 02:29:35.210000  kern  :emerg : 9dc0: ea539810 c4109000 ea53=
9810 c0e04248 00000fff ea539810 c4219e24 c4219de8
    2020-09-14 02:29:35.211000  kern  :emerg : 9de0: c04e7d1c c062bf18 c025=
3818 ea47e1c0 c0e5add0 ea539810 c4108000 00000fff
    2020-09-14 02:29:35.250000  kern  :emerg : 9e00: ea539810 64155b05 ea47=
e1c0 c4109000 ea539810 c4108000 c4219e4c c4219e28
    2020-09-14 02:29:35.251000  kern  :emerg : 9e20: c04e4ea0 c04e7be8 c415=
a000 c0e5add0 c0942a04 c4108000 00000fff ea539810
    2020-09-14 02:29:35.252000  kern  :emerg : 9e40: c4219e64 c4219e50 c04e=
3f18 c04e4e2c c415a000 00001000 c4219e94 c4219e68
    ... (49 line(s) more)
      =



platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5edae0f25599349ca60938

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5edae0f255993=
49ca6093c
      failing since 40 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-09-14 02:52:10.881000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-09-14 02:52:10.887000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-09-14 02:52:10.893000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-09-14 02:52:10.898000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-09-14 02:52:10.904000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-09-14 02:52:10.910000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-09-14 02:52:10.916000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-09-14 02:52:10.922000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-09-14 02:52:10.927000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-09-14 02:52:10.933000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform           | arch  | lab           | compiler | defconfig          =
          | results
-------------------+-------+---------------+----------+--------------------=
----------+--------
panda              | arm   | lab-collabora | gcc-8    | omap2plus_defconfig=
          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ed9ef81e62130f9a6091d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc4-49=
6-g5ff48878bf9d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ed9ef81e62130f9a60=
91e
      failing since 40 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =20
