Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F76A34FBCF
	for <lists+linux-next@lfdr.de>; Wed, 31 Mar 2021 10:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234449AbhCaIkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 04:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhCaIkT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 04:40:19 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D64FC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 01:40:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so790198pjb.4
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j/OSUMHOHxPoX0qhhH4EB8BPsV4b6ypeBgFSOy1WCWM=;
        b=hhIf7juEDluD+kT6OU68M2idHWcDS3gPnYsW0f5FwI8zaJsX8gj1kjKzqC2oJNuIR1
         f6lvhkSLqjfTJPOhFHFkhMhndBy9hlM0mFgny0arq0eRj8vzr/elQXIZiV1dscLrIoTl
         N2xqloQ1BcuNrYW1eSVl7/Ck3L5PUWoUtdop4m3wRGW6aJcvfriJEt0JK+MogWIt+Z69
         Gfb7QqNURETgBJxFGdHGkCd/jMExd/NMSZJScKPHmfPzD7/QwI17ikG2pouS4rMAAI6A
         mrkmqglue9SgWqHTI6kDe4b94XnHF13h8OdkpocpxBS//3y7DPeX1+RFW6//sIVp0dyg
         y1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j/OSUMHOHxPoX0qhhH4EB8BPsV4b6ypeBgFSOy1WCWM=;
        b=GS0m6K8W7s90U9nIj2D2mZswsFPCpufCBqyFimvWE3ucFAmt0f6W+ADRUnpqX4wzB8
         2+ytaohVY0867/QY7RSsxQyiXdZIwliYnYHVe7x24eFCQVEvrYNKCpgoI2P8xrURnVOx
         dF9L2kNL4E4jqCCNq4ZWSlv3z7hrY1mBaDjBSlNB5j2WBifa0GCWW0luK4AFKKqk4cL7
         Aw6aws/AI4LeKVzKiiHLSq/69CsMBgxE+hw6ObhRS9yg4vbrIAScrYlqCZgjA7+ND9Ag
         niaxvFdR3os3sTEV3tgcx0L+3vNCgLFKa9Y4n7LTLkckuFdRM481KVkXt9byTaYhaTvy
         HgZQ==
X-Gm-Message-State: AOAM532Ww29+ug5dL3RyW+fm3ci0CYVJPvtvfhaoe6zv1TFuxzg29Ppi
        J0aQH/mk0tdiOZ+8N6ChnhXF64WpvgssTg==
X-Google-Smtp-Source: ABdhPJyAbhReJNJQM9g1gVoSTb0gO/UGQ1gfOodWtwOVyMtuU5DmrH8LzTp4LZVwHsnvn0VXny01rg==
X-Received: by 2002:a17:90a:d507:: with SMTP id t7mr2509564pju.54.1617180018967;
        Wed, 31 Mar 2021 01:40:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s8sm1458371pjg.29.2021.03.31.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 01:40:18 -0700 (PDT)
Message-ID: <60643572.1c69fb81.253e2.3ec0@mx.google.com>
Date:   Wed, 31 Mar 2021 01:40:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc5-266-gc67c9c0a9e140
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 306 runs,
 5 regressions (v5.12-rc5-266-gc67c9c0a9e140)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 306 runs, 5 regressions (v5.12-rc5-266-gc67c9c=
0a9e140)

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

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc5-266-gc67c9c0a9e140/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc5-266-gc67c9c0a9e140
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c67c9c0a9e1402de224f6c480345b7c21569c0a5 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig      =
     | 1          =


  Details:     https://kernelci.org/test/plan/id/606402e103410befcddac6d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606402e103410befcddac=
6d8
        failing since 7 days (last pass: v5.12-rc4-316-g8d59c115a79a, first=
 fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6063fe53702c84c783dac6b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6063fe53702c84c783dac=
6ba
        failing since 134 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6063fe51978229cbe2dac6d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6063fe51978229cbe2dac=
6d5
        failing since 134 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6063fe4ba8b9e881b9dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6063fe4ba8b9e881b9dac=
6bb
        failing since 134 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
     | regressions
---------------------+-------+-----------------+----------+----------------=
-----+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig | 1          =


  Details:     https://kernelci.org/test/plan/id/6063fdfaff57556167dac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc5-2=
66-gc67c9c0a9e140/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6063fdfaff57556167dac=
6ca
        failing since 134 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
