Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEA15F971F
	for <lists+linux-next@lfdr.de>; Mon, 10 Oct 2022 05:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiJJDAs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Oct 2022 23:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiJJDAr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Oct 2022 23:00:47 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F24B5072D
        for <linux-next@vger.kernel.org>; Sun,  9 Oct 2022 20:00:44 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id w2so9725580pfb.0
        for <linux-next@vger.kernel.org>; Sun, 09 Oct 2022 20:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2TvDaAP/9kFxpxgXL0826vMBk8CZzKFWIlQfIuwD5us=;
        b=mde9WxEiMMzDlDuPUybmUi8/A+XSE6C2fqvXETs+KtZd/rU5QOu1evUooFJeyVMFq9
         2SuzH6h6ITRkPCN3xin57zi6/bgSyGwnNSoofzGRZDEdyKgVwnM9KMiAxHK+QAA6r5zv
         kQjMgOHSZNLVoajJj+ep9sFq8NkDWiRc2a7ApVBoVrgfVQFmTiEqMjELLwTduk57V+mU
         MNflMWNvdxuGFSzQlMz251SIYSIXp0v4WhmU6W3mYfydjl+8xwgMm9cT5TRZa+edlS8n
         FQZQ5SskDRnZJAK2fCVF4t37I+BPjPP1+yLRIo0YaeVWGqIKrWL3Y1s44ySJda7wH2El
         Bk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TvDaAP/9kFxpxgXL0826vMBk8CZzKFWIlQfIuwD5us=;
        b=RhFARj0zyh5PcYaCJcaBq0j6jxNae6f3WQnMocqIXBlYgyBDvepbzlEwIQLOdMszJv
         2w+YvqeVYrmZxacnwf15jMGpinBoVZJzlvzn52vdCVBHPxFG8vHnLbNcCIUVdlVQ53Ys
         udBU90qsC0eHm/5a7hTkVAAKIJwiRYW68sGqDLeF7akk0xbN5X24cI+Fgb/RXwjKtQP3
         7n9blH4HcnRBr/K7yUe8WEb5N5NWotAo5BJEZW2eFuVTEM+xKPju8voS4+f5tghhcqxa
         9VC1pb5hW1MKDy9U3j/GOlxJcVanXL5U6v59wHUSTYKzHLRoG7/vSKidxLG+uglSu49x
         gYHQ==
X-Gm-Message-State: ACrzQf0b2JfaHGpqwI2cpddpiPA+trQ5lPfOydGILDyJg8Z2EwJS5xGE
        gzTGyZg0rEMskfIi4XDZZzU8HvAmyrGr8+mKNWk=
X-Google-Smtp-Source: AMsMyM7aJQmIvVUOma38h5Rr0hXtT2kOlF/BXKw78ds6HsjkSIObuZa8gXUB6JXmsNOMZv1BpGzW+A==
X-Received: by 2002:aa7:818f:0:b0:562:dc99:8a84 with SMTP id g15-20020aa7818f000000b00562dc998a84mr12504231pfi.30.1665370842883;
        Sun, 09 Oct 2022 20:00:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a23-20020aa794b7000000b00562ea6eeeb2sm3783125pfl.93.2022.10.09.20.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 20:00:42 -0700 (PDT)
Message-ID: <63438ada.a70a0220.f15e6.6256@mx.google.com>
Date:   Sun, 09 Oct 2022 20:00:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.0-9666-g02c05e0b8d5c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 556 runs,
 39 regressions (v6.0-9666-g02c05e0b8d5c)
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

next/pending-fixes baseline: 556 runs, 39 regressions (v6.0-9666-g02c05e0b8=
d5c)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-9666-g02c05e0b8d5c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-9666-g02c05e0b8d5c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      02c05e0b8d5c521809afcfc8f86a7599f583af1c =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6343560c48ae605347cab646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/b=
aseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343560c48ae605347cab=
647
        new failure (last pass: v6.0-6424-g1af0c6a154d32) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/634365de33cfc4ab3acab5ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-col=
labora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634365de33cfc4ab3acab=
5ef
        failing since 4 days (last pass: v6.0-854-g37b3c1c31342c, first fai=
l: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6343508638aab094e6cab630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-l=
cdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6343508638aab09=
4e6cab638
        failing since 259 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-10-09T22:51:27.106173  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-10-09T22:51:27.107184  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-10-09T22:51:27.109889  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-10-09T22:51:27.152220  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6343526f51eed939d3cab5f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343526f51eed939d3cab=
5f4
        new failure (last pass: v6.0-6424-g1af0c6a154d32) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/634354507e427fcba5cab5f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udo=
o.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udo=
o.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634354507e427fcba5cab=
5f5
        failing since 32 days (last pass: v5.19-rc5-383-g73ad9bd963c1, firs=
t fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6343542ae47839fd3bcab616

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343542ae47839fd3bcab=
617
        failing since 33 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63435498da063713f2cab698

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435498da063713f2cab=
699
        failing since 33 days (last pass: v6.0-rc3-415-gf29d411eb4af, first=
 fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/634357dffbd42a6963cab67f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634357dffbd42a6963cab=
680
        failing since 66 days (last pass: v5.19-1483-gffa33bbcf63ea, first =
fail: v5.19-3879-ge7dffa5317766) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63435ac3bd45b612d0cab613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435ac3bd45b612d0cab=
614
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63435c2adc073b6056cab5ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435c2adc073b6056cab=
600
        failing since 12 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63435efaf288b69946cab5fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp=
/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-nxp=
/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435efaf288b69946cab=
5fe
        failing since 16 days (last pass: v6.0-rc6-280-g7faf69694280, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/6343606246d81a7a9ccab5f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-nxp/baseline-imx7ulp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343606246d81a7a9ccab=
5fa
        failing since 16 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc6-387-gffc6a8abc59d) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63436332fd609b1d23cab5ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-=
imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-nxp/baseline-=
imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63436332fd609b1d23cab=
5f0
        failing since 12 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.0-rc7-155-g163b641d42e4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63435bd9712e2b2cfdcab5fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435bd9712e2b2cfdcab=
5fe
        failing since 163 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/634355301cd72beae2cab606

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-kont=
ron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634355301cd72beae2cab=
607
        failing since 4 days (last pass: v6.0-854-g37b3c1c31342c, first fai=
l: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/634358789e6152ce4ecab5fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ksw=
itch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-ksw=
itch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634358789e6152ce4ecab=
5fd
        failing since 4 days (last pass: v6.0-rc7-272-g94a8751e2e2c7, first=
 fail: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63435d659e4c4fb3b0cab613

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kon=
tron/baseline-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435d659e4c4fb3b0cab=
614
        failing since 3 days (last pass: v6.0-854-g37b3c1c31342c, first fai=
l: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63435ef51deac2ad29cab5ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-kontron/baseline-kontron=
-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435ef51deac2ad29cab=
600
        failing since 4 days (last pass: v6.0-854-g37b3c1c31342c, first fai=
l: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/634363ba66f7d5d9a2cab5ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/basel=
ine-kontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/basel=
ine-kontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634363ba66f7d5d9a2cab=
5ed
        failing since 4 days (last pass: v6.0-rc7-272-g94a8751e2e2c7, first=
 fail: v6.0-1478-g66d0b903fa341) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63435954b3c3b198b8cab607

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/634=
35954b3c3b198b8cab61a
        new failure (last pass: v6.0-6424-g1af0c6a154d32)

    2022-10-09T23:29:11.131458  /lava-181365/1/../bin/lava-test-case
    2022-10-09T23:29:11.131862  <8>[   20.694274] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-10-09T23:29:11.132100  /lava-181365/1/../bin/lava-test-case
    2022-10-09T23:29:11.132319  <8>[   20.713933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>
    2022-10-09T23:29:11.132539  /lava-181365/1/../bin/lava-test-case
    2022-10-09T23:29:11.132749  <8>[   20.734960] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy0-probed RESULT=3Dpass>
    2022-10-09T23:29:11.132961  /lava-181365/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/634354477e427fcba5cab5ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12b-=
a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12b-=
a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634354477e427fcba5cab=
5f0
        failing since 3 days (last pass: v6.0-854-g37b3c1c31342c, first fai=
l: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6343551983371af96dcab61b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-mes=
on8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343551983371af96dcab=
61c
        failing since 3 days (last pass: v6.0-rc6-387-gffc6a8abc59d, first =
fail: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6343567408eba424fbcab604

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-od=
roidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-od=
roidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343567408eba424fbcab=
605
        failing since 2 days (last pass: v6.0-rc6-212-g9e152597d89ac, first=
 fail: v6.0-6424-g1af0c6a154d32) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/634358484cc01ac7a0cab609

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-bay=
libre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634358484cc01ac7a0cab=
60a
        failing since 3 days (last pass: v6.0-rc6-280-g7faf69694280, first =
fail: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/634359a45d25ca534bcab5ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-meson8=
b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-meson8=
b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/634359a45d25ca534bcab=
5ed
        failing since 3 days (last pass: v6.0-rc6-387-gffc6a8abc59d, first =
fail: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63435b816589276014cab5f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/base=
line-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435b816589276014cab=
5fa
        failing since 3 days (last pass: v5.19-rc8-159-ge79a32d56d08, first=
 fail: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63435683c37dc8553dcab601

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435683c37dc8553dcab=
602
        failing since 65 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63435f97df82aa4e80cab5f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf=
2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qcom-qdf=
2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63435f97df82aa4=
e80cab5ff
        new failure (last pass: v6.0-5324-g7871897dadfa9)
        2 lines

    2022-10-09T23:55:58.909487  kern  :alert : BUG: Bad page state in proce=
ss udevd  pfn:ff7f6b
    2022-10-09T23:55:58.910736  kern  :alert : BUG: Bad page state in proce=
ss udevd  pfn:ff7f6c
    2022-10-09T23:55:58.931549  [   63.298556][  T571] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63436a908c9e825e87cab5ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63436a908c9e825e87cab=
600
        new failure (last pass: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6343543ae47839fd3bcab61b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343543ae47839fd3bcab=
61c
        new failure (last pass: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63436aa48c9e825e87cab607

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63436aa48c9e825e87cab=
608
        new failure (last pass: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/6343544b3341bf4a47cab610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6343544b3341bf4a47cab=
611
        new failure (last pass: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6343535d3addf73575cab5f2

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-m=
alta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6343535e3addf73=
575cab5fa
        new failure (last pass: v6.0-6424-g1af0c6a154d32)
        1 lines

    2022-10-09T23:03:42.759355  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address e9c6e5cc, epc =3D=3D 80201f20, ra =3D=
=3D 80204900
    2022-10-09T23:03:42.805697  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63435cd4bebc17c61acab602

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/=
baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63435cd4bebc17c61acab=
603
        new failure (last pass: v6.0-6424-g1af0c6a154d32) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63436239844d709e6bcab5ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63436239844d709e6bcab=
5ed
        failing since 4 days (last pass: v6.0-1478-g66d0b903fa341, first fa=
il: v6.0-5324-g7871897dadfa9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/63436d24ee55c8c7c3cab61e

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-9666-g=
02c05e0b8d5c/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline=
-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220919.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/63436d24ee55c8c7c3cab640
        failing since 223 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-10-10T00:53:47.228279  /lava-7538187/1/../bin/lava-test-case
    2022-10-10T00:53:47.245939  <8>[   42.614852] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63436d24ee55c8c7c3cab663
        failing since 132 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-10T00:53:44.237797  /lava-7538187/1/../bin/lava-test-case
    2022-10-10T00:53:44.254077  <8>[   39.621860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63436d24ee55c8c7c3cab664
        failing since 132 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-10T00:53:42.143798  <8>[   37.510632] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-10T00:53:43.191591  /lava-7538187/1/../bin/lava-test-case
    2022-10-10T00:53:43.204146  <8>[   38.572318] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63436d24ee55c8c7c3cab665
        failing since 132 days (last pass: v5.18-5613-ge079cf8f6817, first =
fail: v5.18-11575-gceccc06b624ed)

    2022-10-10T00:53:42.127422  /lava-7538187/1/../bin/lava-test-case   =

 =20
