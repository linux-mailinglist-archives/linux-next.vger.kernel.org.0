Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C42728F2DF
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 15:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgJONBS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 09:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgJONBS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 09:01:18 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06024C061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 06:01:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id p21so1813126pju.0
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9raqqn/5jHZCrFzpheBnmRPKw1y47e6MsiUx4VCwgpo=;
        b=0BK6rWhNZwEDlMiHFZ2ynLChclYUTQdlpA5fZAqLIu9BVt59m5tzrWQS4gbPLEA1Ch
         g2X40AjZ2iDp+YOMIrnESMe9/iA5RCxlw7g3fG3R0MdkigcL3CUtKudq9NrWpLa96qF0
         dSqh3ufhAnacbA5aaQX+JgfhG4Uq+s3iFnK3SmPP2mety/FaQFFC1sQdbzOIxqhPg19Y
         Ckdst0ZqEYK/rKP5vPLfOM6lwon1gkYid3NjzzBsuPu/877HCvidkHJQmSKQvq+bG07V
         pF8A70hnJ7KkcHb4EwkU1rfcsWxLrdilFyycZkr7MXFkIgjcynD8WetsTODuMoERjrlO
         McoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9raqqn/5jHZCrFzpheBnmRPKw1y47e6MsiUx4VCwgpo=;
        b=Yf/GkYEaXtBrTwwGgXRTPuT+Fa1h4uoga6E79yJ8ploLHkwkKhRR0W6FaAkIADcpsL
         1cA8Lnx3bjnvVZ4MvjiusQrpqpgxIp93ZnXR9qwQuP+BcxYXfRJUHk/skw6lYHcnE/e3
         VB3nrsbP3oAlFgbTr+RXQF3JflapePzWSqGsaElZ8ORbParfAfbl1zGtwjNKBOL7cg+3
         dHJM0Vl8mc3fYTQXQgnIDWM83zckVgjymO4bnZ1gEQBVvrqJAz3W7b/GwAs7KccNJo37
         lAr0lR5PWdQtCOF4tLcRDifM7yJhy1Zwet7tNMoI9egGxto9TC3KHpl/3vYqNcLMrfjt
         JWUA==
X-Gm-Message-State: AOAM533ZurFdLxRtMAxpsHBtcrrkJsVPS/iVu5zh9sXIvbYTTmFiYMbH
        yNSJOF4I+1pyCMvjxDbx1JtgEln05aM/Bg==
X-Google-Smtp-Source: ABdhPJyhWBzVk5PDsQipEaS+sbi+u1aOnemKZfGy4nXftoHH6ADbSEvPqVhBfm2GaPyLB2sfHERA4g==
X-Received: by 2002:a17:90a:73c9:: with SMTP id n9mr4199802pjk.90.1602766876482;
        Thu, 15 Oct 2020 06:01:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q15sm3390389pjp.26.2020.10.15.06.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 06:01:15 -0700 (PDT)
Message-ID: <5f88481b.1c69fb81.c0246.6a09@mx.google.com>
Date:   Thu, 15 Oct 2020 06:01:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20201015
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 636 runs, 8 regressions (next-20201015)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 636 runs, 8 regressions (next-20201015)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =

panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201015/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201015
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      03d992bd2de6c7f2c9bbd4260ff104c0926ce3ff =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8812c61f3bc65e6e4ff3ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8812c61f3bc65e6e4ff=
3ed
      failing since 169 days (last pass: next-20200424, first fail: next-20=
200428)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f881720a72ea277a14ff3ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f881720a72ea277a14ff=
3ef
      failing since 14 days (last pass: next-20200929, first fail: next-202=
00930)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f880ede273033d4bb4ff3f1

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f880ede273033d4=
bb4ff3f5
      new failure (last pass: next-20201013)
      1 lines

    2020-10-15 08:55:00.635000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 08:55:00.635000  (user:khilman) is already connected
    2020-10-15 08:55:16.314000  =00
    2020-10-15 08:55:16.315000  =

    2020-10-15 08:55:16.315000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 08:55:16.315000  =

    2020-10-15 08:55:16.315000  DRAM:  948 MiB
    2020-10-15 08:55:16.330000  RPI 3 Model B (0xa02082)
    2020-10-15 08:55:16.417000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 08:55:16.450000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (380 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f88149f8b8fc13ec64ff3e0

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f88149f8b8fc13e=
c64ff3e4
      failing since 13 days (last pass: next-20200930, first fail: next-202=
01001)
      1 lines

    2020-10-15 09:19:33.621000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 09:19:33.621000  (user:khilman) is already connected
    2020-10-15 09:19:48.899000  =00
    2020-10-15 09:19:48.899000  =

    2020-10-15 09:19:48.899000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 09:19:48.899000  =

    2020-10-15 09:19:48.900000  DRAM:  948 MiB
    2020-10-15 09:19:48.915000  RPI 3 Model B (0xa02082)
    2020-10-15 09:19:49.004000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 09:19:49.035000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (380 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f880f88c3330021074ff47b

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f880f88c3330021=
074ff47f
      failing since 1 day (last pass: next-20201009, first fail: next-20201=
013)
      1 lines

    2020-10-15 08:57:48.131000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 08:57:48.131000  (user:khilman) is already connected
    2020-10-15 08:58:03.885000  =00
    2020-10-15 08:58:03.886000  =

    2020-10-15 08:58:03.886000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 08:58:03.886000  =

    2020-10-15 08:58:03.886000  DRAM:  948 MiB
    2020-10-15 08:58:03.902000  RPI 3 Model B (0xa02082)
    2020-10-15 08:58:03.989000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 08:58:04.021000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f88112468a0c7f4be4ff40a

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f88112468a0c7f4=
be4ff40e
      new failure (last pass: next-20201013)
      1 lines

    2020-10-15 09:04:37.075000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-15 09:04:37.075000  (user:khilman) is already connected
    2020-10-15 09:04:52.457000  =00
    2020-10-15 09:04:52.458000  =

    2020-10-15 09:04:52.458000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-15 09:04:52.458000  =

    2020-10-15 09:04:52.458000  DRAM:  948 MiB
    2020-10-15 09:04:52.474000  RPI 3 Model B (0xa02082)
    2020-10-15 09:04:52.561000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-15 09:04:52.593000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (379 line(s) more)
      =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8811d1cc805c71964ff3e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8811d1cc805c71964ff=
3e1
      failing since 35 days (last pass: next-20200818, first fail: next-202=
00909)  =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
panda                 | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f8812c11f3bc65e6e4ff3e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201015/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201015/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-3-g27eeeac7da2d/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f8812c11f3bc65e6e4ff=
3ea
      failing since 85 days (last pass: next-20200706, first fail: next-202=
00721)  =20
