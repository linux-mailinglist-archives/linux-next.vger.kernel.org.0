Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB27629FF62
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 09:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgJ3IGk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 04:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3IGj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2020 04:06:39 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDCEC0613CF
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 01:06:39 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id w65so4600569pfd.3
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QzMvi5pTWA4FsD6IgLsJlBkNMdWAW8L5W2MEzKyT3yw=;
        b=mE7zR0bpJjk/rCWY+wQMG8qDhrL/9tXtbg44s/vGML/+6VWa3lVDtzWUXUKXX/qGl3
         BeFtEdaBj7CgNET3pqS8VmrG5pjKQEdRmZkQUuk3HzLggasQEyjqWy3aMtzUsq5RWlj8
         PrwsE29ZKnx7NKPCxqAZDjH2gWidhLpJmTM+W2LMgzxONLUhx7Ys4HpD0ILDZmO8aXk0
         j7/rlN6TwAYbebX0Dp4YqeysZNUKFUSpiRqn4sdiN8orS427qZJ9Noy6YTMdd6YOynTX
         ItxdwZPhkKtQFoCgit+kSv74fiD0tWlWFJjtK7a4ceh/R1s3kf0epknFu+ONSGECFjhN
         JfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QzMvi5pTWA4FsD6IgLsJlBkNMdWAW8L5W2MEzKyT3yw=;
        b=PDzf3bToJsGaJa21D0j242ZGRF2Cd3hF1iLrFISk3a4kAiJfWicgaWu0giqjYhfxQR
         vmSDIRDmtFTqMwn/37Qe7s0w1rs4xtycNfkIGtBqfZytwmqXFkcX1O0xQIlX1/YtCTbY
         ODkl0VOh0cSXVGnJf38hpTvcit3/bYYkMyxeUcyELIfxXs2T7YfK9ItD1cWRkqRcfz0c
         g2rMs7j3OmgaeJi6MsoM3JIydwKqjhWjOo/SvCVWAv2N7Yo2An99Q0R7Q+WS3cQ2Lgzr
         EumFGfZ8PGDaeGttGqyzQebOv8MGXuMM7YCzQ5sAb+7DlwyQspKBk5ajpQLvJJs0I6dd
         +m8Q==
X-Gm-Message-State: AOAM533ixiWWtxzgMft2orxZlGEOOyrLAEXpouXVC2Gwh8YDQ/BQeeD/
        fdUvbFxGOiNGMN9GRgL0sp3/2PdckrSlpw==
X-Google-Smtp-Source: ABdhPJwuugJESCqISwb0/ZedU6wpF2/qMEq6avDgVhrxyrR/PvOnwuD/DO5p8W6WKOpQSwDxvep68Q==
X-Received: by 2002:a17:90a:f198:: with SMTP id bv24mr1406045pjb.230.1604045198619;
        Fri, 30 Oct 2020 01:06:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6sm4968886pgn.9.2020.10.30.01.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 01:06:37 -0700 (PDT)
Message-ID: <5f9bc98d.1c69fb81.73b1f.b515@mx.google.com>
Date:   Fri, 30 Oct 2020 01:06:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-410-g125436cab6b8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 334 runs,
 9 regressions (v5.10-rc1-410-g125436cab6b8)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 334 runs, 9 regressions (v5.10-rc1-410-g125436=
cab6b8)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | multi_v7_defc=
onfig           | 2          =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =

panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc1-410-g125436cab6b8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc1-410-g125436cab6b8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      125436cab6b816dedf783dbbf1b09a95b45bfb4f =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b92029852863cd3381019

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f9b92029852863c=
d338101e
        new failure (last pass: v5.10-rc1-327-ge6d922c77db2)
        1 lines

    2020-10-30 04:07:35.598000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-10-30 04:07:35.599000+00:00  (user:khilman) is already connected
    2020-10-30 04:07:51.710000+00:00  =00
    2020-10-30 04:07:51.711000+00:00  =

    2020-10-30 04:07:51.726000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-10-30 04:07:51.727000+00:00  =

    2020-10-30 04:07:51.727000+00:00  DRAM:  948 MiB
    2020-10-30 04:07:51.741000+00:00  RPI 3 Model B (0xa02082)
    2020-10-30 04:07:51.833000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-10-30 04:07:51.865000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (379 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b9353fb35f3bfee381017

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9b9353fb35f3bfee381=
018
        failing since 4 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | multi_v7_defc=
onfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5f9b99962217d7f646381016

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabres=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9b99962217d7f=
64638101c
        new failure (last pass: v5.10-rc1-327-ge6d922c77db2)
        4 lines

    2020-10-30 04:41:22.906000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2020-10-30 04:41:22.907000+00:00  kern  :alert : pgd =3D 099b4ac1
    2020-10-30 04:41:22.907000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f9b99962217d7f=
64638101d
        new failure (last pass: v5.10-rc1-327-ge6d922c77db2)
        43 lines

    2020-10-30 04:41:22.952000+00:00  kern  :emerg : Process kworker/0:1 (p=
id: 29, stack limit =3D 0x3027e36b)
    2020-10-30 04:41:22.952000+00:00  kern  :emerg : Stack: (0xc2243d88 to =
0xc2244000)
    2020-10-30 04:41:22.952000+00:00  kern  :emerg : 3d80:                 =
  c4a471b0 c4a471b4 c4a47000 fffffdfb c2277f40 c09b9d5c
    2020-10-30 04:41:22.952000+00:00  kern  :emerg : 3da0: c2242000 7bc3103=
8 c4a47000 c4a47000 000002f3 c2277f40 00000018 c4a47000
    2020-10-30 04:41:22.953000+00:00  kern  :emerg : 3dc0: c144ddac c2276f8=
0 fffffdfb c09f6914 00000000 7bc31038 00000000 c4a47000
    2020-10-30 04:41:22.995000+00:00  kern  :emerg : 3de0: bf048000 c22e1c1=
0 fffffdfb c2277f40 c19c8aa0 0000000c c19c8abc bf0442a8
    2020-10-30 04:41:22.995000+00:00  kern  :emerg : 3e00: c4af2d40 c2eb7f0=
8 00000120 c22527c0 c2277f40 c09f6d18 c4af2d40 c4af2d40
    2020-10-30 04:41:22.996000+00:00  kern  :emerg : 3e20: 00000040 c4af2d4=
0 c2277f40 00000000 c19c8ab4 bf0b808c bf0b9014 00000016
    2020-10-30 04:41:22.996000+00:00  kern  :emerg : 3e40: ffffe000 c09f6df=
8 c222ac10 00000000 bf0b9014 00000000 00000000 c09ffb44
    2020-10-30 04:41:22.996000+00:00  kern  :emerg : 3e60: c222ac10 c1a79a2=
8 c1a79a30 00000000 00000000 c09fd9c8 c222ac10 bf0b9014 =

    ... (32 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b95f685e463976038101f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9b95f685e4639760381=
020
        failing since 4 days (last pass: v5.9-13195-g0281c5220c40, first fa=
il: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b946a628d8a2d4538104b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9b946a628d8a2d45381=
04c
        failing since 2 days (last pass: v5.10-rc1-155-gee89b55f83b5, first=
 fail: v5.10-rc1-241-g9727e4ed9bd3) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b92059852863cd3381022

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9b92059852863cd3381=
023
        new failure (last pass: v5.10-rc1-327-ge6d922c77db2) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b948b053565f73238106e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f9b948b053565f=
732381074
        failing since 86 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35)
        60 lines

    2020-10-30 04:20:12.750000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c802
    2020-10-30 04:20:12.755000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c803
    2020-10-30 04:20:12.761000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c804
    2020-10-30 04:20:12.767000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c805
    2020-10-30 04:20:12.772000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c806
    2020-10-30 04:20:12.778000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c807
    2020-10-30 04:20:12.784000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c808
    2020-10-30 04:20:12.790000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c809
    2020-10-30 04:20:12.796000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80a
    2020-10-30 04:20:12.802000+00:00  kern  :alert : BUG: Bad page state in=
 process swapper  pfn:9c80b =

    ... (49 line(s) more)  =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
panda                    | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/5f9b93e689961ea371381021

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc1-4=
10-g125436cab6b8/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5f9b93e689961ea371381=
022
        failing since 86 days (last pass: v5.8-1558-g0359180fcb42, first fa=
il: v5.8-3221-g983112062f35) =

 =20
