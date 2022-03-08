Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D184D1A50
	for <lists+linux-next@lfdr.de>; Tue,  8 Mar 2022 15:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240297AbiCHOXR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Mar 2022 09:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347453AbiCHOW5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2022 09:22:57 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724184B41C
        for <linux-next@vger.kernel.org>; Tue,  8 Mar 2022 06:21:59 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso2555837pjq.1
        for <linux-next@vger.kernel.org>; Tue, 08 Mar 2022 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FA1SVVOnjYcxccvd8HlsnHrJ5hMUvq927M8VgOPYitk=;
        b=H+U40NxoMw2vA9CbKxV14vGqVC1blXv5i1yi9Fs7UX/yeiHsqlga8SsyKa1uIwXdsF
         rSp+EnmQP34a0pmAr7vne0iC9bweJ/MYLEF16l/xYi9gWre68UQfOZpTifCr3f9dvRji
         wnMPyq6qSdRd0o7EaYj/R6QFwcL6iEhcFikoEM/wsSaKildxotdZO/apgrUYxU2lrw1V
         BT/8/Jknyk0TzO/18rgn/m1HRu783jtTJNLnB7guFtmrKVYWUrxRBXU3jYee6ePnPmmk
         7BrXizDdj5y2LyZIEny13GPzClvpNDTbPF9+2m9w7rQsW06Vf808xcmkYuou9bxtURUW
         lLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FA1SVVOnjYcxccvd8HlsnHrJ5hMUvq927M8VgOPYitk=;
        b=G//k1iD1g7KINMt+0u19MJK4pawtEIsV7HvfTUINOpSvuHBsk+r+ntgIQ+/BlYMCya
         qXEG/9rU5qUpL2idKL9bKTzH3ViH+LmA8RKQvqiA+DoYmgRlGBIRkvFHYLtY9oUnSINX
         OFGcQO9a+9EzVqe1/OZNN60WfBpSX396AjS+qsDQNJX7Pzj29qV/dzPcosReedf/O+qs
         iigqjyiowgz6QEMpNZmvV3L3ws22qPyALb/fFk2h4uXJPTjYz51ljVzxEhlI+cp4wQGb
         6ouHdARUTfLQiyhFsp26wsYdqS28tTQ6vvkGBPMUDO6WmMgRwBCQXNFh71WUVt1LBqIc
         fl3w==
X-Gm-Message-State: AOAM532kHRP3szJarzm6ja+7D7FdNVXEqAcoDofK67+8bUc6GgvKBKrg
        edGj4BmFg3QfwH1TW+cHq8SQmNTutzX1Tc7f2F4=
X-Google-Smtp-Source: ABdhPJwKbYrz+fYv8B2s/Wl1uZY3Paj5yQ21jtO2+yrQBQUvmntOvQJhCMhPlADuWGfvY8bSYAly+Q==
X-Received: by 2002:a17:90a:1b65:b0:1bf:41de:39f6 with SMTP id q92-20020a17090a1b6500b001bf41de39f6mr4940590pjq.137.1646749318326;
        Tue, 08 Mar 2022 06:21:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d202-20020a621dd3000000b004f6f21593cesm9230434pfd.220.2022.03.08.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:21:58 -0800 (PST)
Message-ID: <62276686.1c69fb81.80d78.6d65@mx.google.com>
Date:   Tue, 08 Mar 2022 06:21:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220308
Subject: next/master baseline: 466 runs, 24 regressions (next-20220308)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 466 runs, 24 regressions (next-20220308)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =

da850-lcdk                   | arm    | lab-baylibre  | clang-14 | multi_v5=
_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | multi_v5=
_defconfig           | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =

panda                        | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =

qemu_arm-vexpress-a9         | arm    | lab-baylibre  | gcc-10   | vexpress=
_defconfig           | 1          =

qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config+debug         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220308/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220308
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cb153b68ff91cbc434f3de70ac549e110543e1bb =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beaglebone-black             | arm    | lab-cip       | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62272e66e4c2e06b5fc629a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272e66e4c2e06b5fc62=
9aa
        failing since 3 days (last pass: next-20220201, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | clang-14 | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62272ea8e7ea06b50ac62a2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220226043049+f8ca5=
fabdb54-1~exp1~20220226043142.74)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v5_defconfig/clang-14/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272ea8e7ea06b50ac62=
a2b
        failing since 4 days (last pass: next-20220301, first fail: next-20=
220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62272ffd0c522fb047c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272ffd0c522fb047c62=
970
        failing since 4 days (last pass: next-20220301, first fail: next-20=
220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | multi_v5=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62272d543474441bc5c62985

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v5_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272d543474441bc5c62=
986
        failing since 3 days (last pass: next-20220301, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre  | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6227319fbd08d177dcc62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6227319fbd08d177dcc62=
969
        failing since 6 days (last pass: next-20220228, first fail: next-20=
220301) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx7d-sdb                    | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62272c0d7d4f52344bc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272c0d7d4f52344bc62=
976
        new failure (last pass: next-20220225) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/622730f2c833b833bbc62991

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622730f2c833b833bbc62=
992
        new failure (last pass: next-20220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62273129269c6ee4ebc6297c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62273129269c6ee4ebc62=
97d
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62272b1d1639327702c62977

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62272b1d1639327=
702c6297a
        new failure (last pass: next-20220303)
        2 lines

    2022-03-08T10:08:05.049540  kern  :alert : Mem abort info:
    2022-03-08T10:08:05.049632  kern  :alert :   ESR =3D 0x86000007
    2022-03-08T10:08:05.049705  kern  :alert :   EC =3D 0x21: IABT (current=
 EL), IL =3D 32 bits
    2022-03-08T10:08:05.049774  kern  :alert :   SE<8>[   18.553232] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-03-08T10:08:05.049841  T =3D 0,<8>[   18.560171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 5836867_1.5.2.4.1>
    2022-03-08T10:08:05.049906   FnV =3D 0
    2022-03-08T10:08:05.049969  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-03-08T10:08:05.050030  kern  :alert :   FSC =3D 0x07: level 3 tran=
slation fault
    2022-03-08T10:08:05.050091  kern  :alert : user pgtable: 64k pages, 48-=
bit VAs, pgdp=3D000000002f9a3200   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62272b1d1639327=
702c6297b
        new failure (last pass: next-20220303)
        9 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62272f874f000c7f77c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272f874f000c7f77c62=
969
        new failure (last pass: next-20220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/622734680f6deeba65c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622734680f6deeba65c62=
96a
        failing since 56 days (last pass: next-20220106, first fail: next-2=
0220110) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6227514f30f14b8081c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6227514f30f14b8081c62=
969
        new failure (last pass: next-20220217) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62273cb388df8e9888c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62273cb388df8e9888c62=
969
        new failure (last pass: next-20220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre  | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62272d4a3474441bc5c6297f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272d4a3474441bc5c62=
980
        failing since 4 days (last pass: next-20220301, first fail: next-20=
220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
panda                        | arm    | lab-baylibre  | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62272f9f492ca75b61c62997

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272f9f492ca75b61c62=
998
        failing since 3 days (last pass: next-20220201, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-baylibre  | gcc-10   | vexpress=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62272e27d7f22b8615c629a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272e27d7f22b8615c62=
9a4
        failing since 4 days (last pass: next-20220201, first fail: next-20=
220303) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386                    | i386   | lab-baylibre  | gcc-10   | i386_def=
config+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/62272e16d7f22b8615c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272e16d7f22b8615c62=
969
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre  | gcc-10   | i386_def=
config+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/62272e17d7f22b8615c6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62272e17d7f22b8615c62=
96c
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/622734a6780ff96b34c62992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622734a6780ff96b34c62=
993
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6227350a8cedf3a8cdc62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6227350a8cedf3a8cdc62=
987
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62273558d400b7accac62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62273558d400b7accac62=
975
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622732733ba22ada96c62969

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622732733ba22ada96c62=
96a
        new failure (last pass: next-20220304) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62273140c52f30bffec6296b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220308/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62273140c52f30bffec62=
96c
        failing since 3 days (last pass: next-20220303, first fail: next-20=
220304) =

 =20
