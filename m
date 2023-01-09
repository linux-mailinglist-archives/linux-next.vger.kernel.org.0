Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE1F661C6E
	for <lists+linux-next@lfdr.de>; Mon,  9 Jan 2023 03:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbjAICt1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Jan 2023 21:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbjAICtZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Jan 2023 21:49:25 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91E6BC8E
        for <linux-next@vger.kernel.org>; Sun,  8 Jan 2023 18:49:22 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g68so3891283pgc.11
        for <linux-next@vger.kernel.org>; Sun, 08 Jan 2023 18:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SzG9aq8B4xPb3iEwXaA990i5SNHsUe//g/pTFcUrSAc=;
        b=FXY4tIA/nqpHu340zkgJTNHi1KVYZp0yH3sDG1LR7fYby0CyQGmhTL/BUCRxJVwjCq
         eTRH5+KTfexSIQ8lXyKzfCE0UZ48xiOYGmNStJ9Qj+TGUPHI7qwBaIxVAwQak6n/zPTW
         /X0dBk87lV6Cz5QNTb6nTIbB9yfpndEf3AFjO1BMoikuZ7RBwYmkC0FH0XYcbCrUiwgz
         9eFTkMOWgU/zO7adovwaBOIBKvM0/QgAPO0oJNcizQNDRe4cJ7rQAHLBUVKVe08B+nIZ
         g2ey5fy2WIorHvZNYEH8t7z9bDLHLJOoIWsDs7iDGHPLnsUBELrVEDu4G6ww852rRZ9B
         TBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzG9aq8B4xPb3iEwXaA990i5SNHsUe//g/pTFcUrSAc=;
        b=kCdJ57bof7HxTE7cCLQQnoMv43gyMQ5/2GOaxYOh6UahPwLXOXs5twxuTfZpi9x3Yk
         AQP3Jt2VRWYUoQfDM0yyceTKEfjDYA6PYk4dl5zbTf21mUeo4WrdXLa/bd6HyLXvBIAu
         GKJToL2tND/L652udrAav5nSLsOqRrfzRSNiGjsW8isnZufwJ4BXP7KEBBEYZbyIbmny
         v4J27Fb6SnPk3e9rIBOH/4t/JTZcAyN3P2gnSBEotey79pUfBTqU0ZSnRevQPAI7H2Th
         Mh6H/6tSHw/91IfNHByjWjX99tlxKQK+jyvrX00xPzgWsjpC1PejqjhbllfQLc/tlJzz
         n4WQ==
X-Gm-Message-State: AFqh2kpNayYACCyp32guIrutu+018NMIXL8ejMq3uZHnehRU/lxQRBS2
        k2sUI3jTNwAwUGwrcUANpOk71zix87IK0kkOS2m3zg==
X-Google-Smtp-Source: AMrXdXtdVYchaz5yWQvJy6ENpggoF4Kmz6Dg9Fia9nj1WbArJQg+QNRNWQf8BkMdXSdu8T9xF7A6OA==
X-Received: by 2002:a05:6a00:4148:b0:582:a8f2:675 with SMTP id bv8-20020a056a00414800b00582a8f20675mr22536565pfb.20.1673232561756;
        Sun, 08 Jan 2023 18:49:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 189-20020a6204c6000000b00581e0b5ad8dsm4833873pfe.107.2023.01.08.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 18:49:21 -0800 (PST)
Message-ID: <63bb80b1.620a0220.94e8a.714a@mx.google.com>
Date:   Sun, 08 Jan 2023 18:49:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v6.2-rc3-217-gcf5f49e41cd4e
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 412 runs,
 27 regressions (v6.2-rc3-217-gcf5f49e41cd4e)
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

next/pending-fixes baseline: 412 runs, 27 regressions (v6.2-rc3-217-gcf5f49=
e41cd4e)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc3-217-gcf5f49e41cd4e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc3-217-gcf5f49e41cd4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cf5f49e41cd4ea72bc12be377269bb9d0dc21ef6 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4b02490644ef324eee53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4b02490644ef324ee=
e54
        failing since 90 days (last pass: v6.0-6424-g1af0c6a154d32, first f=
ail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4fbeba155ec4994eee23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4fbeba155ec4994ee=
e24
        failing since 88 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4bca9989aa38c04eee35

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4bca9989aa38c04eee3a
        new failure (last pass: v6.2-rc2-415-g7dcb1029a6d41)

    2023-01-08T23:03:24.126798  + set[   15.020110] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 875010_1.5.2.3.1>
    2023-01-08T23:03:24.126936   +x
    2023-01-08T23:03:24.232960  / # #
    2023-01-08T23:03:24.334203  export SHELL=3D/bin/sh
    2023-01-08T23:03:24.334627  #
    2023-01-08T23:03:24.435890  / # export SHELL=3D/bin/sh. /lava-875010/en=
vironment
    2023-01-08T23:03:24.436311  =

    2023-01-08T23:03:24.537607  / # . /lava-875010/environment/lava-875010/=
bin/lava-test-runner /lava-875010/1
    2023-01-08T23:03:24.538307  =

    2023-01-08T23:03:24.541042  / # /lava-875010/bin/lava-test-runner /lava=
-875010/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb526e3a9e2660854eee2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb526e3a9e2660854ee=
e2e
        failing since 62 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb49bc782bc0f2784eee74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb49bc782bc0f2784ee=
e75
        failing since 123 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4ad2099355d9194eee46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4ad2099355d9194ee=
e47
        failing since 124 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4fc63473afcbaa4eee4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4fc63473afcbaa4ee=
e4c
        failing since 115 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb49a7782bc0f2784eee1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb49a7782bc0f2784ee=
e1b
        failing since 124 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4ce359a0d342654eee20

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4ce359a0d342654eee25
        failing since 4 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:07:47.759169  <8>[   28.801821] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1132839_1.5.2.4.1>
    2023-01-08T23:07:47.862844  / # #
    2023-01-08T23:07:49.021808  export SHELL=3D/bin/sh
    2023-01-08T23:07:49.027350  #
    2023-01-08T23:07:50.574360  / # export SHELL=3D/bin/sh. /lava-1132839/e=
nvironment
    2023-01-08T23:07:50.580051  =

    2023-01-08T23:07:53.401586  / # . /lava-1132839/environment/lava-113283=
9/bin/lava-test-runner /lava-1132839/1
    2023-01-08T23:07:53.407590  =

    2023-01-08T23:07:53.407843  / # /lava-1132839/bin/lava-test-<4>[   33.2=
27201] pwm-backlight backlight-display: supply power not found, using dummy=
 regulator
    2023-01-08T23:07:53.408083  <4>[   33.243027] etnaviv-gpu 1800000.gpu: =
deferred probe timeout, ignoring dependency =

    ... (33 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4bfc9989aa38c04eee4a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4bfc9989aa38c04eee4f
        failing since 3 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:03:44.624262  + set<8>[   18.971184] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1132835_1.5.2.4.1>
    2023-01-08T23:03:44.624374   +x
    2023-01-08T23:03:44.727684  / # #
    2023-01-08T23:03:45.885685  export SHELL=3D/bin/sh
    2023-01-08T23:03:45.891098  #
    2023-01-08T23:03:47.436824  / # export SHELL=3D/bin/sh. /lava-1132835/e=
nvironment
    2023-01-08T23:03:47.442336  =

    2023-01-08T23:03:50.262967  / # . /lava-1132835/environment/lava-113283=
5/bin/lava-test-runner /lava-1132835/1
    2023-01-08T23:03:50.269019  =

    2023-01-08T23:03:50.269283  / # /lava-1132835/bin/lav<4>[   22.978374] =
usb_phy_generic usbphynop3: deferred probe timeout, ignoring dependency =

    ... (34 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb49aa782bc0f2784eee20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb49aa782bc0f2784ee=
e21
        failing since 157 days (last pass: v5.19-1483-gffa33bbcf63ea, first=
 fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4d7526e2b8e9f74eee94

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4d7526e2b8e9f74eee99
        failing since 4 days (last pass: v6.1-rc6-391-gf445421fe4c7, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:10:11.457675  + set +x
    2023-01-08T23:10:11.458767  <8>[   33.627764] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1132833_1.5.2.4.1>
    2023-01-08T23:10:11.566791  / # #
    2023-01-08T23:10:12.726400  export SHELL=3D/bin/sh
    2023-01-08T23:10:12.732066  #
    2023-01-08T23:10:12.732333  / # export SHELL=3D/bin/sh
    2023-01-08T23:10:14.279753  / # . /lava-1132833/environment
    2023-01-08T23:10:17.106630  /lava-1132833/bin/lava-test-runner /lava-11=
32833/1
    2023-01-08T23:10:17.112787  . /lava-1132833/environment
    2023-01-08T23:10:17.113054  / # /lava-1132833/bin/lava-test-runner /lav=
a-1132833/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63bb4f86d9f11c23ad4eee1a

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4f86d9f11c23ad4eee1d
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:19:15.652138  / # #
    2023-01-08T23:19:15.754099  export SHELL=3D/bin/sh
    2023-01-08T23:19:15.754508  #
    2023-01-08T23:19:15.855778  / # export SHELL=3D/bin/sh. /lava-242090/en=
vironment
    2023-01-08T23:19:15.856337  =

    2023-01-08T23:19:15.957658  / # . /lava-242090/environment/lava-242090/=
bin/lava-test-runner /lava-242090/1
    2023-01-08T23:19:15.958520  =

    2023-01-08T23:19:15.981752  / # /lava-242090/bin/lava-test-runner /lava=
-242090/1
    2023-01-08T23:19:16.028689  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-08T23:19:16.029204  + cd /l<8>[   16.102001] <LAVA_SIGNAL_START=
RUN 1_bootrr 242090_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63b=
b4f87d9f11c23ad4eee2d
        new failure (last pass: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:19:20.089216  /lava-242090/1/../bin/lava-test-case
    2023-01-08T23:19:20.089934  <8>[   20.327449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4a3923c914ff0c4eee8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4a3923c914ff0c4ee=
e8b
        failing since 88 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb50d1669034b7664eee32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb50d1669034b7664ee=
e33
        failing since 88 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb50d3c24b9cb1104eee28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb50d3c24b9cb1104ee=
e29
        failing since 88 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb50d4669034b7664eee39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb50d4669034b7664ee=
e3a
        failing since 88 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4fa0e1beb2501c4eef5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb4fa0e1beb2501c4ee=
f60
        failing since 88 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb50d0669034b7664eee2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb50d0669034b7664ee=
e2f
        failing since 88 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb48efe02ca111774eee26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bb48efe02ca111774ee=
e27
        failing since 25 days (last pass: v6.1-2435-g5c02e5d167d0, first fa=
il: v6.1-6378-g44d433ee7540) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb47a5b07622954d4eee1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a8=
3t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb47a5b07622954d4eee20
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T22:45:52.118485  [   19.240923] <LAVA_SIGNAL_ENDRUN 0_dmesg =
376065_1.5.2.4.1>
    2023-01-08T22:45:52.227124  / # #
    2023-01-08T22:45:52.329447  export SHELL=3D/bin/sh
    2023-01-08T22:45:52.329991  #
    2023-01-08T22:45:52.432115  / # export SHELL=3D/bin/sh. /lava-376065/en=
vironment
    2023-01-08T22:45:52.432654  =

    2023-01-08T22:45:52.534123  / # . /lava-376065/environment/lava-376065/=
bin/lava-test-runner /lava-376065/1
    2023-01-08T22:45:52.535287  =

    2023-01-08T22:45:52.546195  / # /lava-376065/bin/lava-test-runner /lava=
-376065/1
    2023-01-08T22:45:52.669991  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb49fdd72a79ddf44eee3c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb49fdd72a79ddf44eee3f
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T22:55:36.715513  / # #
    2023-01-08T22:55:36.817831  export SHELL=3D/bin/sh
    2023-01-08T22:55:36.818507  #[   19.175443] usb-storage 1-1.1:1.0: USB =
Mass Storage device detected
    2023-01-08T22:55:36.818755  [   19.183741] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-08T22:55:36.818958  [   19.196928] usbcore: registered new inte=
rface driver uas
    2023-01-08T22:55:36.819306  =

    2023-01-08T22:55:36.920607  / # export SHELL=3D/bin/sh. /lava-376079/en=
vironment
    2023-01-08T22:55:36.921267  =

    2023-01-08T22:55:37.024093  / # . /lava-376079/environment/lava-376079/=
bin/lava-test-runner /lava-376079/1
    2023-01-08T22:55:37.025147   =

    ... (25 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4a61d245df10824eee63

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4a61d245df10824eee66
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T22:57:30.069871  / # [   18.300403] usb-st#
    2023-01-08T22:57:30.172169  export SHELL=3D/bin/sh
    2023-01-08T22:57:30.173151  orage 2-1.1:1.0: USB Mass Storage device de=
tected
    2023-01-08T22:57:30.173572  [   18.308862] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-08T22:57:30.173950  [   18.323159] usbcore: registered new inte=
rface driver uas
    2023-01-08T22:57:30.174336  #
    2023-01-08T22:57:30.276454  / # export SHELL=3D/bin/sh. /lava-376091/en=
vironment
    2023-01-08T22:57:30.277450  =

    2023-01-08T22:57:30.379637  / # . /lava-376091/environment/lava-376091/=
bin/lava-test-runner /lava-376091/1
    2023-01-08T22:57:30.380989   =

    ... (25 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4b0278d86374ba4eee47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/ba=
seline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/ba=
seline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4b0278d86374ba4eee4a
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:00:01.599673  / # #
    2023-01-08T23:00:01.703093  export SHELL=3D/bin/sh
    2023-01-08T23:00:01.703610  #
    2023-01-08T23:00:01.808102  / # export SHELL=3D/bin/sh. /lava-376096/en=
vironment
    2023-01-08T23:00:01.808620  =

    2023-01-08T23:00:01.808888  / # [   23.133189] usb-storage 2-1.1:1.0: U=
SB Mass Storage device detected
    2023-01-08T23:00:01.809630  [   23.143118] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-08T23:00:01.809932  [   23.166065] usbcore: registered new inte=
rface driver uas
    2023-01-08T23:00:01.915101  . /lava-376096/environment/lava-376096/bin/=
lava-test-runner /lava-376096/1
    2023-01-08T23:00:01.915952   =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb4b8d91eecd13984eee19

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-s=
un8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb4b8d91eecd13984eee1c
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T23:02:29.407438  [   18.401432] usbcore: registered new inte=
rface driver uas#
    2023-01-08T23:02:29.509429  export SHELL=3D/bin/sh
    2023-01-08T23:02:29.510177  =

    2023-01-08T23:02:29.510439  #
    2023-01-08T23:02:29.612446  / # export SHELL=3D/bin/sh. /lava-376107/en=
vironment
    2023-01-08T23:02:29.613174  =

    2023-01-08T23:02:29.714432  / # . /lava-376107/environment/lava-376107/=
bin/lava-test-runner /lava-376107/1
    2023-01-08T23:02:29.715508  =

    2023-01-08T23:02:29.731669  / # /lava-376107/bin/lava-test-runner /lava=
-376107/1
    2023-01-08T23:02:29.847043  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bb46a1059d801cc74eee2b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-=
bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc3-21=
7-gcf5f49e41cd4e/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-=
bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221230.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bb46a1059d801cc74eee2e
        failing since 3 days (last pass: v6.0-rc5-224-g269f27f24a11, first =
fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-08T22:41:19.826157  / # #
    2023-01-08T22:41:19.928467  export SHELL=3D/bin/sh
    2023-01-08T22:41:19.929115  #
    2023-01-08T22:41:20.031444  / # export SHELL=3D/bin/sh. /lava-376058/en=
vironment
    2023-01-08T22:41:20.032285  =

    2023-01-08T22:41:20.133974  / # . /lava-376058/environment/lava-376058/=
bin/lava-test-runner /lava-376058/1
    2023-01-08T22:41:20.135057  =

    2023-01-08T22:41:20.148689  / # /lava-376058/bin/lava-test-runner /lava=
-376058/1
    2023-01-08T22:41:20.257884  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-08T22:41:20.258367  + cd /lava-376058/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =20
