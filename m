Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0E665FAC5
	for <lists+linux-next@lfdr.de>; Fri,  6 Jan 2023 05:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjAFEqC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Jan 2023 23:46:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjAFEqB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2023 23:46:01 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A103B625D2
        for <linux-next@vger.kernel.org>; Thu,  5 Jan 2023 20:45:57 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id w3so592576ply.3
        for <linux-next@vger.kernel.org>; Thu, 05 Jan 2023 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u5lKsk9KNP26ol2fYjD4l+/9vToErXIRpjnPaSLujuA=;
        b=2p8gBHnal1wNNFQHgQD/C6IFUFcovXPdFIDMGfeIrmFjwt7lUyXV4iIOhfDfjSiT3m
         JGtADYse46jW6tR/umiIDI9e/P8YXPVQVocR4W/qV4fQL6/DJLwkDccyUL+ttoaBd9Wz
         xopMse+D6d3kHWAl2RvxZxAZ3Bp8/XeQHYuC6BN6mjVzt+r74TbXbSBUlw+GalJRMET4
         JAyjFa4RLYxXVfsOsidwwdRIla+z3vqSIvkKLnfG4gmGNVQnTR5gFfMgBtgifW31y46X
         pBazZc57iEn9DH8kNJK0H2Lo1ZamdKxeu4sza1oQl2/uhfWx4VnVCCe2ckBKxahGOQSl
         vMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5lKsk9KNP26ol2fYjD4l+/9vToErXIRpjnPaSLujuA=;
        b=WQ0HhoBm16V4VN59hzhbjctkUotTSws8MwDFwMeqdDxpmK/rSSGt17it7FjWP73VI8
         7W1b5A4ut37XDQUU29tCJmcUDC4yk1FkIDLuFkY3wHDNU/iiWSO4At1qaq9gHUgE2sd/
         AlnGO79LSx0VTiv53Mp6xcPVxJmqZ46r9fEplm0E1GHNSK43c9sGeShdE7+qDpMQ8xZY
         ayyUF0NiWMT0ATzS9dBQ7IfymiTt5n50yDPGY7N/t/3zujlwpH0WF90vVnBU48fV42uh
         t4iuZQy0I6UJh+C5ZX+VrFnCaqq/Liq9I6YIufBpPlxRiWEuZ43A/rtqhlx9JXWj6iAJ
         V5Bg==
X-Gm-Message-State: AFqh2krnRIrqcPBwVQ+iYVdO94rG0iV6XAxDGR/RK1UTz1s0PoZZ+WjC
        oeJfqGtZLcZ3GBcqdnfsiY/Pcueuciq730A2qtnIEQ==
X-Google-Smtp-Source: AMrXdXuVjATRQkXI5gmwj8PJvWqCmr/qk7Mfp3iuN0RD0PWJo/DFE205Vn5MmyQpl/HJDGpUsfwKxg==
X-Received: by 2002:a17:902:d34a:b0:192:c2c1:8cc6 with SMTP id l10-20020a170902d34a00b00192c2c18cc6mr19512179plk.50.1672980356206;
        Thu, 05 Jan 2023 20:45:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902694500b00186cf82717fsm25741494plt.165.2023.01.05.20.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 20:45:55 -0800 (PST)
Message-ID: <63b7a783.170a0220.3a90b.8c89@mx.google.com>
Date:   Thu, 05 Jan 2023 20:45:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc2-415-g7dcb1029a6d41
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 389 runs,
 30 regressions (v6.2-rc2-415-g7dcb1029a6d41)
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

next/pending-fixes baseline: 389 runs, 30 regressions (v6.2-rc2-415-g7dcb10=
29a6d41)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc2-415-g7dcb1029a6d41/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc2-415-g7dcb1029a6d41
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7dcb1029a6d41f874e3edb104e37b12aef4d120b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7738be1d5098f194eee1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7738be1d5098f194ee=
e1e
        failing since 88 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b775047a5ce89df44eee3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b775047a5ce89df44ee=
e40
        failing since 85 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76b05f3c4282e5d4eee40

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76b05f3c4282e5d4eee45
        new failure (last pass: v6.0-12387-ge54e01f1826aa)

    2023-01-06T00:27:31.297536  + set +x
    2023-01-06T00:27:31.300073  <8>[   16.166935] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 57338_1.5.2.4.1>
    2023-01-06T00:27:31.411869  / # #
    2023-01-06T00:27:31.513727  export SHELL=3D/bin/sh
    2023-01-06T00:27:31.514377  #
    2023-01-06T00:27:31.616725  / # export SHELL=3D/bin/sh. /lava-57338/env=
ironment
    2023-01-06T00:27:31.617381  =

    2023-01-06T00:27:31.719268  / # . /lava-57338/environment/lava-57338/bi=
n/lava-test-runner /lava-57338/1
    2023-01-06T00:27:31.720265  =

    2023-01-06T00:27:31.726791  / # /lava-57338/bin/lava-test-runner /lava-=
57338/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76ffbb0598f9d284eee4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76ffbb0598f9d284ee=
e4b
        failing since 60 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76d22c0bbf43f794eee1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76d22c0bbf43f794ee=
e1c
        failing since 120 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76dfe6879985ef24eee2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76dfe6879985ef24ee=
e2b
        failing since 121 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76ffcb0598f9d284eee4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76ffcb0598f9d284ee=
e4e
        failing since 112 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76d5cc0e3da34754eee1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76d5cc0e3da34754ee=
e1c
        failing since 121 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b77124aa260729dc4eee63

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b77124aa260729dc4eee68
        failing since 1 day (last pass: v6.1-rc4-405-g5cc6cef624e2, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:53:43.056574  <8>[   38.906224] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1130216_1.5.2.4.1>
    2023-01-06T00:53:43.162914  / # #
    2023-01-06T00:53:44.322917  export SHELL=3D/bin/sh
    2023-01-06T00:53:44.328596  #
    2023-01-06T00:53:45.875524  / # export SHELL=3D/bin/sh. /lava-1130216/e=
nvironment
    2023-01-06T00:53:45.881150  =

    2023-01-06T00:53:45.881479  / # . /lava-1130216/environment
    2023-01-06T00:53:48.703316  / # /lava-1130216/bin/lava-test-runner /lav=
a-1130216/1
    2023-01-06T00:53:48.720269  /lava-1130216/bin/lava-test-runner /lava-11=
30216/1
    2023-01-06T00:53:48.812123  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (20 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76f81672e36ced54eeed1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76f81672e36ced54eeed6
        failing since 1 day (last pass: v6.1-rc6-391-gf445421fe4c7, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:46:27.451405  / # #
    2023-01-06T00:46:28.609899  export SHELL=3D/bin/sh
    2023-01-06T00:46:28.615398  #
    2023-01-06T00:46:30.161399  / # export SHELL=3D/bin/sh. /lava-1130218/e=
nvironment
    2023-01-06T00:46:30.167016  =

    2023-01-06T00:46:32.987764  / # . /lava-1130218/environment/lava-113021=
8/bin/lava-test-runner /lava-1130218/1
    2023-01-06T00:46:32.993773  =

    2023-01-06T00:46:32.994005  / # /lava-1130218/bin/lava-te<4>[   21.6980=
18] usb_phy_generic usbphynop3: deferred probe timeout, ignoring dependency
    2023-01-06T00:46:32.994232  <4>[   21.706072] usb_phy_generic: probe of=
 usbphynop3 failed with error -110
    2023-01-06T00:46:32.994457  <4>[   21.717196] pwm-backlight backlight: =
supply power not found, using dummy regulator =

    ... (32 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76d586b5ff2d7ae4eeeab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76d586b5ff2d7ae4ee=
eac
        failing since 155 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7715f67b414b54a4eee62

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b7715f67b414b54a4eee67
        failing since 1 day (last pass: v6.1-rc6-391-gf445421fe4c7, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:54:32.885569  + set +x<8>[   33.643943] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1130215_1.5.2.4.1>
    2023-01-06T00:54:32.885887  =

    2023-01-06T00:54:32.995629  / # #
    2023-01-06T00:54:34.154929  export SHELL=3D/bin/sh
    2023-01-06T00:54:34.160522  #
    2023-01-06T00:54:34.160795  / # export SHELL=3D/bin/sh
    2023-01-06T00:54:35.707304  / # . /lava-1130215/environment
    2023-01-06T00:54:38.532878  /lava-1130215/bin/lava-test-runner /lava-11=
30215/1
    2023-01-06T00:54:38.538975  . /lava-1130215/environment
    2023-01-06T00:54:38.539242  / # /lava-1130215/bin/lava-test-runner /lav=
a-1130215/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63b770ee62cb11397a4eee19

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b770ee62cb11397a4eee1c
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:52:31.377196  / # #
    2023-01-06T00:52:31.479345  export SHELL=3D/bin/sh
    2023-01-06T00:52:31.479799  #
    2023-01-06T00:52:31.581276  / # export SHELL=3D/bin/sh. /lava-239803/en=
vironment
    2023-01-06T00:52:31.581775  =

    2023-01-06T00:52:31.683200  / # . /lava-239803/environment/lava-239803/=
bin/lava-test-runner /lava-239803/1
    2023-01-06T00:52:31.684129  =

    2023-01-06T00:52:31.689052  / # /lava-239803/bin/lava-test-runner /lava=
-239803/1
    2023-01-06T00:52:31.754158  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-06T00:52:31.754530  + cd /lava-239803/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63b=
770ee62cb11397a4eee2c
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:52:35.818151  /lava-239803/1/../bin/lava-test-case
    2023-01-06T00:52:35.818499  <8>[   20.015144] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76a90b2e90e29a04eee28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76a90b2e90e29a04ee=
e29
        failing since 85 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b77015b0598f9d284eee66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b77015b0598f9d284ee=
e67
        failing since 85 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76fe6391858b8ca4eee38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76fe6391858b8ca4ee=
e39
        failing since 85 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b770298f6b06c5624eee3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b770298f6b06c5624ee=
e3e
        failing since 85 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76fd780addcf7eb4eee88

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76fd780addcf7eb4ee=
e89
        failing since 85 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7703dd793ce03054eef25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7703dd793ce03054ee=
f26
        failing since 85 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7702b8f6b06c5624eee43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b7702b8f6b06c5624ee=
e44
        failing since 85 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76cb8067e21c0114eee2d

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63b76cb8067e21c=
0114eee35
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e)
        1 lines

    2023-01-06T00:34:40.042640  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 608768e0, epc =3D=3D 80203804, ra =3D=
=3D 80206154
    2023-01-06T00:34:40.042779  =

    2023-01-06T00:34:40.075063  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-01-06T00:34:40.075227     =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76cb943383d0d7a4eee8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-=
qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-=
qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b76cb943383d0d7a4ee=
e8b
        failing since 1 day (last pass: v6.2-rc1-87-g81c29d2c4600, first fa=
il: v6.2-rc2-332-g2d3ca5d07c8e) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b769ee01288e943b4eee3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63b769ee01288e943b4ee=
e3d
        failing since 23 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.1-6378-g44d433ee7540) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76ab0fa8fe0e0e34eee23

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76ab0fa8fe0e0e34eee26
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:26:18.679571  [   18.518585] usbcore: registered new inte=
rface driver uas#
    2023-01-06T00:26:18.781841  export SHELL=3D/bin/sh
    2023-01-06T00:26:18.782445  =

    2023-01-06T00:26:18.782849  #
    2023-01-06T00:26:18.884416  / # export SHELL=3D/bin/sh. /lava-374601/en=
vironment
    2023-01-06T00:26:18.885004  =

    2023-01-06T00:26:18.986651  / # . /lava-374601/environment/lava-374601/=
bin/lava-test-runner /lava-374601/1
    2023-01-06T00:26:18.987653  =

    2023-01-06T00:26:19.004687  / # /lava-374601/bin/lava-test-runner /lava=
-374601/1
    2023-01-06T00:26:19.130683  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76b5072871ae2be4eee4f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76b5072871ae2be4eee52
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:28:57.758536  [   20.189991] <LAVA_SIGNAL_ENDRUN 0_dmesg =
374607_1.5.2.4.1>
    2023-01-06T00:28:57.863729  / # #
    2023-01-06T00:28:57.965989  export SHELL=3D/bin/sh
    2023-01-06T00:28:57.966755  #
    2023-01-06T00:28:58.068264  / # export SHELL=3D/bin/sh. /lava-374607/en=
vironment
    2023-01-06T00:28:58.069049  =

    2023-01-06T00:28:58.170623  / # . /lava-374607/environment/lava-374607/=
bin/lava-test-runner /lava-374607/1
    2023-01-06T00:28:58.171688  =

    2023-01-06T00:28:58.188763  / # /lava-374607/bin/lava-test-runner /lava=
-374607/1
    2023-01-06T00:28:58.307059  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (19 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76ce09852fb24a94eee27

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/ba=
seline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/ba=
seline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76ce09852fb24a94eee2a
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:35:19.846125  / # #
    2023-01-06T00:35:19.951118  export SHELL=3D/bin/sh
    2023-01-06T00:35:19.951738  #
    2023-01-06T00:35:19.951983  / # [   20.423965] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-06T00:35:19.952368  [   20.433876] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-06T00:35:19.952575  export SHELL=3D/bin/sh[   20.484208] usbcor=
e: registered new interface driver uas
    2023-01-06T00:35:20.058122  . /lava-374625/environment
    2023-01-06T00:35:20.058732  =

    2023-01-06T00:35:20.163100  / # . /lava-374625/environment/lava-374625/=
bin/lava-test-runner /lava-374625/1
    2023-01-06T00:35:20.163968   =

    ... (25 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76de44e8503eeb44eee1c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76de44e8503eeb44eee1f
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:39:57.904402  [   20.277710] usb-storage 1-1.1:1.0: USB M=
ass Storage device detected
    2023-01-06T00:39:57.904721  + set +x
    2023-01-06T00:39:57.905016  [   20.284695] <LAVA_SIGNAL_ENDRUN 0_dmesg =
374630_1.5.2.4.1>
    2023-01-06T00:39:57.905323  [   20.290980] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-06T00:39:57.905898  / # [   20.304677] usbcore: registered new =
interface driver uas
    2023-01-06T00:39:58.012180  #
    2023-01-06T00:39:58.114444  export SHELL=3D/bin/sh
    2023-01-06T00:39:58.115072  #
    2023-01-06T00:39:58.216621  / # export SHELL=3D/bin/sh. /lava-374630/en=
vironment
    2023-01-06T00:39:58.217238   =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63b7703c91a92dbc514eee1a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b7703c91a92dbc514eee1d
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:49:57.295116  / # #
    2023-01-06T00:49:57.397474  export SHELL=3D/bin/sh
    2023-01-06T00:49:57.398093  #
    2023-01-06T00:49:57.499724  / # export SHELL=3D/bin/sh. /lava-374640/en=
vironment
    2023-01-06T00:49:57.500330  =

    2023-01-06T00:49:57.602009  / # . /lava-374640/environment/lava-374640/=
bin/lava-test-runner /lava-374640/1
    2023-01-06T00:49:57.603242  =

    2023-01-06T00:49:57.619085  / # /lava-374640/bin/lava-test-runner /lava=
-374640/1
    2023-01-06T00:49:57.736170  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-06T00:49:57.736891  + cd /lava-374640/1/tests/1_bootrr =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63b76ba0eaaa4270bb4eee2b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-=
bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc2-41=
5-g7dcb1029a6d41/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-=
bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63b76ba0eaaa4270bb4eee2e
        failing since 1 day (last pass: v6.0-rc5-224-g269f27f24a11, first f=
ail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-06T00:30:06.851892  [   16.669574] <LAVA_SIGNAL_ENDRUN 0_dmesg =
374613_1.5.2.4.1>
    2023-01-06T00:30:06.958558  / # #
    2023-01-06T00:30:07.060896  export SHELL=3D/bin/sh
    2023-01-06T00:30:07.061497  #
    2023-01-06T00:30:07.163143  / # export SHELL=3D/bin/sh. /lava-374613/en=
vironment
    2023-01-06T00:30:07.163730  =

    2023-01-06T00:30:07.265445  / # . /lava-374613/environment/lava-374613/=
bin/lava-test-runner /lava-374613/1
    2023-01-06T00:30:07.266555  =

    2023-01-06T00:30:07.282751  / # /lava-374613/bin/lava-test-runner /lava=
-374613/1
    2023-01-06T00:30:07.389728  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =20
