Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36D2350D74
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 06:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhDAEI2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 00:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhDAEH4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 00:07:56 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF03C0613E6
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 21:07:54 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v10so710007pgs.12
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 21:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=u6HKzymjeGfzPX04jURBzmXAxYHfQ49WVFddyT0rsPM=;
        b=Y1bGhDnkpBVO4YULfr5EJ3z0RFRVbTLgU82z0aPMEQ93xz8t9YvPBBpPZ7uQ77m0d8
         b8N3DfhR2uykh5C6PHFdctLqhwdUHyU2MSHECwGeulvnx7dWyCbUWsmJYt+7MJ896GQ0
         M9MV7P5yeFbWi5ZOcRDNFnDgQsYyBGMsyi3is36fBpjRWkcqis+VGPVhhGjXfqeJT4ZI
         qN1w11IEpYsck8KRwZHZTWEllWKYpW8zaTKFar3ficbrzrvTc6IREx9Yynyvc4hAbQrL
         EYs4hN6AJs+FOOnBtXBl34Yvs+SIEAMR7exRxSkRXhJ1EKlnCEnkh9WNvr3PXSkxRPX4
         GDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=u6HKzymjeGfzPX04jURBzmXAxYHfQ49WVFddyT0rsPM=;
        b=bs5BnBhSLwTtwvsMNAAl6Gqs4UI7CwHadGs86bhTQFUkNpSi8FV6DpcafaerTaoCfh
         itJVW5xP/pAjLIQd2i1Iw7CZsNiwRK8I2vjOyEY9+1eEtYUrBHzCG1WWw/2+nDIP85uT
         EV2/kIko3phkUHG8RC8VcMI3/2uDc+DEx10UoWuAw0QjiWY7dCSZFTA7qKrI5DuTeDNL
         brun8tcsx8Gxepiu+7hWZIuEYnEQQfPKjz5/mAZpxF6EtxcmJn+8We5qt+RsRG0gs+6+
         +gTmhBybXRWvHFJAGqxGY1S8A/mGEP2xm2YGd1rzmxrRLG903Ey779HPG+yWRZYY15+C
         bkjA==
X-Gm-Message-State: AOAM533nrz0Leu6NIJ1q60etniR/cAcLaietJP2wzZdp91aobvFeefSs
        rYXLnyb+8JDCK8GoJxD6bmI4KL2ExsKfIUbT
X-Google-Smtp-Source: ABdhPJx++7MSykOXbuNpPgyQ3uxlWEge/ybdvCU+mYYg5Uc4ZHFisHK1dzOFd2lxmNSaeJWCLftLHA==
X-Received: by 2002:a63:3189:: with SMTP id x131mr5832674pgx.430.1617250073371;
        Wed, 31 Mar 2021 21:07:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v11sm3960139pgg.68.2021.03.31.21.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 21:07:52 -0700 (PDT)
Message-ID: <60654718.1c69fb81.4b252.b20b@mx.google.com>
Date:   Wed, 31 Mar 2021 21:07:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc5-292-g896505d11915b
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 281 runs,
 4 regressions (v5.12-rc5-292-g896505d11915b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 281 runs, 4 regressions (v5.12-rc5-292-g896505=
d11915b)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc5-292-g896505d11915b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc5-292-g896505d11915b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      896505d11915b2a6c4dd243f94e178cd199b64f9 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/606514841304440794dac71b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606514841304440794dac=
71c
        failing since 7 days (last pass: v5.12-rc4-316-g8d59c115a79a, first=
 fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60650c86a700cbca06dac6ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60650c86a700cbca06dac=
6cf
        failing since 135 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/60650c79708f5779dadac6cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60650c79708f5779dadac=
6d0
        failing since 135 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/606528476d04d74fb4dac6f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
92-g896505d11915b/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606528476d04d74fb4dac=
6f9
        failing since 135 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
