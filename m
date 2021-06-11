Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646953A3E5D
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 10:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhFKI5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 04:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhFKI5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Jun 2021 04:57:14 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A049DC061574
        for <linux-next@vger.kernel.org>; Fri, 11 Jun 2021 01:55:16 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id go18-20020a17090b03d2b029016e4ae973f7so4515370pjb.0
        for <linux-next@vger.kernel.org>; Fri, 11 Jun 2021 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=l6aT5jxf8vZQWb6U3YRaepZvJw/9ND3YGWzPA5dwTas=;
        b=pT1wa0pmOML/rvsQFnbVakQCZxvzhfyvCVWxEJr3zKj9mTMDTxQBbdrEkGP3c4Vsyt
         A3UvCv1030ZT3AgqLls4r+gE9wYIMWMAWNaolMgL8w1rIBG/K0mc8vZat3QjrN5zCJVX
         pY26zhm6PbWNEfHoHkHMLrxkBxvfRNyNLotPOrU4lL4ES03cnFX3ce3eFCpG9AsPQxtS
         HcaXMHELOtS3tPBpVcExE3uSW2JaGwyr3IH/nYrPUY+PsfCzPVX/3WEfqDxCHcVIvBtj
         43D0VdJczHC9ZEii5B9dNurDY08QdVIqQlD2C9rUlenY1yAoN06JKVo584SKxo2MT3uk
         bgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=l6aT5jxf8vZQWb6U3YRaepZvJw/9ND3YGWzPA5dwTas=;
        b=ab+tf8Mag4y1Z0tsP/KeTdSgS9R9VZSJQlkNGQKIdH9Xw9PIl1JC/S3OUr/LQKOkcm
         h4NaVptU9XKNQP2tJIeRya8Pw7voDOuAdYZIL6CcZAbteT056fZLTeCbO9OFQX9/+40t
         1vmZ3STnzWBvF3BPd1hy+ZC4+7Efm61QZy4deNvqt5q/+M15OILYnmcasfNjY7xZnd7w
         M+paKnrrow/ElocmAehVwSxyCHgNJzfJpFewzej0wJ8N+XwN2thNnkojGvD7HZJirRf1
         n1VVf5rQadAZk3K3qb+FlCy8w8G5eCt46JUjYTsMEbqjwl5b/8Sqet2SfjW3lUCb53gy
         QnuQ==
X-Gm-Message-State: AOAM533MqHAjQzaFfH9WAYRUlJixAyJ04AH/1JcWXkADnyS0gp6MSnL9
        G/UGatC7euVPujCeXfjsKkehMJ9FILHXvn0J
X-Google-Smtp-Source: ABdhPJywKgmdQdOITZEkpEJJjNCcZGLOOJjSc42K3pwKXHvVIT/Ah4I2kpPtE0Kqoux8fXdwhqQxPg==
X-Received: by 2002:a17:90a:aa8c:: with SMTP id l12mr8071712pjq.90.1623401715917;
        Fri, 11 Jun 2021 01:55:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x20sm4553242pfu.205.2021.06.11.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 01:55:15 -0700 (PDT)
Message-ID: <60c324f3.1c69fb81.ea580.e71c@mx.google.com>
Date:   Fri, 11 Jun 2021 01:55:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-rc5-356-g3bcfdddd7a62
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 241 runs,
 5 regressions (v5.13-rc5-356-g3bcfdddd7a62)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 241 runs, 5 regressions (v5.13-rc5-356-g3bcfdd=
dd7a62)

Regressions Summary
-------------------

platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =

imx6q-sabresd        | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =

qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-rc5-356-g3bcfdddd7a62/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-rc5-356-g3bcfdddd7a62
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3bcfdddd7a62876390b43063dd33e957230588de =



Test Regressions
---------------- =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora | gcc-8    | multi_v7_defc...CO=
NFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2fbf473a9c207330c0e22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2fbf473a9c207330c0=
e23
        failing since 126 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
imx6q-sabresd        | arm  | lab-nxp       | gcc-8    | imx_v6_v7_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2eceb33d3b9ca4a0c0e51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2eceb33d3b9ca4a0c0=
e52
        failing since 228 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-baylibre  | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2ea2385e535e23c0c0df5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2ea2385e535e23c0c0=
df6
        failing since 206 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-broonie   | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2ea74ff7573f8700c0f15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2ea74ff7573f8700c0=
f16
        failing since 206 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch | lab           | compiler | defconfig         =
           | regressions
---------------------+------+---------------+----------+-------------------=
-----------+------------
qemu_arm-versatilepb | arm  | lab-cip       | gcc-8    | versatile_defconfi=
g          | 1          =


  Details:     https://kernelci.org/test/plan/id/60c2ea2785e535e23c0c0e01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-rc5-3=
56-g3bcfdddd7a62/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60c2ea2785e535e23c0c0=
e02
        failing since 206 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
