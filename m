Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABDE590ADC
	for <lists+linux-next@lfdr.de>; Fri, 12 Aug 2022 05:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbiHLDwx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Aug 2022 23:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiHLDwv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Aug 2022 23:52:51 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08A6BE0F8
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 20:52:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id d65-20020a17090a6f4700b001f303a97b14so6955440pjk.1
        for <linux-next@vger.kernel.org>; Thu, 11 Aug 2022 20:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=RMERMWOB0+PxTNDjkNrRHjaDtK9YkT4vc2TURo1+xEg=;
        b=LzwUboIw7wjzGqBAigPvoC79LXY1Oft9LYsTPde78AyWjf+K7NBFAptoFu8fD7SI72
         wk/Eo77SF2U2s4mUU33cNZCEIC/grmWh3k9a0OTrrTOJtGNuU4ZLxdFqtIawtUbBlQdt
         DoUMZz38k9qfTj0AtM3NgDm04BlG5cGlR6Cx0/Lyq+EqKHdNWUHCIdML451wncuxB+Kx
         h4256w5WiR7w79mVsPNSkfTW8yL0D8hCWa1zaZ5dMbCAQV2ELir+rLpJtZHrrae2NsFq
         NPLG8w1jbMGbceIhw1Oo5VMwwqfOkdzkJDCcXfY7N+z02Ga78EnQVfAY7hGye1PUV9j6
         T/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=RMERMWOB0+PxTNDjkNrRHjaDtK9YkT4vc2TURo1+xEg=;
        b=QTRKxw9MN86KGrIFRJV65MNwl6q6LTHJ+blaLHkygqsdO74ckoepVR8jFuTTQ44N72
         G99T0lfxcREhTckA4Z+oOM9CsGTVoq7hxSKEnyUosnNlgS7uqjPXi6ON8LN/B2BL2Mve
         xwgKbPS8O9kv7BsC0PTZFBEbmVHhSRaGoZ67eGRIIS9hzBVPy3QctxZprNAJHSmUjkBi
         cCVWUmsEWk/rVRbSRtbiFSiWC9FlWr2hZi5KK5er8aQCiCaX2h3yve5vpnod7Eu1lvIG
         23D0a7zF44tGMweLAx1oVbOW00B/Fp/hKhFL0EsFv/QA3QQOPQop8A1mSkRUDxD5BbEX
         iNPQ==
X-Gm-Message-State: ACgBeo0n1lRV2xdxPQdzAR/B6jkbq/OiL1ZnMAlOdNE1csXk307wvook
        hg24LG13OWrwUYFSzMLFVrCgkF+mVfpPF+k01Dg=
X-Google-Smtp-Source: AA6agR6/mD7rgV8a7r6F+74M0aIZmv22LV/Sm0cqY3j+HlK/g9oi6At8g+FhcZxKyl8h/UJJqyQ3Cw==
X-Received: by 2002:a17:902:eccb:b0:16f:9355:c117 with SMTP id a11-20020a170902eccb00b0016f9355c117mr2150542plh.167.1660276367820;
        Thu, 11 Aug 2022 20:52:47 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x28-20020aa7941c000000b0052d63fb109asm503913pfo.20.2022.08.11.20.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 20:52:47 -0700 (PDT)
Message-ID: <62f5ce8f.a70a0220.86062.1474@mx.google.com>
Date:   Thu, 11 Aug 2022 20:52:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.19-14056-g3b7c069e0e1e4
Subject: next/pending-fixes baseline: 492 runs,
 48 regressions (v5.19-14056-g3b7c069e0e1e4)
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

next/pending-fixes baseline: 492 runs, 48 regressions (v5.19-14056-g3b7c069=
e0e1e4)

Regressions Summary
-------------------

platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config+crypto    | 1          =

am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config           | 1          =

am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config+debug     | 1          =

am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | omap2plus_de=
fconfig          | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+crypto    | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+ima       | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config           | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config+crypto    | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config+ima       | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config           | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

beaglebone-black       | arm    | lab-broonie     | gcc-10   | omap2plus_de=
fconfig          | 1          =

beaglebone-black       | arm    | lab-cip         | gcc-10   | omap2plus_de=
fconfig          | 1          =

da850-lcdk             | arm    | lab-baylibre    | gcc-10   | davinci_all_=
defconfig        | 1          =

hp-x360-14-G1-sona     | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =

imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =

imx6qp-wandboard-revd1 | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+crypto    | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =

imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

imx7d-sdb              | arm    | lab-nxp         | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

imx7ulp-evk            | arm    | lab-nxp         | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =

kontron-pitx-imx8m     | arm64  | lab-kontron     | gcc-10   | defconfig+cr=
ypto             | 2          =

kontron-pitx-imx8m     | arm64  | lab-kontron     | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

meson-gxm-khadas-vim2  | arm64  | lab-baylibre    | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 2          =

odroid-xu3             | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config+crypto    | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config+ima       | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

panda                  | arm    | lab-baylibre    | gcc-10   | omap2plus_de=
fconfig          | 1          =

qemu_arm-vexpress-a15  | arm    | lab-baylibre    | gcc-10   | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15  | arm    | lab-broonie     | gcc-10   | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15  | arm    | lab-collabora   | gcc-10   | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9   | arm    | lab-baylibre    | gcc-10   | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9   | arm    | lab-broonie     | gcc-10   | vexpress_def=
config           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.19-14056-g3b7c069e0e1e4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.19-14056-g3b7c069e0e1e4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3b7c069e0e1e415fa59cb0fa9ab4c11bd8c2c5a0 =



Test Regressions
---------------- =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59909671473e75fdaf058

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59909671473e75fdaf=
059
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f599ef5d3cd5ede7daf173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f599ef5d3cd5ede7daf=
174
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5aea6a082b9b988daf0ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57=
xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5aea6a082b9b988daf=
0bb
        failing since 3 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5aebca082b9b988daf0c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5aebca082b9b988daf=
0c2
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5b0009a4b39dd48daf088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5b0009a4b39dd48daf=
089
        failing since 6 days (last pass: v5.19-3879-ge7dffa5317766, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
am57xx-beagle-x15      | arm    | lab-linaro-lkft | gcc-10   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5999f9e22ab6b68daf080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am5=
7xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5999f9e22ab6b68daf=
081
        failing since 4 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59967d509e7483cdaf097

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/ba=
seline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59967d509e7483cdaf=
098
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59abb7eec6845e1daf063

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-b=
eaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-b=
eaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59abb7eec6845e1daf=
064
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59b7e685f6dcd97daf070

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-broonie/baseline-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59b7e685f6dcd97daf=
071
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59c0f283386a62bdaf076

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59c0f283386a62bdaf=
077
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59ce836c4b4d9c6daf05c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59ce836c4b4d9c6daf=
05d
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a9a7f70df98349daf072

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseli=
ne-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseli=
ne-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a9a7f70df98349daf=
073
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5ac4b29d3809f88daf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagl=
ebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beagl=
ebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5ac4b29d3809f88daf=
075
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5af0741f4344058daf091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebo=
ne-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beaglebo=
ne-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5af0741f4344058daf=
092
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5b59c771f1cad54daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-b=
lack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5b59c771f1cad54daf=
058
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5b7f03df00ff627daf0a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5b7f03df00ff627daf=
0a6
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-broonie     | gcc-10   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59a15f0f0f6c851daf07b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-broonie/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59a15f0f0f6c851daf=
07c
        failing since 4 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
beaglebone-black       | arm    | lab-cip         | gcc-10   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5ab0f66b31a5057daf089

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5ab0f66b31a5057daf=
08a
        failing since 4 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
da850-lcdk             | arm    | lab-baylibre    | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62f598b2d149c3e316daf056

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62f598b2d149c3e=
316daf05e
        failing since 200 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-08-12T00:02:47.665781  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-08-12T00:02:47.666401  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-08-12T00:02:47.669336  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-08-12T00:02:47.708820  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
hp-x360-14-G1-sona     | x86_64 | lab-collabora   | gcc-10   | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62f598a0b33048d3b4daf093

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f598a0b33048d3b4daf=
094
        new failure (last pass: v5.19-13979-gdcb67a85d8831) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6dl-riotboard       | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59e056c0d93672cdaf0a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59e056c0d93672cdaf=
0a5
        new failure (last pass: v5.19-13979-gdcb67a85d8831) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6qp-wandboard-revd1 | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59db49d5bc4b726daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59db49d5bc4b726daf=
057
        new failure (last pass: v5.19-13979-gdcb67a85d8831) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a4a81c1c5baf7fdaf08a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a4a81c1c5baf7fdaf=
08b
        failing since 23 days (last pass: v5.19-rc6-500-g27ca1dbc37a0, firs=
t fail: v5.19-rc7-183-ga3866a7dc77d) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f598ef8de399d661daf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f598ef8de399d661daf=
05c
        failing since 72 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59c9d1528f84b68daf0cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59c9d1528f84b68daf=
0cd
        failing since 72 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59ea4364cdfad9fdaf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59ea4364cdfad9fdaf=
068
        failing since 72 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59f30c52a9e3d28daf057

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6=
ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59f30c52a9e3d28daf=
058
        failing since 47 days (last pass: v5.19-rc3-373-gd317111b3b1ae, fir=
st fail: v5.19-rc3-470-g4fc9c7cb4051) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx6ul-pico-hobbit     | arm    | lab-pengutronix | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a2b4a2116a845cdaf084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a2b4a2116a845cdaf=
085
        failing since 73 days (last pass: v5.16-rc4-356-ga119cd39dcbf, firs=
t fail: v5.18-11575-gceccc06b624ed) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx7d-sdb              | arm    | lab-nxp         | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59c571528f84b68daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59c571528f84b68daf=
057
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
imx7ulp-evk            | arm    | lab-nxp         | gcc-10   | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59da2e8d4ff97e5daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59da2e8d4ff97e5daf=
057
        failing since 8 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-3879-ge7dffa5317766) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m     | arm64  | lab-kontron     | gcc-10   | defconfig+cr=
ypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62f59a41660331325fdaf060

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62f59a41660331325fdaf06e
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-12T00:09:18.045011  /lava-153923/1/../bin/lava-test-case
    2022-08-12T00:09:18.045409  <8>[   19.391124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-12T00:09:18.045675  /lava-153923/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
59a41660331325fdaf070
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-12T00:09:19.082329  /lava-153923/1/../bin/lava-test-case
    2022-08-12T00:09:19.082700  <8>[   20.435319] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-12T00:09:19.082957  /lava-153923/1/../bin/lava-test-case
    2022-08-12T00:09:19.083187  <8>[   20.455171] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
kontron-pitx-imx8m     | arm64  | lab-kontron     | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62f59d509931edd3b9daf149

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62f59d509931edd3b9daf157
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-12T00:22:21.830528  /lava-153937/1/../bin/lava-test-case
    2022-08-12T00:22:21.831038  <8>[   19.464407] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-12T00:22:21.831218  /lava-153937/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
59d509931edd3b9daf159
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94)

    2022-08-12T00:22:22.868046  /lava-153937/1/../bin/lava-test-case
    2022-08-12T00:22:22.868366  <8>[   20.508724] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
meson-gxm-khadas-vim2  | arm64  | lab-baylibre    | gcc-10   | defconfig+CO=
N...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62f59e21a18d82bbd8daf05d

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/62f59e21a18d82b=
bd8daf064
        new failure (last pass: v5.19-13979-gdcb67a85d8831)
        2 lines

    2022-08-12T00:25:53.686077  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-08-12T00:25:53.686334  kern  :alert : Data abort info:
    2022-08-12T00:25:53.725022  kern  :alert :   IS<8>[   20.328641] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2022-08-12T00:25:53.725327  V =3D 0, ISS =3D 0x000<8>[   20.336757] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 2360313_1.5.2.4.1>
    2022-08-12T00:25:53.725558  00006
    2022-08-12T00:25:53.725791  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-08-12T00:25:53.726004  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000bdbc1000
    2022-08-12T00:25:53.726213  kern  :alert : [0000000000000928] pgd=3D080=
00000bdbc2003, p4d=3D08000000bdbc2003, pud=3D08000000bdbc3003, pmd=3D000000=
0000000000   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62f59e21a18d82b=
bd8daf065
        new failure (last pass: v5.19-13979-gdcb67a85d8831)
        12 lines

    2022-08-12T00:25:53.682262  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000928
    2022-08-12T00:25:53.682528  kern  :alert : Mem abort info:
    2022-08-12T00:25:53.682754  kern  :alert :   ESR =3D 0x000<8>[   20.296=
410] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines=
 MEASUREMENT=3D12>
    2022-08-12T00:25:53.683012  0000096000006
    2022-08-12T00:25:53.683238  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-08-12T00:25:53.683450  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-08-12T00:25:53.683658  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
odroid-xu3             | arm    | lab-collabora   | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a45c911d078788daf087

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a45c911d078788daf=
088
        failing since 1 day (last pass: v5.19-13355-ge1d444f629ff, first fa=
il: v5.19-13464-g5c5775c41d549) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59960d509e7483cdaf08e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59960d509e7483cdaf=
08f
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59ce436c4b4d9c6daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59ce436c4b4d9c6daf=
057
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59e9ccaf4559b0edaf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59e9ccaf4559b0edaf=
05c
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a02c3a66b2904edaf068

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a02c3a66b2904edaf=
069
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62f5a1a9871a584360daf05b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f5a1a9871a584360daf=
05c
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
panda                  | arm    | lab-baylibre    | gcc-10   | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62f59b401bb37d129cdaf0a0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f59b401bb37d129cdaf=
0a1
        failing since 4 days (last pass: v5.19-1483-gffa33bbcf63ea, first f=
ail: v5.19-12861-g50a89f5a92e3) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15  | arm    | lab-baylibre    | gcc-10   | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f597cc2c1b40ff27daf06b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f597cc2c1b40ff27daf=
06c
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15  | arm    | lab-broonie     | gcc-10   | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f597d2506fc5c4f2daf080

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f597d2506fc5c4f2daf=
081
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15  | arm    | lab-collabora   | gcc-10   | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f597b0038b29ad2bdaf0fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_a=
rm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f597b0038b29ad2bdaf=
0fd
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9   | arm    | lab-baylibre    | gcc-10   | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f597bb2c1b40ff27daf065

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f597bb2c1b40ff27daf=
066
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =



platform               | arch   | lab             | compiler | defconfig   =
                 | regressions
-----------------------+--------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9   | arm    | lab-broonie     | gcc-10   | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/62f597d129cbbe948ddaf07b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.19-14056=
-g3b7c069e0e1e4/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm=
-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62f597d129cbbe948ddaf=
07c
        failing since 6 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-11387-gd91170a44a94) =

 =20
