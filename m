Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414DD6BA586
	for <lists+linux-next@lfdr.de>; Wed, 15 Mar 2023 04:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjCODK6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 23:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjCODKy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 23:10:54 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A9E2CFC7
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 20:10:46 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id k18-20020a17090a591200b0023d36e30cb5so465355pji.1
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678849846;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FpOCnAK9S8eVLxbwVjl4PDm98SbTn1FkZjfuNi9pCJc=;
        b=MR23G3wr8AyA47EtAbq538S2PFetA4wU7wqZPVGVIe55XIxmnc2UP/LEm8T62jj1/h
         U3g6FdnHGtIX5edU4DJO6eG1oH4bevnNVIdqSrsxC35vRIbsZLKh10B0+LCFm87csBSF
         q2VCXmYztbEjvUBY6Fs5H27sd5TWKFqXYc833OtjU6R1XTupM2tfjJV5Iwhs57t+g0BO
         SSidfVB/egklIoXXyLScMj6ZRs8FKblM4JXZnxnJ+2vVRUgGCX/126QFVlaEhCj0zWPp
         fFgGpsfLrhv5YtC3aiR8IHhsBzR6Kd7DE1y5BRibcJbNx6yEZYrmb3lkBcHTVuc0YXmJ
         Xm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678849846;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpOCnAK9S8eVLxbwVjl4PDm98SbTn1FkZjfuNi9pCJc=;
        b=iapXj/cLp2YNM6qquCyxIQtUL28kv1BGUjZ/rxSGwb+nOEEm4taYbA5rf1lQGtjrlR
         1fdFzln0Rk/5WL6dRRDFBr+/oou5wo0AEiYAV4UjsAwKaHs1WDfMGHx3tpIPbSPCINe3
         +3yZ9Ua/ipcc2Bqr7Qmpo3VSU5jScfSmJJon1Xg3frddCwDVabAYHb/TlAEcHefihcxy
         3B2ha6o2YEtjxnhIeROv70chagY7/vMLeKv4s9+hDK2F2uwpCalnX/wmVuKFtCkoCfBY
         Q80f5j7ft6dXVQWlxPY/0IGcHIEH1VnQrPecohRM4UyZ8wywr+spXnUiuP8VrGW5jiD8
         q5KQ==
X-Gm-Message-State: AO0yUKU8A002ge/vAM2lrY5+nIWYutDrFONW2aHfCJHKTG4M6tdC9rwk
        2ieOjQZwXHEPSHBQElW8VXlQn/J3SC2Q0MtDqCvcSiBW
X-Google-Smtp-Source: AK7set+szHg4SO96I8DLI7P2xqix39AWQzDbYgPprafvXLsJUQ6p8kLFJ/aRaYRaI6nV1sSTUyhGAQ==
X-Received: by 2002:a17:902:d4c4:b0:1a0:a421:d43f with SMTP id o4-20020a170902d4c400b001a0a421d43fmr1421862plg.27.1678849844295;
        Tue, 14 Mar 2023 20:10:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id kx13-20020a170902f94d00b001992e74d055sm2459636plb.12.2023.03.14.20.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:10:43 -0700 (PDT)
Message-ID: <64113733.170a0220.e14aa.65a8@mx.google.com>
Date:   Tue, 14 Mar 2023 20:10:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc2-307-g900e881df1ea3
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 694 runs,
 89 regressions (v6.3-rc2-307-g900e881df1ea3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 694 runs, 89 regressions (v6.3-rc2-307-g900e88=
1df1ea3)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 2          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 2          =

imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 4          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 4          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

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

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

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
v6.3-rc2-307-g900e881df1ea3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc2-307-g900e881df1ea3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      900e881df1ea34591ee3af6f90e7d7b53647f571 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fed13bff3783d48c8630

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
410fed13bff3783d48c8643
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:09:47.371953  /usr/bin/tpm2_getcap

    2023-03-14T23:09:57.594637  /lava-9618474/1/../bin/lava-test-case

    2023-03-14T23:09:57.602324  <8>[   20.256916] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dtpm-chip-is-online RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ffb3f6df5026488c868d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lk=
ft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410ffb3f6df5026488c8=
68e
        failing since 155 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6411014f52d8c2e8af8c863a

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/la=
b-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6411014f52d8c2e=
8af8c863d
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)
        3 lines

    2023-03-14T23:20:36.779771  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-14T23:20:36.786548  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-14T23:20:36.792887  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-14T23:20:36.799565  <8>[  101.662677] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6411008505caff590b8c86c0

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-=
rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6411008605caff590b8c86f7
        failing since 0 day (last pass: v6.3-rc1-336-gbec2983895c5, first f=
ail: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:17:01.331429  + set +x
    2023-03-14T23:17:01.335089  <8>[   17.971597] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 163627_1.5.2.4.1>
    2023-03-14T23:17:01.469847  / # #
    2023-03-14T23:17:01.572074  export SHELL=3D/bin/sh
    2023-03-14T23:17:01.572637  #
    2023-03-14T23:17:01.674082  / # export SHELL=3D/bin/sh. /lava-163627/en=
vironment
    2023-03-14T23:17:01.674551  =

    2023-03-14T23:17:01.776230  / # . /lava-163627/environment/lava-163627/=
bin/lava-test-runner /lava-163627/1
    2023-03-14T23:17:01.777136  =

    2023-03-14T23:17:01.783431  / # /lava-163627/bin/lava-test-runner /lava=
-163627/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/641100d4e392bc59a18c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm283=
6-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641100d4e392bc59a18c8649
        failing since 62 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-14T23:18:26.211218  / # #

    2023-03-14T23:18:26.314140  export SHELL=3D/bin/sh

    2023-03-14T23:18:26.315134  #

    2023-03-14T23:18:26.417340  / # export SHELL=3D/bin/sh. /lava-9618647/e=
nvironment

    2023-03-14T23:18:26.418254  =


    2023-03-14T23:18:26.520552  / # . /lava-9618647/environment/lava-961864=
7/bin/lava-test-runner /lava-9618647/1

    2023-03-14T23:18:26.521947  =


    2023-03-14T23:18:26.528899  / # /lava-9618647/bin/lava-test-runner /lav=
a-9618647/1

    2023-03-14T23:18:26.645845  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-14T23:18:26.646378  + cd /lava-9618647/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641101757a0b3b9e108c86a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641101757a0b3b9e108c8=
6a7
        failing since 16 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff384d4b38a1a88c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff384d4b38a1a88c8643
        failing since 56 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T23:11:25.498696  <8>[   16.659037] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410991_1.5.2.4.1>
    2023-03-14T23:11:25.612003  / # #
    2023-03-14T23:11:25.714095  export SHELL=3D/bin/sh
    2023-03-14T23:11:25.715102  #
    2023-03-14T23:11:25.817437  / # export SHELL=3D/bin/sh. /lava-3410991/e=
nvironment
    2023-03-14T23:11:25.818440  =

    2023-03-14T23:11:25.920674  / # . /lava-3410991/environment/lava-341099=
1/bin/lava-test-runner /lava-3410991/1
    2023-03-14T23:11:25.921945  =

    2023-03-14T23:11:25.926569  / # /lava-3410991/bin/lava-test-runner /lav=
a-3410991/1
    2023-03-14T23:11:26.019098  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/641100f57ea730928d8c8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641100f57ea730928d8c8671
        failing since 56 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T23:18:56.697003  + set +x<8>[   24.311631] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3411070_1.5.2.4.1>
    2023-03-14T23:18:56.697809  =

    2023-03-14T23:18:56.809511  / # #
    2023-03-14T23:18:56.912884  export SHELL=3D/bin/sh
    2023-03-14T23:18:56.913768  #
    2023-03-14T23:18:57.016059  / # export SHELL=3D/bin/sh. /lava-3411070/e=
nvironment
    2023-03-14T23:18:57.017058  =

    2023-03-14T23:18:57.119163  / # . /lava-3411070/environment/lava-341107=
0/bin/lava-test-runner /lava-3411070/1
    2023-03-14T23:18:57.120466  =

    2023-03-14T23:18:57.125618  / # /lava-3411070/bin/lava-test-runner /lav=
a-3411070/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6411016d7a0b3b9e108c8654

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6411016d7a0b3b9e108c865d
        failing since 56 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T23:21:01.212312  <8>[   14.684337] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3411111_1.5.2.4.1>
    2023-03-14T23:21:01.319310  / # #
    2023-03-14T23:21:01.420987  export SHELL=3D/bin/sh
    2023-03-14T23:21:01.421401  #
    2023-03-14T23:21:01.522628  / # export SHELL=3D/bin/sh. /lava-3411111/e=
nvironment
    2023-03-14T23:21:01.523059  =

    2023-03-14T23:21:01.624414  / # . /lava-3411111/environment/lava-341111=
1/bin/lava-test-runner /lava-3411111/1
    2023-03-14T23:21:01.625072  =

    2023-03-14T23:21:01.630065  / # /lava-3411111/bin/lava-test-runner /lav=
a-3411111/1
    2023-03-14T23:21:01.720590  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/641101f47260e3a57d8c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641101f47260e3a57d8c8643
        failing since 56 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T23:23:16.001898  <8>[   14.827452] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3411128_1.5.2.4.1>
    2023-03-14T23:23:16.108893  / # #
    2023-03-14T23:23:16.210477  export SHELL=3D/bin/sh
    2023-03-14T23:23:16.210880  #
    2023-03-14T23:23:16.211272  / # <3>[   14.997629] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-03-14T23:23:16.312447  export SHELL=3D/bin/sh. /lava-3411128/envir=
onment
    2023-03-14T23:23:16.312888  =

    2023-03-14T23:23:16.414168  / # . /lava-3411128/environment/lava-341112=
8/bin/lava-test-runner /lava-3411128/1
    2023-03-14T23:23:16.414816  =

    2023-03-14T23:23:16.419783  / # /lava-3411128/bin/lava-test-runner /lav=
a-3411128/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/641102900e8077193a8c86ae

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubiet=
ruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641102900e8077193a8c86b7
        failing since 56 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T23:25:40.716053  <8>[   15.229784] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3411138_1.5.2.4.1>
    2023-03-14T23:25:40.824920  / # #
    2023-03-14T23:25:40.927489  export SHELL=3D/bin/sh
    2023-03-14T23:25:40.928509  #<3>[   15.317240] Bluetooth: hci0: command=
 0xfc18 tx timeout
    2023-03-14T23:25:40.929098  =

    2023-03-14T23:25:41.031318  / # export SHELL=3D/bin/sh. /lava-3411138/e=
nvironment
    2023-03-14T23:25:41.032391  =

    2023-03-14T23:25:41.134295  / # . /lava-3411138/environment/lava-341113=
8/bin/lava-test-runner /lava-3411138/1
    2023-03-14T23:25:41.135118  =

    2023-03-14T23:25:41.139957  / # /lava-3411138/bin/lava-test-runner /lav=
a-3411138/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6410fc04e10dc70fd48c866e

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6410fc04e10dc70=
fd48c8671
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-14T22:57:55.061999  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-14T22:57:55.099133  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-14T22:57:55.099819  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d52200 pointer offset 4 size 512
    2023-03-14T22:57:55.100263  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-14T22:57:55.100673  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-14T22:57:55.101056  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-03-14T22:57:55.102315  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-14T22:57:55.193923  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-14T22:57:55.194777  kern  :emerg : Process udevd (pid: 72, stac=
k limit =3D 0xbecbdc32)
    2023-03-14T22:57:55.195476  kern  :emerg : Stack: (0xc8989cf8 to 0xc898=
a000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6410fc04e10dc70=
fd48c8672
        failing since 415 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-14T22:57:55.008484  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-14T22:57:55.009441  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-14T22:57:55.010231  kern  :alert : 8<--- cut here ---
    2023-03-14T22:57:55.010917  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-14T22:57:55.011532  kern  :alert : [00000060] *pgd=3Dc4a8a831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-14T22:57:55.012085  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-14T22:57:55.051898  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8988000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-14T22:57:55.052790  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-14T22:57:55.053414  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-14T22:57:55.054055  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10   | imx_v6=
_v7_defconfig          | 2          =


  Details:     https://kernelci.org/test/plan/id/6410fcd9d117f0a9dd8c8649

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl=
-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6410fcd9d=
117f0a9dd8c8656
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:01:34.426597  /lava-163472/1/../bin/lava-test-case
    2023-03-14T23:01:34.451517  <8>[   18.782133] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
10fcd9d117f0a9dd8c8657
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:01:33.374564  /lava-163472/1/../bin/lava-test-case
    2023-03-14T23:01:33.404080  <8>[   17.734076] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+crypto    | 2          =


  Details:     https://kernelci.org/test/plan/id/6411007105caff590b8c8630

  Results:     29 PASS, 4 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-=
imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-broonie/baseline-=
imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/641100710=
5caff590b8c863d
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:16:55.678791  /lava-163597/1/../bin/lava-test-case
    2023-03-14T23:16:55.705756  <8>[   37.857458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
11007105caff590b8c863e
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:16:54.632058  /lava-163597/1/../bin/lava-test-case
    2023-03-14T23:16:54.658257  <8>[   36.809308] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sx-sdb                   | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/641100519afb3b7b6e8c8685

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6=
sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641100519afb3b7b6e8c868c
        failing since 69 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T23:16:18.508198  <8>[   43.184531] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1173258_1.5.2.4.1>
    2023-03-14T23:16:18.613745  / # #
    2023-03-14T23:16:19.773835  export SHELL=3D/bin/sh
    2023-03-14T23:16:19.779535  #
    2023-03-14T23:16:21.327489  / # export SHELL=3D/bin/sh. /lava-1173258/e=
nvironment
    2023-03-14T23:16:21.333189  =

    2023-03-14T23:16:24.155826  / # . /lava-1173258/environment/lava-117325=
8/bin/lava-test-runner /lava-1173258/1
    2023-03-14T23:16:24.161891  =

    2023-03-14T23:16:24.169768  / # /lava-1173258/bin/lava-test-runner /lav=
a-1173258/1
    2023-03-14T23:16:24.262554  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6411004d145890dbb18c86a8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6411004d145890dbb18c86af
        failing since 69 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T23:16:06.682931  + set<8>[   38.452142] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1173259_1.5.2.4.1>
    2023-03-14T23:16:06.683196   +x
    2023-03-14T23:16:06.788751  / # #
    2023-03-14T23:16:07.949068  export SHELL=3D/bin/sh
    2023-03-14T23:16:07.954774  #
    2023-03-14T23:16:09.502740  / # export SHELL=3D/bin/sh. /lava-1173259/e=
nvironment
    2023-03-14T23:16:09.508475  =

    2023-03-14T23:16:12.330033  / # . /lava-1173259/environment/lava-117325=
9/bin/lava-test-runner /lava-1173259/1
    2023-03-14T23:16:12.335783  =

    2023-03-14T23:16:12.341424  / # /lava-1173259/bin/lava-test-runner /lav=
a-1173259/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64110097d3c85cca248c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7=
ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64110097d3c85cca248c8643
        failing since 69 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T23:16:51.302960  + set +x
    2023-03-14T23:16:51.304061  <8>[   66.879282] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1173257_1.5.2.4.1>
    2023-03-14T23:16:51.413143  / # #
    2023-03-14T23:16:52.572265  export SHELL=3D/bin/sh
    2023-03-14T23:16:52.577871  #
    2023-03-14T23:16:52.578076  / # export SHELL=3D/bin/sh
    2023-03-14T23:16:54.124441  / # . /lava-1173257/environment
    2023-03-14T23:16:56.952299  /lava-1173257/bin/lava-test-runner /lava-11=
73257/1
    2023-03-14T23:16:56.958378  . /lava-1173257/environment
    2023-03-14T23:16:56.958671  / # /lava-1173257/bin/lava-test-runner /lav=
a-1173257/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff4f8ab9ec29748c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410ff4f8ab9ec29748c8=
631
        failing since 319 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411010c7ebedf7abe8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh710=
0-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411010c7ebedf7abe8c8=
63f
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 4          =


  Details:     https://kernelci.org/test/plan/id/6410ff334ec4de72688c8663

  Results:     91 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6410ff334ec4de72688c866e
        failing since 20 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-14T23:11:29.769304  <6>[   22.809207] fsl_enetc 0000:00:00.0: e=
nabling device (0400 -> 0402)
    2023-03-14T23:11:29.888380  <6>[   22.925255] fsl_enetc 0000:00:00.1: e=
nabling device (0400 -> 0402)
    2023-03-14T23:11:30.005259  <6>[   23.041314] fsl_enetc 0000:00:00.2: e=
nabling device (0400 -> 0402)
    2023-03-14T23:11:30.693008  /lava-295652/1/../bin/lava-test-case
    2023-03-14T23:11:30.727870  <8>[   23.750823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-14T23:11:30.728301  /lava-295652/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
10ff334ec4de72688c8670
        failing since 20 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-14T23:11:31.790569  /lava-295652/1/../bin/lava-test-case
    2023-03-14T23:11:31.790948  <8>[   24.788936] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-14T23:11:31.791212  /lava-295652/1/../bin/lava-test-case
    2023-03-14T23:11:31.791448  <8>[   24.807291] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6410ff334ec4de72688c8675
        failing since 20 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-14T23:11:32.864998  /lava-295652/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6410ff334ec4de72688c8676
        failing since 20 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-14T23:11:32.868254  <8>[   25.902879] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-14T23:11:33.923993  /lava-295652/1/../bin/lava-test-case
    2023-03-14T23:11:33.924396  <8>[   26.924203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-14T23:11:33.924641  /lava-295652/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/64110203aea389645a8c8664

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64110204aea389645a8c866b
        failing since 19 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-14T23:23:31.422811  <8>[   42.233321] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 295675_1.5.2.4.1>
    2023-03-14T23:23:31.528056  / # #
    2023-03-14T23:23:31.629953  export SHELL=3D/bin/sh
    2023-03-14T23:23:31.630435  #
    2023-03-14T23:23:31.731864  / # export SHELL=3D/bin/sh. /lava-295675/en=
vironment
    2023-03-14T23:23:31.732360  =

    2023-03-14T23:23:31.833747  / # . /lava-295675/environment/lava-295675/=
bin/lava-test-runner /lava-295675/1
    2023-03-14T23:23:31.834485  =

    2023-03-14T23:23:31.840412  / # /lava-295675/bin/lava-test-runner /lava=
-295675/1
    2023-03-14T23:23:31.906056  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64110204aea389645a8c866f
        failing since 19 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-14T23:23:34.002200  /lava-295675/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
110204aea389645a8c8671
        failing since 19 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-14T23:23:35.057591  /lava-295675/1/../bin/lava-test-case
    2023-03-14T23:23:35.057982  <8>[   45.836439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64110204aea389645a8c8676
        failing since 19 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-14T23:23:36.131423  /lava-295675/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64110204aea389645a8c8677
        failing since 19 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-14T23:23:36.134677  <8>[   46.944611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-14T23:23:37.188185  /lava-295675/1/../bin/lava-test-case
    2023-03-14T23:23:37.188562  <8>[   47.964700] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-14T23:23:37.188800  /lava-295675/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411036b05567044068c86b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kont=
ron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411036b05567044068c8=
6b9
        failing since 20 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-3304-g34939120e353) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 4          =


  Details:     https://kernelci.org/test/plan/id/64110434def0f264e68c8644

  Results:     91 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64110434def0f264e68c864f
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:32:52.890033  <6>[   22.945078] fsl_enetc 0000:00:00.0: e=
nabling device (0400 -> 0402)
    2023-03-14T23:32:53.006916  <6>[   23.061123] fsl_enetc 0000:00:00.1: e=
nabling device (0400 -> 0402)
    2023-03-14T23:32:53.119032  <6>[   23.177119] fsl_enetc 0000:00:00.2: e=
nabling device (0400 -> 0402)
    2023-03-14T23:32:53.832534  /lava-295697/1/../bin/lava-test-case
    2023-03-14T23:32:53.832983  <8>[   23.872143] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-14T23:32:53.833224  /lava-295697/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
110434def0f264e68c8651
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:32:54.891941  /lava-295697/1/../bin/lava-test-case
    2023-03-14T23:32:54.892315  <8>[   24.910487] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-14T23:32:54.892573  /lava-295697/1/../bin/lava-test-case
    2023-03-14T23:32:54.892799  <8>[   24.927494] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-14T23:32:54.893022  /lava-295697/1/../bin/lava-test-case
    2023-03-14T23:32:54.893237  <8>[   24.946744] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-03-14T23:32:54.893453  /lava-295697/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64110434def0f264e68c8656
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:32:55.970737  /lava-295697/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64110434def0f264e68c8657
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:32:55.973928  <8>[   26.026557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-14T23:32:57.031250  /lava-295697/1/../bin/lava-test-case
    2023-03-14T23:32:57.031618  <8>[   27.047740] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-14T23:32:57.031853  /lava-295697/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6411004a6f7054f57d8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-=
kontron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-=
kontron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411004a6f7054f57d8c8=
638
        new failure (last pass: v6.3-rc2-254-g7f35d1f08bb0) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fd46ff26711bbb8c86d8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-se=
i510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-se=
i510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fd46ff26711bbb8c86e1
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:03:23.207726  <8>[   17.941377] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410968_1.5.2.4.1>
    2023-03-14T23:03:23.311081  / # #
    2023-03-14T23:03:23.412891  export SHELL=3D/bin/sh
    2023-03-14T23:03:23.413328  #
    2023-03-14T23:03:23.515199  / # export SHELL=3D/bin/sh. /lava-3410968/e=
nvironment
    2023-03-14T23:03:23.515639  =

    2023-03-14T23:03:23.515902  / # <3>[   18.186292] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:03:23.617283  . /lava-3410968/environment/lava-3410968/bi=
n/lava-test-runner /lava-3410968/1
    2023-03-14T23:03:23.617999  =

    2023-03-14T23:03:23.622149  / # /lava-3410968/bin/lava-test-runner /lav=
a-3410968/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fefdabc9e48f768c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fefdabc9e48f768c8639
        failing since 18 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:10:47.378439  <8>[   17.858172] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3411027_1.5.2.4.1>
    2023-03-14T23:10:47.482494  / # #
    2023-03-14T23:10:47.584851  export SHELL=3D/bin/sh
    2023-03-14T23:10:47.585592  #
    2023-03-14T23:10:47.686996  / # export SHELL=3D/bin/sh. /lava-3411027/e=
nvironment
    2023-03-14T23:10:47.687783  =

    2023-03-14T23:10:47.688235  / # <3>[   18.098304] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:10:47.790196  . /lava-3411027/environment/lava-3411027/bi=
n/lava-test-runner /lava-3411027/1
    2023-03-14T23:10:47.790923  =

    2023-03-14T23:10:47.805116  / # /lava-3411027/bin/lava-test-runner /lav=
a-3411027/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6411021f8b713c1b118c868d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6411021f8b713c1b118c8696
        failing since 16 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:23:49.357222  / # #
    2023-03-14T23:23:49.458955  export SHELL=3D/bin/sh
    2023-03-14T23:23:49.459363  #
    2023-03-14T23:23:49.560759  / # export SHELL=3D/bin/sh. /lava-3411167/e=
nvironment
    2023-03-14T23:23:49.561571  =

    2023-03-14T23:23:49.562031  / # <3>[  102.514437] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:23:49.663823  . /lava-3411167/environment/lava-3411167/bi=
n/lava-test-runner /lava-3411167/1
    2023-03-14T23:23:49.664534  =

    2023-03-14T23:23:49.668023  / # /lava-3411167/bin/lava-test-runner /lav=
a-3411167/1
    2023-03-14T23:23:49.732888  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/641102f94edd222b878c8685

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641102f94edd222b878c868e
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:27:44.516056  / # #
    2023-03-14T23:27:44.617988  export SHELL=3D/bin/sh
    2023-03-14T23:27:44.618823  #
    2023-03-14T23:27:44.720754  / # export SHELL=3D/bin/sh. /lava-3411209/e=
nvironment
    2023-03-14T23:27:44.721207  =

    2023-03-14T23:27:44.721482  / # <3>[   18.040241] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:27:44.822789  . /lava-3411209/environment/lava-3411209/bi=
n/lava-test-runner /lava-3411209/1
    2023-03-14T23:27:44.824433  =

    2023-03-14T23:27:44.840151  / # /lava-3411209/bin/lava-test-runner /lav=
a-3411209/1
    2023-03-14T23:27:44.895027  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/641103d5bfa45a72038c865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641103d5bfa45a72038c8666
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:31:09.909879  / # #
    2023-03-14T23:31:10.011344  export SHELL=3D/bin/sh
    2023-03-14T23:31:10.011682  #
    2023-03-14T23:31:10.112815  / # export SHELL=3D/bin/sh. /lava-3411255/e=
nvironment
    2023-03-14T23:31:10.113160  =

    2023-03-14T23:31:10.113325  / # <3>[   18.109984] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:31:10.214453  . /lava-3411255/environment/lava-3411255/bi=
n/lava-test-runner /lava-3411255/1
    2023-03-14T23:31:10.215027  =

    2023-03-14T23:31:10.223041  / # /lava-3411255/bin/lava-test-runner /lav=
a-3411255/1
    2023-03-14T23:31:10.267103  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641103f5cf748aae1f8c86d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641103f5cf748aae1f8c8=
6d6
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641103f1294329ddd08c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641103f1294329ddd08c8=
634
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64110445def0f264e68c86ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-me=
son-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64110445def0f264e68c8=
6ae
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411037133e8aa28d58c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411037133e8aa28d58c8=
630
        failing since 23 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fd695db766803c8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-na=
nopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-na=
nopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fd695db766803c8c8646
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:03:40.379968  <8>[   18.396136] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410947_1.5.2.4.1>
    2023-03-14T23:03:40.486201  / # #
    2023-03-14T23:03:40.588317  export SHELL=3D/bin/sh
    2023-03-14T23:03:40.588991  #
    2023-03-14T23:03:40.690485  / # export SHELL=3D/bin/sh. /lava-3410947/e=
nvironment
    2023-03-14T23:03:40.691065  =

    2023-03-14T23:03:40.792448  / # . /lava-3410947/environment/lava-341094=
7/bin/lava-test-runner /lava-3410947/1
    2023-03-14T23:03:40.793329  =

    2023-03-14T23:03:40.812127  / # /lava-3410947/bin/lava-test-runner /lav=
a-3410947/1
    2023-03-14T23:03:40.869008  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff23c42945899a8c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff23c42945899a8c8653
        failing since 18 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:11:12.419492  + set +x<8>[   18.282401] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3411023_1.5.2.4.1>
    2023-03-14T23:11:12.419767  =

    2023-03-14T23:11:12.525082  / # #
    2023-03-14T23:11:12.626956  export SHELL=3D/bin/sh
    2023-03-14T23:11:12.627441  #
    2023-03-14T23:11:12.728746  / # export SHELL=3D/bin/sh. /lava-3411023/e=
nvironment
    2023-03-14T23:11:12.729210  =

    2023-03-14T23:11:12.830587  / # . /lava-3411023/environment/lava-341102=
3/bin/lava-test-runner /lava-3411023/1
    2023-03-14T23:11:12.831253  =

    2023-03-14T23:11:12.850291  / # /lava-3411023/bin/lava-test-runner /lav=
a-3411023/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff9380bc16330e8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff9380bc16330e8c8646
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:12:58.789720  / # #
    2023-03-14T23:12:58.891404  export SHELL=3D/bin/sh
    2023-03-14T23:12:58.891757  #
    2023-03-14T23:12:58.993075  / # export SHELL=3D/bin/sh. /lava-3411032/e=
nvironment
    2023-03-14T23:12:58.993429  =

    2023-03-14T23:12:59.094758  / # . /lava-3411032/environment<3>[   19.17=
7217] mmc0: error -84 whilst initialising SD ca/lava-3411032/bin/lava-test-=
runner /lava-3411032/1
    2023-03-14T23:12:59.095368  rd
    2023-03-14T23:12:59.095594  =

    2023-03-14T23:12:59.101146  / # /lava-3411032/bin/lava-test-runner /lav=
a-3411032/1
    2023-03-14T23:12:59.133108  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/641102007260e3a57d8c86ed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641102007260e3a57d8c86f6
        failing since 16 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:23:18.076863  <8>[   34.149085] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3411172_1.5.2.4.1>
    2023-03-14T23:23:18.184427  / # #
    2023-03-14T23:23:18.286823  export SHELL=3D/bin/sh
    2023-03-14T23:23:18.287480  #
    2023-03-14T23:23:18.389075  / # export SHELL=3D/bin/sh. /lava-3411172/e=
nvironment
    2023-03-14T23:23:18.389720  =

    2023-03-14T23:23:18.491342  / # . /lava-3411172/environment/lava-341117=
2/bin/lava-test-runner /lava-3411172/1
    2023-03-14T23:23:18.492392  =

    2023-03-14T23:23:18.508910  / # /lava-3411172/bin/lava-test-runner /lav=
a-3411172/1
    2023-03-14T23:23:18.567738  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411037105567044068c86cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411037105567044068c8=
6cc
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/641103d7fc4cfb2f708c864b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641103d7fc4cfb2f708c8654
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:31:24.267610  / # #
    2023-03-14T23:31:24.369875  export SHELL=3D/bin/sh
    2023-03-14T23:31:24.370526  #
    2023-03-14T23:31:24.472062  / # export SHELL=3D/bin/sh. /lava-3411211/e=
nvironment
    2023-03-14T23:31:24.472625  =

    2023-03-14T23:31:24.574201  / # . /lava-3411211/environment/lava-341121=
1/bin/lava-test-runner /lava-3411211/1
    2023-03-14T23:31:24.575131  =

    2023-03-14T23:31:24.593153  / # /lava-3411211/bin/lava-test-runner /lav=
a-3411211/1
    2023-03-14T23:31:24.651029  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:31:24.651712  + cd /lava-3411211/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/641104390b64cc21dd8c8644

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641104390b64cc21dd8c864d
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:33:01.689207  / # #
    2023-03-14T23:33:01.790873  export SHELL=3D/bin/sh
    2023-03-14T23:33:01.791224  #
    2023-03-14T23:33:01.892562  / # export SHELL=3D/bin/sh. /lava-3411256/e=
nvironment
    2023-03-14T23:33:01.893051  =

    2023-03-14T23:33:01.994398  / # . /lava-3411256/environment/lava-341125=
6/bin/lava-test-runner /lava-3411256/1
    2023-03-14T23:33:01.995039  =

    2023-03-14T23:33:02.000118  / # /lava-3411256/bin/lava-test-runner /lav=
a-3411256/1
    2023-03-14T23:33:02.032123  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:33:02.071972  + cd /lava-3411256/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fd76d64130a3af8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s80=
5x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s80=
5x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fd76d64130a3af8c8638
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:03:59.228173  / # #
    2023-03-14T23:03:59.330036  export SHELL=3D/bin/sh
    2023-03-14T23:03:59.330532  #
    2023-03-14T23:03:59.431872  / # export SHELL=3D/bin/sh. /lava-3410957/e=
nvironment
    2023-03-14T23:03:59.432337  =

    2023-03-14T23:03:59.533723  / # . /lava-3410957/environment/lava-341095=
7/bin/lava-test-runner /lava-3410957/1
    2023-03-14T23:03:59.534483  =

    2023-03-14T23:03:59.539337  / # /lava-3410957/bin/lava-test-runner /lav=
a-3410957/1
    2023-03-14T23:03:59.617249  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:03:59.617561  + cd /lava-3410957/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff354ec4de72688c86da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff354ec4de72688c86e3
        failing since 18 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:11:26.428547  / # #
    2023-03-14T23:11:26.530585  export SHELL=3D/bin/sh
    2023-03-14T23:11:26.531052  #
    2023-03-14T23:11:26.632557  / # export SHELL=3D/bin/sh. /lava-3411004/e=
nvironment
    2023-03-14T23:11:26.633020  =

    2023-03-14T23:11:26.734586  / # . /lava-3411004/environment/lava-341100=
4/bin/lava-test-runner /lava-3411004/1
    2023-03-14T23:11:26.735356  =

    2023-03-14T23:11:26.753377  / # /lava-3411004/bin/lava-test-runner /lav=
a-3411004/1
    2023-03-14T23:11:26.818263  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:11:26.818824  + cd /lava-3411004/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff9580bc16330e8c8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff9580bc16330e8c8660
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:13:13.599465  / # #
    2023-03-14T23:13:13.701200  export SHELL=3D/bin/sh
    2023-03-14T23:13:13.701551  #
    2023-03-14T23:13:13.802874  / # export SHELL=3D/bin/sh. /lava-3411033/e=
nvironment
    2023-03-14T23:13:13.803229  =

    2023-03-14T23:13:13.904574  / # . /lava-3411033/environment/lava-341103=
3/bin/lava-test-runner /lava-3411033/1
    2023-03-14T23:13:13.905171  =

    2023-03-14T23:13:13.910870  / # /lava-3411033/bin/lava-test-runner /lav=
a-3411033/1
    2023-03-14T23:13:13.987794  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:13:13.988271  + cd /lava-3411033/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64110236a817d0f4738c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64110236a817d0f4738c8640
        failing since 16 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:24:24.789044  / # #
    2023-03-14T23:24:24.890732  export SHELL=3D/bin/sh
    2023-03-14T23:24:24.891211  #
    2023-03-14T23:24:24.992543  / # export SHELL=3D/bin/sh. /lava-3411157/e=
nvironment
    2023-03-14T23:24:24.993058  =

    2023-03-14T23:24:25.094475  / # . /lava-3411157/environment/lava-341115=
7/bin/lava-test-runner /lava-3411157/1
    2023-03-14T23:24:25.095250  =

    2023-03-14T23:24:25.100400  / # /lava-3411157/bin/lava-test-runner /lav=
a-3411157/1
    2023-03-14T23:24:25.177250  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:24:25.177785  + cd /lava-3411157/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64110417cf748aae1f8c8765

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64110417cf748aae1f8c876e
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:32:14.486429  / # #
    2023-03-14T23:32:14.588513  export SHELL=3D/bin/sh
    2023-03-14T23:32:14.588990  #
    2023-03-14T23:32:14.690477  / # export SHELL=3D/bin/sh. /lava-3411229/e=
nvironment
    2023-03-14T23:32:14.690947  =

    2023-03-14T23:32:14.792473  / # . /lava-3411229/environment/lava-341122=
9/bin/lava-test-runner /lava-3411229/1
    2023-03-14T23:32:14.793313  =

    2023-03-14T23:32:14.811153  / # /lava-3411229/bin/lava-test-runner /lav=
a-3411229/1
    2023-03-14T23:32:14.876081  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:32:14.876676  + cd /lava-3411229/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/641104898cb4627a4f8c86d1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641104898cb4627a4f8c86da
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:34:05.788039  / # #
    2023-03-14T23:34:05.890039  export SHELL=3D/bin/sh
    2023-03-14T23:34:05.890435  #
    2023-03-14T23:34:05.991847  / # export SHELL=3D/bin/sh. /lava-3411268/e=
nvironment
    2023-03-14T23:34:05.992245  =

    2023-03-14T23:34:06.093728  / # . /lava-3411268/environment/lava-341126=
8/bin/lava-test-runner /lava-3411268/1
    2023-03-14T23:34:06.094498  =

    2023-03-14T23:34:06.098740  / # /lava-3411268/bin/lava-test-runner /lav=
a-3411268/1
    2023-03-14T23:34:06.179628  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T23:34:06.179932  + cd /lava-3411268/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411040c8f1dbd55668c867b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411040c8f1dbd55668c8=
67c
        failing since 35 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64110387853896768d8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64110387853896768d8c8=
64a
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411039cd9dc0cde558c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411039cd9dc0cde558c8=
66c
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641104d9ce22a4905c8c869c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641104d9ce22a4905c8c8=
69d
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411039ed9dc0cde558c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411039ed9dc0cde558c8=
66f
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/641109a64766b619048c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-mes=
on-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641109a64766b619048c8=
64f
        failing since 43 days (last pass: v6.2-rc5-286-g436294605dc5, first=
 fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6411008005caff590b8c8676

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6411008005caff590b8c867f
        failing since 0 day (last pass: v6.3-rc1-336-gbec2983895c5, first f=
ail: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-14T23:17:00.185022  / # #
    2023-03-14T23:17:00.286502  export SHELL=3D/bin/sh
    2023-03-14T23:17:00.287102  #
    2023-03-14T23:17:00.388271  / # export SHELL=3D/bin/sh. /lava-3411042/e=
nvironment
    2023-03-14T23:17:00.388634  <3>[   18.853062] mmc2: tuning execution fa=
iled: -5
    2023-03-14T23:17:00.388857  <3>[   18.853108] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-03-14T23:17:00.388983  =

    2023-03-14T23:17:00.490107  / # . /lava-3411042/environment/lava-341104=
2/bin/lava-test-runner /lava-3411042/1
    2023-03-14T23:17:00.490602  =

    2023-03-14T23:17:00.504205  / # /lava-3411042/bin/lava-test-runner /lav=
a-3411042/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fd49ada731b0838c8669

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei=
610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei=
610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fd49ada731b0838c8672
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:03:25.280485  / # #
    2023-03-14T23:03:25.382341  export SHELL=3D/bin/sh
    2023-03-14T23:03:25.382730  #
    2023-03-14T23:03:25.484134  / # export SHELL=3D/bin/sh. /lava-3410973/e=
nvironment
    2023-03-14T23:03:25.484888  =

    2023-03-14T23:03:25.485312  / # <3>[   18.142066] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:03:25.586936  . /lava-3410973/environment/lava-3410973/bi=
n/lava-test-runner /lava-3410973/1
    2023-03-14T23:03:25.587856  =

    2023-03-14T23:03:25.598796  / # /lava-3410973/bin/lava-test-runner /lav=
a-3410973/1
    2023-03-14T23:03:25.657871  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff117bed7e3d9a8c8665

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410ff117bed7e3d9a8c866e
        failing since 18 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:10:50.705667  / # #
    2023-03-14T23:10:50.807534  export SHELL=3D/bin/sh
    2023-03-14T23:10:50.808005  #
    2023-03-14T23:10:50.909378  / # export SHELL=3D/bin/sh. /lava-3411016/e=
nvironment
    2023-03-14T23:10:50.910115  =

    2023-03-14T23:10:50.910537  / # <3>[   18.083888] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:10:51.012470  . /lava-3411016/environment/lava-3411016/bi=
n/lava-test-runner /lava-3411016/1
    2023-03-14T23:10:51.013212  =

    2023-03-14T23:10:51.019036  / # /lava-3411016/bin/lava-test-runner /lav=
a-3411016/1
    2023-03-14T23:10:51.084171  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64110209730214020e8c8643

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64110209730214020e8c864c
        failing since 16 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:23:47.022790  / # #
    2023-03-14T23:23:47.124697  export SHELL=3D/bin/sh
    2023-03-14T23:23:47.125467  #
    2023-03-14T23:23:47.227274  / # export SHELL=3D/bin/sh. /lava-3411166/e=
nvironment
    2023-03-14T23:23:47.227689  =

    2023-03-14T23:23:47.227934  / # <3>[  103.348369] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:23:47.329348  . /lava-3411166/environment/lava-3411166/bi=
n/lava-test-runner /lava-3411166/1
    2023-03-14T23:23:47.330137  =

    2023-03-14T23:23:47.346301  / # /lava-3411166/bin/lava-test-runner /lav=
a-3411166/1
    2023-03-14T23:23:47.401283  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/641102fb4edd222b878c8690

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641102fb4edd222b878c8699
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T23:27:45.960326  / # #
    2023-03-14T23:27:46.061759  export SHELL=3D/bin/sh
    2023-03-14T23:27:46.062125  #
    2023-03-14T23:27:46.163311  / # export SHELL=3D/bin/sh. /lava-3411227/e=
nvironment
    2023-03-14T23:27:46.163668  =

    2023-03-14T23:27:46.163842  / # <3>[   18.066220] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:27:46.265009  . /lava-3411227/environment/lava-3411227/bi=
n/lava-test-runner /lava-3411227/1
    2023-03-14T23:27:46.265521  =

    2023-03-14T23:27:46.277129  / # /lava-3411227/bin/lava-test-runner /lav=
a-3411227/1
    2023-03-14T23:27:46.334372  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/641103d7bfa45a72038c867e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641103d7bfa45a72038c8687
        failing since 16 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T23:31:11.431025  / # #
    2023-03-14T23:31:11.532494  export SHELL=3D/bin/sh
    2023-03-14T23:31:11.532914  #
    2023-03-14T23:31:11.634055  / # export SHELL=3D/bin/sh. /lava-3411259/e=
nvironment
    2023-03-14T23:31:11.634424  =

    2023-03-14T23:31:11.634670  / # <3>[   18.176465] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T23:31:11.735848  . /lava-3411259/environment/lava-3411259/bi=
n/lava-test-runner /lava-3411259/1
    2023-03-14T23:31:11.736471  =

    2023-03-14T23:31:11.752077  / # /lava-3411259/bin/lava-test-runner /lav=
a-3411259/1
    2023-03-14T23:31:11.806940  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fda1880fca47808c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fda1880fca47808c8=
636
        failing since 49 days (last pass: v6.2-rc5-157-g1f16e03afb18, first=
 fail: v6.2-rc5-174-gc5f142de047d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fd9ef85462a6028c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fd9ef85462a6028c8=
646
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fda4880fca47808c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fda4880fca47808c8=
63c
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff25c42945899a8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-=
cloudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410ff25c42945899a8c8=
658
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fec3ec502c009f8c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-lina=
ro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fec3ec502c009f8c8=
653
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64110bdbf76ddfa8b98c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-=
qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64110bdbf76ddfa8b98c8=
659
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fdbbd26e3596a48c86b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg=
20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fdbbd26e3596a48c8=
6b7
        failing since 6 days (last pass: v6.3-rc1-156-g1bb628591feb, first =
fail: v6.3-rc1-217-g03913bd4e939) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410ff3016dcf2209a8c8843

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410ff3016dcf2209a8c8=
844
        failing since 89 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fe40ef076110728c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fe40ef076110728c8=
662
        failing since 89 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fda4880fca47808c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fda4880fca47808c8=
63f
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64110364f676bf48808c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk339=
9-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64110364f676bf48808c8=
635
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411030c1b57f151808c8682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk=
3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411030c1b57f151808c8=
683
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fda3880fca47808c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fda3880fca47808c8=
639
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fdb5880fca47808c86d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-coll=
abora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410fdb5880fca47808c8=
6d9
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411050caf3c3c80bb8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411050caf3c3c80bb8c8=
64a
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6411040bcf748aae1f8c875c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun5=
0i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6411040bcf748aae1f8c8=
75d
        failing since 35 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6410fb6b6d20e3fa5e8c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-=
plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6410fb6b6d20e3fa5e8c864e
        failing since 11 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-03-14T22:55:24.200275  <8>[    9.876738] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410894_1.5.2.4.1>
    2023-03-14T22:55:24.322103  / # #
    2023-03-14T22:55:24.428265  export SHELL=3D/bin/sh
    2023-03-14T22:55:24.429855  #
    2023-03-14T22:55:24.533116  / # export SHELL=3D/bin/sh. /lava-3410894/e=
nvironment
    2023-03-14T22:55:24.534791  =

    2023-03-14T22:55:24.638617  / # . /lava-3410894/environment/lava-341089=
4/bin/lava-test-runner /lava-3410894/1
    2023-03-14T22:55:24.641698  =

    2023-03-14T22:55:24.644993  / # /lava-3410894/bin/lava-test-runner /lav=
a-3410894/1
    2023-03-14T22:55:24.757081  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641100c14c8056c73e8c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-30=
7-g900e881df1ea3/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641100c14c8056c73e8c8=
670
        failing since 89 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
