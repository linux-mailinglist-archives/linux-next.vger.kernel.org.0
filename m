Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4E5253C59
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 05:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgH0DxE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 23:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgH0DxE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Aug 2020 23:53:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E367AC0612A3
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 20:53:03 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q93so1987216pjq.0
        for <linux-next@vger.kernel.org>; Wed, 26 Aug 2020 20:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QPMAyMoE31F4U+Vfcf11b5BUnwmdo1FswNFYgZ8iKzg=;
        b=bjINr4nMX8lvP+9qP0dz0lRDX/fH5m0qq9ttx4w7FQcPQxbroHtJhvLpovWnDafSla
         Tqg4Rc5n1rk+/aAtjfzxnVqTnx6qgaQWIWiR9Pdq+ZYPFYPM4BsMnebbcCekRUQ8rk0N
         LUhPI69KycCh96XkUMH8UW7cKLz8aEWXnVz4qlHyFlv2ilCh85V0JiiTlGSxgTJHWl+7
         2Ib3vL87KQnQ0PyWQXYtcBTBCfo0nk2bsvL0pwFGpelnZizrhLAfC7LMGUOisHidNY6x
         HGTnHYt9P5Ty8TbS7bVD/iWx2s2yeWE5KVvP1Tt0EVZnqUwCrN+bHfwBeMle06Zch8kZ
         4eIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QPMAyMoE31F4U+Vfcf11b5BUnwmdo1FswNFYgZ8iKzg=;
        b=TV56Ggx9V+e07RltG2wBi6b8ZmsVpnBRDzp3+VH6lFJnsCMCcMCTUTl8GsHNTm/iXe
         d9ditX7PF2GC6OMEuZojQH2DQt8NGv/kzm/bs7QVAQxfrypRUm2AO44Hgb2Dd11kvpXt
         9OdIVxx5tv6eXypP2fxy9MWIHBhap39r9Cw+D1ni9q7VJodPchI4t48uwcecqBAdvhBq
         I9BViHUqQrRoT2ExITdwqPxSySVTFiO01zKWvtwBqLISHrGPDaAZnM+giiwr/aJKNlQA
         wJsq8Zz9BDfe6lhBSmMX+kMKWTQLHO77hXInvCXgpZTP4/qFnXFLo5+3ZcrVAG2MSnEM
         r6qw==
X-Gm-Message-State: AOAM531fbb+zTUZC/yIVmNcHgNermzq6R/nDS9S1d7W6PggHaZtP8i07
        oJJDxImCLXE9g0j5GLOD5PAenfXgyA+7FA==
X-Google-Smtp-Source: ABdhPJxS+O+6xOoepkP4U8DWtBPrCVEBxFoP5Bnx6dCQTfYaYW0gbmnNQglpfXYvSJiK0NP/YmA93w==
X-Received: by 2002:a17:90a:a792:: with SMTP id f18mr9294519pjq.65.1598500382763;
        Wed, 26 Aug 2020 20:53:02 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d1sm538683pjs.17.2020.08.26.20.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 20:53:01 -0700 (PDT)
Message-ID: <5f472e1d.1c69fb81.2c03a.2b9d@mx.google.com>
Date:   Wed, 26 Aug 2020 20:53:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-374-g260e8bbb71b0
Subject: next/pending-fixes baseline: 302 runs,
 13 regressions (v5.9-rc2-374-g260e8bbb71b0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 302 runs, 13 regressions (v5.9-rc2-374-g260e8b=
bb71b0)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b          | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 2/4    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc2-374-g260e8bbb71b0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc2-374-g260e8bbb71b0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      260e8bbb71b01f62a7da600e5413a4218ba7988c =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46f939b90b81a9ae9fb432

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46f939b90b81a9ae9fb=
433
      failing since 113 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm   | lab-baylibre  | gcc-8    | bcm2835_defco=
nfig            | 2/4    =


  Details:     https://kernelci.org/test/plan/id/5f46f7e117368969f79fb443

  Results:     2 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f46f7e21736896=
9f79fb448
      new failure (last pass: v5.9-rc2-333-g6b34ba1e5a5e)
      4 lines

    2020-08-27 00:01:26.081000  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 65647557
    2020-08-27 00:01:26.082000  kern  :alert : pgd =3D 33324f5c
    2020-08-27 00:01:26.083000  kern  :alert : [65647557] *pgd=3D00000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f46f7e21736=
8969f79fb449
      new failure (last pass: v5.9-rc2-333-g6b34ba1e5a5e)
      40 lines

    2020-08-27 00:01:26.085000  kern  :emerg : Process udevd (pid: 95, stac=
k limit =3D 0xcbee7a18)
    2020-08-27 00:01:26.086000  kern  :emerg : Stack: (0xc411bdf8 to 0xc411=
c000)
    2020-08-27 00:01:26.123000  kern  :emerg : bde0:                       =
                                c411be68 ea501010
    2020-08-27 00:01:26.124000  kern  :emerg : be00: c411be44 c411be10 c025=
190c c024eb5c c42451c8 00000000 c03cf080 c411be68
    2020-08-27 00:01:26.125000  kern  :emerg : be20: c0e04248 c411bf48 c411=
bf50 c411bf48 c411bf40 00000000 c411be64 c411be48
    2020-08-27 00:01:26.126000  kern  :emerg : be40: c0251bc4 c0251820 000a=
aec0 c0e04248 ea501000 c411bf50 c411bf2c c411be68
    2020-08-27 00:01:26.127000  kern  :emerg : be60: c0252114 c0251bb0 6e75=
722f 6564752f ea50101f c0260568 ea46e0d0 ea002088
    2020-08-27 00:01:26.167000  kern  :emerg : be80: ea46e0d0 ea002088 c411=
bebc 00001040 c0236fb4 0000004a 00000112 c0e04248
    2020-08-27 00:01:26.168000  kern  :emerg : bea0: 00000000 00000000 c411=
beac beb2b028 c411befc c411bec0 c023a9fc c02455dc
    2020-08-27 00:01:26.169000  kern  :emerg : bec0: c411bf04 c411bed0 c024=
55dc c0161764 00000000 2b1a80c8 ea501000 ea501000
    ... (29 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f47100bcfafd2ce809fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f47100bcfafd2ce809fb=
42c
      failing since 3 days (last pass: v5.9-rc1-419-gdb8c0d8e5d3c, first fa=
il: v5.9-rc2-193-g42693eb57618)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f47114f190e691e389fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f47114f190e691e389fb=
42c
      failing since 21 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f471b7009a65b17219fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f471b7009a65b17219fb=
42c
      failing since 9 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f471f4bd2e1e3aeb19fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f471f4bd2e1e3aeb19fb=
42c
      failing since 21 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46fccf941c1623b89fb437

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46fccf941c1623b89fb=
438
      failing since 8 days (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fa=
il: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46f790c1f1d6f3db9fb42e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46f790c1f1d6f3db9fb=
42f
      failing since 16 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46f8706e92563ec29fb463

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46f8706e92563ec29fb=
464
      failing since 16 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f46faf4c9b8fbde529fb42b

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f46faf4c9b8fbd=
e529fb431
      failing since 21 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-27 00:14:39.027000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-27 00:14:39.033000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-27 00:14:39.038000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-27 00:14:39.044000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-27 00:14:39.050000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-27 00:14:39.056000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-27 00:14:39.062000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-27 00:14:39.067000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-27 00:14:39.073000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    2020-08-27 00:14:39.079000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80b
    ... (49 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f46fccdadac78fbc59fb444

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f46fccdadac78fbc59fb=
445
      failing since 21 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f47190f76fa88fc0d9fb42b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc2-37=
4-g260e8bbb71b0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f47190f76fa88fc0d9fb=
42c
      failing since 1 day (last pass: v5.9-rc2-260-g90854ecf6e2a, first fai=
l: v5.9-rc2-333-g6b34ba1e5a5e)  =20
