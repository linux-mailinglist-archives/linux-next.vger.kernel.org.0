Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB8057D032
	for <lists+linux-next@lfdr.de>; Thu, 21 Jul 2022 17:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233419AbiGUPsL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jul 2022 11:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiGUPr5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2022 11:47:57 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7323DF1E
        for <linux-next@vger.kernel.org>; Thu, 21 Jul 2022 08:45:36 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b9so2089406pfp.10
        for <linux-next@vger.kernel.org>; Thu, 21 Jul 2022 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bnF2CQd0WzZJkb4IOFqbPBIpTV/Bgm+HpzacyV/ho8U=;
        b=V6JuZqbK4U3FwWgmIuVILTB406K3AsyO/R0YsicdYXasp9ZHvhuHe6WRfXCE48u31b
         LdA8/QBwq7Z/4ynlIDBCUDNJR+qiRZLYlO2uazMDLaVyuXHvKKUNvxkAXkQl+ABT2k+c
         43jQ6cQY4UdChEGzeSKnrTgu0VkvhCEEzdtnvs7ugZMdB5in38l0TF9CpTDJh/JEoA/b
         YKSGlIGong5Qw2XXkhXvG1XrAa74JZraMfj7D8tJXe0fP+5VY/HhMR3wXCgAMGBuJKhV
         oLG4f60ihVDN7+PI5PzSJEsnj54WoWhSoxsxjLRrNEsjPz5qmPGksPlXAxs3GyXffdGy
         Sn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bnF2CQd0WzZJkb4IOFqbPBIpTV/Bgm+HpzacyV/ho8U=;
        b=c3ciqGUfmUsK0yqtm7HeThT7i2zopt+WRi8sZ2fsfo/1cId3JpLhcuIfRzDaV9dr0x
         Z/LHYUiN4WC1+H0b2iE5LvbxX2doyA6terTLvSmcQStK3OXc8p4NR8eXVwKFd8vnPlxk
         0SHrSRgGT/n2d4w2hmXtpKWkqTCBQANkVXkhsOw5bpZI6XpIZHdDIXqlJ0Oq6nhbsfHu
         vJ/0cC7SnyXSCImLaD4ykNedB4Uhrx7wgcDH40lK55UcBcW5CxLp/Uvr1q37rz4m6PMH
         S/xdVJA6gYYaLBax9Gd9GAup1EH2Fqly/VSqShjgRCeGKw+U310ieTSCikKDd4PPKwEL
         fqog==
X-Gm-Message-State: AJIora+IZc2qrR5v5HPRaH9EXGVrhRrehFEgiqiINakaBxf1etw4RH54
        ssTODylDzPT91maEfUbCNFKVfBWEcvdq3awLwpg=
X-Google-Smtp-Source: AGRyM1uzASNRhQ30M8h7QpI6JF+gYYKCkjYcFvR/WwdnAs+SSCAXIFJhTUR4BwByTxC8tvG0xgvKzw==
X-Received: by 2002:a62:5bc5:0:b0:528:c346:9632 with SMTP id p188-20020a625bc5000000b00528c3469632mr44332237pfb.48.1658418335642;
        Thu, 21 Jul 2022 08:45:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m4-20020a170902d18400b0016bf803341asm1813105plb.146.2022.07.21.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:45:35 -0700 (PDT)
Message-ID: <62d9749f.1c69fb81.f6516.2e95@mx.google.com>
Date:   Thu, 21 Jul 2022 08:45:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220721
Subject: next/master baseline: 387 runs, 31 regressions (next-20220721)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 387 runs, 31 regressions (next-20220721)

Regressions Summary
-------------------

platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | clang-15 | multi_v7=
_defconfig           | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig           | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | omap2plu=
s_defconfig          | 1          =

beagle-xm                    | arm  | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm  | lab-broonie     | clang-15 | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm  | lab-cip         | clang-15 | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defconfig           | 1          =

beaglebone-black             | arm  | lab-broonie     | gcc-10   | omap2plu=
s_defconfig          | 1          =

beaglebone-black             | arm  | lab-cip         | gcc-10   | omap2plu=
s_defconfig          | 1          =

imx6dl-riotboard             | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =

imx7d-sdb                    | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx7ulp-evk                  | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-10   | oxnas_v6=
_defconfig           | 1          =

panda                        | arm  | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =

panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =

panda                        | arm  | lab-baylibre    | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220721/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220721
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a3fd3ca134d9485a0f9a7bdcffd7f8bae27f79d3 =



Test Regressions
---------------- =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d96009dcab2019abdaf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220718071842+df42d=
63d3706-1~exp1~20220718071946.323)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d96009dcab2019abdaf=
062
        failing since 35 days (last pass: next-20220606, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d95ebc291e471fcedaf18c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d95ebc291e471fcedaf=
18d
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d961000ad150001fdaf0dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d961000ad150001fdaf=
0de
        failing since 35 days (last pass: next-20220601, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d961509a3a35e90bdaf082

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d961509a3a35e90bdaf=
083
        failing since 30 days (last pass: next-20220610, first fail: next-2=
0220621) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62d961645997224e03daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d961645997224e03daf=
058
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15            | arm  | lab-linaro-lkft | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d960c6c89c5e43afdaf0fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d960c6c89c5e43afdaf=
0ff
        failing since 33 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beagle-xm                    | arm  | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d943cbb46891d921daf088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220718071842+df42d=
63d3706-1~exp1~20220718071946.323)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d943cbb46891d921daf=
089
        failing since 2 days (last pass: next-20220714, first fail: next-20=
220718) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-broonie     | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d943f88852dc2998daf0e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220718071842+df42d=
63d3706-1~exp1~20220718071946.323)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d943f88852dc2998daf=
0ea
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-cip         | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94908c5b98f0b6cdaf086

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220718071842+df42d=
63d3706-1~exp1~20220718071946.323)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94908c5b98f0b6cdaf=
087
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d942938a9dcc17e5daf094

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d942938a9dcc17e5daf=
095
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9454df68b0f118fdaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d9454df68b0f118fdaf=
057
        failing since 35 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-broonie     | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9458cf68b0f118fdaf0ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d9458cf68b0f118fdaf=
0ac
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9428c590c29995bdaf062

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d9428c590c29995bdaf=
063
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94e58a1a5d4e3aadaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94e58a1a5d4e3aadaf=
057
        failing since 35 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-cip         | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94fc01883f91f71daf059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94fc01883f91f71daf=
05a
        failing since 35 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-broonie     | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d944381580c152c6daf075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d944381580c152c6daf=
076
        failing since 33 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
beaglebone-black             | arm  | lab-cip         | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94cf0ff36acd3d5daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94cf0ff36acd3d5daf=
057
        failing since 33 days (last pass: next-20220610, first fail: next-2=
0220617) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6dl-riotboard             | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62d949f5bc5abd2682daf06b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62d949f5bc5abd2=
682daf073
        failing since 1 day (last pass: next-20220707, first fail: next-202=
20719)
        32 lines

    2022-07-21T12:43:14.915653  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:4  pfn:397c4
    2022-07-21T12:43:14.924561  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b0
    2022-07-21T12:43:14.933552  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397af
    2022-07-21T12:43:14.933745  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ae
    2022-07-21T12:43:14.942545  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397ba
    2022-07-21T12:43:14.951522  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b9
    2022-07-21T12:43:14.951687  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:3974f
    2022-07-21T12:43:14.960642  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:397b1
    2022-07-21T12:43:14.969731  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:3979e
    2022-07-21T12:43:14.970028  kern  :alert : BUG: Bad page state in proce=
ss kworker/0:0  pfn:3979d =

    ... (22 line(s) more)  =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94239d071df9f2edaf0aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94239d071df9f2edaf=
0ab
        failing since 72 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d942c5da42b2baf4daf062

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d942c5da42b2baf4daf=
063
        failing since 72 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d94829320b69dbfddaf075

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d94829320b69dbfddaf=
076
        failing since 72 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx6ul-pico-hobbit           | arm  | lab-pengutronix | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d948b536d1caa209daf07b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d948b536d1caa209daf=
07c
        failing since 72 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx7d-sdb                    | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d941c65b3c6e1466daf0a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d941c65b3c6e1466daf=
0a3
        failing since 2 days (last pass: next-20220707, first fail: next-20=
220718) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
imx7ulp-evk                  | arm  | lab-nxp         | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d941c9af8c96a380daf059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d941c9af8c96a380daf=
05a
        failing since 41 days (last pass: next-20220601, first fail: next-2=
0220610) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
jetson-tk1                   | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9401f173added8adaf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d9401f173added8adaf=
058
        failing since 100 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
ox820-clouden...lug-series-3 | arm  | lab-baylibre    | gcc-10   | oxnas_v6=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d93d52b0acbb5e07daf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d93d52b0acbb5e07daf=
077
        failing since 2 days (last pass: next-20220714, first fail: next-20=
220718) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
panda                        | arm  | lab-baylibre    | clang-15 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d944814f1bcdaf5edaf064

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220718071842+df42d=
63d3706-1~exp1~20220718071946.323)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d944814f1bcdaf5edaf=
065
        failing since 33 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62d942f155c390d041daf061

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d942f155c390d041daf=
062
        failing since 33 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62d947b51b2a03a34edaf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d947b51b2a03a34edaf=
064
        failing since 30 days (last pass: next-20220602, first fail: next-2=
0220621) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
panda                        | arm  | lab-baylibre    | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62d9495aae081af71bdaf060

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d9495aae081af71bdaf=
061
        failing since 30 days (last pass: next-20220602, first fail: next-2=
0220621) =

 =



platform                     | arch | lab             | compiler | defconfi=
g                    | regressions
-----------------------------+------+-----------------+----------+---------=
---------------------+------------
panda                        | arm  | lab-baylibre    | gcc-10   | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62d946254c31c00ffddaf07c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220721/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220716.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62d946254c31c00ffddaf=
07d
        failing since 33 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =20
