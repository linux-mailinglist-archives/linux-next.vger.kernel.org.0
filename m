Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006F54F5453
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 06:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiDFEsI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Apr 2022 00:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388732AbiDEVzh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Apr 2022 17:55:37 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CA967D30
        for <linux-next@vger.kernel.org>; Tue,  5 Apr 2022 14:06:47 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id p17so192891plo.9
        for <linux-next@vger.kernel.org>; Tue, 05 Apr 2022 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WytWcg2Fuaf/AKRxSwxhQDUDIOvXJRva77GloDG1ImM=;
        b=rnbI6Bjd1jmOZpdQ0qv6zthAi8RJrA+a8N657ik/KTtQHJbZ4TDE8Eio/FTk89ZGZb
         wkNoUYJvIcaSzvH7RS1z1kgK1BC1jIG3GpJTyKoYncMwoFfUTADCufx7+CPIT1kr5JE8
         fVohrU78kddNj8uxkrDebu/ARqsiOhFEGDtz3umz4lkExmwSdIN2muOFZdA66e+u/EJs
         UYaOXpNWafbPfGQEwBbtCMOUm6gQhfh7vcUrhfgGr1hSfQaaIwK9s1K9Jn6UUQv395rW
         BmhIkQNNYokKGRBs5yCcNr8We615lhMyN39RY//0YF1Vs55vD22XyLwWQIRZbTBsgCVB
         6Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WytWcg2Fuaf/AKRxSwxhQDUDIOvXJRva77GloDG1ImM=;
        b=x22dfjVPnUKuS1Aynkz5hBxDqi6q6J5ZNT6yujiZMGgFVJJb2wQwTBnr2827VcK4ao
         /M3Tum+K4PH18F3pN0ftpiGLTgQSE0GCosZPVEPOojen1bj3THARD1lOgcv6eu0b/CFC
         BJn9cQKK+OnDNN5bdP4Zudj/YN7TnQsSxe1ChktmUjp8WFfKFpDUy9uTT8civZ3QDDQ9
         YNlKnzDcuEIRr4KrNt33IdnfD3UAb4Mz3GcweJq9QcYG1XDxtM7r4Y48f2b2Vk9YNAAL
         m9C3C8mshmrDwKF9YW/sBMHQSqa5smIDs/zq0/zjZNkRjVxc/duAA48PgpobNl68OTub
         caGw==
X-Gm-Message-State: AOAM530YjwIr/Hg/wqioNxSZvGkEcE01oZ319HF796GzYx+a7qt8mwUe
        XRwILBmA4Lk7aJbbpHFik2wC0z/OcDwKeNTwnFs=
X-Google-Smtp-Source: ABdhPJzLShc0sGhDUTkqgY/yQGHIsO6U8EgrjoyOc9uWWRp9NtwaMIAowTN6uJ7YlyXjqrpQNWhkJg==
X-Received: by 2002:a17:90a:a78c:b0:1b8:b769:62d0 with SMTP id f12-20020a17090aa78c00b001b8b76962d0mr6152139pjq.227.1649192806370;
        Tue, 05 Apr 2022 14:06:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x24-20020aa79ad8000000b004fde026f4b2sm13011924pfp.199.2022.04.05.14.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 14:06:46 -0700 (PDT)
Message-ID: <624caf66.1c69fb81.df548.2024@mx.google.com>
Date:   Tue, 05 Apr 2022 14:06:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc1-178-g95d86c51b643
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 207 runs,
 5 regressions (v5.18-rc1-178-g95d86c51b643)
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

next/pending-fixes baseline: 207 runs, 5 regressions (v5.18-rc1-178-g95d86c=
51b643)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto           | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron   | gcc-10   | defconfig  =
                | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc1-178-g95d86c51b643/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc1-178-g95d86c51b643
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      95d86c51b643ec512c4557a6e0e7842e4bf65151 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
imx8mn-ddr4-evk            | arm64 | lab-baylibre  | gcc-10   | defconfig+c=
rypto           | 1          =


  Details:     https://kernelci.org/test/plan/id/624c9ca3712c41e6a9ae06b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn=
-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c9ca3712c41e6a9ae0=
6b5
        new failure (last pass: v5.18-rc1-107-g56ad09fc9d717) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron   | gcc-10   | defconfig  =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/624c784f5899c03cdbae0688

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/624=
c784f5899c03cdbae069b
        failing since 1 day (last pass: v5.17-13747-gaeb9fed350ee, first fa=
il: v5.18-rc1-107-g56ad09fc9d717)

    2022-04-05T17:11:28.985551  /lava-106163/1/../bin/lava-test-case
    2022-04-05T17:11:28.986083  <8>[   14.653277] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-05T17:11:28.986307  /lava-106163/1/../bin/lava-test-case
    2022-04-05T17:11:28.986489  <8>[   14.672990] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-05T17:11:28.986670  /lava-106163/1/../bin/lava-test-case
    2022-04-05T17:11:28.986834  <8>[   14.693975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-04-05T17:11:28.987007  /lava-106163/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/624c74f858840920d7ae06bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c74f858840920d7ae0=
6bd
        failing since 50 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/624c751f772936d4cfae067c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624c751f772936d4cfae0=
67d
        failing since 50 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/624c7fff75f1943351ae06bf

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-1=
78-g95d86c51b643/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/624c7fff75f1943351ae06e1
        failing since 36 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-05T17:44:07.958572  <8>[   32.590295] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-05T17:44:08.982912  /lava-6030153/1/../bin/lava-test-case
    2022-04-05T17:44:08.993805  <8>[   33.625749] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
