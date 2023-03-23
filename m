Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB03A6C5F80
	for <lists+linux-next@lfdr.de>; Thu, 23 Mar 2023 07:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCWGNZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Mar 2023 02:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjCWGNY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2023 02:13:24 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C715B45D
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 23:13:19 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id kq3so8993427plb.13
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679551998;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/RjEY5OhosstwZslezS1UW1ATqs+3G2k8arpdxY72jg=;
        b=LaPdDuSgBPZ4PG2p2t+ozMs03XoSUSiGh3eL8ClbwIrSHJOF33gmC4VPsbfHBnlzla
         801MDc/DAbQnYEQtWs0tDRBkpRJl3Ag5skjupnhAEUHLP0lLEGDNTXyNXAFMZJJMTF2z
         6WoxeMf7F0YXf/uWDaOfA5f1O4HnPARgwjr+lY+7/v4rRssZkIkaLGNL92SDcFuTDsKl
         17nbVVOqoUMbgItW4RzVZtgrRAwxlc8eXwM0wyePyBP5ZtsZn2K8d/Os4W7I50S6xg/y
         z+YaNSVQcnB3rem89T5oP6D/gfZycd/5FJd5POsLPJN2WxXWTTns/XHhuBYKxmwTszF0
         XBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679551998;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RjEY5OhosstwZslezS1UW1ATqs+3G2k8arpdxY72jg=;
        b=PNRcKPK/vcmBea/kTf6TKb07PUhXxnY9BomKovu+KuoT/W4Emp3ReCihhQid4+brcO
         DJstnJbCqazwNbX6P7yTuBUVbXMp64MS7zvo9LOgaWdAUOazS5cUr8WljQmlGjl2kHiW
         3cK01yC8Yfg3mKqH6VRptU+MkWQxMAtpsOV64pCkaw80hug/ZZZXR6nzG27hnAO/miJU
         0MG9+cwf5lN90BmcQAvEElfVVpsTbjx6zxrLRxzaCdfPZrClVsistycqmbWN1+fLOxdE
         AAKr749x9S6fOvjeioTz5a3+33/T7onNZgfDCnz+qfUlzWMptKGUzABKld+2EQfVTDEw
         FJiw==
X-Gm-Message-State: AO0yUKXeBnL3qTwt1GGw/9JKf1oxSWgAwvQNFU66fak7b2E7rKZFZX5/
        sDYJs3q/gnQvkR5CS2O0Lceaq7faSBgt+B+uFiErcA==
X-Google-Smtp-Source: AK7set/f3ut5eJYv2N1dCzXFPggCed+F0HBKendMS1fLM3khpgauH5MfdAOpzTUa8XmzfVdGhTmkpQ==
X-Received: by 2002:a17:902:c9d2:b0:1a1:aea7:6d4e with SMTP id q18-20020a170902c9d200b001a1aea76d4emr4205190pld.34.1679551997254;
        Wed, 22 Mar 2023 23:13:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id jj11-20020a170903048b00b0019f1222b9f6sm11558616plb.154.2023.03.22.23.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:13:16 -0700 (PDT)
Message-ID: <641bedfc.170a0220.ccb55.5495@mx.google.com>
Date:   Wed, 22 Mar 2023 23:13:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc3-288-g2dc3fa9ff5523
Subject: next/pending-fixes baseline: 646 runs,
 66 regressions (v6.3-rc3-288-g2dc3fa9ff5523)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 646 runs, 66 regressions (v6.3-rc3-288-g2dc3fa=
9ff5523)

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

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc3-288-g2dc3fa9ff5523/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc3-288-g2dc3fa9ff5523
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2dc3fa9ff5523097a49b343941235a76ab04e6fb =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/641be4136524ff26ce9c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641be4136524ff26ce9c9=
506
        failing since 164 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641be5f35f884139d59c950b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseli=
ne-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641be5f35f884139d59c9=
50c
        failing since 162 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb450ed4b3859d29c9528

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641bb450ed4b385=
9d29c952b
        failing since 8 days (last pass: v6.3-rc2-254-g7f35d1f08bb0, first =
fail: v6.3-rc2-307-g900e881df1ea3)
        3 lines

    2023-03-23T02:06:59.095188  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-23T02:06:59.101956  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-23T02:06:59.108352  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-23T02:06:59.115204  <8>[   14.508875] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb6fd1fb58f5c4d9c9507

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb6fd1fb58f5c4d9c953e
        failing since 8 days (last pass: v6.3-rc1-336-gbec2983895c5, first =
fail: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-23T02:18:13.095614  + set +x
    2023-03-23T02:18:13.100278  <8>[   18.233944] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 212880_1.5.2.4.1>
    2023-03-23T02:18:13.233929  / # #
    2023-03-23T02:18:13.336395  export SHELL=3D/bin/sh
    2023-03-23T02:18:13.337028  #
    2023-03-23T02:18:13.438596  / # export SHELL=3D/bin/sh. /lava-212880/en=
vironment
    2023-03-23T02:18:13.439147  =

    2023-03-23T02:18:13.541265  / # . /lava-212880/environment/lava-212880/=
bin/lava-test-runner /lava-212880/1
    2023-03-23T02:18:13.542192  =

    2023-03-23T02:18:13.549157  / # /lava-212880/bin/lava-test-runner /lava=
-212880/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb94fe476d99f2e9c950f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb94fe476d99f2e9c9518
        failing since 70 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-23T02:28:15.902349  / # #

    2023-03-23T02:28:16.005266  export SHELL=3D/bin/sh

    2023-03-23T02:28:16.006083  #

    2023-03-23T02:28:16.108143  / # export SHELL=3D/bin/sh. /lava-9743336/e=
nvironment

    2023-03-23T02:28:16.109142  =


    2023-03-23T02:28:16.211334  / # . /lava-9743336/environment/lava-974333=
6/bin/lava-test-runner /lava-9743336/1

    2023-03-23T02:28:16.212911  =


    2023-03-23T02:28:16.222441  / # /lava-9743336/bin/lava-test-runner /lav=
a-9743336/1

    2023-03-23T02:28:16.337284  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-23T02:28:16.337798  + cd /lava-9743336/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb63a631f9dfece9c9505

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb63a631f9dfece9c950e
        failing since 64 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-23T02:14:57.931814  <8>[   16.838663] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3436667_1.5.2.4.1>
    2023-03-23T02:14:58.042999  / # #
    2023-03-23T02:14:58.145988  export SHELL=3D/bin/sh
    2023-03-23T02:14:58.147124  #
    2023-03-23T02:14:58.251397  / # export SHELL=3D/bin/sh. /lava-3436667/e=
nvironment
    2023-03-23T02:14:58.251744  =

    2023-03-23T02:14:58.353012  / # . /lava-3436667/environment/lava-343666=
7/bin/lava-test-runner /lava-3436667/1
    2023-03-23T02:14:58.353745  =

    2023-03-23T02:14:58.359057  / # /lava-3436667/bin/lava-test-runner /lav=
a-3436667/1
    2023-03-23T02:14:58.452415  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb739ee9295e2359c9543

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb739ee9295e2359c954c
        failing since 64 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-23T02:18:57.255367  <8>[   14.892828] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3436705_1.5.2.4.1>
    2023-03-23T02:18:57.364070  / # #
    2023-03-23T02:18:57.465491  export SHELL=3D/bin/sh
    2023-03-23T02:18:57.465838  #
    2023-03-23T02:18:57.566958  / # export SHELL=3D/bin/sh. /lava-3436705/e=
nvironment
    2023-03-23T02:18:57.567336  =

    2023-03-23T02:18:57.668744  / # . /lava-3436705/environment/lava-343670=
5/bin/lava-test-runner /lava-3436705/1
    2023-03-23T02:18:57.670487  =

    2023-03-23T02:18:57.675208  / # /lava-3436705/bin/lava-test-runner /lav=
a-3436705/1
    2023-03-23T02:18:57.768541  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb7d382229094af9c954d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb7d382229094af9c9556
        failing since 64 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-23T02:21:32.581147  <8>[   14.453361] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3436773_1.5.2.4.1>
    2023-03-23T02:21:32.694323  / # #
    2023-03-23T02:21:32.798133  export SHELL=3D/bin/sh
    2023-03-23T02:21:32.799398  #
    2023-03-23T02:21:32.901851  / # export SHELL=3D/bin/sh. /lava-3436773/e=
nvironment
    2023-03-23T02:21:32.902951  =

    2023-03-23T02:21:32.903608  / # . /lava-3436773/environment<3>[   14.76=
6481] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-03-23T02:21:33.006924  /lava-3436773/bin/lava-test-runner /lava-34=
36773/1
    2023-03-23T02:21:33.009194  =

    2023-03-23T02:21:33.013689  / # /lava-3436773/bin/lava-test-runner /lav=
a-3436773/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb87caca6e99cfe9c954c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb87caca6e99cfe9c9555
        failing since 64 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-23T02:24:33.562525  + set +x<8>[   24.614701] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3436806_1.5.2.4.1>
    2023-03-23T02:24:33.562726  =

    2023-03-23T02:24:33.670026  / # #
    2023-03-23T02:24:33.771457  export SHELL=3D/bin/sh
    2023-03-23T02:24:33.771830  #
    2023-03-23T02:24:33.873267  / # export SHELL=3D/bin/sh. /lava-3436806/e=
nvironment
    2023-03-23T02:24:33.873846  =

    2023-03-23T02:24:33.975189  / # . /lava-3436806/environment/lava-343680=
6/bin/lava-test-runner /lava-3436806/1
    2023-03-23T02:24:33.975732  =

    2023-03-23T02:24:33.980583  / # /lava-3436806/bin/lava-test-runner /lav=
a-3436806/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/641bb5ec2613a0d8969c9513

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/641bb5ec2613a0d=
8969c9516
        failing since 20 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-23T02:13:47.454973  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-23T02:13:47.455720  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b88200 pointer offset 4 size 512
    2023-03-23T02:13:47.461980  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-23T02:13:47.463305  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-23T02:13:47.463937  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-03-23T02:13:47.464513  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-23T02:13:47.545357  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-23T02:13:47.545897  kern  :emerg : Process udevd (pid: 63, stac=
k limit =3D 0x01097ea2)
    2023-03-23T02:13:47.546137  kern  :emerg : Stack: (0xc88d9cf8 to 0xc88d=
a000)
    2023-03-23T02:13:47.546323  kern  :emerg : 9ce0:                       =
                                c4b88200 c076f860 =

    ... (7 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641bb5ec2613a0d=
8969c9517
        failing since 423 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-23T02:13:47.228004  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-03-23T02:13:47.363184  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-23T02:13:47.363766  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-23T02:13:47.364113  kern  :alert : 8<--- cut here ---
    2023-03-23T02:13:47.364717  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-23T02:13:47.365082  kern  :alert : [00000060] *pgd=3Dc49be831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-23T02:13:47.365432  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-23T02:13:47.407073  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88d8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-23T02:13:47.407859  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-23T02:13:47.410067  kern  :alert : Register r3 information: non=
-paged memory =

    ... (4 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb92466beed70169c9522

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseli=
ne-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb92466beed70169c9=
523
        failing since 188 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/641bba91fd1d049bcb9c9513

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bba91fd1d049bcb9c951c
        failing since 77 days (last pass: v6.1-rc4-339-g185da88d03ed, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-23T02:33:21.655952  + set +x
    2023-03-23T02:33:21.657095  <8>[   57.453260] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1182610_1.5.2.4.1>
    2023-03-23T02:33:21.765859  =

    2023-03-23T02:33:22.924922  / # #export SHELL=3D/bin/sh
    2023-03-23T02:33:22.930604  =

    2023-03-23T02:33:24.478034  / # export SHELL=3D/bin/sh. /lava-1182610/e=
nvironment
    2023-03-23T02:33:24.483754  =

    2023-03-23T02:33:27.305497  / # . /lava-1182610/environment/lava-118261=
0/bin/lava-test-runner /lava-1182610/1
    2023-03-23T02:33:27.311521  =

    2023-03-23T02:33:27.312214  / # /lava-1182610/bin/lava-test-runner /lav=
a-1182610/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbae33eddf7553e9c954a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bbae33eddf7553e9c9553
        failing since 77 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-23T02:34:53.898798  + set +x
    2023-03-23T02:34:53.899933  <8>[   67.085336] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1182607_1.5.2.4.1>
    2023-03-23T02:34:54.008731  / # #
    2023-03-23T02:34:55.168560  export SHELL=3D/bin/sh
    2023-03-23T02:34:55.174125  #
    2023-03-23T02:34:55.174424  / # export SHELL=3D/bin/sh
    2023-03-23T02:34:56.721829  / # . /lava-1182607/environment
    2023-03-23T02:34:59.548329  /lava-1182607/bin/lava-test-runner /lava-11=
82607/1
    2023-03-23T02:34:59.553952  . /lava-1182607/environment
    2023-03-23T02:34:59.554098  / # /lava-1182607/bin/lava-test-runner /lav=
a-1182607/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8f272fc0133329c955b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8f272fc0133329c9=
55c
        failing since 327 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bba11b8d9fbb5db9c9620

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bba11b8d9fbb5db9c9=
621
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb875aca6e99cfe9c950c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb875aca6e99cfe9c9=
50d
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8b31d1460b2219c951d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8b31d1460b2219c9=
51e
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8c73721a20c899c9521

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8c73721a20c899c9=
522
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8d5af8ae9f1d09c9579

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8d5af8ae9f1d09c9=
57a
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb85d6c96c718d49c9568

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb85d6c96c718d49c9=
569
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb874aca6e99cfe9c9509

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb874aca6e99cfe9c9=
50a
        failing since 31 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb882aca6e99cfe9c956b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb882aca6e99cfe9c9=
56c
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8958d41f060b99c9508

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8958d41f060b99c9=
509
        failing since 43 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb880aca6e99cfe9c9562

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb880aca6e99cfe9c9=
563
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb984e9848254ec9c950f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb984e9848254ec9c9=
510
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb91c625b6ae7899c95bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb91c625b6ae7899c9=
5bd
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb884aca6e99cfe9c956e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb884aca6e99cfe9c9=
56f
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8c33721a20c899c9514

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8c33721a20c899c9=
515
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb873870112754d9c9610

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb873870112754d9c9=
611
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9e7fc52d20bb69c9516

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9e7fc52d20bb69c9=
517
        failing since 57 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/641bb65a65ae04b7989c958f

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/641=
bb65a65ae04b7989c95e3
        failing since 28 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-23T02:15:33.285128  /lava-9743246/1/../bin/lava-test-case

    2023-03-23T02:15:33.295072  <8>[   23.438890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/641bb65b65ae04b7989c9635
        failing since 24 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-23T02:15:30.434335  /lava-9743246/1/../bin/lava-test-case

    2023-03-23T02:15:30.444448  <8>[   20.587580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/641bb65b65ae04b7989c9636
        failing since 24 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-23T02:15:29.401967  /lava-9743246/1/../bin/lava-test-case

    2023-03-23T02:15:29.412394  <8>[   19.556097] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-infracfg-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9da46465e220f9c9515

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9da46465e220f9c9=
516
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/641bb677805345e51d9c950a

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/641bb677805345e51d9c95c0
        failing since 24 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-23T02:16:04.104778  /lava-9743215/1/../bin/lava-test-case

    2023-03-23T02:16:04.111073  <8>[   20.973122] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/641bb677805345e51d9c95c1
        failing since 24 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-23T02:16:03.084931  /lava-9743215/1/../bin/lava-test-case

    2023-03-23T02:16:03.091354  <8>[   19.953677] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/641bb677805345e51d9c95c2
        failing since 24 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-23T02:16:02.065680  /lava-9743215/1/../bin/lava-test-case

    2023-03-23T02:16:02.072218  <8>[   18.934119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-topckgen-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9c7921f9fcbd49c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9c7921f9fcbd49c9=
506
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb57a72c97215a69c956c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb57a72c97215a69c9=
56d
        failing since 162 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbdb6de8f084f949c955f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bbdb6de8f084f949c9=
560
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bc163602d1cc9bf9c9524

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bc163602d1cc9bf9c9=
525
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8f772fc0133329c9582

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8f772fc0133329c9=
583
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bba7a1ce1e402099c9520

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bba7a1ce1e402099c9=
521
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8eada5fe59ab59c9531

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8eada5fe59ab59c9=
532
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb90ce0333a39a49c951e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb90ce0333a39a49c9=
51f
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbaa41622503dbe9c9553

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bbaa41622503dbe9c9=
554
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8f672fc0133329c957f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8f672fc0133329c9=
580
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb91f5b38fb6b4a9c954b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb91f5b38fb6b4a9c9=
54c
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbaa20b44f7e6f59c9540

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bbaa20b44f7e6f59c9=
541
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8ff1227e422cd9c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8ff1227e422cd9c9=
506
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb92166beed70169c951f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb92166beed70169c9=
520
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbacb0b44f7e6f59c9579

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bbacb0b44f7e6f59c9=
57a
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb93266beed70169c9572

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline=
-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb93266beed70169c9=
573
        failing since 162 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb52a8db4047dcc9c9541

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mi=
ps-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/641bb52a8db4047=
dcc9c9545
        failing since 1 day (last pass: v6.3-rc3-188-g9f7814c09ae60, first =
fail: v6.3-rc3-224-ga0d6a906c6a2)
        1 lines

    2023-03-23T02:10:44.007357  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address e7f61d78, epc =3D=3D 801ff8c8, ra =3D=
=3D 8020228c
    2023-03-23T02:10:44.007513  =


    2023-03-23T02:10:44.040501  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-03-23T02:10:44.040679  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641bbb085063fe7a1f9c9512

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bbb085063fe7a1f9c9=
513
        failing since 97 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb89bd88b5cfbcd9c9531

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb89bd88b5cfbcd9c9=
532
        failing since 97 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9de83d3cb2acf9c950e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9de83d3cb2acf9c9=
50f
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb882aca6e99cfe9c9568

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb882aca6e99cfe9c9=
569
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb85c6c96c718d49c955a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb85c6c96c718d49c9=
55b
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9c72c2cd6d0c79c9511

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9c72c2cd6d0c79c9=
512
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb9e746465e220f9c951a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb9e746465e220f9c9=
51b
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8f172fc0133329c953f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8f172fc0133329c9=
540
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8deda5fe59ab59c950b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8deda5fe59ab59c9=
50c
        failing since 43 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb4bc57f85822559c9505

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641bb4bc57f85822559c950e
        failing since 20 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-03-23T02:08:46.703109  <8>[    9.664326] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3436658_1.5.2.4.1>
    2023-03-23T02:08:46.822437  / # #
    2023-03-23T02:08:46.927982  export SHELL=3D/bin/sh
    2023-03-23T02:08:46.929559  #
    2023-03-23T02:08:47.032816  / # export SHELL=3D/bin/sh. /lava-3436658/e=
nvironment
    2023-03-23T02:08:47.034392  =

    2023-03-23T02:08:47.137721  / # . /lava-3436658/environment/lava-343665=
8/bin/lava-test-runner /lava-3436658/1
    2023-03-23T02:08:47.140341  =

    2023-03-23T02:08:47.147985  / # /lava-3436658/bin/lava-test-runner /lav=
a-3436658/1
    2023-03-23T02:08:47.269812  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641bb8c43721a20c899c9517

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-28=
8-g2dc3fa9ff5523/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641bb8c43721a20c899c9=
518
        failing since 97 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
