Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD3D4DAA0F
	for <lists+linux-next@lfdr.de>; Wed, 16 Mar 2022 06:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348509AbiCPFuQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Mar 2022 01:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238982AbiCPFuP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2022 01:50:15 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AA760053
        for <linux-next@vger.kernel.org>; Tue, 15 Mar 2022 22:49:01 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id t2so2482433pfj.10
        for <linux-next@vger.kernel.org>; Tue, 15 Mar 2022 22:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VtZU4ZQ847mn7RfUMI6TtT5kZpM4nsL27dxZ4GrXmdk=;
        b=3+g2YdWuxAg2ozOqHL8Jq7qHvOQ+hRXi0kXhdA2+LBkgMwurtoo8TfKTdfvsRka12O
         efMe/33E0CyPwcFA2HCVluVscPgDKva8p3S2YQxHmxRqVEGBLg476eqh5NqltBkr4aUZ
         dlZuTY0hUvhFclLtd00VoySaqNyb+jH4K02jtn/3IkKb5/Wcw7dqsQjvmy+OS4Q7fVmB
         WTP+J6QS5qxzEKr7ZzLCZkEMzw1VMcIOkseU752ejLBCaSXpSaTeuIlRrkreLCANpL4T
         pMUMcoELs6XRj0uPpwJVc+mq7Y6R8PxFWahpj2uNVeNITj/uisOHg6Dhp+dOQ2BuMNda
         cSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VtZU4ZQ847mn7RfUMI6TtT5kZpM4nsL27dxZ4GrXmdk=;
        b=7wKFU/o8oBr6CH+Ora88zdPZN5S/jmT5nuDvKoyewaV7vnpdM2ZXf4ivIwgQz2fdBP
         FQ4Ca53m20MJ1v9/6oazFI3jhz4UVdDAMl5qyPk0f2zmDRzzJFBj5X5PVLmTlAo2afdP
         tS/Q6ni3ckF0eXoxp6iaLULSC8GBOlu9/0x2laYzbqsF7Blt3KzV0xzi6/cjiiL+7lBk
         vu1Z9IXVV/imzcbGGW6MuSGnoNAjNJpeBCX/QFNJz+BIriLMwibB25Ate7UjuBPHf9Bd
         9QAmw7yT6W4/u8X809/v95E/Lx8HRq0paVQ8KXc1bis/mujfxDz+bhwYfFboU2oaeqn0
         hwWA==
X-Gm-Message-State: AOAM530SZc8KauEg959A6TlH4ofyW9AoSjJnEQgwuR+ZCYtWsn9olyW4
        igs/fjlfQEGWazH9REjQTpHDzGHwX08zTgcYiNs=
X-Google-Smtp-Source: ABdhPJyId5uNA/D8/eV30xVvRUqiAnRBuNEG8oFUkeRF53wQ7qlwM+bdtJXpydZZ37NY6ILSjxmg9w==
X-Received: by 2002:a63:7d5d:0:b0:34c:17:6174 with SMTP id m29-20020a637d5d000000b0034c00176174mr27600711pgn.133.1647409740673;
        Tue, 15 Mar 2022 22:49:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b004f7c76f29c3sm1184365pfv.24.2022.03.15.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 22:49:00 -0700 (PDT)
Message-ID: <62317a4c.1c69fb81.c23b0.3915@mx.google.com>
Date:   Tue, 15 Mar 2022 22:49:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc8-122-ge6f79dd905ae
Subject: next/pending-fixes baseline: 381 runs,
 13 regressions (v5.17-rc8-122-ge6f79dd905ae)
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

next/pending-fixes baseline: 381 runs, 13 regressions (v5.17-rc8-122-ge6f79=
dd905ae)

Regressions Summary
-------------------

platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15         | arm    | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

am57xx-beagle-x15         | arm    | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

am57xx-beagle-x15         | arm    | lab-linaro-lkft | gcc-10   | multi_v7_=
defconfig+debug     | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...6-chromebook | 1          =

bcm2711-rpi-4-b           | arm64  | lab-collabora   | gcc-10   | defconfig=
                    | 1          =

bcm2836-rpi-2-b           | arm    | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                | arm    | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...ebook+amdgpu | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...6-chromebook | 1          =

kontron-pitx-imx8m        | arm64  | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

minnowboard-turbot-E3826  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fconfig+debug       | 1          =

rk3399-gru-kevin          | arm64  | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc8-122-ge6f79dd905ae/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc8-122-ge6f79dd905ae
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e6f79dd905ae05052115c1cc6bce199dc1b7bae5 =



Test Regressions
---------------- =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15         | arm    | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/623145b8a14c0ca646c629a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-am=
57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-am=
57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623145b8a14c0ca646c62=
9a9
        new failure (last pass: v5.17-rc4-202-g519817c8f9d2) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15         | arm    | lab-baylibre    | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62314af60556abf132c62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314af60556abf132c62=
974
        failing since 33 days (last pass: v5.17-rc3-356-gdfd7907f4e4f, firs=
t fail: v5.17-rc3-394-gc849047c2473) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
am57xx-beagle-x15         | arm    | lab-linaro-lkft | gcc-10   | multi_v7_=
defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/62314bd4e079b36782c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314bd4e079b36782c62=
970
        failing since 33 days (last pass: v5.17-rc3-356-gdfd7907f4e4f, firs=
t fail: v5.17-rc3-394-gc849047c2473) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6231418a8e0b921470c62987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6231418a8e0b921470c62=
988
        failing since 0 day (last pass: v5.17-rc7-220-g483b57a0f972, first =
fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/623143a9cda23143c8c629b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/623143a9cda23143c8c62=
9b1
        new failure (last pass: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
bcm2711-rpi-4-b           | arm64  | lab-collabora   | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62314756aa06ef8beec62974

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-=
4-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-=
4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314756aa06ef8beec62=
975
        new failure (last pass: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b           | arm    | lab-collabora   | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62314befe079b36782c62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314befe079b36782c62=
978
        failing since 26 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
da850-lcdk                | arm    | lab-baylibre    | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62314094a5e0c75cfec62992

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62314094a5e0c75=
cfec62996
        failing since 51 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-16T01:42:16.919341  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-16T01:42:16.919596  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-16T01:42:16.919776  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-16T01:42:16.962168  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6231413ef50833bdc5c62982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6231413ef50833bdc5c62=
983
        failing since 0 day (last pass: v5.17-rc7-220-g483b57a0f972, first =
fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62314718de19059212c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314718de19059212c62=
977
        new failure (last pass: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m        | arm64  | lab-kontron     | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6231478ed43512bd9bc62981

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/623=
1478ed43512bd9bc62998
        new failure (last pass: v5.17-rc7-220-g483b57a0f972)

    2022-03-16T02:12:20.216715  /lava-99453/1/../bin/lava-test-case
    2022-03-16T02:12:20.290791  <8>[   11.370865] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-03-16T02:12:20.291134  /lava-99453/1/../bin/lava-test-case   =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
minnowboard-turbot-E3826  | x86_64 | lab-collabora   | gcc-10   | x86_64_de=
fconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/62314ba2d399151a1bc62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baselin=
e-minnowboard-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62314ba2d399151a1bc62=
978
        new failure (last pass: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab             | compiler | defconfig=
                    | regressions
--------------------------+--------+-----------------+----------+----------=
--------------------+------------
rk3399-gru-kevin          | arm64  | lab-collabora   | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62314130c701ba82b4c6298a

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
22-ge6f79dd905ae/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62314130c701ba82b4c629b0
        failing since 15 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-16T01:45:03.181340  <8>[   32.858210] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-16T01:45:04.202707  /lava-5887620/1/../bin/lava-test-case
    2022-03-16T01:45:04.213595  <8>[   33.892079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =20
