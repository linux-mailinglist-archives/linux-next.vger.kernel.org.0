Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABDC67196D
	for <lists+linux-next@lfdr.de>; Wed, 18 Jan 2023 11:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbjARKol (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Jan 2023 05:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjARKmu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Jan 2023 05:42:50 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4204346F
        for <linux-next@vger.kernel.org>; Wed, 18 Jan 2023 01:46:27 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cx21-20020a17090afd9500b00228f2ecc6dbso1722112pjb.0
        for <linux-next@vger.kernel.org>; Wed, 18 Jan 2023 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VzGB2tOriW8UMsulZLqX3nCHNonkLLOKokmMP6NFQaY=;
        b=KPjkBIgSSNrfD370EYU13kInD3Yd3O5RGZfbMCUJv+svs+7vXBCsf2UGNYeZqXsJ6f
         W8ok0acAhZnR59o0b604rG4SGrihR5YgdsVyCTRpV4S7ATexdBPAO/XYJBrJYBlivSaR
         F+ubZdVN6t7VEbucQSkdlkf01ZBLRaK1+/A2kOXYkqCJ3vgLMUekidWyAk8DZH4QezCA
         OCwhl9jP6xZrn4Ri/GTzq3CjZEYTbB3649/Z4neE/3t/slBc8QH5teRq5t4aTrIpaPbI
         e7zavdj7o2BvosZPtElHzDxBm+z50kFsiY8l7c3/TmBlA1MRk2wp9ZM/2Lxdxw6xvleN
         DxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzGB2tOriW8UMsulZLqX3nCHNonkLLOKokmMP6NFQaY=;
        b=ajtjgpyuPq1MMeaE2vqErRwH/PDCACPs2HjUDXjVNGI5KnsEeTjGDHOeXSeSkpPVF6
         PR1V5wQdotbH4Q1FAyWgQ9ioPI6PXZ+PHJWwuSF8J122dCIf88nl7mY+CkapxaYqEbHf
         kM/vepiT51186LnakX3DZIJ3aj9Cr4lCG60oNv0ZcGaUv6Q/Xm/oBQNlPaIN/4vkmI7P
         OTYLEBHSsmn1NZXfR0LffxDewSmGx1dyqVA9nRvGduWS/rlxdgzlYuFWQK6lJRHOn7rp
         er3SW+B8QgQ/fj+iD0ArN5I+YILZVrW16NOclUSQ7BwGDOeBEwN2MbOLhtSg+gmlybm8
         fUQA==
X-Gm-Message-State: AFqh2kqPh91vcWxjSjLOjeAhDCbWQEfYzBdMLyqPNPCPD0rkRGBvizvg
        tcZWAE2edPRZIPgzYjKyCsTw115JnP6VfJ76QIF5sw==
X-Google-Smtp-Source: AMrXdXvEh2UTUMy7C8+FTwzXrEG6AedcPqb9TPgG2LT5APDWc1hmEdD7esQWPjApPuQVjNhSwfK4Eg==
X-Received: by 2002:a05:6a21:594:b0:a3:a1ee:47ca with SMTP id lw20-20020a056a21059400b000a3a1ee47camr5940874pzb.46.1674035185782;
        Wed, 18 Jan 2023 01:46:25 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p189-20020a625bc6000000b00580cc63dce8sm19498319pfb.77.2023.01.18.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 01:46:25 -0800 (PST)
Message-ID: <63c7bff1.620a0220.3ee52.fc72@mx.google.com>
Date:   Wed, 18 Jan 2023 01:46:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230118
X-Kernelci-Report-Type: test
Subject: next/master baseline: 856 runs, 65 regressions (next-20230118)
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

next/master baseline: 856 runs, 65 regressions (next-20230118)

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

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 2          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
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

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230118/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230118
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f3381a7baf5ccbd091eb2c4fd2afd84266fcef24 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78cadcfc423be10915ee9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78cadcfc423be10915=
eea
        failing since 123 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78dc7a0ea0cef1d915ede

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78dc7a0ea0cef1d915=
edf
        failing since 125 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78f048350e7223c915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78f048350e7223c915=
ed3
        failing since 161 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c789a1816b9bee6e915ed3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c789a1816b9bee6e915=
ed4
        failing since 148 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78f99224a63d669915f27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78f99224a63d669915=
f28
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63c7888b6cee648f6e915ec7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63c7888b6cee648=
f6e915ecf
        new failure (last pass: next-20230116)
        12 lines

    2023-01-18T05:49:31.784617  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[  117.505531] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2023-01-18T05:49:31.784822  0020
    2023-01-18T05:49:31.784969  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63c7888b6cee648=
f6e915ed0
        new failure (last pass: next-20230116)
        2 lines

    2023-01-18T05:49:31.785784  kern  :alert :   ESR =3D 0x0000000096000006
    2023-01-18T05:49:31.785975  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-18T05:49:31.786148  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-18T05:49:31.786315  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78cfa534c6b52a6915f0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78cfa534c6b52a6915=
f0c
        failing since 12 days (last pass: next-20221125, first fail: next-2=
0230106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c791a42eef0f5026915ebd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c791a42eef0f5026915=
ebe
        failing since 13 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78b4d0e8199fb31915ebe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78b4d0e8199fb31915=
ebf
        failing since 13 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c79027e4bc618ec2915ebb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c79027e4bc618ec2915=
ebc
        failing since 13 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c79340962bc93088915ee4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c79340962bc93088915=
ee5
        failing since 13 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c796c704936b5bd391600b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c796c704936b5bd3916=
00c
        failing since 13 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c79d3c3abfbd2482915f18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c79d3c3abfbd2482915=
f19
        failing since 147 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c799cb4215486c3c915ec0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c799cb4215486c3c915=
ec1
        failing since 281 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c792bc0f52de8646915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c792bc0f52de8646915=
eba
        failing since 78 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63c78d1ce55e290e68915efc

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63c78d1ce55e290=
e68915f03
        new failure (last pass: next-20230116)
        12 lines

    2023-01-18T06:04:18.925961  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[  132.785242] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2023-01-18T06:04:18.926329  0020
    2023-01-18T06:04:18.926581  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63c78d1ce55e290=
e68915f04
        new failure (last pass: next-20230116)
        2 lines

    2023-01-18T06:04:18.927915  kern  :alert :   ESR =3D 0x0000000096000006
    2023-01-18T06:04:18.928164  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-01-18T06:04:18.928397  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-01-18T06:04:18.928624  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2023-01-18T06:04:18.969141  kern  :alert :   FSC =3D 0x06: level 2 <8>[=
  132.818050] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>
    2023-01-18T06:04:18.969512  translation fault
    2023-01-18T06:04:18.969776  kern  :alert :<8>[  132.829183] <LAVA_SIGNA=
L_ENDRUN 0_dmesg 249493_1.5.2.4.1>
    2023-01-18T06:04:18.970055   Data abort info:
    2023-01-18T06:04:18.970305  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2023-01-18T06:04:18.970554  kern  :alert :   CM =3D 0, WnR =3D 0 =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63c791b838110872ae915f0a

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c791b838110872ae915f0d
        new failure (last pass: next-20230116)

    2023-01-18T06:28:52.841321  / # #
    2023-01-18T06:28:52.943898  export SHELL=3D/bin/sh
    2023-01-18T06:28:52.944643  #
    2023-01-18T06:28:53.046123  / # export SHELL=3D/bin/sh. /lava-249511/en=
vironment
    2023-01-18T06:28:53.046661  =

    2023-01-18T06:28:53.148018  / # . /lava-249511/environment/lava-249511/=
bin/lava-test-runner /lava-249511/1
    2023-01-18T06:28:53.148937  =

    2023-01-18T06:28:53.168019  / # /lava-249511/bin/lava-test-runner /lava=
-249511/1
    2023-01-18T06:28:53.218563  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-18T06:28:53.221966  + cd /l<8>[   15.278628] <LAVA_SIGNAL_START=
RUN 1_bootrr 249511_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63c=
791b838110872ae915f1d
        new failure (last pass: next-20230116)

    2023-01-18T06:28:57.260445  /lava-249511/1/../bin/lava-test-case
    2023-01-18T06:28:57.260845  <8>[   19.485676] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-01-18T06:28:57.261089  /lava-249511/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c796a55526f58aa1915f09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c796a55526f58aa1915=
f0a
        failing since 69 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78b520e8199fb31915ec1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78b520e8199fb31915ec6
        new failure (last pass: next-20230109)

    2023-01-18T06:01:30.570105  / # #
    2023-01-18T06:01:30.672196  export SHELL=3D/bin/sh
    2023-01-18T06:01:30.672715  #
    2023-01-18T06:01:30.774109  / # export SHELL=3D/bin/sh<3>[   18.363291]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (. /lava-3155317/environment
    2023-01-18T06:01:30.774611  1000000): clkctl 0x50
    2023-01-18T06:01:30.774895  =

    2023-01-18T06:01:30.876789  / # . /lava-3155317/environment/lava-315531=
7/bin/lava-test-runner /lava-3155317/1
    2023-01-18T06:01:30.877614  =

    2023-01-18T06:01:30.881973  / # /lava-3155317/bin/lava-test-runner /lav=
a-3155317/1
    2023-01-18T06:01:30.961935  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78c56ea9eae0405915ece

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78c56ea9eae0405915ed3
        new failure (last pass: next-20230109)

    2023-01-18T06:06:08.744883  / # #
    2023-01-18T06:06:08.846724  export SHELL=3D/bin/sh
    2023-01-18T06:06:08.847307  #
    2023-01-18T06:06:08.948712  / # export SHELL=3D/bin/sh. /lava-3155425/e=
nvironment
    2023-01-18T06:06:08.949158  =

    2023-01-18T06:06:08.949357  <3>[   18.285280] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:06:09.050565  / # . /lava-3155425/environment/lava-315542=
5/bin/lava-test-runner /lava-3155425/1
    2023-01-18T06:06:09.051246  =

    2023-01-18T06:06:09.064365  / # /lava-3155425/bin/lava-test-runner /lav=
a-3155425/1
    2023-01-18T06:06:09.128339  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c787f54ba3965309915f1d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c787f54ba3965309915f22
        new failure (last pass: next-20230109)

    2023-01-18T05:47:19.295238  <8>[   88.503607] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155077_1.5.2.4.1>
    2023-01-18T05:47:19.399427  / # #
    2023-01-18T05:47:19.501377  export SHELL=3D/bin/sh
    2023-01-18T05:47:19.502183  #
    2023-01-18T05:47:19.604179  / # export SHELL=3D/bin/sh<3>[   88.736537]=
 brcmfmac: brcmf_sdio_htclk: . /lava-3155077/environment
    2023-01-18T05:47:19.604597  HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:47:19.605042  =

    2023-01-18T05:47:19.706941  / # . /lava-3155077/environment/lava-315507=
7/bin/lava-test-runner /lava-3155077/1
    2023-01-18T05:47:19.707622  =

    2023-01-18T05:47:19.726643  / # /lava-3155077/bin/lava-test-runner /lav=
a-3155077/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c789fe919d4478c7915ef5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c789fe919d4478c7915efa
        new failure (last pass: next-20230109)

    2023-01-18T05:56:03.553163  / # #
    2023-01-18T05:56:03.654562  export SHELL=3D/bin/sh
    2023-01-18T05:56:03.654909  #
    2023-01-18T05:56:03.756078  / # export SHELL=3D/bin/sh<3>[   18.103546.=
 /lava-3155216/environment
    2023-01-18T05:56:03.756421  ] brcmfmac: brcmf_sdio_htclk: HT Avail time=
out (1000000): clkctl 0x50
    2023-01-18T05:56:03.756569  =

    2023-01-18T05:56:03.857718  / # . /lava-3155216/environment/lava-315521=
6/bin/lava-test-runner /lava-3155216/1
    2023-01-18T05:56:03.858435  =

    2023-01-18T05:56:03.871177  / # /lava-3155216/bin/lava-test-runner /lav=
a-3155216/1
    2023-01-18T05:56:03.935036  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78bb67e3b530c7c915f08

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78bb67e3b530c7c915f0d
        new failure (last pass: next-20230109)

    2023-01-18T06:03:10.115414  <8>[   18.115670] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155327_1.5.2.4.1>
    2023-01-18T06:03:10.218689  / # #
    2023-01-18T06:03:10.320533  export SHELL=3D/bin/sh
    2023-01-18T06:03:10.321159  #
    2023-01-18T06:03:10.422532  / # export SHELL=3D/bin/sh. /lava-3155327/e=
nvironment
    2023-01-18T06:03:10.422990  <3>[   18.338203] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:03:10.423259  =

    2023-01-18T06:03:10.524701  / # . /lava-3155327/environment/lava-315532=
7/bin/lava-test-runner /lava-3155327/1
    2023-01-18T06:03:10.525471  =

    2023-01-18T06:03:10.540920  / # /lava-3155327/bin/lava-test-runner /lav=
a-3155327/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78c0644f50feb67915eef

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78c0644f50feb67915ef4
        new failure (last pass: next-20230109)

    2023-01-18T06:04:42.880256  / # #
    2023-01-18T06:04:42.981990  export SHELL=3D/bin/sh
    2023-01-18T06:04:42.982373  #
    2023-01-18T06:04:43.083763  / # export SHELL=3D/bin/sh. /lava-3155372/e=
nvironment
    2023-01-18T06:04:43.084495  <3>[   18.146912] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:04:43.084945  =

    2023-01-18T06:04:43.186722  / # . /lava-3155372/environment/lava-315537=
2/bin/lava-test-runner /lava-3155372/1
    2023-01-18T06:04:43.188051  =

    2023-01-18T06:04:43.203483  / # /lava-3155372/bin/lava-test-runner /lav=
a-3155372/1
    2023-01-18T06:04:43.268402  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78ca6cfc423be10915ec8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78ca6cfc423be10915ecd
        new failure (last pass: next-20230109)

    2023-01-18T06:07:24.911976  / # #
    2023-01-18T06:07:25.014598  export SHELL=3D/bin/sh
    2023-01-18T06:07:25.015016  #
    2023-01-18T06:07:25.116389  / # export SHELL=3D/bin/sh<3>[   18.154130]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50. /lava=
-3155471/environment
    2023-01-18T06:07:25.116769  =

    2023-01-18T06:07:25.117007  =

    2023-01-18T06:07:25.218349  / # . /lava-3155471/environment/lava-315547=
1/bin/lava-test-runner /lava-3155471/1
    2023-01-18T06:07:25.219018  =

    2023-01-18T06:07:25.259270  / # /lava-3155471/bin/lava-test-runner /lav=
a-3155471/1
    2023-01-18T06:07:25.305017  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78e0e8f198da794915ec6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78e0e8f198da794915ecb
        new failure (last pass: next-20230109)

    2023-01-18T06:13:28.047506  <8>[   17.906908] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155586_1.5.2.4.1>
    2023-01-18T06:13:28.151319  / # #
    2023-01-18T06:13:28.253424  export SHELL=3D/bin/sh
    2023-01-18T06:13:28.254141  #
    2023-01-18T06:13:28.355981  / # export SHELL=3D/bin/sh. /lava-3155586/e=
nvironment
    2023-01-18T06:13:28.356353  <3>[   18.127055] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:13:28.356851  =

    2023-01-18T06:13:28.458638  / # . /lava-3155586/environment/lava-315558=
6/bin/lava-test-runner /lava-3155586/1
    2023-01-18T06:13:28.459541  =

    2023-01-18T06:13:28.472023  / # /lava-3155586/bin/lava-test-runner /lav=
a-3155586/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78b635ac8c089d0915f06

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78b635ac8c089d0915f0b
        new failure (last pass: next-20221129)

    2023-01-18T06:01:40.345381  / # #
    2023-01-18T06:01:40.447148  export SHELL=3D/bin/sh
    2023-01-18T06:01:40.447569  #
    2023-01-18T06:01:40.548902  / # export SHELL=3D/bin/sh. /lava-3155302/e=
nvironment
    2023-01-18T06:01:40.549326  =

    2023-01-18T06:01:40.650684  / # . /lava-3155302/environment/lava-315530=
2/bin/lava-test-runner /lava-3155302/1
    2023-01-18T06:01:40.651408  =

    2023-01-18T06:01:40.656518  / # /lava-3155302/bin/lava-test-runner /lav=
a-3155302/1
    2023-01-18T06:01:40.732592  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-18T06:01:40.733143  + cd /lava-3155302/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78ca2ee785bf5d1915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78ca2ee785bf5d1915ec1
        new failure (last pass: next-20221130)

    2023-01-18T06:07:01.742100  / # #
    2023-01-18T06:07:01.843802  export SHELL=3D/bin/sh
    2023-01-18T06:07:01.844153  #
    2023-01-18T06:07:01.945470  / # export SHELL=3D/bin/sh. /lava-3155399/e=
nvironment
    2023-01-18T06:07:01.945878  =

    2023-01-18T06:07:01.946117  / # <3>[   17.886528] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:07:02.047455  . /lava-3155399/environment/lava-3155399/bi=
n/lava-test-runner /lava-3155399/1
    2023-01-18T06:07:02.048082  =

    2023-01-18T06:07:02.063445  / # /lava-3155399/bin/lava-test-runner /lav=
a-3155399/1
    2023-01-18T06:07:02.124439  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c785ff05966361a9915f02

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c7860005966361a9915f07
        new failure (last pass: next-20221130)

    2023-01-18T05:38:31.977763  <8>[   20.246268] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3154950_1.5.2.4.1>
    2023-01-18T05:38:32.083047  / # #
    2023-01-18T05:38:32.184756  export SHELL=3D/bin/sh
    2023-01-18T05:38:32.185102  #
    2023-01-18T05:38:32.286370  / # export SHELL=3D/bin/sh. /lava-3154950/e=
nvironment
    2023-01-18T05:38:32.286718  =

    2023-01-18T05:38:32.388070  / # . /lava-3154950/environment/lava-315495=
0/bin/lava-test-runner /lava-3154950/1
    2023-01-18T05:38:32.388671  =

    2023-01-18T05:38:32.394350  / # /lava-3154950/bin/lava-test-runner /lav=
a-3154950/1
    2023-01-18T05:38:32.426307  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c787f253cef00988915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c787f253cef00988915ebe
        new failure (last pass: next-20221130)

    2023-01-18T05:47:07.504727  <8>[   35.374271] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155088_1.5.2.4.1>
    2023-01-18T05:47:07.611869  / # #
    2023-01-18T05:47:07.714052  export SHELL=3D/bin/sh
    2023-01-18T05:47:07.714506  #
    2023-01-18T05:47:07.815965  / # export SHELL=3D/bin/sh. /lava-3155088/e=
nvironment
    2023-01-18T05:47:07.816443  <3>[   35.598381] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:47:07.816755  =

    2023-01-18T05:47:07.918202  / # . /lava-3155088/environment/lava-315508=
8/bin/lava-test-runner /lava-3155088/1
    2023-01-18T05:47:07.919027  =

    2023-01-18T05:47:07.930666  / # /lava-3155088/bin/lava-test-runner /lav=
a-3155088/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78a667fe235c13c915ee3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78a667fe235c13c915ee8
        new failure (last pass: next-20221130)

    2023-01-18T05:57:42.937714  / # #
    2023-01-18T05:57:43.039515  export SHELL=3D/bin/sh
    2023-01-18T05:57:43.040016  #
    2023-01-18T05:57:43.141466  / # export SHELL=3D/bin/sh. /lava-3155211/e=
nvironment
    2023-01-18T05:57:43.141867  =

    2023-01-18T05:57:43.142117  / # <3>[   19.085029] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:57:43.243483  . /lava-3155211/environment/lava-3155211/bi=
n/lava-test-runner /lava-3155211/1
    2023-01-18T05:57:43.244133  =

    2023-01-18T05:57:43.248730  / # /lava-3155211/bin/lava-test-runner /lav=
a-3155211/1
    2023-01-18T05:57:43.320517  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78bd4f946ab642e915eed

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78bd4f946ab642e915ef2
        new failure (last pass: next-20221130)

    2023-01-18T06:03:52.624838  / # #
    2023-01-18T06:03:52.726516  export SHELL=3D/bin/sh
    2023-01-18T06:03:52.726865  #
    2023-01-18T06:03:52.828184  / # export SHELL=3D/bin/sh. /lava-3155323/e=
nvironment
    2023-01-18T06:03:52.828531  =

    2023-01-18T06:03:52.828765  / # <3>[   19.090772] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:03:52.930073  . /lava-3155323/environment/lava-3155323/bi=
n/lava-test-runner /lava-3155323/1
    2023-01-18T06:03:52.930679  =

    2023-01-18T06:03:52.945204  / # /lava-3155323/bin/lava-test-runner /lav=
a-3155323/1
    2023-01-18T06:03:53.005084  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78c35d57b276711915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78c35d57b276711915ebe
        new failure (last pass: next-20221130)

    2023-01-18T06:05:31.367406  / # #
    2023-01-18T06:05:31.469061  export SHELL=3D/bin/sh
    2023-01-18T06:05:31.469401  <3>[   18.734839] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:05:31.469632  #
    2023-01-18T06:05:31.570917  / # export SHELL=3D/bin/sh. /lava-3155383/e=
nvironment
    2023-01-18T06:05:31.571276  =

    2023-01-18T06:05:31.672669  / # . /lava-3155383/environment/lava-315538=
3/bin/lava-test-runner /lava-3155383/1
    2023-01-18T06:05:31.673457  =

    2023-01-18T06:05:31.683868  / # /lava-3155383/bin/lava-test-runner /lav=
a-3155383/1
    2023-01-18T06:05:31.749746  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78d224c3fda0436915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78d224c3fda0436915ed7
        new failure (last pass: next-20221129)

    2023-01-18T06:09:13.985337  / # #
    2023-01-18T06:09:14.087163  export SHELL=3D/bin/sh
    2023-01-18T06:09:14.087623  #
    2023-01-18T06:09:14.087860  / # export SHELL=3D/bin/sh<3>[   19.203291]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:09:14.189161  . /lava-3155481/environment
    2023-01-18T06:09:14.189653  =

    2023-01-18T06:09:14.291051  / # . /lava-3155481/environment/lava-315548=
1/bin/lava-test-runner /lava-3155481/1
    2023-01-18T06:09:14.291820  =

    2023-01-18T06:09:14.305365  / # /lava-3155481/bin/lava-test-runner /lav=
a-3155481/1
    2023-01-18T06:09:14.377192  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78e8aff70a58355915ec4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78e8aff70a58355915ec9
        new failure (last pass: next-20221129)

    2023-01-18T06:15:01.865646  <8>[   18.708975] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155576_1.5.2.4.1>
    2023-01-18T06:15:01.970978  / # #
    2023-01-18T06:15:02.072789  export SHELL=3D/bin/sh
    2023-01-18T06:15:02.073338  #
    2023-01-18T06:15:02.174683  / # export SHELL=3D/bin/sh. /lava-3155576/e=
nvironment
    2023-01-18T06:15:02.175258  =

    2023-01-18T06:15:02.175496  / # <3>[   18.966808] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:15:02.276855  . /lava-3155576/environment/lava-3155576/bi=
n/lava-test-runner /lava-3155576/1
    2023-01-18T06:15:02.277624  =

    2023-01-18T06:15:02.294086  / # /lava-3155576/bin/lava-test-runner /lav=
a-3155576/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78763074911424c915ee2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78763074911424c915=
ee3
        new failure (last pass: next-20221226) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78b3e51eb8f5a63915ecb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78b3e51eb8f5a63915ed0
        new failure (last pass: next-20230109)

    2023-01-18T06:01:29.527939  / # #
    2023-01-18T06:01:29.629804  export SHELL=3D/bin/sh
    2023-01-18T06:01:29.630281  #
    2023-01-18T06:01:29.731683  / # export SHELL=3D/bin/sh. /lava-3155290/e=
nvironment
    2023-01-18T06:01:29.732184  =

    2023-01-18T06:01:29.732454  / # <3>[   18.077846] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:01:29.833707  . /lava-3155290/environment/lava-3155290/bi=
n/lava-test-runner /lava-3155290/1
    2023-01-18T06:01:29.834507  =

    2023-01-18T06:01:29.840751  / # /lava-3155290/bin/lava-test-runner /lav=
a-3155290/1
    2023-01-18T06:01:29.900765  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78d09687054a845915edd

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230116071901+2563=
ad8ef1a8-1~exp1~20230116072002.532))
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78d09687054a845915ee2
        new failure (last pass: next-20230109)

    2023-01-18T06:08:46.908788  / # #
    2023-01-18T06:08:47.012670  export SHELL=3D/bin/sh
    2023-01-18T06:08:47.013761  #
    2023-01-18T06:08:47.014460  / # export SHELL=3D/bin/sh<3>[   18.036090]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:08:47.116871  . /lava-3155412/environment
    2023-01-18T06:08:47.117736  =

    2023-01-18T06:08:47.219672  / # . /lava-3155412/environment/lava-315541=
2/bin/lava-test-runner /lava-3155412/1
    2023-01-18T06:08:47.220443  =

    2023-01-18T06:08:47.224172  / # /lava-3155412/bin/lava-test-runner /lav=
a-3155412/1
    2023-01-18T06:08:47.289292  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7886d6b93d589e9915eeb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c7886d6b93d589e9915ef0
        new failure (last pass: next-20230109)

    2023-01-18T05:49:13.787023  + set +<8>[   17.754484] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 3155151_1.5.2.4.1>
    2023-01-18T05:49:13.787272  x
    2023-01-18T05:49:13.891533  / # #
    2023-01-18T05:49:13.993886  export SHELL=3D/bin/sh
    2023-01-18T05:49:13.994645  #
    2023-01-18T05:49:14.096005  / # export SHELL=3D/bin/sh. /lava-3155151/e=
nvironment
    2023-01-18T05:49:14.096560  =

    2023-01-18T05:49:14.096881  / # <3>[   18.004637] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:49:14.198467  . /lava-3155151/environment/lava-3155151/bi=
n/lava-test-runner /lava-3155151/1
    2023-01-18T05:49:14.199160   =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7889ec49651253c915ef3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c7889ec49651253c915ef8
        new failure (last pass: next-20230109)

    2023-01-18T05:50:03.883923  <8>[   87.422125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-01-18T05:50:03.884615  + set +x
    2023-01-18T05:50:03.885187  <8>[   87.426062] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3155099_1.5.2.4.1>
    2023-01-18T05:50:03.993799  / # #
    2023-01-18T05:50:04.097251  export SHELL=3D/bin/sh
    2023-01-18T05:50:04.097758  #
    2023-01-18T05:50:04.199280  / # export SHELL=3D/bin/sh. /lava-3155099/e=
nvironment
    2023-01-18T05:50:04.200156  =

    2023-01-18T05:50:04.200627  / # <3>[   87.679828] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:50:04.302392  . /lava-3155099/environment/lava-3155099/bi=
n/lava-test-runner /lava-3155099/1 =

    ... (19 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78935365bddfc91915ec5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78935365bddfc91915eca
        new failure (last pass: next-20230109)

    2023-01-18T05:52:30.275588  / # #
    2023-01-18T05:52:30.378223  export SHELL=3D/bin/sh
    2023-01-18T05:52:30.378602  #
    2023-01-18T05:52:30.479970  / # export SHELL=3D/bin/sh. /lava-3155221/e=
nvironment
    2023-01-18T05:52:30.480729  =

    2023-01-18T05:52:30.480961  / # <3>[   18.135467] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T05:52:30.582330  . /lava-3155221/environment/lava-3155221/bi=
n/lava-test-runner /lava-3155221/1
    2023-01-18T05:52:30.583033  =

    2023-01-18T05:52:30.595340  / # /lava-3155221/bin/lava-test-runner /lav=
a-3155221/1
    2023-01-18T05:52:30.652313  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78bb87e3b530c7c915f13

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78bb87e3b530c7c915f18
        new failure (last pass: next-20230109)

    2023-01-18T06:03:11.939828  / # #
    2023-01-18T06:03:12.041208  export SHELL=3D/bin/sh
    2023-01-18T06:03:12.041650  #
    2023-01-18T06:03:12.143183  / # export SHELL=3D/bin/sh. /lava-3155364/e=
nvironment
    2023-01-18T06:03:12.144023  =

    2023-01-18T06:03:12.144297  / # <3>[   17.991442] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:03:12.245691  . /lava-3155364/environment/lava-3155364/bi=
n/lava-test-runner /lava-3155364/1
    2023-01-18T06:03:12.246807  =

    2023-01-18T06:03:12.258407  / # /lava-3155364/bin/lava-test-runner /lav=
a-3155364/1
    2023-01-18T06:03:12.315423  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78bf7f307656f9a915ebb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78bf7f307656f9a915ec0
        new failure (last pass: next-20230109)

    2023-01-18T06:04:01.043487  / # #
    2023-01-18T06:04:01.145041  export SHELL=3D/bin/sh
    2023-01-18T06:04:01.145429  #
    2023-01-18T06:04:01.246757  / # export SHELL=3D/bin/sh. /lava-3155354/e=
nvironment
    2023-01-18T06:04:01.247183  =

    2023-01-18T06:04:01.247407  / # <3>[   18.086623] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:04:01.348635  . /lava-3155354/environment/lava-3155354/bi=
n/lava-test-runner /lava-3155354/1
    2023-01-18T06:04:01.349433  =

    2023-01-18T06:04:01.356621  / # /lava-3155354/bin/lava-test-runner /lav=
a-3155354/1
    2023-01-18T06:04:01.419274  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78c6aca6ab27134915f47

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78c6aca6ab27134915f4c
        new failure (last pass: next-20230109)

    2023-01-18T06:06:10.954311  /#
    2023-01-18T06:06:11.056224   # #export SHELL=3D/bin/sh
    2023-01-18T06:06:11.056644  =

    2023-01-18T06:06:11.157868  / # export SHELL=3D/bin/sh. /lava-3155487/e=
nvironment
    2023-01-18T06:06:11.158291  =

    2023-01-18T06:06:11.158501  / # <3>[   18.192828] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:06:11.259772  . /lava-3155487/environment/lava-3155487/bi=
n/lava-test-runner /lava-3155487/1
    2023-01-18T06:06:11.260424  =

    2023-01-18T06:06:11.267663  / # /lava-3155487/bin/lava-test-runner /lav=
a-3155487/1
    2023-01-18T06:06:11.325667  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78e1c8f198da794915f08

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78e1c8f198da794915f0d
        new failure (last pass: next-20230109)

    2023-01-18T06:13:26.470225  / # #
    2023-01-18T06:13:26.571928  export SHELL=3D/bin/sh
    2023-01-18T06:13:26.572351  #
    2023-01-18T06:13:26.673641  / # export SHELL=3D/bin/sh<3>[   18.143086]=
 brcmfmac: brcmf_sdio_ht. /lava-3155550/environment
    2023-01-18T06:13:26.674267  clk: HT Avail timeout (1000000): clkctl 0x50
    2023-01-18T06:13:26.674710  =

    2023-01-18T06:13:26.779781  / # . /lava-3155550/environment/lava-315555=
0/bin/lava-test-runner /lava-3155550/1
    2023-01-18T06:13:26.780478  =

    2023-01-18T06:13:26.793773  / # /lava-3155550/bin/lava-test-runner /lav=
a-3155550/1
    2023-01-18T06:13:26.850426  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7911e477e6c04a4915ec7

  Results:     161 PASS, 8 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.i2c_hid_of-probed: https://kernelci.org/test/case/id/63=
c7911f477e6c04a4915f24
        new failure (last pass: next-20230116)

    2023-01-18T06:26:19.683665  /lava-8769773/1/../bin/lava-test-case
    2023-01-18T06:26:19.690270  <8>[    8.923244] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Di2c_hid_of-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7872dbfa8ae4fb0915ed2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c7872dbfa8ae4fb0915=
ed3
        failing since 147 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78fa03dd8722083915ec8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78fa03dd8722083915=
ec9
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c795fe507181929c915ec6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c795fe507181929c915=
ec7
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78f5d8cc2a1d6f4915f0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78f5d8cc2a1d6f4915=
f0b
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c795ae15283e4c89915ef7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c795ae15283e4c89915=
ef8
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78ff2640f0538e8915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78ff2640f0538e8915=
eba
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c79716f7b1294df3915f03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c79716f7b1294df3915=
f04
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78b2170b55fffc5915f36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78b2170b55fffc5915=
f37
        failing since 124 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78fa23dd8722083915ecb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c78fa23dd8722083915=
ecc
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c79612507181929c915f66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c79612507181929c915=
f67
        failing since 126 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c785eba5517c002c915ecd

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63c785eba5517c0=
02c915ed5
        new failure (last pass: next-20230117)
        1 lines

    2023-01-18T05:38:26.691678  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 00000030, epc =3D=3D 80204af0, ra =3D=
=3D 80204ae0
    2023-01-18T05:38:26.691808  =

    2023-01-18T05:38:26.724151  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-01-18T05:38:26.724310     =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c785c38b78db619b915ed7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c785c38b78db619b915=
ed8
        new failure (last pass: next-20230117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c783316cd19ba1f7915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c783316cd19ba1f7915=
eba
        failing since 0 day (last pass: next-20230116, first fail: next-202=
30117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7983d641872ea1b915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c7983d641872ea1b915ebd
        failing since 13 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-01-18T06:56:42.565773  + set +x
    2023-01-18T06:56:42.566985  <8>[   66.642374][  T194] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 381508_1.5.2.4.1>
    2023-01-18T06:56:42.700119  #
    2023-01-18T06:56:42.803125  / # #export SHELL=3D/bin/sh
    2023-01-18T06:56:42.803994  =

    2023-01-18T06:56:42.905484  / # export SHELL=3D/bin/sh. /lava-381508/en=
vironment
    2023-01-18T06:56:42.906193  =

    2023-01-18T06:56:43.007668  / # . /lava-381508/environment/lava-381508/=
bin/lava-test-runner /lava-381508/1
    2023-01-18T06:56:43.008640  =

    2023-01-18T06:56:43.015301  / # /lava-381508/bin/lava-test-runner /lava=
-381508/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c7878050f0cfc6ec915eb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/baseline-sun8i-a83t-ban=
anapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c7878050f0cfc6ec915=
eba
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c78e2f31ee707bd4915eba

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230118/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230114.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63c78e2f31ee707bd4915ebd
        failing since 13 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-01-18T06:13:49.123051  + set +x
    2023-01-18T06:13:49.132243  <8>[   43.565379][  T169] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 827479_1.5.2.4.1>
    2023-01-18T06:13:49.261698  #
    2023-01-18T06:13:49.363828  / # #export SHELL=3D/bin/sh
    2023-01-18T06:13:49.364412  =

    2023-01-18T06:13:49.465929  / # export SHELL=3D/bin/sh. /lava-827479/en=
vironment
    2023-01-18T06:13:49.466436  =

    2023-01-18T06:13:49.567935  / # . /lava-827479/environment/lava-827479/=
bin/lava-test-runner /lava-827479/1
    2023-01-18T06:13:49.568835  =

    2023-01-18T06:13:49.573104  / # /lava-827479/bin/lava-test-runner /lava=
-827479/1 =

    ... (18 line(s) more)  =

 =20
