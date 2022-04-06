Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9664F6035
	for <lists+linux-next@lfdr.de>; Wed,  6 Apr 2022 15:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbiDFNei (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Apr 2022 09:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbiDFNeS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Apr 2022 09:34:18 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845F14F0CC4
        for <linux-next@vger.kernel.org>; Wed,  6 Apr 2022 03:34:39 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id t4so1870089pgc.1
        for <linux-next@vger.kernel.org>; Wed, 06 Apr 2022 03:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2QnPcCMYpbD1PSSeazO6ttmaOJnYLyxZbzoJPyYiako=;
        b=24QlVkHUk3XiEcwWqI6I5Q567HE7uF37h49g1h7KsjZkQHcNj9XGs54fU3iif5rcl+
         /8kqVjFc7zUAYEtYpvFuSqr06GpwwXUkRqVu4LKsqumWNr2mc+DJT/aaiPdTsz/IlCG8
         gtFusBn0vF6/rJsvkY17qCnflpJ01wU4ELwtJmC40GgIN/DDSUx5Nh98StamQX6pQ7qS
         rBWVuU0FKfhy+tu0EOy/r0Fm1pjm51U3HvqaKSMSI99JgSOYL3mSMeMJmUPia83sKjQ2
         wz/StMEVRII2KEHqJA8yUFPQjOZryJv+VULaBckSckP6H1i6AGABE4xRDNncd3BpkXF7
         SwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2QnPcCMYpbD1PSSeazO6ttmaOJnYLyxZbzoJPyYiako=;
        b=TLVCqyeLi8u0Z3SvOfTihNpDoXIBfV1SzaxLWPzuz1TN2M/GDS3mncvl2diomPH5Xk
         D2TzNYwCPfFt0wq63fA2tVnQZBQ4THrmKKnJiq1fL/g+XFSegrIByNYX2M7XXr6gjSBp
         MU4ZAW1BtHWWLWlhqGGzugVEuI0L/tnqC1Ey9b58rwYmr4HN0qP3vCySwAoe0m0Gt/RQ
         oR0PnfoAjhf16/avS2Ra22lhiduKfWqSbVqrOUPGtf6EEI/0qPSFY2Vbn3BqVSfe1ohp
         hXeyFWEL+qMkk8GifHm0X/U/PrNaea62V5EP4kSt23z2FARfmLk/2TTbuj3nri8md4kM
         nncw==
X-Gm-Message-State: AOAM530jOkupgrPhuyOkBZwiTgZEbCvoFJFs7hGWwDxFsKRb2cbkljoq
        QVlk6ghxaZ16gIxHlvG/u0rhcRi75DP2P4UX
X-Google-Smtp-Source: ABdhPJzermCQogTYipbyxdpnFKRZrkHGZ4cqx6nd36dcLluPmfLlChh5Yia86NW3lJeKRfa1a4Xhkw==
X-Received: by 2002:a05:6a00:b95:b0:4fa:ec15:7eb7 with SMTP id g21-20020a056a000b9500b004faec157eb7mr8321779pfj.74.1649241278400;
        Wed, 06 Apr 2022 03:34:38 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p64-20020a622943000000b004fdd5c07d0bsm16925605pfp.63.2022.04.06.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:34:37 -0700 (PDT)
Message-ID: <624d6cbd.1c69fb81.ffda7.ae1e@mx.google.com>
Date:   Wed, 06 Apr 2022 03:34:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220406
X-Kernelci-Report-Type: test
Subject: next/master baseline: 314 runs, 5 regressions (next-20220406)
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

next/master baseline: 314 runs, 5 regressions (next-20220406)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
hifive-unleashed-a00       | riscv | lab-baylibre | gcc-10   | defconfig   =
    | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron  | gcc-10   | defconfig+im=
a   | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220406/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220406
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      109f6d10ec17302c4666f7df3dfa0e31d8589d41 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
hifive-unleashed-a00       | riscv | lab-baylibre | gcc-10   | defconfig   =
    | 1          =


  Details:     https://kernelci.org/test/plan/id/624d341571669b0141ae074a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220406/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220406/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624d341571669b0141ae0=
74b
        failing since 160 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
kontron-pitx-imx8m         | arm64 | lab-kontron  | gcc-10   | defconfig+im=
a   | 1          =


  Details:     https://kernelci.org/test/plan/id/624d34b84193363695ae069c

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/624=
d34b84193363695ae06af
        new failure (last pass: next-20220405)

    2022-04-06T06:35:14.431494  /lava-106444/1/../bin/lava-test-case
    2022-04-06T06:35:14.431830  <8>[   16.684299] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-04-06T06:35:14.432022  /lava-106444/1/../bin/lava-test-case
    2022-04-06T06:35:14.432202  <8>[   16.704345] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-04-06T06:35:14.432400  /lava-106444/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/624d3a2beada8cc938ae0694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624d3a2beada8cc938ae0=
695
        failing since 79 days (last pass: next-20220105, first fail: next-2=
0220116) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/624d37fcc79a2af025ae06d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624d37fcc79a2af025ae0=
6d7
        failing since 55 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
    | regressions
---------------------------+-------+--------------+----------+-------------=
----+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie  | gcc-10   | defconfig+de=
bug | 1          =


  Details:     https://kernelci.org/test/plan/id/624d37fa6933447336ae06c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220406/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/624d37fa6933447336ae0=
6c4
        failing since 55 days (last pass: next-20220207, first fail: next-2=
0220209) =

 =20
