Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672EE2D919D
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 02:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437763AbgLNBjs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 20:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgLNBjs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Dec 2020 20:39:48 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DC3C0613CF
        for <linux-next@vger.kernel.org>; Sun, 13 Dec 2020 17:39:08 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b5so4154714pjk.2
        for <linux-next@vger.kernel.org>; Sun, 13 Dec 2020 17:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qL9FzhSyfSCYVL8l7vraB2SdRRXuXHn95JpcLJQ/wC8=;
        b=zWKR6X7c0gFhib46zzA+wqVv2aiLJwGBoIlWQBfKHM6r1+lrgNOuE7wjXzejUrz9y4
         NJ0ni8qNuvW7eqmB1mmbykb3VTRtFQ3hTZcJyR8ML1SY7yO6yWp15vc+Va0gO5C9i34u
         WRTWGT416Luga/GpIi7UNJWrCut9mmqt3PrjmpwpttUA5gRtwbBk2p2pITxrlCz0F44e
         NhdWLfZHn532qlnJ0lHYM2cZ0KiAMy/nvSnQNL2e6/hf1ZOuxWn3eSP6zbWb5+O/7LcW
         de/bBImVE1rp/crpY5EXC9Lv4GLe5wATYH+QChVhnf7rp8karOXxAG7AA+JvR+jeLaCZ
         KwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qL9FzhSyfSCYVL8l7vraB2SdRRXuXHn95JpcLJQ/wC8=;
        b=l2C2IB5xpPG3IvG6kURWv3RzeaHVev69s6kwSpTWsapBQd7jbcF+LtEYeO4p+o7BSe
         4jRFZWb3L6iu0a7+6GizXrxmA1mtM1Fa+0U7bSy8xnO397WgtPEE3i1lugxk3T8H5ItI
         HbDedZZwXYVK/MhOXj1j7WmYlSL09xPhebv04Qe0xs/0ffC0UCUuJozaMlQX3zPydpSn
         7XS5/AGSkKqVuDyKKCuoEGokw8aeZJ4Q3yl3zVpheyHQVWZXMpZKSdg0tiw+lvTXo8ka
         l9/MneyEgI2NNh9B4qNweqlNqKgaOQMoUprhQzw0tmK3xXKYLybkIkvm5mw1QAYxL0Wy
         ZTQg==
X-Gm-Message-State: AOAM5336NiJNWgpwDc7oLDpQHGx9X20USaFmie9e8ODOXgu+71OYyJjj
        1/aqMoybbn9DDylLBfpfe14Y1j5iQ4gL4Q==
X-Google-Smtp-Source: ABdhPJwRxCj9fDktgrxDFhv39OqtdrWXLSQoPe3BKZpO3fVea4qT8t7zqn5gYm1yyg9u0lGUWnpL6g==
X-Received: by 2002:a17:902:7606:b029:da:1f26:a1bf with SMTP id k6-20020a1709027606b02900da1f26a1bfmr12660510pll.53.1607909947603;
        Sun, 13 Dec 2020 17:39:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q23sm18233161pfg.18.2020.12.13.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 17:39:06 -0800 (PST)
Message-ID: <5fd6c23a.1c69fb81.8cbe9.58c3@mx.google.com>
Date:   Sun, 13 Dec 2020 17:39:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc7-365-gdae669c2b0553
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 341 runs,
 12 regressions (v5.10-rc7-365-gdae669c2b0553)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 341 runs, 12 regressions (v5.10-rc7-365-gdae66=
9c2b0553)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =

imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc7-365-gdae669c2b0553/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc7-365-gdae669c2b0553
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dae669c2b055330342b8c6c24858aea95fd154c4 =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-sabresd              | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68d76fb028588f3c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68d76fb028588f3c94=
cde
        failing since 48 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd6911d6343de4c68c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd6911d6343de4c68c94=
cc8
        failing since 4 days (last pass: v5.10-rc7-168-g5f4524a4d7e4e, firs=
t fail: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68d72fb028588f3c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68d72fb028588f3c94=
cdb
        new failure (last pass: v5.10-rc7-269-g52e72161fe54) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68fa5051c0417c5c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68fa5051c0417c5c94=
cc4
        new failure (last pass: v5.10-rc7-269-g52e72161fe54) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6sx-sdb                 | arm   | lab-nxp         | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd6915b125d3a2b0fc94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/basel=
ine-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/basel=
ine-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd6915b125d3a2b0fc94=
cda
        new failure (last pass: v5.10-rc7-269-g52e72161fe54) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68da62e89e17f01c94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68da62e89e17f01c94=
cd4
        new failure (last pass: v5.10-rc7-241-g77fd83718a5f) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68e1adfb47f0b4ec94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68e1adfb47f0b4ec94=
ce4
        new failure (last pass: v5.10-rc7-241-g77fd83718a5f) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68d60c0159716a8c94d00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68d60c0159716a8c94=
d01
        failing since 4 days (last pass: v5.10-rc7-168-g5f4524a4d7e4e, firs=
t fail: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68c0e0b5c8f22ccc94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68c0e0b5c8f22ccc94=
ce1
        failing since 27 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68c110b5c8f22ccc94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68c110b5c8f22ccc94=
cea
        failing since 27 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68bb032d919da88c94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68bb032d919da88c94=
cca
        failing since 27 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd68bda56a110856ac94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-3=
65-gdae669c2b0553/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd68bda56a110856ac94=
cd4
        failing since 27 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
