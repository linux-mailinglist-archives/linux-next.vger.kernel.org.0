Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381953F959E
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 09:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244411AbhH0H4c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 03:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244448AbhH0H43 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 03:56:29 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9A3C0613CF
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 00:55:40 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q3so3436571plx.4
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JiweKRrLNetVcHJ9nINsfKOsjMVxwo6BjVAYcenVhBg=;
        b=Hm+PWfaBP4FSo74cGu/YlwYgbQpjnbGgEyvYZTHRVX91POWM1ozNfE8NraYXFy8fgw
         zWtIUg5TiIWi7t3+iOquzgCWX7HlWXHUyikqMSsLedQ/0zcvglsbkr0SRpyTDhR74m1W
         T1aH2zyJpf80Yn0/XsLG61QCfSGPLMY4mHTRl6mvxKhVBBtuSUpznjZwjGaiUsAygpMO
         8c/lveqm7+sUQVDHWvwaQpk6p2rilVUbHAkQthX1gTCJto9fAm0M8I0OtavUFzwKiUfF
         wP+LOf1aR/RLprfxsRvrGBQ1LCWWJ/RfGTaPg4+GECxFTHIe6B/TJYBVEsMMP4npgVZT
         AUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JiweKRrLNetVcHJ9nINsfKOsjMVxwo6BjVAYcenVhBg=;
        b=EJOpQcx0banmQ/P1N590F7Far/d83Zp1CcKsNPri4KPaq8EDuzlQSgNUdrv3lFSCPy
         Gb/KeJUUPxVwsTCBT4JRh1HO2WptJP5akzA0daFZDhunRgwi4DsJDZX8/THdXq63h1W+
         a+1LK5vX6cE9E/Oz7kPZUZfaZOTt6tEwtNM7WE7yMAuj4t36D1H/VOdizxgdd1q2XU4d
         AU/JkoiFqTd+iZ8iijVh7G9Q75CxQLjWtQEh2PERfVy07qK6+Nx6tKOK3ef/dP4Qszo5
         swVUp2bW9H5T18E81vAHA8PcGUYILdeHGZHJJHgU3VI8GJPYi7QUF9VgJK5XrjypNs2W
         r0HA==
X-Gm-Message-State: AOAM532B0izDFUe/Z4SjAESRj4Qj/b7aJsEoEZPoKi/rADVqP4yPaFTZ
        F8zsZUuis+hUisbTgfFLjDNY+xtVXkhoWXOH
X-Google-Smtp-Source: ABdhPJyui0VBqtrm4jYXx8SNK2wOJPRaYxWAoqxZ/bEbbSY0jCe8eN0OYHi9/ErJwcTcbNwPFU239g==
X-Received: by 2002:a17:90a:3fcb:: with SMTP id u11mr9422547pjm.178.1630050939907;
        Fri, 27 Aug 2021 00:55:39 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l12sm5770389pgc.41.2021.08.27.00.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 00:55:39 -0700 (PDT)
Message-ID: <61289a7b.1c69fb81.a72eb.007b@mx.google.com>
Date:   Fri, 27 Aug 2021 00:55:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.14-rc7-142-gd92736edf498
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 417 runs,
 15 regressions (v5.14-rc7-142-gd92736edf498)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 417 runs, 15 regressions (v5.14-rc7-142-gd9273=
6edf498)

Regressions Summary
-------------------

platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig            | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig+ima       | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =

beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =

fsl-ls1043a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig      =
              | 1          =

imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+crypt=
o             | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+crypt=
o             | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc7-142-gd92736edf498/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc7-142-gd92736edf498
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d92736edf4981cf1afe908d1524876086543a5f6 =



Test Regressions
---------------- =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/6128626fbfc003a1208e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6128626fbfc003a1208e2=
c83
        failing since 51 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6128666d69bd18b0258e2c7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6128666d69bd18b0258e2=
c7b
        failing since 51 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre | gcc-8    | bcm2835_defconf=
ig            | 1          =


  Details:     https://kernelci.org/test/plan/id/61285d0a9c7dcc41488e2c7c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61285d0a9c7dcc41488e2=
c7d
        failing since 51 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61285efa2624d000788e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61285efa2624d000788e2=
c79
        failing since 20 days (last pass: v5.14-rc4-200-g928b53f6fae6, firs=
t fail: v5.14-rc4-389-g3082d2ab7f69) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61286064d58b687f9b8e2c8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61286064d58b687f9b8e2=
c90
        failing since 45 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612861946541240f608e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612861946541240f608e2=
c7a
        failing since 3 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, first=
 fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
beagle-xm               | arm   | lab-baylibre | gcc-8    | omap2plus_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612862f6bbaae4d6418e2c86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612862f6bbaae4d6418e2=
c87
        failing since 3 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, first=
 fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
fsl-ls1043a-rdb         | arm64 | lab-nxp      | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612890970b73c7da878e2c82

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612890970b73c7da878e2=
c83
        new failure (last pass: v5.14-rc7-111-g9541ebae8a1d) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx6q-sabresd           | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61285f8642bb9213078e2caf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61285f8642bb9213078e2=
cb0
        failing since 305 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
imx8mp-evk              | arm64 | lab-nxp      | gcc-8    | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61288417bd974439038e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61288417bd974439038e2=
c79
        failing since 8 days (last pass: v5.14-rc5-288-gf8275649b86e, first=
 fail: v5.14-rc6-152-g898ee1d3a2b1) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61285e175580f946c58e2ca5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61285e175580f946c58e2=
ca6
        failing since 283 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie  | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6128963b98785b000c8e2c77

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6128963b98785b000c8e2=
c78
        failing since 283 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb    | arm   | lab-cip      | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61285e14bfe647b0e78e2cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61285e14bfe647b0e78e2=
ccf
        failing since 283 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+crypt=
o             | 1          =


  Details:     https://kernelci.org/test/plan/id/61286332aa3008165a8e2ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a6=
4-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61286332aa3008165a8e2=
cea
        new failure (last pass: v5.14-rc7-111-g9541ebae8a1d) =

 =



platform                | arch  | lab          | compiler | defconfig      =
              | regressions
------------------------+-------+--------------+----------+----------------=
--------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe   | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612866022ebc7aa0ee8e2c93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc7-1=
42-gd92736edf498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe=
/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612866022ebc7aa0ee8e2=
c94
        new failure (last pass: v5.14-rc6-176-g47f679bb94c5) =

 =20
