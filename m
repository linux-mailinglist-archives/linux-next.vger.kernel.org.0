Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFCC392666
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 06:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhE0Ebu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 00:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhE0Ebr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2021 00:31:47 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5E8C061760
        for <linux-next@vger.kernel.org>; Wed, 26 May 2021 21:30:13 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id q67so2683296pfb.4
        for <linux-next@vger.kernel.org>; Wed, 26 May 2021 21:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+fKETvPEb/1jcyRD/ceJGa0T1VEQyj2SyN7qAGLRSQg=;
        b=mvCIDd41jG6FrMZbVKv11kKDhhcll4CZ82epLoLeBe80uXH3C1PDfRhT4mLtJkuSmp
         aGJm02SCWrDHtB5lBWeRbIIEp0eVE4xkq6q1ec+w7T/DDVgNcBjbs4x2UJtj//FMnxV+
         TVhko00x/0oT0qCNIIhEQRjQu8yyIRv+wNhwJbXaty2wsw7aKxGqoCcutAblQQKoRCUb
         Dhcj3WOxTobS9CX8/ZP6wnhu5xtWkWKXOWVc+hZYjjG4hVoF6fqcYavUmhF8ieNDvA/4
         mJsVJxzTIQaxzFvVmlRzMMEyB4VIlTj7Fbb5RlXpo6rfuKdYF2miStahYNzT7UAA83x3
         OAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+fKETvPEb/1jcyRD/ceJGa0T1VEQyj2SyN7qAGLRSQg=;
        b=uZbG9VHEQ3/nNEFXDDRnYunx2AinMcUPDz4fgPkqhlDMHy67kPBdrOK0Lfk8Qq/f51
         Uq4k52CqDqu7XQ8RHFABsy9eJKwWv/v4lOLZo6N3X+BfbWCyKqGOWe9Xb8uGPFKA4k68
         mfEOzVwyLMKMlJvuhNp0Td4z0HOkgUgx3xDL/g9vkDtrwlqnfQkupuMnlh7h6XU/UwWv
         hlBpE4KjSa4pJ4MGGPGcKvDzAEqolRGUziPVm1jAIjM50D0SrQxd+eoc/M9ZHXapmeHK
         6A+oLysP8JT0qdyZoKc58z46GBXO1+EGACAa1voPVpMWxTlTn/+JOfyk6+nW7fLNZMcl
         WTHQ==
X-Gm-Message-State: AOAM530NjZx2mqtFSU0jkX64q9i+9u0V+qBy3QeieMIp1lXhEHGZEWK+
        3Fg+notL9Z1V8ywbcmuP35w1lS2YjNeMDBuL
X-Google-Smtp-Source: ABdhPJzkQ0jBZVKxpgt9P/W83Mhf9ymvO3dj1kHOMnBVf8+nyX6yXwp5y6ath1/YfvT+mzp1jEXr5w==
X-Received: by 2002:a63:585:: with SMTP id 127mr1915452pgf.322.1622089812061;
        Wed, 26 May 2021 21:30:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 195sm641842pfz.219.2021.05.26.21.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 21:30:11 -0700 (PDT)
Message-ID: <60af2053.1c69fb81.4eeae.356f@mx.google.com>
Date:   Wed, 26 May 2021 21:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.13-rc3-488-g5b9d8060231e
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 221 runs,
 10 regressions (v5.13-rc3-488-g5b9d8060231e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 221 runs, 10 regressions (v5.13-rc3-488-g5b9d8=
060231e)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc3-488-g5b9d8060231e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc3-488-g5b9d8060231e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5b9d8060231eef22008da046c98d77156d4b484b =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b          | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60af1303d4f8886fe7b3afa2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60af1303d4f8886fe7b3a=
fa3
        failing since 111 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx6q-sabresd            | arm   | lab-nxp       | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60aee9c3e2be56998bb3afe7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aee9c3e2be56998bb3a=
fe8
        failing since 213 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
imx8mp-evk               | arm64 | lab-nxp       | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60aeebc18185738d9fb3afa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aeebc18185738d9fb3a=
fa9
        failing since 1 day (last pass: v5.13-rc2-481-g054f1a7414a0, first =
fail: v5.13-rc3-403-g45efcfb7fe0e) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60aee84d004b7eaf55b3afc4

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60aee84d004b7eaf55b3afd8
        failing since 29 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-27 00:31:01.568000+00:00  <8>[   55.795816] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/60a=
ee84d004b7eaf55b3afde
        failing since 29 days (last pass: v5.12-121-g07bcd85dd158c, first f=
ail: v5.12-4702-ge27839dcc50b7)

    2021-05-27 00:31:02.680000+00:00  <8>[   56.908246] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60aefeee5a26ad873eb3afbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aefeee5a26ad873eb3a=
fbd
        failing since 191 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-cip       | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60aee6273f60468c5cb3afb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aee6273f60468c5cb3a=
fb9
        failing since 191 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60aee5b987d01e4612b3afa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aee5b987d01e4612b3a=
fa9
        failing since 191 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip       | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60aee8ccc9871ef62ab3af97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aee8ccc9871ef62ab3a=
f98
        new failure (last pass: v5.13-rc3-472-gb81329b9c8e7) =

 =



platform                 | arch  | lab           | compiler | defconfig    =
                | regressions
-------------------------+-------+---------------+----------+--------------=
----------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60aeebdd805bd13ef3b3b0b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc3-4=
88-g5b9d8060231e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60aeebdd805bd13ef3b3b=
0b7
        failing since 2 days (last pass: v5.13-rc2-481-g054f1a7414a0, first=
 fail: v5.13-rc3-362-ga5eddb3af012) =

 =20
