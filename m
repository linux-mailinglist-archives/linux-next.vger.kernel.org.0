Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13CF2532BED
	for <lists+linux-next@lfdr.de>; Tue, 24 May 2022 16:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237253AbiEXODW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 May 2022 10:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiEXODV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2022 10:03:21 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14058CCDC
        for <linux-next@vger.kernel.org>; Tue, 24 May 2022 07:03:19 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id y1so506054pfr.6
        for <linux-next@vger.kernel.org>; Tue, 24 May 2022 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kSyM/USfS7Pb7khLu6zBnGxMxsVQblFViaqZFN9Nd2Y=;
        b=BZ8qEqM6i2bqtDforFfCmDzJEW3UPVjlakDiRq/vWicc7Kkvqygky05YuQFUNS1uPe
         5c8cw4pmYsGpunzRsi/C9wehiY/0lEav/kwyDEwQnaxudWuRc5daZSiXI7aXKxeCf9Uh
         jL7L21eEjtwMcjdTBriAWdQrPFvmCHKZh3NouOWgUA9ScieXRDaB9k43Lz+kdX44L81L
         n+W74tP2OzSGCP6w9bRcAU/d5FulOvD8WpEwN69CwjGLPJ8Ixu5ZQTNvCzHzFOzVcfER
         q/5aDZOiKo/2zVR6Gn5yjMBGfhSwNGhoEAQLWVboQ11725braTGSleIvMm7tPAZ9HsMQ
         S+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kSyM/USfS7Pb7khLu6zBnGxMxsVQblFViaqZFN9Nd2Y=;
        b=FCg8Wiz/Gy3JQbl9GYTJFBixZlMvHZObfefn6ASAJ4B2/+efcPd6stkJgK6lWI1/ED
         0kk/1zVeehFzPKtswL+xXSU6yMAYRX+mo1FuLlM9QRr8YTMi15nMTkFKca9U2CaCst1Y
         KY0UAB4G9iLBksfScwomXm8wKvAdzKxH0E8jMiU8c+f0Exl9UcljIZ1yvVbpQn3zU93f
         vzcWfoSgwyGgaIXMUIVnuNDoY6sK8JRy125jr3t57/mFfud1oikYMDzZurBZuodNBV0I
         YyzmsOATuT1nzuDCvlHdA8l0aSigm5WZw54SdacVe6JPRWQ/1eUGC2PgQ0NF9ZkUV2AV
         M9ug==
X-Gm-Message-State: AOAM530X1fLbpMdQ9xFxfx5FEXb8hB5h6rAuZmqa4QoE+2Eo7MhGWUyA
        IBTEUB7oF2n/VhGf61ejNQJMEPhTNjFygxOKpNw=
X-Google-Smtp-Source: ABdhPJwDHuUUBQ4yo7qxgJqfPhgNQUpQOV5TsmI7QoJo4sPW2Pu+HoXkOymcI7kCJCpZD/E1RhgiDA==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id k8-20020a056a00168800b00517cf7b9293mr28873955pfc.7.1653400998801;
        Tue, 24 May 2022 07:03:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n18-20020a6563d2000000b003f655cf45c0sm6605216pgv.63.2022.05.24.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 07:03:18 -0700 (PDT)
Message-ID: <628ce5a6.1c69fb81.af8f6.f701@mx.google.com>
Date:   Tue, 24 May 2022 07:03:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-1222-g391cf5a1244f
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 466 runs,
 14 regressions (v5.18-1222-g391cf5a1244f)
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

next/pending-fixes baseline: 466 runs, 14 regressions (v5.18-1222-g391cf5a1=
244f)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
da850-lcdk                 | arm   | lab-baylibre | gcc-10   | davinci_all_=
defconfig        | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+crypto    | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+ima       | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config           | 1          =

jetson-tk1                 | arm   | lab-baylibre | gcc-10   | tegra_defcon=
fig              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-10   | defconfig+de=
bug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-1222-g391cf5a1244f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-1222-g391cf5a1244f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      391cf5a1244fc835667a6b845706a63b65b7275f =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
da850-lcdk                 | arm   | lab-baylibre | gcc-10   | davinci_all_=
defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/628cab82e81a7df578a39bec

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/628cab82e81a7df=
578a39bf4
        failing since 120 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-05-24T09:54:47.498298  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-05-24T09:54:47.499247  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-05-24T09:54:47.501655  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-05-24T09:54:47.542142  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/628caf0558f74d97d6a39c0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628caf0558f74d97d6a39=
c0f
        failing since 24 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/628cafa557834d3437a39d34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cafa557834d3437a39=
d35
        failing since 0 day (last pass: v5.18-rc7-251-g195d7f7a62c6, first =
fail: v5.18-155-gb82692513a38) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb456de50eb88d4a39d04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-jetso=
n-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb456de50eb88d4a39=
d05
        failing since 4 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
c...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb60eab2e56df75a39c1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb60eab2e56df75a39=
c1b
        failing since 4 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb7c6d16064b514a39bd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk=
1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb7c6d16064b514a39=
bd9
        failing since 4 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
jetson-tk1                 | arm   | lab-baylibre | gcc-10   | tegra_defcon=
fig              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cad61933f7ecf37a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cad61933f7ecf37a39=
bce
        failing since 4 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb33fd240127d86a39bf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb33fd240127d86a39=
bf3
        new failure (last pass: v5.18-155-gb82692513a38) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb5d75e5d3e7849a39c35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb5d75e5d3e7849a39=
c36
        new failure (last pass: v5.18-155-gb82692513a38) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb3413a65b1222ba39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb3413a65b1222ba39=
bd1
        failing since 13 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb5ffdd7ccfb02ea39c1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb5ffdd7ccfb02ea39=
c1b
        failing since 13 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb31aeac1403a91a39bd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb31aeac1403a91a39=
bd8
        failing since 13 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb5ebdd7ccfb02ea39c0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-=
virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb5ebdd7ccfb02ea39=
c0b
        failing since 13 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe   | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/628cb340eac1403a91a39bed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-1222-=
g391cf5a1244f/arm64/defconfig+debug/gcc-10/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220513.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/628cb340eac1403a91a39=
bee
        failing since 4 days (last pass: v5.18-rc7-165-g2424086909d29, firs=
t fail: v5.18-rc7-251-g195d7f7a62c6) =

 =20
