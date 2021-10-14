Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2863F42D1C1
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 07:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhJNFCG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 01:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhJNFCG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 01:02:06 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19B2C061570
        for <linux-next@vger.kernel.org>; Wed, 13 Oct 2021 22:00:01 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so3949742pjb.0
        for <linux-next@vger.kernel.org>; Wed, 13 Oct 2021 22:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TSM+gLhVsOlN56Tm2+bUmlFOyQ8X1Hc4AgcN3qpSmjc=;
        b=40X0205lTF3Y7p1o4a64btwphZ0oOyweCQDU8Be68YgHE95wsnkzJz2Mx9laiU9bqj
         6UuglKR+l2ABhvqBKttCIdhInIw0OtbzbCkBnX9BsSYyFXkoZaTzMaKZCoTd7seadJqj
         Q+MxGLPK9XgSDpDDnzsdZbrAHVf+uc66sZQR/Es5y7nH8+6EAsZdugZ5SiaS3WE550oW
         AJctOwRdIKMF0ebImgbpFDKMeEyLba4nTK9+7fx81vB4eyoHRlAZA9rvm73Ggh/WvAyi
         99IzJH9C3VyzZhhRj723Tz06Xfi8Zx2T4SEbyqIH0wqNFRsCVKzNdM7aU/hJ9vHAKEUj
         uLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TSM+gLhVsOlN56Tm2+bUmlFOyQ8X1Hc4AgcN3qpSmjc=;
        b=px62tfx5w5Rkc0MqkoEPjL/hU7wzttePRl1wg4dGVSnwsUY0XD4cNZbZcbWqXV82t2
         xo0SQBuhoOzDzQ2ho9YefwwsHIoOwOmlw+cLY4COLpLBzCuRRbVEV8F3EFWrifCr5B9d
         HSKvrdH7wbTowpGsDURQhnyBPo9zhWAFP1jTcHAOSA5wymtIYuBVLVzmkzIIskVVVaXe
         +u4z33dPOEIlewoO9vIosZv1Fu9p4I5leP4VRd8J5c3MHSYb5pWFLy6pkw2bjP2TXBIL
         4FgnR1S70H87hdBWN1nCzoPsIEXAoIuFC2sQWVY4KriSWLna2OPIxhwM8XaOQsDJfioR
         xlug==
X-Gm-Message-State: AOAM532PMj8M9GeekteSM84SNFI3uZe0bBjJzpNyWCGEV7vhdwP2OnVv
        Ivg8h39nkjp/ZvokPcuolwGBgIMoZVZJoAwFZYQ=
X-Google-Smtp-Source: ABdhPJyxVSgbYkzjGF16BdO67/rvSM7cA7Ig6rJsjrzpbdd7c21oyeG5O7tQVKzWtMxkhxxdN9TlOQ==
X-Received: by 2002:a17:90a:9b84:: with SMTP id g4mr18496985pjp.123.1634187600946;
        Wed, 13 Oct 2021 22:00:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g11sm1061052pfc.194.2021.10.13.22.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 22:00:00 -0700 (PDT)
Message-ID: <6167b950.1c69fb81.5edc8.45de@mx.google.com>
Date:   Wed, 13 Oct 2021 22:00:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.15-rc5-257-g076a1cb758f7
Subject: next/pending-fixes baseline: 177 runs,
 7 regressions (v5.15-rc5-257-g076a1cb758f7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 177 runs, 7 regressions (v5.15-rc5-257-g076a1c=
b758f7)

Regressions Summary
-------------------

platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig+=
ima       | 1          =

beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig+=
crypto    | 1          =

beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =

imx6q-sabresd        | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defconfig=
          | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
          | 1          =

qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc5-257-g076a1cb758f7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc5-257-g076a1cb758f7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      076a1cb758f782b71838d6d464f19be80dd14231 =



Test Regressions
---------------- =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig+=
ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61677f05382e0a2c1f08fad4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-bea=
gle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61677f05382e0a2c1f08f=
ad5
        new failure (last pass: v5.15-rc5-210-gee0ce4e51d06) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defconfig+=
crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/616780594d2714339008fadd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+crypto/gcc-8/lab-baylibre/baseline-=
beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616780594d2714339008f=
ade
        failing since 14 days (last pass: v5.15-rc3-320-g55d87bb21463, firs=
t fail: v5.15-rc3-355-gce19122666db) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
beagle-xm            | arm  | lab-baylibre | gcc-8    | multi_v7_defc...CON=
FIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616780bedca9501c2708fad3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616780bedca9501c2708f=
ad4
        failing since 7 days (last pass: v5.15-rc4-194-g2923234d916d, first=
 fail: v5.15-rc4-323-gef65f5d4cc4d) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
imx6q-sabresd        | arm  | lab-nxp      | gcc-8    | imx_v6_v7_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61677b0cd35fa111d508faf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61677b0cd35fa111d508f=
af6
        failing since 353 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-baylibre | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61677d789e25c03e2508fab1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61677d789e25c03e2508f=
ab2
        failing since 331 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-broonie  | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61677db7fadf638bff08facf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61677db7fadf638bff08f=
ad0
        failing since 331 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab          | compiler | defconfig          =
          | regressions
---------------------+------+--------------+----------+--------------------=
----------+------------
qemu_arm-versatilepb | arm  | lab-cip      | gcc-8    | versatile_defconfig=
          | 1          =


  Details:     https://kernelci.org/test/plan/id/61677dbe6a3a00ca0508fab1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc5-2=
57-g076a1cb758f7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61677dbe6a3a00ca0508f=
ab2
        failing since 331 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
