Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D095B3AD34D
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 22:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhFRUDe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 16:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhFRUDd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Jun 2021 16:03:33 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACBDC061574
        for <linux-next@vger.kernel.org>; Fri, 18 Jun 2021 13:01:23 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id q192so1958260pfc.7
        for <linux-next@vger.kernel.org>; Fri, 18 Jun 2021 13:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ab/EfJrzSiFLkYlUVaAdS0Bdac9ApO1Ud/a3bjk3MNc=;
        b=Ye3+/In8v+wMiTnKMnnv/bopYxntpLTYgbryx3xc7UAd2/xtiiVNJt7aLC5zjbPYuA
         QKKSHZ6Wq5YVkEc/G4hB4VxpaKZa1SEhBirOE2hYT9FSIQiN3NEgCNtyPRZGp5cXudSs
         dQJ72qRo1/0zbsHCAj+I9P98YSWsMwRs9JSqiwd6cC6RVKkGRee7JRcERN0taUpgdbQp
         qCzxxWv07gUG1Tvkt3cnyb93wrFCRHDvB2r5i2oRqpsngyN82q015hDXANTOCb06i7F+
         0PTI3OCcEt1TuIEi0DjUa0UGX/k5LGFyK259e0R1jGXYmp9ePAESJ0poQVo6hwGT8wHG
         Yldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ab/EfJrzSiFLkYlUVaAdS0Bdac9ApO1Ud/a3bjk3MNc=;
        b=VP+nGQc7adj4LRiIzmF+HRIU42WQPKauyL9CkqyVc4dbkxc0TPMsALIK0VJ16Xubr8
         RRFUI6uP/fkBDw0TzifCjvsnTrIZ2xNjDvvIEGgCHGkxJSfA6r7Y4ZCJk0vB0NqvEAEH
         qE16Fx/1LSCrb2zpkM+AVCE2E3XfUhilRSlvA/QSUkUCWvMNkTZJhHoKMK3ZInMP1Tzb
         8QCPge5S/0Wr7XoQUuVPZAq0fGeS43jFK7E663RFoaKxBuOx3c83VTEHDO/pran5rOkc
         cDoJoO/sMaBl15kiNS6cY+S6+Y6Ceds6bhMFSyGKoNnepv3yKdN2Zj4KUBv349ZV3axd
         EexA==
X-Gm-Message-State: AOAM530XhHEX9nqjaDUYdNb5sEd32qUjpaxVeC1fWdBWcwSWWCeO2HRP
        q0CLrW1QWf8L6AjzUBEBwsz7YUS4Jh2OwdTU
X-Google-Smtp-Source: ABdhPJzfLlc05vzWzHf910oZunIrd7xxBq/Nm4kvqYrLC4gj08PutXMKQpoGJ3ZAd3NLyJh0B+GuaQ==
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id p30-20020a056a000a1eb02902e289d85c87mr6933755pfh.73.1624046482257;
        Fri, 18 Jun 2021 13:01:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cq24sm11997676pjb.18.2021.06.18.13.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:01:21 -0700 (PDT)
Message-ID: <60ccfb91.1c69fb81.167ec.27d4@mx.google.com>
Date:   Fri, 18 Jun 2021 13:01:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210618
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 504 runs, 41 regressions (next-20210618)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 504 runs, 41 regressions (next-20210618)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx8mp-evk            | arm64 | lab-nxp       | clang-12 | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-10 | defconfig       =
             | 1          =

meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 2          =

qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =

rk3328-rock64         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 22         =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210618/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210618
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e71e3a48a7e89fa71fb70bf4602367528864d2ff =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccba7e5a1ab36f7541326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccba7e5a1ab36f75413=
26c
        failing since 113 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbd88673c6f46c1413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbd88673c6f46c1413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbe7d95b7ddd4a74132c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbe7d95b7ddd4a7413=
2c6
        failing since 1 day (last pass: next-20210616, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb89cd23c83e6c44132d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb89cd23c83e6c4413=
2d8
        failing since 1 day (last pass: next-20210616, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb9687c78b89489413288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb9687c78b89489413=
289
        failing since 1 day (last pass: next-20210616, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbb997f78bc5775413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbb997f78bc5775413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbd0116d5ac6cb1413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbd0116d5ac6cb1413=
273
        failing since 1 day (last pass: next-20210616, first fail: next-202=
10617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb53f71b451256541327b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb53f71b4512565413=
27c
        failing since 8 days (last pass: next-20210609, first fail: next-20=
210610) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb70c50717457db413296

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb70c50717457db413=
297
        failing since 49 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb7779cf9b10d91413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb7779cf9b10d91413=
26a
        failing since 235 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | clang-12 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb993412024614d413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb993412024614d413=
274
        new failure (last pass: next-20210610) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbfb7826e7a9ee44132d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbfb7826e7a9ee4413=
2d4
        new failure (last pass: next-20210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ccc26add76b95720413288

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60ccc26add76b957=
2041328b
        new failure (last pass: next-20210617)
        1 lines

    2021-06-18T15:56:12.129144  =

    2021-06-18T15:56:12.134082  / # #
    2021-06-18T15:56:12.253247  / # #
    2021-06-18T15:56:12.360174  export SHELL=3D/bin/sh
    2021-06-18T15:56:12.362117  =

    2021-06-18T15:56:12.363486  / # #
    2021-06-18T15:56:12.467729  / # export SHELL=3D/bin/sh. /lava-462594/en=
vironment
    2021-06-18T15:56:12.572029  /lava-462594/bin/lava-test-runner /lava-462=
594/0
    2021-06-18T15:56:12.577999  =

    2021-06-18T15:56:12.579320  / # . /lava-462594/environment =

    ... (10 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ccc26add76b95=
72041328d
        new failure (last pass: next-20210617)
        2 lines

    2021-06-18T15:56:12.722486  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2021-06-18T15:56:12.724541  kern  :emerg : Code: 54fffd01 aa1b03e0 97f9=
74a2 17ffffe5 (d4210000<8>[   15.859114] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-18T15:56:12.725824  ) =

    2021-06-18T15:56:12.727112  + set +x   =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb796265cb95ebf413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb796265cb95ebf413=
267
        failing since 212 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-broonie   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccbc25787ba3dbcb413342

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccbc25787ba3dbcb413=
343
        failing since 212 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb3e8ca537ee7394132ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb3e8ca537ee739413=
2eb
        failing since 212 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccf983409b8d467641329a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccf983409b8d4676413=
29b
        failing since 212 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3328-rock64         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ccb8386ea1629b35413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ccb8386ea1629b35413=
267
        failing since 3 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3399-gru-kevin      | arm64 | lab-collabora | clang-10 | defconfig+CON...=
_64K_PAGES=3Dy | 22         =


  Details:     https://kernelci.org/test/plan/id/60ccbe41050e540a184132e9

  Results:     65 PASS, 25 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210618/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-debugfs-probed: https://kernelci.org/test/case/=
id/60ccbe41050e540a184132f2
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:15.730113  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-debugfs-attr-console_log: https://kernelci.org/=
test/case/id/60ccbe41050e540a184132f3
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:15.740715  <8>[   20.529344] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-probed RESULT=3Dfail>
    2021-06-18T15:39:16.752271  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-debugfs-attr-pdinfo: https://kernelci.org/test/=
case/id/60ccbe41050e540a184132f4
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:16.769378  <8>[   21.554840] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-console_log RESULT=3Dfail>
    2021-06-18T15:39:17.779499  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:17.791612  <8>[   22.581998] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-debugfs-attr-pdinfo RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-dev-probed: https://kernelci.org/test/case/id/6=
0ccbe41050e540a184132f6
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:17.816842  <8>[   22.605710] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-dev-driver-present RESULT=3Dpass>
    2021-06-18T15:39:18.834454  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-i2c-tunnel-probed: https://kernelci.org/test/ca=
se/id/60ccbe41050e540a184132f8
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:19.884692  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:19.896565  <8>[   24.686708] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-i2c-tunnel-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60ccbe41050e540a184132fa
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:20.938942  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:20.948296  <8>[   25.739033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-pwm-driver-present: https://kernelci.org/test/c=
ase/id/60ccbe41050e540a184132fc
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:21.987529  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-pwm-probed: https://kernelci.org/test/case/id/6=
0ccbe41050e540a184132fd
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:22.000366  <8>[   26.790149] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-pwm-driver-present RESULT=3Dfail>
    2021-06-18T15:39:23.015457  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
0ccbe41050e540a184132ff
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:24.066403  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/60ccbe41050e540a18413300
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:24.079016  <8>[   28.869198] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
    2021-06-18T15:39:25.094270  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensorhub-probed: https://kernelci.org/test/cas=
e/id/60ccbe41050e540a18413305
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:29.251197  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sysfs-probed: https://kernelci.org/test/case/id=
/60ccbe41050e540a18413307
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:29.287647  <8>[   34.076649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-driver-present RESULT=3Dpass>
    2021-06-18T15:39:30.302725  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:30.314421  <8>[   35.105237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-flashinfo: https://kernelci.org/test=
/case/id/60ccbe41050e540a18413308
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:31.328387  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:31.341431  <8>[   36.131202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-flashinfo RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-kb_wake_angle: https://kernelci.org/=
test/case/id/60ccbe41050e540a18413309
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:32.355435  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:32.367491  <8>[   37.157470] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-kb_wake_angle RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sysfs-attr-version: https://kernelci.org/test/c=
ase/id/60ccbe41050e540a1841330a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:33.381287  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:33.393410  <8>[   38.184278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sysfs-attr-version RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-driver-present: https://kernelci.org/t=
est/case/id/60ccbe41050e540a1841330b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:34.408864  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:34.421653  <8>[   39.211633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.hdmi-audio-codec-probed: https://kernelci.org/test/case=
/id/60ccbe41050e540a1841330c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:35.438159  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:35.449785  <8>[   40.240802] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dhdmi-audio-codec-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0ccbe41050e540a1841331e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:36.858963  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:36.870010  <8>[   41.661791] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-typec-phy0-probed: https://kernelci.org/test/c=
ase/id/60ccbe41050e540a1841333e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:38.606144  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:38.618721  <8>[   43.409258] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-typec-phy0-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-typec-phy1-probed: https://kernelci.org/test/c=
ase/id/60ccbe41050e540a1841333f
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10617)

    2021-06-18T15:39:39.634351  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ccbe41050e540a18413341
        failing since 11 days (last pass: next-20210603, first fail: next-2=
0210607)

    2021-06-18T15:39:39.670283  <8>[   44.460177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-06-18T15:39:40.686475  /lava-4052754/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ccbe41050e540a18413342
        failing since 11 days (last pass: next-20210603, first fail: next-2=
0210607)

    2021-06-18T15:39:40.699456  <8>[   45.489308] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-06-18T15:39:41.256242  <6>[   46.051813] pp3300_disp: disabling
    2021-06-18T15:39:41.261159  <6>[   46.056013] ppvar_sd_card_io: disabli=
ng
    2021-06-18T15:39:41.265634  <6>[   46.060970] pp3000_sd_slot: disabling
    2021-06-18T15:39:41.714142  /lava-4052754/1/../bin/lava-test-case
    2021-06-18T15:39:41.726059  <8>[   46.517094] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =

 =20
