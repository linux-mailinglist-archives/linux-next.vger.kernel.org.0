Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99BF3DDFE3
	for <lists+linux-next@lfdr.de>; Mon,  2 Aug 2021 21:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhHBTQO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Aug 2021 15:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbhHBTQN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2021 15:16:13 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D59DC061760
        for <linux-next@vger.kernel.org>; Mon,  2 Aug 2021 12:16:04 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso1434106pjo.1
        for <linux-next@vger.kernel.org>; Mon, 02 Aug 2021 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=isz+HUkQVDP9d8Tz9hoNEN/ACuBdrk7sj2Pj6brE0gQ=;
        b=PI7qRfbBDq9RBICpKTybBjfVfKXYrt9KVrb+pRETXRDXsVSxkH9LFz23lNptwIf4sO
         xPzXoE+uBemRcPgdWfuIIc0gtfaR7atNeteFShOltagU3pmgEySwF5oCjuimxJZrdoTm
         MzfgLdJd4dbFAEyKzmN9WmktdZ/NyCc/fDXaJU8sFu/V82nLQEYFQi6SGGFeKXWETXSI
         dUnAl8/ug+if+7Loh4UhNE+hLAQx66UpALd4y8BV5YXkfA0BCOoJywsQVAzSHZmSxzXr
         yoSKFojm/zzmkbZ4ELTvC6NHZg5naV709eG0hxJV1a+LSXNd7/4WXEwS9Xb7svPyHD2T
         V9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=isz+HUkQVDP9d8Tz9hoNEN/ACuBdrk7sj2Pj6brE0gQ=;
        b=CYpCtDGFqROmQaVhZOYdKU/2slLPp5IkVkLrrE9sDOwrSxglbUb8Z7F+Lj7DkTP9S6
         KR16Jo0CFhhOJgU0CM4WhdQB2EAWeTzmLRpUbt0gV1sP3rklCMd6m/+SvotsrQD9A+8Z
         RveCqSfWwU2lK8DDsW9vQ7zn1GZk2w6Ow9i+OSP2AlgGFoaj/t9Ns8Izlr6ntAI6RMLl
         dKxW0wmbrqsnNFZ1yQIQ6W2ULCuozfdBXrcb91NcTvv6n+buveEiU/oybLBSL2H+jIOv
         M7rP8a4A8eoVDBUjvEEBuKDQiPNX81mqOqKEa3TDjUyprZLS/2viAuSVSiPwnJtywO4t
         rqlQ==
X-Gm-Message-State: AOAM531bbaNDdZO8LGcTT+mTr9TFpzBoZkL2EbR9uaOvM9F3uo8mYlug
        qbKS9pQlEx/NOg8TDbOVuX45Y1qqbuxBV3lk
X-Google-Smtp-Source: ABdhPJw7W4VoeRW6pMXHxNPVkSyxym4dwn3+REBZtspeR0SJhTqoAf8N4NSmtP7BlfjoBBittvNRMg==
X-Received: by 2002:a17:90b:4d82:: with SMTP id oj2mr6292685pjb.83.1627931763410;
        Mon, 02 Aug 2021 12:16:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a12sm2113009pfg.120.2021.08.02.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:16:03 -0700 (PDT)
Message-ID: <61084473.1c69fb81.8a547.5c45@mx.google.com>
Date:   Mon, 02 Aug 2021 12:16:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.14-rc4-200-g928b53f6fae6
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 520 runs,
 21 regressions (v5.14-rc4-200-g928b53f6fae6)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 520 runs, 21 regressions (v5.14-rc4-200-g928b5=
3f6fae6)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =

hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =

imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc4-200-g928b53f6fae6/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc4-200-g928b53f6fae6
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      928b53f6fae6b3029dc5490508594df3bc78d874 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61080b1126be47da4ab13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080b1126be47da4ab13=
665
        failing since 178 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61080cdc036228be69b136ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080cdc036228be69b13=
6bb
        failing since 27 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61080f851a4da87716b136c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080f851a4da87716b13=
6c5
        failing since 27 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32      | arm   | lab-baylibre  | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6108085362774dcb3ab13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108085362774dcb3ab13=
671
        failing since 27 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/610809976a498d668eb136ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610809976a498d668eb13=
6ac
        failing since 20 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
beagle-xm               | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/610809faebeccff797b1368c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610809faebeccff797b13=
68d
        failing since 6 days (last pass: v5.14-rc2-377-g86d652a288466, firs=
t fail: v5.14-rc3-186-g80ff4c157591) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61081342aa16e961d8b13665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61081342aa16e961d8b13=
666
        failing since 32 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
hip07-d05               | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610817b62b2ee0f2d5b13666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610817b62b2ee0f2d5b13=
667
        failing since 27 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx6q-sabresd           | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61080a5045bae35e24b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080a5045bae35e24b13=
66e
        failing since 280 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+cryp=
to             | 1          =


  Details:     https://kernelci.org/test/plan/id/61080f64ef2a5b51bdb13694

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080f64ef2a5b51bdb13=
695
        failing since 4 days (last pass: v5.14-rc3-199-g011c1b80c7a5, first=
 fail: v5.14-rc3-302-g1c47cc89bed6) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
imx8mp-evk              | arm64 | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6108116b60897eef1cb1369e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108116b60897eef1cb13=
69f
        failing since 4 days (last pass: v5.14-rc3-199-g011c1b80c7a5, first=
 fail: v5.14-rc3-280-ga13e2de60b6f) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
meson-gxbb-p200         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61080b40cbe875a433b13668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080b40cbe875a433b13=
669
        new failure (last pass: v5.14-rc3-280-ga13e2de60b6f) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61080b1126be47da4ab13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080b1126be47da4ab13=
662
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61080caeb4b3955c84b13693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080caeb4b3955c84b13=
694
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61080aeddd5937ac5db1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080aeddd5937ac5db13=
66b
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6108122aab7e0fa539b1366f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6108122aab7e0fa539b13=
670
        failing since 259 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 2          =


  Details:     https://kernelci.org/test/plan/id/61080c0bb416ae5b99b136a0

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61080c0bb416ae5b99b136aa
        failing since 20 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T15:15:02.908876  /lava-4307540/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61080c0bb416ae5b99b136ab
        failing since 20 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T15:15:01.874660  /lava-4307540/1/../bin/lava-test-case
    2021-08-02T15:15:01.885596  <8>[   24.089579] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61080ec50d4bbad0f1b13685

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61080ec50d4bbad0f1b1368f
        failing since 20 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T15:26:35.669878  /lava-4307658/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61080ec50d4bbad0f1b13690
        failing since 20 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-08-02T15:26:33.611483  <8>[   50.300086] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-08-02T15:26:34.634706  /lava-4307658/1/../bin/lava-test-case
    2021-08-02T15:26:34.645508  <8>[   51.336224] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab           | compiler | defconfig     =
               | regressions
------------------------+-------+---------------+----------+---------------=
---------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/61080d219c42a7de21b1368f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc4-2=
00-g928b53f6fae6/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-banan=
api-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61080d219c42a7de21b13=
690
        new failure (last pass: v5.14-rc3-353-gf8730f66145e) =

 =20
