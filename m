Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196203C6788
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 02:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233486AbhGMAnH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 20:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhGMAnG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 20:43:06 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B882C0613DD
        for <linux-next@vger.kernel.org>; Mon, 12 Jul 2021 17:40:18 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id n10so3002241plk.1
        for <linux-next@vger.kernel.org>; Mon, 12 Jul 2021 17:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rf5NCXWpv1FxWey6vC6ziox6QVH8l9VK+pNm4gh64k4=;
        b=nn5k6cRY/CyL9gOxXRz6t5L/DCUtr3hA/xRlnRaUEZKtcyIFVg9I5hMAXbNNxpxNCF
         XEykui0rC9DwOSrY6ngNzC3CveKEk6hoEaKqTJFhF50qrhAlwv1A8mU7EMoPl/vCdb+l
         yvRVJQmpVVRndkww2hT8zjrIghvPcNSI9UeQcjOGkSyoiGoMIU6Q1QLgrLUjs9C6FSV0
         ezYt9gBtTfc6sSk7PD2EDbbqn2M6qsnBlck0cFyD9jQL3YeKdOjRjpPuErwIxMnWknpN
         jKRREdjhukL4ICER6sc9D6Kyn1WoYu8rWgtvrgqB/LrC1ddNDp757+PfSlNN53rQYu8O
         ArPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rf5NCXWpv1FxWey6vC6ziox6QVH8l9VK+pNm4gh64k4=;
        b=JLTTvsHWC4NYC7TkNzTSwIqbwHIdQRkcYU6z+QIN6Pb1qna5PiytfqfYc15SKVVlIq
         7w/nBUAxr2aJh/yrqonmDuvsB4cWnc/rwMIgayGd53cDcWSHeH7hTY0JFMbx7WrW3IHn
         Xm1H6A4mKziSNEe4ri8AjAKPsjg+fKZ+xMsA7V72jkirlMfVrIDHHZhkJbpV5S1IiT0y
         JwctrCWAguueB5R56/LYF3KzHC/JiSkTCEicSQUw8XRQLRETFYky365Q1oMkNWersMVo
         Eel8BE+IjigLVvntSucN8t71HfInOpKFeQnVaJXFxklzZzFTf70NcFc7UJ3vK4y7o9cu
         FgOQ==
X-Gm-Message-State: AOAM532veM/G9U+AXF/cq340AGgQ3BOw4Vtfh55fzMyJZMoTl7c9TW31
        XF86Llmcr6vWruOhTWcA+LHEFzR2vikKlyOh
X-Google-Smtp-Source: ABdhPJxlhDqGuun9C6QcDm9WUIFAlCQaN0Dq5LcCInkMgpTXgTIXpubOzgHaFV3eFql9bRHGadX4pw==
X-Received: by 2002:a17:902:8c83:b029:11b:3f49:f88c with SMTP id t3-20020a1709028c83b029011b3f49f88cmr1216547plo.63.1626136817099;
        Mon, 12 Jul 2021 17:40:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n14sm7209108pfq.177.2021.07.12.17.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 17:40:16 -0700 (PDT)
Message-ID: <60ece0f0.1c69fb81.71083.5d7f@mx.google.com>
Date:   Mon, 12 Jul 2021 17:40:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.14-rc1-225-g25a1eba130d1
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 335 runs,
 24 regressions (v5.14-rc1-225-g25a1eba130d1)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 335 runs, 24 regressions (v5.14-rc1-225-g25a1e=
ba130d1)

Regressions Summary
-------------------

platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre    | gcc-8    | sama5_defconf=
ig              | 1          =

bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
fig             | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-8    | imx_v6_v7_def=
config          | 1          =

imx8mp-evk            | arm64  | lab-nxp         | gcc-8    | defconfig    =
                | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =

qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc1-225-g25a1eba130d1/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc1-225-g25a1eba130d1
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      25a1eba130d1652ad2c353dd8f6d1a2cce446947 =



Test Regressions
---------------- =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre    | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca4dc7f6b0d1ab011796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca4dc7f6b0d1ab0117=
96b
        failing since 433 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca637171a2e0d0d117996

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca637171a2e0d0d117=
997
        failing since 158 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca7b830f9f190d6117a14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca7b830f9f190d6117=
a15
        failing since 6 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca90c3addf74b32117a2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca90c3addf74b32117=
a30
        failing since 6 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca2cb48b25cf911117998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca2cb48b25cf911117=
999
        failing since 6 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca52f4363f06712117975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca52f4363f06712117=
976
        new failure (last pass: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca695626f68bc38117992

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca695626f68bc38117=
993
        new failure (last pass: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca2bf69fd3fc4a91179e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca2bf69fd3fc4a9117=
9e2
        failing since 6 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca4163fcc1544fb117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca4163fcc1544fb117=
977
        failing since 6 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca56990cf69c469117972

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/ba=
seline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/ba=
seline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca56990cf69c469117=
973
        failing since 6 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecc4eee0d5bd5c7e117990

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecc4eee0d5bd5c7e117=
991
        failing since 6 days (last pass: v5.13-1843-g646572bd9313, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eccb40280def2568117a0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eccb40280def2568117=
a0d
        failing since 11 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca65355b9b4b708117998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca65355b9b4b708117=
999
        failing since 259 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca9160d75dde7bb11796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca9160d75dde7bb117=
96e
        new failure (last pass: v5.13-12625-g5f5e6a60f828) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx8mp-evk            | arm64  | lab-nxp         | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ecaa8fd3887941e8117988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ecaa8fd3887941e8117=
989
        failing since 4 days (last pass: v5.13-11972-g079b16c442fd, first f=
ail: v5.13-12392-g47fac7b4f4b23) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca8d6ad2d02b9ae1179cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca8d6ad2d02b9ae117=
9d0
        new failure (last pass: v5.13-12625-g5f5e6a60f828) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca8195c8945e6bc117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca8195c8945e6bc117=
978
        failing since 238 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca6cb44f29db86d11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca6cb44f29db86d117=
96b
        failing since 238 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca1902ab369345411799e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca1902ab3693454117=
99f
        failing since 238 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60eca82f0358801491117988

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60eca82f0358801491117=
989
        failing since 238 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ecae97d383c8cf5e11796a

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ecae97d383c8cf5e117974
        new failure (last pass: v5.13-12625-g5f5e6a60f828)

    2021-07-12T21:05:08.038476  /lava-4185922/1/../bin/lava-test-case
    2021-07-12T21:05:08.049704  <8>[   25.077793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ecae97d383c8cf5e117975
        new failure (last pass: v5.13-12625-g5f5e6a60f828)

    2021-07-12T21:05:07.003785  /lava-4185922/1/../bin/lava-test-case
    2021-07-12T21:05:07.014278  <8>[   24.042859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/60ecaf0b85e3d77846117970

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
25-g25a1eba130d1/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ecaf0b85e3d7784611797a
        new failure (last pass: v5.13-12625-g5f5e6a60f828)

    2021-07-12T21:07:05.467520  <8>[   23.534779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-12T21:07:06.488659  /lava-4185932/1/../bin/lava-test-case
    2021-07-12T21:07:06.500462  <8>[   24.568068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ecaf0b85e3d7784611797b
        new failure (last pass: v5.13-12625-g5f5e6a60f828)

    2021-07-12T21:07:05.455182  /lava-4185932/1/../bin/lava-test-case   =

 =20
