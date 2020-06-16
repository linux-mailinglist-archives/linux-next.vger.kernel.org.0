Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A51C1FB038
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 14:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgFPMTe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 08:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPMTe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2020 08:19:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A95C08C5C2
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 05:19:33 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id l63so6901644pge.12
        for <linux-next@vger.kernel.org>; Tue, 16 Jun 2020 05:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gipXAHLYBVLXA8o2sN47EGd9uj4c1bTjFd17NdRTlVM=;
        b=ctaiBnEe+9N0a90sU1xS/pMYFbBZ1ZSuMGHpXoD4WND/sDCch70sOJ4N0MQequDoCs
         ViZxwxUr3si2BAUpGM9trZ8O3a4h9xIbaBYCtXpSifVkGwhCnQ2Sj+lGkdtsnze5vrZK
         EIqIXkpByBgoqfILUqJMDUAfuBc4sgw2lmItPmRhtkLqDKmpqnDeUUbQgF+ByPWj+1YR
         E0BL5/VFIUIuzsRxkVIoOsjIxbx5S4sy5b/dxS/mNCSV2OpR8S/4sO4A/OxD65sKp6Yb
         IvBRI5poud2W8wfaWx1wGzOKgPcH5LgJi5RjHmb8O4GOjJNJFT4FppPv2B+PtASqelmx
         +wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gipXAHLYBVLXA8o2sN47EGd9uj4c1bTjFd17NdRTlVM=;
        b=CwrY6W0qPu1X7kYRK2nKelYUZRnPXFUi2nxJeRu37IQ1HNyjhKeNYGdBhrDoYjMjrN
         gLE6DloYhGs/39fCovjlpLOV6zBqMt09qsHbeSvHFWlCqJL9WcOEwM/u8/IcFPOogxCP
         iACX+RDukDmrO7ICLbaOHmS243LtYrRIi5ylyF/iil0SeTZhghQiAer7wfWfiwZuIKtS
         eofYsggyPaTq52bN/7+WBSfOTMrXQN5TPWvwJJ1maqq1FjQshlbZNOx4tJIvT0Rw7lo4
         PrqHG0KACAMWUg8mYc2XljHXMBuZNxbWA2Wa0VrNHckSTfTkuLLouka0g3tkxxFYhdlr
         9rqA==
X-Gm-Message-State: AOAM531JYz5CGgyFmy55H2Uv8f4Jm4qi0jAfOl5lAI1o+L7q2I7x4g1b
        sIlV9HnoFj/Sn1wFbaggrYAHPcySl/s=
X-Google-Smtp-Source: ABdhPJxwhV28xaKASxELaS26utdV1FYgvQfVYc08AOkeVQDXWAQUibfgxii1Ti1CcipaEFrGQv/dWA==
X-Received: by 2002:a63:b146:: with SMTP id g6mr1864521pgp.396.1592309972071;
        Tue, 16 Jun 2020 05:19:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u20sm18177690pfk.91.2020.06.16.05.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:19:31 -0700 (PDT)
Message-ID: <5ee8b8d3.1c69fb81.4fec7.a2e0@mx.google.com>
Date:   Tue, 16 Jun 2020 05:19:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200616
Subject: next/master baseline: 158 runs, 10 regressions (next-20200616)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 158 runs, 10 regressions (next-20200616)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-8    | sama5_d=
efconfig              | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 4/5    =

da850-lcdk                   | arm   | lab-baylibre    | gcc-8    | davinci=
_all_defconfig        | 3/5    =

imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 4/5    =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 0/1    =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 0/1    =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 0/1    =

vexpress-v2p-ca15-tc1        | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 3/5    =

vexpress-v2p-ca15-tc1        | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 3/5    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200616/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200616
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      27f70ec4fa0e0f419031f1b8d61b1a788244e313 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-8    | sama5_d=
efconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee882deab4ed9f08c97bf30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee882deab4ed9f08c97b=
f31
      failing since 48 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee880c10e8d4cd38797bf4f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee880c10e8d4cd3=
8797bf52
      new failure (last pass: next-20200615)
      2 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
da850-lcdk                   | arm   | lab-baylibre    | gcc-8    | davinci=
_all_defconfig        | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee87f7111f3f8160797bf09

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee87f7111f3f81=
60797bf0e
      new failure (last pass: next-20200614)
      33 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee87cc04694c9d30f97bf09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v4_v5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee87cc04694c9d30f97b=
f0a
      new failure (last pass: next-20200615) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5ee880016b25c4484b97bf42

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ee880016b25c44=
84b97bf47
      failing since 1 day (last pass: next-20200614, first fail: next-20200=
615)
      2 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee8816d360ac4d9ee97bf1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee8816d360ac4d9ee97b=
f1f
      new failure (last pass: next-20200615) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee887b86a56f251fd97bf15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee887b86a56f251fd97b=
f16
      new failure (last pass: next-20200615) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5ee87a9001c2f6017a97bf30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5ee87a9001c2f6017a97b=
f31
      new failure (last pass: next-20200615) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee87b8e6982b1822e97bf2e

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee87b8e6982b182=
2e97bf31
      failing since 10 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
vexpress-v2p-ca15-tc1        | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5ee87bf15e63c51e7c97bf1a

  Results:     3 PASS, 1 FAIL, 1 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-vexpress-v2p-ca15-tc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5ee87bf15e63c51e=
7c97bf1d
      failing since 10 days (last pass: next-20200604, first fail: next-202=
00605)
      2 lines =20
