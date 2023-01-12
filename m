Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E891666B41
	for <lists+linux-next@lfdr.de>; Thu, 12 Jan 2023 07:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjALGnl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Jan 2023 01:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjALGnj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2023 01:43:39 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D9F321AD
        for <linux-next@vger.kernel.org>; Wed, 11 Jan 2023 22:43:37 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id jn22so19248779plb.13
        for <linux-next@vger.kernel.org>; Wed, 11 Jan 2023 22:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0gH6LdK2R29OL7bGZ0DFtzgeuM3jSbzk1d/SziPxV20=;
        b=5Zc++PrYjhMHKUcxT4x8qeEzpNBCM37FQMvsBksAFe3B/u4g+ax99XwWGa2QqQKAjt
         5RIbHmSshjvd2JDUazA+XURDu15mPQ75uDPg1NrbZJRhoa4wyQ+5r/7PUDsKFe0uTUqk
         vvKxGDbxXTtOQRp7+GeuGjCBdL9npeF3J0uEQeYwBWXksQVo/pN7y+1DP9Uijy6vq8FI
         THFYnN0l3TkjtTlItUXkEJTBigmD20yCfoPGwEgezNh7D+52e6grQ5gFsg/nM7xZuqNy
         +59uD2y9FXsiCN0YikIrBebmKl3OtC2f4zrs7G10qChJtVQt23UhR3MtfSuQGP4IJUOX
         J8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gH6LdK2R29OL7bGZ0DFtzgeuM3jSbzk1d/SziPxV20=;
        b=pQkwtCFpQjnPizWYKHrL7cqd8xiH/7XBWYxdoyTJBvoDMAse2Uv/lzceNFZDArG3GB
         Z+jil4sR1e3xUBMCD7qvTf1milmc14Cbm72WG8cNj86abNoYx4pdN9kR1tU1HKeTDKwB
         plQc3CLPXsMEAFSKwq1Vb0xu97j/r7ipgIAjQbBPAzvr/Wl0wJjD92E8kzV65w+Quhyy
         F6AThVyrR+lgeZrID3MNVnwGazIXkDNqOxuVMSG2F6z0FGNIFBYEDywxgbeYZNhx5pk9
         FKiGNYv8j5ObClIKGhK/awypZJ/gEXHEmMSs2Rh8yMcJ+dWHuPW0EARhAj47K0EHpqCg
         4HSg==
X-Gm-Message-State: AFqh2kpWEkLTbdHsL7yvuRzciXnhNfrbe2WBhtc5uoNuoX3XgAXgx9bQ
        WomsRF62RYCrRNpDuDrAc5BU0Dl3Tq5emHv+xaw=
X-Google-Smtp-Source: AMrXdXuPF9S+VWiIWlDlYEBFwhsF/cYCFTWtwP27YsXKGCm14zRqRRuzwaA6mBKKKXT8e8sull31Tg==
X-Received: by 2002:a17:90a:7acf:b0:227:24d0:41b9 with SMTP id b15-20020a17090a7acf00b0022724d041b9mr10610893pjl.26.1673505816553;
        Wed, 11 Jan 2023 22:43:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j23-20020a17090a061700b002262fcd92desm12093896pjj.7.2023.01.11.22.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 22:43:36 -0800 (PST)
Message-ID: <63bfac18.170a0220.a9ec4.433d@mx.google.com>
Date:   Wed, 11 Jan 2023 22:43:36 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230112
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 515 runs, 14 regressions (next-20230112)
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

next/master baseline: 515 runs, 14 regressions (next-20230112)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =

mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =

qcom-qdf2400               | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =

qemu_mips-malta            | mips  | lab-collabora   | gcc-10   | malta_def=
config              | 1          =

r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =

rk3399-roc-pc              | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =

rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 1          =

sun8i-a83t-bananapi-m3     | arm   | lab-clabbe      | clang-16 | multi_v7_=
defconfig           | 1          =

zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230112/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230112
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a093b2893c711d82622a9ab27da4f1172821336 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-riotboard           | arm   | lab-pengutronix | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf7e03c6ec1708c11d3a48

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf7e03c6ec1708c11d3a4d
        new failure (last pass: next-20230111)

    2023-01-12T03:26:41.065147  + set[   15.022633] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 877814_1.5.2.3.1>
    2023-01-12T03:26:41.065352   +x
    2023-01-12T03:26:41.171206  / # #
    2023-01-12T03:26:41.272834  export SHELL=3D/bin/sh
    2023-01-12T03:26:41.273302  #
    2023-01-12T03:26:41.374595  / # export SHELL=3D/bin/sh. /lava-877814/en=
vironment
    2023-01-12T03:26:41.374977  =

    2023-01-12T03:26:41.476283  / # . /lava-877814/environment/lava-877814/=
bin/lava-test-runner /lava-877814/1
    2023-01-12T03:26:41.476919  =

    2023-01-12T03:26:41.480095  / # /lava-877814/bin/lava-test-runner /lava=
-877814/1 =

    ... (12 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6dl-udoo                | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf804b41a281b14f1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf804b41a281b14f1d3=
9d2
        failing since 215 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-udoo                 | arm   | lab-broonie     | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf807341a281b14f1d3a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf807341a281b14f1d3=
a5a
        failing since 126 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron     | gcc-10   | defconfig=
+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf8562de2c216e471d39c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf8562de2c216e471d3=
9ca
        failing since 63 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
mt8192-asurada-spherion-r0 | arm64 | lab-collabora   | clang-13 | cros://ch=
rome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf78587d41bb96fa1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf78587d41bb96fa1d3=
9d2
        failing since 1 day (last pass: next-20230109, first fail: next-202=
30110) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qcom-qdf2400               | arm64 | lab-linaro-lkft | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf842a382a073d761d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf842a382a073d761d3=
9c3
        new failure (last pass: next-20230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf806b41a281b14f1d3a53

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf806b41a281b14f1d3=
a54
        failing since 6 days (last pass: next-20221207, first fail: next-20=
230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie     | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf802f5a187f5a791d3a23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf802f5a187f5a791d3=
a24
        failing since 6 days (last pass: next-20221207, first fail: next-20=
230105) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_mips-malta            | mips  | lab-collabora   | gcc-10   | malta_def=
config              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf79b38ce6ab2e681d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf79b38ce6ab2e681d3=
9e5
        new failure (last pass: next-20230111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a7743-iwg20d-q7          | arm   | lab-cip         | gcc-10   | shmobile_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf78a75925d795a71d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf78a75925d795a71d3=
9d3
        failing since 5 days (last pass: next-20230105, first fail: next-20=
230106) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-roc-pc              | arm64 | lab-clabbe      | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf82f55edf7f36021d3aa3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf82f55edf7f36021d3aa6
        failing since 6 days (last pass: next-20221130, first fail: next-20=
230105)

    2023-01-12T03:47:46.442831  + set +x
    2023-01-12T03:47:46.444102  <8>[   63.702679][  T197] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 377714_1.5.2.4.1>
    2023-01-12T03:47:46.572902  #
    2023-01-12T03:47:46.675577  / # #export SHELL=3D/bin/sh
    2023-01-12T03:47:46.676172  =

    2023-01-12T03:47:46.777734  / # export SHELL=3D/bin/sh. /lava-377714/en=
vironment
    2023-01-12T03:47:46.778311  =

    2023-01-12T03:47:46.879895  / # . /lava-377714/environment/lava-377714/=
bin/lava-test-runner /lava-377714/1
    2023-01-12T03:47:46.880816  =

    2023-01-12T03:47:46.887021  / # /lava-377714/bin/lava-test-runner /lava=
-377714/1 =

    ... (43 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
rk3399-rock-pi-4b          | arm64 | lab-collabora   | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf7fa4f4856991be1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63bf7fa4f4856991be1d3=
9c3
        new failure (last pass: next-20230111) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3     | arm   | lab-clabbe      | clang-16 | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf7a0627d45890901d39cd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf7a0627d45890901d39d0
        failing since 6 days (last pass: next-20220919, first fail: next-20=
230105)

    2023-01-12T03:09:50.783197  [   19.872504] <LAVA_SIGNAL_ENDRUN 0_dmesg =
377684_1.5.2.4.1>
    2023-01-12T03:09:50.889916  / # #
    2023-01-12T03:09:50.992355  export SHELL=3D/bin/sh
    2023-01-12T03:09:50.992954  [   19.912794] usb-storage 2-1.1:1.0: USB M=
ass Storage device detected
    2023-01-12T03:09:50.993403  [   19.921869] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-12T03:09:50.993711  [   19.939256] usbcore: registered new inte=
rface driver uas
    2023-01-12T03:09:50.994009  #
    2023-01-12T03:09:51.095471  / # export SHELL=3D/bin/sh. /lava-377684/en=
vironment
    2023-01-12T03:09:51.096081  =

    2023-01-12T03:09:51.197813  / # . /lava-377684/environment/lava-377684/=
bin/lava-test-runner /lava-377684/1 =

    ... (22 line(s) more)  =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
zynqmp-zcu102              | arm64 | lab-cip         | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63bf816d110447960d1d39c7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230112/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63bf816d110447960d1d39ca
        failing since 6 days (last pass: next-20221207, first fail: next-20=
230105)

    2023-01-12T03:41:12.715075  + set +x
    2023-01-12T03:41:12.739221  <8>[   32.009338][  T171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 822716_1.5.2.4.1>
    2023-01-12T03:41:12.863490  #
    2023-01-12T03:41:12.965342  / # #export SHELL=3D/bin/sh
    2023-01-12T03:41:12.965920  =

    2023-01-12T03:41:13.067333  / # export SHELL=3D/bin/sh. /lava-822716/en=
vironment
    2023-01-12T03:41:13.067856  =

    2023-01-12T03:41:13.169265  / # . /lava-822716/environment/lava-822716/=
bin/lava-test-runner /lava-822716/1
    2023-01-12T03:41:13.169831  =

    2023-01-12T03:41:13.172913  / # /lava-822716/bin/lava-test-runner /lava=
-822716/1 =

    ... (18 line(s) more)  =

 =20
