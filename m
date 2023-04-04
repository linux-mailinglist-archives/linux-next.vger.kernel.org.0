Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249C46D652A
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 16:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbjDDOWv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 10:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbjDDOWt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 10:22:49 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B004449F
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 07:22:37 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id w4so31387729plg.9
        for <linux-next@vger.kernel.org>; Tue, 04 Apr 2023 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680618156;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sSPUzjGk1lM8d7W/lUASmjfx+QeG1f0jdD49JwOQGko=;
        b=c2qrMAgVBIkKT4t9DGlouSXPUbmL70wUZmSRt34tiD0OVhA3ARJmCii059kNTHh4Jq
         +22bYWekTs+jw8SZptKLgGVjUyVYfkaf/zcOMkNRHkOJ/w8L48sO03N0Ysu5WGaVpdi0
         88b5+zblNDzTgreEvWW66igzrY3G/LpH/X4iDWzauNmi9N9xA7Pps2lrUCI23ovpmHEe
         QntNs27UwxH1uKx5ZpNnWi8NieM3PgZ++eG3XUuSEnJF5ODC/4U+JIpWWr5tmNJVnzUO
         AtpZh5JE8dc1vUMNVM+k+tmDB2EmR8wVY0RCIJ0JKFfoWgptWIBpNTy8ihvFJi/6+Lzj
         r1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618156;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSPUzjGk1lM8d7W/lUASmjfx+QeG1f0jdD49JwOQGko=;
        b=fs0hL1w/Ee8ek/CuCLL/C0L+za8RxxmB+N8TFhen5JNVr4AX2mO49axRiYXeO5twZ9
         fupHtm3AyToW2jWtYRqx4v/Yj1Q+m53b5OMHRvta6pCJg1S4KHUjXtIl+X9ZtZIjyJh9
         I/zDLHM/1nLHZStKOuHHRIjn8hhAryUOwHu1ivdiMcmeu1U68gE2WkX8OjVYRukXE6O4
         8SD84UJtjY5020CkFUly4Mup7wy+XvmjYE+L3az771lcuFioOOiDYoH+0BEQK1yu5no2
         tY4UmrS+V0tpbZfe7zhPQB8CLngXiD22rAr+t7CyoSNrgRKj9y7MdbJGuZs3Fav42zJl
         rw/Q==
X-Gm-Message-State: AAQBX9fGNc5w5X0MLHhmPArWI/4uTfk+UY+rHh+ABbJBKX0Y/gQyr/pJ
        ce5fkqYj3r2KuP66zQn5kBBVCgKfpi3RRSmFw82GHQ==
X-Google-Smtp-Source: AKy350YPem+5XiWbrSowggrRYiSF9sgJuFZCLBx2BvezXjvtoeCTA3vZGeMR7VqbJex5sRQd0e0G7A==
X-Received: by 2002:a17:902:da85:b0:1a2:769b:3d61 with SMTP id j5-20020a170902da8500b001a2769b3d61mr22688136plx.6.1680618155775;
        Tue, 04 Apr 2023 07:22:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i35-20020a631323000000b00502f017657dsm7560069pgl.83.2023.04.04.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:22:35 -0700 (PDT)
Message-ID: <642c32ab.630a0220.49ee6.edb0@mx.google.com>
Date:   Tue, 04 Apr 2023 07:22:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230404
Subject: next/master baseline: 610 runs, 35 regressions (next-20230404)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 610 runs, 35 regressions (next-20230404)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+debug              | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230404/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230404
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6a53bda3aaf3de5edeea27d0b1d8781d067640b6 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1fbfa57dc0b03e79e95f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1fbfa57dc0b03e79e964
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:41.274369  + set +x

    2023-04-04T13:01:41.280701  <8>[    9.940836] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861503_1.4.2.3.1>

    2023-04-04T13:01:41.383218  #

    2023-04-04T13:01:41.383584  =


    2023-04-04T13:01:41.484659  / # #export SHELL=3D/bin/sh

    2023-04-04T13:01:41.484897  =


    2023-04-04T13:01:41.585619  / # export SHELL=3D/bin/sh. /lava-9861503/e=
nvironment

    2023-04-04T13:01:41.585827  =


    2023-04-04T13:01:41.686749  / # . /lava-9861503/environment/lava-986150=
3/bin/lava-test-runner /lava-9861503/1

    2023-04-04T13:01:41.687126  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c21922a688aabf879e923

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c21922a688aabf879e928
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:13.914848  <8>[    7.888928] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861752_1.4.2.3.1>

    2023-04-04T13:09:13.918223  + set +x

    2023-04-04T13:09:14.023227  / # #

    2023-04-04T13:09:14.124240  export SHELL=3D/bin/sh

    2023-04-04T13:09:14.124429  #

    2023-04-04T13:09:14.225332  / # export SHELL=3D/bin/sh. /lava-9861752/e=
nvironment

    2023-04-04T13:09:14.225529  =


    2023-04-04T13:09:14.326452  / # . /lava-9861752/environment/lava-986175=
2/bin/lava-test-runner /lava-9861752/1

    2023-04-04T13:09:14.326770  =


    2023-04-04T13:09:14.332606  / # /lava-9861752/bin/lava-test-runner /lav=
a-9861752/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c217f9d15ac917779e922

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-CM140=
0CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c217f9d15ac917779e927
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:00.792427  + set<8>[   11.098560] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9861711_1.4.2.3.1>

    2023-04-04T13:09:00.792546   +x

    2023-04-04T13:09:00.897446  / # #

    2023-04-04T13:09:00.998490  export SHELL=3D/bin/sh

    2023-04-04T13:09:00.998702  #

    2023-04-04T13:09:01.099449  / # export SHELL=3D/bin/sh. /lava-9861711/e=
nvironment

    2023-04-04T13:09:01.099667  =


    2023-04-04T13:09:01.200627  / # . /lava-9861711/environment/lava-986171=
1/bin/lava-test-runner /lava-9861711/1

    2023-04-04T13:09:01.201015  =


    2023-04-04T13:09:01.205753  / # /lava-9861711/bin/lava-test-runner /lav=
a-9861711/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1fb12558f3a89779e951

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1fb12558f3a89779e956
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:30.496598  <8>[   11.186852] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861523_1.4.2.3.1>

    2023-04-04T13:01:30.500003  + set +x

    2023-04-04T13:01:30.605434  #

    2023-04-04T13:01:30.708619  / # #export SHELL=3D/bin/sh

    2023-04-04T13:01:30.709427  =


    2023-04-04T13:01:30.811357  / # export SHELL=3D/bin/sh. /lava-9861523/e=
nvironment

    2023-04-04T13:01:30.812166  =


    2023-04-04T13:01:30.914150  / # . /lava-9861523/environment/lava-986152=
3/bin/lava-test-runner /lava-9861523/1

    2023-04-04T13:01:30.915698  =


    2023-04-04T13:01:30.921031  / # /lava-9861523/bin/lava-test-runner /lav=
a-9861523/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2188a20423626879e942

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c2188a20423626879e947
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:18.807171  <8>[   10.099514] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861766_1.4.2.3.1>

    2023-04-04T13:09:18.810767  + set +x

    2023-04-04T13:09:18.912652  =


    2023-04-04T13:09:19.013667  / # #export SHELL=3D/bin/sh

    2023-04-04T13:09:19.013909  =


    2023-04-04T13:09:19.114871  / # export SHELL=3D/bin/sh. /lava-9861766/e=
nvironment

    2023-04-04T13:09:19.115053  =


    2023-04-04T13:09:19.216005  / # . /lava-9861766/environment/lava-986176=
6/bin/lava-test-runner /lava-9861766/1

    2023-04-04T13:09:19.216356  =


    2023-04-04T13:09:19.221069  / # /lava-9861766/bin/lava-test-runner /lav=
a-9861766/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre  | gcc-10   | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1e0fdd2598be0579e960

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c1e0fdd2598be0579e=
961
        failing since 62 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642c247f254ddce6a879e925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c247f254ddce6a879e=
926
        failing since 5 days (last pass: next-20230328, first fail: next-20=
230330) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/642c23db154bf6fba579e94e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c23db154bf6fba579e=
94f
        failing since 5 days (last pass: next-20230328, first fail: next-20=
230330) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c234e5f2bbf4a0a79e947

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c234e5f2bbf4a0a79e=
948
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c22497befdb436079e953

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c22497befdb436079e=
954
        failing since 4 days (last pass: next-20230330, first fail: next-20=
230331) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/642c27306cd532c66d79e956

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c27306cd532c66d79e=
957
        failing since 5 days (last pass: next-20230327, first fail: next-20=
230330) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
cubietruck                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c231213d805514f79e93b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c231213d805514f79e940
        failing since 76 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-04-04T13:15:44.484705  <8>[   12.802905] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3470130_1.5.2.4.1>
    2023-04-04T13:15:44.593048  / # #
    2023-04-04T13:15:44.694595  export SHELL=3D/bin/sh
    2023-04-04T13:15:44.694993  #
    2023-04-04T13:15:44.796184  / # export SHELL=3D/bin/sh. /lava-3470130/e=
nvironment
    2023-04-04T13:15:44.796532  =

    2023-04-04T13:15:44.897662  / # . /lava-3470130/environment/lava-347013=
0/bin/lava-test-runner /lava-3470130/1
    2023-04-04T13:15:44.898281  =

    2023-04-04T13:15:44.903433  / # /lava-3470130/bin/lava-test-runner /lav=
a-3470130/1
    2023-04-04T13:15:44.996147  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1f5a248e57f6c479e99b

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/642c1f5a248e57f=
6c479e9a2
        failing since 50 days (last pass: next-20230208, first fail: next-2=
0230213)
        29 lines

    2023-04-04T12:59:36.693920  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e9d200 pointer offset 4 size 512
    2023-04-04T12:59:36.728732  kern  :alert : Register r9 information: non=
-paged memory
    2023-04-04T12:59:36.729272  kern  :alert : Register r10 information: NU=
LL pointer
    2023-04-04T12:59:36.729648  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2d5000 allocated at load_module+0x690/0=
x1a80
    2023-04-04T12:59:36.730997  kern  :alert : Register r12 information: no=
n-paged memory
    2023-04-04T12:59:36.835184  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-04-04T12:59:36.835433  kern  :emerg : Process udevd (pid: 71, stac=
k limit =3D 0x0278f268)
    2023-04-04T12:59:36.835638  kern  :emerg : Stack: (0xc88f9d08 to 0xc88f=
a000)
    2023-04-04T12:59:36.835802  kern  :emerg : 9d00:                   c4e9=
d200 c0773860 00000000 c03af0a8 00000000 e83aa9f4
    2023-04-04T12:59:36.835947  kern  :emerg : 9d20: 0000005d e83aa9f4 c077=
3860 bf2d5220 00000000 00000000 00000000 00000001 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/642c26f0600eb8c3d979e950

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c26f0600eb8c3d979e=
951
        failing since 71 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c219f195bc68a4479e99d

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
42c219f195bc68a4479e9ae
        new failure (last pass: next-20230403)

    2023-04-04T13:09:28.716450  /usr/bin/tpm2_getcap

    2023-04-04T13:09:38.926593  /lava-9861724/1/../bin/lava-test-case

    2023-04-04T13:09:38.933579  <8>[   20.652690] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1f979656030a7c79e92b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1f979656030a7c79e930
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:05.462999  + <8>[   10.515825] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9861499_1.4.2.3.1>

    2023-04-04T13:01:05.463116  set +x

    2023-04-04T13:01:05.564745  #

    2023-04-04T13:01:05.665892  / # #export SHELL=3D/bin/sh

    2023-04-04T13:01:05.666116  =


    2023-04-04T13:01:05.767078  / # export SHELL=3D/bin/sh. /lava-9861499/e=
nvironment

    2023-04-04T13:01:05.767276  =


    2023-04-04T13:01:05.868172  / # . /lava-9861499/environment/lava-986149=
9/bin/lava-test-runner /lava-9861499/1

    2023-04-04T13:01:05.868624  =


    2023-04-04T13:01:05.872727  / # /lava-9861499/bin/lava-test-runner /lav=
a-9861499/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c218da20423626879e966

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c218da20423626879e96b
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:13.994796  + set +x

    2023-04-04T13:09:14.001593  <8>[    8.013118] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861721_1.4.2.3.1>

    2023-04-04T13:09:14.106165  / # #

    2023-04-04T13:09:14.207203  export SHELL=3D/bin/sh

    2023-04-04T13:09:14.207378  #

    2023-04-04T13:09:14.308271  / # export SHELL=3D/bin/sh. /lava-9861721/e=
nvironment

    2023-04-04T13:09:14.308458  =


    2023-04-04T13:09:14.409367  / # . /lava-9861721/environment/lava-986172=
1/bin/lava-test-runner /lava-9861721/1

    2023-04-04T13:09:14.409721  =


    2023-04-04T13:09:14.414514  / # /lava-9861721/bin/lava-test-runner /lav=
a-9861721/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1fa398b2aa876179e932

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1fa398b2aa876179e937
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:14.063959  <8>[   10.957878] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861482_1.4.2.3.1>

    2023-04-04T13:01:14.067585  + set +x

    2023-04-04T13:01:14.169119  / #

    2023-04-04T13:01:14.270119  # #export SHELL=3D/bin/sh

    2023-04-04T13:01:14.270302  =


    2023-04-04T13:01:14.370976  / # export SHELL=3D/bin/sh. /lava-9861482/e=
nvironment

    2023-04-04T13:01:14.371168  =


    2023-04-04T13:01:14.472155  / # . /lava-9861482/environment/lava-986148=
2/bin/lava-test-runner /lava-9861482/1

    2023-04-04T13:01:14.472413  =


    2023-04-04T13:01:14.477492  / # /lava-9861482/bin/lava-test-runner /lav=
a-9861482/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2182a20423626879e927

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c2182a20423626879e92c
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:08:59.504205  + set +x

    2023-04-04T13:08:59.510794  <8>[   10.305992] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861747_1.4.2.3.1>

    2023-04-04T13:08:59.613114  =


    2023-04-04T13:08:59.713927  / # #export SHELL=3D/bin/sh

    2023-04-04T13:08:59.714149  =


    2023-04-04T13:08:59.815080  / # export SHELL=3D/bin/sh. /lava-9861747/e=
nvironment

    2023-04-04T13:08:59.815350  =


    2023-04-04T13:08:59.916316  / # . /lava-9861747/environment/lava-986174=
7/bin/lava-test-runner /lava-9861747/1

    2023-04-04T13:08:59.916689  =


    2023-04-04T13:08:59.921366  / # /lava-9861747/bin/lava-test-runner /lav=
a-9861747/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1fb0a57dc0b03e79e938

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1fb0a57dc0b03e79e93d
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:29.688163  + set +x<8>[   11.088911] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 9861522_1.4.2.3.1>

    2023-04-04T13:01:29.688642  =


    2023-04-04T13:01:29.796526  / # #

    2023-04-04T13:01:29.899186  export SHELL=3D/bin/sh

    2023-04-04T13:01:29.899937  #

    2023-04-04T13:01:30.002006  / # export SHELL=3D/bin/sh. /lava-9861522/e=
nvironment

    2023-04-04T13:01:30.002912  =


    2023-04-04T13:01:30.105039  / # . /lava-9861522/environment/lava-986152=
2/bin/lava-test-runner /lava-9861522/1

    2023-04-04T13:01:30.106194  =


    2023-04-04T13:01:30.110920  / # /lava-9861522/bin/lava-test-runner /lav=
a-9861522/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c21915f923d322779e923

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c21915f923d322779e928
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:21.133458  + set<8>[   11.157393] <LAVA_SIGNAL_ENDRUN =
0_dmesg 9861760_1.4.2.3.1>

    2023-04-04T13:09:21.134018   +x

    2023-04-04T13:09:21.242057  / # #

    2023-04-04T13:09:21.344895  export SHELL=3D/bin/sh

    2023-04-04T13:09:21.345784  #

    2023-04-04T13:09:21.447636  / # export SHELL=3D/bin/sh. /lava-9861760/e=
nvironment

    2023-04-04T13:09:21.448558  =


    2023-04-04T13:09:21.550530  / # . /lava-9861760/environment/lava-986176=
0/bin/lava-test-runner /lava-9861760/1

    2023-04-04T13:09:21.551733  =


    2023-04-04T13:09:21.556665  / # /lava-9861760/bin/lava-test-runner /lav=
a-9861760/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c202c63eec1cbed79e99a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c202c63eec1cbed79e=
99b
        failing since 357 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/642c21ce2322d5d4ee79e948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c21ce2322d5d4ee79e=
949
        new failure (last pass: next-20230403) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1fbbc1c0e2082f79e94c

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1fbcc1c0e2082f79e951
        failing since 6 days (last pass: next-20230327, first fail: next-20=
230328)

    2023-04-04T13:01:25.425532  <8>[   11.316092] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861463_1.4.2.3.1>

    2023-04-04T13:01:25.530370  / # #

    2023-04-04T13:01:25.631501  export SHELL=3D/bin/sh

    2023-04-04T13:01:25.631735  #

    2023-04-04T13:01:25.732677  / # export SHELL=3D/bin/sh. /lava-9861463/e=
nvironment

    2023-04-04T13:01:25.732887  =


    2023-04-04T13:01:25.833654  / # . /lava-9861463/environment/lava-986146=
3/bin/lava-test-runner /lava-9861463/1

    2023-04-04T13:01:25.833999  =


    2023-04-04T13:01:25.838853  / # /lava-9861463/bin/lava-test-runner /lav=
a-9861463/1

    2023-04-04T13:01:25.845627  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2187a20423626879e935

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c2187a20423626879e93a
        failing since 6 days (last pass: next-20230324, first fail: next-20=
230328)

    2023-04-04T13:09:05.787297  <8>[   11.617097] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9861734_1.4.2.3.1>

    2023-04-04T13:09:05.891493  / # #

    2023-04-04T13:09:05.992619  export SHELL=3D/bin/sh

    2023-04-04T13:09:05.992824  #

    2023-04-04T13:09:06.093706  / # export SHELL=3D/bin/sh. /lava-9861734/e=
nvironment

    2023-04-04T13:09:06.093917  =


    2023-04-04T13:09:06.194821  / # . /lava-9861734/environment/lava-986173=
4/bin/lava-test-runner /lava-9861734/1

    2023-04-04T13:09:06.195106  =


    2023-04-04T13:09:06.199506  / # /lava-9861734/bin/lava-test-runner /lav=
a-9861734/1

    2023-04-04T13:09:06.206226  + export 'TESTRUN_ID=3D1_bootrr'
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/642c21f987ed4d6c3479e932

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c21f987ed4d6c3479e=
933
        failing since 12 days (last pass: next-20230322, first fail: next-2=
0230323) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642c004342652057f779e930

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c004342652057f779e=
931
        failing since 67 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfeef0bf19db4c479e944

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642bfeef0bf19db4c479e=
945
        failing since 70 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora | clang-13 | cros://c=
hrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/642bfe28cfdf2cc9a279e936

  Results:     177 PASS, 8 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-apmixedsys-probed: https://kernelci.org/test=
/case/id/642bfe28cfdf2cc9a279e9cf
        failing since 14 days (last pass: next-20230316, first fail: next-2=
0230321)

    2023-04-04T10:37:57.369603  /lava-9858403/1/../bin/lava-test-case

    2023-04-04T10:37:57.375927  <8>[    5.926353] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-apmixedsys-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2022196c55282679e951

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c2022196c55282679e=
952
        failing since 224 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip       | gcc-10   | shmobile=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/642c21e24199ff483a79e9c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c21e24199ff483a79e=
9ca
        failing since 20 days (last pass: next-20230310, first fail: next-2=
0230315) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2181a4c61bbc0479e928

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c2181a4c61bbc0479e=
929
        failing since 133 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1f7a18fd83227c79e933

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/642c1f7a18fd83227c79e=
934
        failing since 133 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre  | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/642c1f84ec5d97ea1079e933

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c1f84ec5d97ea1079e938
        failing since 70 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-04-04T13:00:32.849002  <8>[    7.484143] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3469985_1.5.2.4.1>
    2023-04-04T13:00:32.954561  / # #
    2023-04-04T13:00:33.056455  export SHELL=3D/bin/sh
    2023-04-04T13:00:33.056953  #
    2023-04-04T13:00:33.158286  / # export SHELL=3D/bin/sh. /lava-3469985/e=
nvironment
    2023-04-04T13:00:33.158720  =

    2023-04-04T13:00:33.260065  / # . /lava-3469985/environment/lava-346998=
5/bin/lava-test-runner /lava-3469985/1
    2023-04-04T13:00:33.260854  =

    2023-04-04T13:00:33.266266  / # /lava-3469985/bin/lava-test-runner /lav=
a-3469985/1
    2023-04-04T13:00:33.412314  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe    | gcc-10   | sunxi_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/642c2109e64fa808d879e922

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230404/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230404/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230324.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/642c210ae64fa808d879e927
        failing since 0 day (last pass: next-20230331, first fail: next-202=
30403)

    2023-04-04T13:06:56.956778  <8>[    7.349800] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 420796_1.5.2.4.1>
    2023-04-04T13:06:57.061807  / # #
    2023-04-04T13:06:57.163908  export SHELL=3D/bin/sh
    2023-04-04T13:06:57.164536  #
    2023-04-04T13:06:57.266009  / # export SHELL=3D/bin/sh. /lava-420796/en=
vironment
    2023-04-04T13:06:57.266642  =

    2023-04-04T13:06:57.368037  / # . /lava-420796/environment/lava-420796/=
bin/lava-test-runner /lava-420796/1
    2023-04-04T13:06:57.368916  =

    2023-04-04T13:06:57.372693  / # /lava-420796/bin/lava-test-runner /lava=
-420796/1
    2023-04-04T13:06:57.478214  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
