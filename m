Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D4A2245DD
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 23:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGQVfC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 17:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgGQVfB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 17:35:01 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB2CC0619D2
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 14:34:56 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ch3so7103216pjb.5
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Qlas9CroAP0Xok+YsvgtToZUguIKAQWCDqbHrR8hiEI=;
        b=QvBMes4RO9Oubui4M2V9bql1Md3UbfaaA1hLLHu5z+1ykE8XkxZTDB+tL0mUXRJ115
         ZlQZ3m4hAVXY0h0dYkiuZ4+MF3Ro98PdFavj6q0gDY5kveshFPJXrvGYsEMgWidfTlAX
         3UON8ayLOt13x9ZLmNiHtZJH0u3OFlKHMEfK2DOWsrZR3VDkwjdnCgy82a42SPuKsxY0
         nVN3W6ZNNPKm5aQcat5pqVncl0Zo1A4D2nyL3yE6ef18slxRnZk3SY8kggER9h0cey5I
         jk6FVFsOOonYjJinbYIPT97fVEuOI2/qUEJyRwy+RPrGu+kGpkygF9o2Fdjrco23ZMZe
         bO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Qlas9CroAP0Xok+YsvgtToZUguIKAQWCDqbHrR8hiEI=;
        b=Y8y/LzVoGHFbtWWKT1lalhNnGC2VqaxxXwIGMsl9VVNNj8AAIZ9jikA4u30xCAhld8
         gBOHQkBRZRi3iy5gBupXNSIgrUbHzmNxB6Vg0hdZqtxEZj+Z4M7Y/F4eil+vJJs0a8gs
         /Ou8o6wXdIVesnCLiXvbf0wYzQqbIQgTlq2GOGz+rlqE/xgVE8Pl2jMzuxkVldoG641r
         SMhlIhkexnVwSRy90pp3D1TsBVfsgq/bNsXpfxsDYCWZDqu9CLKr7wnk7em4B4zNGZLO
         BusRdo4hoU4A5Ewcttv4qzQSOUN0+8ajCAbp4ec+L6jW5gQjsEyMOM6PD3mIFkuCtPwo
         uV3w==
X-Gm-Message-State: AOAM532cl/EytI1GnB4RvvQM2eNACIJkEEB9+AoPBwKmVgtjc9OJpoRZ
        ZnDg6U+1nN3pWh/75lf3VAnGNRBdYzw=
X-Google-Smtp-Source: ABdhPJxXpVTbf5nzVMqI0qWRb/GqLxYvc8ipdxGng/FWBlKOSA96K11MyfO5NhiJSnLSNYLHmPZfTA==
X-Received: by 2002:a17:90a:26c6:: with SMTP id m64mr11643922pje.215.1595021693120;
        Fri, 17 Jul 2020 14:34:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id bf11sm3671168pjb.48.2020.07.17.14.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 14:34:52 -0700 (PDT)
Message-ID: <5f12197c.1c69fb81.ccd8b.d615@mx.google.com>
Date:   Fri, 17 Jul 2020 14:34:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200717
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 218 runs, 22 regressions (next-20200717)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 218 runs, 22 regressions (next-20200717)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre | gcc-8    | sama5_defcon=
fig              | 0/1    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 4/5    =

bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =

imx6q-var-dt6customboard   | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =

omap4-panda                | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 4/5    =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig   =
                 | 0/1    =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 0/1    =

sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 0/1    =

sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | sunxi_defcon=
fig              | 0/1    =

vexpress-v2p-ca15-tc1      | arm   | lab-baylibre | gcc-8    | vexpress_def=
config           | 3/5    =

vexpress-v2p-ca15-tc1      | arm   | lab-cip      | gcc-8    | vexpress_def=
config           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200717/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200717
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aab7ee9f8ff0110bfcd594b33dc33748dc1baf46 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
at91-sama5d4_xplained      | arm   | lab-baylibre | gcc-8    | sama5_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11d8db790192800885bb42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11d8db790192800885b=
b43
      failing since 80 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11e13838f766142685bb18

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f11e13838f76614=
2685bb1b
      new failure (last pass: next-20200716)
      1 lines =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
bcm2837-rpi-3-b            | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11e66322f4f946ea85bb1e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f11e66322f4f946=
ea85bb21
      failing since 2 days (last pass: next-20200714, first fail: next-2020=
0715)
      2 lines =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
imx6q-var-dt6customboard   | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e16fd9dcaa124f85bb40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e16fd9dcaa124f85b=
b41
      failing since 11 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11dc8e8955f9822c85bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11dc8e8955f9822c85b=
b27
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
omap4-panda                | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11dfe822839635e485bb1f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f11dfe82283963=
5e485bb23
      failing since 2 days (last pass: next-20200710, first fail: next-2020=
0715)
      60 lines =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
omap4-panda                | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f11e109141477decd85bb30

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f11e109141477d=
ecd85bb34
      failing since 3 days (last pass: next-20200713, first fail: next-2020=
0714)
      60 lines =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e252f91515a7fe85bb18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e252f91515a7fe85b=
b19
      failing since 11 days (last pass: next-20200703, first fail: next-202=
00706) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e70a3d81b3acb285bb3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e70a3d81b3acb285b=
b40
      failing since 1 day (last pass: next-20200715, first fail: next-20200=
716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre | clang-10 | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e43a4658132d9e85bb19

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e43a4658132d9e85b=
b1a
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11deed0fc7d18c9685bb20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11deed0fc7d18c9685b=
b21
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig   =
                 | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e2bd54f8d39d7d85bb22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e2bd54f8d39d7d85b=
b23
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun50i-a64-pine64-plus     | arm64 | lab-baylibre | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e79b7e8783004185bb27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e79b7e8783004185b=
b28
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2      | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11df6cebd5bb8a4a85bb30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11df6cebd5bb8a4a85b=
b31
      new failure (last pass: next-20200715) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2      | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e1af34a915e36b85bb3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e1af34a915e36b85b=
b40
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11df933cc32f2d3c85bb1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11df933cc32f2d3c85b=
b1e
      new failure (last pass: next-20200715) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-cubieboard2      | arm   | lab-clabbe   | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e1ab34a915e36b85bb39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e1ab34a915e36b85b=
b3a
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e0003e63dff69d85bb34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e0003e63dff69d85b=
b35
      new failure (last pass: next-20200715) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | multi_v7_def=
config           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11e25af91515a7fe85bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11e25af91515a7fe85b=
b27
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
sun7i-a20-olinuxino-lime2  | arm   | lab-baylibre | gcc-8    | sunxi_defcon=
fig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f11da6f7d0ecc620585bb2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f11da6f7d0ecc620585b=
b2d
      new failure (last pass: next-20200716) =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
vexpress-v2p-ca15-tc1      | arm   | lab-baylibre | gcc-8    | vexpress_def=
config           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f11dab57d0ecc620585bb48

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f11dab57d0ecc62=
0585bb4b
      failing since 41 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                   | arch  | lab          | compiler | defconfig   =
                 | results
---------------------------+-------+--------------+----------+-------------=
-----------------+--------
vexpress-v2p-ca15-tc1      | arm   | lab-cip      | gcc-8    | vexpress_def=
config           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5f11daad7d0ecc620585bb37

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200717/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200717/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f11daad7d0ecc62=
0585bb3a
      failing since 41 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
