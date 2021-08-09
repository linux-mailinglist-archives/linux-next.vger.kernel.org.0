Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B7B3E3F2A
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 07:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbhHIFCK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 01:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbhHIFCK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 01:02:10 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11586C061760
        for <linux-next@vger.kernel.org>; Sun,  8 Aug 2021 22:01:49 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id bo18so4000954pjb.0
        for <linux-next@vger.kernel.org>; Sun, 08 Aug 2021 22:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yzEbrllJsp9rf/oZceMC/VXmrm87DZkeGA3PywK9AS4=;
        b=PljYNowwhcJcyzSzWel8mJA2PKI4PcwK0J74Q3o1wDcXApm4K+Q1f3642eLoOdX4Uq
         MFKw1grpGb8G00ZtqvLytAV4Uw408ePaoVL7FswvwZfOkgJ9k433Zi8dDtG24BARxMOf
         WZCdSMwOyExZH/CfSlmPo0clSzDrOrwsR21zgeRD4Js73cuyBHu8y0Nu02JGDtOOVDTh
         wxerX9gJQCMkZ3Lwzp0HfDRBa2ylOP7sSYioHIJVldgiHnbiAYSxYAmHHbB6YPIUqD91
         JDdH3I2vc1yWgdJNkNSPsM74g2LEQ73usmdhaGdqeM8rwTH542Z7wWxcUvOL4WtvRY0L
         M04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yzEbrllJsp9rf/oZceMC/VXmrm87DZkeGA3PywK9AS4=;
        b=erLr8HiILyVCYWpW1G1NiH516ENs3ovAPn9xWeCFZEmurXo+M8Wg/Ng9fYQF8oSxCA
         vf7D4oO/rsX8ub3jpW3R1Raano0bYDVNGRtniq+aDvBI59lgIbHfyuOGglNne6ev9cr/
         z0hv/2gl2L2XcFgAJfvwwSEPNi5KJBChtS8tTbxBXDTqBYLh9nZgZqiSOmzFlEURTGj0
         ec0kEq3ttijnAqjmmUxX2zyasDjJdL+MuDRsRgyBjgNkSrgtzXc4IOnbNkkNjukWXU40
         HUyKrUNq6ZmNcJSCtIwhFgBr6eDZIU0IdQaI6FPSKPwC3sK3bJ586yMd/bsTTCXIAYSz
         LvnQ==
X-Gm-Message-State: AOAM530acROzq0T1ylvUpkSit5JOwU2uhfRSp04vWx3pMoMeFwiZCa5e
        WTfbAb06pT90SzrK+gKMaNuZJrZfRfFUwBze
X-Google-Smtp-Source: ABdhPJxDN+UYvytJHWn/OA/8grQB+GZW+uQnyxO5GJsoF/XbgxN1QnBxW1EiAip77rDQRaXKA5MQ0g==
X-Received: by 2002:a17:90b:118f:: with SMTP id gk15mr34066482pjb.146.1628485308422;
        Sun, 08 Aug 2021 22:01:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v30sm21602763pgk.25.2021.08.08.22.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 22:01:48 -0700 (PDT)
Message-ID: <6110b6bc.1c69fb81.522c0.06c4@mx.google.com>
Date:   Sun, 08 Aug 2021 22:01:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.14-rc5-134-g0df1eee8a45c
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 347 runs,
 9 regressions (v5.14-rc5-134-g0df1eee8a45c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 347 runs, 9 regressions (v5.14-rc5-134-g0df1ee=
e8a45c)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

fsl-ls1043a-rdb      | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =

imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =

imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc5-134-g0df1eee8a45c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc5-134-g0df1eee8a45c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0df1eee8a45c05ca75b425e12295c9f4505125b3 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61107c2ce66dca463bb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61107c2ce66dca463bb13=
662
        failing since 33 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61108385a85c4d400fb13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61108385a85c4d400fb13=
676
        failing since 33 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
fsl-ls1043a-rdb      | arm64 | lab-nxp         | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/61107da1d20f7afc5db13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61107da1d20f7afc5db13=
669
        new failure (last pass: v5.14-rc4-389-g3082d2ab7f69) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6q-sabresd        | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61107d2b874ae70ca9b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61107d2b874ae70ca9b13=
662
        failing since 287 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sx-sdb           | arm   | lab-nxp         | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61108ba17555d66f80b1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseli=
ne-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61108ba17555d66f80b13=
680
        new failure (last pass: v5.14-rc4-389-g3082d2ab7f69) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/611085382ea0250be5b13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611085382ea0250be5b13=
67a
        new failure (last pass: v5.14-rc4-328-ga270ca22e1fb) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/611073d2a4bfe3eb6cb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/611073d2a4bfe3eb6cb13=
662
        failing since 265 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61107f536d5eb8e58ab1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61107f536d5eb8e58ab13=
67d
        failing since 265 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61108b3ee0a2f492dbb1368b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc5-1=
34-g0df1eee8a45c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61108b3ee0a2f492dbb13=
68c
        failing since 265 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
